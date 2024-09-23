@implementation VSIdentityProviderUserAccountFetchOperation

- (VSIdentityProviderUserAccountFetchOperation)initWithIdentityProvider:(id)a3
{
  id v5;
  VSIdentityProviderUserAccountFetchOperation *v6;
  VSIdentityProviderUserAccountFetchOperation *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  NSOperationQueue *privateQueue;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VSIdentityProviderUserAccountFetchOperation;
  v6 = -[VSIdentityProviderUserAccountFetchOperation init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_provider, a3);
    v8 = (void *)MEMORY[0x1E0CB3828];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "queueWithName:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    privateQueue = v7->_privateQueue;
    v7->_privateQueue = (NSOperationQueue *)v11;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v7->_privateQueue, "setMaxConcurrentOperationCount:", 1);
  }

  return v7;
}

- (void)executionDidBegin
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  VSUserAccountServiceConnection *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  _QWORD v23[5];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[VSIdentityProviderUserAccountFetchOperation provider](self, "provider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v19 = v2;
  objc_msgSend(v2, "nonChannelAppDescriptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    v8 = *MEMORY[0x1E0C99778];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v10, "bundleID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v8, CFSTR("The [appDescription bundleID] parameter must not be nil."));
        objc_msgSend(v10, "bundleID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v12);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v6);
  }

  v13 = objc_alloc_init(VSUserAccountServiceConnection);
  v14 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __64__VSIdentityProviderUserAccountFetchOperation_executionDidBegin__block_invoke;
  v23[3] = &unk_1E939ED90;
  v23[4] = self;
  -[VSUserAccountServiceConnection serviceWithErrorHandler:](v13, "serviceWithErrorHandler:", v23);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v14;
  v20[1] = 3221225472;
  v20[2] = __64__VSIdentityProviderUserAccountFetchOperation_executionDidBegin__block_invoke_5;
  v20[3] = &unk_1E93A0848;
  v20[4] = self;
  v21 = v19;
  v22 = v3;
  v16 = v3;
  v17 = v19;
  objc_msgSend(v15, "queryUserAccountsWithOptions:completion:", 0, v20);

}

void __64__VSIdentityProviderUserAccountFetchOperation_executionDidBegin__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  VSErrorLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __65__VSIdentityProviderUserAccountUpdateOperation_executionDidBegin__block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  objc_msgSend(*(id *)(a1 + 32), "setError:", v3);
  objc_msgSend(*(id *)(a1 + 32), "finishExecutionIfPossible");

}

void __64__VSIdentityProviderUserAccountFetchOperation_executionDidBegin__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  int v24;
  int v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    VSErrorLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __64__VSIdentityProviderUserAccountFetchOperation_executionDidBegin__block_invoke_5_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

    objc_msgSend(*(id *)(a1 + 32), "setError:", v6);
    objc_msgSend(*(id *)(a1 + 32), "finishExecutionIfPossible");
  }
  else
  {
    v29 = a1;
    objc_msgSend(*(id *)(a1 + 40), "providerID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "forceUnwrapObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v28 = v5;
    v17 = v5;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v31 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          if (objc_msgSend(v22, "sourceType") == 2)
          {
            objc_msgSend(v22, "sourceIdentifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "isEqual:", v15);

          }
          else
          {
            v24 = 0;
          }
          if (objc_msgSend(v22, "sourceType"))
          {
            v25 = 0;
          }
          else
          {
            v26 = *(void **)(v29 + 48);
            objc_msgSend(v22, "sourceIdentifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v26, "containsObject:", v27);

          }
          if ((v24 | v25) == 1)
            objc_msgSend(v16, "addObject:", v22);
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v19);
    }

    objc_msgSend(*(id *)(v29 + 32), "setResults:", v16);
    objc_msgSend(*(id *)(v29 + 32), "finishExecutionIfPossible");

    v6 = 0;
    v5 = v28;
  }

}

- (VSIdentityProvider)provider
{
  return self->_provider;
}

- (NSArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_privateQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_provider, 0);
}

void __64__VSIdentityProviderUserAccountFetchOperation_executionDidBegin__block_invoke_5_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D2419000, a2, a3, "Error fetching user accounts: %@", a5, a6, a7, a8, 2u);
}

@end
