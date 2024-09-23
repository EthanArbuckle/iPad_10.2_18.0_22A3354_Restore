@implementation CNAutocompleteStoreQueryHelper

- (CNAutocompleteStoreQueryHelper)initWithSearchProvider:(id)a3 delegate:(id)a4 probeProvider:(id)a5 scheduler:(id)a6 userSession:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  CNAutocompleteStoreQueryHelper *v18;
  CNAutocompleteStoreQueryHelper *v19;
  CNAutocompleteStoreQueryContext *v20;
  CNAutocompleteStoreQueryContext *queryContext;
  CNAutocompleteStoreQueryHelper *v22;
  objc_super v24;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v24.receiver = self;
  v24.super_class = (Class)CNAutocompleteStoreQueryHelper;
  v18 = -[CNAutocompleteStoreQueryHelper init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_searchProvider, a3);
    objc_storeWeak((id *)&v19->_delegate, v14);
    v20 = objc_alloc_init(CNAutocompleteStoreQueryContext);
    queryContext = v19->_queryContext;
    v19->_queryContext = v20;

    objc_storeStrong((id *)&v19->_probeProvider, a5);
    objc_storeStrong((id *)&v19->_scheduler, a6);
    objc_storeStrong((id *)&v19->_userSession, a7);
    v22 = v19;
  }

  return v19;
}

- (id)executeFetchRequest:(id)a3 delegate:(id)a4 delegateToken:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    -[CNAutocompleteStoreQueryHelper delegate](self, "delegate");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;
  -[CNAutocompleteStoreQueryHelper searchProvider](self, "searchProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteStoreQueryHelper probeProvider](self, "probeProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteStoreQueryHelper scheduler](self, "scheduler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteStoreQueryHelper userSession](self, "userSession");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNAutocompleteQuery queryWithRequest:searchProvider:delegate:probeProvider:scheduler:userSession:delegateToken:](CNAutocompleteQuery, "queryWithRequest:searchProvider:delegate:probeProvider:scheduler:userSession:delegateToken:", v8, v13, v12, v14, v15, v16, v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  CNALoggingContextDebug();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v17;
    _os_log_impl(&dword_1B9950000, v18, OS_LOG_TYPE_DEFAULT, "Query: %@", buf, 0xCu);
  }

  -[CNAutocompleteStoreQueryHelper queryContext](self, "queryContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "executeWithContext:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (CNAutocompleteSearchProvider)searchProvider
{
  return self->_searchProvider;
}

- (CNAutocompleteFetchDelegate)delegate
{
  return (CNAutocompleteFetchDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (CNScheduler)scheduler
{
  return self->_scheduler;
}

- (CNAutocompleteStoreQueryContext)queryContext
{
  return self->_queryContext;
}

- (CNAutocompleteProbeProvider)probeProvider
{
  return self->_probeProvider;
}

- (CNAutocompleteUserSession)userSession
{
  return self->_userSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userSession, 0);
  objc_storeStrong((id *)&self->_probeProvider, 0);
  objc_storeStrong((id *)&self->_queryContext, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_searchProvider, 0);
}

@end
