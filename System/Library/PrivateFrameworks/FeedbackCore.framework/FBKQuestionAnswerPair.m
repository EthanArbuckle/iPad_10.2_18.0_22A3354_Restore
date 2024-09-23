@implementation FBKQuestionAnswerPair

- (FBKQuestionAnswerPair)initWithQuestionText:(id)a3 andAnswerText:(id)a4
{
  id v7;
  id v8;
  FBKQuestionAnswerPair *v9;
  FBKQuestionAnswerPair *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FBKQuestionAnswerPair;
  v9 = -[FBKQuestionAnswerPair init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_questionText, a3);
    objc_storeStrong((id *)&v10->_answerText, a4);
  }

  return v10;
}

- (FBKQuestionAnswerPair)initWithJSONObject:(id)a3
{
  id v4;
  FBKQuestionAnswerPair *v5;
  FBKQuestionAnswerPair *v6;
  FBKQuestionAnswerPair *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FBKQuestionAnswerPair;
  v5 = -[FBKQuestionAnswerPair init](&v9, sel_init);
  v6 = v5;
  if (v5 && !-[FBKQuestionAnswerPair setPropertiesFromJSONObject:](v5, "setPropertiesFromJSONObject:", v4))
    v7 = 0;
  else
    v7 = v6;

  return v7;
}

- (BOOL)setPropertiesFromJSONObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v14;
  id v15;
  id v16;
  id v17;

  v4 = a3;
  v17 = 0;
  FBKQuestionAnswerPairAssignObjectForKey(v4, (uint64_t)CFSTR("question_text"), &v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v17;

  if (v5)
  {
    -[FBKQuestionAnswerPair setQuestionText:](self, "setQuestionText:", v6);
    v16 = 0;
    FBKQuestionAnswerPairAssignObjectForKey(v4, (uint64_t)CFSTR("answer_text"), &v16);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v16;

    if (v7)
      -[FBKQuestionAnswerPair setAnswerText:](self, "setAnswerText:", v8);
    v15 = 0;
    FBKQuestionAnswerPairAssignObjectForKey(v4, (uint64_t)CFSTR("required"), &v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v15;

    if (v9)
      -[FBKQuestionAnswerPair setIsRequired:](self, "setIsRequired:", objc_msgSend(v10, "BOOLValue"));
    v14 = 0;
    FBKQuestionAnswerPairAssignObjectForKey(v4, (uint64_t)CFSTR("answer_widget"), &v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v14;

    if (v11)
      -[FBKQuestionAnswerPair setAnswerType:](self, "setAnswerType:", +[FBKAnswer answerTypeFromString:](FBKAnswer, "answerTypeFromString:", v12));
  }
  else
  {
    v8 = 0;
    v10 = 0;
    v12 = 0;
  }

  return v5 != 0;
}

- (NSString)answerText
{
  unint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSString *v13;

  v3 = -[FBKQuestionAnswerPair answerType](self, "answerType");
  if (v3 == 8)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDD15D0]);
    objc_msgSend(v4, "setFormatOptions:", 275);
    objc_msgSend(v4, "dateFromString:", self->_answerText);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_opt_new();
    objc_msgSend(v4, "timeZone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTimeZone:", v9);

    objc_msgSend(v7, "setDateStyle:", 2);
    v10 = v7;
    v11 = 0;
  }
  else
  {
    if (v3 == 10)
    {
      v4 = objc_alloc_init(MEMORY[0x24BDD15D0]);
      objc_msgSend(v4, "setFormatOptions:", 544);
      objc_msgSend(v4, "dateFromString:", self->_answerText);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_opt_new();
      objc_msgSend(v4, "timeZone");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setTimeZone:", v12);

      v6 = v7;
      v8 = 0;
    }
    else
    {
      if (v3 != 9)
      {
        v13 = self->_answerText;
        return v13;
      }
      v4 = objc_alloc_init(MEMORY[0x24BDD15D0]);
      objc_msgSend(v4, "dateFromString:", self->_answerText);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_opt_new();
      v7 = v6;
      v8 = 2;
    }
    objc_msgSend(v6, "setDateStyle:", v8);
    v10 = v7;
    v11 = 1;
  }
  objc_msgSend(v10, "setTimeStyle:", v11);
  objc_msgSend(v7, "stringFromDate:", v5);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *questionText;
  id v5;

  questionText = self->_questionText;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", questionText, CFSTR("question_text"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_answerText, CFSTR("answer_text"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isRequired, CFSTR("required"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_answerType, CFSTR("answer_widget"));

}

- (FBKQuestionAnswerPair)initWithCoder:(id)a3
{
  id v4;
  FBKQuestionAnswerPair *v5;
  uint64_t v6;
  NSString *questionText;
  uint64_t v8;
  NSString *answerText;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FBKQuestionAnswerPair;
  v5 = -[FBKQuestionAnswerPair init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("question_text"));
    v6 = objc_claimAutoreleasedReturnValue();
    questionText = v5->_questionText;
    v5->_questionText = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("answer_text"));
    v8 = objc_claimAutoreleasedReturnValue();
    answerText = v5->_answerText;
    v5->_answerText = (NSString *)v8;

    v5->_isRequired = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("required"));
    v5->_answerType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("answer_widget"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  BOOL v11;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    -[FBKQuestionAnswerPair questionText](self, "questionText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "questionText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      -[FBKQuestionAnswerPair answerText](self, "answerText");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "answerText");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToString:", v9))
      {
        v10 = -[FBKQuestionAnswerPair answerType](self, "answerType");
        v11 = v10 == objc_msgSend(v5, "answerType");
      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSString)questionText
{
  return self->_questionText;
}

- (void)setQuestionText:(id)a3
{
  objc_storeStrong((id *)&self->_questionText, a3);
}

- (void)setAnswerText:(id)a3
{
  objc_storeStrong((id *)&self->_answerText, a3);
}

- (BOOL)isRequired
{
  return self->_isRequired;
}

- (void)setIsRequired:(BOOL)a3
{
  self->_isRequired = a3;
}

- (unint64_t)answerType
{
  return self->_answerType;
}

- (void)setAnswerType:(unint64_t)a3
{
  self->_answerType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_answerText, 0);
  objc_storeStrong((id *)&self->_questionText, 0);
}

@end
