@implementation ATXSportsClient

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_45);
  return (id)sharedInstance_client;
}

void __33__ATXSportsClient_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_client;
  sharedInstance_client = v0;

}

- (ATXSportsClient)init
{
  ATXSportsClient *v2;
  uint64_t v3;
  NSXPCConnection *connection;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ATXSportsClient;
  v2 = -[ATXSportsClient init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.proactive.sports.xpc"), 0);
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v3;

    ATXSportsInterface();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_connection, "setRemoteObjectInterface:", v5);

    -[NSXPCConnection setInterruptionHandler:](v2->_connection, "setInterruptionHandler:", &__block_literal_global_9_1);
    -[NSXPCConnection setInvalidationHandler:](v2->_connection, "setInvalidationHandler:", &__block_literal_global_11_0);
    -[NSXPCConnection resume](v2->_connection, "resume");
  }
  return v2;
}

void __23__ATXSportsClient_init__block_invoke()
{
  NSObject *v0;

  __atxlog_handle_xpc();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __23__ATXSportsClient_init__block_invoke_cold_1(v0);

}

void __23__ATXSportsClient_init__block_invoke_10()
{
  NSObject *v0;
  uint8_t v1[16];

  __atxlog_handle_xpc();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A49EF000, v0, OS_LOG_TYPE_DEFAULT, "Sports xpc connection invalidated", v1, 2u);
  }

}

- (void)requestedSchedulesForTeamsWithReply:(id)a3
{
  id v4;
  NSXPCConnection *connection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  connection = self->_connection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__ATXSportsClient_requestedSchedulesForTeamsWithReply___block_invoke;
  v8[3] = &unk_1E4D571E0;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestedSchedulesForTeamsWithReply:", v6);

}

void __55__ATXSportsClient_requestedSchedulesForTeamsWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __atxlog_handle_xpc();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __55__ATXSportsClient_requestedSchedulesForTeamsWithReply___block_invoke_cold_1((uint64_t)v3, v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

void __23__ATXSportsClient_init__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A49EF000, log, OS_LOG_TYPE_ERROR, "Sports xpc connection interrupted", v1, 2u);
}

void __55__ATXSportsClient_requestedSchedulesForTeamsWithReply___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[ATXSportsClient requestedSchedulesForTeamsWithReply:]_block_invoke";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_ERROR, "%s: error fetching remote object proxy: %@", (uint8_t *)&v2, 0x16u);
}

@end
