@implementation _CNAutocompleteResponsePreparerDecorator

- (_CNAutocompleteResponsePreparerDecorator)initWithResponsePreparer:(id)a3 delegate:(id)a4
{
  id v7;
  _CNAutocompleteResponsePreparerDecorator *v8;
  _CNAutocompleteResponsePreparerDecorator *v9;
  _CNAutocompleteResponsePreparerDecorator *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_CNAutocompleteResponsePreparerDecorator;
  v8 = -[CNAutocompleteQueryResponsePreparer initWithDelegate:](&v12, sel_initWithDelegate_, a4);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_preparer, a3);
    v10 = v9;
  }

  return v9;
}

- (id)prepareResults:(id)a3 forFetch:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[_CNAutocompleteResponsePreparerDecorator preparer](self, "preparer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "prepareResults:forFetch:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setPriorityResultsFuture:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_CNAutocompleteResponsePreparerDecorator preparer](self, "preparer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPriorityResultsFuture:", v4);

}

- (void)setMatchingPriorityResultsPromise:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_CNAutocompleteResponsePreparerDecorator preparer](self, "preparer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMatchingPriorityResultsPromise:", v4);

}

- (CNAutocompleteQueryResponsePreparer)preparer
{
  return (CNAutocompleteQueryResponsePreparer *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preparer, 0);
}

@end
