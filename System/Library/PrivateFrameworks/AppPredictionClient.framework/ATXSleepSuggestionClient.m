@implementation ATXSleepSuggestionClient

- (ATXSleepSuggestionClient)init
{
  ATXSleepSuggestionClient *v2;
  uint64_t v3;
  NSXPCConnection *xpcConnection;
  NSXPCConnection *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ATXSleepSuggestionClient;
  v2 = -[ATXSleepSuggestionClient init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.proactive.sleepSchedule"), 0);
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = (NSXPCConnection *)v3;

    v5 = v2->_xpcConnection;
    ATXSleepSuggestionInterface();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v5, "setRemoteObjectInterface:", v6);

    -[NSXPCConnection setInterruptionHandler:](v2->_xpcConnection, "setInterruptionHandler:", &__block_literal_global_10);
    -[NSXPCConnection setInvalidationHandler:](v2->_xpcConnection, "setInvalidationHandler:", &__block_literal_global_5);
    -[NSXPCConnection resume](v2->_xpcConnection, "resume");
  }
  return v2;
}

void __32__ATXSleepSuggestionClient_init__block_invoke()
{
  NSObject *v0;

  __atxlog_handle_modes();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __32__ATXSleepSuggestionClient_init__block_invoke_cold_1(v0);

}

void __32__ATXSleepSuggestionClient_init__block_invoke_4()
{
  NSObject *v0;
  uint8_t v1[16];

  __atxlog_handle_modes();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A49EF000, v0, OS_LOG_TYPE_INFO, "ATXSleepSuggestionClient: invalidation handler called", v1, 2u);
  }

}

- (void)predictedSleepSuggestionWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[ATXSleepSuggestionClient xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__ATXSleepSuggestionClient_predictedSleepSuggestionWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E4D571E0;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predictedSleepSuggestionWithCompletionHandler:", v6);

}

void __74__ATXSleepSuggestionClient_predictedSleepSuggestionWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __atxlog_handle_sleep_schedule();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __74__ATXSleepSuggestionClient_predictedSleepSuggestionWithCompletionHandler___block_invoke_cold_1(v3, v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

void __32__ATXSleepSuggestionClient_init__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A49EF000, log, OS_LOG_TYPE_ERROR, "ATXSleepSuggestionClient: interruption handler called", v1, 2u);
}

void __74__ATXSleepSuggestionClient_predictedSleepSuggestionWithCompletionHandler___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_ERROR, "ATXSleepSuggestionClient: XPC failed: %@", (uint8_t *)&v4, 0xCu);

}

@end
