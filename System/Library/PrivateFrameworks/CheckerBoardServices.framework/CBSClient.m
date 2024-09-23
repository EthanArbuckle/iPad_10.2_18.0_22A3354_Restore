@implementation CBSClient

+ (id)defaultClient
{
  if (defaultClient_onceToken != -1)
    dispatch_once(&defaultClient_onceToken, &__block_literal_global_1);
  return (id)defaultClient_singleton;
}

void __26__CBSClient_defaultClient__block_invoke()
{
  CBSClient *v0;
  void *v1;

  v0 = objc_alloc_init(CBSClient);
  v1 = (void *)defaultClient_singleton;
  defaultClient_singleton = (uint64_t)v0;

}

- (CBSClient)init
{
  CBSClient *v2;
  uint64_t v3;
  NSXPCConnection *connection;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CBSClient;
  v2 = -[CBSClient init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.CheckerBoard.services"), 4096);
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v3;

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255E12500);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_connection, "setRemoteObjectInterface:", v5);

    -[NSXPCConnection setInterruptionHandler:](v2->_connection, "setInterruptionHandler:", &__block_literal_global_91);
    -[NSXPCConnection setInvalidationHandler:](v2->_connection, "setInvalidationHandler:", &__block_literal_global_93);
    -[NSXPCConnection resume](v2->_connection, "resume");
  }
  return v2;
}

void __17__CBSClient_init__block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  CheckerBoardLogHandleForCategory(5);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __17__CBSClient_init__block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

void __17__CBSClient_init__block_invoke_92()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  CheckerBoardLogHandleForCategory(5);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __17__CBSClient_init__block_invoke_92_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

- (id)remoteAlertServer
{
  void *v2;
  void *v3;

  -[CBSClient connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_95);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __30__CBSClient_remoteAlertServer__block_invoke(uint64_t a1, void *a2)
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
  CheckerBoardLogHandleForCategory(5);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __30__CBSClient_remoteAlertServer__block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

- (id)systemServicesServer
{
  void *v2;
  void *v3;

  -[CBSClient connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_96);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __33__CBSClient_systemServicesServer__block_invoke(uint64_t a1, void *a2)
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
  CheckerBoardLogHandleForCategory(5);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __30__CBSClient_remoteAlertServer__block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

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

void __17__CBSClient_init__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_22F698000, a1, a3, "XPC INTERRUPTION ERROR", a5, a6, a7, a8, 0);
}

void __17__CBSClient_init__block_invoke_92_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_22F698000, a1, a3, "XPC INVALIDATION ERROR", a5, a6, a7, a8, 0);
}

void __30__CBSClient_remoteAlertServer__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22F698000, a2, a3, "XPC CONNECTION ERROR: %@", a5, a6, a7, a8, 2u);
}

@end
