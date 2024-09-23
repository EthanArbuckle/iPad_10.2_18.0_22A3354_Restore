@implementation NPKIDVRemoteDeviceSessionService

- (NPKIDVRemoteDeviceSessionService)initWithRemoteDeviceEventsCoordinator:(id)a3 connectionCoordinator:(id)a4 preflightManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  NPKIDVRemoteDeviceSessionService *v12;
  NPKIDVRemoteDeviceSessionService *v13;
  NSMutableSet *v14;
  NSMutableSet *sessionServers;
  NSXPCListener *v16;
  NSXPCListener *xpcListener;
  NSXPCListener *v18;
  NSObject *v19;
  NSObject *v20;
  objc_super v22;
  uint8_t buf[4];
  NPKIDVRemoteDeviceSessionService *v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)NPKIDVRemoteDeviceSessionService;
  v12 = -[NPKIDVRemoteDeviceSessionService init](&v22, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_remoteDeviceEventCoordinator, a3);
    objc_storeStrong((id *)&v13->_remoteDeviceConnectionCoordinator, a4);
    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    sessionServers = v13->_sessionServers;
    v13->_sessionServers = v14;

    objc_storeStrong((id *)&v13->_preflightManager, a5);
    v16 = (NSXPCListener *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.NanoPassbook.IDVRemoteDeviceService.session.server"));
    -[NSXPCListener setDelegate:](v16, "setDelegate:", v13);
    xpcListener = v13->_xpcListener;
    v13->_xpcListener = v16;
    v18 = v16;

    -[NSXPCListener resume](v18, "resume");
    pk_Payment_log();
    v19 = objc_claimAutoreleasedReturnValue();
    LODWORD(xpcListener) = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

    if ((_DWORD)xpcListener)
    {
      pk_Payment_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v24 = v13;
        v25 = 2112;
        v26 = CFSTR("com.apple.NanoPassbook.IDVRemoteDeviceService.session.server");
        _os_log_impl(&dword_213518000, v20, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: New Remote Device service Listener created:%@ with serviceName:%@", buf, 0x16u);
      }

    }
  }

  return v13;
}

- (void)dealloc
{
  NSMutableSet *sessionServers;
  objc_super v4;

  -[NSMutableSet enumerateObjectsUsingBlock:](self->_sessionServers, "enumerateObjectsUsingBlock:", &__block_literal_global_34);
  sessionServers = self->_sessionServers;
  self->_sessionServers = 0;

  v4.receiver = self;
  v4.super_class = (Class)NPKIDVRemoteDeviceSessionService;
  -[NPKIDVRemoteDeviceSessionService dealloc](&v4, sel_dealloc);
}

void __43__NPKIDVRemoteDeviceSessionService_dealloc__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v3 = a2;
  objc_msgSend(v3, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

  objc_msgSend(v3, "clearConnectionReference");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  NSXPCListener *v6;
  NSXPCListener *v7;
  NSXPCListener *xpcListener;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  int v18;
  NSXPCListener *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = (NSXPCListener *)a3;
  v7 = (NSXPCListener *)a4;
  xpcListener = self->_xpcListener;
  pk_Payment_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (xpcListener == v6)
  {
    v12 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v12)
    {
      pk_Payment_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 138412290;
        v19 = v7;
        _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested new connection:%@", (uint8_t *)&v18, 0xCu);
      }

    }
    -[NSXPCListener valueForEntitlement:](v7, "valueForEntitlement:", CFSTR("com.apple.NanoPassbook.IDVRemoteDeviceService.session.client"));
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || (-[NSObject BOOLValue](v11, "BOOLValue") & 1) != 0)
    {
      -[NPKIDVRemoteDeviceSessionService _addConnection:](self, "_addConnection:", v7);
      LOBYTE(self) = 1;
      goto LABEL_14;
    }
    pk_Payment_log();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);

    if (v16)
    {
      pk_Payment_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_213518000, v17, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: client doesn't have required entitlement to establish the connection", (uint8_t *)&v18, 2u);
      }

    }
LABEL_5:
    LOBYTE(self) = 0;
LABEL_14:

    goto LABEL_15;
  }
  LODWORD(self) = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

  if ((_DWORD)self)
  {
    pk_Payment_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v18 = 138412290;
      v19 = v6;
      _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Unknown requested connection from listener:%@", (uint8_t *)&v18, 0xCu);
    }
    goto LABEL_5;
  }
LABEL_15:

  return (char)self;
}

- (void)remoteDevicesSessionServer:(id)a3 provisionedCredentialCountsForType:(unint64_t)a4 completion:(id)a5
{
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t v16[8];
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v7 = (void (**)(id, _QWORD, void *))a5;
  -[NPKIDVRemoteDeviceSessionService dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NPKIDVRemoteDeviceSessionService dataSource](self, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "remoteDevicesSessionService:provisionedCredentialCountsForType:completion:", self, a4, v7);

  }
  else
  {
    pk_Payment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

    if (v11)
    {
      pk_Payment_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Unable to fetch provisioned credential count! No data source found.", v16, 2u);
      }

    }
    if (v7)
    {
      v13 = (void *)MEMORY[0x24BDD1540];
      v17 = *MEMORY[0x24BDD0FC8];
      v18[0] = CFSTR("No data source found");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NPKErrorDomain"), -1000, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v7[2](v7, 0, v15);
    }
  }

}

- (void)remoteDevicesSessionServer:(id)a3 remoteBiometricAuthenticationStatusForCredentialType:(unint64_t)a4 completion:(id)a5
{
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t v16[8];
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v7 = (void (**)(id, _QWORD, void *))a5;
  -[NPKIDVRemoteDeviceSessionService dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NPKIDVRemoteDeviceSessionService dataSource](self, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "remoteDevicesSessionService:remoteBiometricAuthenticationStatusForCredentialType:completion:", self, a4, v7);

  }
  else
  {
    pk_Payment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

    if (v11)
    {
      pk_Payment_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Unable to fetch remote biometric authentication status! No data source found.", v16, 2u);
      }

    }
    if (v7)
    {
      v13 = (void *)MEMORY[0x24BDD1540];
      v17 = *MEMORY[0x24BDD0FC8];
      v18[0] = CFSTR("No data source found");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NPKErrorDomain"), -1000, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v7[2](v7, 0, v15);
    }
  }

}

- (void)teardownCurrentRemoteDeviceSessions
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  NPKIDVRemoteDeviceSessionService *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = self;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %@, requested teardown all current remote device sessions", buf, 0xCu);
    }

  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = (void *)-[NSMutableSet copy](self->_sessionServers, "copy", 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[NPKIDVRemoteDeviceSessionService _removeServer:](self, "_removeServer:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)_addConnection:(id)a3
{
  id v4;
  NPKIDVRemoteDeviceSessionServer *v5;
  void *v6;
  uint64_t v7;
  NPKIDVRemoteDeviceSessionServer *v8;
  NPKIDVRemoteDeviceSessionServer *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  NPKIDVRemoteDeviceSessionServer *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  NPKIDVRemoteDeviceSessionServer *v18;
  id v19;
  id v20;
  id from;
  id location;

  v4 = a3;
  v5 = -[NPKIDVRemoteDeviceSessionServer initWithConnection:eventsCoordinator:connectionCoordinator:preflightManager:]([NPKIDVRemoteDeviceSessionServer alloc], "initWithConnection:eventsCoordinator:connectionCoordinator:preflightManager:", v4, self->_remoteDeviceEventCoordinator, self->_remoteDeviceConnectionCoordinator, self->_preflightManager);
  -[NPKIDVRemoteDeviceSessionServer setDataSource:](v5, "setDataSource:", self);
  NPKIDVRemoteDeviceServiceSessionServerProtocolInterface();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExportedInterface:", v6);

  objc_msgSend(v4, "setExportedObject:", v5);
  objc_initWeak(&location, self);
  objc_initWeak(&from, v4);
  v7 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __51__NPKIDVRemoteDeviceSessionService__addConnection___block_invoke;
  v17[3] = &unk_24CFE8380;
  objc_copyWeak(&v19, &from);
  objc_copyWeak(&v20, &location);
  v8 = v5;
  v18 = v8;
  objc_msgSend(v4, "setInvalidationHandler:", v17);
  v10 = v7;
  v11 = 3221225472;
  v12 = __51__NPKIDVRemoteDeviceSessionService__addConnection___block_invoke_18;
  v13 = &unk_24CFE8380;
  objc_copyWeak(&v15, &from);
  objc_copyWeak(&v16, &location);
  v9 = v8;
  v14 = v9;
  objc_msgSend(v4, "setInterruptionHandler:", &v10);
  -[NPKIDVRemoteDeviceSessionService _addServer:](self, "_addServer:", v9, v10, v11, v12, v13);
  objc_msgSend(v4, "resume");

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v15);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __51__NPKIDVRemoteDeviceSessionService__addConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = objc_loadWeakRetained((id *)(a1 + 48));
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412802;
      v8 = v3;
      v9 = 2112;
      v10 = WeakRetained;
      v11 = 1024;
      v12 = objc_msgSend(WeakRetained, "processIdentifier");
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %@ Connection invalidated:{%@, PID:%d}", (uint8_t *)&v7, 0x1Cu);
    }

  }
  objc_msgSend(v3, "_removeServer:", *(_QWORD *)(a1 + 32));

}

void __51__NPKIDVRemoteDeviceSessionService__addConnection___block_invoke_18(uint64_t a1)
{
  id WeakRetained;
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = objc_loadWeakRetained((id *)(a1 + 48));
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412802;
      v8 = v3;
      v9 = 2112;
      v10 = WeakRetained;
      v11 = 1024;
      v12 = objc_msgSend(WeakRetained, "processIdentifier");
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %@ Connection interrupted:{%@, PID:%d}", (uint8_t *)&v7, 0x1Cu);
    }

  }
  objc_msgSend(v3, "_removeServer:", *(_QWORD *)(a1 + 32));

}

- (void)_addServer:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSMutableSet addObject:](self->_sessionServers, "addObject:", v4);
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "connection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "connection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v8;
      v12 = 1024;
      v13 = objc_msgSend(v9, "processIdentifier");
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Added new connection:{%@, PID:%d}", (uint8_t *)&v10, 0x12u);

    }
  }

}

- (void)_removeServer:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  objc_msgSend(v4, "clearConnectionReference");
  -[NSMutableSet removeObject:](self->_sessionServers, "removeObject:", v4);
  pk_Payment_log();
  v6 = objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if ((_DWORD)v5)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "connection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "connection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v8;
      v12 = 1024;
      v13 = objc_msgSend(v9, "processIdentifier");
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Removed new connection:{%@, PID:%d}", (uint8_t *)&v10, 0x12u);

    }
  }

}

- (NPKIDVRemoteDeviceSessionServiceDataSource)dataSource
{
  return (NPKIDVRemoteDeviceSessionServiceDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_sessionServers, 0);
  objc_storeStrong((id *)&self->_preflightManager, 0);
  objc_storeStrong((id *)&self->_remoteDeviceConnectionCoordinator, 0);
  objc_storeStrong((id *)&self->_remoteDeviceEventCoordinator, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
}

@end
