@implementation _CNAutocompletePeopleSuggesterPredictionSearchStrategy

- (_CNAutocompletePeopleSuggesterPredictionSearchStrategy)initWithContactStore:(id)a3
{
  id v5;
  _CNAutocompletePeopleSuggesterPredictionSearchStrategy *v6;
  _CNAutocompletePeopleSuggesterPredictionSearchStrategy *v7;
  _CNAutocompletePeopleSuggesterPredictionSearchStrategy *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNAutocompletePeopleSuggesterPredictionSearchStrategy;
  v6 = -[_CNAutocompletePeopleSuggesterPredictionSearchStrategy init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contactStore, a3);
    v8 = v7;
  }

  return v7;
}

- (NSString)descriptionForLogging
{
  return (NSString *)CFSTR("PeopleSuggester");
}

- (id)searchResultsForFetchRequest:(id)a3
{
  id v4;
  _CNAutocompletePeopleSuggesterPredictionSearchStrategyTask *v5;
  void *v6;

  v4 = a3;
  v5 = -[_CNAutocompletePeopleSuggesterPredictionSearchStrategyTask initWithRequest:contactStore:]([_CNAutocompletePeopleSuggesterPredictionSearchStrategyTask alloc], "initWithRequest:contactStore:", v4, self->_contactStore);

  -[_CNAutocompletePeopleSuggesterPredictionSearchStrategyTask run:](v5, "run:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end
