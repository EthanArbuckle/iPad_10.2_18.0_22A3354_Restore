@implementation VSDeveloperSettingsFetchOperation

- (VSDeveloperSettingsFetchOperation)init
{
  VSDeveloperSettingsFetchOperation *v2;
  VSOptional *v3;
  VSOptional *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VSDeveloperSettingsFetchOperation;
  v2 = -[VSDeveloperSettingsFetchOperation init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(VSOptional);
    v4 = v2->_result;
    v2->_result = v3;

  }
  return v2;
}

- (VSDeveloperServiceConnection)connection
{
  VSDeveloperSettingsFetchOperation *v2;
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

- (void)executionDidBegin
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  uint8_t buf[8];
  _QWORD v9[5];

  -[VSDeveloperSettingsFetchOperation connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__VSDeveloperSettingsFetchOperation_executionDidBegin__block_invoke;
  v9[3] = &unk_1E939ED90;
  v9[4] = self;
  objc_msgSend(v3, "serviceWithErrorHandler:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  VSDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2419000, v6, OS_LOG_TYPE_DEFAULT, "Will fetch developer settings.", buf, 2u);
  }

  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __54__VSDeveloperSettingsFetchOperation_executionDidBegin__block_invoke_5;
  v7[3] = &unk_1E939EDB8;
  v7[4] = self;
  objc_msgSend(v5, "fetchDeveloperSettingsWithCompletionHandler:", v7);

}

uint64_t __54__VSDeveloperSettingsFetchOperation_executionDidBegin__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;

  v3 = *(void **)(a1 + 32);
  +[VSFailable failableWithError:](VSFailable, "failableWithError:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setResult:", v5);

  return objc_msgSend(*(id *)(a1 + 32), "finishExecutionIfPossible");
}

uint64_t __54__VSDeveloperSettingsFetchOperation_executionDidBegin__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  objc_msgSend(v3, "unwrapObject:error:", &__block_literal_global_14, &__block_literal_global_8);
  v4 = *(void **)(a1 + 32);
  +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setResult:", v5);
  return objc_msgSend(*(id *)(a1 + 32), "finishExecutionIfPossible");
}

void __54__VSDeveloperSettingsFetchOperation_executionDidBegin__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  VSDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1D2419000, v3, OS_LOG_TYPE_DEFAULT, "Did fetch developer settings %@", (uint8_t *)&v4, 0xCu);
  }

}

void __54__VSDeveloperSettingsFetchOperation_executionDidBegin__block_invoke_7(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  VSErrorLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __54__VSDeveloperSettingsFetchOperation_executionDidBegin__block_invoke_7_cold_1((uint64_t)v2, v3);

}

- (VSOptional)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_result, 0);
}

void __54__VSDeveloperSettingsFetchOperation_executionDidBegin__block_invoke_7_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D2419000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch developer settings: %@", (uint8_t *)&v2, 0xCu);
}

@end
