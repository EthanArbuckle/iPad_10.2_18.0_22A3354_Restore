@implementation BLSHDiagnosticsServer

+ (BLSHDiagnosticsServer)serverWithFlipbookDiagnosticsProvider:(id)a3
{
  id v3;
  BLSHDiagnosticsServer *v4;
  NSObject *v5;

  v3 = a3;
  v4 = -[BLSHDiagnosticsServer initWithFlipbookDiagnosticsProvider:]([BLSHDiagnosticsServer alloc], "initWithFlipbookDiagnosticsProvider:", v3);
  bls_diagnostics_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    +[BLSHDiagnosticsServer serverWithFlipbookDiagnosticsProvider:].cold.1();

  return v4;
}

+ (id)domainSpecification
{
  if (domainSpecification_onceToken_1 != -1)
    dispatch_once(&domainSpecification_onceToken_1, &__block_literal_global_22);
  return (id)domainSpecification_domain_1;
}

void __44__BLSHDiagnosticsServer_domainSpecification__block_invoke()
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
  objc_msgSend(MEMORY[0x24BE0B8C0], "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "domainsContainingServiceIdentifier:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "anyObject");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)domainSpecification_domain_1;
  domainSpecification_domain_1 = v3;

  objc_msgSend(MEMORY[0x24BE0FA08], "defaultShellMachName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "domainForMachName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v6 == (void *)domainSpecification_domain_1;
  else
    v7 = 1;
  if (!v7)
  {
    bls_diagnostics_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      __44__BLSHDiagnosticsServer_domainSpecification__block_invoke_cold_1((uint64_t)v6, v8);

  }
}

- (BLSHDiagnosticsServer)initWithFlipbookDiagnosticsProvider:(id)a3
{
  id v5;
  BLSHDiagnosticsServer *v6;
  BLSHDiagnosticsServer *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  OS_dispatch_queue *callbackQueue;
  void *v15;
  BLSHDiagnosticsServer *v16;
  uint64_t v17;
  BSServiceConnectionListener *serviceListener;
  NSObject *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  BLSHDiagnosticsServer *v26;
  objc_super v27;

  v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)BLSHDiagnosticsServer;
  v6 = -[BLSHDiagnosticsServer init](&v27, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_flipbookDiagnosticsProvider, a3);
    +[BLSHDiagnosticsServer domainSpecification](BLSHDiagnosticsServer, "domainSpecification");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      bls_diagnostics_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[BLSHDiagnosticsServer initWithFlipbookDiagnosticsProvider:].cold.2((uint64_t)v7, v8, v9);

      objc_msgSend(MEMORY[0x24BE0B8C0], "serviceQuality");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE0BE18], "serial");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "serviceClass:relativePriority:", objc_msgSend(v10, "serviceClass"), objc_msgSend(v10, "relativePriority"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = BSDispatchQueueCreate();
      callbackQueue = v7->_callbackQueue;
      v7->_callbackQueue = (OS_dispatch_queue *)v13;

      v15 = (void *)MEMORY[0x24BE0FA28];
      v21 = MEMORY[0x24BDAC760];
      v22 = 3221225472;
      v23 = __61__BLSHDiagnosticsServer_initWithFlipbookDiagnosticsProvider___block_invoke;
      v24 = &unk_24D1BC438;
      v25 = v8;
      v16 = v7;
      v26 = v16;
      objc_msgSend(v15, "listenerWithConfigurator:", &v21);
      v17 = objc_claimAutoreleasedReturnValue();
      serviceListener = v16->_serviceListener;
      v16->_serviceListener = (BSServiceConnectionListener *)v17;

      bls_diagnostics_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[BLSHDiagnosticsServer initWithFlipbookDiagnosticsProvider:].cold.1((uint64_t)v16, &v16->_serviceListener, v19);

      -[BSServiceConnectionListener activate](v16->_serviceListener, "activate", v21, v22, v23, v24);
    }

  }
  return v7;
}

void __61__BLSHDiagnosticsServer_initWithFlipbookDiagnosticsProvider___block_invoke(uint64_t a1, void *a2)
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

  objc_msgSend(MEMORY[0x24BE0B8C0], "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setService:", v6);

  v8 = *(_QWORD *)(a1 + 40);
  v7 = (uint64_t *)(a1 + 40);
  objc_msgSend(v4, "setDelegate:", v8);

  bls_diagnostics_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    __61__BLSHDiagnosticsServer_initWithFlipbookDiagnosticsProvider___block_invoke_cold_1(v7, v9);

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
  BLSHDiagnosticsServer *v13;
  id v14;

  v6 = a4;
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __67__BLSHDiagnosticsServer_listener_didReceiveConnection_withContext___block_invoke;
  v12 = &unk_24D1BC488;
  v13 = self;
  v7 = v6;
  v14 = v7;
  objc_msgSend(v7, "configureConnection:", &v9);
  objc_msgSend(v7, "activate", v9, v10, v11, v12, v13);
  bls_diagnostics_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[BLSHDiagnosticsServer listener:didReceiveConnection:withContext:].cold.1();

}

void __67__BLSHDiagnosticsServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
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
  BLSHDiagnosticsHostPeer *v16;

  v3 = a2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__8;
  v15 = __Block_byref_object_dispose__8;
  v16 = -[BLSHDiagnosticsHostPeer initWithFlipbookDiagnosticsProvider:peer:]([BLSHDiagnosticsHostPeer alloc], "initWithFlipbookDiagnosticsProvider:peer:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(a1 + 40));
  objc_msgSend(MEMORY[0x24BE0B8C0], "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(MEMORY[0x24BE0B8C0], "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", v12[5]);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __67__BLSHDiagnosticsServer_listener_didReceiveConnection_withContext___block_invoke_8;
  v8[3] = &unk_24D1BC460;
  v6 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v10 = &v11;
  v9 = v6;
  objc_msgSend(v3, "setInvalidationHandler:", v8);
  bls_diagnostics_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __67__BLSHDiagnosticsServer_listener_didReceiveConnection_withContext___block_invoke_cold_1();

  _Block_object_dispose(&v11, 8);
}

uint64_t __67__BLSHDiagnosticsServer_listener_didReceiveConnection_withContext___block_invoke_8(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  bls_diagnostics_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __67__BLSHDiagnosticsServer_listener_didReceiveConnection_withContext___block_invoke_8_cold_1();

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
  objc_storeStrong((id *)&self->_flipbookDiagnosticsProvider, 0);
}

+ (void)serverWithFlipbookDiagnosticsProvider:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_2145AC000, v0, v1, "did startServer:%{public}@ withFlipbookDiagnosticsProvider:%{public}@");
  OUTLINED_FUNCTION_2();
}

void __44__BLSHDiagnosticsServer_domainSpecification__block_invoke_cold_1(uint64_t a1, NSObject *a2)
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
  v5 = domainSpecification_domain_1;
  _os_log_fault_impl(&dword_2145AC000, a2, OS_LOG_TYPE_FAULT, "if we own the defaultShellMachName:%{public}@ then BacklightServices.diagnostics must be registered there not:%@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)initWithFlipbookDiagnosticsProvider:(NSObject *)a3 .cold.1(uint64_t a1, _QWORD *a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 134218242;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = *a2;
  OUTLINED_FUNCTION_0_2(&dword_2145AC000, (uint64_t)a2, a3, "%p diagnostics init with listener:%{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_2();
}

- (void)initWithFlipbookDiagnosticsProvider:(NSObject *)a3 .cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = a1;
  v9 = 2114;
  v10 = v5;
  OUTLINED_FUNCTION_4(&dword_2145AC000, a3, v6, "%{public}@ init with diagnostics domain:%{public}@", (uint8_t *)&v7);

}

void __61__BLSHDiagnosticsServer_initWithFlipbookDiagnosticsProvider___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 134217984;
  v4 = v2;
  _os_log_debug_impl(&dword_2145AC000, a2, OS_LOG_TYPE_DEBUG, "%p did config diagnostics server", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)listener:didReceiveConnection:withContext:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_2145AC000, v0, v1, "%p did activate diagnostics peer:%{public}@");
  OUTLINED_FUNCTION_2();
}

void __67__BLSHDiagnosticsServer_listener_didReceiveConnection_withContext___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_2(&dword_2145AC000, v0, v1, "%p did configure diagnostics connection:%{public}@");
  OUTLINED_FUNCTION_2();
}

void __67__BLSHDiagnosticsServer_listener_didReceiveConnection_withContext___block_invoke_8_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[14];
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4_1();
  v4 = v0;
  OUTLINED_FUNCTION_4(&dword_2145AC000, v1, v2, "%p did invalidate diagnostics connection for interfaceTarget:%{public}@", v3);
  OUTLINED_FUNCTION_2();
}

@end
