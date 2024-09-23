@implementation _CNAutocompleteCalendarObservableBuilderBatchingHelper

- (_CNAutocompleteCalendarObservableBuilderBatchingHelper)init
{
  _CNAutocompleteCalendarObservableBuilderBatchingHelper *v2;
  _CNAutocompleteObservableBuilderBatchingHelper *v3;
  _CNAutocompleteObservableBuilderBatchingHelper *helper;
  _CNAutocompleteCalendarObservableBuilderBatchingHelper *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_CNAutocompleteCalendarObservableBuilderBatchingHelper;
  v2 = -[_CNAutocompleteCalendarObservableBuilderBatchingHelper init](&v7, sel_init);
  if (v2)
  {
    v3 = -[_CNAutocompleteObservableBuilderBatchingHelper initWithBatchCount:]([_CNAutocompleteObservableBuilderBatchingHelper alloc], "initWithBatchCount:", 3);
    helper = v2->_helper;
    v2->_helper = v3;

    v5 = v2;
  }

  return v2;
}

- (id)batchedObservables
{
  void *v2;
  void *v3;

  -[_CNAutocompleteCalendarObservableBuilderBatchingHelper helper](self, "helper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "batchedObservables");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)addContactsObservable:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_CNAutocompleteCalendarObservableBuilderBatchingHelper helper](self, "helper");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObservable:toBatchAtIndex:", v4, 1);

}

- (void)addCoreRecentsObservable:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_CNAutocompleteCalendarObservableBuilderBatchingHelper helper](self, "helper");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObservable:toBatchAtIndex:", v4, 0);

}

- (void)addStewieObservable:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_CNAutocompleteCalendarObservableBuilderBatchingHelper helper](self, "helper");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObservable:toBatchAtIndex:", v4, 0);

}

- (void)addSuggestionsObservable:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_CNAutocompleteCalendarObservableBuilderBatchingHelper helper](self, "helper");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObservable:toBatchAtIndex:", v4, 1);

}

- (void)addLocalExtensionObservable:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_CNAutocompleteCalendarObservableBuilderBatchingHelper helper](self, "helper");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObservable:toBatchAtIndex:", v4, 0);

}

- (void)addPredictionObservable:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_CNAutocompleteCalendarObservableBuilderBatchingHelper helper](self, "helper");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObservable:toBatchAtIndex:", v4, 0);

}

- (void)addSupplementalObservable:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_CNAutocompleteCalendarObservableBuilderBatchingHelper helper](self, "helper");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObservable:toBatchAtIndex:", v4, 1);

}

- (void)addCachedDirectoryServerObservable:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_CNAutocompleteCalendarObservableBuilderBatchingHelper helper](self, "helper");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObservable:toBatchAtIndex:", v4, 0);

}

- (void)addDirectoryServerObservable:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_CNAutocompleteCalendarObservableBuilderBatchingHelper helper](self, "helper");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObservable:toBatchAtIndex:", v4, 1);

}

- (void)addCachedCalendarServerObservable:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_CNAutocompleteCalendarObservableBuilderBatchingHelper helper](self, "helper");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObservable:toBatchAtIndex:", v4, 0);

}

- (void)addCalendarServerObservable:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_CNAutocompleteCalendarObservableBuilderBatchingHelper helper](self, "helper");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObservable:toBatchAtIndex:", v4, 1);

}

- (BOOL)batchAtIndexIncludesServer:(unint64_t)a3
{
  return 1;
}

- (_CNAutocompleteObservableBuilderBatchingHelper)helper
{
  return self->_helper;
}

- (void)setHelper:(id)a3
{
  objc_storeStrong((id *)&self->_helper, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_helper, 0);
}

@end
