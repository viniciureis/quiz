import 'package:flutter/material.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jogar'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => QuizPage(),
              ),
            );
          },
          child: Text('Iniciar Quiz'),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _questionIndex = 0;
  int _score = 0; // Adicione um contador de pontos

  List<Map<String, dynamic>> _questions = [
    {
      'questionText': 'Quem construiu a arca conforme as instruções de Deus?',
      'answers': ['Noé', 'Abraão', 'Moisés', 'Davi'],
      'correctAnswer': 'Noé',
    },

    {
      'questionText': 'Qual foi o nome do primeiro homem criado por Deus?',
      'answers': ['Caim', 'Sete', 'Adão', 'Davi', 'Abel'],
      'correctAnswer': 'Adão',
    },

    {
      'questionText': 'Quem foi jogado na cova dos leões e saiu ileso?',
      'answers': ['Moisés', 'Sansão', 'Jonas', 'Daniel', ' Jeremias'],
      'correctAnswer': 'Daniel',
    },

     {
      'questionText': 'Qual foi a esposa de Abraão?',
      'answers': [' Sara', 'Raquel', 'Lia', 'Ester', ' Mical'],
      'correctAnswer': 'Sara',
    },

 {
      'questionText': 'Quem matou Golias com uma funda e uma pedra?',
      'answers': [' josue', 'Davi', 'Moisés', 'Salomão', ' Gideão'],
      'correctAnswer': 'davi',
    },

    {
      'questionText': 'Quem foi vendido como escravo pelos seus irmãos?',
      'answers': [' Esaú', 'José', 'Jacó', 'Isaque', ' Gideão'],
      'correctAnswer': 'josé',
    },

    {
      'questionText': 'Quem foi o primeiro rei de Israel?',
      'answers': ['  Davi', 'Salomão', ' Saul', 'Josué', ' Samuel'],
      'correctAnswer': 'Saul',
    },

     {
      'questionText': 'Quem foi lançado na fornalha ardente, mas não foi queimado?',
      'answers': ['  Elias', 'Eliseu', ' Isaías', 'Daniel', ' Jeremias'],
      'correctAnswer': 'Daniel',
    },

      {
      'questionText': 'Qual apóstolo traiu Jesus por 30 moedas de prata?',
      'answers': ['  Pedro', 'Tiago', ' João', 'Daniel', ' Judas'],
      'correctAnswer': 'Judas',
    },

    {
      'questionText': 'Qual dos discípulos negou Jesus três vezes antes que o galo cantasse?',
      'answers': ['  Pedro', 'Tiago', ' João', ' André', ' Tomé'],
      'correctAnswer': 'pedro',
    },

      {
      'questionText': 'Quem escreveu a maior parte do Novo Testamento da Bíblia?',
      'answers': ['  Pedro', 'Moisés', ' João', ' Paulo', ' saulo'],
      'correctAnswer': 'Paulo',
    },
      {
      'questionText': 'Qual era o nome da esposa de Jó?',
      'answers': ['  Maria', 'Raquel', ' Sara', ' Rute', ' Jemimah'],
      'correctAnswer': 'Jemimah',
    },
    // Adicione mais perguntas e respostas aqui
  ];

  void _answerQuestion(String selectedAnswer) {
    if (_questions[_questionIndex]['correctAnswer'] == selectedAnswer) {
      // Se a resposta for correta, aumente o contador de pontos
      _score++;
    }

    if (_questionIndex < _questions.length - 1) {
      setState(() {
        _questionIndex++;
      });
    } else {
      // Você pode adicionar aqui o que deseja fazer quando o quiz for concluído.
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Quiz Concluído!'),
            content: Text('Você acertou $_score de ${_questions.length} perguntas.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Bíblico'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Centralize o conteúdo verticalmente
        children: <Widget>[
          Center(
            child: Text(_questions[_questionIndex]['questionText']),
          ),
          ...( _questions[_questionIndex]['answers'] as List<String>).map((answer) {
            return ElevatedButton(
              onPressed: () => _answerQuestion(answer),
              child: Text(answer),
            );
          }).toList(),
        ],
      ),
    );
  }
}
