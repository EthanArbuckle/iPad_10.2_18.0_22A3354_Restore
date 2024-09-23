@implementation ULServer

- (ULServer)initWithEnvironment:(id)a3
{
  id v4;
  NSObject *v5;
  ULServer *v6;
  NSObject *v7;
  _QWORD v9[4];
  ULServer *v10;
  id v11;
  objc_super v12;

  v4 = a3;
  objc_msgSend(v4, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  v12.receiver = self;
  v12.super_class = (Class)ULServer;
  v6 = -[ULServer init](&v12, sel_init);
  if (v6)
  {
    objc_msgSend(v4, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __32__ULServer_initWithEnvironment___block_invoke;
    v9[3] = &unk_2511D2CA8;
    v10 = v6;
    v11 = v4;
    dispatch_sync(v7, v9);

  }
  return v6;
}

uint64_t __32__ULServer_initWithEnvironment___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  ULLogicAdapter *v5;
  void *v6;
  ULLogicAdapter *v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "setEnvironment:", *(_QWORD *)(a1 + 40));
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setClientConnections:", v2);

  objc_msgSend(*(id *)(a1 + 32), "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ULTimerFactory setPrimaryQueue:](ULTimerFactory, "setPrimaryQueue:", v4);

  v5 = [ULLogicAdapter alloc];
  objc_msgSend(*(id *)(a1 + 32), "environment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ULLogicAdapter initWithEnvironment:delegate:](v5, "initWithEnvironment:delegate:", v6, *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "setLogicAdapter:", v7);

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSignals:", v8);

  return objc_msgSend(*(id *)(a1 + 32), "_start");
}

- (void)dealloc
{
  objc_super v3;

  -[ULServer _stop](self, "_stop");
  v3.receiver = self;
  v3.super_class = (Class)ULServer;
  -[ULServer dealloc](&v3, sel_dealloc);
}

- (void)locationsOfInterestDidClearNotification
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  -[ULServer environment](self, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__ULServer_locationsOfInterestDidClearNotification__block_invoke;
  block[3] = &unk_2511D2C58;
  block[4] = self;
  dispatch_async(v4, block);

}

void __51__ULServer_locationsOfInterestDidClearNotification__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_129);
  v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2419D9000, v2, OS_LOG_TYPE_DEFAULT, "locationsOfInterestDidClearNotification", v4, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "logicAdapter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "purgeMicroLocationData");

}

- (void)resetPrivacyWarningsNotification
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  -[ULServer environment](self, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__ULServer_resetPrivacyWarningsNotification__block_invoke;
  block[3] = &unk_2511D2C58;
  block[4] = self;
  dispatch_async(v4, block);

}

void __44__ULServer_resetPrivacyWarningsNotification__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_129);
  v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2419D9000, v2, OS_LOG_TYPE_DEFAULT, "resetPrivacyWarningsNotification", v4, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "logicAdapter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "purgeMicroLocationData");

}

- (void)_start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  -[ULServer environment](self, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "diagnostics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addProvider:", self);

  objc_initWeak(&location, self);
  -[ULServer signals](self, "signals");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_class();
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __18__ULServer__start__block_invoke;
  v11 = &unk_2511D2C80;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v6, "_createSourceForSignal:withBlock:", 15, &v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v7, v8, v9, v10, v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __18__ULServer__start__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_129);
    v2 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2419D9000, v2, OS_LOG_TYPE_DEFAULT, "Handle SIGTERM", buf, 2u);
    }
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setStimulationDate:", v3);

    objc_msgSend(WeakRetained, "environment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __18__ULServer__start__block_invoke_6;
    block[3] = &unk_2511D2C58;
    block[4] = WeakRetained;
    dispatch_async(v5, block);

  }
}

uint64_t __18__ULServer__start__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_exit");
}

- (void)_stop
{
  void *v3;
  void *v4;
  id v5;

  -[ULServer environment](self, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "diagnostics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeProvider:", self);

  -[ULServer signals](self, "signals");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &__block_literal_global_6);

}

void __17__ULServer__stop__block_invoke(int a1, dispatch_source_t source)
{
  dispatch_source_cancel(source);
}

- (id)_remoteProxyForToken:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ULServer environment](self, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[ULServer clientConnections](self, "clientConnections", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "connectionToken");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", v4);

        if ((v13 & 1) != 0)
        {
          objc_msgSend(v11, "remoteObjectProxy");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v8 = (void *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (void)_exit
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[ULServer environment](self, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  +[ULTransactionManager shared](ULTransactionManager, "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidateAllTransactions");

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_129);
  v6 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)MEMORY[0x24BDD16E0];
    v8 = (void *)MEMORY[0x24BDBCE60];
    v9 = v6;
    objc_msgSend(v8, "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ULServer stimulationDate](self, "stimulationDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceDate:", v11);
    objc_msgSend(v7, "numberWithDouble:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v12;
    _os_log_impl(&dword_2419D9000, v9, OS_LOG_TYPE_DEFAULT, "Clean exit in: %@", (uint8_t *)&v13, 0xCu);

  }
  xpc_transaction_exit_clean();
}

+ (id)_createSourceForSignal:(int)a3 withBlock:(id)a4
{
  id v5;
  NSObject *v6;

  v5 = a4;
  signal(a3, (void (__cdecl *)(int))1);
  v6 = dispatch_source_create(MEMORY[0x24BDACA08], a3, 0, MEMORY[0x24BDAC9B8]);
  dispatch_source_set_event_handler(v6, v5);

  dispatch_resume(v6);
  return v6;
}

- (ULEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_environment, a3);
}

- (NSMutableSet)clientConnections
{
  return self->_clientConnections;
}

- (void)setClientConnections:(id)a3
{
  objc_storeStrong((id *)&self->_clientConnections, a3);
}

- (ULLogicAdapter)logicAdapter
{
  return self->_logicAdapter;
}

- (void)setLogicAdapter:(id)a3
{
  objc_storeStrong((id *)&self->_logicAdapter, a3);
}

- (NSMutableSet)signals
{
  return self->_signals;
}

- (void)setSignals:(id)a3
{
  objc_storeStrong((id *)&self->_signals, a3);
}

- (NSDate)stimulationDate
{
  return self->_stimulationDate;
}

- (void)setStimulationDate:(id)a3
{
  objc_storeStrong((id *)&self->_stimulationDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stimulationDate, 0);
  objc_storeStrong((id *)&self->_signals, 0);
  objc_storeStrong((id *)&self->_logicAdapter, 0);
  objc_storeStrong((id *)&self->_clientConnections, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD block[4];
  id v15;
  ULServer *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v6 = a3;
  v7 = a4;
  -[ULServer environment](self, "environment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v9);

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  -[ULServer environment](self, "environment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__ULServer_NSXPCListenerDelegate__listener_shouldAcceptNewConnection___block_invoke;
  block[3] = &unk_2511D2E08;
  v15 = v7;
  v16 = self;
  v17 = &v18;
  v12 = v7;
  dispatch_sync(v11, block);

  LOBYTE(v7) = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v18, 8);

  return (char)v7;
}

void __70__ULServer_NSXPCListenerDelegate__listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  ULClientProcessConnection *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  ULClientProcessConnection *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  const char *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_129);
  v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v23 = 138412290;
    v24 = v3;
    _os_log_impl(&dword_2419D9000, v2, OS_LOG_TYPE_DEFAULT, "trying to accept connection: %@", (uint8_t *)&v23, 0xCu);
  }
  v4 = [ULClientProcessConnection alloc];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  objc_msgSend(v6, "logicAdapter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "logicAdapter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "logicAdapter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "environment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "queue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[ULClientProcessConnection initWithXPCConnection:delegate:serviceHandling:legacyServiceHandling:diagnosticsHandling:queue:](v4, "initWithXPCConnection:delegate:serviceHandling:legacyServiceHandling:diagnosticsHandling:queue:", v5, v6, v7, v8, v9, v11);

  if (v12)
  {
    -[ULClientProcessConnection signingIdentity](v12, "signingIdentity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 40), "clientConnections");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v12);

      if (onceToken_MicroLocation_Default != -1)
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_129);
      v15 = (void *)logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
      {
        v16 = v15;
        -[ULClientProcessConnection signingIdentity](v12, "signingIdentity");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(*(id *)(a1 + 40), "clientConnections");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "numberWithUnsignedInteger:", objc_msgSend(v19, "count"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138412546;
        v24 = v17;
        v25 = 2112;
        v26 = v20;
        _os_log_impl(&dword_2419D9000, v16, OS_LOG_TYPE_DEFAULT, "Accepting connection of: %@, number of connections: %@", (uint8_t *)&v23, 0x16u);

      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      goto LABEL_21;
    }
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_129);
    v21 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v23) = 0;
      v22 = "Connection is not signed, declining";
      goto LABEL_20;
    }
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_129);
    v21 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v23) = 0;
      v22 = "Connection declined";
LABEL_20:
      _os_log_impl(&dword_2419D9000, v21, OS_LOG_TYPE_ERROR, v22, (uint8_t *)&v23, 2u);
    }
  }
LABEL_21:

}

- (void)clientConnectionSeveredConnection:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;

  v4 = a3;
  -[ULServer environment](self, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v6);

  -[ULServer environment](self, "environment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__ULServer_ULClientProcessConnectionDelegate__clientConnectionSeveredConnection___block_invoke;
  block[3] = &unk_2511D2CA8;
  block[4] = self;
  v11 = v4;
  v9 = v4;
  dispatch_sync(v8, block);

}

void __81__ULServer_ULClientProcessConnectionDelegate__clientConnectionSeveredConnection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "clientConnections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "logicAdapter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "connectionToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removePendingConnectionRequestsByConnectionToken:", v4);

  objc_msgSend(*(id *)(a1 + 40), "serviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "logicAdapter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "connectionToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "signingIdentity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "disconnectWithConnectionToken:clientIdentifier:requestIdentifier:", v7, v8, v9);

  }
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_129);
  v10 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(void **)(a1 + 40);
    v12 = v10;
    objc_msgSend(v11, "signingIdentity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(*(id *)(a1 + 32), "clientConnections");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412546;
    v18 = v13;
    v19 = 2112;
    v20 = v16;
    _os_log_impl(&dword_2419D9000, v12, OS_LOG_TYPE_DEFAULT, "Connection (%@) severed, number of connections left: %@", (uint8_t *)&v17, 0x16u);

  }
}

- (id)diagnosticInfo
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  -[ULServer environment](self, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v4);

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__0;
  v14 = __Block_byref_object_dispose__0;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[ULServer environment](self, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __49__ULServer_ULDiagnosticsProvider__diagnosticInfo__block_invoke;
  v9[3] = &unk_2511D2E30;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(v6, v9);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __49__ULServer_ULDiagnosticsProvider__diagnosticInfo__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x24BDAC8D0];
  v11[0] = CFSTR("date");
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v2;
  v11[1] = CFSTR("platformInfo");
  objc_msgSend(MEMORY[0x24BE669E0], "platformInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v3;
  v11[2] = CFSTR("clientConnections");
  objc_msgSend(*(id *)(a1 + 32), "clientConnections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v5;
  v11[3] = CFSTR("transactions");
  +[ULTransactionManager shared](ULTransactionManager, "shared");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dumpActiveTransactions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

- (void)didSendPredictionResults:(id)a3 toConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[ULServer environment](self, "environment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  -[ULServer _remoteProxyForToken:](self, "_remoteProxyForToken:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "didUpdatePrediction:", v7);
}

- (void)didUpdateServiceStatus:(id)a3 toConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[ULServer environment](self, "environment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  -[ULServer _remoteProxyForToken:](self, "_remoteProxyForToken:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "didUpdateServiceStatus:", v7);
}

- (void)didCompleteRequest:(id)a3 withError:(id)a4 toConnection:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[ULServer environment](self, "environment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  -[ULServer _remoteProxyForToken:](self, "_remoteProxyForToken:", v8);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "didCompleteRequest:withError:", v10, v9);
}

- (void)didCreateCustomLoiAtCurrentLocationWithError:(id)a3 forConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[ULServer environment](self, "environment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  -[ULServer _remoteProxyForToken:](self, "_remoteProxyForToken:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "didCreateCustomLocationOfInterestWithError:", v7);
}

- (void)didRemoveCustomLoiWithIdentifier:(id)a3 forConnection:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[ULServer environment](self, "environment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  -[ULServer _remoteProxyForToken:](self, "_remoteProxyForToken:", v9);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "didRemoveCustomLocationOfInterestWithIdentifier:withError:", v10, v8);
}

- (void)didFailWithError:(id)a3 toConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[ULServer environment](self, "environment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  -[ULServer _remoteProxyForToken:](self, "_remoteProxyForToken:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "didFailWithError:", v7);
}

- (void)didSendGenericEvent:(unint64_t)a3 withDescription:(id)a4 toConnection:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  -[ULServer environment](self, "environment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  -[ULServer _remoteProxyForToken:](self, "_remoteProxyForToken:", v8);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "didSendGenericEvent:withDescription:", a3, v9);
}

- (void)didCompleteObservationWithMetaInformation:(id)a3 toConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[ULServer environment](self, "environment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  -[ULServer _remoteProxyForToken:](self, "_remoteProxyForToken:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "didCompleteObservationWithMetaInformation:", v7);
}

- (void)didCompletePredictionWithMetaInformation:(id)a3 toConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[ULServer environment](self, "environment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  -[ULServer _remoteProxyForToken:](self, "_remoteProxyForToken:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "didCompletePredictionWithMetaInformation:", v7);
}

@end
