@implementation CNAutocompleteSearchObservableProvider

+ (id)providerWithSearchProvider:(id)a3 fetchRequest:(id)a4 scheduler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSearchProvider:fetchRequest:scheduler:", v10, v9, v8);

  return v11;
}

- (CNAutocompleteSearchObservableProvider)initWithSearchProvider:(id)a3 fetchRequest:(id)a4 scheduler:(id)a5
{
  id v9;
  id v10;
  id v11;
  CNAutocompleteSearchObservableProvider *v12;
  CNAutocompleteSearchObservableProvider *v13;
  os_log_t v14;
  OS_os_log *log;
  CNAutocompleteSearchObservableProvider *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CNAutocompleteSearchObservableProvider;
  v12 = -[CNAutocompleteSearchObservableProvider init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_searchProvider, a3);
    objc_storeStrong((id *)&v13->_fetchRequest, a4);
    objc_storeStrong((id *)&v13->_scheduler, a5);
    v14 = os_log_create("com.apple.contacts.autocomplete", "debug");
    log = v13->_log;
    v13->_log = (OS_os_log *)v14;

    v16 = v13;
  }

  return v13;
}

- (id)localSearchObservable
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  -[CNAutocompleteSearchObservableProvider searchProvider](self, "searchProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__CNAutocompleteSearchObservableProvider_localSearchObservable__block_invoke;
  v7[3] = &unk_1E70DF2D0;
  v8 = v3;
  v4 = v3;
  -[CNAutocompleteSearchObservableProvider observableWithWrappedSearchProviderGetter:name:](self, "observableWithWrappedSearchProviderGetter:name:", v7, CFSTR("Local Contacts"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __63__CNAutocompleteSearchObservableProvider_localSearchObservable__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "localSearch");
}

- (id)recentsSearchObservable
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  -[CNAutocompleteSearchObservableProvider searchProvider](self, "searchProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__CNAutocompleteSearchObservableProvider_recentsSearchObservable__block_invoke;
  v7[3] = &unk_1E70DF2D0;
  v8 = v3;
  v4 = v3;
  -[CNAutocompleteSearchObservableProvider observableWithWrappedSearchProviderGetter:name:](self, "observableWithWrappedSearchProviderGetter:name:", v7, CFSTR("Recent Contacts"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __65__CNAutocompleteSearchObservableProvider_recentsSearchObservable__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "recentsSearch");
}

- (id)stewieSearchObservable
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  -[CNAutocompleteSearchObservableProvider searchProvider](self, "searchProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__CNAutocompleteSearchObservableProvider_stewieSearchObservable__block_invoke;
  v7[3] = &unk_1E70DF2D0;
  v8 = v3;
  v4 = v3;
  -[CNAutocompleteSearchObservableProvider observableWithWrappedSearchProviderGetter:name:](self, "observableWithWrappedSearchProviderGetter:name:", v7, CFSTR("Stewie"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __64__CNAutocompleteSearchObservableProvider_stewieSearchObservable__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stewieSearch");
}

- (id)suggestionsSearchObservable
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  -[CNAutocompleteSearchObservableProvider searchProvider](self, "searchProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__CNAutocompleteSearchObservableProvider_suggestionsSearchObservable__block_invoke;
  v7[3] = &unk_1E70DF2D0;
  v8 = v3;
  v4 = v3;
  -[CNAutocompleteSearchObservableProvider observableWithWrappedSearchProviderGetter:name:](self, "observableWithWrappedSearchProviderGetter:name:", v7, CFSTR("Suggested Contacts"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __69__CNAutocompleteSearchObservableProvider_suggestionsSearchObservable__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "suggestionsSearch");
}

- (id)predictionsSearchObservableWithUnfilteredResultPromise:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  -[CNAutocompleteSearchObservableProvider searchProvider](self, "searchProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __97__CNAutocompleteSearchObservableProvider_predictionsSearchObservableWithUnfilteredResultPromise___block_invoke;
  v19[3] = &unk_1E70DF2D0;
  v20 = v5;
  v7 = v5;
  -[CNAutocompleteSearchObservableProvider observableWithWrappedSearchProviderGetter:name:](self, "observableWithWrappedSearchProviderGetter:name:", v19, CFSTR("Predictions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v6;
  v17[1] = 3221225472;
  v17[2] = __97__CNAutocompleteSearchObservableProvider_predictionsSearchObservableWithUnfilteredResultPromise___block_invoke_2;
  v17[3] = &unk_1E70DF2F8;
  v9 = v4;
  v18 = v9;
  objc_msgSend(v8, "doOnNext:", v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __97__CNAutocompleteSearchObservableProvider_predictionsSearchObservableWithUnfilteredResultPromise___block_invoke_3;
  v15[3] = &unk_1E70DF320;
  v16 = v9;
  v11 = v9;
  objc_msgSend(v10, "doOnError:", v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[CNAutocompleteSearchObservableProvider shouldAllowPredictionSearchToSourceResults](self, "shouldAllowPredictionSearchToSourceResults"))
  {
    objc_msgSend(v12, "filter:", &__block_literal_global_10);
    v13 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v13;
  }

  return v12;
}

uint64_t __97__CNAutocompleteSearchObservableProvider_predictionsSearchObservableWithUnfilteredResultPromise___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "predictionSearch");
}

uint64_t __97__CNAutocompleteSearchObservableProvider_predictionsSearchObservableWithUnfilteredResultPromise___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", a2);
}

uint64_t __97__CNAutocompleteSearchObservableProvider_predictionsSearchObservableWithUnfilteredResultPromise___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

uint64_t __97__CNAutocompleteSearchObservableProvider_predictionsSearchObservableWithUnfilteredResultPromise___block_invoke_4()
{
  return 0;
}

- (BOOL)shouldAllowPredictionSearchToSourceResults
{
  void *v3;
  BOOL v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  -[CNAutocompleteSearchObservableProvider fetchRequest](self, "fetchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "searchType") == 2)
  {
    v4 = 1;
LABEL_9:

    return v4;
  }
  -[CNAutocompleteSearchObservableProvider fetchRequest](self, "fetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "searchType");

  if (v6 != 1)
  {
    -[CNAutocompleteSearchObservableProvider fetchRequest](self, "fetchRequest");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "searchString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[CNAutocompleteSearchObservableProvider fetchRequest](self, "fetchRequest");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "searchString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v9, "length") == 0;

    }
    else
    {
      v4 = 1;
    }

    goto LABEL_9;
  }
  return 1;
}

- (id)localExtensionSearchObservables
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[CNAutocompleteSearchObservableProvider searchProvider](self, "searchProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localExtensionSearches");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__CNAutocompleteSearchObservableProvider_localExtensionSearchObservables__block_invoke;
  v7[3] = &unk_1E70DF368;
  v7[4] = self;
  objc_msgSend(v4, "_cn_map:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __73__CNAutocompleteSearchObservableProvider_localExtensionSearchObservables__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__CNAutocompleteSearchObservableProvider_localExtensionSearchObservables__block_invoke_2;
  v8[3] = &unk_1E70DF2D0;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "observableWithWrappedSearchProviderGetter:name:", v8, CFSTR("Local Extensions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __73__CNAutocompleteSearchObservableProvider_localExtensionSearchObservables__block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)directoryServersSearchObservable
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  -[CNAutocompleteSearchObservableProvider searchProvider](self, "searchProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__CNAutocompleteSearchObservableProvider_directoryServersSearchObservable__block_invoke;
  v7[3] = &unk_1E70DF2D0;
  v8 = v3;
  v4 = v3;
  -[CNAutocompleteSearchObservableProvider observableWithWrappedSearchProviderGetter:name:](self, "observableWithWrappedSearchProviderGetter:name:", v7, CFSTR("Directory Servers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __74__CNAutocompleteSearchObservableProvider_directoryServersSearchObservable__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "directoryServerSearch");
}

- (id)calendarServersSearchObservable
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  -[CNAutocompleteSearchObservableProvider searchProvider](self, "searchProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__CNAutocompleteSearchObservableProvider_calendarServersSearchObservable__block_invoke;
  v7[3] = &unk_1E70DF2D0;
  v8 = v3;
  v4 = v3;
  -[CNAutocompleteSearchObservableProvider observableWithWrappedSearchProviderGetter:name:](self, "observableWithWrappedSearchProviderGetter:name:", v7, CFSTR("Calendar Server"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __73__CNAutocompleteSearchObservableProvider_calendarServersSearchObservable__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "calendarServerSearch");
}

- (id)observableWithWrappedSearchProviderGetter:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CNAutocompleteObservable *v9;
  id v10;
  id v11;
  id v12;
  CNAutocompleteObservable *v13;
  uint64_t v15;
  uint64_t v16;
  id (*v17)(uint64_t, void *);
  void *v18;
  CNAutocompleteSearchObservableProvider *v19;
  id v20;
  id v21;
  id v22;

  v6 = a3;
  v7 = a4;
  -[CNAutocompleteSearchObservableProvider log](self, "log");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [CNAutocompleteObservable alloc];
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __89__CNAutocompleteSearchObservableProvider_observableWithWrappedSearchProviderGetter_name___block_invoke;
  v18 = &unk_1E70DF3B8;
  v19 = self;
  v20 = v8;
  v21 = v7;
  v22 = v6;
  v10 = v7;
  v11 = v8;
  v12 = v6;
  v13 = -[CNAutocompleteObservable initWithBlock:](v9, "initWithBlock:", &v15);
  -[CNAutocompleteObservable setDebugDescription:](v13, "setDebugDescription:", v10, v15, v16, v17, v18, v19);

  return v13;
}

id __89__CNAutocompleteSearchObservableProvider_observableWithWrappedSearchProviderGetter_name___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "scheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __89__CNAutocompleteSearchObservableProvider_observableWithWrappedSearchProviderGetter_name___block_invoke_2;
  v10[3] = &unk_1E70DF390;
  v15 = *(id *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v11 = v3;
  v12 = v5;
  v13 = v6;
  v14 = *(id *)(a1 + 48);
  v7 = v3;
  objc_msgSend(v4, "performCancelableBlock:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __89__CNAutocompleteSearchObservableProvider_observableWithWrappedSearchProviderGetter_name___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "fetchRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CNObserverCancelableCompletionHandler();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "executeRequest:completionHandler:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v3, "addCancelable:", v7);
    }
    else
    {
      v8 = *(NSObject **)(a1 + 48);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __89__CNAutocompleteSearchObservableProvider_observableWithWrappedSearchProviderGetter_name___block_invoke_2_cold_1(a1, v8);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "observerDidComplete");
  }

}

- (CNAutocompleteSearchProvider)searchProvider
{
  return self->_searchProvider;
}

- (CNAutocompleteFetchRequest)fetchRequest
{
  return self->_fetchRequest;
}

- (CNScheduler)scheduler
{
  return self->_scheduler;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_fetchRequest, 0);
  objc_storeStrong((id *)&self->_searchProvider, 0);
}

void __89__CNAutocompleteSearchObservableProvider_observableWithWrappedSearchProviderGetter_name___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 56);
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_1B9950000, a2, OS_LOG_TYPE_ERROR, "searchToken (%{public}@) cannot be nil", (uint8_t *)&v3, 0xCu);
}

@end
