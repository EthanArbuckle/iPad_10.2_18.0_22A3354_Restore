@implementation DEDController

- (DEDController)init
{
  DEDController *v2;
  DEDController *v3;
  NSDictionary *sessions;
  uint64_t v5;
  NSMutableDictionary *devices;
  uint64_t v7;
  NSMutableDictionary *sessionStartBlocks;
  uint64_t v9;
  NSMutableDictionary *sessionDidStartBlocks;
  DEDXPCConnector *xpcConnector;
  void *v12;
  uint64_t v13;
  dispatch_queue_t v14;
  id v15;
  OS_dispatch_queue *replyQueue;
  dispatch_queue_t v17;
  OS_dispatch_queue *workQueue;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)DEDController;
  v2 = -[DEDController init](&v20, sel_init);
  v3 = v2;
  if (v2)
  {
    sessions = v2->_sessions;
    v2->_sessions = (NSDictionary *)MEMORY[0x24BDBD1B8];

    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 5);
    devices = v3->_devices;
    v3->_devices = (NSMutableDictionary *)v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 5);
    sessionStartBlocks = v3->_sessionStartBlocks;
    v3->_sessionStartBlocks = (NSMutableDictionary *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 5);
    sessionDidStartBlocks = v3->_sessionDidStartBlocks;
    v3->_sessionDidStartBlocks = (NSMutableDictionary *)v9;

    v3->_isDaemon = 0;
    xpcConnector = v3->_xpcConnector;
    v3->_xpcConnector = 0;

    +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "connectionType");

    if (v13 == 1)
    {
      v14 = dispatch_queue_create("com.apple.diagnosticextensionsd.embedded-work-queue", 0);
    }
    else
    {
      v14 = (dispatch_queue_t)MEMORY[0x24BDAC9B8];
      v15 = MEMORY[0x24BDAC9B8];
    }
    replyQueue = v3->_replyQueue;
    v3->_replyQueue = (OS_dispatch_queue *)v14;

    v17 = dispatch_queue_create("com.apple.diagnosticextensionsd.work-queue", 0);
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v17;

    objc_storeWeak((id *)&v3->_clientDelegate, 0);
    objc_storeWeak((id *)&v3->_workerDelegate, 0);
    *(_DWORD *)&v3->_started = 0;
  }
  return v3;
}

- (OS_dispatch_queue)bugSessionCallbackQueue
{
  OS_dispatch_queue *bugSessionCallbackQueue;
  OS_dispatch_queue **p_bugSessionCallbackQueue;

  p_bugSessionCallbackQueue = &self->_bugSessionCallbackQueue;
  bugSessionCallbackQueue = self->_bugSessionCallbackQueue;
  if (!bugSessionCallbackQueue)
  {
    objc_storeStrong((id *)p_bugSessionCallbackQueue, MEMORY[0x24BDAC9B8]);
    bugSessionCallbackQueue = *p_bugSessionCallbackQueue;
  }
  return bugSessionCallbackQueue;
}

- (void)configureForDaemon
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[DEDController setIsDaemon:](self, "setIsDaemon:", 1);
  -[DEDController setUseSharing:](self, "setUseSharing:", 0);
  -[DEDController setUseIDS:](self, "setUseIDS:", 1);
  +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "connectionType") == 1)
  {

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "environment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("USE-DEBUG-SERVICE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      return;
  }
  -[DEDController setUseIDS:](self, "setUseIDS:", 0);
}

- (void)configureForSharing:(BOOL)a3
{
  NSObject *v4;

  if (a3)
  {
    -[DEDController log](self, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      -[DEDController configureForSharing:].cold.1();

  }
  -[DEDController setUseSharing:](self, "setUseSharing:", 0);
}

- (void)start
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21469E000, v0, v1, "DEDController#start: already running", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_3();
}

void __22__DEDController_start__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[16];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v25;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x2199D3FEC]();
        v10 = *(void **)(a1 + 32);
        objc_msgSend(v8, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeSessionWithIdentifier:", v11);

        objc_autoreleasePoolPop(v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 32), "log");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21469E000, v12, OS_LOG_TYPE_INFO, "checking for pending operations", buf, 2u);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "sessions", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allValues");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v18++), "resumePendingOperations");
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
    }
    while (v16);
  }

  objc_msgSend(*(id *)(a1 + 32), "upgradeToClassCDataProtectionIfNeeded");
}

+ (id)archivedClasses
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, objc_opt_class(), 0);
}

- (void)pingDaemonWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  -[DEDController setPongBlock:](self, "setPongBlock:", v4);
  objc_initWeak(&location, self);
  -[DEDController replyQueue](self, "replyQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __42__DEDController_pingDaemonWithCompletion___block_invoke;
  v6[3] = &unk_24D1E4B90;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __42__DEDController_pingDaemonWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "xpcConnector");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "diagnosticextensionsdXPCInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "xpc_ping");

}

- (void)discoverDevicesWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  id buf[2];

  v4 = a3;
  -[DEDController log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_21469E000, v5, OS_LOG_TYPE_DEFAULT, "started device discovery", (uint8_t *)buf, 2u);
  }

  -[DEDController setDevicesCompletion:](self, "setDevicesCompletion:", v4);
  objc_initWeak(buf, self);
  -[DEDController replyQueue](self, "replyQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__DEDController_discoverDevicesWithCompletion___block_invoke;
  block[3] = &unk_24D1E4B90;
  objc_copyWeak(&v8, buf);
  dispatch_async(v6, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(buf);

}

void __47__DEDController_discoverDevicesWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "xpcConnector");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "diagnosticextensionsdXPCInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "xpc_discoverAllAvailableDevices");

}

- (void)stopDiscovery
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;
  id buf[2];

  -[DEDController log](self, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_21469E000, v3, OS_LOG_TYPE_DEFAULT, "stopped device discovery", (uint8_t *)buf, 2u);
  }

  -[DEDController setDevicesCompletion:](self, "setDevicesCompletion:", 0);
  objc_initWeak(buf, self);
  -[DEDController replyQueue](self, "replyQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__DEDController_stopDiscovery__block_invoke;
  block[3] = &unk_24D1E4B90;
  objc_copyWeak(&v6, buf);
  dispatch_async(v4, block);

  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

void __30__DEDController_stopDiscovery__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "xpcConnector");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "diagnosticextensionsdXPCInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "xpc_stopDeviceDiscovery");

}

- (id)allKnownDevices
{
  return -[DEDController _allKnownDevicesWithIdentifier:](self, "_allKnownDevicesWithIdentifier:", 0);
}

- (id)_allKnownDevicesWithIdentifier:(id)a3
{
  id v4;
  DEDController *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[DEDController devices](v5, "devices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __48__DEDController__allKnownDevicesWithIdentifier___block_invoke;
  v11[3] = &unk_24D1E4BB8;
  v8 = v4;
  v12 = v8;
  objc_msgSend(v7, "ded_selectItemsPassingTest:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  return v9;
}

uint64_t __48__DEDController__allKnownDevicesWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = objc_msgSend(v3, "status");
  if (v4)
  {
    if (v5 == 4)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(v3, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

    }
  }
  else
  {
    v7 = v5 != 4;
  }

  return v7;
}

- (void)startPairSetupForDevice:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[DEDController log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "publicLogDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446466;
    v14 = "-[DEDController startPairSetupForDevice:]";
    v15 = 2114;
    v16 = v6;
    _os_log_impl(&dword_21469E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", buf, 0x16u);

  }
  -[DEDController _sharingDeviceForIncomingDevice:](self, "_sharingDeviceForIncomingDevice:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "transport") == 2)
  {
    objc_initWeak((id *)buf, self);
    -[DEDController replyQueue](self, "replyQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __41__DEDController_startPairSetupForDevice___block_invoke;
    v10[3] = &unk_24D1E4BE0;
    objc_copyWeak(&v12, (id *)buf);
    v11 = v7;
    dispatch_async(v8, v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    -[DEDController log](self, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[DEDController startPairSetupForDevice:].cold.1();

  }
}

void __41__DEDController_startPairSetupForDevice___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "xpcConnector");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "diagnosticextensionsdXPCInterface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "xpc_startPairSetupForDevice:", *(_QWORD *)(a1 + 32));

}

- (void)tryPIN:(id)a3 forDevice:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[DEDController log](self, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "publicLogDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446466;
    v18 = "-[DEDController tryPIN:forDevice:]";
    v19 = 2114;
    v20 = v9;
    _os_log_impl(&dword_21469E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", buf, 0x16u);

  }
  -[DEDController _sharingDeviceForIncomingDevice:](self, "_sharingDeviceForIncomingDevice:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "transport") == 2)
  {
    objc_initWeak((id *)buf, self);
    -[DEDController replyQueue](self, "replyQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __34__DEDController_tryPIN_forDevice___block_invoke;
    block[3] = &unk_24D1E4C08;
    objc_copyWeak(&v16, (id *)buf);
    v14 = v6;
    v15 = v10;
    dispatch_async(v11, block);

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    -[DEDController log](self, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[DEDController tryPIN:forDevice:].cold.1();

  }
}

void __34__DEDController_tryPIN_forDevice___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "xpcConnector");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "diagnosticextensionsdXPCInterface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "xpc_tryPIN:forDevice:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (id)_sharingDeviceForIncomingDevice:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;

  v4 = a3;
  -[DEDController _deviceForIncomingDevice:needsReady:](self, "_deviceForIncomingDevice:needsReady:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDController log](self, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[DEDController _sharingDeviceForIncomingDevice:].cold.1((uint64_t)v4, (uint64_t)v5, v6);

  return v5;
}

- (id)_deviceForIncomingDevice:(id)a3 needsReady:(BOOL)a4
{
  id v6;
  DEDController *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  BOOL v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  -[DEDController devices](v7, "devices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hashingKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    -[DEDController log](v7, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21469E000, v11, OS_LOG_TYPE_DEFAULT, "could not match device by transport-identifier, trying address", buf, 2u);
    }

    -[DEDController devices](v7, "devices");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x24BDAC760];
    v22 = 3221225472;
    v23 = __53__DEDController__deviceForIncomingDevice_needsReady___block_invoke;
    v24 = &unk_24D1E4C30;
    v14 = v6;
    v25 = v14;
    v26 = a4;
    objc_msgSend(v13, "ded_findWithBlock:", &v21);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[DEDController log](v7, "log", v21, v22, v23, v24);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v14, "description");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v28 = v16;
        _os_log_impl(&dword_21469E000, v15, OS_LOG_TYPE_DEFAULT, "matched device by address on [%{public}@]", buf, 0xCu);

      }
    }

  }
  objc_sync_exit(v7);

  -[DEDController log](v7, "log");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "publicLogSafeIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "publicLogSafeIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v18;
    v29 = 2114;
    v30 = v19;
    _os_log_impl(&dword_21469E000, v17, OS_LOG_TYPE_INFO, "device for incoming device %{public}@ -> %{public}@", buf, 0x16u);

  }
  return v10;
}

uint64_t __53__DEDController__deviceForIncomingDevice_needsReady___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned int v7;
  int v8;
  uint64_t v9;

  v3 = a2;
  v4 = objc_msgSend(v3, "remoteTransport");
  if (v4 == objc_msgSend(*(id *)(a1 + 32), "remoteTransport"))
  {
    objc_msgSend(v3, "address");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "address");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

    v8 = *(unsigned __int8 *)(a1 + 40);
    if (*(_BYTE *)(a1 + 40))
      v9 = 0;
    else
      v9 = v7;
    if (v8 && v7)
      v9 = objc_msgSend(v3, "status") == 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)hasDevice:(id)a3
{
  void *v3;
  BOOL v4;

  -[DEDController _deviceForIncomingDevice:](self, "_deviceForIncomingDevice:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)_deviceForIncomingDevice:(id)a3
{
  return -[DEDController _deviceForIncomingDevice:needsReady:](self, "_deviceForIncomingDevice:needsReady:", a3, 0);
}

- (void)startBugSessionWithIdentifier:(id)a3 configuration:(id)a4 target:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[DEDController logDeviceCounts](self, "logDeviceCounts");
  +[DEDDevice currentDevice](DEDDevice, "currentDevice");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  DEDSessionStartLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v14, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "address");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 136316162;
    v20 = "-[DEDController startBugSessionWithIdentifier:configuration:target:completion:]";
    v21 = 2112;
    v22 = v10;
    v23 = 2112;
    v24 = v16;
    v25 = 2112;
    v26 = v17;
    v27 = 2112;
    v28 = v18;
    _os_log_debug_impl(&dword_21469E000, v15, OS_LOG_TYPE_DEBUG, "%s %@:%@ -> %@ (%@)", (uint8_t *)&v19, 0x34u);

  }
  if (v10 && v13)
  {
    -[DEDController addSessionStartCompletion:withIdentifier:configuration:targetDevice:](self, "addSessionStartCompletion:withIdentifier:configuration:targetDevice:", v13, v10, v11, v12);
    -[DEDController startBugSessionWithIdentifier:configuration:caller:target:fromInbound:](self, "startBugSessionWithIdentifier:configuration:caller:target:fromInbound:", v10, v11, v14, v12, 0);
  }

}

- (id)sessionForIdentifier:(id)a3
{
  id v4;
  DEDController *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[DEDController sessions](v5, "sessions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  return v7;
}

- (void)insertNewSession:(id)a3
{
  id v4;
  NSObject *v5;
  DEDController *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[DEDController log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[DEDController insertNewSession:].cold.1(v4, v5);

  v6 = self;
  objc_sync_enter(v6);
  v7 = objc_alloc(MEMORY[0x24BDBCED8]);
  -[DEDController sessions](v6, "sessions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithDictionary:", v8);

  objc_msgSend(v4, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v4, v10);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithDictionary:", v9);
  -[DEDController setSessions:](v6, "setSessions:", v11);

  objc_sync_exit(v6);
}

- (void)removeSessionWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  DEDController *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[DEDController log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[DEDController removeSessionWithIdentifier:].cold.1();

  v6 = self;
  objc_sync_enter(v6);
  v7 = objc_alloc(MEMORY[0x24BDBCED8]);
  -[DEDController sessions](v6, "sessions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithDictionary:", v8);

  objc_msgSend(v9, "removeObjectForKey:", v4);
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDController setSessions:](v6, "setSessions:", v10);

  objc_sync_exit(v6);
}

- (id)knownSessions
{
  void *v2;
  void *v3;

  -[DEDController sessions](self, "sessions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)reset
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[DEDController log](self, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[DEDController reset]";
    _os_log_impl(&dword_21469E000, v3, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[DEDController sessions](self, "sessions", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[DEDController abortSession:](self, "abortSession:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)listXPCConnections:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  -[DEDController setXpcConnectionsCompletion:](self, "setXpcConnectionsCompletion:", v4);
  objc_initWeak(&location, self);
  -[DEDController replyQueue](self, "replyQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __36__DEDController_listXPCConnections___block_invoke;
  v6[3] = &unk_24D1E4B90;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __36__DEDController_listXPCConnections___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "xpcConnector");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "diagnosticextensionsdXPCInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "xpc_listClientXPCConnections");

}

- (void)abortSession:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint8_t v17[16];

  v6 = a3;
  v7 = a4;
  -[DEDController log](self, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[DEDController abortSession:withCompletion:].cold.2(v8, v9, v10);

  if (v7)
  {
    -[DEDController didCancelCompletion](self, "didCancelCompletion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[DEDController log](self, "log");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_21469E000, v12, OS_LOG_TYPE_DEFAULT, "will overwrite previous DEDDidCancelSessionCompletion block", v17, 2u);
      }

    }
    -[DEDController setDidCancelCompletion:](self, "setDidCancelCompletion:", v7);
  }
  objc_msgSend(v6, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[DEDController sessions](self, "sessions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      -[DEDController log](self, "log");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[DEDController abortSession:withCompletion:].cold.1();

    }
    objc_msgSend(v15, "cancel");

  }
}

- (void)abortSession:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[DEDController log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_21469E000, v5, OS_LOG_TYPE_INFO, "Aborting session %@", (uint8_t *)&v7, 0xCu);

  }
  -[DEDController abortSession:withCompletion:](self, "abortSession:withCompletion:", v4, 0);

}

- (void)_didAbortSessionWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;

  v4 = a3;
  -[DEDController didCancelCompletion](self, "didCancelCompletion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[DEDController didCancelCompletion](self, "didCancelCompletion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDController replyQueue](self, "replyQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = __40__DEDController__didAbortSessionWithID___block_invoke;
    v12 = &unk_24D1E4628;
    v14 = v6;
    v13 = v4;
    v8 = v6;
    dispatch_async(v7, &v9);

    -[DEDController setDidCancelCompletion:](self, "setDidCancelCompletion:", 0, v9, v10, v11, v12);
  }

}

uint64_t __40__DEDController__didAbortSessionWithID___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)hasActiveSessionForIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[DEDController setSessionExistsCompletion:](self, "setSessionExistsCompletion:", v7);
  -[DEDController log](self, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v15 = v6;
    _os_log_impl(&dword_21469E000, v8, OS_LOG_TYPE_DEFAULT, "Retrieving active session: %{public}@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  -[DEDController replyQueue](self, "replyQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __58__DEDController_hasActiveSessionForIdentifier_completion___block_invoke;
  v11[3] = &unk_24D1E4BE0;
  objc_copyWeak(&v13, (id *)buf);
  v12 = v6;
  v10 = v6;
  dispatch_async(v9, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);

}

void __58__DEDController_hasActiveSessionForIdentifier_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "xpcConnector");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "diagnosticextensionsdXPCInterface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "xpc_hasActiveSession:", *(_QWORD *)(a1 + 32));

}

- (BOOL)hasRecentlyFinishedSessionWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[DEDController recentlyFinishedSessions](self, "recentlyFinishedSessions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __58__DEDController_hasRecentlyFinishedSessionWithIdentifier___block_invoke;
  v10[3] = &unk_24D1E4C58;
  v11 = v4;
  v6 = v4;
  objc_msgSend(v5, "ded_findWithBlock:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 != 0;

  return v8;
}

uint64_t __58__DEDController_hasRecentlyFinishedSessionWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualToString:", *(_QWORD *)(a1 + 32));
}

- (void)forceRemoveNotificationOfType:(int64_t)a3 identifier:(id)a4 hostIdentifier:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18[2];
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  -[DEDController log](self, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a3 > 2)
      v11 = "Unknown";
    else
      v11 = off_24D1E4EE0[a3];
    *(_DWORD *)buf = 136446722;
    v20 = v11;
    v21 = 2114;
    v22 = v8;
    v23 = 2114;
    v24 = v9;
    _os_log_impl(&dword_21469E000, v10, OS_LOG_TYPE_DEFAULT, "Force removing notification of type [%{public}s] identifier [%{public}@] app [%{public}@]", buf, 0x20u);
  }

  objc_initWeak((id *)buf, self);
  -[DEDController replyQueue](self, "replyQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __73__DEDController_forceRemoveNotificationOfType_identifier_hostIdentifier___block_invoke;
  v15[3] = &unk_24D1E4C80;
  objc_copyWeak(v18, (id *)buf);
  v18[1] = (id)a3;
  v16 = v8;
  v17 = v9;
  v13 = v9;
  v14 = v8;
  dispatch_async(v12, v15);

  objc_destroyWeak(v18);
  objc_destroyWeak((id *)buf);
}

void __73__DEDController_forceRemoveNotificationOfType_identifier_hostIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "xpcConnector");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "diagnosticextensionsdXPCInterface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "xpc_forceRemoveNotificationOfType:identifier:hostIdentifier:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)connector:(id)a3 didLooseConnectionToProcessWithPid:(int)a4
{
  _BOOL4 v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = -[DEDController isDaemon](self, "isDaemon", a3);
  -[DEDController log](self, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[DEDController connector:didLooseConnectionToProcessWithPid:].cold.1();
    goto LABEL_10;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = a4;
    _os_log_impl(&dword_21469E000, v8, OS_LOG_TYPE_DEFAULT, "Daemon DED Controller lost connection to app with pid [%i]", (uint8_t *)v10, 8u);
  }

  if (-[DEDController useSharing](self, "useSharing"))
  {
    -[DEDController log](self, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_21469E000, v9, OS_LOG_TYPE_DEFAULT, "Daemon DED Controller will stop discovery", (uint8_t *)v10, 2u);
    }

    -[DEDController sharingConnection](self, "sharingConnection");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject stopDiscovery](v8, "stopDiscovery");
LABEL_10:

  }
}

- (id)connector:(id)a3 needsXPCInboundForPid:(id)a4
{
  id v5;
  DEDXPCInbound *v6;

  v5 = a4;
  v6 = -[DEDXPCInbound initWithDelegate:senderPid:]([DEDXPCInbound alloc], "initWithDelegate:senderPid:", self, v5);

  return v6;
}

- (void)xpcInbound_forceRemoveNotificationOfType:(int64_t)a3 identifier:(id)a4 hostIdentifier:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  __objc2_class *v11;
  NSObject *v12;

  v8 = a4;
  v9 = a5;
  if (a3 == 2)
  {
    v11 = DEDFollowUpNotifier;
LABEL_9:
    -[__objc2_class forceRemoveNotificationWithIdentifier:hostIdentifier:](v11, "forceRemoveNotificationWithIdentifier:hostIdentifier:", v8, v9);
    goto LABEL_13;
  }
  if (a3 == 1)
  {
    v11 = DEDUserNotificationNotifier;
    goto LABEL_9;
  }
  if (a3)
  {
    -[DEDController log](self, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[DEDController xpcInbound_forceRemoveNotificationOfType:identifier:hostIdentifier:].cold.1(a3, v12);

  }
  else
  {
    -[DEDController log](self, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[DEDController xpcInbound_forceRemoveNotificationOfType:identifier:hostIdentifier:].cold.2();

  }
LABEL_13:

}

- (void)xpcInbound_ping:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[DEDController replyQueue](self, "replyQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__DEDController_xpcInbound_ping___block_invoke;
  block[3] = &unk_24D1E4BE0;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __33__DEDController_xpcInbound_ping___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "xpcConnector");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientXPCInterfaceFromInbound:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "xpc_pong");

}

- (void)xpcInbound_pong
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[DEDController replyQueue](self, "replyQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __32__DEDController_xpcInbound_pong__block_invoke;
  v4[3] = &unk_24D1E4B90;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __32__DEDController_xpcInbound_pong__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void (**v4)(void);
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "pongBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v5 = objc_loadWeakRetained(v1);
    objc_msgSend(v5, "pongBlock");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

- (void)xpcInbound_discoverAllAvailableDevices:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  DEDController *v11;
  id v12;
  uint8_t buf[8];
  id location;

  v4 = a3;
  v5 = objc_initWeak(&location, self);
  -[DEDController log](self, "log");
  v6 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21469E000, v6, OS_LOG_TYPE_DEFAULT, "'Will start device discovery", buf, 2u);
  }

  -[DEDController workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__DEDController_xpcInbound_discoverAllAvailableDevices___block_invoke;
  block[3] = &unk_24D1E4C08;
  objc_copyWeak(&v12, &location);
  v10 = v4;
  v11 = self;
  v8 = v4;
  dispatch_async(v7, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __56__DEDController_xpcInbound_discoverAllAvailableDevices___block_invoke(id *a1)
{
  id WeakRetained;
  NSObject *v2;
  id v3;
  int v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  int v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  dispatch_time_t v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  id v29;
  NSObject *v30;
  int v31;
  void *v32;
  id v33;
  NSObject *v34;
  id obj;
  NSObject *group;
  id *location;
  _QWORD v39[4];
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[4];
  id v47;
  id v48;
  _QWORD v49[4];
  id v50;
  id v51;
  _QWORD block[4];
  id v53;
  _QWORD v54[4];
  id v55;
  id v56;
  uint8_t buf[4];
  _BYTE v58[14];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  location = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "log");
  v2 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21469E000, v2, OS_LOG_TYPE_DEFAULT, "Starting device discovery", buf, 2u);
  }

  group = dispatch_group_create();
  v3 = objc_loadWeakRetained(location);
  v4 = objc_msgSend(v3, "useIDS");

  if (v4)
  {
    v5 = objc_loadWeakRetained(location);
    objc_msgSend(v5, "idsConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = MEMORY[0x24BDAC760];
    v54[1] = 3221225472;
    v54[2] = __56__DEDController_xpcInbound_discoverAllAvailableDevices___block_invoke_36;
    v54[3] = &unk_24D1E4CA8;
    objc_copyWeak(&v56, location);
    v55 = a1[4];
    objc_msgSend(v6, "setDeviceCallback:", v54);

    dispatch_get_global_queue(21, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __56__DEDController_xpcInbound_discoverAllAvailableDevices___block_invoke_3;
    block[3] = &unk_24D1E4B90;
    objc_copyWeak(&v53, location);
    dispatch_group_async(group, v7, block);

    objc_destroyWeak(&v53);
    objc_destroyWeak(&v56);
  }
  v8 = objc_loadWeakRetained(location);
  v9 = objc_msgSend(v8, "useSharing");

  if (v9)
  {
    v10 = objc_loadWeakRetained(location);
    objc_msgSend(v10, "sharingConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = MEMORY[0x24BDAC760];
    v49[1] = 3221225472;
    v49[2] = __56__DEDController_xpcInbound_discoverAllAvailableDevices___block_invoke_5;
    v49[3] = &unk_24D1E4CA8;
    objc_copyWeak(&v51, location);
    v50 = a1[4];
    objc_msgSend(v11, "setDeviceDiscoveryCallback:", v49);

    v12 = objc_loadWeakRetained(location);
    objc_msgSend(v12, "log");
    v13 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21469E000, v13, OS_LOG_TYPE_INFO, "Starting sharing...", buf, 2u);
    }

    dispatch_get_global_queue(21, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v46[0] = MEMORY[0x24BDAC760];
    v46[1] = 3221225472;
    v46[2] = __56__DEDController_xpcInbound_discoverAllAvailableDevices___block_invoke_38;
    v46[3] = &unk_24D1E4BE0;
    objc_copyWeak(&v48, location);
    v47 = a1[4];
    dispatch_group_async(group, v14, v46);

    objc_destroyWeak(&v48);
    objc_destroyWeak(&v51);
  }
  v15 = dispatch_time(0, 0xDF8476000);
  dispatch_group_wait(group, v15);
  obj = a1[5];
  objc_sync_enter(obj);
  v16 = objc_loadWeakRetained(location);
  objc_msgSend(v16, "log");
  v17 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = objc_loadWeakRetained(location);
    objc_msgSend(v18, "devices");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "allKeys");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v58 = v21;
    _os_log_impl(&dword_21469E000, v17, OS_LOG_TYPE_DEFAULT, "discovered devices [%lu]", buf, 0xCu);

  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v22 = objc_loadWeakRetained(location);
  objc_msgSend(v22, "devices");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "allValues");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v42, v59, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v43 != v26)
          objc_enumerationMutation(v24);
        v28 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        v29 = objc_loadWeakRetained(location);
        objc_msgSend(v29, "log");
        v30 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          v31 = objc_msgSend(v28, "transport");
          objc_msgSend(v28, "publicLogSafeIdentifier");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v58 = v31;
          *(_WORD *)&v58[4] = 2114;
          *(_QWORD *)&v58[6] = v32;
          _os_log_impl(&dword_21469E000, v30, OS_LOG_TYPE_DEFAULT, "discovered [%i-%{public}@]", buf, 0x12u);

        }
      }
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v42, v59, 16);
    }
    while (v25);
  }

  objc_sync_exit(obj);
  v33 = objc_loadWeakRetained(location);
  objc_msgSend(v33, "replyQueue");
  v34 = objc_claimAutoreleasedReturnValue();
  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __56__DEDController_xpcInbound_discoverAllAvailableDevices___block_invoke_40;
  v39[3] = &unk_24D1E4BE0;
  objc_copyWeak(&v41, location);
  v40 = a1[4];
  dispatch_async(v34, v39);

  objc_destroyWeak(&v41);
}

void __56__DEDController_xpcInbound_discoverAllAvailableDevices___block_invoke_36(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "addDevice:", v3);

  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v5, "replyQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__DEDController_xpcInbound_discoverAllAvailableDevices___block_invoke_2;
  block[3] = &unk_24D1E4C08;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  v9 = *(id *)(a1 + 32);
  v10 = v3;
  v7 = v3;
  dispatch_async(v6, block);

  objc_destroyWeak(&v11);
}

void __56__DEDController_xpcInbound_discoverAllAvailableDevices___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "xpcConnector");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientXPCInterfaceFromInbound:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "xpc_gotDeviceUpdate:", *(_QWORD *)(a1 + 40));

}

void __56__DEDController_xpcInbound_discoverAllAvailableDevices___block_invoke_3(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  _QWORD v4[4];
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "idsConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __56__DEDController_xpcInbound_discoverAllAvailableDevices___block_invoke_4;
  v4[3] = &unk_24D1E4CD0;
  objc_copyWeak(&v5, v1);
  objc_msgSend(v3, "discoverDevicesWithCompletion:", v4);

  objc_destroyWeak(&v5);
}

void __56__DEDController_xpcInbound_discoverAllAvailableDevices___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id *v7;
  uint64_t v8;
  uint64_t v9;
  id WeakRetained;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    v7 = (id *)(a1 + 32);
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
        WeakRetained = objc_loadWeakRetained(v7);
        objc_msgSend(WeakRetained, "addDevice:", v9);

        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

void __56__DEDController_xpcInbound_discoverAllAvailableDevices___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "addDevice:", v3);

  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v5, "replyQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__DEDController_xpcInbound_discoverAllAvailableDevices___block_invoke_6;
  block[3] = &unk_24D1E4C08;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  v9 = *(id *)(a1 + 32);
  v10 = v3;
  v7 = v3;
  dispatch_async(v6, block);

  objc_destroyWeak(&v11);
}

void __56__DEDController_xpcInbound_discoverAllAvailableDevices___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "xpcConnector");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientXPCInterfaceFromInbound:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "xpc_gotDeviceUpdate:", *(_QWORD *)(a1 + 40));

}

void __56__DEDController_xpcInbound_discoverAllAvailableDevices___block_invoke_38(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "sharingConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __56__DEDController_xpcInbound_discoverAllAvailableDevices___block_invoke_2_39;
  v6[3] = &unk_24D1E4CD0;
  objc_copyWeak(&v7, v2);
  objc_msgSend(v4, "discoverDevicesFromInbound:withCompletion:", v5, v6);

  objc_destroyWeak(&v7);
}

void __56__DEDController_xpcInbound_discoverAllAvailableDevices___block_invoke_2_39(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id *v7;
  uint64_t v8;
  uint64_t v9;
  id WeakRetained;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    v7 = (id *)(a1 + 32);
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
        WeakRetained = objc_loadWeakRetained(v7);
        objc_msgSend(WeakRetained, "addDevice:", v9);

        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

void __56__DEDController_xpcInbound_discoverAllAvailableDevices___block_invoke_40(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id WeakRetained;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "xpcConnector");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientXPCInterfaceFromInbound:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "allKnownDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "xpc_didDiscoverDevices:", v6);

}

- (void)xpcInbound_gotDeviceUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[DEDController log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v11 = v6;
    v12 = 2048;
    v13 = objc_msgSend(v4, "status");
    _os_log_impl(&dword_21469E000, v5, OS_LOG_TYPE_INFO, "Update: %@ status %ld", buf, 0x16u);

  }
  -[DEDController addDevice:](self, "addDevice:", v4);
  objc_initWeak((id *)buf, self);
  -[DEDController replyQueue](self, "replyQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__DEDController_xpcInbound_gotDeviceUpdate___block_invoke;
  block[3] = &unk_24D1E4B90;
  objc_copyWeak(&v9, (id *)buf);
  dispatch_async(v7, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);

}

void __44__DEDController_xpcInbound_gotDeviceUpdate___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint8_t buf[16];

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "devicesCompletion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_loadWeakRetained(v1);
  v9 = v4;
  if (v3)
  {
    objc_msgSend(v4, "devicesCompletion");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v6 = objc_loadWeakRetained(v1);
    objc_msgSend(v6, "allKnownDevices");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v5)[2](v5, v7);

  }
  else
  {
    objc_msgSend(v4, "log");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21469E000, v8, OS_LOG_TYPE_INFO, "discovered devices, no completion block registered", buf, 2u);
    }

  }
}

- (void)xpcInbound_didDiscoverDevices:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id location;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        -[DEDController addDevice:](self, "addDevice:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  objc_initWeak(&location, self);
  -[DEDController replyQueue](self, "replyQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __47__DEDController_xpcInbound_didDiscoverDevices___block_invoke;
  v9[3] = &unk_24D1E4B90;
  objc_copyWeak(&v10, &location);
  dispatch_async(v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __47__DEDController_xpcInbound_didDiscoverDevices___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint8_t buf[16];

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "devicesCompletion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_loadWeakRetained(v1);
  v9 = v4;
  if (v3)
  {
    objc_msgSend(v4, "devicesCompletion");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v6 = objc_loadWeakRetained(v1);
    objc_msgSend(v6, "allKnownDevices");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v5)[2](v5, v7);

  }
  else
  {
    objc_msgSend(v4, "log");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21469E000, v8, OS_LOG_TYPE_DEFAULT, "discovered devices, no completion block registered", buf, 2u);
    }

  }
}

- (void)xpcInbound_stopDeviceDiscovery:(id)a3
{
  id v4;

  if (-[DEDController useSharing](self, "useSharing", a3))
  {
    -[DEDController sharingConnection](self, "sharingConnection");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopDiscovery");

  }
}

- (void)xpcInbound_hasActiveSession:(id)a3 fromInbound:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  BOOL v17;
  id location;

  v6 = a3;
  v7 = a4;
  -[DEDController sessions](self, "sessions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  -[DEDController replyQueue](self, "replyQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__DEDController_xpcInbound_hasActiveSession_fromInbound___block_invoke;
  block[3] = &unk_24D1E4CF8;
  objc_copyWeak(&v16, &location);
  v14 = v7;
  v15 = v6;
  v17 = v9 != 0;
  v11 = v6;
  v12 = v7;
  dispatch_async(v10, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __57__DEDController_xpcInbound_hasActiveSession_fromInbound___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "xpcConnector");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientXPCInterfaceFromInbound:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "xpc_hasActiveSessionReply:isActive:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));

}

- (void)xpcInbound_hasActiveSessionReply:(id)a3 isActive:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  BOOL v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v4 = a4;
  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[DEDController log](self, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("No");
    if (v4)
      v8 = CFSTR("Yes");
    *(_DWORD *)buf = 138543618;
    v15 = v6;
    v16 = 2114;
    v17 = v8;
    _os_log_impl(&dword_21469E000, v7, OS_LOG_TYPE_DEFAULT, "Session %{public}@ is active %{public}@", buf, 0x16u);
  }

  -[DEDController sessionExistsCompletion](self, "sessionExistsCompletion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_initWeak((id *)buf, self);
    -[DEDController replyQueue](self, "replyQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __59__DEDController_xpcInbound_hasActiveSessionReply_isActive___block_invoke;
    v11[3] = &unk_24D1E4D20;
    objc_copyWeak(&v12, (id *)buf);
    v13 = v4;
    dispatch_async(v10, v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }

}

void __59__DEDController_xpcInbound_hasActiveSessionReply_isActive___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void (**v4)(_QWORD, _QWORD);
  id v5;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "sessionExistsCompletion");
  v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v4[2](v4, *(unsigned __int8 *)(a1 + 40));

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "setSessionExistsCompletion:", 0);

}

- (void)xpc_listClientXPCConnectionsFromInbound:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v4 = a3;
  -[DEDController xpcConnector](self, "xpcConnector");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientConnections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  -[DEDController replyQueue](self, "replyQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __57__DEDController_xpc_listClientXPCConnectionsFromInbound___block_invoke;
  v10[3] = &unk_24D1E4C08;
  objc_copyWeak(&v13, &location);
  v11 = v4;
  v12 = v6;
  v8 = v6;
  v9 = v4;
  dispatch_async(v7, v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __57__DEDController_xpc_listClientXPCConnectionsFromInbound___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "xpcConnector");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientXPCInterfaceFromInbound:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "xpc_listClientXPCConnectionsReply:", *(_QWORD *)(a1 + 40));

}

- (void)xpcInbound_listClientXPCConnectionsReply:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  -[DEDController xpcConnectionsCompletion](self, "xpcConnectionsCompletion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_initWeak(&location, self);
    -[DEDController replyQueue](self, "replyQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __58__DEDController_xpcInbound_listClientXPCConnectionsReply___block_invoke;
    block[3] = &unk_24D1E4BE0;
    objc_copyWeak(&v9, &location);
    v8 = v4;
    dispatch_async(v6, block);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

void __58__DEDController_xpcInbound_listClientXPCConnectionsReply___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void (**v4)(_QWORD, _QWORD);
  id v5;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "xpcConnectionsCompletion");
  v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v4[2](v4, *(_QWORD *)(a1 + 32));

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "setXpcConnectionsCompletion:", 0);

}

- (void)xpcInbound_startPairSetupForDevice:(id)a3 fromInbound:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;

  v6 = a3;
  v7 = a4;
  -[DEDController _sharingDeviceForIncomingDevice:](self, "_sharingDeviceForIncomingDevice:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "transport") == 3)
  {
    -[DEDController sharingConnection](self, "sharingConnection");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject sharing_startPairSetupForDevice:fromInbound:](v9, "sharing_startPairSetupForDevice:fromInbound:", v8, v7);
  }
  else
  {
    -[DEDController log](self, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[DEDController xpcInbound_startPairSetupForDevice:fromInbound:].cold.1();
  }

}

- (void)xpcInbound_promptPINForDevice:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD block[4];
  NSObject *v10;
  id v11;
  id location;

  v4 = a3;
  -[DEDController pairingDelegate](self, "pairingDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[DEDController _sharingDeviceForIncomingDevice:](self, "_sharingDeviceForIncomingDevice:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject transport](v6, "transport") == 2)
    {
      objc_initWeak(&location, self);
      -[DEDController replyQueue](self, "replyQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __47__DEDController_xpcInbound_promptPINForDevice___block_invoke;
      block[3] = &unk_24D1E4BE0;
      objc_copyWeak(&v11, &location);
      v6 = v6;
      v10 = v6;
      dispatch_async(v7, block);

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
    else
    {
      -[DEDController log](self, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[DEDController xpcInbound_promptPINForDevice:].cold.2();

    }
  }
  else
  {
    -[DEDController log](self, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[DEDController xpcInbound_promptPINForDevice:].cold.1();
  }

}

void __47__DEDController_xpcInbound_promptPINForDevice___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "pairingDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "promptPINForDevice:", *(_QWORD *)(a1 + 32));

}

- (void)xpcInbound_tryPIN:(id)a3 forDevice:(id)a4 fromInbound:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[DEDController _sharingDeviceForIncomingDevice:](self, "_sharingDeviceForIncomingDevice:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "transport") == 3)
  {
    -[DEDController sharingConnection](self, "sharingConnection");
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject sharing_tryPIN:forDevice:fromInbound:](v12, "sharing_tryPIN:forDevice:fromInbound:", v8, v9, v10);
  }
  else
  {
    -[DEDController log](self, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[DEDController xpcInbound_tryPIN:forDevice:fromInbound:].cold.1();
  }

}

- (void)xpcInbound_successPINForDevice:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  -[DEDController _sharingDeviceForIncomingDevice:](self, "_sharingDeviceForIncomingDevice:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "transport") == 2)
  {
    objc_initWeak(&location, self);
    -[DEDController replyQueue](self, "replyQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48__DEDController_xpcInbound_successPINForDevice___block_invoke;
    block[3] = &unk_24D1E4BE0;
    objc_copyWeak(&v10, &location);
    v9 = v5;
    dispatch_async(v6, block);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    -[DEDController log](self, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[DEDController xpcInbound_successPINForDevice:].cold.1();

  }
}

void __48__DEDController_xpcInbound_successPINForDevice___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "pairingDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "successPINForDevice:", *(_QWORD *)(a1 + 32));

}

- (void)sharingInbound_promptPINForDevice:(id)a3 fromInbound:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  -[DEDController _sharingDeviceForIncomingDevice:](self, "_sharingDeviceForIncomingDevice:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "transport") == 3)
  {
    objc_initWeak(&location, self);
    -[DEDController replyQueue](self, "replyQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __63__DEDController_sharingInbound_promptPINForDevice_fromInbound___block_invoke;
    v11[3] = &unk_24D1E4C08;
    objc_copyWeak(&v14, &location);
    v12 = v7;
    v13 = v8;
    dispatch_async(v9, v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    -[DEDController log](self, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[DEDController sharingInbound_promptPINForDevice:fromInbound:].cold.1();

  }
}

void __63__DEDController_sharingInbound_promptPINForDevice_fromInbound___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "xpcConnector");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientXPCInterfaceFromInbound:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "xpc_promptPINForDevice:", *(_QWORD *)(a1 + 40));

}

- (void)sharingInbound_successPINForDevice:(id)a3 fromInbound:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  -[DEDController _sharingDeviceForIncomingDevice:](self, "_sharingDeviceForIncomingDevice:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "transport") == 3)
  {
    objc_initWeak(&location, self);
    -[DEDController replyQueue](self, "replyQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __64__DEDController_sharingInbound_successPINForDevice_fromInbound___block_invoke;
    v11[3] = &unk_24D1E4C08;
    objc_copyWeak(&v14, &location);
    v12 = v7;
    v13 = v8;
    dispatch_async(v9, v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    -[DEDController log](self, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[DEDController sharingInbound_successPINForDevice:fromInbound:].cold.1();

  }
}

void __64__DEDController_sharingInbound_successPINForDevice_fromInbound___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "xpcConnector");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientXPCInterfaceFromInbound:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "xpc_successPINForDevice:", *(_QWORD *)(a1 + 40));

}

- (void)sharingInbound_startBugSessionWithIdentifier:(id)a3 configuration:(id)a4 caller:(id)a5 target:(id)a6
{
  -[DEDController startBugSessionWithIdentifier:configuration:caller:target:fromInbound:](self, "startBugSessionWithIdentifier:configuration:caller:target:fromInbound:", a3, a4, a5, a6, 0);
}

- (void)idsInbound_startBugSessionWithIdentifier:(id)a3 configuration:(id)a4 caller:(id)a5 target:(id)a6
{
  -[DEDController startBugSessionWithIdentifier:configuration:caller:target:fromInbound:](self, "startBugSessionWithIdentifier:configuration:caller:target:fromInbound:", a3, a4, a5, a6, 0);
}

- (void)idsInbound_devicesChanged:(id)a3
{
  -[DEDController idsInbound_devicesChanged:completion:](self, "idsInbound_devicesChanged:completion:", a3, 0);
}

- (void)idsInbound_devicesChanged:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__DEDController_idsInbound_devicesChanged_completion___block_invoke;
  block[3] = &unk_24D1E4D48;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __54__DEDController_idsInbound_devicesChanged_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  uint64_t result;
  id v30;
  void *v31;
  id obj;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[5];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  uint8_t v50[4];
  uint64_t v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v30 = *(id *)(a1 + 32);
  objc_sync_enter(v30);
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", 10);
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "devices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
  if (v4)
  {
    v33 = *(_QWORD *)v40;
    obj = v3;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v40 != v33)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        v7 = (void *)MEMORY[0x2199D3FEC]();
        if (objc_msgSend(v6, "remoteTransport") == 4)
        {
          v8 = *(void **)(a1 + 40);
          v38[0] = MEMORY[0x24BDAC760];
          v38[1] = 3221225472;
          v38[2] = __54__DEDController_idsInbound_devicesChanged_completion___block_invoke_46;
          v38[3] = &unk_24D1E4BB8;
          v38[4] = v6;
          objc_msgSend(v8, "ded_findWithBlock:", v38);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            objc_msgSend(v6, "name");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "name");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v10, "isEqualToString:", v11);

            if ((v12 & 1) == 0)
            {
              objc_msgSend(*(id *)(a1 + 32), "log");
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v6, "hashingKey");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "name");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "name");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543875;
                v45 = v14;
                v46 = 2113;
                v47 = v15;
                v48 = 2113;
                v49 = v16;
                _os_log_impl(&dword_21469E000, v13, OS_LOG_TYPE_DEFAULT, "idsInbound_devicesChanged: Device [%{public}@], change [%{private}@] -> [%{private}@]", buf, 0x20u);

              }
              objc_msgSend(v9, "name");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "setName:", v17);

            }
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 32), "log");
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v6, "hashingKey");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v45 = v21;
              _os_log_impl(&dword_21469E000, v20, OS_LOG_TYPE_DEFAULT, "idsInbound_devicesChanged: Will remove device [%{public}@]", buf, 0xCu);

            }
            objc_msgSend(v31, "addObject:", v6);
          }

        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "log");
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v6, "hashingKey");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            __54__DEDController_idsInbound_devicesChanged_completion___block_invoke_cold_1(v19, v50, &v51, v18);
          }

        }
        objc_autoreleasePoolPop(v7);
      }
      v3 = obj;
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
    }
    while (v4);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v22 = v31;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v35 != v24)
          objc_enumerationMutation(v22);
        v26 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
        objc_msgSend(*(id *)(a1 + 32), "devices");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "hashingKey");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "removeObjectForKey:", v28);

      }
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    }
    while (v23);
  }

  objc_sync_exit(v30);
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __54__DEDController_idsInbound_devicesChanged_completion___block_invoke_46(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "address");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (void)startBugSessionWithIdentifier:(id)a3 configuration:(id)a4 caller:(id)a5 target:(id)a6 fromInbound:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  void *v20;
  unint64_t v21;
  const char *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  NSObject *v30;
  void *v31;
  unint64_t v32;
  const char *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  DEDBugSession *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  id v51;
  id v52;
  DEDLocalTransport *v53;
  void *v54;
  DEDXPCOutbound *v55;
  void *v56;
  DEDXPCOutbound *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  _BOOL4 v63;
  DEDLocalTransport *v64;
  void *v65;
  NSObject *v66;
  NSObject *v67;
  void *v68;
  void *v69;
  void *v70;
  NSObject *v71;
  void *v72;
  void *v73;
  NSObject *v74;
  id *v75;
  id *v76;
  id *v77;
  NSObject *v78;
  NSObject *v79;
  uint64_t (*v80)(uint64_t, uint64_t);
  void *v81;
  void *v82;
  NSObject *v83;
  id v84;
  void *v85;
  id v86;
  void *v87;
  id v88;
  id v89;
  _QWORD v90[4];
  id v91;
  id v92;
  id v93;
  _QWORD v94[4];
  id v95;
  id v96;
  NSObject *v97;
  id v98;
  id v99;
  id v100;
  _QWORD v101[4];
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  _QWORD v107[4];
  id v108;
  id v109;
  id v110;
  id v111;
  _BYTE *v112;
  id v113;
  _QWORD v114[4];
  id v115;
  id v116;
  id v117;
  _QWORD v118[4];
  __CFString *v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  _BYTE *v125;
  id v126;
  _QWORD v127[4];
  id v128;
  id v129;
  id v130;
  _QWORD block[4];
  id v132;
  id v133;
  id v134;
  id location;
  uint8_t v136[4];
  id v137;
  __int16 v138;
  void *v139;
  _QWORD v140[2];
  _QWORD v141[2];
  _BYTE buf[24];
  uint64_t (*v143)(uint64_t, uint64_t);
  _BYTE v144[20];
  uint64_t v145;

  v145 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v89 = a5;
  v14 = a6;
  v15 = a7;
  objc_initWeak(&location, self);
  if (!-[DEDController induceTimeOutIfNeededAndReturnCanProceedWithDevice:sessionId:](self, "induceTimeOutIfNeededAndReturnCanProceedWithDevice:sessionId:", v14, v12))goto LABEL_67;
  -[DEDController logDeviceCounts](self, "logDeviceCounts");
  if (!v14)
  {
    DEDSessionStartLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[DEDController startBugSessionWithIdentifier:configuration:caller:target:fromInbound:].cold.2();
    goto LABEL_12;
  }
  -[DEDController _deviceForIncomingDevice:needsReady:](self, "_deviceForIncomingDevice:needsReady:", v14, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    DEDSessionStartLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v14, "hashingKey");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[DEDController startBugSessionWithIdentifier:configuration:caller:target:fromInbound:].cold.3(v24, (uint64_t)buf, v23);
    }
LABEL_12:

    DEDSessionStartLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[DEDController startBugSessionWithIdentifier:configuration:caller:target:fromInbound:].cold.1();

    -[DEDController replyQueue](self, "replyQueue");
    v26 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke;
    block[3] = &unk_24D1E4C08;
    objc_copyWeak(&v134, &location);
    v132 = v12;
    v133 = 0;
    dispatch_async(v26, block);

    objc_destroyWeak(&v134);
    goto LABEL_67;
  }
  objc_msgSend(v13, "requestedCapabilities");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v14, "hasCapabilities:", v17);

  if ((v18 & 1) != 0)
  {
    DEDSessionStartLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v14, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v14, "transport");
      if (v21 > 4)
        v22 = "Unknown";
      else
        v22 = off_24D1E4F68[v21];
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v20;
      *(_WORD *)&buf[12] = 2082;
      *(_QWORD *)&buf[14] = v22;
      *(_WORD *)&buf[22] = 2114;
      v143 = (uint64_t (*)(uint64_t, uint64_t))v12;
      _os_log_impl(&dword_21469E000, v19, OS_LOG_TYPE_DEFAULT, "inTarget device: [%{public}@] - [%{public}s] - [%{public}@]", buf, 0x20u);

    }
    DEDSessionStartLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v16, "identifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v16, "transport");
      if (v32 > 4)
        v33 = "Unknown";
      else
        v33 = off_24D1E4F68[v32];
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v31;
      *(_WORD *)&buf[12] = 2082;
      *(_QWORD *)&buf[14] = v33;
      *(_WORD *)&buf[22] = 2114;
      v143 = (uint64_t (*)(uint64_t, uint64_t))v12;
      _os_log_impl(&dword_21469E000, v30, OS_LOG_TYPE_DEFAULT, "target device: [%{public}@] - [%{public}s] - [%{public}@]", buf, 0x20u);

    }
    DEDSessionStartLog();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v89, "name");
      v80 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "name");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "address");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "-[DEDController startBugSessionWithIdentifier:configuration:caller:target:fromInbound:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v12;
      *(_WORD *)&buf[22] = 2112;
      v143 = v80;
      *(_WORD *)v144 = 2112;
      *(_QWORD *)&v144[2] = v81;
      *(_WORD *)&v144[10] = 2112;
      *(_QWORD *)&v144[12] = v82;
      _os_log_debug_impl(&dword_21469E000, v34, OS_LOG_TYPE_DEBUG, "%s %@:%@ -> %@ (%@)", buf, 0x34u);

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v143 = __Block_byref_object_copy__0;
    *(_QWORD *)v144 = __Block_byref_object_dispose__0;
    *(_QWORD *)&v144[8] = 0;
    -[DEDController sessions](self, "sessions");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "objectForKeyedSubscript:", v12);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      DEDSessionStartLog();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v136 = 138543362;
        v137 = v12;
        _os_log_impl(&dword_21469E000, v37, OS_LOG_TYPE_DEFAULT, "found existing session [%{public}@]", v136, 0xCu);
      }

      -[DEDController sessions](self, "sessions");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "objectForKeyedSubscript:", v12);
      v39 = objc_claimAutoreleasedReturnValue();
      v40 = *(void **)(*(_QWORD *)&buf[8] + 40);
      *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v39;

      if (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "hasCapability:", CFSTR("mutable-bug-session")))objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setConfig:", v13);
    }
    else
    {
      DEDSessionStartLog();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v136 = 138543362;
        v137 = v12;
        _os_log_impl(&dword_21469E000, v41, OS_LOG_TYPE_DEFAULT, "creating new session [%{public}@]", v136, 0xCu);
      }

      v42 = -[DEDBugSession initWithConfiguration:]([DEDBugSession alloc], "initWithConfiguration:", v13);
      v43 = *(void **)(*(_QWORD *)&buf[8] + 40);
      *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v42;

      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setIdentifier:", v12);
      objc_msgSend(v16, "identifier");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setDeviceIdentifier:", v44);

    }
    -[DEDController bugSessionCallbackQueue](self, "bugSessionCallbackQueue");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setCallbackQueue:", v45);

    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "didStart");
    v140[0] = CFSTR("DEDExtensionIdentifierManager");
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "identifierManager");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "JSONRepresentation");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v140[1] = CFSTR("identifier");
    v141[0] = v47;
    v141[1] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v141, v140, 2);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    DEDSessionStartLog();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "identifier");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v136 = 138543618;
      v137 = v50;
      v138 = 2114;
      v139 = v48;
      _os_log_impl(&dword_21469E000, v49, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting with sessionSyncData [%{public}@]", v136, 0x16u);

    }
    v118[0] = MEMORY[0x24BDAC760];
    v118[1] = 3221225472;
    v118[2] = __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_65;
    v118[3] = &unk_24D1E4D98;
    v125 = buf;
    v119 = CFSTR("DEDExtensionIdentifierManager");
    v51 = v12;
    v120 = v51;
    objc_copyWeak(&v126, &location);
    v52 = v89;
    v121 = v52;
    v88 = v16;
    v122 = v88;
    v84 = v15;
    v123 = v84;
    v86 = v48;
    v124 = v86;
    v87 = (void *)MEMORY[0x2199D4184](v118);
    -[DEDController addDidStartSessionCompletion:withIdentifier:](self, "addDidStartSessionCompletion:withIdentifier:", v87, v51);
    if (objc_msgSend(v52, "transport") == 1)
    {
      v53 = objc_alloc_init(DEDLocalTransport);
      -[DEDController clientDelegate](self, "clientDelegate");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[DEDLocalTransport setClientDelegate:](v53, "setClientDelegate:", v54);

      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setClient:", v53);
    }
    else if (objc_msgSend(v52, "transport") == 2)
    {
      v55 = [DEDXPCOutbound alloc];
      -[DEDController xpcConnector](self, "xpcConnector");
      v53 = (DEDLocalTransport *)objc_claimAutoreleasedReturnValue();
      -[DEDLocalTransport clientXPCInterfaceFromInbound:](v53, "clientXPCInterfaceFromInbound:", v84);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = -[DEDXPCOutbound initWithRemoteObject:](v55, "initWithRemoteObject:", v56);
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setClient:", v57);

    }
    else if (objc_msgSend(v52, "transport") == 4)
    {
      objc_msgSend(v52, "address");
      v53 = (DEDLocalTransport *)objc_claimAutoreleasedReturnValue();
      -[DEDController idsConnection](self, "idsConnection");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      +[DEDIDSOutbound outboundWithSessionID:withDeviceAtAddress:connection:](DEDIDSOutbound, "outboundWithSessionID:withDeviceAtAddress:connection:", v51, v53, v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setClient:", v59);

    }
    else if (objc_msgSend(v52, "transport") == 3)
    {
      -[DEDController sharingConnection](self, "sharingConnection");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "sharingOutboundForBugSessionIdentifier:device:fromInbound:", v51, v52, v84);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setClient:", v61);

      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "client");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v62 == 0;

      if (!v63)
      {
LABEL_50:
        +[DEDDevice currentDevice](DEDDevice, "currentDevice");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v88, "transport") == 1)
        {
          v64 = objc_alloc_init(DEDLocalTransport);
          -[DEDController workerDelegate](self, "workerDelegate");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          -[DEDLocalTransport setWorkerDelegate:](v64, "setWorkerDelegate:", v65);

          objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setWorker:", v64);
          -[DEDController replyQueue](self, "replyQueue");
          v66 = objc_claimAutoreleasedReturnValue();
          v114[0] = MEMORY[0x24BDAC760];
          v114[1] = 3221225472;
          v114[2] = __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_71;
          v114[3] = &unk_24D1E4C08;
          objc_copyWeak(&v117, &location);
          v115 = v51;
          v116 = v86;
          dispatch_async(v66, v114);

          objc_destroyWeak(&v117);
        }
        else if (objc_msgSend(v88, "transport") == 2)
        {
          -[DEDController replyQueue](self, "replyQueue");
          v67 = objc_claimAutoreleasedReturnValue();
          v107[0] = MEMORY[0x24BDAC760];
          v107[1] = 3221225472;
          v107[2] = __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_72;
          v107[3] = &unk_24D1E4DC0;
          objc_copyWeak(&v113, &location);
          v112 = buf;
          v108 = v51;
          v109 = v13;
          v110 = v85;
          v111 = v88;
          dispatch_async(v67, v107);

          objc_destroyWeak(&v113);
        }
        else if (objc_msgSend(v88, "transport") == 4)
        {
          objc_msgSend(v88, "address");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          -[DEDController idsConnection](self, "idsConnection");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          +[DEDIDSOutbound outboundWithSessionID:withDeviceAtAddress:connection:](DEDIDSOutbound, "outboundWithSessionID:withDeviceAtAddress:connection:", v51, v68, v69);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setWorker:", v70);

          -[DEDController replyQueue](self, "replyQueue");
          v71 = objc_claimAutoreleasedReturnValue();
          v101[0] = MEMORY[0x24BDAC760];
          v101[1] = 3221225472;
          v101[2] = __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_2_73;
          v101[3] = &unk_24D1E4DE8;
          objc_copyWeak(&v106, &location);
          v102 = v51;
          v103 = v13;
          v104 = v85;
          v105 = v88;
          dispatch_async(v71, v101);

          objc_destroyWeak(&v106);
        }
        else if (objc_msgSend(v88, "transport") == 3)
        {
          -[DEDController sharingConnection](self, "sharingConnection");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "sharingOutboundForBugSessionIdentifier:device:fromInbound:", v51, v88, v84);
          v73 = (void *)objc_claimAutoreleasedReturnValue();

          if (v73)
          {
            objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setWorker:", v73);
            -[DEDController replyQueue](self, "replyQueue");
            v74 = objc_claimAutoreleasedReturnValue();
            v94[0] = MEMORY[0x24BDAC760];
            v94[1] = 3221225472;
            v94[2] = __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_3_74;
            v94[3] = &unk_24D1E4E10;
            v75 = &v100;
            objc_copyWeak(&v100, &location);
            v95 = v51;
            v96 = v13;
            v97 = v85;
            v98 = v88;
            v99 = v84;
            dispatch_async(v74, v94);

            v76 = &v95;
            v77 = &v96;
            v78 = v97;
          }
          else
          {
            DEDSessionStartLog();
            v83 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v136 = 0;
              _os_log_impl(&dword_21469E000, v83, OS_LOG_TYPE_DEFAULT, "Bug session start failed. Could not find sharing outbound on worker", v136, 2u);
            }

            -[DEDController replyQueue](self, "replyQueue");
            v78 = objc_claimAutoreleasedReturnValue();
            v90[0] = MEMORY[0x24BDAC760];
            v90[1] = 3221225472;
            v90[2] = __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_75;
            v90[3] = &unk_24D1E4C08;
            v75 = &v93;
            objc_copyWeak(&v93, &location);
            v76 = &v91;
            v91 = v51;
            v77 = &v92;
            v92 = v88;
            dispatch_async(v78, v90);
          }

          objc_destroyWeak(v75);
        }
        else
        {
          -[DEDController log](self, "log");
          v79 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
            -[DEDController startBugSessionWithIdentifier:configuration:caller:target:fromInbound:].cold.4();

        }
        objc_destroyWeak(&v126);

        _Block_object_dispose(buf, 8);
        goto LABEL_67;
      }
      DEDSessionStartLog();
      v53 = (DEDLocalTransport *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v53->super, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v136 = 0;
        _os_log_impl(&dword_21469E000, &v53->super, OS_LOG_TYPE_DEFAULT, "Bug session start failed. Could not find sharing outbound on client", v136, 2u);
      }
    }
    else
    {
      -[DEDController log](self, "log");
      v53 = (DEDLocalTransport *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v53->super, OS_LOG_TYPE_ERROR))
        -[DEDController startBugSessionWithIdentifier:configuration:caller:target:fromInbound:].cold.5();
    }

    goto LABEL_50;
  }
  DEDSessionStartLog();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    -[DEDController startBugSessionWithIdentifier:configuration:caller:target:fromInbound:].cold.6();

  -[DEDController replyQueue](self, "replyQueue");
  v28 = objc_claimAutoreleasedReturnValue();
  v127[0] = MEMORY[0x24BDAC760];
  v127[1] = 3221225472;
  v127[2] = __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_54;
  v127[3] = &unk_24D1E4C08;
  objc_copyWeak(&v130, &location);
  v128 = v12;
  v129 = v16;
  v29 = v16;
  dispatch_async(v28, v127);

  objc_destroyWeak(&v130);
LABEL_67:
  objc_destroyWeak(&location);

}

void __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  NSObject *v11;
  id v12;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = objc_msgSend(WeakRetained, "hasCompletionBlockWithIdentifier:", *(_QWORD *)(a1 + 32));

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD1540];
    +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorDomain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", v7, 102, &unk_24D202FB0);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    v8 = objc_loadWeakRetained(v2);
    objc_msgSend(v8, "popSessionStartCompletionWithIdentifier:", *(_QWORD *)(a1 + 32));
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, id))v9)[2](v9, 0, v12);

    objc_msgSend(*(id *)(a1 + 40), "productType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[DEDAnalytics logBugSessionStartWithDeviceType:isRemote:success:errorCode:](DEDAnalytics, "logBugSessionStartWithDeviceType:isRemote:success:errorCode:", v10, objc_msgSend(*(id *)(a1 + 40), "isRemote"), 0, 102);

  }
  else
  {
    DEDSessionStartLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_cold_1();

  }
}

void __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_54(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  NSObject *v11;
  id v12;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = objc_msgSend(WeakRetained, "hasCompletionBlockWithIdentifier:", *(_QWORD *)(a1 + 32));

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD1540];
    +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorDomain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", v7, 103, &unk_24D202FD8);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    v8 = objc_loadWeakRetained(v2);
    objc_msgSend(v8, "popSessionStartCompletionWithIdentifier:", *(_QWORD *)(a1 + 32));
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, id))v9)[2](v9, 0, v12);

    objc_msgSend(*(id *)(a1 + 40), "productType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[DEDAnalytics logBugSessionStartWithDeviceType:isRemote:success:errorCode:](DEDAnalytics, "logBugSessionStartWithDeviceType:isRemote:success:errorCode:", v10, objc_msgSend(*(id *)(a1 + 40), "isRemote"), 0, 103);

  }
  else
  {
    DEDSessionStartLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_cold_1();

  }
}

void __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_65(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  DEDExtensionIdentifierManager *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  id WeakRetained;
  id v12;
  int v13;
  id v14;
  NSObject *v15;
  id *v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  _QWORD block[4];
  id v46;
  id v47;
  uint64_t v48;
  id v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  +[DEDAnalytics didCreateBugSessionForApp:](DEDAnalytics, "didCreateBugSessionForApp:", 0);
  DEDSessionStartLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v51 = v5;
    v52 = 2114;
    v53 = v3;
    _os_log_impl(&dword_21469E000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] in DEDDidStartSessionCompletion with sessionInfo [%{public}@]", buf, 0x16u);

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  DEDSessionStartLog();
  v7 = (DEDExtensionIdentifierManager *)objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(&v7->super, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      v9 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      v51 = v9;
      _os_log_impl(&dword_21469E000, &v7->super, OS_LOG_TYPE_DEFAULT, "Synchronizing extension identifiers [%{public}@]", buf, 0xCu);
    }

    v7 = -[DEDExtensionIdentifierManager initWithJSONString:]([DEDExtensionIdentifierManager alloc], "initWithJSONString:", v6);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setIdentifierManager:", v7);
  }
  else if (v8)
  {
    v10 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    v51 = v10;
    _os_log_impl(&dword_21469E000, &v7->super, OS_LOG_TYPE_DEFAULT, "DEDExtensionIdentifierManager not found in info dictionary for [%{public}@]. Cannot synchronize extension identifiers", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  objc_msgSend(WeakRetained, "insertNewSession:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));

  v12 = objc_loadWeakRetained((id *)(a1 + 88));
  v13 = objc_msgSend(v12, "isDaemon");

  if (v13)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "save");
  if (objc_msgSend(*(id *)(a1 + 48), "transport") == 1)
  {
    v14 = objc_loadWeakRetained((id *)(a1 + 88));
    objc_msgSend(v14, "replyQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_67;
    block[3] = &unk_24D1E4D70;
    v16 = &v49;
    objc_copyWeak(&v49, (id *)(a1 + 88));
    v17 = *(id *)(a1 + 40);
    v18 = *(_QWORD *)(a1 + 80);
    v46 = v17;
    v48 = v18;
    v47 = *(id *)(a1 + 56);
    dispatch_async(v15, block);

    v19 = v46;
LABEL_19:

    objc_destroyWeak(v16);
    goto LABEL_20;
  }
  if (objc_msgSend(*(id *)(a1 + 48), "transport") == 2)
  {
    v20 = objc_loadWeakRetained((id *)(a1 + 88));
    objc_msgSend(v20, "replyQueue");
    v21 = objc_claimAutoreleasedReturnValue();
    v41[0] = MEMORY[0x24BDAC760];
    v41[1] = 3221225472;
    v41[2] = __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_68;
    v41[3] = &unk_24D1E4C08;
    v16 = &v44;
    objc_copyWeak(&v44, (id *)(a1 + 88));
    v42 = *(id *)(a1 + 64);
    v43 = *(id *)(a1 + 72);
    dispatch_async(v21, v41);

    v19 = v42;
    goto LABEL_19;
  }
  if (objc_msgSend(*(id *)(a1 + 48), "transport") == 4)
  {
    v22 = objc_loadWeakRetained((id *)(a1 + 88));
    objc_msgSend(v22, "replyQueue");
    v23 = objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_2;
    v37[3] = &unk_24D1E4C08;
    v16 = &v40;
    objc_copyWeak(&v40, (id *)(a1 + 88));
    v38 = *(id *)(a1 + 72);
    v39 = *(id *)(a1 + 48);
    dispatch_async(v23, v37);

    v19 = v38;
    goto LABEL_19;
  }
  if (objc_msgSend(*(id *)(a1 + 48), "transport") == 3)
  {
    v24 = objc_loadWeakRetained((id *)(a1 + 88));
    objc_msgSend(v24, "replyQueue");
    v25 = objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_3;
    v33[3] = &unk_24D1E4C08;
    v16 = &v36;
    objc_copyWeak(&v36, (id *)(a1 + 88));
    v34 = *(id *)(a1 + 72);
    v35 = *(id *)(a1 + 48);
    dispatch_async(v25, v33);

    v19 = v34;
    goto LABEL_19;
  }
  DEDSessionStartLog();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_65_cold_1(a1, v26, v27, v28, v29, v30, v31, v32);

LABEL_20:
}

void __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_67(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  int v4;
  id v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  NSObject *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = objc_msgSend(WeakRetained, "hasCompletionBlockWithIdentifier:", *(_QWORD *)(a1 + 32));

  if (v4)
  {
    v5 = objc_loadWeakRetained(v2);
    objc_msgSend(v5, "popSessionStartCompletionWithIdentifier:", *(_QWORD *)(a1 + 32));
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v6[2](v6, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), 0);

    objc_msgSend(*(id *)(a1 + 40), "productType");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    +[DEDAnalytics logBugSessionStartWithDeviceType:isRemote:success:errorCode:](DEDAnalytics, "logBugSessionStartWithDeviceType:isRemote:success:errorCode:", v9, objc_msgSend(*(id *)(a1 + 40), "isRemote"), 1, 0);

  }
  else
  {
    DEDSessionStartLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v11 = v8;
      _os_log_impl(&dword_21469E000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Session start returned but we have no completion block", buf, 0xCu);

    }
  }
}

void __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_68(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "xpcConnector");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientXPCInterfaceFromInbound:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "xpc_didStartBugSessionWithInfo:", *(_QWORD *)(a1 + 40));

}

void __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "idsConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "address");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ids_didStartBugSessionWithInfo:forID:", v3, v4);

}

void __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_3(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "sharingConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sharing_didStartBugSessionWithInfo:forCaller:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_71(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void (**v4)(_QWORD, _QWORD);
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = a1 + 32;
  objc_msgSend(WeakRetained, "popDidStartSessionCompletionWithIdentifier:", *(_QWORD *)(a1 + 32));
  v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  DEDSessionStartLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 40);
    v14 = 138543362;
    v15 = v6;
    _os_log_impl(&dword_21469E000, v5, OS_LOG_TYPE_INFO, "Replying with sessionSyncData [%{public}@]", (uint8_t *)&v14, 0xCu);
  }

  if (v4)
  {
    v4[2](v4, *(_QWORD *)(a1 + 40));
  }
  else
  {
    DEDSessionStartLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_71_cold_1(v3, v7, v8, v9, v10, v11, v12, v13);

  }
}

void __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_72(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  DEDXPCOutbound *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(WeakRetained, "xpcConnector");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "diagnosticextensionsdXPCInterface");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = -[DEDXPCOutbound initWithRemoteObject:]([DEDXPCOutbound alloc], "initWithRemoteObject:", v5);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setWorker:", v4);
  objc_msgSend(v5, "xpc_startBugSessionWithIdentifier:configuration:caller:target:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_2_73(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "idsConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ids_startBugSessionWithIdentifier:configuration:caller:target:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_3_74(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(WeakRetained, "sharingConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sharing_startBugSessionWithIdentifier:configuration:caller:target:fromInbound:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

void __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_75(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  int v4;
  id v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint8_t buf[16];

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = objc_msgSend(WeakRetained, "hasCompletionBlockWithIdentifier:", *(_QWORD *)(a1 + 32));

  if (v4)
  {
    v5 = objc_loadWeakRetained(v2);
    objc_msgSend(v5, "popSessionStartCompletionWithIdentifier:", *(_QWORD *)(a1 + 32));
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BDD1540];
    +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorDomain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v9, 101, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v6)[2](v6, 0, v10);

    objc_msgSend(*(id *)(a1 + 40), "productType");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    +[DEDAnalytics logBugSessionStartWithDeviceType:isRemote:success:errorCode:](DEDAnalytics, "logBugSessionStartWithDeviceType:isRemote:success:errorCode:", v12, objc_msgSend(*(id *)(a1 + 40), "isRemote"), 0, 101);

  }
  else
  {
    DEDSessionStartLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21469E000, v11, OS_LOG_TYPE_DEFAULT, "Session start failed, no completion block", buf, 2u);
    }

  }
}

- (void)didStartBugSessionWithInfo:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_initWeak(&location, self);
    -[DEDController replyQueue](self, "replyQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __44__DEDController_didStartBugSessionWithInfo___block_invoke;
    v8[3] = &unk_24D1E4C08;
    objc_copyWeak(&v11, &location);
    v9 = v5;
    v10 = v4;
    dispatch_async(v6, v8);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    DEDSessionStartLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[DEDController didStartBugSessionWithInfo:].cold.1();

  }
}

void __44__DEDController_didStartBugSessionWithInfo___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void (**v3)(_QWORD, _QWORD);
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "popDidStartSessionCompletionWithIdentifier:", *(_QWORD *)(a1 + 32));
  v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v3[2](v3, *(_QWORD *)(a1 + 40));
  }
  else
  {
    DEDSessionStartLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_21469E000, v4, OS_LOG_TYPE_INFO, "started session, no completion block registered for session [%{public}@]", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (void)didFinishSessionWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[DEDController recentlyFinishedSessions](self, "recentlyFinishedSessions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", 5);
    -[DEDController setRecentlyFinishedSessions:](self, "setRecentlyFinishedSessions:", v6);

  }
  -[DEDController log](self, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = v4;
    _os_log_impl(&dword_21469E000, v7, OS_LOG_TYPE_DEFAULT, "Did finish session [%{public}@]", (uint8_t *)&v9, 0xCu);
  }

  -[DEDController recentlyFinishedSessions](self, "recentlyFinishedSessions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v4);

}

- (BOOL)induceTimeOutIfNeededAndReturnCanProceedWithDevice:(id)a3 sessionId:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  BOOL v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (+[DEDUtils isInternalInstall](DEDUtils, "isInternalInstall")
    && (+[DEDPersistence sharedInstance](DEDPersistence, "sharedInstance"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "canProceedWithDevice:", v6),
        v8,
        (v9 & 1) == 0))
  {
    -[DEDController log](self, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "hashingKey");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v12;
      _os_log_impl(&dword_21469E000, v11, OS_LOG_TYPE_DEFAULT, "Inducing device timeout for device [%{public}@]", buf, 0xCu);

    }
    objc_initWeak((id *)buf, self);
    -[DEDController replyQueue](self, "replyQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __78__DEDController_induceTimeOutIfNeededAndReturnCanProceedWithDevice_sessionId___block_invoke;
    block[3] = &unk_24D1E4C08;
    objc_copyWeak(&v18, (id *)buf);
    v16 = v7;
    v17 = v6;
    dispatch_async(v13, block);

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
    v10 = 0;
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

void __78__DEDController_induceTimeOutIfNeededAndReturnCanProceedWithDevice_sessionId___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  void *v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = objc_msgSend(WeakRetained, "hasCompletionBlockWithIdentifier:", *(_QWORD *)(a1 + 32));

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD1540];
    +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorDomain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = CFSTR("Error reason");
    v8 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(a1 + 40), "hashingKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("induced timeout for device [%@]"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", v7, 100, v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = objc_loadWeakRetained(v2);
    objc_msgSend(v13, "popSessionStartCompletionWithIdentifier:", *(_QWORD *)(a1 + 32));
    v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, NSObject *))v14)[2](v14, 0, v12);

    objc_msgSend(*(id *)(a1 + 40), "productType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[DEDAnalytics logBugSessionStartWithDeviceType:isRemote:success:errorCode:](DEDAnalytics, "logBugSessionStartWithDeviceType:isRemote:success:errorCode:", v15, objc_msgSend(*(id *)(a1 + 40), "isRemote"), 0, 100);

  }
  else
  {
    DEDSessionStartLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_cold_1();
  }

}

- (void)upgradeToClassCDataProtectionIfNeeded
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_21469E000, v0, OS_LOG_TYPE_DEBUG, "upgradeToClassCDataProtectionIfNeeded already done", v1, 2u);
  OUTLINED_FUNCTION_2_3();
}

void __54__DEDController_upgradeToClassCDataProtectionIfNeeded__block_invoke()
{
  NSObject *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id obj;
  void *context;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[16];
  uint64_t v34;
  uint64_t v35;
  uint8_t buf[4];
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  DEDSessionCleanupLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21469E000, v0, OS_LOG_TYPE_DEFAULT, "upgradeToClassCDataProtectionIfNeeded start", buf, 2u);
  }

  +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dedDirectory");
  v2 = objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v25 = (void *)v2;
  objc_msgSend(MEMORY[0x24BE2C9A0], "findAllItems:includeDirs:", v2, 1);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v30;
    v6 = *MEMORY[0x24BDBCC20];
    v7 = *MEMORY[0x24BDBCC18];
    v8 = 0x24BDBC000uLL;
    v9 = 0x24BDBC000uLL;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v30 != v5)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v10);
        context = (void *)MEMORY[0x2199D3FEC]();
        DEDSessionCleanupLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v11, "lastPathComponent");
          v13 = v4;
          v14 = v7;
          v15 = v6;
          v16 = v5;
          v17 = v9;
          v18 = v8;
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v37 = v19;
          _os_log_impl(&dword_21469E000, v12, OS_LOG_TYPE_DEFAULT, "Upgrading: [%{public}@]", buf, 0xCu);

          v8 = v18;
          v9 = v17;
          v5 = v16;
          v6 = v15;
          v7 = v14;
          v4 = v13;
        }

        v34 = v6;
        v35 = v7;
        objc_msgSend(*(id *)(v8 + 3696), "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 0;
        objc_msgSend(v11, "setResourceValues:error:", v20, &v28);
        v21 = v28;

        if (v21)
        {
          DEDSessionCleanupLog();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            __54__DEDController_upgradeToClassCDataProtectionIfNeeded__block_invoke_cold_1((uint64_t)v33, (uint64_t)v21);

        }
        objc_autoreleasePoolPop(context);
        objc_msgSend(*(id *)(v9 + 3920), "standardUserDefaults");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setBool:forKey:", 1, CFSTR("DEDUpgradedToClassC"));

        DEDSessionCleanupLog();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21469E000, v24, OS_LOG_TYPE_DEFAULT, "upgradeToClassCDataProtectionIfNeeded end", buf, 2u);
        }

        ++v10;
      }
      while (v4 != v10);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    }
    while (v4);
  }

}

- (void)purgeStaleSessions:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x24BDD17C8];
  +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@.purge"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = objc_retainAutorelease(v10);
  v13 = dispatch_queue_create((const char *)objc_msgSend(v12, "UTF8String"), v11);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__DEDController_purgeStaleSessions_completion___block_invoke;
  block[3] = &unk_24D1E4EC0;
  v17 = v5;
  v18 = v6;
  v14 = v6;
  v15 = v5;
  dispatch_async(v13, block);

}

void __47__DEDController_purgeStaleSessions_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 10);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", CFSTR("-cleanup"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_retainAutorelease(v5);
  objc_msgSend(v6, "UTF8String");
  v7 = (void *)os_transaction_create();
  +[DEDActivity sharedInstance](DEDActivity, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "newCleanupActivity");

  DEDSessionCleanupLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_msgSend(*(id *)(a1 + 32), "count");
    *(_DWORD *)buf = 134217984;
    v20 = v11;
    _os_log_impl(&dword_21469E000, v10, OS_LOG_TYPE_DEFAULT, "[%lu] persisted sessions", buf, 0xCu);
  }

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __47__DEDController_purgeStaleSessions_completion___block_invoke_93;
  v14[3] = &unk_24D1E4E98;
  v15 = v7;
  v16 = *(id *)(a1 + 32);
  v17 = v2;
  v18 = *(id *)(a1 + 40);
  v12 = v2;
  v13 = v7;
  os_activity_apply(v9, v14);

}

void __47__DEDController_purgeStaleSessions_completion___block_invoke_93(id *a1)
{
  NSObject *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  DEDAttachmentHandler *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  DEDAttachmentHandler *v54;
  _QWORD block[4];
  id v56;
  id v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t buf[4];
  uint64_t v68;
  __int16 v69;
  uint64_t v70;
  __int16 v71;
  void *v72;
  char v73[24];
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  DEDSessionCleanupLog();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21469E000, v1, OS_LOG_TYPE_DEFAULT, "purge stale sessions begin", buf, 2u);
  }

  +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dedDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

  if (v6)
  {
    v50 = objc_msgSend(MEMORY[0x24BE2C9A0], "getDirectorySize:", v3);
    objc_msgSend(MEMORY[0x24BE2C9A0], "lsDir:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ded_mapWithBlock:", &__block_literal_global_97);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    DEDSessionCleanupLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_msgSend(v8, "count");
      *(_DWORD *)buf = 134217984;
      v68 = v10;
      _os_log_impl(&dword_21469E000, v9, OS_LOG_TYPE_DEFAULT, "Found [%lu] session directories", buf, 0xCu);
    }
    v52 = v3;

    v51 = v8;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithArray:", v8);
    v12 = objc_alloc_init(DEDAttachmentHandler);
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v13 = a1[5];
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
    v54 = v12;
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v64;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v64 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
          objc_msgSend(v18, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[DEDAttachmentHandler directoryForBugSessionIdentifier:](v12, "directoryForBugSessionIdentifier:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "removeObject:", v20);
          v21 = objc_msgSend(v18, "state");
          DEDSessionCleanupLog();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v18, "identifier");
            v23 = objc_claimAutoreleasedReturnValue();
            v24 = (void *)v23;
            v25 = "Unknown";
            if ((unint64_t)(v21 + 1) <= 9)
              v25 = off_24D1E4EF8[v21 + 1];
            *(_DWORD *)buf = 138543618;
            v68 = v23;
            v69 = 2082;
            v70 = (uint64_t)v25;
            _os_log_impl(&dword_21469E000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] state: [%{public}s]", buf, 0x16u);

            v12 = v54;
          }

          if (v21 == -1)
          {
            +[DEDAnalytics didCompleteBugSessionWithState:](DEDAnalytics, "didCompleteBugSessionWithState:", 2);
            objc_msgSend(v18, "cleanup");
            objc_msgSend(a1[6], "addObject:", v18);
          }

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
      }
      while (v15);
    }

    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v26 = v11;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v59, v74, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v60;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v60 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * j);
          DEDSessionCleanupLog();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v31, "lastPathComponent");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v68 = (uint64_t)v33;
            _os_log_impl(&dword_21469E000, v32, OS_LOG_TYPE_INFO, "will remove orphan session directory [%{public}@]", buf, 0xCu);

          }
          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = 0;
          objc_msgSend(v34, "removeItemAtURL:error:", v31, &v58);
          v35 = v58;

          DEDSessionCleanupLog();
          v36 = objc_claimAutoreleasedReturnValue();
          v37 = v36;
          if (v35)
          {
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              __47__DEDController_purgeStaleSessions_completion___block_invoke_93_cold_1((uint64_t)v73, (uint64_t)v31);
          }
          else if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v31, "lastPathComponent");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v68 = (uint64_t)v38;
            _os_log_impl(&dword_21469E000, v37, OS_LOG_TYPE_DEFAULT, "did remove orphan session directory [%{public}@]", buf, 0xCu);

          }
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v59, v74, 16);
      }
      while (v28);
    }

    v3 = v52;
    v39 = objc_msgSend(MEMORY[0x24BE2C9A0], "getDirectorySize:", v52);
    v40 = v50 - v39;
    if (v50 != v39)
    {
      v41 = v39;
      DEDSessionCleanupLog();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x24BDD1490], "stringFromByteCount:countStyle:", v50, 0);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1490], "stringFromByteCount:countStyle:", v41, 0);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1490], "stringFromByteCount:countStyle:", v40, 0);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v68 = (uint64_t)v43;
        v69 = 2114;
        v70 = (uint64_t)v44;
        v71 = 2114;
        v72 = v45;
        _os_log_impl(&dword_21469E000, v42, OS_LOG_TYPE_DEFAULT, "ded dir size before cleanup [%{public}@] after [%{public}@] diff [%{public}@]", buf, 0x20u);

      }
      DEDSessionCleanupLog();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        v47 = objc_msgSend(a1[6], "count");
        v48 = objc_msgSend(v26, "count");
        *(_DWORD *)buf = 134218240;
        v68 = v47;
        v69 = 2048;
        v70 = v48;
        _os_log_impl(&dword_21469E000, v46, OS_LOG_TYPE_DEFAULT, "Removed [%lu] sessions [%lu] orphan directories", buf, 0x16u);
      }

    }
  }
  DEDSessionCleanupLog();
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21469E000, v49, OS_LOG_TYPE_DEFAULT, "purge stale sessions end", buf, 2u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__DEDController_purgeStaleSessions_completion___block_invoke_100;
  block[3] = &unk_24D1E4628;
  v57 = a1[7];
  v56 = a1[6];
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __47__DEDController_purgeStaleSessions_completion___block_invoke_95(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "URLByResolvingSymlinksInPath");
}

uint64_t __47__DEDController_purgeStaleSessions_completion___block_invoke_100(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)persistence
{
  return +[DEDPersistence sharedInstance](DEDPersistence, "sharedInstance");
}

- (void)addDevice:(id)a3
{
  id v4;
  void *v5;
  int v6;
  DEDController *v7;
  NSObject *v8;
  unint64_t v9;
  const char *v10;
  void *v11;
  unint64_t v12;
  const char *v13;
  unint64_t v14;
  const char *v15;
  void *v16;
  unint64_t v17;
  const char *v18;
  unint64_t v19;
  const char *v20;
  char *v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  const char *v50;
  const char *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  char *v56;
  char *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  _QWORD v63[4];
  id v64;
  uint8_t buf[4];
  _BYTE v66[28];
  __int16 v67;
  void *v68;
  __int16 v69;
  const char *v70;
  __int16 v71;
  const char *v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  const char *v76;
  __int16 v77;
  const char *v78;
  __int16 v79;
  void *v80;
  __int16 v81;
  void *v82;
  __int16 v83;
  void *v84;
  __int16 v85;
  void *v86;
  __int16 v87;
  void *v88;
  __int16 v89;
  uint64_t v90;
  __int16 v91;
  int v92;
  __int16 v93;
  uint64_t v94;
  __int16 v95;
  void *v96;
  uint64_t v97;

  v97 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "platform");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("xros"));

  if (v6)
    objc_msgSend(v4, "setPlatform:", CFSTR("visionos"));
  v7 = self;
  objc_sync_enter(v7);
  if (objc_msgSend(v4, "status") == 1)
  {
    -[DEDController log](v7, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "identifier");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "idsIdentifier");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "address");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "model");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v57 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "platform");
      v56 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "build");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v4, "remoteTransport");
      if (v9 > 4)
        v10 = "Unknown";
      else
        v10 = off_24D1E4F68[v9];
      v51 = v10;
      v19 = objc_msgSend(v4, "transport");
      if (v19 > 4)
        v20 = "Unknown";
      else
        v20 = off_24D1E4F68[v19];
      v50 = v20;
      v23 = objc_msgSend(v4, "status");
      if ((unint64_t)(v23 - 1) > 3)
        v24 = "Unknown";
      else
        v24 = off_24D1E4F48[v23 - 1];
      objc_msgSend(v4, "deviceClass", v24);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "productType");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "color");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "enclosureColor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v4, "homeButtonType");
      v29 = objc_msgSend(v4, "isHomeKitResident");
      v30 = objc_msgSend(v4, "mediaSystemRole");
      objc_msgSend(v4, "capabilities");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138547715;
      *(_QWORD *)v66 = v61;
      *(_WORD *)&v66[8] = 2114;
      *(_QWORD *)&v66[10] = v55;
      *(_WORD *)&v66[18] = 2113;
      *(_QWORD *)&v66[20] = v59;
      v67 = 2114;
      v68 = v54;
      v69 = 2113;
      v70 = v57;
      v71 = 2114;
      v72 = v56;
      v73 = 2114;
      v74 = v53;
      v75 = 2082;
      v76 = v51;
      v77 = 2082;
      v78 = v50;
      v79 = 2082;
      v80 = v49;
      v81 = 2114;
      v82 = v52;
      v83 = 2114;
      v84 = v25;
      v85 = 2114;
      v86 = v26;
      v87 = 2114;
      v88 = v27;
      v89 = 2048;
      v90 = v28;
      v91 = 1024;
      v92 = v29;
      v93 = 2048;
      v94 = v30;
      v95 = 2114;
      v96 = v31;
      _os_log_impl(&dword_21469E000, v8, OS_LOG_TYPE_INFO, "Device ready:\nidentifier: %{public}@\nidsIdentifier: %{public}@\naddress: %{private}@\nmodel: %{public}@\nname: %{private}@\nplatform: %{public}@\nbuild: %{public}@\nremoteTransport: %{public}s\ntransport: %{public}s\nstatus: %{public}s\ndeviceClass: %{public}@\nproductType: %{public}@\ncolor: %{public}@\nenclosureColor: %{public}@\nhomeButtonType: %li\n"
        "isHomeKitResident: %d\n"
        "mediaSystemRole: %li\n"
        "capabilities: %{public}@\n",
        buf,
        0xB2u);

    }
  }
  else
  {
    -[DEDController log](v7, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "name");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "platform");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "build");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "productType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v4, "status") - 1;
      if (v12 > 3)
        v13 = "Unknown";
      else
        v13 = off_24D1E4F48[v12];
      v14 = objc_msgSend(v4, "transport");
      if (v14 > 4)
        v15 = "Unknown";
      else
        v15 = off_24D1E4F68[v14];
      objc_msgSend(v4, "publicLogSafeIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v4, "remoteTransport");
      if (v17 > 4)
        v18 = "Unknown";
      else
        v18 = off_24D1E4F68[v17];
      objc_msgSend(v4, "address");
      v21 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "idsIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138480131;
      *(_QWORD *)v66 = v62;
      *(_WORD *)&v66[8] = 2114;
      *(_QWORD *)&v66[10] = v58;
      *(_WORD *)&v66[18] = 2114;
      *(_QWORD *)&v66[20] = v60;
      v67 = 2114;
      v68 = v11;
      v69 = 2082;
      v70 = v13;
      v71 = 2082;
      v72 = v15;
      v73 = 2114;
      v74 = v16;
      v75 = 2082;
      v76 = v18;
      v77 = 2113;
      v78 = v21;
      v79 = 2114;
      v80 = v22;
      _os_log_impl(&dword_21469E000, v8, OS_LOG_TYPE_INFO, "Will try to add device:\n%{private}@ - %{public}@ %{public}@ (%{public}@) -- %{public}s \n%{public}s (%{public}@) \n%{public}s Remote: (%{private}@ - %{public}@)", buf, 0x66u);

    }
  }

  objc_msgSend(v4, "hashingKeyForTempDevice");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDController devices](v7, "devices");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "objectForKeyedSubscript:", v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[DEDController log](v7, "log");
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v34, "publicLogSafeIdentifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543619;
      *(_QWORD *)v66 = v36;
      *(_WORD *)&v66[8] = 2113;
      *(_QWORD *)&v66[10] = v32;
      _os_log_impl(&dword_21469E000, v35, OS_LOG_TYPE_INFO, "found temp device [%{public}@] for key [%{private}@]", buf, 0x16u);

    }
    -[DEDController devices](v7, "devices");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "removeObjectForKey:", v32);

  }
  if (objc_msgSend(v4, "isTemporaryDevice"))
  {
    -[DEDController devices](v7, "devices");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "allValues");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v63[0] = MEMORY[0x24BDAC760];
    v63[1] = 3221225472;
    v63[2] = __27__DEDController_addDevice___block_invoke;
    v63[3] = &unk_24D1E4BB8;
    v64 = v4;
    objc_msgSend(v39, "ded_findWithBlock:", v63);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v40 = 0;
  }
  objc_msgSend(v4, "hashingKey");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    -[DEDController log](v7, "log");
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      v43 = objc_msgSend(v4, "transport");
      objc_msgSend(v4, "publicLogSafeIdentifier");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "description");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v66 = v43;
      *(_WORD *)&v66[4] = 2114;
      *(_QWORD *)&v66[6] = v44;
      *(_WORD *)&v66[14] = 2114;
      *(_QWORD *)&v66[16] = v45;
      _os_log_impl(&dword_21469E000, v42, OS_LOG_TYPE_INFO, "Not adding temp device [%i-%{public}@], already have [%{public}@]", buf, 0x1Cu);

    }
  }
  else
  {
    -[DEDController devices](v7, "devices");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setObject:forKeyedSubscript:", v4, v41);

    -[DEDController log](v7, "log");
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v47 = objc_msgSend(v4, "transport");
      objc_msgSend(v4, "publicLogSafeIdentifier");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v66 = v47;
      *(_WORD *)&v66[4] = 2114;
      *(_QWORD *)&v66[6] = v48;
      _os_log_impl(&dword_21469E000, v42, OS_LOG_TYPE_DEFAULT, "Did add device [%i-%{public}@]", buf, 0x12u);

    }
  }

  -[DEDController logDeviceCounts](v7, "logDeviceCounts");
  objc_sync_exit(v7);

}

uint64_t __27__DEDController_addDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  v4 = objc_msgSend(v3, "remoteTransport");
  if (v4 == objc_msgSend(*(id *)(a1 + 32), "remoteTransport"))
  {
    objc_msgSend(v3, "address");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "address");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)logDeviceCounts
{
  DEDController *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  -[DEDController devices](v2, "devices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v4;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  v10 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v26, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v5);
        switch(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12), "status", (_QWORD)v14))
        {
          case 1:
            ++v9;
            break;
          case 2:
            ++v8;
            break;
          case 3:
            ++v7;
            break;
          case 4:
            ++v6;
            break;
          default:
            break;
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v26, 16);
    }
    while (v10);
  }

  -[DEDController log](v2, "log");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218752;
    v19 = v9;
    v20 = 2048;
    v21 = v8;
    v22 = 2048;
    v23 = v7;
    v24 = 2048;
    v25 = v6;
    _os_log_impl(&dword_21469E000, v13, OS_LOG_TYPE_DEFAULT, "Devices: ready [%lu] needs pairing [%lu] waiting [%lu] not available [%lu]", buf, 0x2Au);
  }

}

- (id)idsConnection
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__DEDController_idsConnection__block_invoke;
  block[3] = &unk_24D1E4600;
  block[4] = self;
  if (idsConnection_onceToken != -1)
    dispatch_once(&idsConnection_onceToken, block);
  return (id)idsConnection__idsConnection;
}

void __30__DEDController_idsConnection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  DEDIDSConnection *v3;
  void *v4;
  uint8_t v5[16];

  objc_msgSend(*(id *)(a1 + 32), "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21469E000, v2, OS_LOG_TYPE_INFO, "Creating IDS connection", v5, 2u);
  }

  v3 = -[DEDIDSConnection initWithController:]([DEDIDSConnection alloc], "initWithController:", *(_QWORD *)(a1 + 32));
  v4 = (void *)idsConnection__idsConnection;
  idsConnection__idsConnection = (uint64_t)v3;

}

- (id)sharingConnection
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__DEDController_sharingConnection__block_invoke;
  block[3] = &unk_24D1E4600;
  block[4] = self;
  if (sharingConnection_onceToken != -1)
    dispatch_once(&sharingConnection_onceToken, block);
  return (id)sharingConnection__sharingConnection;
}

void __34__DEDController_sharingConnection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  DEDSharingConnection *v3;
  void *v4;
  uint8_t v5[16];

  objc_msgSend(*(id *)(a1 + 32), "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21469E000, v2, OS_LOG_TYPE_INFO, "Creating Sharing connection", v5, 2u);
  }

  v3 = -[DEDSharingConnection initWithController:]([DEDSharingConnection alloc], "initWithController:", *(_QWORD *)(a1 + 32));
  v4 = (void *)sharingConnection__sharingConnection;
  sharingConnection__sharingConnection = (uint64_t)v3;

}

- (void)setBugSessionCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_bugSessionCallbackQueue, a3);
}

- (DEDXPCConnector)xpcConnector
{
  return (DEDXPCConnector *)objc_getProperty(self, a2, 24, 1);
}

- (void)setXpcConnector:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (DEDClientProtocol)clientDelegate
{
  return (DEDClientProtocol *)objc_loadWeakRetained((id *)&self->_clientDelegate);
}

- (void)setClientDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_clientDelegate, a3);
}

- (DEDWorkerProtocol)workerDelegate
{
  return (DEDWorkerProtocol *)objc_loadWeakRetained((id *)&self->_workerDelegate);
}

- (void)setWorkerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_workerDelegate, a3);
}

- (DEDPairingProtocol)pairingDelegate
{
  return (DEDPairingProtocol *)objc_loadWeakRetained((id *)&self->_pairingDelegate);
}

- (void)setPairingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_pairingDelegate, a3);
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

- (BOOL)useSharing
{
  return self->_useSharing;
}

- (void)setUseSharing:(BOOL)a3
{
  self->_useSharing = a3;
}

- (BOOL)useIDS
{
  return self->_useIDS;
}

- (void)setUseIDS:(BOOL)a3
{
  self->_useIDS = a3;
}

- (BOOL)embeddedInApp
{
  return self->_embeddedInApp;
}

- (void)setEmbeddedInApp:(BOOL)a3
{
  self->_embeddedInApp = a3;
}

- (id)devicesCompletion
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setDevicesCompletion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (id)pongBlock
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setPongBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (id)sessionExistsCompletion
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setSessionExistsCompletion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (NSMutableDictionary)sessionStartBlocks
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSessionStartBlocks:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSMutableDictionary)sessionDidStartBlocks
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setSessionDidStartBlocks:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSMutableSet)recentlyFinishedSessions
{
  return (NSMutableSet *)objc_getProperty(self, a2, 96, 1);
}

- (void)setRecentlyFinishedSessions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (OS_dispatch_queue)replyQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 104, 1);
}

- (void)setReplyQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 112, 1);
}

- (void)setWorkQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 120, 1);
}

- (void)setLog:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (id)didCancelCompletion
{
  return objc_getProperty(self, a2, 128, 1);
}

- (void)setDidCancelCompletion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (id)xpcConnectionsCompletion
{
  return objc_getProperty(self, a2, 136, 1);
}

- (void)setXpcConnectionsCompletion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 136);
}

- (NSMutableDictionary)devices
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 144, 1);
}

- (void)setDevices:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSDictionary)sessions
{
  return (NSDictionary *)objc_getProperty(self, a2, 152, 1);
}

- (void)setSessions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong(&self->_xpcConnectionsCompletion, 0);
  objc_storeStrong(&self->_didCancelCompletion, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_recentlyFinishedSessions, 0);
  objc_storeStrong((id *)&self->_sessionDidStartBlocks, 0);
  objc_storeStrong((id *)&self->_sessionStartBlocks, 0);
  objc_storeStrong(&self->_sessionExistsCompletion, 0);
  objc_storeStrong(&self->_pongBlock, 0);
  objc_storeStrong(&self->_devicesCompletion, 0);
  objc_destroyWeak((id *)&self->_pairingDelegate);
  objc_destroyWeak((id *)&self->_workerDelegate);
  objc_destroyWeak((id *)&self->_clientDelegate);
  objc_storeStrong((id *)&self->_xpcConnector, 0);
  objc_storeStrong((id *)&self->_bugSessionCallbackQueue, 0);
}

- (void)addDidStartSessionCompletion:(id)a3 withIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[DEDController sessionDidStartBlocks](self, "sessionDidStartBlocks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  -[DEDController sessionDidStartBlocks](self, "sessionDidStartBlocks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x2199D4184](v10);
  objc_msgSend(v8, "setObject:forKey:", v9, v6);

  objc_sync_exit(v7);
}

- (id)popDidStartSessionCompletionWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint8_t v11[16];

  v4 = a3;
  -[DEDController sessionDidStartBlocks](self, "sessionDidStartBlocks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  -[DEDController sessionDidStartBlocks](self, "sessionDidStartBlocks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[DEDController sessionDidStartBlocks](self, "sessionDidStartBlocks");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject removeObjectForKey:](v8, "removeObjectForKey:", v4);
  }
  else
  {
    DEDSessionStartLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_21469E000, v8, OS_LOG_TYPE_DEFAULT, "tried to pop a nil session did start block", v11, 2u);
    }
  }

  objc_sync_exit(v5);
  v9 = (void *)MEMORY[0x2199D4184](v7);

  return v9;
}

- (void)addSessionStartCompletion:(id)a3 withIdentifier:(id)a4 configuration:(id)a5 targetDevice:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[DEDController sessionDidStartBlocks](self, "sessionDidStartBlocks");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v13);
  -[DEDController sessionStartBlocks](self, "sessionStartBlocks");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x2199D4184](v16);
  objc_msgSend(v14, "setObject:forKey:", v15, v10);

  objc_msgSend(v11, "bugSessionStartTimeout");
  -[DEDController _timeOutSessionStartBlockWithIdentifier:targetDevice:timeout:](self, "_timeOutSessionStartBlockWithIdentifier:targetDevice:timeout:", v10, v12);
  objc_sync_exit(v13);

}

- (id)popSessionStartCompletionWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint8_t v11[16];

  v4 = a3;
  -[DEDController sessionDidStartBlocks](self, "sessionDidStartBlocks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  -[DEDController sessionStartBlocks](self, "sessionStartBlocks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[DEDController sessionStartBlocks](self, "sessionStartBlocks");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject removeObjectForKey:](v8, "removeObjectForKey:", v4);
  }
  else
  {
    DEDSessionStartLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_21469E000, v8, OS_LOG_TYPE_DEFAULT, "tried to pop a nil session start block", v11, 2u);
    }
  }

  objc_sync_exit(v5);
  v9 = (void *)MEMORY[0x2199D4184](v7);

  return v9;
}

- (BOOL)hasCompletionBlockWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  -[DEDController sessionStartBlocks](self, "sessionStartBlocks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  -[DEDController sessionStartBlocks](self, "sessionStartBlocks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 != 0;

  objc_sync_exit(v5);
  return v8;
}

- (void)_timeOutSessionStartBlockWithIdentifier:(id)a3 targetDevice:(id)a4 timeout:(double)a5
{
  id v8;
  id v9;
  NSObject *v10;
  dispatch_time_t v11;
  id WeakRetained;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  double v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[DEDController log](self, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v21 = v8;
    v22 = 2048;
    v23 = a5;
    _os_log_impl(&dword_21469E000, v10, OS_LOG_TYPE_DEFAULT, "Session [%{public}@] will timeout after [%.1lf] seconds", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v11 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
  WeakRetained = objc_loadWeakRetained((id *)buf);
  objc_msgSend(WeakRetained, "replyQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __96__DEDController_CompletionBlocks___timeOutSessionStartBlockWithIdentifier_targetDevice_timeout___block_invoke;
  block[3] = &unk_24D1E4C08;
  objc_copyWeak(&v19, (id *)buf);
  v17 = v8;
  v18 = v9;
  v14 = v9;
  v15 = v8;
  dispatch_after(v11, v13, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

void __96__DEDController_CompletionBlocks___timeOutSessionStartBlockWithIdentifier_targetDevice_timeout___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  int v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "sessionStartBlocks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_enter(v4);
  v5 = objc_loadWeakRetained(v2);
  v6 = objc_msgSend(v5, "hasCompletionBlockWithIdentifier:", *(_QWORD *)(a1 + 32));

  if (v6)
  {
    v7 = objc_loadWeakRetained(v2);
    objc_msgSend(v7, "popSessionStartCompletionWithIdentifier:", *(_QWORD *)(a1 + 32));
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  objc_sync_exit(v4);

  if (v8)
  {
    DEDSessionStartLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __96__DEDController_CompletionBlocks___timeOutSessionStartBlockWithIdentifier_targetDevice_timeout___block_invoke_cold_1((uint64_t *)(a1 + 32), v9);

    v10 = (void *)MEMORY[0x24BDD1540];
    +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorDomain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v12, 100, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    ((void (**)(_QWORD, _QWORD, void *))v8)[2](v8, 0, v13);
    objc_msgSend(*(id *)(a1 + 40), "productType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[DEDAnalytics logBugSessionStartWithDeviceType:isRemote:success:errorCode:](DEDAnalytics, "logBugSessionStartWithDeviceType:isRemote:success:errorCode:", v14, objc_msgSend(*(id *)(a1 + 40), "remoteTransport") != 1, 0, 100);

  }
}

- (void)configureForSharing:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_21469E000, v0, OS_LOG_TYPE_FAULT, "Tried to enable sharing. It's disabled!", v1, 2u);
  OUTLINED_FUNCTION_2_3();
}

- (void)startPairSetupForDevice:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_4(&dword_21469E000, v0, v1, "[%{public}s] could not find device. Incoming device [%{public}@]", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)tryPIN:forDevice:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_4(&dword_21469E000, v0, v1, "[%{public}s] could not find device. Incoming device [%{public}@]", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_sharingDeviceForIncomingDevice:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 136315650;
  v4 = "-[DEDController _sharingDeviceForIncomingDevice:]";
  v5 = 2112;
  v6 = a1;
  v7 = 2112;
  v8 = a2;
  _os_log_debug_impl(&dword_21469E000, log, OS_LOG_TYPE_DEBUG, "%s%@ -> %@", (uint8_t *)&v3, 0x20u);
}

- (void)insertNewSession:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_9_0(&dword_21469E000, a2, v4, "Inserting bug session [%{public}@]", v5);

}

- (void)removeSessionWithIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_9_0(&dword_21469E000, v0, v1, "Removing bug session [%{public}@]", v2);
  OUTLINED_FUNCTION_1();
}

- (void)abortSession:withCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_21469E000, v0, v1, "could not abort session [%{public}@] because session is not known to controller", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)abortSession:(uint64_t)a3 withCompletion:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "-[DEDController abortSession:withCompletion:]";
  OUTLINED_FUNCTION_9_0(&dword_21469E000, a1, a3, "%s", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)connector:didLooseConnectionToProcessWithPid:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21469E000, v0, v1, "Daemon connection delegate called on app controller", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_3();
}

- (void)xpcInbound_forceRemoveNotificationOfType:(uint64_t)a1 identifier:(NSObject *)a2 hostIdentifier:.cold.1(uint64_t a1, NSObject *a2)
{
  const char *v2;
  int v3;
  const char *v4;
  __int16 v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (a1)
    v2 = "Unknown";
  else
    v2 = "unset";
  v3 = 136446466;
  v4 = "-[DEDController xpcInbound_forceRemoveNotificationOfType:identifier:hostIdentifier:]";
  v5 = 2082;
  v6 = v2;
  _os_log_fault_impl(&dword_21469E000, a2, OS_LOG_TYPE_FAULT, "[%{public}s] for type [%{public}s] not handled", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)xpcInbound_forceRemoveNotificationOfType:identifier:hostIdentifier:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21469E000, v0, v1, "Cannot force remove notification for type .unset", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_3();
}

- (void)xpcInbound_startPairSetupForDevice:fromInbound:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_4(&dword_21469E000, v0, v1, "[%{public}s] could not find device. Incoming device [%{public}@]", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)xpcInbound_promptPINForDevice:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_21469E000, v0, v1, "Pairing delegate is nil. Cannot prompt PIN for device [%{public}@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)xpcInbound_promptPINForDevice:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_4(&dword_21469E000, v0, v1, "[%{public}s] could not find device. Incoming device [%{public}@]", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)xpcInbound_tryPIN:forDevice:fromInbound:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_4(&dword_21469E000, v0, v1, "[%{public}s] could not find device. Incoming device [%{public}@]", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)xpcInbound_successPINForDevice:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_4(&dword_21469E000, v0, v1, "[%{public}s] could not find device. Incoming device [%{public}@]", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)sharingInbound_promptPINForDevice:fromInbound:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_4(&dword_21469E000, v0, v1, "[%{public}s] could not find device. Incoming device [%{public}@]", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)sharingInbound_successPINForDevice:fromInbound:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_4(&dword_21469E000, v0, v1, "[%{public}s] could not find device. Incoming device [%{public}@]", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __54__DEDController_idsInbound_devicesChanged_completion___block_invoke_cold_1(void *a1, uint8_t *a2, _QWORD *a3, NSObject *a4)
{
  *(_DWORD *)a2 = 138543362;
  *a3 = a1;
  OUTLINED_FUNCTION_9_0(&dword_21469E000, a4, (uint64_t)a3, "idsInbound_devicesChanged: ignoring device [%{public}@]", a2);

}

- (void)startBugSessionWithIdentifier:configuration:caller:target:fromInbound:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21469E000, v0, v1, "does not have device, cannot continue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_3();
}

- (void)startBugSessionWithIdentifier:configuration:caller:target:fromInbound:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21469E000, v0, v1, "given target device is nil, bailing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_3();
}

- (void)startBugSessionWithIdentifier:(NSObject *)a3 configuration:caller:target:fromInbound:.cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_8_1(&dword_21469E000, a3, OS_LOG_TYPE_ERROR, "cannot find device with [%{public}@]", (uint8_t *)a2);

}

- (void)startBugSessionWithIdentifier:configuration:caller:target:fromInbound:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21469E000, v0, v1, "Unknown caller transport. Cannot configure bug session worker", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_3();
}

- (void)startBugSessionWithIdentifier:configuration:caller:target:fromInbound:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21469E000, v0, v1, "Unknown caller transport. Cannot configure bug session client", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_3();
}

- (void)startBugSessionWithIdentifier:configuration:caller:target:fromInbound:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21469E000, v0, v1, "Device does not have capabilities requested by bug session config, cannot continue.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_3();
}

void __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21469E000, v0, v1, "DEDSessionStartCompletion is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_3();
}

void __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_65_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_21469E000, a2, a3, "Nobody to finish out the new session callback: id %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_71_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_21469E000, a2, a3, "No session did start completion block found for session [%{public}@]", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)didStartBugSessionWithInfo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21469E000, v0, v1, "did start session but info does not have session id, cannot continue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_3();
}

void __54__DEDController_upgradeToClassCDataProtectionIfNeeded__block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  _QWORD *v3;
  uint8_t *v4;
  void *v5;

  objc_msgSend((id)OUTLINED_FUNCTION_8(a1, a2), "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)v4 = 138412290;
  *v3 = v5;
  OUTLINED_FUNCTION_8_1(&dword_21469E000, v2, OS_LOG_TYPE_ERROR, "Error setting file protection key: %@", v4);

  OUTLINED_FUNCTION_9();
}

void __47__DEDController_purgeStaleSessions_completion___block_invoke_93_cold_1(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  _QWORD *v3;
  uint8_t *v4;
  void *v5;

  objc_msgSend((id)OUTLINED_FUNCTION_8(a1, a2), "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)v4 = 138543362;
  *v3 = v5;
  OUTLINED_FUNCTION_8_1(&dword_21469E000, v2, OS_LOG_TYPE_ERROR, "Error deleting orphan dir [%{public}@]", v4);

  OUTLINED_FUNCTION_9();
}

void __96__DEDController_CompletionBlocks___timeOutSessionStartBlockWithIdentifier_targetDevice_timeout___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_21469E000, a2, OS_LOG_TYPE_ERROR, "session start timed out for session id [%{public}@]", (uint8_t *)&v3, 0xCu);
}

@end
