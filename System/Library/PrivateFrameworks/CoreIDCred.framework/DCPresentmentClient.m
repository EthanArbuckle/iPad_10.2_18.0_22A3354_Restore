@implementation DCPresentmentClient

- (DCPresentmentClient)init
{
  NSObject *v3;
  DCPresentmentClient *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  DC_LOG_CLIENT();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[DCPresentmentClient init].cold.2();

  v17.receiver = self;
  v17.super_class = (Class)DCPresentmentClient;
  v4 = -[DCPresentmentClient init](&v17, sel_init);
  if (v4)
  {
    DC_LOG_CLIENT();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[DCPresentmentClient init].cold.1(v5);

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.idcredd.presentment.xpc"), 4096);
    -[DCPresentmentClient setServerConnection:](v4, "setServerConnection:", v6);

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2545FBE80);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DCPresentmentClient serverConnection](v4, "serverConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRemoteObjectInterface:", v7);

    v9 = (void *)MEMORY[0x24BDBCF20];
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DCPresentmentClient serverConnection](v4, "serverConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "remoteObjectInterface");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_interpretRequest_completion_, 0, 1);

    -[DCPresentmentClient serverConnection](v4, "serverConnection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "activate");

  }
  return v4;
}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCPresentmentClient dealloc called", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)configureWithPartitions:(id)a3 presentmentType:(unint64_t)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  DC_LOG_CLIENT();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[DCPresentmentClient configureWithPartitions:presentmentType:options:completion:].cold.1();

  -[DCPresentmentClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __82__DCPresentmentClient_configureWithPartitions_presentmentType_options_completion___block_invoke;
  v16[3] = &unk_24C306050;
  v16[4] = self;
  v17 = v10;
  v15 = v10;
  objc_msgSend(v14, "configureWithPartitions:presentmentType:options:completion:", v12, a4, v11, v16);

}

void __82__DCPresentmentClient_configureWithPartitions_presentmentType_options_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;

  v3 = a2;
  DC_LOG_CLIENT();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
      __82__DCPresentmentClient_configureWithPartitions_presentmentType_options_completion___block_invoke_cold_2();
  }
  else if (v5)
  {
    __82__DCPresentmentClient_configureWithPartitions_presentmentType_options_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)generateTransportKeyForSpecification:(unint64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  DC_LOG_CLIENT();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[DCPresentmentClient generateTransportKeyForSpecification:completion:].cold.1();

  v8 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __71__DCPresentmentClient_generateTransportKeyForSpecification_completion___block_invoke;
  v14[3] = &unk_24C306078;
  v9 = v6;
  v15 = v9;
  -[DCPresentmentClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __71__DCPresentmentClient_generateTransportKeyForSpecification_completion___block_invoke_2;
  v12[3] = &unk_24C3060A0;
  v12[4] = self;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v10, "generateTransportKeyForSpecification:completion:", a3, v12);

}

uint64_t __71__DCPresentmentClient_generateTransportKeyForSpecification_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __71__DCPresentmentClient_generateTransportKeyForSpecification_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;

  v5 = a3;
  v6 = a2;
  DC_LOG_CLIENT();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      __71__DCPresentmentClient_generateTransportKeyForSpecification_completion___block_invoke_2_cold_2();
  }
  else if (v8)
  {
    __71__DCPresentmentClient_generateTransportKeyForSpecification_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)interpretRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = a3;
  DC_LOG_CLIENT();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[DCPresentmentClient interpretRequest:completion:].cold.1();

  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __51__DCPresentmentClient_interpretRequest_completion___block_invoke;
  v15[3] = &unk_24C306078;
  v10 = v6;
  v16 = v10;
  -[DCPresentmentClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __51__DCPresentmentClient_interpretRequest_completion___block_invoke_2;
  v13[3] = &unk_24C3060C8;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "interpretRequest:completion:", v7, v13);

}

uint64_t __51__DCPresentmentClient_interpretRequest_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __51__DCPresentmentClient_interpretRequest_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;

  v5 = a3;
  v6 = a2;
  DC_LOG_CLIENT();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      __51__DCPresentmentClient_interpretRequest_completion___block_invoke_2_cold_2();
  }
  else if (v8)
  {
    __51__DCPresentmentClient_interpretRequest_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)buildResponseForSelection:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = a3;
  DC_LOG_CLIENT();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[DCPresentmentClient buildResponseForSelection:completion:].cold.1();

  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __60__DCPresentmentClient_buildResponseForSelection_completion___block_invoke;
  v15[3] = &unk_24C306078;
  v10 = v6;
  v16 = v10;
  -[DCPresentmentClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __60__DCPresentmentClient_buildResponseForSelection_completion___block_invoke_2;
  v13[3] = &unk_24C3060A0;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "buildResponseForSelection:completion:", v7, v13);

}

uint64_t __60__DCPresentmentClient_buildResponseForSelection_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __60__DCPresentmentClient_buildResponseForSelection_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;

  v5 = a3;
  v6 = a2;
  DC_LOG_CLIENT();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      __60__DCPresentmentClient_buildResponseForSelection_completion___block_invoke_2_cold_2();
  }
  else if (v8)
  {
    __60__DCPresentmentClient_buildResponseForSelection_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)buildCredentialResponseForSelection:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = a3;
  DC_LOG_CLIENT();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[DCPresentmentClient buildCredentialResponseForSelection:completion:].cold.1();

  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __70__DCPresentmentClient_buildCredentialResponseForSelection_completion___block_invoke;
  v15[3] = &unk_24C306078;
  v10 = v6;
  v16 = v10;
  -[DCPresentmentClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __70__DCPresentmentClient_buildCredentialResponseForSelection_completion___block_invoke_2;
  v13[3] = &unk_24C3060F0;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "buildCredentialResponseForSelection:completion:", v7, v13);

}

uint64_t __70__DCPresentmentClient_buildCredentialResponseForSelection_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __70__DCPresentmentClient_buildCredentialResponseForSelection_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;

  v5 = a3;
  v6 = a2;
  DC_LOG_CLIENT();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      __70__DCPresentmentClient_buildCredentialResponseForSelection_completion___block_invoke_2_cold_2();
  }
  else if (v8)
  {
    __70__DCPresentmentClient_buildCredentialResponseForSelection_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)buildErrorResponseWithStatus:(unint64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  DC_LOG_CLIENT();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[DCPresentmentClient buildErrorResponseWithStatus:completion:].cold.1();

  v8 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __63__DCPresentmentClient_buildErrorResponseWithStatus_completion___block_invoke;
  v14[3] = &unk_24C306078;
  v9 = v6;
  v15 = v9;
  -[DCPresentmentClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __63__DCPresentmentClient_buildErrorResponseWithStatus_completion___block_invoke_2;
  v12[3] = &unk_24C3060A0;
  v12[4] = self;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v10, "buildErrorResponseWithStatus:completion:", a3, v12);

}

uint64_t __63__DCPresentmentClient_buildErrorResponseWithStatus_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__DCPresentmentClient_buildErrorResponseWithStatus_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;

  v5 = a3;
  v6 = a2;
  DC_LOG_CLIENT();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      __63__DCPresentmentClient_buildErrorResponseWithStatus_completion___block_invoke_2_cold_2();
  }
  else if (v8)
  {
    __63__DCPresentmentClient_buildErrorResponseWithStatus_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)invalidate
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient invalidate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (id)createDaemonDisconnectedError
{
  return (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("DCPresentmentSession"), -5001, 0);
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[DCPresentmentClient serverConnection](self, "serverConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__DCPresentmentClient_remoteObjectProxyWithErrorHandler___block_invoke;
  v9[3] = &unk_24C306050;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __57__DCPresentmentClient_remoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  DC_LOG_CLIENT();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __57__DCPresentmentClient_remoteObjectProxyWithErrorHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "createDaemonDisconnectedError");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  }
}

- (NSXPCConnection)serverConnection
{
  return self->_serverConnection;
}

- (void)setServerConnection:(id)a3
{
  objc_storeStrong((id *)&self->_serverConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverConnection, 0);
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCPresentmentClient init called", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)configureWithPartitions:presentmentType:options:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCPresentmentClient configure", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __82__DCPresentmentClient_configureWithPartitions_presentmentType_options_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCPresentmentClient configureWithPartitions returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __82__DCPresentmentClient_configureWithPartitions_presentmentType_options_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCPresentmentClient configureWithPartitions returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)generateTransportKeyForSpecification:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCPresentmentClient generateTransportKey", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __71__DCPresentmentClient_generateTransportKeyForSpecification_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCPresentmentClient generateTransportKey returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __71__DCPresentmentClient_generateTransportKeyForSpecification_completion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCPresentmentClient generateTransportKey returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)interpretRequest:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCPresentmentClient interpretRequest", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __51__DCPresentmentClient_interpretRequest_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCPresentmentClient interpretRequest returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __51__DCPresentmentClient_interpretRequest_completion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCPresentmentClient interpretRequest returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)buildResponseForSelection:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCPresentmentClient buildResponseForSelection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __60__DCPresentmentClient_buildResponseForSelection_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCPresentmentClient buildResponseForSelection returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __60__DCPresentmentClient_buildResponseForSelection_completion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCPresentmentClient buildResponseForSelection returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)buildCredentialResponseForSelection:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCPresentmentClient buildCredentialResponseForSelection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __70__DCPresentmentClient_buildCredentialResponseForSelection_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCPresentmentClient buildCredentialResponseForSelection returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __70__DCPresentmentClient_buildCredentialResponseForSelection_completion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCPresentmentClient buildCredentialResponseForSelection returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)buildErrorResponseWithStatus:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCPresentmentClient buildErrorResponseWithStatus", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __63__DCPresentmentClient_buildErrorResponseWithStatus_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCPresentmentClient buildErrorResponseWithStatus returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __63__DCPresentmentClient_buildErrorResponseWithStatus_completion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCPresentmentClient buildErrorResponseWithStatus returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __57__DCPresentmentClient_remoteObjectProxyWithErrorHandler___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_20A40D000, v0, OS_LOG_TYPE_ERROR, "DCPresentmentClient remote object proxy error: %{public}@", v1, 0xCu);
  OUTLINED_FUNCTION_4();
}

@end
