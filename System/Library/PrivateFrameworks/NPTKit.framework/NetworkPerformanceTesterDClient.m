@implementation NetworkPerformanceTesterDClient

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  return (id)sharedInstance;
}

void __49__NetworkPerformanceTesterDClient_sharedInstance__block_invoke()
{
  NetworkPerformanceTesterDClient *v0;
  void *v1;

  v0 = objc_alloc_init(NetworkPerformanceTesterDClient);
  v1 = (void *)sharedInstance;
  sharedInstance = (uint64_t)v0;

}

- (NetworkPerformanceTesterDClient)init
{
  NetworkPerformanceTesterDClient *v2;
  void *v3;
  uint64_t v4;
  NSXPCConnection *connection;
  uint64_t v6;
  NPTDServices *server;
  NetworkPerformanceTesterDClient *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NetworkPerformanceTesterDClient;
  v2 = -[NetworkPerformanceTesterDClient init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254A42C10);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.internal.networkperformancetesterd"), 0);
    connection = v2->connection;
    v2->connection = (NSXPCConnection *)v4;

    -[NSXPCConnection setRemoteObjectInterface:](v2->connection, "setRemoteObjectInterface:", v3);
    -[NSXPCConnection setInterruptionHandler:](v2->connection, "setInterruptionHandler:", &__block_literal_global_11);
    -[NSXPCConnection setInvalidationHandler:](v2->connection, "setInvalidationHandler:", &__block_literal_global_14);
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](v2->connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_18);
    v6 = objc_claimAutoreleasedReturnValue();
    server = v2->server;
    v2->server = (NPTDServices *)v6;

    -[NSXPCConnection resume](v2->connection, "resume");
    v8 = v2;

  }
  return v2;
}

void __39__NetworkPerformanceTesterDClient_init__block_invoke()
{
  NSLog(CFSTR("Interrupted"));
}

void __39__NetworkPerformanceTesterDClient_init__block_invoke_2()
{
  NSLog(CFSTR("Invalidated"));
}

void __39__NetworkPerformanceTesterDClient_init__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  +[NPTDLogger client](NPTDLogger, "client");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v2, "localizedDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedFailureReason");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412802;
    v7 = CFSTR("Error on remote object proxy");
    v8 = 2112;
    v9 = v4;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_20E71B000, v3, OS_LOG_TYPE_DEFAULT, "%@: %@ %@\n", (uint8_t *)&v6, 0x20u);

  }
}

- (void)getPrivilegedFileHandleForPath:(id)a3 completionHandler:(id)a4
{
  id v6;
  NPTDServices *server;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  server = self->server;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __84__NetworkPerformanceTesterDClient_getPrivilegedFileHandleForPath_completionHandler___block_invoke;
  v9[3] = &unk_24C991080;
  v10 = v6;
  v8 = v6;
  -[NPTDServices getPrivilegedFileHandleForPath:completionHandler:](server, "getPrivilegedFileHandleForPath:completionHandler:", a3, v9);

}

uint64_t __84__NetworkPerformanceTesterDClient_getPrivilegedFileHandleForPath_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)getPrivilegedFileHandleForPacketCapture:(id)a3
{
  id v4;
  NPTDServices *server;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  server = self->server;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __75__NetworkPerformanceTesterDClient_getPrivilegedFileHandleForPacketCapture___block_invoke;
  v7[3] = &unk_24C991080;
  v8 = v4;
  v6 = v4;
  -[NPTDServices getPrivilegedFileHandleForPacketCapture:](server, "getPrivilegedFileHandleForPacketCapture:", v7);

}

uint64_t __75__NetworkPerformanceTesterDClient_getPrivilegedFileHandleForPacketCapture___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)testServiceWithArguments:(id)a3 completionHandler:(id)a4
{
  id v6;
  NPTDServices *server;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  server = self->server;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __78__NetworkPerformanceTesterDClient_testServiceWithArguments_completionHandler___block_invoke;
  v9[3] = &unk_24C9910A8;
  v10 = v6;
  v8 = v6;
  -[NPTDServices testServiceWithArguments:completionHandler:](server, "testServiceWithArguments:completionHandler:", a3, v9);

}

uint64_t __78__NetworkPerformanceTesterDClient_testServiceWithArguments_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->server, 0);
  objc_storeStrong((id *)&self->connection, 0);
}

@end
