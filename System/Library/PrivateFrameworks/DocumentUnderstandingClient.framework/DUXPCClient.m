@implementation DUXPCClient

- (DUXPCClient)init
{
  DUXPCClient *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  DUXPCClientHelpers *v8;
  DUXPCClientHelpers *clientHelpers;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)DUXPCClient;
  v2 = -[DUXPCClient init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2569AF918);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x23B853EE8]();
    v5 = objc_alloc(MEMORY[0x24BDBCF20]);
    v6 = objc_opt_class();
    v7 = (void *)objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v4);
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_addOrUpdateSearchableItems_bundleID_completion_, 0, 0);

    v8 = -[DUXPCClientHelpers initWithServiceName:whitelistedServerInterface:clientExportedObject:interruptionHandler:invalidationHandler:]([DUXPCClientHelpers alloc], "initWithServiceName:whitelistedServerInterface:clientExportedObject:interruptionHandler:invalidationHandler:", CFSTR("com.apple.TextUnderstanding.DocumentUnderstandingHarvesting"), v3, v2, &__block_literal_global_0, &__block_literal_global_14);
    clientHelpers = v2->_clientHelpers;
    v2->_clientHelpers = v8;

  }
  return v2;
}

void __19__DUXPCClient_init__block_invoke()
{
  _BOOL8 v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (v0)
    __19__DUXPCClient_init__block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
}

void __19__DUXPCClient_init__block_invoke_13()
{
  int v0;
  const __CFString *v1;
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v0 = 138412290;
    v1 = CFSTR("com.apple.TextUnderstanding.DocumentUnderstandingHarvesting");
    _os_log_impl(&dword_23A6C9000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Connection to %@ invalidated.", (uint8_t *)&v0, 0xCu);
  }
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__DUXPCClient_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken6 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6, block);
  return (id)sharedInstance__pasExprOnceResult;
}

void __29__DUXPCClient_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x23B853EE8]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult;
  sharedInstance__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

- (id)_remoteObjectProxy
{
  return -[DUXPCClientHelpers synchronousRemoteObjectProxyWithErrorHandler:](self->_clientHelpers, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_18);
}

void __33__DUXPCClient__remoteObjectProxy__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __33__DUXPCClient__remoteObjectProxy__block_invoke_cold_1(a2, v3, v4, v5, v6, v7, v8, v9);
}

- (void)addOrUpdateSearchableItems:(id)a3 bundleID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint8_t v12[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_23A6C9000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "DocumentUnderstandingClient initiating call to textunderstandingd - addOrUpdateSearchableItems", v12, 2u);
  }
  -[DUXPCClient _remoteObjectProxy](self, "_remoteObjectProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addOrUpdateSearchableItems:bundleID:completion:", v8, v9, v10);

}

- (void)addSerializedDocument:(id)a3 documentType:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint8_t v11[16];

  v8 = a3;
  v9 = a5;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_23A6C9000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "DocumentUnderstandingClient initiating call to textunderstandingd - addSerializedDocument", v11, 2u);
  }
  -[DUXPCClient _remoteObjectProxy](self, "_remoteObjectProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSerializedDocument:documentType:completion:", v8, a4, v9);

}

- (void)foundInEventResultWithSerializedDocument:(id)a3 documentType:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint8_t v11[16];

  v8 = a3;
  v9 = a5;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_23A6C9000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "DocumentUnderstandingClient initiating call to textunderstandingd - foundInEventResultWithSerializedDocument", v11, 2u);
  }
  -[DUXPCClient _remoteObjectProxy](self, "_remoteObjectProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "foundInEventResultWithSerializedDocument:documentType:completion:", v8, a4, v9);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientHelpers, 0);
}

void __19__DUXPCClient_init__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_23A6C9000, MEMORY[0x24BDACB70], a3, "Connection to %@ interrupted.", a5, a6, a7, a8, 2u);
}

void __33__DUXPCClient__remoteObjectProxy__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_23A6C9000, MEMORY[0x24BDACB70], a3, "DocumentUnderstandingClient remote call to textunderstandingd error - %@", a5, a6, a7, a8, 2u);
}

@end
