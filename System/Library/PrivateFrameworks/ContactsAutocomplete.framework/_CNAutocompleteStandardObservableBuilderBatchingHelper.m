@implementation _CNAutocompleteStandardObservableBuilderBatchingHelper

- (_CNAutocompleteStandardObservableBuilderBatchingHelper)init
{
  _CNAutocompleteStandardObservableBuilderBatchingHelper *v2;
  _CNAutocompleteObservableBuilderBatchingHelper *v3;
  _CNAutocompleteObservableBuilderBatchingHelper *helper;
  _CNAutocompleteStandardObservableBuilderBatchingHelper *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_CNAutocompleteStandardObservableBuilderBatchingHelper;
  v2 = -[_CNAutocompleteStandardObservableBuilderBatchingHelper init](&v7, sel_init);
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

  -[_CNAutocompleteStandardObservableBuilderBatchingHelper helper](self, "helper");
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
  -[_CNAutocompleteStandardObservableBuilderBatchingHelper helper](self, "helper");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObservable:toBatchAtIndex:", v4, 0);

}

- (void)addCoreRecentsObservable:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_CNAutocompleteStandardObservableBuilderBatchingHelper helper](self, "helper");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObservable:toBatchAtIndex:", v4, 0);

}

- (void)addStewieObservable:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_CNAutocompleteStandardObservableBuilderBatchingHelper helper](self, "helper");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObservable:toBatchAtIndex:", v4, 0);

}

- (void)addSuggestionsObservable:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_CNAutocompleteStandardObservableBuilderBatchingHelper helper](self, "helper");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObservable:toBatchAtIndex:", v4, 1);

}

- (void)addLocalExtensionObservable:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_CNAutocompleteStandardObservableBuilderBatchingHelper helper](self, "helper");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObservable:toBatchAtIndex:", v4, 0);

}

- (void)addPredictionObservable:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_CNAutocompleteStandardObservableBuilderBatchingHelper helper](self, "helper");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObservable:toBatchAtIndex:", v4, 0);

}

- (void)addSupplementalObservable:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_CNAutocompleteStandardObservableBuilderBatchingHelper helper](self, "helper");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObservable:toBatchAtIndex:", v4, 0);

}

- (void)addCachedDirectoryServerObservable:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_CNAutocompleteStandardObservableBuilderBatchingHelper helper](self, "helper");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObservable:toBatchAtIndex:", v4, 0);

}

- (void)addDirectoryServerObservable:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_CNAutocompleteStandardObservableBuilderBatchingHelper helper](self, "helper");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObservable:toBatchAtIndex:", v4, 1);

}

- (void)addCachedCalendarServerObservable:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  CNALoggingContextDebug();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B9950000, v3, OS_LOG_TYPE_DEFAULT, "Not adding a cached calendar observable; use the calendar search type",
      v4,
      2u);
  }

}

- (void)addCalendarServerObservable:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  CNALoggingContextDebug();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B9950000, v3, OS_LOG_TYPE_DEFAULT, "Not adding a calendar observable; use the calendar search type",
      v4,
      2u);
  }

}

- (BOOL)batchAtIndexIncludesServer:(unint64_t)a3
{
  return a3 == 1;
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
