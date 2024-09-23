@implementation BLSHXPCAssertionServiceHostServer

+ (id)serverWithLocalAssertionService:(id)a3
{
  id v3;
  BLSHXPCAssertionServiceHostServer *v4;
  NSObject *v5;

  v3 = a3;
  v4 = -[BLSHXPCAssertionServiceHostServer initWithLocalAssertionService:]([BLSHXPCAssertionServiceHostServer alloc], "initWithLocalAssertionService:", v3);
  bls_assertions_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    +[BLSHXPCAssertionServiceHostServer serverWithLocalAssertionService:].cold.1();

  return v4;
}

+ (id)domainSpecification
{
  if (domainSpecification_onceToken_0 != -1)
    dispatch_once(&domainSpecification_onceToken_0, &__block_literal_global_13);
  return (id)domainSpecification_domain_0;
}

void __56__BLSHXPCAssertionServiceHostServer_domainSpecification__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  NSObject *v8;

  objc_msgSend(MEMORY[0x24BE0FA40], "bootstrapConfiguration");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE0B9C8], "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "domainsContainingServiceIdentifier:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "anyObject");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)domainSpecification_domain_0;
  domainSpecification_domain_0 = v3;

  objc_msgSend(MEMORY[0x24BE0FA08], "defaultShellMachName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "domainForMachName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v6 == (void *)domainSpecification_domain_0;
  else
    v7 = 1;
  if (!v7)
  {
    bls_assertions_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      __56__BLSHXPCAssertionServiceHostServer_domainSpecification__block_invoke_cold_1((uint64_t)v6, v8);

  }
}

- (BLSHXPCAssertionServiceHostServer)initWithLocalAssertionService:(id)a3
{
  id v5;
  BLSHXPCAssertionServiceHostServer *v6;
  BLSHXPCAssertionServiceHostServer *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  OS_dispatch_queue *callbackQueue;
  void *v15;
  id v16;
  BLSHXPCAssertionServiceHostServer *v17;
  uint64_t v18;
  BSServiceConnectionListener *serviceListener;
  NSObject *v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  BLSHXPCAssertionServiceHostServer *v27;
  objc_super v28;

  v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)BLSHXPCAssertionServiceHostServer;
  v6 = -[BLSHXPCAssertionServiceHostServer init](&v28, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_localAssertionService, a3);
    +[BLSHXPCAssertionServiceHostServer domainSpecification](BLSHXPCAssertionServiceHostServer, "domainSpecification");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    bls_assertions_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[BLSHXPCBacklightProxyHostServer initWithLocalBacklightProxy:].cold.2((uint64_t)v7, v8, v9);

    objc_msgSend(MEMORY[0x24BE0B9C8], "serviceQuality");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE0BE18], "serial");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "serviceClass:relativePriority:", objc_msgSend(v10, "serviceClass"), objc_msgSend(v10, "relativePriority"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = BSDispatchQueueCreate();
    callbackQueue = v7->_callbackQueue;
    v7->_callbackQueue = (OS_dispatch_queue *)v13;

    v15 = (void *)MEMORY[0x24BE0FA28];
    v22 = MEMORY[0x24BDAC760];
    v23 = 3221225472;
    v24 = __67__BLSHXPCAssertionServiceHostServer_initWithLocalAssertionService___block_invoke;
    v25 = &unk_24D1BC438;
    v16 = v8;
    v26 = v16;
    v17 = v7;
    v27 = v17;
    objc_msgSend(v15, "listenerWithConfigurator:", &v22);
    v18 = objc_claimAutoreleasedReturnValue();
    serviceListener = v17->_serviceListener;
    v17->_serviceListener = (BSServiceConnectionListener *)v18;

    bls_assertions_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[BLSHXPCBacklightProxyHostServer initWithLocalBacklightProxy:].cold.1((uint64_t)v17, &v17->_serviceListener, v20);

    -[BSServiceConnectionListener activate](v17->_serviceListener, "activate", v22, v23, v24, v25);
  }

  return v7;
}

void __67__BLSHXPCAssertionServiceHostServer_initWithLocalAssertionService___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  NSObject *v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDomain:", v5);

  objc_msgSend(MEMORY[0x24BE0B9C8], "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setService:", v6);

  v8 = *(_QWORD *)(a1 + 40);
  v7 = (uint64_t *)(a1 + 40);
  objc_msgSend(v4, "setDelegate:", v8);

  bls_assertions_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    __63__BLSHXPCBacklightProxyHostServer_initWithLocalBacklightProxy___block_invoke_cold_1(v7, v9);

}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  BLSHXPCAssertionServiceHostServer *v13;
  id v14;

  v6 = a4;
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __79__BLSHXPCAssertionServiceHostServer_listener_didReceiveConnection_withContext___block_invoke;
  v12 = &unk_24D1BC488;
  v13 = self;
  v7 = v6;
  v14 = v7;
  objc_msgSend(v7, "configureConnection:", &v9);
  objc_msgSend(v7, "activate", v9, v10, v11, v12, v13);
  bls_assertions_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[BLSHXPCBacklightProxyHostServer listener:didReceiveConnection:withContext:].cold.1();

}

void __79__BLSHXPCAssertionServiceHostServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  BLSHXPCAssertionServiceHost *v16;

  v3 = a2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__5;
  v15 = __Block_byref_object_dispose__5;
  v16 = -[BLSHXPCAssertionServiceHost initWithLocalService:peer:]([BLSHXPCAssertionServiceHost alloc], "initWithLocalService:peer:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(a1 + 40));
  objc_msgSend(MEMORY[0x24BE0B9C8], "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(MEMORY[0x24BE0B9C8], "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", v12[5]);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __79__BLSHXPCAssertionServiceHostServer_listener_didReceiveConnection_withContext___block_invoke_8;
  v8[3] = &unk_24D1BC460;
  v6 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v10 = &v11;
  v9 = v6;
  objc_msgSend(v3, "setInvalidationHandler:", v8);
  bls_assertions_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __77__BLSHXPCBacklightProxyHostServer_listener_didReceiveConnection_withContext___block_invoke_cold_1();

  _Block_object_dispose(&v11, 8);
}

uint64_t __79__BLSHXPCAssertionServiceHostServer_listener_didReceiveConnection_withContext___block_invoke_8(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  bls_assertions_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __77__BLSHXPCBacklightProxyHostServer_listener_didReceiveConnection_withContext___block_invoke_8_cold_1();

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "invalidate");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

  return objc_msgSend(*(id *)(a1 + 40), "invalidate");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_serviceListener, 0);
  objc_storeStrong((id *)&self->_localAssertionService, 0);
}

+ (void)serverWithLocalAssertionService:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_2145AC000, v0, v1, "did startServer:%{public}@ withLocalAssertionService:%{public}@");
  OUTLINED_FUNCTION_2();
}

void __56__BLSHXPCAssertionServiceHostServer_domainSpecification__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 138543618;
  v3 = a1;
  v4 = 2112;
  v5 = domainSpecification_domain_0;
  _os_log_fault_impl(&dword_2145AC000, a2, OS_LOG_TYPE_FAULT, "if we own the defaultShellMachName:%{public}@ then BacklightServices.assertions must be registered there not:%@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

@end
