@implementation CARSessionRequestClient

- (NSXPCConnection)serviceConnection
{
  NSXPCConnection *serviceConnection;
  NSXPCConnection *v4;
  void *v5;
  NSXPCConnection *v6;

  serviceConnection = self->_serviceConnection;
  if (!serviceConnection)
  {
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.carkit.sessionRequestHandler"), 4096);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE9A0D38);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v4, "setRemoteObjectInterface:", v5);
    -[NSXPCConnection setInvalidationHandler:](v4, "setInvalidationHandler:", &__block_literal_global_9);
    -[NSXPCConnection resume](v4, "resume");
    v6 = self->_serviceConnection;
    self->_serviceConnection = v4;

    serviceConnection = self->_serviceConnection;
  }
  return serviceConnection;
}

void __44__CARSessionRequestClient_serviceConnection__block_invoke()
{
  NSObject *v0;

  CarGeneralLogging();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __44__CARSessionRequestClient_serviceConnection__block_invoke_cold_1(v0);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CARSessionRequestClient serviceConnection](self, "serviceConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)CARSessionRequestClient;
  -[CARSessionRequestClient dealloc](&v4, sel_dealloc);
}

- (void)startSessionWithHost:(id)a3 requestIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  CarGeneralLogging();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_1A83A2000, v11, OS_LOG_TYPE_DEFAULT, "starting session with host %@, requestID: %@", buf, 0x16u);
  }

  -[CARSessionRequestClient serviceConnection](self, "serviceConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_29_0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__CARSessionRequestClient_startSessionWithHost_requestIdentifier_completion___block_invoke_30;
  v15[3] = &unk_1E5428618;
  v16 = v10;
  v14 = v10;
  objc_msgSend(v13, "service_startSessionWithHost:requestIdentifier:reply:", v8, v9, v15);

}

void __77__CARSessionRequestClient_startSessionWithHost_requestIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  CarGeneralLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __77__CARSessionRequestClient_startSessionWithHost_requestIdentifier_completion___block_invoke_cold_1();

}

uint64_t __77__CARSessionRequestClient_startSessionWithHost_requestIdentifier_completion___block_invoke_30(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)stoppedSessionForHostIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CarGeneralLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_1A83A2000, v5, OS_LOG_TYPE_DEFAULT, "stopped session with host ID %@", (uint8_t *)&v8, 0xCu);
  }

  -[CARSessionRequestClient serviceConnection](self, "serviceConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_32);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "service_stoppedSessionWithHostIdentifier:reply:", v4, &__block_literal_global_34);
}

void __59__CARSessionRequestClient_stoppedSessionForHostIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  CarGeneralLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __77__CARSessionRequestClient_startSessionWithHost_requestIdentifier_completion___block_invoke_cold_1();

}

- (void)startAdvertisingCarPlayControlForUSB
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  CarGeneralLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A83A2000, v3, OS_LOG_TYPE_DEFAULT, "starting CarPlay Control advertising over USB", v6, 2u);
  }

  -[CARSessionRequestClient serviceConnection](self, "serviceConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_35);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "service_startAdvertisingCarPlayControlForUSBWithReply:", &__block_literal_global_37);
}

void __63__CARSessionRequestClient_startAdvertisingCarPlayControlForUSB__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  CarGeneralLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __77__CARSessionRequestClient_startSessionWithHost_requestIdentifier_completion___block_invoke_cold_1();

}

- (void)startAdvertisingCarPlayControlForWiFiUUID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CarGeneralLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_1A83A2000, v5, OS_LOG_TYPE_DEFAULT, "starting CarPlay Control advertising for Wi-Fi UUID: %@", (uint8_t *)&v8, 0xCu);
  }

  -[CARSessionRequestClient serviceConnection](self, "serviceConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_38);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "service_startAdvertisingCarPlayControlForWiFiUUID:reply:", v4, &__block_literal_global_40);
}

void __69__CARSessionRequestClient_startAdvertisingCarPlayControlForWiFiUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  CarGeneralLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __77__CARSessionRequestClient_startSessionWithHost_requestIdentifier_completion___block_invoke_cold_1();

}

- (void)prepareForRemovingWiFiUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  CarGeneralLogging();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v6;
    _os_log_impl(&dword_1A83A2000, v8, OS_LOG_TYPE_DEFAULT, "preparing to remove Wi-Fi UUID: %@", buf, 0xCu);
  }

  -[CARSessionRequestClient serviceConnection](self, "serviceConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_41);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__CARSessionRequestClient_prepareForRemovingWiFiUUID_completion___block_invoke_42;
  v12[3] = &unk_1E5428618;
  v13 = v7;
  v11 = v7;
  objc_msgSend(v10, "service_prepareForRemovingWiFiUUID:reply:", v6, v12);

}

void __65__CARSessionRequestClient_prepareForRemovingWiFiUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  CarGeneralLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __77__CARSessionRequestClient_startSessionWithHost_requestIdentifier_completion___block_invoke_cold_1();

}

uint64_t __65__CARSessionRequestClient_prepareForRemovingWiFiUUID_completion___block_invoke_42(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)cancelRequests
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  CarGeneralLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A83A2000, v3, OS_LOG_TYPE_DEFAULT, "cancelling CARSessionRequests", v6, 2u);
  }

  -[CARSessionRequestClient serviceConnection](self, "serviceConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_43);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "service_cancelRequestsWithReply:", &__block_literal_global_45);
}

void __41__CARSessionRequestClient_cancelRequests__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  CarGeneralLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __77__CARSessionRequestClient_startSessionWithHost_requestIdentifier_completion___block_invoke_cold_1();

}

- (void)setServiceConnection:(id)a3
{
  objc_storeStrong((id *)&self->_serviceConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceConnection, 0);
}

void __44__CARSessionRequestClient_serviceConnection__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A83A2000, log, OS_LOG_TYPE_ERROR, "invalidated connection to CARSessionRequestService", v1, 2u);
}

void __77__CARSessionRequestClient_startSessionWithHost_requestIdentifier_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A83A2000, v0, v1, "failed to message CARSessionRequestService: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
