@implementation CCSetStoreUpdateService

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  void *v15;
  int v16;
  CCSetStoreUpdateServiceExported *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  CCSetStoreUpdateService *v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x23B820268]();
  objc_msgSend(MEMORY[0x24BE0C0A0], "processWithXPCConnection:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __biome_log_for_category();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "executableName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v11;
    v29 = 1024;
    v30 = objc_msgSend(v9, "pid");
    _os_log_impl(&dword_237B02000, v10, OS_LOG_TYPE_DEFAULT, "Incoming connection from %{public}@(%d)", buf, 0x12u);

  }
  objc_msgSend(MEMORY[0x24BE0C080], "policyForProcess:connectionFlags:useCase:", v9, 0, *MEMORY[0x24BE0C058]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "allowsConnectionToSetStoreUpdateService");
  if ((v13 & 1) != 0)
  {
    if (self->_eagerExitTimer)
    {
      __biome_log_for_category();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "executableName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v9, "pid");
        *(_DWORD *)buf = 138543618;
        v28 = v15;
        v29 = 1024;
        v30 = v16;
        _os_log_impl(&dword_237B02000, v14, OS_LOG_TYPE_DEFAULT, "Resetting eager-exit timer for incoming connection from %{public}@(%d)", buf, 0x12u);

      }
      -[_PASSimpleCoalescingTimer cancelPendingOperations](self->_eagerExitTimer, "cancelPendingOperations");
    }
    v17 = -[CCSetStoreUpdateServiceExported initWithQueue:process:connection:writeAccess:donateConnectionFactory:]([CCSetStoreUpdateServiceExported alloc], "initWithQueue:process:connection:writeAccess:donateConnectionFactory:", self->_queue, v9, v7, self->_writeAccess, self->_donateConnectionFactory);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2568751E8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExportedInterface:", v18);

    objc_msgSend(v7, "setExportedObject:", v17);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25687A0D0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRemoteObjectInterface:", v19);

    v21 = MEMORY[0x24BDAC760];
    v22 = 3221225472;
    v23 = __62__CCSetStoreUpdateService_listener_shouldAcceptNewConnection___block_invoke;
    v24 = &unk_25098ABB8;
    v25 = self;
    v26 = v9;
    objc_msgSend(v7, "setInvalidationHandler:", &v21);
    objc_msgSend(v7, "resume", v21, v22, v23, v24, v25);

  }
  else
  {
    __biome_log_for_category();
    v17 = (CCSetStoreUpdateServiceExported *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v17->super, OS_LOG_TYPE_ERROR))
      -[CCSetStoreUpdateService listener:shouldAcceptNewConnection:].cold.1(v9);
  }

  objc_autoreleasePoolPop(v8);
  return v13;
}

- (CCSetStoreUpdateService)initWithQueue:(id)a3
{
  id v5;
  CCSetStoreUpdateService *v6;
  CCSetStoreUpdateService *v7;
  uint64_t v8;
  CCDataResourceWriteAccess *writeAccess;
  CCDonateRequestManager *v10;
  CCDonateRequestManager *donateRequestManager;
  CCDonateConnectionFactory *v12;
  CCDonateConnectionFactory *donateConnectionFactory;
  NSObject *v14;
  uint64_t v15;
  _PASSimpleCoalescingTimer *eagerExitTimer;
  uint8_t v18[16];
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CCSetStoreUpdateService;
  v6 = -[CCSetStoreUpdateService init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    objc_msgSend(MEMORY[0x24BE15648], "defaultInstance");
    v8 = objc_claimAutoreleasedReturnValue();
    writeAccess = v7->_writeAccess;
    v7->_writeAccess = (CCDataResourceWriteAccess *)v8;

    v10 = -[CCDonateRequestManager initWithWriteAccess:]([CCDonateRequestManager alloc], "initWithWriteAccess:", v7->_writeAccess);
    donateRequestManager = v7->_donateRequestManager;
    v7->_donateRequestManager = v10;

    v12 = -[CCDonateConnectionFactory initWithRequestManager:]([CCDonateConnectionFactory alloc], "initWithRequestManager:", v7->_donateRequestManager);
    donateConnectionFactory = v7->_donateConnectionFactory;
    v7->_donateConnectionFactory = v12;

    if (objc_msgSend(MEMORY[0x24BE0C090], "platform") == 7)
    {
      __biome_log_for_category();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_237B02000, v14, OS_LOG_TYPE_DEFAULT, "CCSetStoreUpdateService is running on HomePod, will attempt to eager exit after handling each connection", v18, 2u);
      }

      v15 = objc_msgSend(objc_alloc(MEMORY[0x24BE7A638]), "initWithQueue:operation:", v7->_queue, &__block_literal_global_3);
      eagerExitTimer = v7->_eagerExitTimer;
      v7->_eagerExitTimer = (_PASSimpleCoalescingTimer *)v15;

    }
  }

  return v7;
}

uint64_t __41__CCSetStoreUpdateService_initWithQueue___block_invoke()
{
  NSObject *v0;
  uint8_t v2[16];

  __biome_log_for_category();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_237B02000, v0, OS_LOG_TYPE_DEFAULT, "Eager-exit coalescing timer fired, will attempt to exit when clean", v2, 2u);
  }

  return xpc_transaction_exit_clean();
}

uint64_t __62__CCSetStoreUpdateService_listener_shouldAcceptNewConnection___block_invoke(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  void *v3;
  int v4;
  int v5;
  void *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 32))
  {
    v1 = result;
    __biome_log_for_category();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(v1 + 40), "executableName");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(*(id *)(v1 + 40), "pid");
      v5 = 138543874;
      v6 = v3;
      v7 = 1024;
      v8 = v4;
      v9 = 2048;
      v10 = 10;
      _os_log_impl(&dword_237B02000, v2, OS_LOG_TYPE_DEFAULT, "Connection from %{public}@(%d) was invalidated, will attempt to eager exit in %lu seconds if there are no more connections", (uint8_t *)&v5, 0x1Cu);

    }
    return objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 32), "runAfterDelaySeconds:coalescingBehavior:", 1, 10.0);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_eagerExitTimer, 0);
  objc_storeStrong((id *)&self->_donateConnectionFactory, 0);
  objc_storeStrong((id *)&self->_donateRequestManager, 0);
  objc_storeStrong((id *)&self->_writeAccess, 0);
}

- (void)listener:(void *)a1 shouldAcceptNewConnection:.cold.1(void *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a1, "executableName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pid");
  OUTLINED_FUNCTION_2_1(&dword_237B02000, v3, v4, "Refusing connection from %{public}@(%d), process not properly entitled", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_1_0();
}

@end
