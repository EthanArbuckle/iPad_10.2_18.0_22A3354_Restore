@implementation CNAutocompleteLocalSearch

- (CNAutocompleteLocalSearch)init
{
  id v3;
  id v4;
  void *v5;
  CNAutocompleteLocalSearch *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C97298]);
  v4 = objc_alloc_init(MEMORY[0x1E0C972A0]);
  objc_msgSend(v4, "setIncludeLocalContacts:", 1);
  objc_msgSend(v4, "setIncludeSuggestedContacts:", 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97298]), "initWithConfiguration:", v4);
  v6 = -[CNAutocompleteLocalSearch initWithContactStore:contactFetcherStore:](self, "initWithContactStore:contactFetcherStore:", v3, v5);

  return v6;
}

- (CNAutocompleteLocalSearch)initWithContactStore:(id)a3 contactFetcherStore:(id)a4
{
  id v7;
  id v8;
  CNAutocompleteLocalSearch *v9;
  CNAutocompleteLocalSearch *v10;
  CNAutocompleteLocalSearch *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNAutocompleteLocalSearch;
  v9 = -[CNAutocompleteLocalSearch init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contactStore, a3);
    objc_storeStrong((id *)&v10->_contactFetcherStore, a4);
    v11 = v10;
  }

  return v10;
}

- (id)executeRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  CNAutocompleteLocalSearch *v17;
  id v18;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "schedulerProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "backgroundScheduler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __62__CNAutocompleteLocalSearch_executeRequest_completionHandler___block_invoke;
  v15[3] = &unk_1E70DF530;
  v16 = v6;
  v17 = self;
  v18 = v7;
  v11 = v7;
  v12 = v6;
  objc_msgSend(v10, "performCancelableBlock:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __62__CNAutocompleteLocalSearch_executeRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  double v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  double v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  CNALoggingContextDebug();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 134217984;
    v25 = v5;
    _os_log_impl(&dword_1B9950000, v4, OS_LOG_TYPE_DEFAULT, "Executing request %p against local contacts", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isCanceled") & 1) == 0)
  {
    v9 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(a1 + 40);
    objc_msgSend(v8, "contactStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "contactFetcherStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "groupsForRequest:contactStore:contactFetcherStore:", v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v12);

    if ((objc_msgSend(v3, "isCanceled") & 1) == 0)
    {
      v14 = *(_QWORD *)(a1 + 32);
      v13 = *(void **)(a1 + 40);
      objc_msgSend(v13, "contactStore");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "contactFetcherStore");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "peopleForRequest:contactStore:contactFetcherStore:", v14, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObjectsFromArray:", v17);

      CNALoggingContextPerformance();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "timeIntervalSinceNow");
        *(_DWORD *)buf = 138412546;
        v25 = v19;
        v26 = 2048;
        v27 = v20 * -1000.0;
        _os_log_impl(&dword_1B9950000, v18, OS_LOG_TYPE_INFO, "Time to fetch %@ local contacts and groups: %.3fms", buf, 0x16u);

      }
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __62__CNAutocompleteLocalSearch_executeRequest_completionHandler___block_invoke_6;
      v21[3] = &unk_1E70DF5A0;
      v23 = *(id *)(a1 + 48);
      v22 = v6;
      objc_msgSend(v3, "performBlock:", v21);

    }
  }

}

uint64_t __62__CNAutocompleteLocalSearch_executeRequest_completionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (id)peopleForRequest:(id)a3 contactStore:(id)a4 contactFetcherStore:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[CNAutocompleteLocalQuery peopleQuery](CNAutocompleteLocalQuery, "peopleQuery");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRequest:", v9);

  objc_msgSend(v10, "setContactStore:", v8);
  objc_msgSend(v10, "setContactFetcherStore:", v7);

  objc_msgSend(v10, "run");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)groupsForRequest:(id)a3 contactStore:(id)a4 contactFetcherStore:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend((id)objc_opt_class(), "shouldIncludeGroupResultsForRequest:", v7))
  {
    +[CNAutocompleteLocalQuery groupsQuery](CNAutocompleteLocalQuery, "groupsQuery");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRequest:", v7);
    objc_msgSend(v10, "setContactStore:", v8);
    objc_msgSend(v10, "setContactFetcherStore:", v9);
    objc_msgSend(v10, "run");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v11;
}

+ (BOOL)shouldIncludeGroupResultsForRequest:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (objc_msgSend(v3, "searchType") == 1 || objc_msgSend(v3, "searchType") == 2)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "shouldIncludeGroupResults");

  return v4;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (CNContactStore)contactFetcherStore
{
  return self->_contactFetcherStore;
}

- (void)setContactFetcherStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactFetcherStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactFetcherStore, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end
