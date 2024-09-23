@implementation DUXPCServerDelegate

- (DUXPCServerDelegate)initWithManager:(id)a3
{
  id v5;
  DUXPCServerDelegate *v6;
  DUXPCServerDelegate *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DUXPCServerDelegate;
  v6 = -[DUXPCServerDelegate init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_textUnderstandingManager, a3);

  return v7;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  DUXPCServerRequestHandler *v13;
  uint64_t v14;
  DUXPCServerRequestHandler *v15;
  void *v16;
  DUXPCServerRequestHandler *v17;
  _QWORD v19[4];
  DUXPCServerRequestHandler *v20;
  _QWORD aBlock[4];
  DUXPCServerRequestHandler *v22;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255994050);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x22E2B0AD4]();
  v10 = objc_alloc(MEMORY[0x24BDBCF20]);
  v11 = objc_opt_class();
  v12 = (void *)objc_msgSend(v10, "initWithObjects:", v11, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v9);
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_addOrUpdateSearchableItems_bundleID_completion_, 0, 0);

  v13 = -[DUXPCServerRequestHandler initWithManager:]([DUXPCServerRequestHandler alloc], "initWithManager:", self->_textUnderstandingManager);
  v14 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__DUXPCServerDelegate_listener_shouldAcceptNewConnection___block_invoke;
  aBlock[3] = &unk_24F0F3DD8;
  v15 = v13;
  v22 = v15;
  v16 = _Block_copy(aBlock);
  v19[0] = v14;
  v19[1] = 3221225472;
  v19[2] = __58__DUXPCServerDelegate_listener_shouldAcceptNewConnection___block_invoke_19;
  v19[3] = &unk_24F0F3E40;
  v20 = v15;
  v17 = v15;
  LOBYTE(v12) = +[DUXPCServerHelper shouldAcceptConnection:serviceName:whitelistedServerInterface:requestHandler:validateConnection:setupClientProxy:interruptionHandler:invalidationHandler:](DUXPCServerHelper, "shouldAcceptConnection:serviceName:whitelistedServerInterface:requestHandler:validateConnection:setupClientProxy:interruptionHandler:invalidationHandler:", v7, CFSTR("com.apple.TextUnderstanding.DocumentUnderstandingHarvesting"), v8, v17, v16, v19, &__block_literal_global_0, &__block_literal_global_18);

  return (char)v12;
}

BOOL __58__DUXPCServerDelegate_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  _BOOL8 v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "setClientProcessName:", a3);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE7A5B0]), "initWithProcessIdentifier:", objc_msgSend(v6, "processIdentifier"));
  objc_msgSend(*(id *)(a1 + 32), "setBundleIdResolver:", v7);

  v8 = +[DUXPCServerHelper checkForAndLogTrueBooleanEntitlement:connection:serviceName:](DUXPCServerHelper, "checkForAndLogTrueBooleanEntitlement:connection:serviceName:", CFSTR("com.apple.TextUnderstanding.DocumentUnderstandingHarvesting"), v6, CFSTR("com.apple.TextUnderstanding.DocumentUnderstandingHarvesting"));
  return v8;
}

void __58__DUXPCServerDelegate_listener_shouldAcceptNewConnection___block_invoke_2()
{
  NSObject *v0;
  uint8_t v1[16];

  du_xpc_log_handle();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2282CC000, v0, OS_LOG_TYPE_DEFAULT, "DUXPCServerHelper received call to interruption handler", v1, 2u);
  }

}

void __58__DUXPCServerDelegate_listener_shouldAcceptNewConnection___block_invoke_17()
{
  NSObject *v0;
  uint8_t v1[16];

  du_xpc_log_handle();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2282CC000, v0, OS_LOG_TYPE_DEFAULT, "DUXPCServerHelper received call to invalidation handler", v1, 2u);
  }

}

uint64_t __58__DUXPCServerDelegate_listener_shouldAcceptNewConnection___block_invoke_19(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setRemoteObjectProxy:", a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textUnderstandingManager, 0);
}

@end
