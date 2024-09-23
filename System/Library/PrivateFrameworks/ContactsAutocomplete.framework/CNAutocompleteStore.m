@implementation CNAutocompleteStore

- (CNAutocompleteStore)init
{
  return -[CNAutocompleteStore initWithDelegate:](self, "initWithDelegate:", 0);
}

- (CNAutocompleteStore)initWithDelegate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CNAutocompleteStore *v10;

  v4 = a3;
  +[CNAutocompleteSearchProviderFactory cachingProvider](CNAutocompleteSearchProviderFactory, "cachingProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "schedulerProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "backgroundScheduler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[CNAutocompleteProbeProviderFactory defaultProbeProvider](CNAutocompleteProbeProviderFactory, "defaultProbeProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CNAutocompleteStore initWithDelegate:searchProvider:probeProvider:scheduler:](self, "initWithDelegate:searchProvider:probeProvider:scheduler:", v4, v5, v9, v8);

  return v10;
}

- (CNAutocompleteStore)initWithDelegate:(id)a3 searchProvider:(id)a4 probeProvider:(id)a5 scheduler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CNAutocompleteStore *v14;
  CNAutocompleteUserSession *v15;
  CNAutocompleteUserSession *userSession;
  CNAutocompleteStoreQueryHelper *v17;
  CNAutocompleteStoreQueryHelper *queryHelper;
  double v19;
  CNAutocompleteStoreReproStringRecorder *v20;
  CNAutocompleteStoreReproStringRecorder *reproStringRecorder;
  CNAutocompleteStore *v22;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)CNAutocompleteStore;
  v14 = -[CNAutocompleteStore init](&v24, sel_init);
  if (v14)
  {
    v15 = -[CNAutocompleteUserSession initWithProbeProvider:]([CNAutocompleteUserSession alloc], "initWithProbeProvider:", v12);
    userSession = v14->_userSession;
    v14->_userSession = v15;

    v17 = -[CNAutocompleteStoreQueryHelper initWithSearchProvider:delegate:probeProvider:scheduler:userSession:]([CNAutocompleteStoreQueryHelper alloc], "initWithSearchProvider:delegate:probeProvider:scheduler:userSession:", v11, v10, v12, v13, v14->_userSession);
    queryHelper = v14->_queryHelper;
    v14->_queryHelper = v17;

    objc_storeStrong((id *)&v14->_scheduler, a6);
    objc_storeStrong((id *)&v14->_probeProvider, a5);
    objc_msgSend((id)objc_opt_class(), "defaultFetchCoalescingInterval");
    v14->_fetchCoalescingInterval = v19;
    v20 = -[CNAutocompleteStoreReproStringRecorder initWithTimeProvider:]([CNAutocompleteStoreReproStringRecorder alloc], "initWithTimeProvider:", v13);
    reproStringRecorder = v14->_reproStringRecorder;
    v14->_reproStringRecorder = v20;

    v22 = v14;
  }

  return v14;
}

+ (double)defaultFetchCoalescingInterval
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0D13BE8], "standardPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("CNAutocompleteKeystrokeCoalescingInterval"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.2;
  }

  return v5;
}

- (CNAutocompleteSearchProvider)searchProvider
{
  void *v2;
  void *v3;

  -[CNAutocompleteStore queryHelper](self, "queryHelper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNAutocompleteSearchProvider *)v3;
}

- (id)scheduleFetchRequest:(id)a3
{
  return -[CNAutocompleteStore scheduleFetchRequest:delegate:](self, "scheduleFetchRequest:delegate:", a3, 0);
}

- (id)scheduleFetchRequest:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  double v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  -[CNAutocompleteStore fetchCoalescingInterval](self, "fetchCoalescingInterval");
  if (v8 == 0.0)
  {
    -[CNAutocompleteStore executeFetchRequest:delegate:](self, "executeFetchRequest:delegate:", v6, v7);
  }
  else
  {
    -[CNAutocompleteStore fetchCoalescingInterval](self, "fetchCoalescingInterval");
    -[CNAutocompleteStore executeFetchRequest:afterDelay:delegate:](self, "executeFetchRequest:afterDelay:delegate:", v6, v7);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)executeFetchRequest:(id)a3 afterDelay:(double)a4 delegate:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  char v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  id v30;
  void *v31;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id v41;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  double v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  CNALoggingContextDebug();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478083;
    v43 = v8;
    v44 = 2048;
    v45 = a4;
    _os_log_impl(&dword_1B9950000, v10, OS_LOG_TYPE_DEFAULT, "Scheduling request %{private}@ after delay (%.3fs)", buf, 0x16u);
  }

  objc_msgSend(v8, "searchNames");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count") == 1;

  if (v12)
  {
    -[CNAutocompleteStore reproStringRecorder](self, "reproStringRecorder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "searchString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "recordString:", v14);

    CNALoggingContextDebug();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      -[CNAutocompleteStore reproStringRecorder](self, "reproStringRecorder");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "reproString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v43 = v17;
      _os_log_impl(&dword_1B9950000, v15, OS_LOG_TYPE_DEFAULT, "Repro string: %@", buf, 0xCu);

    }
  }
  CNALoggingContextDebug();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    -[CNAutocompleteStore currentFetchToken](self, "currentFetchToken");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134217984;
    v43 = v19;
    _os_log_impl(&dword_1B9950000, v18, OS_LOG_TYPE_DEFAULT, "Cancelling current fetch token (%p)", buf, 0xCu);

  }
  -[CNAutocompleteStore currentFetchToken](self, "currentFetchToken");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "cancel");

  v21 = objc_alloc_init(MEMORY[0x1E0D139B8]);
  -[CNAutocompleteStore setCurrentFetchToken:](self, "setCurrentFetchToken:", v21);
  v41 = 0;
  v22 = objc_msgSend(v8, "isValid:", &v41);
  v23 = v41;
  if ((v22 & 1) != 0)
  {
    -[CNAutocompleteStore userSession](self, "userSession");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "willStartExecutingRequest:", v8);

    objc_initWeak((id *)buf, self);
    -[CNAutocompleteStore currentFetchToken](self, "currentFetchToken");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteStore scheduler](self, "scheduler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __63__CNAutocompleteStore_executeFetchRequest_afterDelay_delegate___block_invoke_2;
    v33[3] = &unk_1E70DEF50;
    objc_copyWeak(&v36, (id *)buf);
    v34 = v8;
    v35 = v9;
    objc_msgSend(v26, "afterDelay:performBlock:", v33, a4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addCancelable:", v27);

    objc_destroyWeak(&v36);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    CNALoggingContextDebug();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v43 = v8;
      v44 = 2112;
      v45 = *(double *)&v23;
      _os_log_impl(&dword_1B9950000, v28, OS_LOG_TYPE_DEFAULT, "Fetch request is not valid: %@, error:%@, stopping.", buf, 0x16u);
    }

    -[CNAutocompleteStore scheduler](self, "scheduler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __63__CNAutocompleteStore_executeFetchRequest_afterDelay_delegate___block_invoke;
    v37[3] = &unk_1E70DEF28;
    v38 = v9;
    v39 = v21;
    v40 = v23;
    v30 = (id)objc_msgSend(v29, "afterDelay:performBlock:", v37, 0.0);

  }
  -[CNAutocompleteStore currentFetchToken](self, "currentFetchToken");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

uint64_t __63__CNAutocompleteStore_executeFetchRequest_afterDelay_delegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "autocompleteFetch:didFailWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __63__CNAutocompleteStore_executeFetchRequest_afterDelay_delegate___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v10 = WeakRetained;
    objc_msgSend(WeakRetained, "queryHelper");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v10, "currentFetchToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "executeFetchRequest:delegate:delegateToken:", v5, v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "currentFetchToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 == v8)
      __63__CNAutocompleteStore_executeFetchRequest_afterDelay_delegate___block_invoke_2_cold_1();

    objc_msgSend(v10, "currentFetchToken");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addCancelable:", v7);

    WeakRetained = v10;
  }

}

- (id)executeFetchRequest:(id)a3
{
  return -[CNAutocompleteStore executeFetchRequest:delegate:](self, "executeFetchRequest:delegate:", a3, 0);
}

- (id)executeFetchRequest:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  char v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  CNALoggingContextDebug();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v6;
    _os_log_impl(&dword_1B9950000, v8, OS_LOG_TYPE_DEFAULT, "Executing request %@", buf, 0xCu);
  }

  -[CNAutocompleteStore currentFetchToken](self, "currentFetchToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cancel");

  v10 = objc_alloc_init(MEMORY[0x1E0D139B8]);
  -[CNAutocompleteStore setCurrentFetchToken:](self, "setCurrentFetchToken:", v10);
  v27 = 0;
  v11 = objc_msgSend(v6, "isValid:", &v27);
  v12 = v27;
  if ((v11 & 1) != 0)
  {
    -[CNAutocompleteStore userSession](self, "userSession");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "willStartExecutingRequest:", v6);

    -[CNAutocompleteStore queryHelper](self, "queryHelper");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteStore currentFetchToken](self, "currentFetchToken");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "executeFetchRequest:delegate:delegateToken:", v6, v7, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNAutocompleteStore currentFetchToken](self, "currentFetchToken");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addCancelable:", v16);

  }
  else
  {
    CNALoggingContextDebug();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v29 = v6;
      v30 = 2112;
      v31 = v12;
      _os_log_impl(&dword_1B9950000, v18, OS_LOG_TYPE_DEFAULT, "Fetch request is not valid: %@, error:%@, stopping.", buf, 0x16u);
    }

    -[CNAutocompleteStore scheduler](self, "scheduler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __52__CNAutocompleteStore_executeFetchRequest_delegate___block_invoke;
    v23[3] = &unk_1E70DEF28;
    v24 = v7;
    v25 = v10;
    v26 = v12;
    v20 = (id)objc_msgSend(v19, "afterDelay:performBlock:", v23, 0.0);

    v16 = v24;
  }

  -[CNAutocompleteStore currentFetchToken](self, "currentFetchToken");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

uint64_t __52__CNAutocompleteStore_executeFetchRequest_delegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "autocompleteFetch:didFailWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)userSelectedResult:(id)a3 atSortedIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  -[CNAutocompleteStore userSession](self, "userSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didSelectResult:atSortedIndex:", v6, a4);

  -[CNAutocompleteStore reproStringRecorder](self, "reproStringRecorder");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clear");

}

- (void)ignoreResult:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "ignoreResultBlock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CNAutocompleteStore scheduler](self, "scheduler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __54__CNAutocompleteStore_ignoreResult_completionHandler___block_invoke;
    v10[3] = &unk_1E70DEFA0;
    v11 = v6;
    v12 = v7;
    objc_msgSend(v9, "performBlock:", v10);

  }
  else if (v7)
  {
    (*((void (**)(id, uint64_t, _QWORD))v7 + 2))(v7, 1, 0);
  }

}

void __54__CNAutocompleteStore_ignoreResult_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t (**v2)(_QWORD, _QWORD);
  uint64_t v3;
  id v4;
  uint64_t v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "ignoreResultBlock");
  v2 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v3 = ((uint64_t (**)(_QWORD, id *))v2)[2](v2, &v6);
  v4 = v6;

  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, v3, v4);

}

- (double)fetchCoalescingInterval
{
  return self->_fetchCoalescingInterval;
}

- (void)setFetchCoalescingInterval:(double)a3
{
  self->_fetchCoalescingInterval = a3;
}

- (CNAutocompleteStoreQueryHelper)queryHelper
{
  return self->_queryHelper;
}

- (CNCancelationToken)currentFetchToken
{
  return (CNCancelationToken *)objc_loadWeakRetained((id *)&self->_currentFetchToken);
}

- (void)setCurrentFetchToken:(id)a3
{
  objc_storeWeak((id *)&self->_currentFetchToken, a3);
}

- (CNAutocompleteUserSession)userSession
{
  return self->_userSession;
}

- (void)setUserSession:(id)a3
{
  objc_storeStrong((id *)&self->_userSession, a3);
}

- (CNAutocompleteStoreReproStringRecorder)reproStringRecorder
{
  return self->_reproStringRecorder;
}

- (void)setReproStringRecorder:(id)a3
{
  objc_storeStrong((id *)&self->_reproStringRecorder, a3);
}

- (CNAutocompleteProbeProvider)probeProvider
{
  return self->_probeProvider;
}

- (CNScheduler)scheduler
{
  return self->_scheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_probeProvider, 0);
  objc_storeStrong((id *)&self->_reproStringRecorder, 0);
  objc_storeStrong((id *)&self->_userSession, 0);
  objc_destroyWeak((id *)&self->_currentFetchToken);
  objc_storeStrong((id *)&self->_queryHelper, 0);
}

void __63__CNAutocompleteStore_executeFetchRequest_afterDelay_delegate___block_invoke_2_cold_1()
{
  __assert_rtn("-[CNAutocompleteStore executeFetchRequest:afterDelay:delegate:]_block_invoke_2", "CNAutocompleteStore.m", 122, "queryToken != self.currentFetchToken");
}

@end
