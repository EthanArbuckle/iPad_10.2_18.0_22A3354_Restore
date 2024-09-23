@implementation VSDeveloperIdentityProviderFetchAllOperation

void __65__VSDeveloperIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  VSDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v2, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1D2419000, v3, OS_LOG_TYPE_DEFAULT, "Did fetch developer %@ identity providers.", (uint8_t *)&v5, 0xCu);

  }
}

void __65__VSDeveloperIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id WeakRetained;

  v3 = a2;
  objc_msgSend(v3, "unwrapObject:error:", &__block_literal_global_33, &__block_literal_global_9_0);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "setResult:", v4);
  objc_msgSend(WeakRetained, "finishExecutionIfPossible");

}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void)executionDidBegin
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[16];
  _QWORD v10[4];
  id v11;
  id location;

  objc_initWeak(&location, self);
  -[VSDeveloperIdentityProviderFetchAllOperation connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__VSDeveloperIdentityProviderFetchAllOperation_executionDidBegin__block_invoke;
  v10[3] = &unk_1E939EE08;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v3, "serviceWithErrorHandler:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  VSDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2419000, v6, OS_LOG_TYPE_DEFAULT, "Will fetch developer identity providers.", buf, 2u);
  }

  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __65__VSDeveloperIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_5;
  v7[3] = &unk_1E93A0598;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v5, "fetchDeveloperIdentityProvidersWithCompletionHandler:", v7);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (VSDeveloperServiceConnection)connection
{
  VSDeveloperIdentityProviderFetchAllOperation *v2;
  VSDeveloperServiceConnection *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_connection;
  if (!v3)
  {
    v3 = objc_alloc_init(VSDeveloperServiceConnection);
    objc_storeStrong((id *)&v2->_connection, v3);
  }
  objc_sync_exit(v2);

  if (!v3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The __orNil parameter must not be nil."));
  return v3;
}

void __65__VSDeveloperIdentityProviderFetchAllOperation_executionDidBegin__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id WeakRetained;
  void *v12;
  void *v13;

  v3 = a2;
  VSErrorLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __65__VSDeveloperIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  +[VSFailable failableWithError:](VSFailable, "failableWithError:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setResult:", v13);

  objc_msgSend(WeakRetained, "finishExecutionIfPossible");
}

void __65__VSDeveloperIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_8(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  VSErrorLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __65__VSDeveloperIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_8_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

- (VSOptional)result
{
  return self->_result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_result, 0);
}

void __65__VSDeveloperIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D2419000, a2, a3, "Error with developer service: %@", a5, a6, a7, a8, 2u);
}

void __65__VSDeveloperIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_8_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D2419000, a2, a3, "Failed to fetch developer identity providers: %@", a5, a6, a7, a8, 2u);
}

@end
