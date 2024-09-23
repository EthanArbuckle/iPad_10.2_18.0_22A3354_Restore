@implementation VSIdentityProviderUserAccountUpdateOperation

- (VSIdentityProviderUserAccountUpdateOperation)initWithIdentityProvider:(id)a3 userAccounts:(id)a4
{
  id v7;
  id v8;
  VSIdentityProviderUserAccountUpdateOperation *v9;
  VSIdentityProviderUserAccountUpdateOperation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VSIdentityProviderUserAccountUpdateOperation;
  v9 = -[VSIdentityProviderUserAccountUpdateOperation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_provider, a3);
    objc_storeStrong((id *)&v10->_userAccounts, a4);
  }

  return v10;
}

- (void)executionDidBegin
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  VSUserAccountServiceConnection *v7;
  void *v8;
  VSWaitGroup *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  VSUserAccountServiceConnection *v16;
  void *v17;
  _QWORD v18[6];
  VSWaitGroup *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[5];
  uint8_t v25[128];
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[VSIdentityProviderUserAccountUpdateOperation userAccounts](self, "userAccounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    VSDefaultLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_msgSend(v3, "count");
      -[VSIdentityProviderUserAccountUpdateOperation provider](self, "provider");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v27 = v5;
      v28 = 2112;
      v29 = v6;
      _os_log_impl(&dword_1D2419000, v4, OS_LOG_TYPE_DEFAULT, "%lu user accounts to write for provider %@", buf, 0x16u);

    }
    v7 = objc_alloc_init(VSUserAccountServiceConnection);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __65__VSIdentityProviderUserAccountUpdateOperation_executionDidBegin__block_invoke;
    v24[3] = &unk_1E939ED90;
    v24[4] = self;
    v16 = v7;
    -[VSUserAccountServiceConnection serviceWithErrorHandler:](v7, "serviceWithErrorHandler:", v24);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(VSWaitGroup);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v17 = v3;
    v10 = v3;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v21;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v14);
          -[VSWaitGroup enter](v9, "enter");
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __65__VSIdentityProviderUserAccountUpdateOperation_executionDidBegin__block_invoke_2;
          v18[3] = &unk_1E93A0A68;
          v18[4] = self;
          v18[5] = v15;
          v19 = v9;
          objc_msgSend(v8, "updateUserAccount:completion:", v15, v18);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v12);
    }

    -[VSWaitGroup waitWithMilliseconds:](v9, "waitWithMilliseconds:", 0);
    -[VSAsyncOperation finishExecutionIfPossible](self, "finishExecutionIfPossible");

    v3 = v17;
  }

}

void __65__VSIdentityProviderUserAccountUpdateOperation_executionDidBegin__block_invoke(uint64_t a1, void *a2)
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

void __65__VSIdentityProviderUserAccountUpdateOperation_executionDidBegin__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    VSErrorLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __65__VSIdentityProviderUserAccountUpdateOperation_executionDidBegin__block_invoke_2_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

    objc_msgSend(*(id *)(a1 + 32), "setError:", v3);
  }
  else
  {
    VSDefaultLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 40);
      v13 = 138412290;
      v14 = v12;
      _os_log_impl(&dword_1D2419000, v11, OS_LOG_TYPE_DEFAULT, "Successfully updated user account for provider: %@", (uint8_t *)&v13, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 48), "leave");

}

- (id)_allowedBundleIDs
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[VSIdentityProviderUserAccountUpdateOperation provider](self, "provider", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nonChannelAppDescriptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    v9 = *MEMORY[0x1E0C99778];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "bundleID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v9, CFSTR("The [appDescription bundleID] parameter must not be nil."));
        objc_msgSend(v11, "bundleID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v13);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v3;
}

- (VSIdentityProvider)provider
{
  return self->_provider;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSArray)userAccounts
{
  return self->_userAccounts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAccounts, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_provider, 0);
}

void __65__VSIdentityProviderUserAccountUpdateOperation_executionDidBegin__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D2419000, a2, a3, "Error with user account service connection: %@", a5, a6, a7, a8, 2u);
}

void __65__VSIdentityProviderUserAccountUpdateOperation_executionDidBegin__block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D2419000, a2, a3, "Error updating user account for provider: %@", a5, a6, a7, a8, 2u);
}

@end
