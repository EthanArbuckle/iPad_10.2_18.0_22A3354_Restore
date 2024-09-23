@implementation SAClient

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __26__SAClient_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_sSAClient;
}

void __26__SAClient_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sSAClient;
  sharedInstance_sSAClient = v0;

}

- (SAClient)init
{
  SAClient *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *messageQueue;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SAClient;
  v2 = -[SAClient init](&v14, sel_init);
  if (v2)
  {
    sa_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[SAClient init].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

    v11 = dispatch_queue_create("com.apple.SafetyKit.SAClient", 0);
    messageQueue = v2->_messageQueue;
    v2->_messageQueue = (OS_dispatch_queue *)v11;

  }
  return v2;
}

- (void)requestMostRecentCrashDetectionEvent
{
  OUTLINED_FUNCTION_0_0(&dword_23457A000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __48__SAClient_requestMostRecentCrashDetectionEvent__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "serverProxy");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "requestMostRecentCrashDetectionEvent");

}

- (void)requestCrashDetectionAuthorization:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SAClient *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  id authenticationRequestHandler;
  NSObject *messageQueue;
  _QWORD block[5];
  id v20;
  id location;

  v4 = (void (**)(id, _QWORD, void *))a3;
  sa_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SAClient requestCrashDetectionAuthorization:].cold.2(v5, v6, v7, v8, v9, v10, v11, v12);

  v13 = self;
  objc_sync_enter(v13);
  if (v13->_authenticationRequestHandler)
  {
    sa_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SAClient requestCrashDetectionAuthorization:].cold.1(v14);

    +[SAError errorWithCode:](SAError, "errorWithCode:", 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v15);

  }
  else
  {
    v16 = MEMORY[0x234940A48](v4);
    authenticationRequestHandler = v13->_authenticationRequestHandler;
    v13->_authenticationRequestHandler = (id)v16;

    objc_initWeak(&location, v13);
    messageQueue = v13->_messageQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __47__SAClient_requestCrashDetectionAuthorization___block_invoke;
    block[3] = &unk_2505B3618;
    block[4] = v13;
    objc_copyWeak(&v20, &location);
    dispatch_async(messageQueue, block);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v13);

}

void __47__SAClient_requestCrashDetectionAuthorization___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "serverProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __47__SAClient_requestCrashDetectionAuthorization___block_invoke_2;
  v3[3] = &unk_2505B35F0;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  objc_msgSend(v2, "requestCrashDetectionAuthorization:", v3);

  objc_destroyWeak(&v4);
}

void __47__SAClient_requestCrashDetectionAuthorization___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id *v4;
  id v5;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "callAuthenticationRequestHandlerWithStatus:error:", a2, v5);

}

- (void)callAuthenticationRequestHandlerWithError
{
  id v3;

  +[SAError errorWithCode:](SAError, "errorWithCode:", 4);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SAClient callAuthenticationRequestHandlerWithStatus:error:](self, "callAuthenticationRequestHandlerWithStatus:error:", 0, v3);

}

- (void)callAuthenticationRequestHandlerWithStatus:(int64_t)a3 error:(id)a4
{
  SAClient *v6;
  void (**authenticationRequestHandler)(id, int64_t, id);
  id v8;
  id v9;

  v9 = a4;
  v6 = self;
  objc_sync_enter(v6);
  authenticationRequestHandler = (void (**)(id, int64_t, id))v6->_authenticationRequestHandler;
  if (authenticationRequestHandler)
  {
    authenticationRequestHandler[2](authenticationRequestHandler, a3, v9);
    v8 = v6->_authenticationRequestHandler;
    v6->_authenticationRequestHandler = 0;

  }
  objc_sync_exit(v6);

}

- (void)updateMostRecentCrashDetectionEvent:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;

  v4 = a3;
  sa_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SAClient updateMostRecentCrashDetectionEvent:].cold.2();

  if (v4)
  {
    -[SAClient crashDetectionClientDelegate](self, "crashDetectionClientDelegate");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject updateMostRecentCrashDetectionEvent:](v6, "updateMostRecentCrashDetectionEvent:", v4);
  }
  else
  {
    sa_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SAClient updateMostRecentCrashDetectionEvent:].cold.1(v6);
  }

}

- (void)dialVoiceCallToPhoneNumber:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *messageQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  sa_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[SAClient dialVoiceCallToPhoneNumber:completionHandler:].cold.1();

  messageQueue = self->_messageQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__SAClient_dialVoiceCallToPhoneNumber_completionHandler___block_invoke;
  block[3] = &unk_2505B3640;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(messageQueue, block);

}

void __57__SAClient_dialVoiceCallToPhoneNumber_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "serverProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dialVoiceCallToPhoneNumber:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)updateVoiceCallStatus:(int64_t)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  sa_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SAClient updateVoiceCallStatus:].cold.1(a3, v5, v6, v7, v8, v9, v10, v11);

  -[SAClient emergencyResponseClientDelegate](self, "emergencyResponseClientDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateVoiceCallStatus:", a3);

}

- (id)serverProxy
{
  void *v3;
  void *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_messageQueue);
  -[SAClient connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __23__SAClient_serverProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  sa_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __23__SAClient_serverProxy__block_invoke_cold_1();

}

- (void)setConnection:(id)a3
{
  NSXPCConnection *v5;
  NSXPCConnection **p_connection;
  NSXPCConnection *connection;
  NSXPCConnection *v8;

  v8 = (NSXPCConnection *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_messageQueue);
  connection = self->_connection;
  p_connection = &self->_connection;
  v5 = connection;
  if (connection != v8)
  {
    if (v5)
    {
      -[NSXPCConnection invalidate](v5, "invalidate");
      -[NSXPCConnection setInvalidationHandler:](*p_connection, "setInvalidationHandler:", 0);
      -[NSXPCConnection setInterruptionHandler:](*p_connection, "setInterruptionHandler:", 0);
    }
    objc_storeStrong((id *)p_connection, a3);
  }

}

- (NSXPCConnection)connection
{
  NSXPCConnection *connection;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSXPCConnection *v12;
  NSXPCConnection *v13;
  NSXPCConnection *v14;
  void *v15;
  NSXPCConnection *v16;
  void *v17;
  uint64_t v18;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_messageQueue);
  connection = self->_connection;
  if (!connection)
  {
    sa_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[SAClient connection].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

    v12 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.SafetyKit"), 4096);
    v13 = self->_connection;
    self->_connection = v12;

    v14 = self->_connection;
    SAServerInterface();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v14, "setRemoteObjectInterface:", v15);

    v16 = self->_connection;
    SAClientInterface();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v16, "setExportedInterface:", v17);

    -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
    objc_initWeak(&location, self);
    v18 = MEMORY[0x24BDAC760];
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __22__SAClient_connection__block_invoke;
    v22[3] = &unk_2505B3500;
    objc_copyWeak(&v23, &location);
    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", v22);
    v20[0] = v18;
    v20[1] = 3221225472;
    v20[2] = __22__SAClient_connection__block_invoke_5;
    v20[3] = &unk_2505B3500;
    objc_copyWeak(&v21, &location);
    -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", v20);
    -[NSXPCConnection resume](self->_connection, "resume");
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  return connection;
}

void __22__SAClient_connection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  sa_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_23457A000, v2, OS_LOG_TYPE_DEFAULT, "SA server connection interrupted", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "callAuthenticationRequestHandlerWithError");
  objc_msgSend(WeakRetained, "requestMostRecentCrashDetectionEvent");

}

void __22__SAClient_connection__block_invoke_5(uint64_t a1)
{
  NSObject *v2;
  _QWORD *WeakRetained;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  sa_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23457A000, v2, OS_LOG_TYPE_DEFAULT, "SA server connection invalidated", buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained[1];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __22__SAClient_connection__block_invoke_6;
  block[3] = &unk_2505B35C8;
  block[4] = WeakRetained;
  dispatch_async(v4, block);

}

uint64_t __22__SAClient_connection__block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setConnection:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "callAuthenticationRequestHandlerWithError");
}

- (SACrashDetectionClientProtocol)crashDetectionClientDelegate
{
  return (SACrashDetectionClientProtocol *)objc_loadWeakRetained((id *)&self->_crashDetectionClientDelegate);
}

- (void)setCrashDetectionClientDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_crashDetectionClientDelegate, a3);
}

- (SAEmergencyResponseClientProtocol)emergencyResponseClientDelegate
{
  return (SAEmergencyResponseClientProtocol *)objc_loadWeakRetained((id *)&self->_emergencyResponseClientDelegate);
}

- (void)setEmergencyResponseClientDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_emergencyResponseClientDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_emergencyResponseClientDelegate);
  objc_destroyWeak((id *)&self->_crashDetectionClientDelegate);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_authenticationRequestHandler, 0);
  objc_storeStrong((id *)&self->_messageQueue, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_0_0(&dword_23457A000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)requestCrashDetectionAuthorization:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[SAClient requestCrashDetectionAuthorization:]";
  _os_log_error_impl(&dword_23457A000, log, OS_LOG_TYPE_ERROR, "%s - Unable to request authorization because there is already an active request.", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)requestCrashDetectionAuthorization:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_23457A000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)updateMostRecentCrashDetectionEvent:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23457A000, log, OS_LOG_TYPE_ERROR, "Received malformed message from server for updateMostRecentCrashDetectionEvent: event should never be nil.", v1, 2u);
}

- (void)updateMostRecentCrashDetectionEvent:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_23457A000, v0, v1, "%s, event: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)dialVoiceCallToPhoneNumber:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_23457A000, v0, v1, "%s, phoneNumber: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)updateVoiceCallStatus:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_23457A000, a2, a3, "%s, status: %lu", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __23__SAClient_serverProxy__block_invoke_cold_1()
{
  os_log_t v0;
  int v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_23457A000, v0, OS_LOG_TYPE_ERROR, "%s - unable to get serverProxy, error: %@", (uint8_t *)v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)connection
{
  OUTLINED_FUNCTION_0_0(&dword_23457A000, a1, a3, "%s - Creating New SAClient Connection", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
