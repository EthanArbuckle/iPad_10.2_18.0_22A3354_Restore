@implementation CARConnectionTimeStore

- (CARConnectionTimeStore)init
{
  CARConnectionTimeStore *v2;
  CARConnectionTimeStore *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CARConnectionTimeStore;
  v2 = -[CARConnectionTimeStore init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CARConnectionTimeStore _setupConnectionForSystemDaemon:](v2, "_setupConnectionForSystemDaemon:", 0);
  return v3;
}

- (id)initForSystemDaemon
{
  CARConnectionTimeStore *v2;
  CARConnectionTimeStore *v3;
  CARConnectionTimeStore *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CARConnectionTimeStore;
  v2 = -[CARConnectionTimeStore init](&v6, sel_init);
  v3 = v2;
  if (v2 && !-[CARConnectionTimeStore _setupConnectionForSystemDaemon:](v2, "_setupConnectionForSystemDaemon:", 1))
    v4 = 0;
  else
    v4 = v3;

  return v4;
}

+ (id)_CARConnectionServiceInterface
{
  if (_CARConnectionServiceInterface_onceToken != -1)
    dispatch_once(&_CARConnectionServiceInterface_onceToken, &__block_literal_global_8);
  return (id)_CARConnectionServiceInterface___interface;
}

void __56__CARConnectionTimeStore__CARConnectionServiceInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE9AC3D8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_CARConnectionServiceInterface___interface;
  _CARConnectionServiceInterface___interface = v0;

  v2 = (void *)_CARConnectionServiceInterface___interface;
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_fetchConnectionSessions_, 0, 1);

}

- (BOOL)_setupConnectionForSystemDaemon:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSObject *v6;
  BOOL v7;
  void *v8;
  void *v9;
  int v11;

  v3 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.carkit.reconnectiontime.service"), 0);
  if (!v3)
    goto LABEL_7;
  if (xpc_user_sessions_enabled())
  {
    v11 = 0;
    xpc_user_sessions_get_foreground_uid();
    objc_msgSend(v5, "_xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_connection_set_target_user_session_uid();

LABEL_7:
    objc_msgSend((id)objc_opt_class(), "_CARConnectionServiceInterface");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRemoteObjectInterface:", v9);

    objc_msgSend(v5, "resume");
    -[CARConnectionTimeStore setConnection:](self, "setConnection:", v5);
    v7 = 1;
    goto LABEL_8;
  }
  CarConnectionTimeLogging();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    -[CARConnectionTimeStore _setupConnectionForSystemDaemon:].cold.2(v6);

  v7 = 0;
LABEL_8:

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CARConnectionTimeStore;
  -[CARConnectionTimeStore dealloc](&v3, sel_dealloc);
}

- (void)_xpcFetchWithServiceBlock:(id)a3 errorHandler:(id)a4
{
  void (**v6)(id, void *);
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint8_t v12[8];
  _QWORD v13[4];
  id v14;

  v6 = (void (**)(id, void *))a3;
  v7 = a4;
  -[CARConnectionTimeStore connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65__CARConnectionTimeStore__xpcFetchWithServiceBlock_errorHandler___block_invoke;
  v13[3] = &unk_1E5427E30;
  v14 = v7;
  v9 = v7;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    CarConnectionTimeLogging();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1A83A2000, v11, OS_LOG_TYPE_DEFAULT, "CARConnectionTimeStore: Connecting to CarKit Connection Time service", v12, 2u);
    }

    v6[2](v6, v10);
  }

}

void __65__CARConnectionTimeStore__xpcFetchWithServiceBlock_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  CarConnectionTimeLogging();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __65__CARConnectionTimeStore__xpcFetchWithServiceBlock_errorHandler___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v3);

}

- (void)_xpcFetchWithSynchronousServiceBlock:(id)a3 errorHandler:(id)a4
{
  void (**v6)(id, void *);
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint8_t v12[8];
  _QWORD v13[4];
  id v14;

  v6 = (void (**)(id, void *))a3;
  v7 = a4;
  -[CARConnectionTimeStore connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __76__CARConnectionTimeStore__xpcFetchWithSynchronousServiceBlock_errorHandler___block_invoke;
  v13[3] = &unk_1E5427E30;
  v14 = v7;
  v9 = v7;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    CarConnectionTimeLogging();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1A83A2000, v11, OS_LOG_TYPE_DEFAULT, "CARConnectionTimeStore: Connecting to CarKit Connection Time service", v12, 2u);
    }

    v6[2](v6, v10);
  }

}

void __76__CARConnectionTimeStore__xpcFetchWithSynchronousServiceBlock_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  CarConnectionTimeLogging();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __65__CARConnectionTimeStore__xpcFetchWithServiceBlock_errorHandler___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v3);

}

- (void)fetchRecentSessions:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__CARConnectionTimeStore_fetchRecentSessions___block_invoke;
  v9[3] = &unk_1E54285C8;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __46__CARConnectionTimeStore_fetchRecentSessions___block_invoke_2;
  v7[3] = &unk_1E5427E30;
  v8 = v10;
  v6 = v10;
  -[CARConnectionTimeStore _xpcFetchWithServiceBlock:errorHandler:](self, "_xpcFetchWithServiceBlock:errorHandler:", v9, v7);

}

uint64_t __46__CARConnectionTimeStore_fetchRecentSessions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fetchConnectionSessions:", *(_QWORD *)(a1 + 32));
}

void __46__CARConnectionTimeStore_fetchRecentSessions___block_invoke_2(uint64_t a1, void *a2)
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
  if (v3)
  {
    CarConnectionTimeLogging();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __46__CARConnectionTimeStore_fetchRecentSessions___block_invoke_2_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)sendConnectionEvent:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57__CARConnectionTimeStore_sendConnectionEvent_completion___block_invoke;
  v14[3] = &unk_1E54285F0;
  v15 = v6;
  v16 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __57__CARConnectionTimeStore_sendConnectionEvent_completion___block_invoke_195;
  v11[3] = &unk_1E54281E0;
  v12 = v15;
  v13 = v16;
  v9 = v16;
  v10 = v15;
  -[CARConnectionTimeStore _xpcFetchWithServiceBlock:errorHandler:](self, "_xpcFetchWithServiceBlock:errorHandler:", v14, v11);

}

void __57__CARConnectionTimeStore_sendConnectionEvent_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  CarConnectionTimeLogging();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "eventName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_1A83A2000, v4, OS_LOG_TYPE_DEFAULT, "CARConnectionTimeStore sendConnectionEvent: %@", (uint8_t *)&v6, 0xCu);

  }
  objc_msgSend(v3, "recordConnectionEvent:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __57__CARConnectionTimeStore_sendConnectionEvent_completion___block_invoke_195(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  CarConnectionTimeLogging();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __57__CARConnectionTimeStore_sendConnectionEvent_completion___block_invoke_195_cold_1(a1);

  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)syncSendConnectionEvent:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__CARConnectionTimeStore_syncSendConnectionEvent_completion___block_invoke;
  v14[3] = &unk_1E54285F0;
  v15 = v6;
  v16 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __61__CARConnectionTimeStore_syncSendConnectionEvent_completion___block_invoke_196;
  v11[3] = &unk_1E54281E0;
  v12 = v15;
  v13 = v16;
  v9 = v16;
  v10 = v15;
  -[CARConnectionTimeStore _xpcFetchWithSynchronousServiceBlock:errorHandler:](self, "_xpcFetchWithSynchronousServiceBlock:errorHandler:", v14, v11);

}

void __61__CARConnectionTimeStore_syncSendConnectionEvent_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  CarConnectionTimeLogging();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "eventName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_1A83A2000, v4, OS_LOG_TYPE_DEFAULT, "CARConnectionTimeStore syncSendConnectionEvent: %@", (uint8_t *)&v6, 0xCu);

  }
  objc_msgSend(v3, "recordConnectionEvent:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __61__CARConnectionTimeStore_syncSendConnectionEvent_completion___block_invoke_196(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  CarConnectionTimeLogging();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __61__CARConnectionTimeStore_syncSendConnectionEvent_completion___block_invoke_196_cold_1(a1);

  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)clearHistoricalConnectionsWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__CARConnectionTimeStore_clearHistoricalConnectionsWithCompletion___block_invoke;
  v9[3] = &unk_1E54285C8;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __67__CARConnectionTimeStore_clearHistoricalConnectionsWithCompletion___block_invoke_2;
  v7[3] = &unk_1E5427E30;
  v8 = v10;
  v6 = v10;
  -[CARConnectionTimeStore _xpcFetchWithServiceBlock:errorHandler:](self, "_xpcFetchWithServiceBlock:errorHandler:", v9, v7);

}

uint64_t __67__CARConnectionTimeStore_clearHistoricalConnectionsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clearHistoricalConnectionDataWithReply:", *(_QWORD *)(a1 + 32));
}

uint64_t __67__CARConnectionTimeStore_clearHistoricalConnectionsWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)_setupConnectionForSystemDaemon:(int *)a1 .cold.1(int *a1, NSObject *a2)
{
  int v3;
  _DWORD v4[2];
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4[0] = 67109378;
  v4[1] = v3;
  v5 = 2080;
  v6 = xpc_strerror();
  _os_log_fault_impl(&dword_1A83A2000, a2, OS_LOG_TYPE_FAULT, "xpc_user_sessions_get_foreground_uid() failed with error %d - %s", (uint8_t *)v4, 0x12u);
}

- (void)_setupConnectionForSystemDaemon:(os_log_t)log .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A83A2000, log, OS_LOG_TYPE_FAULT, "Cannot setup xpc connection for system daemon when xpc_user_sessions_enabled is false", v1, 2u);
}

void __65__CARConnectionTimeStore__xpcFetchWithServiceBlock_errorHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A83A2000, a2, a3, "CARConnectionTimeStore: CarKit Connection Time service error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __46__CARConnectionTimeStore_fetchRecentSessions___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A83A2000, a2, a3, "CARConnectionTimeStore error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __57__CARConnectionTimeStore_sendConnectionEvent_completion___block_invoke_195_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 32), "eventName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_0(&dword_1A83A2000, v2, v3, "CARConnectionTimeStore failed on sendConnectionEvent: %@ error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_0();
}

void __61__CARConnectionTimeStore_syncSendConnectionEvent_completion___block_invoke_196_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 32), "eventName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_0(&dword_1A83A2000, v2, v3, "CARConnectionTimeStore failed on syncSendConnectionEvent: %@ error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_0();
}

@end
