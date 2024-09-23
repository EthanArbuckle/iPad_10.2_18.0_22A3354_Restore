@implementation CNAutocompleteQuery

+ (id)queryWithRequest:(id)a3 searchProvider:(id)a4 delegate:(id)a5 probeProvider:(id)a6 scheduler:(id)a7 userSession:(id)a8 delegateToken:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;

  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  v23 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRequest:searchProvider:delegate:probeProvider:scheduler:userSession:delegateToken:", v22, v21, v20, v19, v18, v17, v16);

  return v23;
}

- (CNAutocompleteQuery)initWithRequest:(id)a3 searchProvider:(id)a4 delegate:(id)a5 probeProvider:(id)a6 scheduler:(id)a7 userSession:(id)a8 delegateToken:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  CNAutocompleteQuery *v19;
  CNAutocompleteQuery *v20;
  uint64_t v21;
  CNAutocompleteFetchRequest *request;
  CNAutocompleteQuery *v23;
  uint64_t v24;
  CNAutocompleteSourceInclusionPolicy *sourceInclusionPolicy;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  CNCancelationToken *cancelationToken;
  CNAutocompleteQuery *v31;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  objc_super v37;

  v15 = a3;
  v34 = a4;
  v16 = a5;
  v33 = a6;
  v17 = a7;
  v18 = a8;
  v19 = (CNAutocompleteQuery *)a9;
  v37.receiver = self;
  v37.super_class = (Class)CNAutocompleteQuery;
  v20 = -[CNAutocompleteQuery init](&v37, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v15, "copy");
    request = v20->_request;
    v20->_request = (CNAutocompleteFetchRequest *)v21;

    objc_storeStrong((id *)&v20->_searchProvider, a4);
    objc_storeStrong((id *)&v20->_probeProvider, a6);
    objc_storeStrong((id *)&v20->_userSession, a8);
    if (v19)
      v23 = v19;
    else
      v23 = v20;
    objc_storeWeak((id *)&v20->_delegateToken, v23);
    +[CNAutocompleteSourceInclusionPolicy defaultPolicyWithFetchRequest:](CNAutocompleteSourceInclusionPolicy, "defaultPolicyWithFetchRequest:", v15);
    v24 = objc_claimAutoreleasedReturnValue();
    sourceInclusionPolicy = v20->_sourceInclusionPolicy;
    v20->_sourceInclusionPolicy = (CNAutocompleteSourceInclusionPolicy *)v24;

    -[CNAutocompleteQuery makeDelegateWrapperWithDelegate:forRequest:sourceInclusionPolicy:userSession:](v20, "makeDelegateWrapperWithDelegate:forRequest:sourceInclusionPolicy:userSession:", v16, v20->_request, v20->_sourceInclusionPolicy, v20->_userSession);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v20->_delegate, v26);
    v27 = (void *)MEMORY[0x1E0D139B8];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __113__CNAutocompleteQuery_initWithRequest_searchProvider_delegate_probeProvider_scheduler_userSession_delegateToken___block_invoke;
    v35[3] = &unk_1E70DEE90;
    v36 = v26;
    v28 = v26;
    objc_msgSend(v27, "tokenWithCancelationBlock:", v35);
    v29 = objc_claimAutoreleasedReturnValue();
    cancelationToken = v20->_cancelationToken;
    v20->_cancelationToken = (CNCancelationToken *)v29;

    objc_storeStrong((id *)&v20->_scheduler, a7);
    v31 = v20;

  }
  return v20;
}

uint64_t __113__CNAutocompleteQuery_initWithRequest_searchProvider_delegate_probeProvider_scheduler_userSession_delegateToken___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

- (id)makeDelegateWrapperWithDelegate:(id)a3 forRequest:(id)a4 sourceInclusionPolicy:(id)a5 userSession:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  CNAutocompleteDelegateWrapper *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _QWORD v22[4];
  id v23;

  v9 = a4;
  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = -[CNAutocompleteDelegateWrapper initWithDelegate:userSession:fetchRequest:]([CNAutocompleteDelegateWrapper alloc], "initWithDelegate:userSession:fetchRequest:", v12, v10, v9);

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __100__CNAutocompleteQuery_makeDelegateWrapperWithDelegate_forRequest_sourceInclusionPolicy_userSession___block_invoke;
  v22[3] = &unk_1E70DF920;
  v14 = v9;
  v23 = v14;
  -[CNAutocompleteDelegateWrapper addDiagnosticLog:](v13, "addDiagnosticLog:", v22);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v9) = objc_msgSend((id)objc_opt_class(), "shouldSortResultsForPolicy:", v11);
  if ((_DWORD)v9)
  {
    objc_msgSend(v15, "sortResults");
    v16 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v16;
  }
  objc_msgSend(v15, "askDelegateToAdjustResults");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend((id)objc_opt_class(), "shouldSuppressAddressesAlreadyChosenForRequest:", v14))
  {
    objc_msgSend(v14, "fetchContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "otherAddressesAlreadyChosen");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "suppressResultsWithAddresses:", v19);
    v20 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v20;
  }

  return v17;
}

uint64_t __100__CNAutocompleteQuery_makeDelegateWrapperWithDelegate_forRequest_sourceInclusionPolicy_userSession___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request: %@"), *(_QWORD *)(a1 + 32));
}

+ (BOOL)shouldSuppressAddressesAlreadyChosenForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  char v10;

  v4 = a3;
  objc_msgSend(v4, "fetchContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "otherAddressesAlreadyChosen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D13BE8], "standardPreferences");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "userHasOptedInToPreference:", CFSTR("CNSuppressAddressesAlreadyChosen"));

    if ((v9 & 1) != 0)
      v10 = 1;
    else
      v10 = objc_msgSend(a1, "searchTypeSupportsSuppressionOfAlreadyChosenAddresses:", objc_msgSend(v4, "searchType"));
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)searchTypeSupportsSuppressionOfAlreadyChosenAddresses:(unint64_t)a3
{
  return a3 != 0;
}

+ (BOOL)shouldSortResultsForPolicy:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "includeRecents") & 1) != 0
    || (objc_msgSend(v3, "includeStewie") & 1) != 0
    || (objc_msgSend(v3, "includeContacts") & 1) != 0
    || (objc_msgSend(v3, "includeSuggestions") & 1) != 0
    || (objc_msgSend(v3, "includeCalendarServers") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "includeDirectoryServers");
  }

  return v4;
}

- (id)execute
{
  return -[CNAutocompleteQuery executeWithContext:](self, "executeWithContext:", 0);
}

- (id)executeWithContext:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E0D13AF0];
  v6 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __42__CNAutocompleteQuery_executeWithContext___block_invoke;
  v24[3] = &unk_1E70DF948;
  objc_copyWeak(&v25, &location);
  v22[0] = v6;
  v22[1] = 3221225472;
  v22[2] = __42__CNAutocompleteQuery_executeWithContext___block_invoke_2;
  v22[3] = &unk_1E70DF970;
  objc_copyWeak(&v23, &location);
  v20[0] = v6;
  v20[1] = 3221225472;
  v20[2] = __42__CNAutocompleteQuery_executeWithContext___block_invoke_3;
  v20[3] = &unk_1E70DF998;
  objc_copyWeak(&v21, &location);
  objc_msgSend(v5, "observerWithResultBlock:completionBlock:failureBlock:", v24, v22, v20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "observableForQuery:context:", self, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteQuery scheduler](self, "scheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v6;
  v15 = 3221225472;
  v16 = __42__CNAutocompleteQuery_executeWithContext___block_invoke_4;
  v17 = &unk_1E70DF9C0;
  v10 = v8;
  v18 = v10;
  v11 = v7;
  v19 = v11;
  objc_msgSend(v9, "performCancelableBlock:", &v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNCancelationToken addCancelable:](self->_cancelationToken, "addCancelable:", v12, v14, v15, v16, v17);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  return self;
}

void __42__CNAutocompleteQuery_executeWithContext___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "searchOperationReportedResults:", v3);

}

void __42__CNAutocompleteQuery_executeWithContext___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "searchOperationsHaveFinished");

}

void __42__CNAutocompleteQuery_executeWithContext___block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "searchOperationEncounteredError:", v3);

}

void __42__CNAutocompleteQuery_executeWithContext___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "subscribe:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addCancelable:", v5);

}

+ (id)observableForQuery:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  int v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  CNAutocompleteQueryCacheHelper *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  CNAutocompleteQueryCacheHelper *v51;
  uint64_t v52;
  void *v53;
  CNAutocompleteQueryCacheHelper *v54;
  void *v55;
  void *v56;
  void *v57;
  CNAutocompleteCalendarQueryAssembler *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  void *v67;
  void *v69;
  void *v70;
  id v71;
  id v72;
  id v73;
  void *v74;
  _QWORD v75[4];
  id v76;
  _QWORD v77[4];
  id v78;
  uint8_t buf[4];
  void *v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(a1, "shouldPerformQueryForRequest:", v8);

  if ((v9 & 1) != 0)
  {
    objc_msgSend(v6, "request");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "searchType");
    objc_msgSend(v6, "scheduler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "probeProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNAutocompleteObservableBuilder builderWithSearchType:scheduler:probeProvider:](CNAutocompleteObservableBuilder, "builderWithSearchType:scheduler:probeProvider:", v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "sourceInclusionPolicy");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "searchProvider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "request");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scheduler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNAutocompleteSearchObservableProvider providerWithSearchProvider:fetchRequest:scheduler:](CNAutocompleteSearchObservableProvider, "providerWithSearchProvider:fetchRequest:scheduler:", v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = v19;
    objc_msgSend(a1, "configureNetworkForBuilder:query:", v14, v6);
    if (objc_msgSend(v15, "includeContacts"))
    {
      objc_msgSend(v19, "localSearchObservable");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addContactsObservable:", v21);
      CNALoggingContextDebug();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v80 = v21;
        _os_log_impl(&dword_1B9950000, v22, OS_LOG_TYPE_DEFAULT, "Adding local contacts observable %@", buf, 0xCu);
      }

    }
    if (objc_msgSend(v15, "includeRecents"))
    {
      objc_msgSend(v20, "recentsSearchObservable");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addCoreRecentsObservable:", v23);
      CNALoggingContextDebug();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v80 = v23;
        _os_log_impl(&dword_1B9950000, v24, OS_LOG_TYPE_DEFAULT, "Adding recent contacts observable %@", buf, 0xCu);
      }

    }
    if (objc_msgSend(v15, "includeStewie"))
    {
      objc_msgSend(v20, "stewieSearchObservable");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addStewieObservable:", v25);
      CNALoggingContextDebug();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v80 = v20;
        _os_log_impl(&dword_1B9950000, v26, OS_LOG_TYPE_DEFAULT, "Adding Stewie observable %@", buf, 0xCu);
      }

    }
    if (objc_msgSend(v15, "includeSuggestions"))
    {
      objc_msgSend(v20, "suggestionsSearchObservable");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addSuggestionsObservable:", v27);
      CNALoggingContextDebug();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v80 = v27;
        _os_log_impl(&dword_1B9950000, v28, OS_LOG_TYPE_DEFAULT, "Adding suggested contacts observable %@", buf, 0xCu);
      }

    }
    v71 = a1;
    v29 = objc_msgSend(v15, "includeLocalExtensions");
    v30 = MEMORY[0x1E0C809B0];
    if (v29)
    {
      objc_msgSend(v20, "localExtensionSearchObservables");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v77[0] = v30;
      v77[1] = 3221225472;
      v77[2] = __50__CNAutocompleteQuery_observableForQuery_context___block_invoke;
      v77[3] = &unk_1E70DF9E8;
      v78 = v14;
      objc_msgSend(v31, "_cn_each:", v77);

    }
    v74 = v20;
    if (objc_msgSend(v15, "includePredictions"))
    {
      v32 = objc_alloc_init(MEMORY[0x1E0D13B20]);
      objc_msgSend(v20, "predictionsSearchObservableWithUnfilteredResultPromise:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "delegate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "future");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setPredictionResultsFuture:", v35);

      v75[0] = v30;
      v75[1] = 3221225472;
      v75[2] = __50__CNAutocompleteQuery_observableForQuery_context___block_invoke_16;
      v75[3] = &unk_1E70DEE90;
      v76 = v32;
      v36 = v32;
      objc_msgSend(v14, "addPredictionObservable:doOnTimeout:", v33, v75);
      CNALoggingContextDebug();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v80 = v33;
        _os_log_impl(&dword_1B9950000, v37, OS_LOG_TYPE_DEFAULT, "Adding predictions CoreDuet/PeopleSuggester observable %@", buf, 0xCu);
      }

      v20 = v74;
    }
    if (objc_msgSend(v15, "includeDirectoryServers"))
    {
      objc_msgSend(v20, "directoryServersSearchObservable");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = v7;
      objc_msgSend(v7, "directoryServerReuseCache");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "request");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "searchString");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = -[CNAutocompleteQueryCacheHelper initWithCache:searchString:serverSearchObservable:]([CNAutocompleteQueryCacheHelper alloc], "initWithCache:searchString:serverSearchObservable:", v39, v41, v38);
      -[CNAutocompleteQueryCacheHelper cachedResultsObservable](v42, "cachedResultsObservable");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addCachedDirectoryServerObservable:", v43);
      CNALoggingContextDebug();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v80 = v43;
        _os_log_impl(&dword_1B9950000, v44, OS_LOG_TYPE_DEFAULT, "Adding cached directory servers observable %@", buf, 0xCu);
      }

      -[CNAutocompleteQueryCacheHelper uncachedResultsObservable](v42, "uncachedResultsObservable");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addDirectoryServerObservable:", v45);
      CNALoggingContextDebug();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v80 = v45;
        _os_log_impl(&dword_1B9950000, v46, OS_LOG_TYPE_DEFAULT, "Adding directory servers observable %@", buf, 0xCu);
      }

      v7 = v72;
      v20 = v74;
    }
    if (objc_msgSend(v15, "includeCalendarServers")
      && +[CNAutocompleteCalendarServerSearch isSupported](CNAutocompleteCalendarServerSearch, "isSupported"))
    {
      objc_msgSend(v20, "calendarServersSearchObservable");
      v47 = objc_claimAutoreleasedReturnValue();
      v73 = v7;
      objc_msgSend(v7, "calendarServerReuseCache");
      v48 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "request");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "searchString");
      v50 = objc_claimAutoreleasedReturnValue();

      v51 = [CNAutocompleteQueryCacheHelper alloc];
      v69 = (void *)v47;
      v70 = (void *)v48;
      v52 = v48;
      v53 = (void *)v50;
      v54 = -[CNAutocompleteQueryCacheHelper initWithCache:searchString:serverSearchObservable:](v51, "initWithCache:searchString:serverSearchObservable:", v52, v50, v47);
      -[CNAutocompleteQueryCacheHelper cachedResultsObservable](v54, "cachedResultsObservable");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNAutocompleteQueryCacheHelper uncachedResultsObservable](v54, "uncachedResultsObservable");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "publish");
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      v58 = -[CNAutocompleteCalendarQueryAssembler initWithRawCachedObservable:rawUncachedObservable:]([CNAutocompleteCalendarQueryAssembler alloc], "initWithRawCachedObservable:rawUncachedObservable:", v55, v57);
      -[CNAutocompleteCalendarQueryAssembler assemble](v58, "assemble");
      -[CNAutocompleteCalendarQueryAssembler cachedObservable](v58, "cachedObservable");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addCachedCalendarServerObservable:", v59);

      -[CNAutocompleteCalendarQueryAssembler uncachedObservable](v58, "uncachedObservable");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addCalendarServerObservable:", v60);

      CNALoggingContextDebug();
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        -[CNAutocompleteCalendarQueryAssembler cachedObservable](v58, "cachedObservable");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v80 = v62;
        _os_log_impl(&dword_1B9950000, v61, OS_LOG_TYPE_DEFAULT, "Adding cached calendar servers observable %@", buf, 0xCu);

      }
      CNALoggingContextDebug();
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        -[CNAutocompleteCalendarQueryAssembler uncachedObservable](v58, "uncachedObservable");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v80 = v64;
        _os_log_impl(&dword_1B9950000, v63, OS_LOG_TYPE_DEFAULT, "Adding calendar servers observable %@", buf, 0xCu);

      }
      v7 = v73;
      v20 = v74;
    }
    if (objc_msgSend(v15, "includeSupplementalResults"))
    {
      objc_msgSend(v71, "observableWithSupplementalResultsForQuery:", v6);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addSupplementalObservable:", v65);

      CNALoggingContextDebug();
      v66 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v80 = v20;
        _os_log_impl(&dword_1B9950000, v66, OS_LOG_TYPE_DEFAULT, "Adding supplemental observable %@", buf, 0xCu);
      }

    }
    objc_msgSend(v14, "makeObservable");
    v67 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D13AE8], "emptyObservable");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v67;
}

void __50__CNAutocompleteQuery_observableForQuery_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "addLocalExtensionObservable:", v3);
  CNALoggingContextDebug();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1B9950000, v4, OS_LOG_TYPE_DEFAULT, "Adding local extensions observable %@", (uint8_t *)&v5, 0xCu);
  }

}

void __50__CNAutocompleteQuery_observableForQuery_context___block_invoke_16(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v5 = *MEMORY[0x1E0CB2D68];
  v6[0] = CFSTR("Duet observable timed out.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("CNContactAutocompleteErrorDomain"), 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishWithError:", v4);

}

+ (BOOL)shouldPerformQueryForRequest:(id)a3
{
  return 1;
}

+ (void)configureNetworkForBuilder:(id)a3 query:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "configureNetworkPolicyForBuilder:query:", v7, v6);
  objc_msgSend(a1, "configureNetworkActivityHandlersForBuilder:query:", v7, v6);

}

+ (void)configureNetworkPolicyForBuilder:(id)a3 query:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a3;
  objc_msgSend(a4, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNAutocompleteNetworkActivityPolicy policyWithThrottlingDelayForString:](CNAutocompleteNetworkActivityPolicy, "policyWithThrottlingDelayForString:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "delayBeforeBeginningNetworkActivity");
  objc_msgSend(v5, "setNetworkActivityStartDelay:");

}

+ (void)configureNetworkActivityHandlersForBuilder:(id)a3 query:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  v5 = a3;
  v6 = a4;
  objc_initWeak(&location, v6);
  v7 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__CNAutocompleteQuery_configureNetworkActivityHandlersForBuilder_query___block_invoke;
  v10[3] = &unk_1E70DF970;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v5, "setNetworkActivityDidStartHandler:", v10);
  v8[0] = v7;
  v8[1] = 3221225472;
  v8[2] = __72__CNAutocompleteQuery_configureNetworkActivityHandlersForBuilder_query___block_invoke_2;
  v8[3] = &unk_1E70DF970;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v5, "setNetworkActivityDidStopHandler:", v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __72__CNAutocompleteQuery_configureNetworkActivityHandlersForBuilder_query___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "searchOperationsHaveBegunNetworkActivity");

}

void __72__CNAutocompleteQuery_configureNetworkActivityHandlersForBuilder_query___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "searchOperationsHaveEndedNetworkActivity");

}

+ (id)observableWithSupplementalResultsForQuery:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v3 = a3;
  objc_msgSend(v3, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "triageIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  CNALoggingContextDebug();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D13AE8];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65__CNAutocompleteQuery_observableWithSupplementalResultsForQuery___block_invoke;
  v13[3] = &unk_1E70DFAD0;
  v14 = v3;
  v15 = v5;
  v16 = v6;
  v8 = v6;
  v9 = v5;
  v10 = v3;
  objc_msgSend(v7, "observableWithBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __65__CNAutocompleteQuery_observableWithSupplementalResultsForQuery___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;

  v3 = a2;
  objc_msgSend(a1[4], "scheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__CNAutocompleteQuery_observableWithSupplementalResultsForQuery___block_invoke_2;
  v8[3] = &unk_1E70DFAA8;
  v9 = a1[4];
  v10 = a1[5];
  v11 = a1[6];
  v12 = v3;
  v5 = v3;
  objc_msgSend(v4, "performCancelableBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __65__CNAutocompleteQuery_observableWithSupplementalResultsForQuery___block_invoke_2(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  int v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  _QWORD *v39;
  os_signpost_id_t v40;
  uint64_t v41;
  _QWORD v42[3];
  char v43;
  uint8_t buf[4];
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  v43 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13980]), "initWithState:", 1);
  objc_msgSend(MEMORY[0x1E0D13BB8], "defaultProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timestamp");
  v7 = v6;

  CNALoggingContextTriage();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  CNALoggingContextPerformance();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B9950000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "Searching via Delegate (supplemental results", ", buf, 2u);
  }

  objc_msgSend(a1[4], "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "delegateToken");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "request");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __65__CNAutocompleteQuery_observableWithSupplementalResultsForQuery___block_invoke_27;
  v32[3] = &unk_1E70DFA80;
  v40 = v9;
  v41 = v7;
  v33 = a1[5];
  v15 = v3;
  v34 = v15;
  v39 = v42;
  v35 = a1[4];
  v36 = a1[6];
  v16 = v4;
  v37 = v16;
  v38 = a1[7];
  v17 = objc_msgSend(v12, "autocompleteFetch:shouldExpectSupplementalResultsForRequest:completionHandler:", v13, v14, v32);

  if (v17)
  {
    CNALoggingContextTriage();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = a1[5];
      *(_DWORD *)buf = 138543362;
      v45 = v19;
      _os_log_impl(&dword_1B9950000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Supplemental: Results are expected", buf, 0xCu);
    }

  }
  else
  {
    CNALoggingContextTriage();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = a1[5];
      *(_DWORD *)buf = 138543362;
      v45 = v21;
      _os_log_impl(&dword_1B9950000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Supplemental: Results are not expected", buf, 0xCu);
    }

    CNALoggingContextPerformance();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B9950000, v23, OS_SIGNPOST_INTERVAL_END, v9, "Searching via Delegate (supplemental results", ", buf, 2u);
    }

    if (objc_msgSend(v16, "trySetState:", 0))
    {
      objc_msgSend(a1[7], "observerDidComplete");
    }
    else
    {
      v24 = a1[6];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        __65__CNAutocompleteQuery_observableWithSupplementalResultsForQuery___block_invoke_2_cold_1(v24, v25, v26, v27, v28, v29, v30, v31);
    }
  }

  _Block_object_dispose(v42, 8);
}

void __65__CNAutocompleteQuery_observableWithSupplementalResultsForQuery___block_invoke_27(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  uint64_t v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  BOOL v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id (*v48)(uint64_t, void *);
  void *v49;
  id v50;
  id v51;
  id v52;
  _BYTE *v53;
  uint8_t v54[4];
  uint64_t v55;
  __int16 v56;
  const char *v57;
  _BYTE buf[24];
  uint64_t v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  CNALoggingContextPerformance();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 88);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B9950000, v8, OS_SIGNPOST_INTERVAL_END, v9, "Searching via Delegate (supplemental results", ", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D13BB8], "defaultProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timestamp");
  v12 = v11;

  objc_msgSend(MEMORY[0x1E0D13BB0], "stringForTimeInterval:", v12 - *(double *)(a1 + 96));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  CNALoggingContextTriage();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v15)
      goto LABEL_12;
    v16 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v16;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2114;
    v59 = (uint64_t)v6;
    v17 = "[%{public}@] Supplemental: Search failed (%{public}@): %{public}@";
    v18 = v14;
    v19 = 32;
  }
  else
  {
    if (!v15)
      goto LABEL_12;
    v20 = *(_QWORD *)(a1 + 32);
    v21 = objc_msgSend(v5, "count");
    v22 = objc_msgSend(v5, "count");
    v23 = "results";
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = v20;
    *(_WORD *)&buf[12] = 2048;
    if (v22 == 1)
      v23 = "result";
    *(_QWORD *)&buf[14] = v21;
    *(_WORD *)&buf[22] = 2080;
    v59 = (uint64_t)v23;
    v60 = 2114;
    v61 = v13;
    v17 = "[%{public}@] Supplemental: Search complete (%lu %s, %{public}@)";
    v18 = v14;
    v19 = 42;
  }
  _os_log_impl(&dword_1B9950000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
LABEL_12:

  if ((objc_msgSend(*(id *)(a1 + 40), "isCanceled") & 1) != 0)
    goto LABEL_32;
  v24 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  if (*(_BYTE *)(v24 + 24))
  {
    CNAutocompleteDelegateMultipleCallbacks(*(void **)(a1 + 48));
    goto LABEL_32;
  }
  *(_BYTE *)(v24 + 24) = 1;
  objc_msgSend(*(id *)(a1 + 48), "request");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v25, "searchType") == 1)
  {
    v26 = objc_msgSend(v5, "count") == 0;

    if (v26)
      goto LABEL_27;
    objc_msgSend(v5, "_cn_filter:", &__block_literal_global_20);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = *(NSObject **)(a1 + 56);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v28 = v27;
      v29 = objc_msgSend(v25, "count");
      v30 = objc_msgSend(v25, "count");
      v31 = "groups";
      if (v30 == 1)
        v31 = "group";
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v29;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = v31;
      _os_log_impl(&dword_1B9950000, v28, OS_LOG_TYPE_INFO, "Supplemental results include %lu %s to check for matching members.", buf, 0x16u);

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v59 = 1;
    v46 = MEMORY[0x1E0C809B0];
    v47 = 3221225472;
    v48 = __65__CNAutocompleteQuery_observableWithSupplementalResultsForQuery___block_invoke_35;
    v49 = &unk_1E70DFA58;
    v50 = *(id *)(a1 + 40);
    v51 = *(id *)(a1 + 56);
    v53 = buf;
    v52 = *(id *)(a1 + 48);
    objc_msgSend(v25, "_cn_flatMap:", &v46);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = *(id *)(a1 + 56);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      v34 = objc_msgSend(v32, "count", v46, v47, v48, v49, v50, v51);
      v35 = objc_msgSend(v32, "count");
      v36 = "members";
      if (v35 == 1)
        v36 = "member";
      *(_DWORD *)v54 = 134218242;
      v55 = v34;
      v56 = 2080;
      v57 = v36;
      _os_log_impl(&dword_1B9950000, v33, OS_LOG_TYPE_INFO, "Promoting %lu %s to include with the top-level results", v54, 0x16u);
    }

    objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v32);
    v37 = objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(buf, 8);
    v5 = (id)v37;
  }

LABEL_27:
  if ((objc_msgSend(*(id *)(a1 + 40), "isCanceled", v46, v47, v48, v49) & 1) == 0)
  {
    if (objc_msgSend(*(id *)(a1 + 64), "trySetState:", 0))
    {
      objc_msgSend(MEMORY[0x1E0D13AF0], "sendResult:error:toObserver:", v5, v6, *(_QWORD *)(a1 + 72));
    }
    else
    {
      v38 = *(NSObject **)(a1 + 56);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        __65__CNAutocompleteQuery_observableWithSupplementalResultsForQuery___block_invoke_27_cold_1(v38, v39, v40, v41, v42, v43, v44, v45);
    }
  }
LABEL_32:

}

BOOL __65__CNAutocompleteQuery_observableWithSupplementalResultsForQuery___block_invoke_31(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "resultType") == 1;
}

id __65__CNAutocompleteQuery_observableWithSupplementalResultsForQuery___block_invoke_35(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isCanceled"))
  {
    v4 = *(NSObject **)(a1 + 40);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      *(_DWORD *)buf = 134217984;
      v25 = v5;
      _os_log_impl(&dword_1B9950000, v4, OS_LOG_TYPE_DEFAULT, "Supplemental search has been cancelled; will not expand group %lu.",
        buf,
        0xCu);
    }
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v23 = 0;
    objc_msgSend(v3, "members:", &v23);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v23;
    if (v7)
    {
      v18 = MEMORY[0x1E0C809B0];
      v19 = 3221225472;
      v20 = __65__CNAutocompleteQuery_observableWithSupplementalResultsForQuery___block_invoke_36;
      v21 = &unk_1E70DFA30;
      v22 = *(id *)(a1 + 48);
      objc_msgSend(v7, "_cn_filter:", &v18);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(NSObject **)(a1 + 40);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v14 = *(_QWORD *)(v13 + 24);
        *(_QWORD *)(v13 + 24) = v14 + 1;
        v15 = v9;
        v16 = objc_msgSend(v6, "count", v18, v19, v20, v21);
        v17 = objc_msgSend(v7, "count");
        *(_DWORD *)buf = 134218496;
        v25 = v14;
        v26 = 2048;
        v27 = v16;
        v28 = 2048;
        v29 = v17;
        _os_log_debug_impl(&dword_1B9950000, v15, OS_LOG_TYPE_DEBUG, "Expanding group %lu: %lu/%lu members matched", buf, 0x20u);

      }
    }
    else
    {
      v10 = *(NSObject **)(a1 + 40);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __65__CNAutocompleteQuery_observableWithSupplementalResultsForQuery___block_invoke_35_cold_2((uint64_t)v3, (uint64_t)v8, v10);
      v11 = *(NSObject **)(a1 + 40);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        __65__CNAutocompleteQuery_observableWithSupplementalResultsForQuery___block_invoke_35_cold_1(a1, v11);
      v6 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  return v6;
}

uint64_t __65__CNAutocompleteQuery_observableWithSupplementalResultsForQuery___block_invoke_36(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "address");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "_cn_hasPrefix:", v6);

  return v7;
}

- (void)searchOperationReportedResults:(id)a3
{
  CNAutocompleteDelegateWrapper *delegate;
  CNCancelable **p_delegateToken;
  id v5;
  id WeakRetained;

  delegate = self->_delegate;
  p_delegateToken = &self->_delegateToken;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegateToken);
  -[CNAutocompleteDelegateWrapper autocompleteFetch:didReceiveResults:](delegate, "autocompleteFetch:didReceiveResults:", WeakRetained, v5);

}

- (void)searchOperationEncounteredError:(id)a3
{
  CNAutocompleteDelegateWrapper *delegate;
  CNCancelable **p_delegateToken;
  id v6;
  id WeakRetained;
  CNAutocompleteDelegateWrapper *v8;
  id v9;

  delegate = self->_delegate;
  p_delegateToken = &self->_delegateToken;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegateToken);
  -[CNAutocompleteDelegateWrapper autocompleteFetchDidEndNetworkActivity:](delegate, "autocompleteFetchDidEndNetworkActivity:", WeakRetained);

  v8 = self->_delegate;
  v9 = objc_loadWeakRetained((id *)p_delegateToken);
  -[CNAutocompleteDelegateWrapper autocompleteFetch:didFailWithError:](v8, "autocompleteFetch:didFailWithError:", v9, v6);

}

- (void)searchOperationsHaveBegunNetworkActivity
{
  NSObject *v3;
  CNAutocompleteDelegateWrapper *delegate;
  id WeakRetained;
  uint8_t v6[16];

  CNALoggingContextDebug();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B9950000, v3, OS_LOG_TYPE_DEFAULT, "Search operations have begun network activity", v6, 2u);
  }

  delegate = self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegateToken);
  -[CNAutocompleteDelegateWrapper autocompleteFetchDidBeginNetworkActivity:](delegate, "autocompleteFetchDidBeginNetworkActivity:", WeakRetained);

}

- (void)searchOperationsHaveEndedNetworkActivity
{
  NSObject *v3;
  CNAutocompleteDelegateWrapper *delegate;
  id WeakRetained;
  uint8_t v6[16];

  CNALoggingContextDebug();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B9950000, v3, OS_LOG_TYPE_DEFAULT, "Search operations have ended network activity", v6, 2u);
  }

  delegate = self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegateToken);
  -[CNAutocompleteDelegateWrapper autocompleteFetchDidEndNetworkActivity:](delegate, "autocompleteFetchDidEndNetworkActivity:", WeakRetained);

}

- (void)searchOperationsHaveFinished
{
  CNAutocompleteDelegateWrapper *delegate;
  id WeakRetained;

  delegate = self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegateToken);
  -[CNAutocompleteDelegateWrapper autocompleteFetchDidFinish:](delegate, "autocompleteFetchDidFinish:", WeakRetained);

}

- (void)cancel
{
  NSObject *v3;
  id WeakRetained;
  int v5;
  CNAutocompleteQuery *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  CNALoggingContextDebug();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegateToken);
    v5 = 134218240;
    v6 = self;
    v7 = 2048;
    v8 = WeakRetained;
    _os_log_impl(&dword_1B9950000, v3, OS_LOG_TYPE_DEFAULT, "Cancelling query %p, delegate token: %p", (uint8_t *)&v5, 0x16u);

  }
  -[CNCancelationToken cancel](self->_cancelationToken, "cancel");
}

- (CNAutocompleteFetchRequest)request
{
  return (CNAutocompleteFetchRequest *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRequest:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (CNAutocompleteDelegateWrapper)delegate
{
  return (CNAutocompleteDelegateWrapper *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDelegate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (CNScheduler)scheduler
{
  return (CNScheduler *)objc_getProperty(self, a2, 24, 1);
}

- (void)setScheduler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (CNCancelationToken)cancelationToken
{
  return (CNCancelationToken *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCancelationToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (CNAutocompleteSearchProvider)searchProvider
{
  return (CNAutocompleteSearchProvider *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSearchProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (CNAutocompleteProbeProvider)probeProvider
{
  return (CNAutocompleteProbeProvider *)objc_getProperty(self, a2, 48, 1);
}

- (void)setProbeProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (CNAutocompleteUserSession)userSession
{
  return (CNAutocompleteUserSession *)objc_getProperty(self, a2, 56, 1);
}

- (void)setUserSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (CNCancelable)delegateToken
{
  return (CNCancelable *)objc_loadWeakRetained((id *)&self->_delegateToken);
}

- (void)setDelegateToken:(id)a3
{
  objc_storeWeak((id *)&self->_delegateToken, a3);
}

- (CNAutocompleteSourceInclusionPolicy)sourceInclusionPolicy
{
  return (CNAutocompleteSourceInclusionPolicy *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSourceInclusionPolicy:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceInclusionPolicy, 0);
  objc_destroyWeak((id *)&self->_delegateToken);
  objc_storeStrong((id *)&self->_userSession, 0);
  objc_storeStrong((id *)&self->_probeProvider, 0);
  objc_storeStrong((id *)&self->_searchProvider, 0);
  objc_storeStrong((id *)&self->_cancelationToken, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

void __65__CNAutocompleteQuery_observableWithSupplementalResultsForQuery___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1B9950000, a1, a3, "Tried to complete the supplemental results observer, but the observer has already been completed", a5, a6, a7, a8, 0);
}

void __65__CNAutocompleteQuery_observableWithSupplementalResultsForQuery___block_invoke_27_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1B9950000, a1, a3, "Tried to send supplemental results to observer, but the observer has already been completed", a5, a6, a7, a8, 0);
}

void __65__CNAutocompleteQuery_observableWithSupplementalResultsForQuery___block_invoke_35_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v3 = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(v2 + 24) = v3 + 1;
  v4 = a2;
  v5 = 134218240;
  v6 = v3;
  v7 = 2048;
  v8 = objc_msgSend(0, "count");
  _os_log_debug_impl(&dword_1B9950000, v4, OS_LOG_TYPE_DEBUG, "Expanding group %lu resulted in error, 0/%lu members matched", (uint8_t *)&v5, 0x16u);

}

void __65__CNAutocompleteQuery_observableWithSupplementalResultsForQuery___block_invoke_35_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_1B9950000, log, OS_LOG_TYPE_ERROR, "Error expanding supplemental group (%{public}@): %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
