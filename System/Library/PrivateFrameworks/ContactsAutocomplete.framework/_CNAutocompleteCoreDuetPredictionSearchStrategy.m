@implementation _CNAutocompleteCoreDuetPredictionSearchStrategy

- (_CNAutocompleteCoreDuetPredictionSearchStrategy)initWithContactStore:(id)a3
{
  id v5;
  _CNAutocompleteCoreDuetPredictionSearchStrategy *v6;
  _CNAutocompleteCoreDuetPredictionSearchStrategy *v7;
  _CNAutocompleteCoreDuetPredictionSearchStrategy *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNAutocompleteCoreDuetPredictionSearchStrategy;
  v6 = -[_CNAutocompleteCoreDuetPredictionSearchStrategy init](&v10, sel_init);
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
  return (NSString *)CFSTR("CoreDuet");
}

- (id)searchResultsForFetchRequest:(id)a3
{
  id v4;
  _CNAutocompleteCoreDuetPredictionSearchStrategyTask *v5;
  void *v6;

  v4 = a3;
  v5 = -[_CNAutocompleteCoreDuetPredictionSearchStrategyTask initWithRequest:contactStore:]([_CNAutocompleteCoreDuetPredictionSearchStrategyTask alloc], "initWithRequest:contactStore:", v4, self->_contactStore);

  -[_CNAutocompleteCoreDuetPredictionSearchStrategyTask run:](v5, "run:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end
