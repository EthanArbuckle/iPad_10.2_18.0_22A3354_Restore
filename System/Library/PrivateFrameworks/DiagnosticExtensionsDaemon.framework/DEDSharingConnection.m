@implementation DEDSharingConnection

+ (void)checkIn
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  uint8_t v7[16];
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DED_UNIT_TEST"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  Log_5();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_21469E000, v5, OS_LOG_TYPE_INFO, "NOT checking in com.apple.diagnosticextensionsd.sharing-wakeup: DEBUG", v7, 2u);
    }

  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21469E000, v5, OS_LOG_TYPE_INFO, "checking in com.apple.diagnosticextensionsd.sharing-wakeup", buf, 2u);
    }

    if (checkIn_onceToken != -1)
      dispatch_once(&checkIn_onceToken, &__block_literal_global_26);
  }
}

void __31__DEDSharingConnection_checkIn__block_invoke()
{
  _xpc_connection_s *mach_service;
  void *v1;

  mach_service = xpc_connection_create_mach_service("com.apple.diagnosticextensionsd.sharing-wakeup", 0, 1uLL);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_14);
  xpc_connection_resume(mach_service);
  v1 = (void *)checkIn__connection;
  checkIn__connection = (uint64_t)mach_service;

}

void __31__DEDSharingConnection_checkIn__block_invoke_2(uint64_t a1, void *a2)
{
  _xpc_connection_s *v2;
  _xpc_connection_s *v3;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  NSObject *v7;
  os_log_type_t v8;
  __int16 v9;
  uint8_t buf[2];

  v2 = a2;
  v3 = v2;
  if (v2 == (_xpc_connection_s *)MEMORY[0x24BDACF48])
  {
    Log_5();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v5 = "XPC_ERROR_TERMINATION_IMMINENT, will not check in for sharing-wakeup";
      v6 = buf;
      v7 = v4;
      v8 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_6;
    }
  }
  else
  {
    xpc_connection_set_event_handler(v2, &__block_literal_global_16);
    xpc_connection_resume(v3);
    Log_5();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v9 = 0;
      v5 = "did check in com.apple.diagnosticextensionsd.sharing-wakeup";
      v6 = (uint8_t *)&v9;
      v7 = v4;
      v8 = OS_LOG_TYPE_INFO;
LABEL_6:
      _os_log_impl(&dword_21469E000, v7, v8, v5, v6, 2u);
    }
  }

}

- (DEDSharingConnection)initWithController:(id)a3
{
  id v4;
  DEDSharingConnection *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  dispatch_semaphore_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)DEDSharingConnection;
  v5 = -[DEDSharingConnection init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDSharingConnection setDeviceSessions:](v5, "setDeviceSessions:", v6);

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDSharingConnection setDiscoveredDevices:](v5, "setDiscoveredDevices:", v7);

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.diagnosticextensionsd.sharingqueue", v8);
    -[DEDSharingConnection setRun_queue:](v5, "setRun_queue:", v9);

    -[DEDSharingConnection setStarted:](v5, "setStarted:", 0);
    -[DEDSharingConnection setListenForClients:](v5, "setListenForClients:", 0);
    -[DEDSharingConnection setPingService:](v5, "setPingService:", 0);
    -[DEDSharingConnection setWorkerService:](v5, "setWorkerService:", 0);
    -[DEDSharingConnection setController:](v5, "setController:", v4);
    v10 = dispatch_semaphore_create(5);
    -[DEDSharingConnection setBluetoothSessionSemaphore:](v5, "setBluetoothSessionSemaphore:", v10);

    Log_5();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[DEDSharingConnection initWithController:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[DEDSharingConnection pingService](self, "pingService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[DEDSharingConnection workerService](self, "workerService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  v5.receiver = self;
  v5.super_class = (Class)DEDSharingConnection;
  -[DEDSharingConnection dealloc](&v5, sel_dealloc);
}

- (void)configureSharingInbound:(id)a3
{
  id v4;

  v4 = a3;
  if (!-[DEDSharingConnection started](self, "started"))
    -[DEDSharingConnection setSharingInbound:](self, "setSharingInbound:", v4);

}

- (void)configureListenForClients:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (!-[DEDSharingConnection started](self, "started"))
    -[DEDSharingConnection setListenForClients:](self, "setListenForClients:", v3);
}

- (void)start
{
  DEDSharingInbound *v3;
  void *v4;
  DEDSharingInbound *v5;

  if (!-[DEDSharingConnection started](self, "started"))
  {
    v3 = [DEDSharingInbound alloc];
    -[DEDSharingConnection controller](self, "controller");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[DEDSharingInbound initWithController:sharingConnection:](v3, "initWithController:sharingConnection:", v4, self);
    -[DEDSharingConnection setSharingInbound:](self, "setSharingInbound:", v5);

    if (-[DEDSharingConnection listenForClients](self, "listenForClients"))
    {
      -[DEDSharingConnection startPingDiscovery](self, "startPingDiscovery");
      -[DEDSharingConnection startWorkerService](self, "startWorkerService");
    }
  }
}

- (void)discoverDevicesFromInbound:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __66__DEDSharingConnection_discoverDevicesFromInbound_withCompletion___block_invoke;
  v10[3] = &unk_24D1E5ED0;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[DEDSharingConnection startPingServiceWithCompletion:](self, "startPingServiceWithCompletion:", v10);

}

void __66__DEDSharingConnection_discoverDevicesFromInbound_withCompletion___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = a2;
  objc_msgSend(v3, "startPongDiscoveryFromInbound:", v4);
  (*(void (**)(void))(a1[6] + 16))();

}

- (void)stopDiscovery
{
  -[DEDSharingConnection stopPongDiscovery](self, "stopPongDiscovery");
  -[DEDSharingConnection stopPingService](self, "stopPingService");
}

- (void)startPingServiceWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  -[DEDSharingConnection pingService](self, "pingService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    Log_5();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[DEDSharingConnection pingService](self, "pingService");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v7;
      _os_log_impl(&dword_21469E000, v6, OS_LOG_TYPE_DEFAULT, "Ping service already initialized [%@]", (uint8_t *)&v12, 0xCu);

    }
    v4[2](v4, MEMORY[0x24BDBD1A8]);
  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x24BE901A8]);
    -[DEDSharingConnection setPingService:](self, "setPingService:", v8);

    Log_5();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[DEDSharingConnection pingService](self, "pingService");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v10;
      _os_log_impl(&dword_21469E000, v9, OS_LOG_TYPE_DEFAULT, "Created new ping service [%@]", (uint8_t *)&v12, 0xCu);

    }
    -[DEDSharingConnection pingService](self, "pingService");
    v11 = objc_claimAutoreleasedReturnValue();
    -[DEDSharingConnection _configureService:withLabel:needsSetup:actionType:completion:](self, "_configureService:withLabel:needsSetup:actionType:completion:", v11, CFSTR("ded-ping"), 1, 17, v4);

    v4 = (void (**)(id, _QWORD))v11;
  }

}

- (void)stopPingService
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  Log_5();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21469E000, v3, OS_LOG_TYPE_DEFAULT, "Stopping ping service.", v5, 2u);
  }

  -[DEDSharingConnection pingService](self, "pingService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[DEDSharingConnection setPingService:](self, "setPingService:", 0);
}

- (void)updatePongAdvertisement
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  -[DEDSharingConnection visiblePingUUIDs](self, "visiblePingUUIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    -[DEDSharingConnection stopPongAdvertisement](self, "stopPongAdvertisement");
  -[DEDSharingConnection visiblePingUUIDs](self, "visiblePingUUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
    -[DEDSharingConnection startPongAdvertisement](self, "startPongAdvertisement");
}

- (void)startPongAdvertisement
{
  void *v3;
  char v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  -[DEDSharingConnection workerService](self, "workerService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "needsSetup");

  if ((v4 & 1) == 0)
  {
    Log_5();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_21469E000, v5, OS_LOG_TYPE_DEFAULT, "Starting pong advertisement.", v8, 2u);
    }

    -[DEDSharingConnection workerService](self, "workerService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNeedsSetup:", 1);

    -[DEDSharingConnection workerService](self, "workerService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDeviceActionType:", 18);

  }
}

- (void)stopPongAdvertisement
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  -[DEDSharingConnection workerService](self, "workerService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "needsSetup");

  if (v4)
  {
    Log_5();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_21469E000, v5, OS_LOG_TYPE_DEFAULT, "Stopping pong advertisement.", v8, 2u);
    }

    -[DEDSharingConnection workerService](self, "workerService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNeedsSetup:", 0);

    -[DEDSharingConnection workerService](self, "workerService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDeviceActionType:", 0);

  }
}

- (void)startWorkerService
{
  void *v3;
  NSObject *v4;
  void *v5;
  const char *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[DEDSharingConnection workerService](self, "workerService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    Log_5();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[DEDSharingConnection workerService](self, "workerService");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v5;
      v6 = "Worker service already initialized [%@]";
LABEL_6:
      _os_log_impl(&dword_21469E000, v4, OS_LOG_TYPE_DEFAULT, v6, buf, 0xCu);

    }
  }
  else
  {
    v7 = objc_alloc_init(MEMORY[0x24BE901A8]);
    -[DEDSharingConnection setWorkerService:](self, "setWorkerService:", v7);

    v17 = CFSTR("com.apple.DeviceDiagnostics");
    v8 = MEMORY[0x24BDBD1C8];
    v18 = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDSharingConnection workerService](self, "workerService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPairSetupACL:", v9);

    v15 = CFSTR("com.apple.DeviceDiagnostics");
    v16 = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDSharingConnection workerService](self, "workerService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPairVerifyACL:", v11);

    -[DEDSharingConnection workerService](self, "workerService");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setOverrideScreenOff:", 1);

    -[DEDSharingConnection workerService](self, "workerService");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDSharingConnection _configureService:withLabel:needsSetup:actionType:completion:](self, "_configureService:withLabel:needsSetup:actionType:completion:", v14, CFSTR("ded-worker"), 0, 0, 0);

    Log_5();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[DEDSharingConnection workerService](self, "workerService");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v5;
      v6 = "Started sharing worker service %@";
      goto LABEL_6;
    }
  }

}

- (void)startPingDiscovery
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  -[DEDSharingConnection pingDiscovery](self, "pingDiscovery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    Log_5();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[DEDSharingConnection pingDiscovery](self, "pingDiscovery");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v35 = v5;
      _os_log_impl(&dword_21469E000, v4, OS_LOG_TYPE_DEFAULT, "Ping discovery already initialized %@", buf, 0xCu);

    }
    Log_5();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[DEDSharingConnection visiblePingUUIDs](self, "visiblePingUUIDs");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v35 = v7;
      _os_log_impl(&dword_21469E000, v6, OS_LOG_TYPE_DEFAULT, "Ping devices tracked %@", buf, 0xCu);

    }
  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x24BE90128]);
    -[DEDSharingConnection setPingDiscovery:](self, "setPingDiscovery:", v8);

    Log_5();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[DEDSharingConnection pingDiscovery](self, "pingDiscovery");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v35 = v10;
      _os_log_impl(&dword_21469E000, v9, OS_LOG_TYPE_DEFAULT, "Created ping discovery %@", buf, 0xCu);

    }
    -[DEDSharingConnection pingDiscovery](self, "pingDiscovery");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setChangeFlags:", 13);

    -[DEDSharingConnection pingDiscovery](self, "pingDiscovery");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDiscoveryFlags:", 16);

    -[DEDSharingConnection pingDiscovery](self, "pingDiscovery");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setScanRate:", 20);

    Log_5();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      -[DEDSharingConnection pingDiscovery](self, "pingDiscovery");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v35 = v15;
      _os_log_impl(&dword_21469E000, v14, OS_LOG_TYPE_DEFAULT, "Initialized Ping discovery %@", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDSharingConnection setVisiblePingUUIDs:](self, "setVisiblePingUUIDs:", v16);

    objc_initWeak((id *)buf, self);
    v17 = MEMORY[0x24BDAC760];
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __42__DEDSharingConnection_startPingDiscovery__block_invoke;
    v32[3] = &unk_24D1E5EF8;
    objc_copyWeak(&v33, (id *)buf);
    -[DEDSharingConnection pingDiscovery](self, "pingDiscovery");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDeviceFoundHandler:", v32);

    v30[0] = v17;
    v30[1] = 3221225472;
    v30[2] = __42__DEDSharingConnection_startPingDiscovery__block_invoke_35;
    v30[3] = &unk_24D1E5F20;
    objc_copyWeak(&v31, (id *)buf);
    -[DEDSharingConnection pingDiscovery](self, "pingDiscovery");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDeviceChangedHandler:", v30);

    v28[0] = v17;
    v28[1] = 3221225472;
    v28[2] = __42__DEDSharingConnection_startPingDiscovery__block_invoke_37;
    v28[3] = &unk_24D1E5EF8;
    objc_copyWeak(&v29, (id *)buf);
    -[DEDSharingConnection pingDiscovery](self, "pingDiscovery");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setDeviceLostHandler:", v28);

    v26[0] = v17;
    v26[1] = 3221225472;
    v26[2] = __42__DEDSharingConnection_startPingDiscovery__block_invoke_38;
    v26[3] = &unk_24D1E4B90;
    objc_copyWeak(&v27, (id *)buf);
    -[DEDSharingConnection pingDiscovery](self, "pingDiscovery");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setInterruptionHandler:", v26);

    v24[0] = v17;
    v24[1] = 3221225472;
    v24[2] = __42__DEDSharingConnection_startPingDiscovery__block_invoke_39;
    v24[3] = &unk_24D1E4B90;
    objc_copyWeak(&v25, (id *)buf);
    -[DEDSharingConnection pingDiscovery](self, "pingDiscovery");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setInvalidationHandler:", v24);

    -[DEDSharingConnection pingDiscovery](self, "pingDiscovery");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "activateWithCompletion:", &__block_literal_global_42);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&v33);
    objc_destroyWeak((id *)buf);
  }
}

void __42__DEDSharingConnection_startPingDiscovery__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;

  v3 = a2;
  Log_5();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __42__DEDSharingConnection_startPingDiscovery__block_invoke_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleIncomingPingingDevice:", v3);

}

void __42__DEDSharingConnection_startPingDiscovery__block_invoke_35(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;

  v3 = a2;
  Log_5();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __42__DEDSharingConnection_startPingDiscovery__block_invoke_35_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleIncomingPingingDevice:", v3);

}

void __42__DEDSharingConnection_startPingDiscovery__block_invoke_37(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id *v7;
  id WeakRetained;
  void *v9;
  int v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  Log_5();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v17 = 138412290;
    v18 = v3;
    _os_log_impl(&dword_21469E000, v4, OS_LOG_TYPE_INFO, "Ping discovery deviceLost called for device [%@]", (uint8_t *)&v17, 0xCu);
  }

  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v7);
  objc_msgSend(WeakRetained, "visiblePingUUIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", v6);

  if (v10)
  {
    Log_5();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v3;
      _os_log_impl(&dword_21469E000, v11, OS_LOG_TYPE_DEFAULT, "pingDiscovery.deviceLost: [%@]", (uint8_t *)&v17, 0xCu);
    }

    v12 = objc_loadWeakRetained(v7);
    objc_msgSend(v12, "visiblePingUUIDs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObject:", v15);

    v16 = objc_loadWeakRetained(v7);
    objc_msgSend(v16, "updatePongAdvertisement");

  }
}

void __42__DEDSharingConnection_startPingDiscovery__block_invoke_38(uint64_t a1)
{
  NSObject *v2;
  id *v3;
  id WeakRetained;
  void *v5;
  id v6;
  uint8_t v7[16];

  Log_5();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21469E000, v2, OS_LOG_TYPE_DEFAULT, "Ping discovery interrupted.", v7, 2u);
  }

  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "pingDiscovery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  v6 = objc_loadWeakRetained(v3);
  objc_msgSend(v6, "setPingDiscovery:", 0);

}

void __42__DEDSharingConnection_startPingDiscovery__block_invoke_39(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  Log_5();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21469E000, v2, OS_LOG_TYPE_DEFAULT, "Ping discovery invalidated.", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setPingDiscovery:", 0);

}

void __42__DEDSharingConnection_startPingDiscovery__block_invoke_40(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = a2;
  Log_5();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __42__DEDSharingConnection_startPingDiscovery__block_invoke_40_cold_1();
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21469E000, v4, OS_LOG_TYPE_DEFAULT, "Ping discovery activated", v5, 2u);
  }

}

- (void)_handleIncomingPingingDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  char v14;
  NSObject *v15;
  void *v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "isValidDEDPingDevice");
  -[DEDSharingConnection visiblePingUUIDs](self, "visiblePingUUIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v6);

  if (!v7 || (v9 & 1) != 0)
  {
    if ((v7 & v9) == 1)
    {
      Log_5();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[DEDSharingConnection _handleIncomingPingingDevice:].cold.1();
    }
    else
    {
      v14 = v7 | v9;
      Log_5();
      v15 = objc_claimAutoreleasedReturnValue();
      v12 = v15;
      if ((v14 & 1) != 0)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v17 = 138412290;
          v18 = v4;
          _os_log_impl(&dword_21469E000, v12, OS_LOG_TYPE_DEFAULT, "Incoming ping discovery. known device no longer valid, will stop tracking [%@]", (uint8_t *)&v17, 0xCu);
        }

        -[DEDSharingConnection visiblePingUUIDs](self, "visiblePingUUIDs");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "removeObject:", v6);

        Log_5();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          -[DEDSharingConnection _handleIncomingPingingDevice:].cold.2(self, v12);
      }
      else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        -[DEDSharingConnection _handleIncomingPingingDevice:].cold.3();
      }
    }
  }
  else
  {
    Log_5();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v4;
      _os_log_impl(&dword_21469E000, v10, OS_LOG_TYPE_DEFAULT, "Incoming ping discovery. New device is valid, will track [%@]", (uint8_t *)&v17, 0xCu);
    }

    -[DEDSharingConnection _saveDevice:](self, "_saveDevice:", v4);
    -[DEDSharingConnection visiblePingUUIDs](self, "visiblePingUUIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v6);

    Log_5();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      -[DEDSharingConnection visiblePingUUIDs](self, "visiblePingUUIDs");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v13;
      _os_log_impl(&dword_21469E000, v12, OS_LOG_TYPE_INFO, "Tracked DED ping devices %@", (uint8_t *)&v17, 0xCu);

    }
  }

  -[DEDSharingConnection updatePongAdvertisement](self, "updatePongAdvertisement");
}

- (void)stopPingDiscovery
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  Log_5();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[DEDSharingConnection pingDiscovery](self, "pingDiscovery");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_21469E000, v3, OS_LOG_TYPE_DEFAULT, "Stopping ping discovery on %@.", (uint8_t *)&v6, 0xCu);

  }
  -[DEDSharingConnection pingDiscovery](self, "pingDiscovery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  -[DEDSharingConnection setPingDiscovery:](self, "setPingDiscovery:", 0);
}

- (void)startPongDiscoveryFromInbound:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[DEDSharingConnection pongDiscovery](self, "pongDiscovery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    Log_5();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[DEDSharingConnection pongDiscovery](self, "pongDiscovery");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v40 = v7;
      _os_log_impl(&dword_21469E000, v6, OS_LOG_TYPE_DEFAULT, "Pong discovery already initialized %@", buf, 0xCu);

    }
    Log_5();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[DEDSharingConnection pongingDevices](self, "pongingDevices");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v40 = v9;
      _os_log_impl(&dword_21469E000, v8, OS_LOG_TYPE_DEFAULT, "Pong devices tracked %@", buf, 0xCu);

    }
  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x24BE90128]);
    -[DEDSharingConnection setPongDiscovery:](self, "setPongDiscovery:", v10);

    Log_5();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[DEDSharingConnection pongingDevices](self, "pongingDevices");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v40 = v12;
      _os_log_impl(&dword_21469E000, v11, OS_LOG_TYPE_DEFAULT, "Created pong discovery %@", buf, 0xCu);

    }
    -[DEDSharingConnection pongDiscovery](self, "pongDiscovery");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setChangeFlags:", 13);

    -[DEDSharingConnection pongDiscovery](self, "pongDiscovery");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDiscoveryFlags:", 100794256);

    -[DEDSharingConnection pongDiscovery](self, "pongDiscovery");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setScanRate:", 20);

    Log_5();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      -[DEDSharingConnection pongDiscovery](self, "pongDiscovery");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v40 = v17;
      _os_log_impl(&dword_21469E000, v16, OS_LOG_TYPE_DEFAULT, "Initialized Pong discovery %@", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDSharingConnection setPongingDevices:](self, "setPongingDevices:", v18);

    objc_initWeak((id *)buf, self);
    v19 = MEMORY[0x24BDAC760];
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __54__DEDSharingConnection_startPongDiscoveryFromInbound___block_invoke;
    v36[3] = &unk_24D1E5F88;
    objc_copyWeak(&v38, (id *)buf);
    v20 = v4;
    v37 = v20;
    -[DEDSharingConnection pongDiscovery](self, "pongDiscovery");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setDeviceFoundHandler:", v36);

    v33[0] = v19;
    v33[1] = 3221225472;
    v33[2] = __54__DEDSharingConnection_startPongDiscoveryFromInbound___block_invoke_43;
    v33[3] = &unk_24D1E5FB0;
    objc_copyWeak(&v35, (id *)buf);
    v34 = v20;
    -[DEDSharingConnection pongDiscovery](self, "pongDiscovery");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setDeviceChangedHandler:", v33);

    v31[0] = v19;
    v31[1] = 3221225472;
    v31[2] = __54__DEDSharingConnection_startPongDiscoveryFromInbound___block_invoke_44;
    v31[3] = &unk_24D1E5EF8;
    objc_copyWeak(&v32, (id *)buf);
    -[DEDSharingConnection pongDiscovery](self, "pongDiscovery");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setDeviceLostHandler:", v31);

    v29[0] = v19;
    v29[1] = 3221225472;
    v29[2] = __54__DEDSharingConnection_startPongDiscoveryFromInbound___block_invoke_46;
    v29[3] = &unk_24D1E4B90;
    objc_copyWeak(&v30, (id *)buf);
    -[DEDSharingConnection pongDiscovery](self, "pongDiscovery");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setInterruptionHandler:", v29);

    v27[0] = v19;
    v27[1] = 3221225472;
    v27[2] = __54__DEDSharingConnection_startPongDiscoveryFromInbound___block_invoke_47;
    v27[3] = &unk_24D1E4B90;
    objc_copyWeak(&v28, (id *)buf);
    -[DEDSharingConnection pongDiscovery](self, "pongDiscovery");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setInvalidationHandler:", v27);

    -[DEDSharingConnection pongDiscovery](self, "pongDiscovery");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "activateWithCompletion:", &__block_literal_global_49_0);

    objc_destroyWeak(&v28);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&v32);

    objc_destroyWeak(&v35);
    objc_destroyWeak(&v38);
    objc_destroyWeak((id *)buf);
  }

}

void __54__DEDSharingConnection_startPongDiscoveryFromInbound___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;

  v3 = a2;
  Log_5();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __54__DEDSharingConnection_startPongDiscoveryFromInbound___block_invoke_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleIncomingPongingDevice:fromInbound:", v3, *(_QWORD *)(a1 + 32));

}

void __54__DEDSharingConnection_startPongDiscoveryFromInbound___block_invoke_43(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;

  v3 = a2;
  Log_5();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __54__DEDSharingConnection_startPongDiscoveryFromInbound___block_invoke_43_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleIncomingPongingDevice:fromInbound:", v3, *(_QWORD *)(a1 + 32));

}

void __54__DEDSharingConnection_startPongDiscoveryFromInbound___block_invoke_44(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  Log_5();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v16 = 138412290;
    v17 = v3;
    _os_log_impl(&dword_21469E000, v4, OS_LOG_TYPE_INFO, "Pong discovery deviceLost called for device [%@]", (uint8_t *)&v16, 0xCu);
  }

  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v7);
  objc_msgSend(WeakRetained, "pongingDevices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    Log_5();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      __54__DEDSharingConnection_startPongDiscoveryFromInbound___block_invoke_44_cold_1();

    +[DEDDevice deviceForSFDevice:andStatus:](DEDDevice, "deviceForSFDevice:andStatus:", v3, 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_loadWeakRetained(v7);
    objc_msgSend(v13, "updateControllerWithDevice:andStatus:", v12, 4);

    v14 = objc_loadWeakRetained(v7);
    objc_msgSend(v14, "pongingDevices");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeObjectForKey:", v6);

  }
}

void __54__DEDSharingConnection_startPongDiscoveryFromInbound___block_invoke_46(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "pongDiscovery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "setPongDiscovery:", 0);

  Log_5();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21469E000, v5, OS_LOG_TYPE_DEFAULT, "Pong discovery interrupted.", v6, 2u);
  }

}

void __54__DEDSharingConnection_startPongDiscoveryFromInbound___block_invoke_47(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint8_t v3[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setPongDiscovery:", 0);

  Log_5();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21469E000, v2, OS_LOG_TYPE_INFO, "Pong discovery invalidated.", v3, 2u);
  }

}

void __54__DEDSharingConnection_startPongDiscoveryFromInbound___block_invoke_48(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  Log_5();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_21469E000, v3, OS_LOG_TYPE_DEFAULT, "Pong discovery activated (error: %@).", (uint8_t *)&v4, 0xCu);
  }

}

- (void)_handleIncomingPongingDevice:(id)a3 fromInbound:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  int v19;
  NSObject *v20;
  char v21;
  void *v22;
  void *v23;
  _QWORD block[5];
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v6, "isValidDEDPongDevice");
  -[DEDSharingConnection pongingDevices](self, "pongingDevices");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10 || v12)
  {
    if (v12)
      v19 = v10;
    else
      v19 = 0;
    if (v19 == 1)
    {
      Log_5();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        -[DEDSharingConnection _handleIncomingPongingDevice:fromInbound:].cold.1();
    }
    else
    {
      if (v12)
        v21 = 1;
      else
        v21 = v10;
      if ((v21 & 1) != 0)
      {
        +[DEDDevice deviceForSFDevice:andStatus:](DEDDevice, "deviceForSFDevice:andStatus:", v6, 4);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[DEDSharingConnection updateControllerWithDevice:andStatus:](self, "updateControllerWithDevice:andStatus:", v22, 4);
        -[DEDSharingConnection pongingDevices](self, "pongingDevices");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "removeObjectForKey:", v9);

        goto LABEL_26;
      }
      Log_5();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        -[DEDSharingConnection _handleIncomingPongingDevice:fromInbound:].cold.2();
    }

    goto LABEL_26;
  }
  Log_5();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v6;
    _os_log_impl(&dword_21469E000, v13, OS_LOG_TYPE_DEFAULT, "Incoming pong discovery. New device has pong action and within range, will get status [%@]", buf, 0xCu);
  }

  Log_5();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[DEDSharingConnection _handleIncomingPongingDevice:fromInbound:].cold.5(v6);

  Log_5();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[DEDSharingConnection _handleIncomingPongingDevice:fromInbound:].cold.4(v6);

  -[DEDSharingConnection _saveDevice:](self, "_saveDevice:", v6);
  -[DEDSharingConnection pongingDevices](self, "pongingDevices");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v6, v9);

  Log_5();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    -[DEDSharingConnection _handleIncomingPongingDevice:fromInbound:].cold.3(self, v17);

  -[DEDSharingConnection run_queue](self, "run_queue");
  v18 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__DEDSharingConnection__handleIncomingPongingDevice_fromInbound___block_invoke;
  block[3] = &unk_24D1E4930;
  block[4] = self;
  v25 = v6;
  v26 = v7;
  dispatch_async(v18, block);

LABEL_26:
}

uint64_t __65__DEDSharingConnection__handleIncomingPongingDevice_fromInbound___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "trySessionWithFoundDevice:fromInbound:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)stopPongDiscovery
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  Log_5();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21469E000, v3, OS_LOG_TYPE_DEFAULT, "Stopping pong discovery.", v5, 2u);
  }

  -[DEDSharingConnection pongDiscovery](self, "pongDiscovery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[DEDSharingConnection setPongDiscovery:](self, "setPongDiscovery:", 0);
}

- (void)trySessionWithFoundDevice:(id)a3 fromInbound:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  +[DEDDevice deviceForSFDevice:andStatus:](DEDDevice, "deviceForSFDevice:andStatus:", v6, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDSharingConnection _existingSharingSessionForDevice:](self, "_existingSharingSessionForDevice:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[DEDSharingConnection checkReadinessForSFDevice:session:](self, "checkReadinessForSFDevice:session:", v6, v9);
  }
  else
  {
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __62__DEDSharingConnection_trySessionWithFoundDevice_fromInbound___block_invoke;
    v10[3] = &unk_24D1E5FF8;
    objc_copyWeak(&v12, &location);
    v11 = v6;
    -[DEDSharingConnection createSharingSessionForSFDevice:holdForPIN:fromInbound:completion:](self, "createSharingSessionForSFDevice:holdForPIN:fromInbound:completion:", v11, 0, v7, v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

void __62__DEDSharingConnection_trySessionWithFoundDevice_fromInbound___block_invoke(uint64_t a1, void *a2, int a3)
{
  id *v5;
  id v6;
  id WeakRetained;
  id v8;
  NSObject *v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;

  v5 = (id *)(a1 + 40);
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  v10 = WeakRetained;
  if (a3)
  {
    objc_msgSend(WeakRetained, "checkReadinessForSFDevice:session:", *(_QWORD *)(a1 + 32), v6);

  }
  else
  {
    objc_msgSend(WeakRetained, "stopSession:", v6);

    v8 = objc_loadWeakRetained(v5);
    objc_msgSend(v8, "run_queue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __62__DEDSharingConnection_trySessionWithFoundDevice_fromInbound___block_invoke_2;
    block[3] = &unk_24D1E4BE0;
    objc_copyWeak(&v13, v5);
    v12 = *(id *)(a1 + 32);
    dispatch_async(v9, block);

    objc_destroyWeak(&v13);
  }
}

void __62__DEDSharingConnection_trySessionWithFoundDevice_fromInbound___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "getSystemInfoForDevice:", *(_QWORD *)(a1 + 32));

}

- (void)getSystemInfoForDevice:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  id v13;
  dispatch_time_t v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  _QWORD *v24;
  _QWORD v25[3];
  char v26;

  v4 = a3;
  Log_5();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[DEDSharingConnection getSystemInfoForDevice:].cold.2(v4, v5);

  -[DEDSharingConnection bluetoothSessionSemaphore](self, "bluetoothSessionSemaphore");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);

  v7 = objc_alloc_init(MEMORY[0x24BE901D0]);
  v8 = objc_alloc_init(MEMORY[0x24BE90108]);
  objc_msgSend(v4, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIdentifier:", v9);

  objc_msgSend(v7, "setPeerDevice:", v8);
  objc_msgSend(v7, "setAllowUnencrypted:", 1);
  objc_msgSend(v7, "activate");
  Log_5();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[DEDSharingConnection getSystemInfoForDevice:].cold.1(v4, v10);

  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v26 = 0;
  v11 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __47__DEDSharingConnection_getSystemInfoForDevice___block_invoke;
  v21[3] = &unk_24D1E6020;
  v24 = v25;
  v21[4] = self;
  v12 = v4;
  v22 = v12;
  v13 = v7;
  v23 = v13;
  objc_msgSend(v13, "getSystemInfoWithCompletion:", v21);
  v14 = dispatch_time(0, 18000000000);
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __47__DEDSharingConnection_getSystemInfoForDevice___block_invoke_58;
  v17[3] = &unk_24D1E5170;
  v17[4] = self;
  v18 = v12;
  v19 = v13;
  v20 = v25;
  v15 = v13;
  v16 = v12;
  dispatch_after(v14, MEMORY[0x24BDAC9B8], v17);

  _Block_object_dispose(v25, 8);
}

void __47__DEDSharingConnection_getSystemInfoForDevice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    if (v6)
      goto LABEL_3;
LABEL_7:
    Log_5();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __47__DEDSharingConnection_getSystemInfoForDevice___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "_saveDevice:", *(_QWORD *)(a1 + 40));
    +[DEDDevice deviceForSFDevice:systemInfo:andStatus:](DEDDevice, "deviceForSFDevice:systemInfo:andStatus:", *(_QWORD *)(a1 + 40), v5, 2);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "updateControllerWithDevice:andStatus:", v8, 2);
    goto LABEL_10;
  }
  objc_msgSend(*(id *)(a1 + 32), "bluetoothSessionSemaphore");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v9);

  if (!v7)
    goto LABEL_7;
LABEL_3:
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    Log_5();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __47__DEDSharingConnection_getSystemInfoForDevice___block_invoke_cold_2();
LABEL_10:

  }
  objc_msgSend(*(id *)(a1 + 48), "invalidate");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;

}

uint64_t __47__DEDSharingConnection_getSystemInfoForDevice___block_invoke_58(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  NSObject *v3;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 24))
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 32), "bluetoothSessionSemaphore");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_signal(v2);

    Log_5();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __47__DEDSharingConnection_getSystemInfoForDevice___block_invoke_58_cold_1(v1, v3);

    result = objc_msgSend(*(id *)(v1 + 48), "invalidate");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 56) + 8) + 24) = 1;
  }
  return result;
}

- (void)checkReadinessForSFDevice:(id)a3 session:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  Log_5();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[DEDSharingConnection checkReadinessForSFDevice:session:].cold.1(v5, v7);

  v11[0] = CFSTR("setup");
  v11[1] = CFSTR("yourIdentifier");
  v12[0] = CFSTR("ready_check");
  objc_msgSend(v5, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendWithFlags:object:", 0, v10);

}

- (void)sharing_startPairSetupForDevice:(id)a3 fromInbound:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  id v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  void *v14;
  _QWORD v15[4];
  void (**v16)(_QWORD, _QWORD);
  _QWORD v17[5];
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  Log_5();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[DEDSharingConnection sharing_startPairSetupForDevice:fromInbound:].cold.1(v6);

  v9 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __68__DEDSharingConnection_sharing_startPairSetupForDevice_fromInbound___block_invoke;
  v17[3] = &unk_24D1E6070;
  v17[4] = self;
  v10 = v6;
  v18 = v10;
  v11 = v7;
  v19 = v11;
  v12 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199D4184](v17);
  -[DEDSharingConnection _existingSharingSessionForDevice:](self, "_existingSharingSessionForDevice:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    ((void (**)(_QWORD, void *))v12)[2](v12, v13);
  }
  else
  {
    objc_msgSend(v10, "sfDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __68__DEDSharingConnection_sharing_startPairSetupForDevice_fromInbound___block_invoke_66;
    v15[3] = &unk_24D1E6098;
    v16 = v12;
    -[DEDSharingConnection createSharingSessionForSFDevice:holdForPIN:fromInbound:completion:](self, "createSharingSessionForSFDevice:holdForPIN:fromInbound:completion:", v14, 1, v11, v15);

  }
}

void __68__DEDSharingConnection_sharing_startPairSetupForDevice_fromInbound___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __68__DEDSharingConnection_sharing_startPairSetupForDevice_fromInbound___block_invoke_2;
  v6[3] = &unk_24D1E6048;
  v4 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = *(id *)(a1 + 48);
  v9 = v3;
  v5 = v3;
  objc_msgSend(v5, "pairSetupWithFlags:completion:", 8, v6);

}

void __68__DEDSharingConnection_sharing_startPairSetupForDevice_fromInbound___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a2;
  Log_5();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __68__DEDSharingConnection_sharing_startPairSetupForDevice_fromInbound___block_invoke_2_cold_2(v4, v5, v6, v7, v8, v9, v10, v11);

  if (v3)
  {
    if (objc_msgSend(v3, "code") != -6723)
    {
      Log_5();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        __68__DEDSharingConnection_sharing_startPairSetupForDevice_fromInbound___block_invoke_2_cold_1();

      objc_msgSend(*(id *)(a1 + 32), "sharing_startPairSetupForDevice:fromInbound:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "controller");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sharingInbound_successPINForDevice:fromInbound:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

    v14 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "sfDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "checkReadinessForSFDevice:session:", v15, *(_QWORD *)(a1 + 56));

  }
}

uint64_t __68__DEDSharingConnection_sharing_startPairSetupForDevice_fromInbound___block_invoke_66(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)sharing_tryPIN:(id)a3 forDevice:(id)a4 fromInbound:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  Log_5();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138543362;
    v14 = v8;
    _os_log_impl(&dword_21469E000, v9, OS_LOG_TYPE_DEFAULT, "trying pin for device [%{public}@]", (uint8_t *)&v13, 0xCu);
  }

  -[DEDSharingConnection _existingSharingSessionForDevice:](self, "_existingSharingSessionForDevice:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "pairSetupTryPIN:", v7);
  }
  else
  {
    Log_5();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[DEDSharingConnection sharing_tryPIN:forDevice:fromInbound:].cold.1();

  }
}

- (id)sharingOutboundForBugSessionIdentifier:(id)a3 device:(id)a4 fromInbound:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  DEDSharingOutbound *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[DEDSharingConnection _existingSharingSessionForDevice:](self, "_existingSharingSessionForDevice:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11
    || (-[DEDSharingConnection blockingSharingSessionForDevice:fromInbound:](self, "blockingSharingSessionForDevice:fromInbound:", v9, v10), (v11 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v12 = -[DEDSharingOutbound initWithID:withSFSession:connection:]([DEDSharingOutbound alloc], "initWithID:withSFSession:connection:", v8, v11, self);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)sharing_startBugSessionWithIdentifier:(id)a3 configuration:(id)a4 caller:(id)a5 target:(id)a6 fromInbound:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  _QWORD v23[6];

  v23[5] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  -[DEDSharingConnection blockingSharingSessionForDevice:fromInbound:](self, "blockingSharingSessionForDevice:fromInbound:", v15, a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    Log_5();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[DEDSharingConnection sharing_startBugSessionWithIdentifier:configuration:caller:target:fromInbound:].cold.1(v15, v17);

    objc_msgSend(v13, "secureArchive");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "data");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v22[0] = CFSTR("setup");
    v22[1] = CFSTR("sessionID");
    v23[0] = CFSTR("start_session");
    v23[1] = v12;
    v23[2] = v18;
    v22[2] = CFSTR("config");
    v22[3] = CFSTR("callingDevice");
    objc_msgSend(v14, "serialize");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23[3] = v19;
    v22[4] = CFSTR("targetDevice");
    objc_msgSend(v15, "serialize");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23[4] = v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "sendWithFlags:object:", 0, v21);
  }

}

- (void)sharing_didStartBugSessionWithInfo:(id)a3 forCaller:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[DEDSharingConnection _existingSharingSessionForDevice:](self, "_existingSharingSessionForDevice:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("did_start_session"), CFSTR("setup"));
    objc_msgSend(v6, "sendWithFlags:object:", 0, v7);

  }
}

- (void)updateControllerWithDevice:(id)a3 andStatus:(int64_t)a4
{
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[DEDSharingConnection deviceStatusCallback](self, "deviceStatusCallback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v14, "setStatus:", a4);
    -[DEDSharingConnection deviceStatusCallback](self, "deviceStatusCallback");
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, int64_t))v7)[2](v7, v14, a4);

  }
  -[DEDSharingConnection deviceSessions](self, "deviceSessions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "address");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[DEDSharingConnection deviceSessions](self, "deviceSessions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "address");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDSharingConnection stopSession:](self, "stopSession:", v13);

  }
}

- (void)_saveDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[DEDSharingConnection discoveredDevices](self, "discoveredDevices");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v4, v6);

}

- (void)_configureService:(id)a3 withLabel:(id)a4 needsSetup:(BOOL)a5 actionType:(unsigned __int8)a6 completion:(id)a7
{
  uint64_t v8;
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  BOOL v23;
  char v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id from;
  id location;

  v8 = a6;
  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = a7;
  objc_msgSend(v12, "setAdvertiseRate:", 40);
  objc_msgSend(v12, "setIdentifier:", *MEMORY[0x24BE90378]);
  objc_msgSend(v12, "setLabel:", v13);
  if (v9)
  {
    objc_msgSend(v12, "setNeedsSetup:", 1);
    objc_msgSend(v12, "setDeviceActionType:", v8);
  }
  else
  {
    objc_msgSend(v12, "setNeedsSetup:", 0);
  }
  objc_initWeak(&location, self);
  objc_initWeak(&from, v12);
  v15 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __85__DEDSharingConnection__configureService_withLabel_needsSetup_actionType_completion___block_invoke;
  v29[3] = &unk_24D1E4BE0;
  objc_copyWeak(&v31, &from);
  v16 = v13;
  v30 = v16;
  objc_msgSend(v12, "setInterruptionHandler:", v29);
  v27[0] = v15;
  v27[1] = 3221225472;
  v27[2] = __85__DEDSharingConnection__configureService_withLabel_needsSetup_actionType_completion___block_invoke_81;
  v27[3] = &unk_24D1E4600;
  v17 = v16;
  v28 = v17;
  objc_msgSend(v12, "setInvalidationHandler:", v27);
  v25[0] = v15;
  v25[1] = 3221225472;
  v25[2] = __85__DEDSharingConnection__configureService_withLabel_needsSetup_actionType_completion___block_invoke_82;
  v25[3] = &unk_24D1E60C0;
  objc_copyWeak(&v26, &location);
  objc_msgSend(v12, "setReceivedObjectHandler:", v25);
  objc_msgSend(v12, "setReceivedRequestHandler:", 0);
  v20[0] = v15;
  v20[1] = 3221225472;
  v20[2] = __85__DEDSharingConnection__configureService_withLabel_needsSetup_actionType_completion___block_invoke_2;
  v20[3] = &unk_24D1E60E8;
  v23 = v9;
  v18 = v17;
  v21 = v18;
  v24 = v8;
  v19 = v14;
  v22 = v19;
  objc_msgSend(v12, "activateWithCompletion:", v20);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __85__DEDSharingConnection__configureService_withLabel_needsSetup_actionType_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "invalidate");

  Log_5();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_21469E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ service interrupted.", (uint8_t *)&v5, 0xCu);
  }

}

void __85__DEDSharingConnection__configureService_withLabel_needsSetup_actionType_completion___block_invoke_81(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  Log_5();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_21469E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ service invalidated.", (uint8_t *)&v4, 0xCu);
  }

}

void __85__DEDSharingConnection__configureService_withLabel_needsSetup_actionType_completion___block_invoke_82(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id *v5;
  id v6;
  id v7;
  void *v8;
  id WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a4;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "sharingInbound");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleObject:forSFSession:", v6, v7);

}

void __85__DEDSharingConnection__configureService_withLabel_needsSetup_actionType_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;

  v3 = a2;
  v4 = *(unsigned __int8 *)(a1 + 48);
  Log_5();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v6)
      __85__DEDSharingConnection__configureService_withLabel_needsSetup_actionType_completion___block_invoke_2_cold_2();
  }
  else if (v6)
  {
    __85__DEDSharingConnection__configureService_withLabel_needsSetup_actionType_completion___block_invoke_2_cold_1();
  }

  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, MEMORY[0x24BDBD1A8]);

}

- (id)_existingSharingSessionForDevice:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;

  objc_msgSend(a3, "address");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDSharingConnection deviceSessions](self, "deviceSessions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    Log_5();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[DEDSharingConnection _existingSharingSessionForDevice:].cold.1();

    -[DEDSharingConnection deviceSessions](self, "deviceSessions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)blockingSharingSessionForDevice:(id)a3 fromInbound:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  dispatch_semaphore_t v13;
  void *v14;
  NSObject *v15;
  dispatch_time_t v16;
  _QWORD v18[4];
  NSObject *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v7 = a4;
  Log_5();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[DEDSharingConnection blockingSharingSessionForDevice:fromInbound:].cold.1(v6, v8);

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__4;
  v25 = __Block_byref_object_dispose__4;
  v26 = 0;
  -[DEDSharingConnection _existingSharingSessionForDevice:](self, "_existingSharingSessionForDevice:", v6);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v22[5];
  v22[5] = v9;

  v11 = (void *)v22[5];
  if (v11)
  {
    v12 = v11;
  }
  else
  {
    v13 = dispatch_semaphore_create(0);
    objc_msgSend(v6, "sfDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __68__DEDSharingConnection_blockingSharingSessionForDevice_fromInbound___block_invoke;
    v18[3] = &unk_24D1E6110;
    v20 = &v21;
    v15 = v13;
    v19 = v15;
    -[DEDSharingConnection createSharingSessionForSFDevice:holdForPIN:fromInbound:completion:](self, "createSharingSessionForSFDevice:holdForPIN:fromInbound:completion:", v14, 0, v7, v18);

    v16 = dispatch_time(0, 2000000000);
    dispatch_semaphore_wait(v15, v16);
    v12 = (id)v22[5];

  }
  _Block_object_dispose(&v21, 8);

  return v12;
}

void __68__DEDSharingConnection_blockingSharingSessionForDevice_fromInbound___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v6;

  v6 = a2;
  if (a3)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)createSharingSessionForSFDevice:(id)a3 holdForPIN:(BOOL)a4 fromInbound:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v23[4];
  id v24;
  id v25;
  uint64_t *v26;
  id v27;
  BOOL v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id from;
  id location;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  const __CFString *v54;
  _QWORD v55[3];

  v55[1] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  v21 = a6;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__4;
  v52 = __Block_byref_object_dispose__4;
  v53 = objc_alloc_init(MEMORY[0x24BE901B0]);
  objc_msgSend((id)v49[5], "setServiceIdentifier:", *MEMORY[0x24BE90378]);
  objc_msgSend((id)v49[5], "setPeerDevice:", v9);
  v54 = CFSTR("com.apple.DeviceDiagnostics");
  v55[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v55, &v54, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v49[5], "setPairSetupACL:", v11);

  objc_msgSend((id)v49[5], "setLabel:", CFSTR("ded-session"));
  objc_initWeak(&location, (id)v49[5]);
  objc_initWeak(&from, self);
  v12 = MEMORY[0x24BDAC760];
  v44[0] = MEMORY[0x24BDAC760];
  v44[1] = 3221225472;
  v44[2] = __90__DEDSharingConnection_createSharingSessionForSFDevice_holdForPIN_fromInbound_completion___block_invoke;
  v44[3] = &unk_24D1E6138;
  v13 = v9;
  v45 = v13;
  objc_msgSend((id)v49[5], "setErrorHandler:", v44);
  v40[0] = v12;
  v40[1] = 3221225472;
  v40[2] = __90__DEDSharingConnection_createSharingSessionForSFDevice_holdForPIN_fromInbound_completion___block_invoke_87;
  v40[3] = &unk_24D1E6160;
  v14 = v13;
  v41 = v14;
  objc_copyWeak(&v42, &from);
  objc_copyWeak(&v43, &location);
  objc_msgSend((id)v49[5], "setInterruptionHandler:", v40);
  v36[0] = v12;
  v36[1] = 3221225472;
  v36[2] = __90__DEDSharingConnection_createSharingSessionForSFDevice_holdForPIN_fromInbound_completion___block_invoke_88;
  v36[3] = &unk_24D1E6160;
  v15 = v14;
  v37 = v15;
  objc_copyWeak(&v38, &from);
  objc_copyWeak(&v39, &location);
  objc_msgSend((id)v49[5], "setInvalidationHandler:", v36);
  v32[0] = v12;
  v32[1] = 3221225472;
  v32[2] = __90__DEDSharingConnection_createSharingSessionForSFDevice_holdForPIN_fromInbound_completion___block_invoke_89;
  v32[3] = &unk_24D1E6188;
  v16 = v15;
  v33 = v16;
  objc_copyWeak(&v35, &from);
  v17 = v10;
  v34 = v17;
  objc_msgSend((id)v49[5], "setPromptForPINHandler:", v32);
  v29[0] = v12;
  v29[1] = 3221225472;
  v29[2] = __90__DEDSharingConnection_createSharingSessionForSFDevice_holdForPIN_fromInbound_completion___block_invoke_2;
  v29[3] = &unk_24D1E61B0;
  objc_copyWeak(&v30, &from);
  objc_copyWeak(&v31, &location);
  objc_msgSend((id)v49[5], "setReceivedObjectHandler:", v29);
  v18 = (void *)v49[5];
  v23[0] = v12;
  v23[1] = 3221225472;
  v23[2] = __90__DEDSharingConnection_createSharingSessionForSFDevice_holdForPIN_fromInbound_completion___block_invoke_3;
  v23[3] = &unk_24D1E61D8;
  v26 = &v48;
  v19 = v16;
  v24 = v19;
  objc_copyWeak(&v27, &from);
  v28 = a4;
  v20 = v21;
  v25 = v20;
  objc_msgSend(v18, "activateWithCompletion:", v23);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&v30);

  objc_destroyWeak(&v35);
  objc_destroyWeak(&v39);
  objc_destroyWeak(&v38);

  objc_destroyWeak(&v43);
  objc_destroyWeak(&v42);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v48, 8);

}

void __90__DEDSharingConnection_createSharingSessionForSFDevice_holdForPIN_fromInbound_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  Log_5();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __90__DEDSharingConnection_createSharingSessionForSFDevice_holdForPIN_fromInbound_completion___block_invoke_cold_1();

}

void __90__DEDSharingConnection_createSharingSessionForSFDevice_holdForPIN_fromInbound_completion___block_invoke_87(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  Log_5();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __90__DEDSharingConnection_createSharingSessionForSFDevice_holdForPIN_fromInbound_completion___block_invoke_87_cold_1(a1, v2);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "deviceSessions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v5, "peerDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", v8);

}

void __90__DEDSharingConnection_createSharingSessionForSFDevice_holdForPIN_fromInbound_completion___block_invoke_88(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  Log_5();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __90__DEDSharingConnection_createSharingSessionForSFDevice_holdForPIN_fromInbound_completion___block_invoke_88_cold_1(a1, v2);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "deviceSessions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v5, "peerDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", v8);

}

void __90__DEDSharingConnection_createSharingSessionForSFDevice_holdForPIN_fromInbound_completion___block_invoke_89(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  +[DEDDevice deviceForSFDevice:andStatus:](DEDDevice, "deviceForSFDevice:andStatus:", *(_QWORD *)(a1 + 32), 2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sharingInbound_promptPINForDevice:fromInbound:", v4, *(_QWORD *)(a1 + 40));

}

void __90__DEDSharingConnection_createSharingSessionForSFDevice_holdForPIN_fromInbound_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id *v4;
  id v5;
  void *v6;
  id v7;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "sharingInbound");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v6, "handleObject:forSFSession:", v5, v7);

}

void __90__DEDSharingConnection_createSharingSessionForSFDevice_holdForPIN_fromInbound_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a2;
  Log_5();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __90__DEDSharingConnection_createSharingSessionForSFDevice_holdForPIN_fromInbound_completion___block_invoke_3_cold_2();

  if (v3)
  {
    Log_5();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __90__DEDSharingConnection_createSharingSessionForSFDevice_holdForPIN_fromInbound_completion___block_invoke_3_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "deviceSessions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v10);

    v11 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v11, "_verifyPairingForSession:holdForPIN:completion:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 40));

  }
}

- (void)_verifyPairingForSession:(id)a3 holdForPIN:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  BOOL v16;
  id location;

  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __71__DEDSharingConnection__verifyPairingForSession_holdForPIN_completion___block_invoke;
  v12[3] = &unk_24D1E6200;
  v10 = v8;
  v13 = v10;
  v16 = a4;
  objc_copyWeak(&v15, &location);
  v11 = v9;
  v14 = v11;
  objc_msgSend(v10, "pairVerifyWithFlags:completion:", 8, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __71__DEDSharingConnection__verifyPairingForSession_holdForPIN_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void (*v9)(void);
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  Log_5();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "peerDevice");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v7;
      v14 = 2112;
      v15 = v3;
      _os_log_impl(&dword_21469E000, v4, OS_LOG_TYPE_DEFAULT, "verifyPairing (%@) error: %@ ", (uint8_t *)&v12, 0x16u);

    }
    if (!*(_BYTE *)(a1 + 56))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(WeakRetained, "stopSession:", *(_QWORD *)(a1 + 32));

    }
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "peerDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v11;
      _os_log_impl(&dword_21469E000, v4, OS_LOG_TYPE_DEFAULT, "verifyPairing (%@) success!", (uint8_t *)&v12, 0xCu);

    }
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v9();

}

- (void)stopSession:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[DEDSharingConnection deviceSessions](self, "deviceSessions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "peerDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", v7);

  objc_msgSend(v8, "invalidate");
}

- (void)addIncomingSFSession:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __59__DEDSharingConnection_addIncomingSFSession_forIdentifier___block_invoke;
  v14[3] = &unk_24D1E6228;
  v8 = v7;
  v15 = v8;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v6, "setInvalidationHandler:", v14);
  Log_5();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v8;
    _os_log_impl(&dword_21469E000, v9, OS_LOG_TYPE_DEFAULT, "Incoming SFSession added for %@", buf, 0xCu);
  }

  -[DEDSharingConnection deviceSessions](self, "deviceSessions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 == 0;

  if (v12)
  {
    -[DEDSharingConnection deviceSessions](self, "deviceSessions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v6, v8);

  }
  objc_destroyWeak(&v16);

  objc_destroyWeak(&location);
}

void __59__DEDSharingConnection_addIncomingSFSession_forIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  Log_5();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_21469E000, v2, OS_LOG_TYPE_INFO, "Incoming SFSession Invalidated for %@", (uint8_t *)&v6, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "deviceSessions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

}

- (DEDSharingInbound)sharingInbound
{
  return (DEDSharingInbound *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSharingInbound:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (DEDSharingInboundDelegate)controller
{
  return (DEDSharingInboundDelegate *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void)setController:(id)a3
{
  objc_storeWeak((id *)&self->_controller, a3);
}

- (BOOL)listenForClients
{
  return self->_listenForClients;
}

- (void)setListenForClients:(BOOL)a3
{
  self->_listenForClients = a3;
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (NSMutableDictionary)pongingDevices
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPongingDevices:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableDictionary)deviceSessions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDeviceSessions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSMutableDictionary)discoveredDevices
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDiscoveredDevices:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (OS_dispatch_queue)run_queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRun_queue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (OS_dispatch_semaphore)bluetoothSessionSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 64, 1);
}

- (void)setBluetoothSessionSemaphore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (SFService)pingService
{
  return self->_pingService;
}

- (void)setPingService:(id)a3
{
  objc_storeStrong((id *)&self->_pingService, a3);
}

- (SFDeviceDiscovery)pingDiscovery
{
  return self->_pingDiscovery;
}

- (void)setPingDiscovery:(id)a3
{
  objc_storeStrong((id *)&self->_pingDiscovery, a3);
}

- (NSMutableSet)visiblePingUUIDs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 88, 1);
}

- (void)setVisiblePingUUIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (SFService)workerService
{
  return self->_workerService;
}

- (void)setWorkerService:(id)a3
{
  objc_storeStrong((id *)&self->_workerService, a3);
}

- (SFDeviceDiscovery)pongDiscovery
{
  return self->_pongDiscovery;
}

- (void)setPongDiscovery:(id)a3
{
  objc_storeStrong((id *)&self->_pongDiscovery, a3);
}

- (id)deviceStatusCallback
{
  return objc_getProperty(self, a2, 112, 1);
}

- (void)setDeviceStatusCallback:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deviceStatusCallback, 0);
  objc_storeStrong((id *)&self->_pongDiscovery, 0);
  objc_storeStrong((id *)&self->_workerService, 0);
  objc_storeStrong((id *)&self->_visiblePingUUIDs, 0);
  objc_storeStrong((id *)&self->_pingDiscovery, 0);
  objc_storeStrong((id *)&self->_pingService, 0);
  objc_storeStrong((id *)&self->_bluetoothSessionSemaphore, 0);
  objc_storeStrong((id *)&self->_run_queue, 0);
  objc_storeStrong((id *)&self->_discoveredDevices, 0);
  objc_storeStrong((id *)&self->_deviceSessions, 0);
  objc_storeStrong((id *)&self->_pongingDevices, 0);
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_sharingInbound, 0);
}

- (void)initWithController:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_21469E000, a1, a3, "DEDSharingConnection initialized.", a5, a6, a7, a8, 0);
}

void __42__DEDSharingConnection_startPingDiscovery__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_9_0(&dword_21469E000, v0, v1, "Ping discovery deviceFound called for device [%@]", v2);
  OUTLINED_FUNCTION_1();
}

void __42__DEDSharingConnection_startPingDiscovery__block_invoke_35_cold_1()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_11_1();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x12u);
  OUTLINED_FUNCTION_1();
}

void __42__DEDSharingConnection_startPingDiscovery__block_invoke_40_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_21469E000, v0, v1, "Ping discovery activated with error [%@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_handleIncomingPingingDevice:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_9_0(&dword_21469E000, v0, v1, "Incoming ping discovery. Already tracking device [%@]", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_handleIncomingPingingDevice:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "visiblePingUUIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_9_0(&dword_21469E000, a2, v4, "Tracked DED ping devices %@", v5);

  OUTLINED_FUNCTION_1_2();
}

- (void)_handleIncomingPingingDevice:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_9_0(&dword_21469E000, v0, v1, "Incoming ping discovery. New device not valid, ignoring [%@]", v2);
  OUTLINED_FUNCTION_1();
}

void __54__DEDSharingConnection_startPongDiscoveryFromInbound___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_9_0(&dword_21469E000, v0, v1, "Pong discovery deviceFound called for device [%@]", v2);
  OUTLINED_FUNCTION_1();
}

void __54__DEDSharingConnection_startPongDiscoveryFromInbound___block_invoke_43_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_9_0(&dword_21469E000, v0, v1, "Pong discovery deviceChangedHandler called for device [%@]", v2);
  OUTLINED_FUNCTION_1();
}

void __54__DEDSharingConnection_startPongDiscoveryFromInbound___block_invoke_44_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_9_0(&dword_21469E000, v0, v1, "pongDiscovery.deviceLost: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_handleIncomingPongingDevice:fromInbound:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_9_0(&dword_21469E000, v0, v1, "Incoming pong discovery. Already tracking device [%@]", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_handleIncomingPongingDevice:fromInbound:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_9_0(&dword_21469E000, v0, v1, "Incoming pong discovery. New device is not valid, will ignore [%@]", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_handleIncomingPongingDevice:(void *)a1 fromInbound:(NSObject *)a2 .cold.3(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "pongingDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_9_0(&dword_21469E000, a2, v5, "Tracked DED pong devices %@", v6);

  OUTLINED_FUNCTION_4();
}

- (void)_handleIncomingPongingDevice:(void *)a1 fromInbound:.cold.4(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "needsSetup");
  objc_msgSend(a1, "systemPairState");
  OUTLINED_FUNCTION_1_8(&dword_21469E000, v2, v3, "---- setup? %@\t paired: %s", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)_handleIncomingPongingDevice:(void *)a1 fromInbound:.cold.5(void *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(a1, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_8(&dword_21469E000, v4, v5, "---- %@ \tmodel: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_4();
}

- (void)getSystemInfoForDevice:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_9_0(&dword_21469E000, a2, v4, "getSystemInfo activated (%@)", v5);

  OUTLINED_FUNCTION_1_2();
}

- (void)getSystemInfoForDevice:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_9_0(&dword_21469E000, a2, v4, "getSystemInfo queued (%@)", v5);

  OUTLINED_FUNCTION_1_2();
}

void __47__DEDSharingConnection_getSystemInfoForDevice___block_invoke_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_8_2();
  objc_msgSend(*(id *)(v0 + 40), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_1_8(&dword_21469E000, v2, v3, "getSystemInfo (%@) dict:%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

void __47__DEDSharingConnection_getSystemInfoForDevice___block_invoke_cold_2()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_8_2();
  objc_msgSend(*(id *)(v0 + 40), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_1_8(&dword_21469E000, v2, v3, "getSystemInfo (%@) error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

void __47__DEDSharingConnection_getSystemInfoForDevice___block_invoke_58_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_9_0(&dword_21469E000, a2, v4, "getSystemInfo (%@) timeout invalidation", v5);

  OUTLINED_FUNCTION_1_2();
}

- (void)checkReadinessForSFDevice:(void *)a1 session:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_9_0(&dword_21469E000, a2, v4, "checkReadiness (%@)", v5);

  OUTLINED_FUNCTION_1_2();
}

- (void)sharing_startPairSetupForDevice:(void *)a1 fromInbound:.cold.1(void *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(a1, "address");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_8(&dword_21469E000, v4, v5, "startPairSetup (%@) %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_4();
}

void __68__DEDSharingConnection_sharing_startPairSetupForDevice_fromInbound___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_9_0(&dword_21469E000, v0, v1, "--- error, retrying setup (error:%@)", v2);
  OUTLINED_FUNCTION_1();
}

void __68__DEDSharingConnection_sharing_startPairSetupForDevice_fromInbound___block_invoke_2_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_21469E000, a1, a3, "Session Pair completion", a5, a6, a7, a8, 0);
}

- (void)sharing_tryPIN:forDevice:fromInbound:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_21469E000, v0, v1, "no session for pin attempt for device [%{public}@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)sharing_startBugSessionWithIdentifier:(void *)a1 configuration:(NSObject *)a2 caller:target:fromInbound:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_9_0(&dword_21469E000, a2, v4, "startBugSessionWithIdentifier sending start_session to %@", v5);

  OUTLINED_FUNCTION_1_2();
}

void __85__DEDSharingConnection__configureService_withLabel_needsSetup_actionType_completion___block_invoke_2_cold_1()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_11_1();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __85__DEDSharingConnection__configureService_withLabel_needsSetup_actionType_completion___block_invoke_2_cold_2()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_11_1();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x20u);
}

- (void)_existingSharingSessionForDevice:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_9_0(&dword_21469E000, v0, v1, "Got sharingSession for device address: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)blockingSharingSessionForDevice:(void *)a1 fromInbound:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_9_0(&dword_21469E000, a2, v4, "blockingSharingSessionForDevice: %@", v5);

  OUTLINED_FUNCTION_1_2();
}

void __90__DEDSharingConnection_createSharingSessionForSFDevice_holdForPIN_fromInbound_completion___block_invoke_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_8_2();
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(v0), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_8(&dword_21469E000, v2, v3, "SFSession (%@) Error %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

void __90__DEDSharingConnection_createSharingSessionForSFDevice_holdForPIN_fromInbound_completion___block_invoke_87_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  objc_msgSend((id)OUTLINED_FUNCTION_12_0(a1), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_9_0(&dword_21469E000, a2, v4, "SFSession (%@) Interrupted.", v5);

  OUTLINED_FUNCTION_1_2();
}

void __90__DEDSharingConnection_createSharingSessionForSFDevice_holdForPIN_fromInbound_completion___block_invoke_88_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  objc_msgSend((id)OUTLINED_FUNCTION_12_0(a1), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_9_0(&dword_21469E000, a2, v4, "SFSession (%@) Invalidated", v5);

  OUTLINED_FUNCTION_1_2();
}

void __90__DEDSharingConnection_createSharingSessionForSFDevice_holdForPIN_fromInbound_completion___block_invoke_3_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_8_2();
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(v0), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_1_8(&dword_21469E000, v2, v3, "SFSession activate failed for device (%@) (Error %@).", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

void __90__DEDSharingConnection_createSharingSessionForSFDevice_holdForPIN_fromInbound_completion___block_invoke_3_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  OUTLINED_FUNCTION_8_2();
  v3 = v2;
  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8) + 40), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v3 + 32), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412802;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  v10 = 2112;
  v11 = v1;
  _os_log_debug_impl(&dword_21469E000, v0, OS_LOG_TYPE_DEBUG, "SFSession %@ Activated for device (%@) (Error %@).", (uint8_t *)&v6, 0x20u);

}

@end
