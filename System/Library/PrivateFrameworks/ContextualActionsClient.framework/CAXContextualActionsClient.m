@implementation CAXContextualActionsClient

- (CAXContextualActionsClient)initWithClientModelId:(id)a3
{
  id v4;
  CAXContextualActionsClient *v5;
  uint64_t v6;
  NSString *clientModelId;
  uint64_t v8;
  NSXPCConnection *xpcConnection;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CAXContextualActionsClient;
  v5 = -[CAXContextualActionsClient init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    clientModelId = v5->_clientModelId;
    v5->_clientModelId = (NSString *)v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.proactive.ContextualActions.xpc"), 0);
    xpcConnection = v5->_xpcConnection;
    v5->_xpcConnection = (NSXPCConnection *)v8;

    CAXContextualActionsXPCInterface();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v5->_xpcConnection, "setRemoteObjectInterface:", v10);

    -[NSXPCConnection setInterruptionHandler:](v5->_xpcConnection, "setInterruptionHandler:", &__block_literal_global);
    -[NSXPCConnection resume](v5->_xpcConnection, "resume");
  }

  return v5;
}

void __52__CAXContextualActionsClient_initWithClientModelId___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  __atxlog_handle_contextual_actions();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2196B3000, v0, OS_LOG_TYPE_DEFAULT, "Connection to Contextual Actions Client Model server interrupted.", v1, 2u);
  }

}

- (void)processShortcutsSessionGivenSummary:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSXPCConnection *xpcConnection;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  __atxlog_handle_contextual_actions();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2196B3000, v8, OS_LOG_TYPE_DEFAULT, "in client - processShortcutsSessionGivenSummary", buf, 2u);
  }

  __atxlog_handle_contextual_actions();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2196B3000, v9, OS_LOG_TYPE_DEFAULT, "in client - processShortcutsSessionGivenSummary: about to enter suggestion receiver", buf, 2u);
  }
  if (!v6)
    v6 = &__block_literal_global_2;

  xpcConnection = self->_xpcConnection;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __77__CAXContextualActionsClient_processShortcutsSessionGivenSummary_completion___block_invoke_3;
  v13[3] = &unk_24DB30AA0;
  v14 = v6;
  v11 = v6;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "processShortcutsSessionGivenSummary:completion:", v7, v11);

}

void __77__CAXContextualActionsClient_processShortcutsSessionGivenSummary_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  __atxlog_handle_contextual_actions();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_2196B3000, v4, OS_LOG_TYPE_DEFAULT, "Error: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)processShortcutsActionSelectionGivenFeedbackEvent:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSXPCConnection *xpcConnection;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = &__block_literal_global_4;
  if (v6)
    v7 = v6;
  xpcConnection = self->_xpcConnection;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __91__CAXContextualActionsClient_processShortcutsActionSelectionGivenFeedbackEvent_completion___block_invoke_2;
  v12[3] = &unk_24DB30AA0;
  v13 = v7;
  v9 = v7;
  v10 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "processShortcutsActionSelectionGivenFeedbackEvent:completion:", v10, v9);

}

void __91__CAXContextualActionsClient_processShortcutsActionSelectionGivenFeedbackEvent_completion___block_invoke_2(uint64_t a1, void *a2)
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
  __atxlog_handle_contextual_actions();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __91__CAXContextualActionsClient_processShortcutsActionSelectionGivenFeedbackEvent_completion___block_invoke_2_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)processShortcutsActionSelectionGivenFeedbackEvent:(id)a3
{
  NSXPCConnection *xpcConnection;
  id v4;
  id v5;

  xpcConnection = self->_xpcConnection;
  v4 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_5);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "processShortcutsActionSelectionGivenFeedbackEvent:", v4);

}

void __80__CAXContextualActionsClient_processShortcutsActionSelectionGivenFeedbackEvent___block_invoke(uint64_t a1, void *a2)
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
  __atxlog_handle_contextual_actions();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __91__CAXContextualActionsClient_processShortcutsActionSelectionGivenFeedbackEvent_completion___block_invoke_2_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

- (void)processShortcutsSessionGivenSummary:(id)a3
{
  NSXPCConnection *xpcConnection;
  id v4;
  id v5;

  xpcConnection = self->_xpcConnection;
  v4 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_6);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "processShortcutsSessionGivenSummary:", v4);

}

void __66__CAXContextualActionsClient_processShortcutsSessionGivenSummary___block_invoke(uint64_t a1, void *a2)
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
  __atxlog_handle_contextual_actions();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __91__CAXContextualActionsClient_processShortcutsActionSelectionGivenFeedbackEvent_completion___block_invoke_2_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CAXContextualActionsClient;
  -[CAXContextualActionsClient dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_clientModelId, 0);
}

void __91__CAXContextualActionsClient_processShortcutsActionSelectionGivenFeedbackEvent_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2196B3000, a2, a3, "Error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
