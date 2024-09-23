@implementation ATXSettingsActionsClient

- (ATXSettingsActionsClient)init
{
  ATXSettingsActionsClient *v2;
  uint64_t v3;
  NSXPCConnection *xpcConnection;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ATXSettingsActionsClient;
  v2 = -[ATXSettingsActionsClient init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.duetexpertd.SettingsActions"), 0);
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = (NSXPCConnection *)v3;

    ATXSettingsActionsInterface();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_xpcConnection, "setRemoteObjectInterface:", v5);

    -[NSXPCConnection setExportedObject:](v2->_xpcConnection, "setExportedObject:", v2);
    -[NSXPCConnection setInterruptionHandler:](v2->_xpcConnection, "setInterruptionHandler:", &__block_literal_global_32);
    -[NSXPCConnection setInvalidationHandler:](v2->_xpcConnection, "setInvalidationHandler:", &__block_literal_global_5_0);
    -[NSXPCConnection resume](v2->_xpcConnection, "resume");
  }
  return v2;
}

void __32__ATXSettingsActionsClient_init__block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  __atxlog_handle_settings_actions();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __32__ATXSettingsActionsClient_init__block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

void __32__ATXSettingsActionsClient_init__block_invoke_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  __atxlog_handle_settings_actions();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __32__ATXSettingsActionsClient_init__block_invoke_4_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

- (void)suggestedActionsWithRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  NSXPCConnection *xpcConnection;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  xpcConnection = self->_xpcConnection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __74__ATXSettingsActionsClient_suggestedActionsWithRequest_completionHandler___block_invoke;
  v11[3] = &unk_1E4D571E0;
  v12 = v6;
  v8 = v6;
  v9 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "suggestedActionsWithRequest:completionHandler:", v9, v8);

}

uint64_t __74__ATXSettingsActionsClient_suggestedActionsWithRequest_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)recentActionsWithRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  NSXPCConnection *xpcConnection;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  xpcConnection = self->_xpcConnection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__ATXSettingsActionsClient_recentActionsWithRequest_completionHandler___block_invoke;
  v11[3] = &unk_1E4D571E0;
  v12 = v6;
  v8 = v6;
  v9 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "recentActionsWithRequest:completionHandler:", v9, v8);

}

uint64_t __71__ATXSettingsActionsClient_recentActionsWithRequest_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

void __32__ATXSettingsActionsClient_init__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a1, a3, "%s: Interruption handler called", a5, a6, a7, a8, 2u);
}

void __32__ATXSettingsActionsClient_init__block_invoke_4_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a1, a3, "%s: Invalidation handler called", a5, a6, a7, a8, 2u);
}

@end
