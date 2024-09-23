@implementation UARPPersonalizationManager

- (UARPPersonalizationManager)initWithMachServiceName:(id)a3 entitlement:(id)a4 delegate:(id)a5 queue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  UARPPersonalizationManager *v14;
  UARPPersonalizationManager *v15;
  uint64_t v16;
  NSString *serviceName;
  uint64_t v18;
  NSString *entitlement;
  os_log_t v20;
  OS_os_log *log;
  uint64_t v22;
  NSXPCListener *listener;
  objc_super v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)UARPPersonalizationManager;
  v14 = -[UARPPersonalizationManager init](&v25, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_delegate, v12);
    objc_storeStrong((id *)&v15->_queue, a6);
    v16 = objc_msgSend(v10, "copy");
    serviceName = v15->_serviceName;
    v15->_serviceName = (NSString *)v16;

    v18 = objc_msgSend(v11, "copy");
    entitlement = v15->_entitlement;
    v15->_entitlement = (NSString *)v18;

    v20 = os_log_create("com.apple.accessoryupdater.uarp", "personalization");
    log = v15->_log;
    v15->_log = (OS_os_log *)v20;

    v22 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", v15->_serviceName);
    listener = v15->_listener;
    v15->_listener = (NSXPCListener *)v22;

    -[NSXPCListener setDelegate:](v15->_listener, "setDelegate:", v15);
    -[NSXPCListener activate](v15->_listener, "activate");
  }

  return v15;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCListener invalidate](self->_listener, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)UARPPersonalizationManager;
  -[UARPPersonalizationManager dealloc](&v3, sel_dealloc);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  OS_os_log *v8;
  int v9;
  NSObject *queue;
  id v11;
  BOOL v12;
  _QWORD block[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint8_t buf[4];
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v8 = self->_log;
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_INFO))
  {
    v9 = objc_msgSend(v7, "processIdentifier");
    *(_DWORD *)buf = 67109120;
    v22 = v9;
    _os_log_impl(&dword_212D08000, (os_log_t)v8, OS_LOG_TYPE_INFO, "Connection from PID %d", buf, 8u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__UARPPersonalizationManager_listener_shouldAcceptNewConnection___block_invoke;
  block[3] = &unk_24CEA3878;
  block[4] = self;
  v15 = v7;
  v16 = &v17;
  v11 = v7;
  dispatch_sync(queue, block);
  v12 = *((_BYTE *)v18 + 24) != 0;

  _Block_object_dispose(&v17, 8);
  return v12;
}

void __65__UARPPersonalizationManager_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  int v9;
  _QWORD v10[5];
  int v11;
  uint8_t buf[4];
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "xpcConnectionHasEntitlement:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254B6B728);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setExportedInterface:", v2);

    objc_msgSend(*(id *)(a1 + 40), "setExportedObject:", *(_QWORD *)(a1 + 32));
    v3 = objc_msgSend(*(id *)(a1 + 40), "processIdentifier");
    v4 = MEMORY[0x24BDAC760];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __65__UARPPersonalizationManager_listener_shouldAcceptNewConnection___block_invoke_2;
    v10[3] = &unk_24CEA3850;
    v5 = *(void **)(a1 + 40);
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v3;
    objc_msgSend(v5, "setInterruptionHandler:", v10);
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = __65__UARPPersonalizationManager_listener_shouldAcceptNewConnection___block_invoke_11;
    v8[3] = &unk_24CEA3850;
    v6 = *(void **)(a1 + 40);
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v3;
    objc_msgSend(v6, "setInvalidationHandler:", v8);
    objc_msgSend(*(id *)(a1 + 40), "_setQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend(*(id *)(a1 + 40), "resume");
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v13 = v3;
      _os_log_impl(&dword_212D08000, v7, OS_LOG_TYPE_INFO, "New connection from PID %d", buf, 8u);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
}

void __65__UARPPersonalizationManager_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __65__UARPPersonalizationManager_listener_shouldAcceptNewConnection___block_invoke_2_cold_1(a1, v2, v3);
}

void __65__UARPPersonalizationManager_listener_shouldAcceptNewConnection___block_invoke_11(uint64_t a1)
{
  NSObject *v2;
  int v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_DWORD *)(a1 + 40);
    v4[0] = 67109120;
    v4[1] = v3;
    _os_log_impl(&dword_212D08000, v2, OS_LOG_TYPE_INFO, "Connection from PID %d invalidated", (uint8_t *)v4, 8u);
  }
}

- (BOOL)xpcConnectionHasEntitlement:(id)a3
{
  id v4;
  NSObject *log;
  void *v6;
  BOOL v7;
  NSObject *v8;

  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    -[UARPPersonalizationManager xpcConnectionHasEntitlement:].cold.2(log);
  objc_msgSend(v4, "valueForEntitlement:", self->_entitlement);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v6, "BOOLValue") & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v8 = self->_log;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[UARPPersonalizationManager xpcConnectionHasEntitlement:].cold.1(v8);
    v7 = 0;
  }

  return v7;
}

- (void)getOutstandingPersonalizationRequests:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *log;
  id WeakRetained;
  void *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v12 = 136315138;
    v13 = "-[UARPPersonalizationManager getOutstandingPersonalizationRequests:reply:]";
    _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v12, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "personalizationHelperQueryPendingTssRequests:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = self->_log;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = 136315650;
    v13 = "-[UARPPersonalizationManager getOutstandingPersonalizationRequests:reply:]";
    v14 = 2112;
    v15 = v6;
    v16 = 2112;
    v17 = v10;
    _os_log_impl(&dword_212D08000, v11, OS_LOG_TYPE_INFO, "%s: Updater Name %@, pending tss requests %@", (uint8_t *)&v12, 0x20u);
  }
  v7[2](v7, v10);

}

- (void)personalizationResponse:(id)a3 updaterName:(id)a4
{
  id v6;
  id v7;
  NSObject *log;
  NSObject *v9;
  id WeakRetained;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v11 = 136315394;
    v12 = "-[UARPPersonalizationManager personalizationResponse:updaterName:]";
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "%s: Updater Name %@", (uint8_t *)&v11, 0x16u);
  }
  v9 = self->_log;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v11 = 136315394;
    v12 = "-[UARPPersonalizationManager personalizationResponse:updaterName:]";
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_212D08000, v9, OS_LOG_TYPE_INFO, "%s: TSS Response %@", (uint8_t *)&v11, 0x16u);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "personalizationHelperTssResponse:updaterName:", v6, v7);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_entitlement, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

void __65__UARPPersonalizationManager_listener_shouldAcceptNewConnection___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = *(_DWORD *)(a1 + 40);
  v4[0] = 67109120;
  v4[1] = v3;
  OUTLINED_FUNCTION_0_4(&dword_212D08000, a2, a3, "Connection to PID %d interrupted", (uint8_t *)v4);
}

- (void)xpcConnectionHasEntitlement:(void *)a1 .cold.1(void *a1)
{
  NSObject *v1;
  id v2;
  uint64_t v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = a1;
  v4[0] = 67109120;
  v4[1] = OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_4(&dword_212D08000, v1, v3, "Connection from PID %d does not have the correct entitlement", (uint8_t *)v4);

  OUTLINED_FUNCTION_1_4();
}

- (void)xpcConnectionHasEntitlement:(void *)a1 .cold.2(void *a1)
{
  NSObject *v1;
  id v2;
  uint64_t v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = a1;
  v4[0] = 67109120;
  v4[1] = OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_4(&dword_212D08000, v1, v3, "Connection from PID %d checking entitlement", (uint8_t *)v4);

  OUTLINED_FUNCTION_1_4();
}

@end
