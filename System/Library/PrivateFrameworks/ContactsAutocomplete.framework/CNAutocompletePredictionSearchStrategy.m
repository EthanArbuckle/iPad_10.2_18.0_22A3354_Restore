@implementation CNAutocompletePredictionSearchStrategy

+ (id)peopleSuggesterStrategyWithContactStore:(id)a3
{
  id v3;
  _CNAutocompletePeopleSuggesterPredictionSearchStrategy *v4;

  v3 = a3;
  v4 = -[_CNAutocompletePeopleSuggesterPredictionSearchStrategy initWithContactStore:]([_CNAutocompletePeopleSuggesterPredictionSearchStrategy alloc], "initWithContactStore:", v3);

  return v4;
}

+ (id)coreDuetStrategyWithContactStore:(id)a3
{
  id v3;
  _CNAutocompleteCoreDuetPredictionSearchStrategy *v4;

  v3 = a3;
  v4 = -[_CNAutocompleteCoreDuetPredictionSearchStrategy initWithContactStore:]([_CNAutocompleteCoreDuetPredictionSearchStrategy alloc], "initWithContactStore:", v3);

  return v4;
}

@end
