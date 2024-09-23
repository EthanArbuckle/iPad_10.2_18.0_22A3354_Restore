@implementation EMSearchableIndexInstantAnswersQueryResult

- (EMSearchableIndexInstantAnswersQueryResult)initWithInstantAnswersSuggestions:(id)a3
{
  id v4;
  EMSearchableIndexInstantAnswersQueryResult *v5;
  uint64_t v6;
  NSArray *instantAnswersSuggestions;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMSearchableIndexInstantAnswersQueryResult;
  v5 = -[EMSearchableIndexInstantAnswersQueryResult init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    instantAnswersSuggestions = v5->_instantAnswersSuggestions;
    v5->_instantAnswersSuggestions = (NSArray *)v6;

  }
  return v5;
}

- (NSArray)instantAnswersSuggestions
{
  return self->_instantAnswersSuggestions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instantAnswersSuggestions, 0);
}

@end
