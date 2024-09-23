@implementation FBKFilePredicateCondition

+ (id)entityName
{
  return CFSTR("FilePredicateCondition");
}

- (void)setPropertiesFromJSONObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("question_tat"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKFilePredicateCondition setQuestionTat:](self, "setQuestionTat:", v6);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("question_value"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  FBKNilIfNSNull(v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKFilePredicateCondition setQuestionValue:](self, "setQuestionValue:", v7);

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[FBKFilePredicateCondition questionTat](self, "questionTat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKFilePredicateCondition questionValue](self, "questionValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ = %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
