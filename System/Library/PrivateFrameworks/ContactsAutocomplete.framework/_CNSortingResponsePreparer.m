@implementation _CNSortingResponsePreparer

- (id)prepareResults:(id)a3 forFetch:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  NSObject *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[CNAutocompleteQueryResponsePreparer delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "autocompleteFetch:willSortResults:", v7, v6);

  -[CNAutocompleteQueryResponsePreparer delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resultComparatorForAutocompleteFetch:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  CNALoggingContextDebug();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B9950000, v11, OS_LOG_TYPE_DEFAULT, "Using sorting algoritm provided by client", buf, 2u);
    }

    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __54___CNSortingResponsePreparer_prepareResults_forFetch___block_invoke;
    v22[3] = &unk_1E70DFE38;
    v23 = v10;
    objc_msgSend(v6, "sortedArrayUsingComparator:", v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B9950000, v11, OS_LOG_TYPE_DEFAULT, "Using standard sorting algorithms", buf, 2u);
    }

    objc_msgSend(v6, "sortedArrayUsingSelector:", sel_compare_);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  CNALoggingContextDebug();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = objc_msgSend(v13, "count");
    if (v15 < 0x1F5)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v15, v21);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("first %lu of %lu"), 500, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_cn_take:", 500);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543619;
    v25 = v16;
    v26 = 2113;
    v27 = v17;
    _os_log_impl(&dword_1B9950000, v14, OS_LOG_TYPE_DEFAULT, "Sorted results: (%{public}@): %{private}@", buf, 0x16u);

  }
  -[_CNAutocompleteResponsePreparerDecorator preparer](self, "preparer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "prepareResults:forFetch:", v13, v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

@end
