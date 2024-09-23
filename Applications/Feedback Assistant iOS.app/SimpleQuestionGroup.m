@implementation SimpleQuestionGroup

- (SimpleQuestionGroup)initWithQuestionGroup:(id)a3 questionAnswerPairs:(id)a4
{
  id v6;
  id v7;
  SimpleQuestionGroup *v8;
  SimpleQuestionGroup *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SimpleQuestionGroup;
  v8 = -[SimpleQuestionGroup init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[SimpleQuestionGroup setQuestionGroup:](v8, "setQuestionGroup:", v6);
    -[SimpleQuestionGroup setQuesionAnswerPairs:](v9, "setQuesionAnswerPairs:", v7);
  }

  return v9;
}

- (id)allAnswers
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = objc_alloc((Class)NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleQuestionGroup quesionAnswerPairs](self, "quesionAnswerPairs"));
  v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleQuestionGroup quesionAnswerPairs](self, "quesionAnswerPairs", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10), "objectForKeyedSubscript:", CFSTR("a")));
        objc_msgSend(v5, "addObject:", v11);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)allQuestions
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = objc_alloc((Class)NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleQuestionGroup quesionAnswerPairs](self, "quesionAnswerPairs"));
  v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleQuestionGroup quesionAnswerPairs](self, "quesionAnswerPairs", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10), "objectForKeyedSubscript:", CFSTR("q")));
        objc_msgSend(v5, "addObject:", v11);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)questionInRow:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleQuestionGroup quesionAnswerPairs](self, "quesionAnswerPairs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("q")));

  return v6;
}

- (id)answerInRow:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleQuestionGroup quesionAnswerPairs](self, "quesionAnswerPairs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("a")));

  return v6;
}

- (int64_t)questionCount
{
  return -[NSArray count](self->_quesionAnswerPairs, "count");
}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleQuestionGroup questionGroup](self, "questionGroup"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleQuestionGroup quesionAnswerPairs](self, "quesionAnswerPairs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("-------------------------\r(%@)\r%@\r%@"), v3, v4, v5));

  return v6;
}

- (FBKQuestionGroup)questionGroup
{
  return self->_questionGroup;
}

- (void)setQuestionGroup:(id)a3
{
  objc_storeStrong((id *)&self->_questionGroup, a3);
}

- (FBKFormResponse)formResponse
{
  return self->_formResponse;
}

- (void)setFormResponse:(id)a3
{
  objc_storeStrong((id *)&self->_formResponse, a3);
}

- (NSArray)quesionAnswerPairs
{
  return self->_quesionAnswerPairs;
}

- (void)setQuesionAnswerPairs:(id)a3
{
  objc_storeStrong((id *)&self->_quesionAnswerPairs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quesionAnswerPairs, 0);
  objc_storeStrong((id *)&self->_formResponse, 0);
  objc_storeStrong((id *)&self->_questionGroup, 0);
}

@end
