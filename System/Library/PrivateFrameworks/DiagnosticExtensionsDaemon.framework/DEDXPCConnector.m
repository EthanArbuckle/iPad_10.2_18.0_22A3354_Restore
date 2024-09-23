@implementation DEDXPCConnector

- (DEDXPCConnector)initWithDelegate:(id)a3
{
  id v4;
  DEDXPCConnector *v5;
  void *v6;
  os_log_t v7;
  OS_os_log *log;
  NSXPCListener *listener;
  uint64_t v10;
  NSMutableDictionary *appConnections;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DEDXPCConnector;
  v5 = -[DEDXPCConnector init](&v13, sel_init);
  if (v5)
  {
    +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = os_log_create((const char *)objc_msgSend(v6, "loggingSubsystem"), "t-xpc-connector");
    log = v5->_log;
    v5->_log = (OS_os_log *)v7;

    *(_WORD *)&v5->_isDaemon = 0;
    listener = v5->_listener;
    v5->_listener = 0;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 3);
    appConnections = v5->_appConnections;
    v5->_appConnections = (NSMutableDictionary *)v10;

    objc_storeWeak((id *)&v5->_xpcConnectorDelegate, v4);
    v5->_connectionRestartCount = 0;

  }
  return v5;
}

- (void)configureConnectionType:(unint64_t)a3
{
  if (!-[DEDXPCConnector started](self, "started"))
    -[DEDXPCConnector setConnType:](self, "setConnType:", a3);
}

- (void)configureDaemonMode
{
  if (!-[DEDXPCConnector started](self, "started"))
    -[DEDXPCConnector setIsDaemon:](self, "setIsDaemon:", 1);
}

- (void)start
{
  if (!-[DEDXPCConnector started](self, "started"))
  {
    if (-[DEDXPCConnector isDaemon](self, "isDaemon"))
      -[DEDXPCConnector startForDaemon](self, "startForDaemon");
    else
      -[DEDXPCConnector startForApp](self, "startForApp");
  }
}

- (void)startForDaemon
{
  void *v3;
  void *v4;
  unint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  uint8_t buf[16];

  +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "machServiceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[DEDXPCConnector connType](self, "connType");
  if (v5)
  {
    if (v5 != 1)
    {
      v9 = 0;
      goto LABEL_11;
    }
    -[DEDXPCConnector log](self, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21469E000, v6, OS_LOG_TYPE_INFO, "starting anonymous listener", buf, 2u);
    }

    objc_msgSend(v3, "sharedAnonymousListener");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[DEDXPCConnector log](self, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21469E000, v8, OS_LOG_TYPE_INFO, "starting privileged listener", buf, 2u);
    }

    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", v4);
  }
  v9 = (void *)v7;
LABEL_11:
  -[DEDXPCConnector setListener:](self, "setListener:", v9);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-listener-queue"), v4);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = dispatch_queue_create((const char *)objc_msgSend(v10, "cStringUsingEncoding:", 4), 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__DEDXPCConnector_startForDaemon__block_invoke;
  block[3] = &unk_24D1E4930;
  block[4] = self;
  v15 = v4;
  v16 = v9;
  v12 = v9;
  v13 = v4;
  dispatch_async(v11, block);

}

uint64_t __33__DEDXPCConnector_startForDaemon__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;

  objc_msgSend(*(id *)(a1 + 32), "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __33__DEDXPCConnector_startForDaemon__block_invoke_cold_2(a1, v2, v3);

  objc_msgSend(*(id *)(a1 + 48), "setDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __33__DEDXPCConnector_startForDaemon__block_invoke_cold_1(v4);

  return objc_msgSend(*(id *)(a1 + 48), "resume");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  void *v12;
  id WeakRetained;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  NSObject *v25;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  void *v30;
  id v31;
  id v32;
  int v33;
  _QWORD v34[4];
  id v35;
  id v36;
  int v37;
  uint8_t buf[4];
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = -[DEDXPCConnector validateConnection:](self, "validateConnection:", v7);
  if (v8)
  {
    v9 = objc_msgSend(v7, "processIdentifier");
    -[DEDXPCConnector log](self, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v39 = (int)v9;
      _os_log_impl(&dword_21469E000, v10, OS_LOG_TYPE_DEFAULT, "New connection from pid [%ld]", buf, 0xCu);
    }

    v11 = objc_initWeak((id *)buf, self);
    -[DEDXPCConnector _whitelistedXPCInterface](self, "_whitelistedXPCInterface");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRemoteObjectInterface:", v12);

    WeakRetained = objc_loadWeakRetained((id *)buf);
    objc_msgSend(WeakRetained, "_whitelistedXPCInterface");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExportedInterface:", v14);

    v15 = objc_loadWeakRetained((id *)buf);
    objc_msgSend(v15, "xpcConnectorDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_loadWeakRetained((id *)buf);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "connector:needsXPCInboundForPid:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setExportedObject:", v19);
    objc_msgSend(v7, "description");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x24BDAC760];
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __54__DEDXPCConnector_listener_shouldAcceptNewConnection___block_invoke;
    v34[3] = &unk_24D1E6608;
    objc_copyWeak(&v36, (id *)buf);
    v22 = v20;
    v35 = v22;
    v37 = v9;
    objc_msgSend(v7, "setInvalidationHandler:", v34);
    v27 = v21;
    v28 = 3221225472;
    v29 = __54__DEDXPCConnector_listener_shouldAcceptNewConnection___block_invoke_20;
    v30 = &unk_24D1E6608;
    objc_copyWeak(&v32, (id *)buf);
    v23 = v22;
    v31 = v23;
    v33 = v9;
    objc_msgSend(v7, "setInterruptionHandler:", &v27);
    v24 = objc_loadWeakRetained((id *)buf);
    objc_msgSend(v24, "_storeAppConnection:", v7, v27, v28, v29, v30);

    objc_msgSend(v7, "resume");
    objc_destroyWeak(&v32);

    objc_destroyWeak(&v36);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    -[DEDXPCConnector log](self, "log");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[DEDXPCConnector listener:shouldAcceptNewConnection:].cold.1();

  }
  return v8;
}

void __54__DEDXPCConnector_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  NSObject *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "log");
  v4 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v10 = 138543362;
    v11 = v5;
    _os_log_impl(&dword_21469E000, v4, OS_LOG_TYPE_DEFAULT, "connection [%{public}@] was invalidated", (uint8_t *)&v10, 0xCu);
  }

  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "xpcConnectorDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_loadWeakRetained(v2);
  objc_msgSend(v7, "connector:didLooseConnectionToProcessWithPid:", v8, *(unsigned int *)(a1 + 48));

  v9 = objc_loadWeakRetained(v2);
  objc_msgSend(v9, "_releaseAppConnectionWithPid:", *(unsigned int *)(a1 + 48));

}

void __54__DEDXPCConnector_listener_shouldAcceptNewConnection___block_invoke_20(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  NSObject *v4;
  uint64_t v5;
  id v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "log");
  v4 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_21469E000, v4, OS_LOG_TYPE_DEFAULT, "connection [%{public}@] was interrupted", (uint8_t *)&v7, 0xCu);
  }

  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "_releaseAppConnectionWithPid:", *(unsigned int *)(a1 + 48));

}

- (BOOL)validateConnection:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  objc_msgSend(a3, "valueForEntitlement:", CFSTR("com.apple.diagnosticextensionsd.xpcclient"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "connectionType");

  if (v6 == 1 || v4 && (objc_msgSend(v4, "BOOLValue") & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    -[DEDXPCConnector log](self, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[DEDXPCConnector validateConnection:].cold.1((uint64_t)self, v8, v9, v10, v11, v12, v13, v14);

    v7 = 0;
  }

  return v7;
}

- (id)connectionWithEndpoint:(id)a3 forMachService:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithListenerEndpoint:", v6);
  }
  else
  {
    if (!v7)
      goto LABEL_7;
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", v7, 4096);
  }
  v10 = (void *)v9;
  if (v9)
  {
    -[DEDXPCConnector _whitelistedXPCInterface](self, "_whitelistedXPCInterface");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRemoteObjectInterface:", v11);

    -[DEDXPCConnector _whitelistedXPCInterface](self, "_whitelistedXPCInterface");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setExportedInterface:", v12);

    -[DEDXPCConnector xpcConnectorDelegate](self, "xpcConnectorDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v10, "processIdentifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "connector:needsXPCInboundForPid:", self, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setExportedObject:", v15);
    objc_initWeak(&location, self);
    v16 = MEMORY[0x24BDAC760];
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __57__DEDXPCConnector_connectionWithEndpoint_forMachService___block_invoke;
    v22[3] = &unk_24D1E4B90;
    objc_copyWeak(&v23, &location);
    objc_msgSend(v10, "setInvalidationHandler:", v22);
    v20[0] = v16;
    v20[1] = 3221225472;
    v20[2] = __57__DEDXPCConnector_connectionWithEndpoint_forMachService___block_invoke_22;
    v20[3] = &unk_24D1E4B90;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v10, "setInterruptionHandler:", v20);
    objc_msgSend(v10, "resume");
    v17 = v10;
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);

    v18 = v17;
    goto LABEL_10;
  }
LABEL_7:
  -[DEDXPCConnector log](self, "log");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    -[DEDXPCConnector connectionWithEndpoint:forMachService:].cold.1((uint64_t)v8, v6, v17);
  v18 = 0;
LABEL_10:

  return v18;
}

void __57__DEDXPCConnector_connectionWithEndpoint_forMachService___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  NSObject *v3;
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "log");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __57__DEDXPCConnector_connectionWithEndpoint_forMachService___block_invoke_cold_1();

  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "setDiagnosticextensionsdConnection:", 0);

}

void __57__DEDXPCConnector_connectionWithEndpoint_forMachService___block_invoke_22(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  NSObject *v3;
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "log");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __57__DEDXPCConnector_connectionWithEndpoint_forMachService___block_invoke_22_cold_1();

  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "setDiagnosticextensionsdConnection:", 0);

}

- (id)_whitelistedXPCInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D913D8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_xpc_didDiscoverDevices_, 0, 0);
  v7 = (void *)MEMORY[0x24BDBCF20];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_xpc_gotDeviceUpdate_, 0, 0);
  v10 = (void *)MEMORY[0x24BDBCF20];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_xpc_startPairSetupForDevice_, 0, 0);
  v13 = (void *)MEMORY[0x24BDBCF20];
  v14 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_xpc_promptPINForDevice_, 0, 0);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_xpc_tryPIN_forDevice_, 0, 0);
  v17 = (void *)MEMORY[0x24BDBCF20];
  v18 = objc_opt_class();
  objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_xpc_tryPIN_forDevice_, 1, 0);
  v20 = (void *)MEMORY[0x24BDBCF20];
  v21 = objc_opt_class();
  objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v22, sel_xpc_successPINForDevice_, 0, 0);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_xpc_startBugSessionWithIdentifier_configuration_caller_target_, 0, 0);
  v24 = (void *)MEMORY[0x24BDBCF20];
  v25 = objc_opt_class();
  objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v26, sel_xpc_startBugSessionWithIdentifier_configuration_caller_target_, 1, 0);
  v27 = (void *)MEMORY[0x24BDBCF20];
  v28 = objc_opt_class();
  objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v29, sel_xpc_startBugSessionWithIdentifier_configuration_caller_target_, 2, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v29, sel_xpc_startBugSessionWithIdentifier_configuration_caller_target_, 3, 0);
  v30 = (void *)MEMORY[0x24BDBCF20];
  v31 = objc_opt_class();
  objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v32, sel_xpc_adoptFiles_forSession_, 0, 0);
  v33 = (void *)MEMORY[0x24BDBCF20];
  v34 = objc_opt_class();
  objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v35, sel_xpc_listClientXPCConnectionsReply_, 0, 0);
  return v2;
}

- (id)remoteXPCObjectForApplicationPid:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[DEDXPCConnector _connectionForPid:](self, "_connectionForPid:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __52__DEDXPCConnector_remoteXPCObjectForApplicationPid___block_invoke;
  v9[3] = &unk_24D1E6630;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __52__DEDXPCConnector_remoteXPCObjectForApplicationPid___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __52__DEDXPCConnector_remoteXPCObjectForApplicationPid___block_invoke_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

}

- (DEDXPCProtocol)diagnosticextensionsdXPCInterface
{
  void *v3;
  NSObject *v4;
  const char *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  uint8_t buf[4];
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[DEDXPCConnector diagnosticextensionsdConnection](self, "diagnosticextensionsdConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    if (-[DEDXPCConnector connectionRestartCount](self, "connectionRestartCount") > 4)
    {
      -[DEDXPCConnector log](self, "log");
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v11 = 5;
        v5 = "diagnosticextensionsd connection has been lost more than [%lu] times. Will not retry";
        goto LABEL_7;
      }
    }
    else
    {
      -[DEDXPCConnector _initializeDiagnosticextensionsdConnection](self, "_initializeDiagnosticextensionsdConnection");
      -[DEDXPCConnector setConnectionRestartCount:](self, "setConnectionRestartCount:", -[DEDXPCConnector connectionRestartCount](self, "connectionRestartCount") + 1);
      -[DEDXPCConnector log](self, "log");
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v11 = -[DEDXPCConnector connectionRestartCount](self, "connectionRestartCount");
        v5 = "diagnosticextensionsd connection has been lost. Restarting it. count: [%lu]";
LABEL_7:
        _os_log_impl(&dword_21469E000, v4, OS_LOG_TYPE_DEFAULT, v5, buf, 0xCu);
      }
    }

  }
  -[DEDXPCConnector diagnosticextensionsdConnection](self, "diagnosticextensionsdConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __52__DEDXPCConnector_diagnosticextensionsdXPCInterface__block_invoke;
  v9[3] = &unk_24D1E6138;
  v9[4] = self;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (DEDXPCProtocol *)v7;
}

void __52__DEDXPCConnector_diagnosticextensionsdXPCInterface__block_invoke(uint64_t a1)
{
  NSObject *v1;

  objc_msgSend(*(id *)(a1 + 32), "log");
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __52__DEDXPCConnector_diagnosticextensionsdXPCInterface__block_invoke_cold_1();

}

- (void)_storeAppConnection:(id)a3
{
  id v4;
  NSObject *v5;
  DEDXPCConnector *v6;
  void *v7;
  void *v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[DEDXPCConnector log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = objc_msgSend(v4, "processIdentifier");
    _os_log_impl(&dword_21469E000, v5, OS_LOG_TYPE_DEFAULT, "Storing connection from PID [%i]", (uint8_t *)v9, 8u);
  }

  v6 = self;
  objc_sync_enter(v6);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v4, "processIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDXPCConnector appConnections](v6, "appConnections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v4, v7);

  objc_sync_exit(v6);
}

- (void)_releaseAppConnectionWithPid:(int)a3
{
  uint64_t v3;
  DEDXPCConnector *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _DWORD v8[2];
  uint64_t v9;

  v3 = *(_QWORD *)&a3;
  v9 = *MEMORY[0x24BDAC8D0];
  v4 = self;
  objc_sync_enter(v4);
  -[DEDXPCConnector log](v4, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl(&dword_21469E000, v5, OS_LOG_TYPE_DEFAULT, "Clearing connection [%i]", (uint8_t *)v8, 8u);
  }

  -[DEDXPCConnector appConnections](v4, "appConnections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", v7);

  objc_sync_exit(v4);
}

- (id)_connectionForPid:(id)a3
{
  id v4;
  DEDXPCConnector *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[DEDXPCConnector appConnections](v5, "appConnections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  return v7;
}

- (id)clientXPCInterfaceFromInbound:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "senderPid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDXPCConnector remoteXPCObjectForApplicationPid:](self, "remoteXPCObjectForApplicationPid:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_initializeDiagnosticextensionsdConnection
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (-[DEDXPCConnector connType](self, "connType") == 1)
  {
    objc_msgSend(v6, "sharedAnonymousListener");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endpoint");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDXPCConnector connectionWithEndpoint:forMachService:](self, "connectionWithEndpoint:forMachService:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDXPCConnector setDiagnosticextensionsdConnection:](self, "setDiagnosticextensionsdConnection:", v5);

  }
  else
  {
    objc_msgSend(v6, "machServiceName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDXPCConnector connectionWithEndpoint:forMachService:](self, "connectionWithEndpoint:forMachService:", 0, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDXPCConnector setDiagnosticextensionsdConnection:](self, "setDiagnosticextensionsdConnection:", v4);
  }

}

- (NSArray)clientConnections
{
  void *v3;
  DEDXPCConnector *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 4);
  v4 = self;
  objc_sync_enter(v4);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[DEDXPCConnector appConnections](v4, "appConnections", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = (void *)objc_opt_new();
        objc_msgSend(v11, "setPid:", v10);
        objc_msgSend(v3, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  objc_sync_exit(v4);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v12;
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLog:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSXPCConnection)diagnosticextensionsdConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDiagnosticextensionsdConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSMutableDictionary)appConnections
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAppConnections:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 40, 1);
}

- (void)setListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (unint64_t)connType
{
  return self->_connType;
}

- (void)setConnType:(unint64_t)a3
{
  self->_connType = a3;
}

- (BOOL)isDaemon
{
  return self->_isDaemon;
}

- (void)setIsDaemon:(BOOL)a3
{
  self->_isDaemon = a3;
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (DEDXPCConnectorDelegate)xpcConnectorDelegate
{
  return (DEDXPCConnectorDelegate *)objc_loadWeakRetained((id *)&self->_xpcConnectorDelegate);
}

- (void)setXpcConnectorDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_xpcConnectorDelegate, a3);
}

- (unint64_t)connectionRestartCount
{
  return self->_connectionRestartCount;
}

- (void)setConnectionRestartCount:(unint64_t)a3
{
  self->_connectionRestartCount = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_xpcConnectorDelegate);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_appConnections, 0);
  objc_storeStrong((id *)&self->_diagnosticextensionsdConnection, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

void __33__DEDXPCConnector_startForDaemon__block_invoke_cold_1(NSObject *a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v2;
  OUTLINED_FUNCTION_9_0(&dword_21469E000, a1, v3, "resuming listener from thread %@", (uint8_t *)&v4);

}

void __33__DEDXPCConnector_startForDaemon__block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_9_0(&dword_21469E000, a2, a3, "listening for service %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21469E000, v0, v1, "received connection request from unknown source", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_3();
}

- (void)validateConnection:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_21469E000, a2, a3, "XPC caller has no entitlement: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)connectionWithEndpoint:(NSObject *)a3 forMachService:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_21469E000, a3, OS_LOG_TYPE_ERROR, "failed to initialize connection for mach service %{public}@ or endpoint %{public}@", (uint8_t *)&v6, 0x16u);

}

void __57__DEDXPCConnector_connectionWithEndpoint_forMachService___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_21469E000, v0, v1, "diagnosticextensionsd connection invalidated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_3();
}

void __57__DEDXPCConnector_connectionWithEndpoint_forMachService___block_invoke_22_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_21469E000, v0, v1, "diagnosticextensionsd connection interrupted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_3();
}

void __52__DEDXPCConnector_remoteXPCObjectForApplicationPid___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_21469E000, a2, a3, "failed to get remoteXPCObject for process [%{public}@]", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __52__DEDXPCConnector_diagnosticextensionsdXPCInterface__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21469E000, v0, v1, "failed to get diagnosticextensionsd remoteXPCObject", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_3();
}

@end
