@implementation ACCMediaLibraryProvider

- (ACCMediaLibraryProvider)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  ACCMediaLibraryProvider *v8;
  void *v9;
  uint64_t v10;
  NSString *providerUID;
  NSObject *v12;
  id v13;
  id WeakRetained;
  NSString *v15;
  NSXPCConnection *serverConnection;
  ACCMediaLibraryXPCServerProtocol *remoteObject;
  NSMutableDictionary *v18;
  NSMutableDictionary *accessories;
  NSMutableDictionary *v20;
  NSMutableDictionary *libraries;
  dispatch_queue_t v22;
  OS_dispatch_queue *processingQueue;
  _QWORD v25[4];
  id v26;
  objc_super v27;
  _BYTE buf[12];
  __int16 v29;
  NSString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  init_logging();
  v27.receiver = self;
  v27.super_class = (Class)ACCMediaLibraryProvider;
  v8 = -[ACCMediaLibraryProvider init](&v27, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = objc_claimAutoreleasedReturnValue();
    providerUID = v8->_providerUID;
    v8->_providerUID = (NSString *)v10;

    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeWeak((id *)&v8->_delegateQ, v7);
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v12 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      v12 = MEMORY[0x24BDACB70];
      v13 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      WeakRetained = objc_loadWeakRetained((id *)&v8->_delegate);
      v15 = v8->_providerUID;
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = WeakRetained;
      v29 = 2112;
      v30 = v15;
      _os_log_impl(&dword_21A4E8000, v12, OS_LOG_TYPE_DEFAULT, "initWithDelegate: delegate=%@ providerUID=%@", buf, 0x16u);

    }
    serverConnection = v8->_serverConnection;
    v8->_serverConnection = 0;

    remoteObject = v8->_remoteObject;
    v8->_remoteObject = 0;

    v8->_lastUpdateType = 5;
    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    accessories = v8->_accessories;
    v8->_accessories = v18;

    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    libraries = v8->_libraries;
    v8->_libraries = v20;

    v22 = dispatch_queue_create("com.apple.acc.mediaLibrary.provider", 0);
    processingQueue = v8->_processingQueue;
    v8->_processingQueue = (OS_dispatch_queue *)v22;

    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, v8);
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __50__ACCMediaLibraryProvider_initWithDelegate_queue___block_invoke;
    v25[3] = &unk_24DCCDD00;
    objc_copyWeak(&v26, (id *)buf);
    accessoryServer_registerAvailabilityChangedHandler("com.apple.accessories.medialibrary.availability-changed", v25);
    -[ACCMediaLibraryProvider connectToServer](v8, "connectToServer");
    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
  }

  return v8;
}

void __50__ACCMediaLibraryProvider_initWithDelegate_queue___block_invoke(uint64_t a1, int a2)
{
  BOOL v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  id WeakRetained;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v4 = gNumLogObjects < 1;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = a2;
    _os_log_impl(&dword_21A4E8000, v6, OS_LOG_TYPE_DEFAULT, "Server availability changed! State: %d", (uint8_t *)v10, 8u);
  }

  if (a2)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      v7 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_21A4E8000, v7, OS_LOG_TYPE_DEFAULT, "Trying to connect to server...", (uint8_t *)v10, 2u);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "connectToServer");

  }
}

- (void)dealloc
{
  BOOL v3;
  id v4;
  NSObject *v5;
  id WeakRetained;
  NSString *providerUID;
  OS_dispatch_queue *processingQueue;
  NSXPCConnection *serverConnection;
  ACCMediaLibraryXPCServerProtocol *remoteObject;
  NSMutableDictionary *accessories;
  NSMutableDictionary *libraries;
  NSString *v13;
  void *v14;
  objc_super v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  NSString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    providerUID = self->_providerUID;
    *(_DWORD *)buf = 138412546;
    v17 = WeakRetained;
    v18 = 2112;
    v19 = providerUID;
    _os_log_impl(&dword_21A4E8000, v5, OS_LOG_TYPE_DEFAULT, "dealloc: delegate=%@ providerUID=%@", buf, 0x16u);

  }
  accessoryServer_unregisterAvailabilityChangedHandler();
  dispatch_sync((dispatch_queue_t)self->_processingQueue, &__block_literal_global);
  processingQueue = self->_processingQueue;
  self->_processingQueue = 0;

  serverConnection = self->_serverConnection;
  self->_serverConnection = 0;

  remoteObject = self->_remoteObject;
  self->_remoteObject = 0;

  accessories = self->_accessories;
  self->_accessories = 0;

  libraries = self->_libraries;
  self->_libraries = 0;

  v13 = self->_providerUID;
  self->_providerUID = 0;

  objc_storeWeak((id *)&self->_delegate, 0);
  objc_storeWeak((id *)&self->_delegateQ, 0);
  -[ACCMediaLibraryProvider serverConnection](self, "serverConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "invalidate");

  v15.receiver = self;
  v15.super_class = (Class)ACCMediaLibraryProvider;
  -[ACCMediaLibraryProvider dealloc](&v15, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<ACCMediaLibraryProvider>[%@]"), self->_providerUID);
}

- (void)connectToServer
{
  ACCMediaLibraryProvider *v2;
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[8];

  v2 = self;
  objc_sync_enter(v2);
  if (accessoryServer_isServerAvailable())
  {
    -[ACCMediaLibraryProvider serverConnection](v2, "serverConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v4 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
        v4 = MEMORY[0x24BDACB70];
        v5 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21A4E8000, v4, OS_LOG_TYPE_DEFAULT, "Connecting to XPC server...", buf, 2u);
      }

      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.accessories.medialibrary"), 4096);
      -[ACCMediaLibraryProvider setServerConnection:](v2, "setServerConnection:", v6);

      objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2550E87C0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACCMediaLibraryProvider serverConnection](v2, "serverConnection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setRemoteObjectInterface:", v7);

      objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2550E8820);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACCMediaLibraryProvider serverConnection](v2, "serverConnection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setExportedInterface:", v9);

      -[ACCMediaLibraryProvider serverConnection](v2, "serverConnection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setExportedObject:", v2);

      *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, v2);
      v12 = MEMORY[0x24BDAC760];
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __42__ACCMediaLibraryProvider_connectToServer__block_invoke;
      v26[3] = &unk_24DCCDD68;
      objc_copyWeak(&v27, (id *)buf);
      -[ACCMediaLibraryProvider serverConnection](v2, "serverConnection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setInvalidationHandler:", v26);

      v24[0] = v12;
      v24[1] = 3221225472;
      v24[2] = __42__ACCMediaLibraryProvider_connectToServer__block_invoke_101;
      v24[3] = &unk_24DCCDD68;
      objc_copyWeak(&v25, (id *)buf);
      -[ACCMediaLibraryProvider serverConnection](v2, "serverConnection");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setInterruptionHandler:", v24);

      -[ACCMediaLibraryProvider serverConnection](v2, "serverConnection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "resume");

      objc_destroyWeak(&v25);
      objc_destroyWeak(&v27);
      objc_destroyWeak((id *)buf);
    }
    -[ACCMediaLibraryProvider remoteObject](v2, "remoteObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v17 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
        v17 = MEMORY[0x24BDACB70];
        v18 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21A4E8000, v17, OS_LOG_TYPE_DEFAULT, "Getting remote object...", buf, 2u);
      }

      -[ACCMediaLibraryProvider serverConnection](v2, "serverConnection");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_105);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACCMediaLibraryProvider setRemoteObject:](v2, "setRemoteObject:", v20);

      *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, v2);
      -[ACCMediaLibraryProvider remoteObject](v2, "remoteObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __42__ACCMediaLibraryProvider_connectToServer__block_invoke_106;
      v22[3] = &unk_24DCCDDF8;
      objc_copyWeak(&v23, (id *)buf);
      v22[4] = v2;
      objc_msgSend(v21, "initConnection:", v22);

      objc_destroyWeak(&v23);
      objc_destroyWeak((id *)buf);
    }
  }
  objc_sync_exit(v2);

}

void __42__ACCMediaLibraryProvider_connectToServer__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  uint8_t v9[16];

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "serverConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInvalidationHandler:", 0);

  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "setRemoteObject:", 0);

  v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "setServerConnection:", 0);

  accessoryServer_serverIsUnreachable();
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v6 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_21A4E8000, v6, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated!", v9, 2u);
  }

  v8 = objc_loadWeakRetained(v1);
  objc_msgSend(v8, "accessoryMediaLibraryAllDetached");

}

void __42__ACCMediaLibraryProvider_connectToServer__block_invoke_101(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  uint8_t buf[16];

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setRemoteObject:", 0);

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "serverConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "setServerConnection:", 0);

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v6 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21A4E8000, v6, OS_LOG_TYPE_DEFAULT, "XPC connection interrupted!", buf, 2u);
  }

  v8 = objc_loadWeakRetained(v1);
  objc_msgSend(v8, "processingQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__ACCMediaLibraryProvider_connectToServer__block_invoke_102;
  block[3] = &unk_24DCCDD68;
  objc_copyWeak(&v11, v1);
  dispatch_async(v9, block);

  objc_destroyWeak(&v11);
}

void __42__ACCMediaLibraryProvider_connectToServer__block_invoke_102(uint64_t a1)
{
  BOOL v2;
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  id v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v2 = gNumLogObjects < 1;
  else
    v2 = 1;
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v4 = MEMORY[0x24BDACB70];
    v3 = MEMORY[0x24BDACB70];
  }
  else
  {
    v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "providerUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_21A4E8000, v4, OS_LOG_TYPE_DEFAULT, "XPC connection interupted: providerUID:%@, notify of detach", (uint8_t *)&v8, 0xCu);

  }
  v7 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v7, "accessoryMediaLibraryAllDetached");

}

void __42__ACCMediaLibraryProvider_connectToServer__block_invoke_103(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_21A4E8000, v5, OS_LOG_TYPE_DEFAULT, "XPC connection error!", (uint8_t *)&v8, 2u);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v6 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v2;
    _os_log_impl(&dword_21A4E8000, v6, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v8, 0xCu);
  }

}

void __42__ACCMediaLibraryProvider_connectToServer__block_invoke_106(uint64_t a1, int a2)
{
  BOOL v4;
  id v5;
  NSObject *v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  void *v10;
  _QWORD block[5];
  uint8_t buf[4];
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v4 = gNumLogObjects < 1;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v13 = a2;
    _os_log_impl(&dword_21A4E8000, v6, OS_LOG_TYPE_DEFAULT, "shouldStayConnected: %d", buf, 8u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "processingQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __42__ACCMediaLibraryProvider_connectToServer__block_invoke_107;
    block[3] = &unk_24DCCDDD0;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(v9, block);

  }
  else
  {
    objc_msgSend(WeakRetained, "serverConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "invalidate");

  }
}

uint64_t __42__ACCMediaLibraryProvider_connectToServer__block_invoke_107(uint64_t a1)
{
  BOOL v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v2 = gNumLogObjects < 1;
  else
    v2 = 1;
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v4 = MEMORY[0x24BDACB70];
    v3 = MEMORY[0x24BDACB70];
  }
  else
  {
    v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_21A4E8000, v4, OS_LOG_TYPE_DEFAULT, "notifyRemoteOfAvailableLibraries: providerUID:%@", (uint8_t *)&v7, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_notifyRemoteOfAvailableLibraries");
}

- (void)accessoryMediaLibraryAttached:(id)a3 windowPerLibrary:(unsigned int)a4
{
  id v6;
  NSObject *processingQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unsigned int v11;

  v6 = a3;
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__ACCMediaLibraryProvider_accessoryMediaLibraryAttached_windowPerLibrary___block_invoke;
  block[3] = &unk_24DCCDE20;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(processingQueue, block);

}

void __74__ACCMediaLibraryProvider_accessoryMediaLibraryAttached_windowPerLibrary___block_invoke(uint64_t a1)
{
  uint64_t v2;
  ACCMediaLibraryAccessory *v3;
  BOOL v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  _QWORD block[5];
  ACCMediaLibraryAccessory *v25;
  int v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  ACCMediaLibraryAccessory *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (ACCMediaLibraryAccessory *)v2;
    if (gLogObjects)
      v4 = gNumLogObjects < 1;
    else
      v4 = 1;
    if (v4)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      v11 = MEMORY[0x24BDACB70];
      v5 = MEMORY[0x24BDACB70];
    }
    else
    {
      v11 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v28 = v12;
      v29 = 2112;
      v30 = v3;
      _os_log_impl(&dword_21A4E8000, v11, OS_LOG_TYPE_INFO, "accessoryMediaLibraryAttached: accessory %@ (%@) already exists!", buf, 0x16u);
    }

  }
  else
  {
    v3 = -[ACCMediaLibraryAccessory initWithUID:windowPerLibrary:provider:]([ACCMediaLibraryAccessory alloc], "initWithUID:windowPerLibrary:provider:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setObject:forKey:", v3, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6
      && (v7 = (void *)v6,
          objc_msgSend(*(id *)(a1 + 32), "delegate"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_opt_respondsToSelector(),
          v8,
          v7,
          (v9 & 1) != 0))
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v10 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
        v10 = MEMORY[0x24BDACB70];
        v17 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v18 = *(_QWORD *)(a1 + 40);
        v19 = *(_DWORD *)(a1 + 48);
        *(_DWORD *)buf = 138412802;
        v28 = v18;
        v29 = 2112;
        v30 = v3;
        v31 = 1024;
        LODWORD(v32) = v19;
        _os_log_impl(&dword_21A4E8000, v10, OS_LOG_TYPE_INFO, "accessoryMediaLibraryAttached: accessory %@, accessory=%@, Call delegate accessoryArrived:windowPerLibrary:, windowPerLibrary=%u", buf, 0x1Cu);
      }

      objc_msgSend(*(id *)(a1 + 32), "delegateQ");
      v20 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __74__ACCMediaLibraryProvider_accessoryMediaLibraryAttached_windowPerLibrary___block_invoke_111;
      block[3] = &unk_24DCCDE20;
      block[4] = *(_QWORD *)(a1 + 32);
      v25 = v3;
      v26 = *(_DWORD *)(a1 + 48);
      dispatch_async(v20, block);

    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v13 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
        v13 = MEMORY[0x24BDACB70];
        v14 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v15 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "delegate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v28 = v15;
        v29 = 2112;
        v30 = v3;
        v31 = 2112;
        v32 = v16;
        _os_log_impl(&dword_21A4E8000, v13, OS_LOG_TYPE_INFO, "accessoryMediaLibraryAttached: accessory %@ (%@) delegate does not respond to selector %@", buf, 0x20u);

      }
    }
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v21 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      v21 = MEMORY[0x24BDACB70];
      v22 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v23 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
      *(_DWORD *)buf = 138412290;
      v28 = v23;
      _os_log_impl(&dword_21A4E8000, v21, OS_LOG_TYPE_DEFAULT, "Call notifyRemoteOfAvailableLibraries, providerUID:%@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_notifyRemoteOfAvailableLibraries");
  }

}

void __74__ACCMediaLibraryProvider_accessoryMediaLibraryAttached_windowPerLibrary___block_invoke_111(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaLibrary:accessoryArrived:windowPerLibrary:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48));

}

- (void)accessoryMediaLibraryDetached:(id)a3
{
  id v4;
  NSObject *processingQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  processingQueue = self->_processingQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__ACCMediaLibraryProvider_accessoryMediaLibraryDetached___block_invoke;
  v7[3] = &unk_24DCCDC90;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(processingQueue, v7);

}

void __57__ACCMediaLibraryProvider_accessoryMediaLibraryDetached___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  BOOL v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  uint64_t v25;
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (gLogObjects)
    v4 = gNumLogObjects <= 0;
  else
    v4 = 1;
  v5 = !v4;
  if (v2)
  {
    if (v5)
    {
      v6 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      v6 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v28 = v9;
      v29 = 2112;
      v30 = v3;
      _os_log_impl(&dword_21A4E8000, v6, OS_LOG_TYPE_INFO, "accessoryMediaLibraryDetached: accessory %@, accessory=%@, Call delegate accessoryLeft:", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10
      && (v11 = (void *)v10,
          objc_msgSend(*(id *)(a1 + 32), "delegate"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_opt_respondsToSelector(),
          v12,
          v11,
          (v13 & 1) != 0))
    {
      objc_msgSend(*(id *)(a1 + 32), "delegateQ");
      v14 = objc_claimAutoreleasedReturnValue();
      v21 = MEMORY[0x24BDAC760];
      v22 = 3221225472;
      v23 = __57__ACCMediaLibraryProvider_accessoryMediaLibraryDetached___block_invoke_114;
      v24 = &unk_24DCCDC90;
      v25 = *(_QWORD *)(a1 + 32);
      v26 = v3;
      dispatch_async(v14, &v21);

    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v15 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
        v15 = MEMORY[0x24BDACB70];
        v16 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v17 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "delegate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v28 = v17;
        v29 = 2112;
        v30 = v3;
        v31 = 2112;
        v32 = v18;
        _os_log_impl(&dword_21A4E8000, v15, OS_LOG_TYPE_INFO, "accessoryMediaLibraryDetached: accessory %@ (%@) delegate does not respond to selector %@", buf, 0x20u);

      }
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeObjectForKey:", *(_QWORD *)(a1 + 40), v21, v22, v23, v24, v25);
  }
  else
  {
    if (v5)
    {
      v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      v7 = MEMORY[0x24BDACB70];
      v19 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v20 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v28 = v20;
      v29 = 2112;
      v30 = 0;
      _os_log_impl(&dword_21A4E8000, v7, OS_LOG_TYPE_INFO, "accessoryMediaLibraryDetached: accessory %@ (%@) does not exist!", buf, 0x16u);
    }

  }
}

void __57__ACCMediaLibraryProvider_accessoryMediaLibraryDetached___block_invoke_114(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaLibrary:accessoryLeft:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)accessoryMediaLibraryAllDetached
{
  NSObject *processingQueue;
  _QWORD block[5];

  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__ACCMediaLibraryProvider_accessoryMediaLibraryAllDetached__block_invoke;
  block[3] = &unk_24DCCDDD0;
  block[4] = self;
  dispatch_async(processingQueue, block);
}

void __59__ACCMediaLibraryProvider_accessoryMediaLibraryAllDetached__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  int v9;
  BOOL v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  uint64_t v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  id obj;
  _QWORD block[6];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v31;
    v5 = MEMORY[0x24BDACB70];
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v31 != v4)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        v8 = gLogObjects;
        v9 = gNumLogObjects;
        if (gLogObjects)
          v10 = gNumLogObjects < 1;
        else
          v10 = 1;
        if (v10)
        {
          if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            v35 = v8;
            v36 = 1024;
            LODWORD(v37) = v9;
            _os_log_error_impl(&dword_21A4E8000, v5, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          v11 = v5;
          v12 = v5;
        }
        else
        {
          v12 = *(id *)gLogObjects;
        }
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v7;
          _os_log_impl(&dword_21A4E8000, v12, OS_LOG_TYPE_INFO, "accessoryMediaLibraryAllDetached: accessory %@, Call delegate accessoryLeft:", buf, 0xCu);
        }

        objc_msgSend(*(id *)(a1 + 32), "delegate");
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13
          && (v14 = (void *)v13,
              objc_msgSend(*(id *)(a1 + 32), "delegate"),
              v15 = (void *)objc_claimAutoreleasedReturnValue(),
              v16 = objc_opt_respondsToSelector(),
              v15,
              v14,
              (v16 & 1) != 0))
        {
          objc_msgSend(*(id *)(a1 + 32), "delegateQ");
          v17 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __59__ACCMediaLibraryProvider_accessoryMediaLibraryAllDetached__block_invoke_115;
          block[3] = &unk_24DCCDC90;
          block[4] = *(_QWORD *)(a1 + 32);
          block[5] = v7;
          dispatch_async(v17, block);

        }
        else
        {
          v18 = gLogObjects;
          v19 = gNumLogObjects;
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v20 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              v35 = v18;
              v36 = 1024;
              LODWORD(v37) = v19;
              _os_log_error_impl(&dword_21A4E8000, v5, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v21 = v5;
            v20 = v5;
          }
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(*(id *)(a1 + 32), "delegate");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v35 = v7;
            v36 = 2112;
            v37 = v22;
            _os_log_impl(&dword_21A4E8000, v20, OS_LOG_TYPE_INFO, "accessoryMediaLibraryAllDetached: accessory %@ delegate does not respond to selector %@", buf, 0x16u);

          }
        }
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v3);
  }

  v23 = *(_QWORD *)(a1 + 32);
  v24 = *(void **)(v23 + 56);
  *(_QWORD *)(v23 + 56) = 0;

  v25 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v26 = *(_QWORD *)(a1 + 32);
  v27 = *(void **)(v26 + 56);
  *(_QWORD *)(v26 + 56) = v25;

}

void __59__ACCMediaLibraryProvider_accessoryMediaLibraryAllDetached__block_invoke_115(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaLibrary:accessoryLeft:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)accessoryMediaLibraryUpdate:(id)a3 windowPerLibrary:(unsigned int)a4
{
  id v6;
  NSObject *processingQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unsigned int v11;

  v6 = a3;
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__ACCMediaLibraryProvider_accessoryMediaLibraryUpdate_windowPerLibrary___block_invoke;
  block[3] = &unk_24DCCDE20;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(processingQueue, block);

}

void __72__ACCMediaLibraryProvider_accessoryMediaLibraryUpdate_windowPerLibrary___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  BOOL v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  _QWORD block[5];
  id v22;
  int v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (gLogObjects)
    v4 = gNumLogObjects <= 0;
  else
    v4 = 1;
  v5 = !v4;
  if (!v2)
  {
    if (v5)
    {
      v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      v7 = MEMORY[0x24BDACB70];
      v19 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v20 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v25 = v20;
      v26 = 2112;
      v27 = 0;
      _os_log_impl(&dword_21A4E8000, v7, OS_LOG_TYPE_INFO, "accessoryMediaLibraryUpdate: accessory %@ (%@) does not exist!", buf, 0x16u);
    }
    goto LABEL_33;
  }
  if (v5)
  {
    v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v6 = MEMORY[0x24BDACB70];
    v8 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(_DWORD *)(a1 + 48);
    *(_DWORD *)buf = 138412802;
    v25 = v9;
    v26 = 2112;
    v27 = v3;
    v28 = 1024;
    LODWORD(v29) = v10;
    _os_log_impl(&dword_21A4E8000, v6, OS_LOG_TYPE_INFO, "accessoryMediaLibraryUpdate: accessory %@, accessory=%@, Call delegate accessoryUpdate:windowPerLibrary:, windowPerLibrary=%u", buf, 0x1Cu);
  }

  objc_msgSend(v3, "setWindowPerLibrary:", *(unsigned int *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11
    || (v12 = (void *)v11,
        objc_msgSend(*(id *)(a1 + 32), "delegate"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_opt_respondsToSelector(),
        v13,
        v12,
        (v14 & 1) == 0))
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      v7 = MEMORY[0x24BDACB70];
      v16 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v17 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v25 = v17;
      v26 = 2112;
      v27 = v3;
      v28 = 2112;
      v29 = v18;
      _os_log_impl(&dword_21A4E8000, v7, OS_LOG_TYPE_INFO, "accessoryMediaLibraryUpdate: accessory %@ (%@) delegate does not respond to selector %@", buf, 0x20u);

    }
LABEL_33:

    goto LABEL_34;
  }
  objc_msgSend(*(id *)(a1 + 32), "delegateQ");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__ACCMediaLibraryProvider_accessoryMediaLibraryUpdate_windowPerLibrary___block_invoke_118;
  block[3] = &unk_24DCCDE20;
  block[4] = *(_QWORD *)(a1 + 32);
  v22 = v3;
  v23 = *(_DWORD *)(a1 + 48);
  dispatch_async(v15, block);

LABEL_34:
}

void __72__ACCMediaLibraryProvider_accessoryMediaLibraryUpdate_windowPerLibrary___block_invoke_118(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaLibrary:accessoryUpdate:windowPerLibrary:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48));

}

- (void)startMediaLibraryUpdate:(id)a3 library:(id)a4 lastRevision:(id)a5 mediaItemProperties:(unint64_t)a6 playlistProperties:(unint64_t)a7 playlistContentStyle:(int)a8 playlistContentProperties:(unint64_t)a9 reqOptions:(unint64_t)a10
{
  id v16;
  id v17;
  id v18;
  NSObject *processingQueue;
  id v20;
  id v21;
  id v22;
  _QWORD block[5];
  id v24;
  id v25;
  id v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  int v31;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __169__ACCMediaLibraryProvider_startMediaLibraryUpdate_library_lastRevision_mediaItemProperties_playlistProperties_playlistContentStyle_playlistContentProperties_reqOptions___block_invoke;
  block[3] = &unk_24DCCDE70;
  block[4] = self;
  v24 = v16;
  v27 = a6;
  v28 = a7;
  v25 = v17;
  v26 = v18;
  v31 = a8;
  v29 = a9;
  v30 = a10;
  v20 = v18;
  v21 = v17;
  v22 = v16;
  dispatch_async(processingQueue, block);

}

void __169__ACCMediaLibraryProvider_startMediaLibraryUpdate_library_lastRevision_mediaItemProperties_playlistProperties_playlistContentStyle_playlistContentProperties_reqOptions___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  BOOL v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  int v23;
  void *v24;
  id v25;
  uint64_t v26;
  int v27;
  void *v28;
  id v29;
  uint64_t v30;
  int v31;
  void *v32;
  void *v33;
  int v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  BOOL v40;
  id v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  id v47;
  void *v48;
  const __CFString *v49;
  _QWORD block[5];
  id v51;
  id v52;
  id v53;
  id v54;
  uint8_t buf[4];
  uint64_t v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  id v64;
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  uint64_t v68;
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    goto LABEL_7;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_7;
  v4 = (void *)v3;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v8 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      v8 = MEMORY[0x24BDACB70];
      v14 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v15 = *(_QWORD *)(a1 + 40);
      v16 = *(void **)(a1 + 48);
      v17 = *(void **)(a1 + 72);
      v18 = *(_QWORD *)(a1 + 80);
      v20 = *(_QWORD *)(a1 + 56);
      v19 = *(_QWORD *)(a1 + 64);
      *(_DWORD *)buf = 138413826;
      v56 = v15;
      v57 = 2112;
      v58 = v16;
      v59 = 2112;
      v60 = v2;
      v61 = 2048;
      v62 = v19;
      v63 = 2048;
      v64 = v17;
      v65 = 2048;
      v66 = v18;
      v67 = 2112;
      v68 = v20;
      _os_log_impl(&dword_21A4E8000, v8, OS_LOG_TYPE_INFO, "startMediaLibraryUpdate: accessory %@, library %@, accessory=%@, fill in infoDictionary, mediaItemProperties=%llxh playlistProperties=%llxh playlistContentProperties=%llxh, lastRevision=%@", buf, 0x48u);
    }

    if (*(_QWORD *)(a1 + 64))
    {
      v21 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v22 = 0;
      v23 = 1;
      do
      {
        if ((*(_QWORD *)(a1 + 64) & v23) != 0)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v24);

        }
        v22 = (v22 + 1);
        v23 *= 2;
      }
      while ((_DWORD)v22 != 28);
      objc_msgSend(v7, "setObject:forKey:", v21, CFSTR("ACCMediaLibraryUpdateItemDictionary"));

    }
    if (*(_QWORD *)(a1 + 72))
    {
      v25 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v26 = 0;
      v27 = 1;
      do
      {
        if ((*(_QWORD *)(a1 + 72) & v27) != 0)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v26);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addObject:", v28);

        }
        v26 = (v26 + 1);
        v27 *= 2;
      }
      while ((_DWORD)v26 != 10);
      objc_msgSend(v7, "setObject:forKey:", v25, CFSTR("ACCMediaLibraryUpdatePlaylistDictionary"));

    }
    if (*(_QWORD *)(a1 + 80))
    {
      v29 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v30 = 0;
      v31 = 1;
      do
      {
        if ((*(_QWORD *)(a1 + 80) & v31) != 0)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v30);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addObject:", v32);

        }
        v30 = (v30 + 1);
        v31 *= 2;
      }
      while ((_DWORD)v30 != 28);
      objc_msgSend(v7, "setObject:forKey:", v29, CFSTR("ACCMediaLibraryUpdatePlaylistItemDictionary"));

    }
    if (*(_DWORD *)(a1 + 96))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v33, CFSTR("ACCMediaLibraryUpdatePlaylistContentStyle"));

    }
    if (*(_QWORD *)(a1 + 88))
    {
      v34 = 0;
      v49 = CFSTR("ACCMediaLibraryUpdatePlaylistItemDictionary");
      v35 = 1;
      do
      {
        if ((*(_QWORD *)(a1 + 88) & v35) != 0)
        {
          switch(v34)
          {
            case 0:
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = v7;
              v38 = v36;
              v39 = CFSTR("ACCMediaLibraryUpdateHidingRemoteItems");
LABEL_51:
              objc_msgSend(v37, "setObject:forKey:", v38, v39, v49);

              break;
            case 1:
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = v7;
              v38 = v36;
              v39 = CFSTR("ACCMediaLibraryUpdatePlayAllSongsCapable");
              goto LABEL_51;
            case 2:
              if (!*(_QWORD *)(a1 + 80))
              {
                v47 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "addObject:", v48);

                objc_msgSend(v7, "setObject:forKey:", v47, v49);
              }
              goto LABEL_53;
          }
        }
        ++v34;
        v35 *= 2;
      }
      while (v34 != 3);
    }
LABEL_53:
    if (gLogObjects)
      v40 = gNumLogObjects < 1;
    else
      v40 = 1;
    if (v40)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      v42 = MEMORY[0x24BDACB70];
      v41 = MEMORY[0x24BDACB70];
    }
    else
    {
      v42 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      v43 = *(_QWORD *)(a1 + 40);
      v44 = *(void **)(a1 + 48);
      v45 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138413314;
      v56 = v43;
      v57 = 2112;
      v58 = v44;
      v59 = 2112;
      v60 = v2;
      v61 = 2112;
      v62 = v45;
      v63 = 2112;
      v64 = v7;
      _os_log_impl(&dword_21A4E8000, v42, OS_LOG_TYPE_INFO, "startMediaLibraryUpdate: accessory %@, library %@, accessory=%@, Call delegate startUpdate:lastRevision:requestedInfo:, lastRevision=%@ infoDictionary=%@", buf, 0x34u);
    }

    objc_msgSend(*(id *)(a1 + 32), "delegateQ");
    v46 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __169__ACCMediaLibraryProvider_startMediaLibraryUpdate_library_lastRevision_mediaItemProperties_playlistProperties_playlistContentStyle_playlistContentProperties_reqOptions___block_invoke_123;
    block[3] = &unk_24DCCDE48;
    block[4] = *(_QWORD *)(a1 + 32);
    v51 = *(id *)(a1 + 48);
    v52 = *(id *)(a1 + 56);
    v53 = v7;
    v54 = v2;
    v11 = v7;
    dispatch_async(v46, block);

  }
  else
  {
LABEL_7:
    if (gLogObjects)
      v9 = gNumLogObjects < 1;
    else
      v9 = 1;
    if (v9)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      v11 = MEMORY[0x24BDACB70];
      v10 = MEMORY[0x24BDACB70];
    }
    else
    {
      v11 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v56 = v12;
      v57 = 2112;
      v58 = v2;
      v59 = 2112;
      v60 = v13;
      _os_log_impl(&dword_21A4E8000, v11, OS_LOG_TYPE_INFO, "startMediaLibraryUpdate: accessory %@ (%@) does not exist! or delegate does not respond to selector %@", buf, 0x20u);

    }
  }

}

void __169__ACCMediaLibraryProvider_startMediaLibraryUpdate_library_lastRevision_mediaItemProperties_playlistProperties_playlistContentStyle_playlistContentProperties_reqOptions___block_invoke_123(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaLibrary:startUpdate:lastRevision:requestedInfo:accessory:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

- (void)stopMediaLibraryUpdate:(id)a3 library:(id)a4
{
  id v6;
  id v7;
  NSObject *processingQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__ACCMediaLibraryProvider_stopMediaLibraryUpdate_library___block_invoke;
  block[3] = &unk_24DCCDC68;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(processingQueue, block);

}

void __58__ACCMediaLibraryProvider_stopMediaLibraryUpdate_library___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD block[5];
  id v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    goto LABEL_7;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_7;
  v4 = (void *)v3;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      v7 = MEMORY[0x24BDACB70];
      v13 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v14 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v20 = v14;
      v21 = 2112;
      v22 = v2;
      _os_log_impl(&dword_21A4E8000, v7, OS_LOG_TYPE_INFO, "stopMediaLibraryUpdate: accessory %@, accessory=%@, Call delegate stopUpdate:", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "delegateQ");
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __58__ACCMediaLibraryProvider_stopMediaLibraryUpdate_library___block_invoke_126;
    block[3] = &unk_24DCCDC68;
    block[4] = *(_QWORD *)(a1 + 32);
    v17 = *(id *)(a1 + 48);
    v18 = v2;
    dispatch_async(v15, block);

  }
  else
  {
LABEL_7:
    if (gLogObjects)
      v8 = gNumLogObjects < 1;
    else
      v8 = 1;
    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      v10 = MEMORY[0x24BDACB70];
      v9 = MEMORY[0x24BDACB70];
    }
    else
    {
      v10 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v20 = v11;
      v21 = 2112;
      v22 = v2;
      v23 = 2112;
      v24 = v12;
      _os_log_impl(&dword_21A4E8000, v10, OS_LOG_TYPE_INFO, "stopAllMediaLibraryUpdate: accessory %@ (%@) does not exist! or delegate does not respond to selector %@", buf, 0x20u);

    }
  }

}

void __58__ACCMediaLibraryProvider_stopMediaLibraryUpdate_library___block_invoke_126(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaLibrary:stopUpdate:accessory:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)stopAllMediaLibraryUpdate:(id)a3
{
  id v4;
  NSObject *processingQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  processingQueue = self->_processingQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__ACCMediaLibraryProvider_stopAllMediaLibraryUpdate___block_invoke;
  v7[3] = &unk_24DCCDC90;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(processingQueue, v7);

}

void __53__ACCMediaLibraryProvider_stopAllMediaLibraryUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    goto LABEL_7;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_7;
  v4 = (void *)v3;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      v7 = MEMORY[0x24BDACB70];
      v13 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v14 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v19 = v14;
      v20 = 2112;
      v21 = v2;
      _os_log_impl(&dword_21A4E8000, v7, OS_LOG_TYPE_INFO, "stopAllMediaLibraryUpdate: accessory %@, accessory=%@, Call delegate stopAllUpdate:", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "delegateQ");
    v15 = objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __53__ACCMediaLibraryProvider_stopAllMediaLibraryUpdate___block_invoke_129;
    v16[3] = &unk_24DCCDC90;
    v16[4] = *(_QWORD *)(a1 + 32);
    v17 = v2;
    dispatch_async(v15, v16);

  }
  else
  {
LABEL_7:
    if (gLogObjects)
      v8 = gNumLogObjects < 1;
    else
      v8 = 1;
    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      v10 = MEMORY[0x24BDACB70];
      v9 = MEMORY[0x24BDACB70];
    }
    else
    {
      v10 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v19 = v11;
      v20 = 2112;
      v21 = v2;
      v22 = 2112;
      v23 = v12;
      _os_log_impl(&dword_21A4E8000, v10, OS_LOG_TYPE_INFO, "stopAllMediaLibraryUpdate: accessory %@ (%@) does not exist! or delegate does not respond to selector %@", buf, 0x20u);

    }
  }

}

void __53__ACCMediaLibraryProvider_stopAllMediaLibraryUpdate___block_invoke_129(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaLibrary:stopAllUpdate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)confirmUpdate:(id)a3 library:(id)a4 lastRevision:(id)a5 updateCount:(unsigned int)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *processingQueue;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  unsigned int v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__ACCMediaLibraryProvider_confirmUpdate_library_lastRevision_updateCount___block_invoke;
  block[3] = &unk_24DCCDE98;
  block[4] = self;
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v21 = a6;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(processingQueue, block);

}

void __74__ACCMediaLibraryProvider_confirmUpdate_library_lastRevision_updateCount___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  NSObject *v10;
  BOOL v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  int v29;
  _QWORD block[5];
  id v31;
  id v32;
  id v33;
  int v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  NSObject *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "confirmUpdates:revision:count:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 64));
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5
      && (v6 = (void *)v5,
          objc_msgSend(*(id *)(a1 + 32), "delegate"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_opt_respondsToSelector(),
          v7,
          v6,
          (v8 & 1) != 0))
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v9 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
        v9 = MEMORY[0x24BDACB70];
        v17 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v26 = *(_QWORD *)(a1 + 40);
        v27 = *(void **)(a1 + 48);
        v28 = *(void **)(a1 + 56);
        v29 = *(_DWORD *)(a1 + 64);
        *(_DWORD *)buf = 138413314;
        v36 = v26;
        v37 = 2112;
        v38 = v27;
        v39 = 2112;
        v40 = v28;
        v41 = 1024;
        v42 = v29;
        v43 = 2112;
        v44 = v3;
        _os_log_debug_impl(&dword_21A4E8000, v9, OS_LOG_TYPE_DEBUG, "confirmUpdate: %@, library %@, lastRevision %@, updateCount %u, accessory=%@, Call delegate confirmUpdate", buf, 0x30u);
      }

      objc_msgSend(*(id *)(a1 + 32), "delegateQ");
      v18 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __74__ACCMediaLibraryProvider_confirmUpdate_library_lastRevision_updateCount___block_invoke_132;
      block[3] = &unk_24DCCDE98;
      block[4] = *(_QWORD *)(a1 + 32);
      v31 = *(id *)(a1 + 48);
      v32 = *(id *)(a1 + 56);
      v34 = *(_DWORD *)(a1 + 64);
      v33 = v3;
      dispatch_async(v18, block);

    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v10 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
        v10 = MEMORY[0x24BDACB70];
        v13 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v14 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "delegate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v36 = v14;
        v37 = 2112;
        v38 = v3;
        v39 = 2112;
        v40 = v15;
        _os_log_impl(&dword_21A4E8000, v10, OS_LOG_TYPE_INFO, "confirmUpdate: accessory %@ (%@), delegate does not respond to selector %@", buf, 0x20u);

      }
    }
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v19 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      v19 = MEMORY[0x24BDACB70];
      v20 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v21 = *(_QWORD *)(a1 + 40);
      v22 = *(void **)(a1 + 48);
      v23 = *(void **)(a1 + 56);
      v24 = *(_DWORD *)(a1 + 64);
      v25 = -[NSObject count](v4, "count");
      *(_DWORD *)buf = 138413826;
      v36 = v21;
      v37 = 2112;
      v38 = v22;
      v39 = 2112;
      v40 = v23;
      v41 = 1024;
      v42 = v24;
      v43 = 2112;
      v44 = v3;
      v45 = 2048;
      v46 = v25;
      v47 = 2112;
      v48 = v4;
      _os_log_debug_impl(&dword_21A4E8000, v19, OS_LOG_TYPE_DEBUG, "confirmUpdate: %@, library %@, lastRevision %@, updateCount %u, accessory=%@, removedList=(%lu)%@", buf, 0x44u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_checkPlaylistContentToSend:accessory:", *(_QWORD *)(a1 + 48), v3);
  }
  else
  {
    if (gLogObjects)
      v11 = gNumLogObjects < 1;
    else
      v11 = 1;
    if (v11)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      v4 = MEMORY[0x24BDACB70];
      v12 = MEMORY[0x24BDACB70];
    }
    else
    {
      v4 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v16 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v36 = v16;
      v37 = 2112;
      v38 = 0;
      _os_log_impl(&dword_21A4E8000, v4, OS_LOG_TYPE_INFO, "confirmUpdate: accessory %@ (%@) does not exist!", buf, 0x16u);
    }
  }

}

void __74__ACCMediaLibraryProvider_confirmUpdate_library_lastRevision_updateCount___block_invoke_132(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaLibrary:confirmUpdate:lastRevision:updateCount:accessory:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 56));

}

- (void)confirmPlaylistContentUpdate:(id)a3 library:(id)a4 lastRevision:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *processingQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  processingQueue = self->_processingQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __77__ACCMediaLibraryProvider_confirmPlaylistContentUpdate_library_lastRevision___block_invoke;
  v15[3] = &unk_24DCCDEC0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(processingQueue, v15);

}

void __77__ACCMediaLibraryProvider_confirmPlaylistContentUpdate_library_lastRevision___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  BOOL v8;
  id v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    if (gLogObjects)
      v10 = gNumLogObjects < 1;
    else
      v10 = 1;
    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      v12 = MEMORY[0x24BDACB70];
      v11 = MEMORY[0x24BDACB70];
    }
    else
    {
      v12 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v15 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v26 = v15;
      v27 = 2112;
      v28 = 0;
      _os_log_impl(&dword_21A4E8000, v12, OS_LOG_TYPE_INFO, "confirmPlaylistContentUpdate: accessory %@ (%@) does not exist!", buf, 0x16u);
    }
    goto LABEL_27;
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3
    || (v4 = (void *)v3,
        objc_msgSend(*(id *)(a1 + 32), "delegate"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_opt_respondsToSelector(),
        v5,
        v4,
        (v6 & 1) == 0))
  {
    if (gLogObjects)
      v8 = gNumLogObjects < 1;
    else
      v8 = 1;
    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      v12 = MEMORY[0x24BDACB70];
      v9 = MEMORY[0x24BDACB70];
    }
    else
    {
      v12 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v26 = v13;
      v27 = 2112;
      v28 = v2;
      v29 = 2112;
      v30 = v14;
      _os_log_impl(&dword_21A4E8000, v12, OS_LOG_TYPE_INFO, "confirmPlaylistContentUpdate: accessory %@ (%@), delegate does not respond to selector %@", buf, 0x20u);

    }
LABEL_27:

    goto LABEL_28;
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v7 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v7 = MEMORY[0x24BDACB70];
    v16 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v18 = *(_QWORD *)(a1 + 40);
    v19 = *(void **)(a1 + 48);
    v20 = *(void **)(a1 + 56);
    *(_DWORD *)buf = 138413058;
    v26 = v18;
    v27 = 2112;
    v28 = v19;
    v29 = 2112;
    v30 = v20;
    v31 = 2112;
    v32 = v2;
    _os_log_debug_impl(&dword_21A4E8000, v7, OS_LOG_TYPE_DEBUG, "confirmPlaylistContentUpdate: %@, library %@, lastRevision %@, accessory=%@, Call delegate confirmPlaylistContentUpdate:", buf, 0x2Au);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegateQ");
  v17 = objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __77__ACCMediaLibraryProvider_confirmPlaylistContentUpdate_library_lastRevision___block_invoke_133;
  v21[3] = &unk_24DCCDEC0;
  v21[4] = *(_QWORD *)(a1 + 32);
  v22 = *(id *)(a1 + 48);
  v23 = *(id *)(a1 + 56);
  v24 = v2;
  dispatch_async(v17, v21);

LABEL_28:
}

void __77__ACCMediaLibraryProvider_confirmPlaylistContentUpdate_library_lastRevision___block_invoke_133(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaLibrary:confirmPlaylistContentUpdate:lastRevision:accessory:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)playCurrentSelection:(id)a3 library:(id)a4
{
  id v6;
  id v7;
  NSObject *processingQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__ACCMediaLibraryProvider_playCurrentSelection_library___block_invoke;
  block[3] = &unk_24DCCDC68;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(processingQueue, block);

}

void __56__ACCMediaLibraryProvider_playCurrentSelection_library___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  _QWORD block[5];
  id v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    goto LABEL_7;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_7;
  v4 = (void *)v3;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      v7 = MEMORY[0x24BDACB70];
      v13 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v14 = *(_QWORD *)(a1 + 40);
      v15 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      v21 = v14;
      v22 = 2112;
      v23 = v15;
      v24 = 2112;
      v25 = v2;
      _os_log_impl(&dword_21A4E8000, v7, OS_LOG_TYPE_INFO, "playCurrentSelection: %@, library %@, accessory=%@, Call delegate playCurrentSelection:", buf, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 32), "delegateQ");
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __56__ACCMediaLibraryProvider_playCurrentSelection_library___block_invoke_136;
    block[3] = &unk_24DCCDC68;
    block[4] = *(_QWORD *)(a1 + 32);
    v18 = *(id *)(a1 + 48);
    v19 = v2;
    dispatch_async(v16, block);

  }
  else
  {
LABEL_7:
    if (gLogObjects)
      v8 = gNumLogObjects < 1;
    else
      v8 = 1;
    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      v10 = MEMORY[0x24BDACB70];
      v9 = MEMORY[0x24BDACB70];
    }
    else
    {
      v10 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v21 = v11;
      v22 = 2112;
      v23 = v2;
      v24 = 2112;
      v25 = v12;
      _os_log_impl(&dword_21A4E8000, v10, OS_LOG_TYPE_INFO, "playCurrentSelection: accessory %@ (%@) does not exist! or delegate does not respond to selector %@", buf, 0x20u);

    }
  }

}

void __56__ACCMediaLibraryProvider_playCurrentSelection_library___block_invoke_136(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaLibrary:playCurrentSelection:accessory:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)playItems:(id)a3 library:(id)a4 itemList:(id)a5 startIndex:(unsigned int)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *processingQueue;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  unsigned int v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__ACCMediaLibraryProvider_playItems_library_itemList_startIndex___block_invoke;
  block[3] = &unk_24DCCDE98;
  block[4] = self;
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v21 = a6;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(processingQueue, block);

}

void __65__ACCMediaLibraryProvider_playItems_library_itemList_startIndex___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  int v17;
  NSObject *v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  int v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    goto LABEL_7;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_7;
  v4 = (void *)v3;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      v7 = MEMORY[0x24BDACB70];
      v13 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v14 = *(_QWORD *)(a1 + 40);
      v15 = *(void **)(a1 + 48);
      v16 = objc_msgSend(*(id *)(a1 + 56), "count");
      v17 = *(_DWORD *)(a1 + 64);
      *(_DWORD *)buf = 138413314;
      v25 = v14;
      v26 = 2112;
      v27 = v15;
      v28 = 2112;
      v29 = v2;
      v30 = 2048;
      v31 = v16;
      v32 = 1024;
      v33 = v17;
      _os_log_impl(&dword_21A4E8000, v7, OS_LOG_TYPE_INFO, "playItems: %@, library %@, accessory=%@, Call delegate play:itemList:firstItemIndex:, itemList.count=%lu startIndex=%u", buf, 0x30u);
    }

    objc_msgSend(*(id *)(a1 + 32), "delegateQ");
    v18 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __65__ACCMediaLibraryProvider_playItems_library_itemList_startIndex___block_invoke_139;
    block[3] = &unk_24DCCDE98;
    block[4] = *(_QWORD *)(a1 + 32);
    v20 = *(id *)(a1 + 48);
    v21 = *(id *)(a1 + 56);
    v23 = *(_DWORD *)(a1 + 64);
    v22 = v2;
    dispatch_async(v18, block);

  }
  else
  {
LABEL_7:
    if (gLogObjects)
      v8 = gNumLogObjects < 1;
    else
      v8 = 1;
    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      v10 = MEMORY[0x24BDACB70];
      v9 = MEMORY[0x24BDACB70];
    }
    else
    {
      v10 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v25 = v11;
      v26 = 2112;
      v27 = v2;
      v28 = 2112;
      v29 = v12;
      _os_log_impl(&dword_21A4E8000, v10, OS_LOG_TYPE_INFO, "playItems: accessory %@ (%@) does not exist! or delegate does not respond to selector %@", buf, 0x20u);

    }
  }

}

void __65__ACCMediaLibraryProvider_playItems_library_itemList_startIndex___block_invoke_139(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaLibrary:play:itemList:firstItemIndex:accessory:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 56));

}

- (void)playCollection:(id)a3 library:(id)a4 collection:(unint64_t)a5 type:(int)a6 startItem:(unint64_t)a7
{
  id v12;
  id v13;
  NSObject *processingQueue;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  unint64_t v20;
  unint64_t v21;
  int v22;

  v12 = a3;
  v13 = a4;
  processingQueue = self->_processingQueue;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __76__ACCMediaLibraryProvider_playCollection_library_collection_type_startItem___block_invoke;
  v17[3] = &unk_24DCCDEE8;
  v17[4] = self;
  v18 = v12;
  v19 = v13;
  v20 = a5;
  v22 = a6;
  v21 = a7;
  v15 = v13;
  v16 = v12;
  dispatch_async(processingQueue, v17);

}

void __76__ACCMediaLibraryProvider_playCollection_library_collection_type_startItem___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  __int128 v23;
  int v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  int v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    goto LABEL_7;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_7;
  v4 = (void *)v3;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      v7 = MEMORY[0x24BDACB70];
      v13 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v14 = *(_QWORD *)(a1 + 40);
      v15 = *(void **)(a1 + 48);
      v16 = *(_DWORD *)(a1 + 72);
      v17 = *(_QWORD *)(a1 + 56);
      v18 = *(_QWORD *)(a1 + 64);
      *(_DWORD *)buf = 138413570;
      v26 = v14;
      v27 = 2112;
      v28 = v15;
      v29 = 2112;
      v30 = v2;
      v31 = 2048;
      v32 = v17;
      v33 = 1024;
      v34 = v16;
      v35 = 2048;
      v36 = v18;
      _os_log_impl(&dword_21A4E8000, v7, OS_LOG_TYPE_INFO, "playCollection: %@, library %@, accessory=%@, Call delegate play:collection:type:firstItemPersistentID:, collection=%llu type=%u startItem=%llu", buf, 0x3Au);
    }

    objc_msgSend(*(id *)(a1 + 32), "delegateQ");
    v19 = objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __76__ACCMediaLibraryProvider_playCollection_library_collection_type_startItem___block_invoke_142;
    v20[3] = &unk_24DCCDEE8;
    v20[4] = *(_QWORD *)(a1 + 32);
    v21 = *(id *)(a1 + 48);
    v24 = *(_DWORD *)(a1 + 72);
    v23 = *(_OWORD *)(a1 + 56);
    v22 = v2;
    dispatch_async(v19, v20);

  }
  else
  {
LABEL_7:
    if (gLogObjects)
      v8 = gNumLogObjects < 1;
    else
      v8 = 1;
    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      v10 = MEMORY[0x24BDACB70];
      v9 = MEMORY[0x24BDACB70];
    }
    else
    {
      v10 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v26 = v11;
      v27 = 2112;
      v28 = v2;
      v29 = 2112;
      v30 = v12;
      _os_log_impl(&dword_21A4E8000, v10, OS_LOG_TYPE_INFO, "playCollection: accessory %@ (%@) does not exist! or delegate does not respond to selector %@", buf, 0x20u);

    }
  }

}

void __76__ACCMediaLibraryProvider_playCollection_library_collection_type_startItem___block_invoke_142(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaLibrary:play:collection:type:firstItemPersistentID:accessory:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 72), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));

}

- (void)playCollection:(id)a3 library:(id)a4 collection:(unint64_t)a5 type:(int)a6 startIndex:(unsigned int)a7
{
  id v12;
  id v13;
  NSObject *processingQueue;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  unint64_t v20;
  int v21;
  unsigned int v22;

  v12 = a3;
  v13 = a4;
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__ACCMediaLibraryProvider_playCollection_library_collection_type_startIndex___block_invoke;
  block[3] = &unk_24DCCDF10;
  block[4] = self;
  v18 = v12;
  v19 = v13;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v15 = v13;
  v16 = v12;
  dispatch_async(processingQueue, block);

}

void __77__ACCMediaLibraryProvider_playCollection_library_collection_type_startIndex___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  int v17;
  int v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  _QWORD block[5];
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  int v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    goto LABEL_7;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_7;
  v4 = (void *)v3;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      v7 = MEMORY[0x24BDACB70];
      v13 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v14 = *(_QWORD *)(a1 + 40);
      v15 = *(void **)(a1 + 48);
      v16 = *(_QWORD *)(a1 + 56);
      v17 = *(_DWORD *)(a1 + 64);
      v18 = *(_DWORD *)(a1 + 68);
      *(_DWORD *)buf = 138413570;
      v28 = v14;
      v29 = 2112;
      v30 = v15;
      v31 = 2112;
      v32 = v2;
      v33 = 2048;
      v34 = v16;
      v35 = 1024;
      v36 = v17;
      v37 = 1024;
      v38 = v18;
      _os_log_impl(&dword_21A4E8000, v7, OS_LOG_TYPE_INFO, "playCollection: %@, library %@, accessory=%@, Call delegate play:collection:type:firstItemIndex:, collection=%llu type=%u startIndex=%u", buf, 0x36u);
    }

    objc_msgSend(*(id *)(a1 + 32), "delegateQ");
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __77__ACCMediaLibraryProvider_playCollection_library_collection_type_startIndex___block_invoke_145;
    block[3] = &unk_24DCCDF10;
    block[4] = *(_QWORD *)(a1 + 32);
    v20 = *(id *)(a1 + 48);
    v21 = *(_QWORD *)(a1 + 56);
    v23 = v20;
    v25 = v21;
    v26 = *(_QWORD *)(a1 + 64);
    v24 = v2;
    dispatch_async(v19, block);

  }
  else
  {
LABEL_7:
    if (gLogObjects)
      v8 = gNumLogObjects < 1;
    else
      v8 = 1;
    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      v10 = MEMORY[0x24BDACB70];
      v9 = MEMORY[0x24BDACB70];
    }
    else
    {
      v10 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v28 = v11;
      v29 = 2112;
      v30 = v2;
      v31 = 2112;
      v32 = v12;
      _os_log_impl(&dword_21A4E8000, v10, OS_LOG_TYPE_INFO, "playCollection: accessory %@ (%@) does not exist! or delegate does not respond to selector %@", buf, 0x20u);

    }
  }

}

void __77__ACCMediaLibraryProvider_playCollection_library_collection_type_startIndex___block_invoke_145(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaLibrary:play:collection:type:firstItemIndex:accessory:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 64), *(unsigned int *)(a1 + 68), *(_QWORD *)(a1 + 48));

}

- (void)playAllSongs:(id)a3 library:(id)a4 startItem:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *processingQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a4;
  processingQueue = self->_processingQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __58__ACCMediaLibraryProvider_playAllSongs_library_startItem___block_invoke;
  v13[3] = &unk_24DCCDF38;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a5;
  v11 = v9;
  v12 = v8;
  dispatch_async(processingQueue, v13);

}

void __58__ACCMediaLibraryProvider_playAllSongs_library_startItem___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  _QWORD v20[5];
  id v21;
  id v22;
  uint64_t v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    goto LABEL_7;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_7;
  v4 = (void *)v3;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      v7 = MEMORY[0x24BDACB70];
      v13 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v14 = *(_QWORD *)(a1 + 40);
      v15 = *(void **)(a1 + 48);
      v16 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138413058;
      v25 = v14;
      v26 = 2112;
      v27 = v15;
      v28 = 2112;
      v29 = v2;
      v30 = 2048;
      v31 = v16;
      _os_log_impl(&dword_21A4E8000, v7, OS_LOG_TYPE_INFO, "playAllSongs: %@, library %@, accessory=%@, Call delegate playAllSongs:firstItemPersistentID:, startIitem=%llu", buf, 0x2Au);
    }

    objc_msgSend(*(id *)(a1 + 32), "delegateQ");
    v17 = objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __58__ACCMediaLibraryProvider_playAllSongs_library_startItem___block_invoke_148;
    v20[3] = &unk_24DCCDF38;
    v20[4] = *(_QWORD *)(a1 + 32);
    v18 = *(id *)(a1 + 48);
    v19 = *(_QWORD *)(a1 + 56);
    v21 = v18;
    v23 = v19;
    v22 = v2;
    dispatch_async(v17, v20);

  }
  else
  {
LABEL_7:
    if (gLogObjects)
      v8 = gNumLogObjects < 1;
    else
      v8 = 1;
    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      v10 = MEMORY[0x24BDACB70];
      v9 = MEMORY[0x24BDACB70];
    }
    else
    {
      v10 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v25 = v11;
      v26 = 2112;
      v27 = v2;
      v28 = 2112;
      v29 = v12;
      _os_log_impl(&dword_21A4E8000, v10, OS_LOG_TYPE_INFO, "playAllSongs: accessory %@ (%@) does not exist! or delegate does not respond to selector %@", buf, 0x20u);

    }
  }

}

void __58__ACCMediaLibraryProvider_playAllSongs_library_startItem___block_invoke_148(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaLibrary:playAllSongs:firstItemPersistentID:accessory:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));

}

- (void)_notifyRemoteOfAvailableLibraries
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  NSString *providerUID;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  NSString *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NSMutableDictionary allValues](self->_libraries, "allValues", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "info");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(v9, "copyDict");
        objc_msgSend(v3, "addObject:", v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v6);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v11 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v11 = MEMORY[0x24BDACB70];
    v12 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    providerUID = self->_providerUID;
    *(_DWORD *)buf = 138412546;
    v20 = v3;
    v21 = 2112;
    v22 = providerUID;
    _os_log_impl(&dword_21A4E8000, v11, OS_LOG_TYPE_INFO, "_notifyRemoteOfAvailableLibraries:%@ providerUID:%@", buf, 0x16u);
  }

  -[ACCMediaLibraryProvider remoteObject](self, "remoteObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "notifyAvailableLibraries:provider:", v3, self->_providerUID);

}

- (void)notifyAvailableLibraries:(id)a3
{
  id v4;
  NSObject *processingQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  ACCMediaLibraryProvider *v9;

  v4 = a3;
  processingQueue = self->_processingQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__ACCMediaLibraryProvider_notifyAvailableLibraries___block_invoke;
  v7[3] = &unk_24DCCDC90;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(processingQueue, v7);

}

void __52__ACCMediaLibraryProvider_notifyAvailableLibraries___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  ACCMediaLibraryInfo *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  BOOL v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  _BYTE v40[14];
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  id v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v30 = a1;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v36 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        v10 = -[ACCMediaLibraryInfo initWithInfo:]([ACCMediaLibraryInfo alloc], "initWithInfo:", v9);
        objc_msgSend(v9, "mediaLibraryUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKey:", v10, v11);

        v12 = *(void **)(*(_QWORD *)(v30 + 40) + 64);
        objc_msgSend(v9, "mediaLibraryUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v12) = v14 == 0;

        v6 |= v12;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(v30 + 40) + 64), "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v45, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v32 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(v2, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20 == 0;

        v6 |= v21;
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v45, 16);
    }
    while (v17);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v22 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v22 = MEMORY[0x24BDACB70];
    v23 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    v24 = *(_QWORD *)(v30 + 40);
    v25 = *(_QWORD *)(v24 + 32);
    v26 = *(_QWORD *)(v24 + 64);
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v40 = v6 & 1;
    *(_WORD *)&v40[4] = 2112;
    *(_QWORD *)&v40[6] = v25;
    v41 = 2112;
    v42 = v26;
    v43 = 2112;
    v44 = v2;
    _os_log_impl(&dword_21A4E8000, v22, OS_LOG_TYPE_INFO, "foundDeletionOrAdd=%d providerUID:%@ _libraries= %@ -> %@", buf, 0x26u);
  }

  objc_storeStrong((id *)(*(_QWORD *)(v30 + 40) + 64), v2);
  if ((v6 & 1) != 0)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v27 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      v27 = MEMORY[0x24BDACB70];
      v28 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v29 = *(_QWORD *)(*(_QWORD *)(v30 + 40) + 32);
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v40 = v29;
      _os_log_impl(&dword_21A4E8000, v27, OS_LOG_TYPE_INFO, "foundDeletionOrAdd, notifyRemoteOfAvailableLibraries: providerUID:%@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(v30 + 40), "_notifyRemoteOfAvailableLibraries");
  }

}

- (void)notify:(id)a3 stateChange:(int)a4 enabled:(BOOL)a5
{
  id v8;
  NSObject *processingQueue;
  id v10;
  _QWORD block[5];
  id v12;
  int v13;
  BOOL v14;

  v8 = a3;
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__ACCMediaLibraryProvider_notify_stateChange_enabled___block_invoke;
  block[3] = &unk_24DCCDF60;
  block[4] = self;
  v12 = v8;
  v13 = a4;
  v14 = a5;
  v10 = v8;
  dispatch_async(processingQueue, block);

}

void __54__ACCMediaLibraryProvider_notify_stateChange_enabled___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v7 = v2;
    v4 = objc_msgSend(v2, "setState:value:", *(unsigned int *)(a1 + 48), *(unsigned __int8 *)(a1 + 52));
    v3 = v7;
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "remoteObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v3 = v7;
      if (v5)
      {
        objc_msgSend(*(id *)(a1 + 32), "remoteObject");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "notify:stateChange:enabled:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), *(unsigned __int8 *)(a1 + 52));

        v3 = v7;
      }
    }
  }

}

- (int64_t)update:(id)a3 revision:(id)a4 persistentID:(unint64_t)a5 type:(int)a6 updateInfo:(id)a7 progress:(unsigned __int8)a8 accessory:(id)a9
{
  int v9;
  id v15;
  id v16;
  id v17;
  id v18;
  BOOL v19;
  id v20;
  NSObject *v21;
  int lastUpdateType;
  NSObject *processingQueue;
  id v24;
  id v25;
  id v26;
  id v27;
  NSObject *v28;
  id v29;
  uint64_t v30;
  int64_t v31;
  _QWORD v33[4];
  id v34;
  ACCMediaLibraryProvider *v35;
  id v36;
  id v37;
  id v38;
  uint64_t *v39;
  unint64_t v40;
  int v41;
  char v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint8_t buf[4];
  id v48;
  __int16 v49;
  id v50;
  __int16 v51;
  unint64_t v52;
  __int16 v53;
  int v54;
  __int16 v55;
  int v56;
  __int16 v57;
  id v58;
  __int16 v59;
  id v60;
  __int16 v61;
  uint64_t v62;
  uint64_t v63;

  v9 = a8;
  v63 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v17 = a7;
  v18 = a9;
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 3;
  if (gLogObjects)
    v19 = gNumLogObjects < 1;
  else
    v19 = 1;
  if (v19)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v21 = MEMORY[0x24BDACB70];
    v20 = MEMORY[0x24BDACB70];
  }
  else
  {
    v21 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    lastUpdateType = self->_lastUpdateType;
    *(_DWORD *)buf = 138414082;
    v48 = v15;
    v49 = 2112;
    v50 = v16;
    v51 = 2048;
    v52 = a5;
    v53 = 1024;
    v54 = a6;
    v55 = 1024;
    v56 = v9;
    v57 = 2112;
    v58 = v17;
    v59 = 2112;
    v60 = v18;
    v61 = 1024;
    LODWORD(v62) = lastUpdateType;
    _os_log_impl(&dword_21A4E8000, v21, OS_LOG_TYPE_INFO, "update:%@ revision=%@ persistentID=%llu updateType=%d progress=%u info=%@ accessory=%@ _lastUpdateType=%d", buf, 0x46u);
  }

  processingQueue = self->_processingQueue;
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __91__ACCMediaLibraryProvider_update_revision_persistentID_type_updateInfo_progress_accessory___block_invoke;
  v33[3] = &unk_24DCCDF88;
  v41 = a6;
  v24 = v17;
  v34 = v24;
  v35 = self;
  v39 = &v43;
  v40 = a5;
  v25 = v15;
  v36 = v25;
  v26 = v16;
  v37 = v26;
  v42 = v9;
  v27 = v18;
  v38 = v27;
  dispatch_sync(processingQueue, v33);
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v28 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v28 = MEMORY[0x24BDACB70];
    v29 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    v30 = v44[3];
    *(_DWORD *)buf = 138414082;
    v48 = v25;
    v49 = 2112;
    v50 = v26;
    v51 = 2048;
    v52 = a5;
    v53 = 1024;
    v54 = a6;
    v55 = 1024;
    v56 = v9;
    v57 = 2112;
    v58 = v24;
    v59 = 2112;
    v60 = v27;
    v61 = 2048;
    v62 = v30;
    _os_log_impl(&dword_21A4E8000, v28, OS_LOG_TYPE_INFO, "update:%@ revision=%@ persistentID=%llu updateType=%d progress=%u info=%@ accessory=%@, status=%ld", buf, 0x4Au);
  }

  v31 = v44[3];
  _Block_object_dispose(&v43, 8);

  return v31;
}

void __91__ACCMediaLibraryProvider_update_revision_persistentID_type_updateInfo_progress_accessory___block_invoke(uint64_t a1)
{
  id v2;
  _BOOL4 v3;
  BOOL v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  void *v21;
  void *v22;
  char v23;
  BOOL v24;
  int v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  NSObject *v39;
  id v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  NSObject *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  int v55;
  void *v56;
  NSObject *v57;
  NSObject *v58;
  uint64_t v59;
  void *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  int v69;
  uint64_t v70;
  int v71;
  uint64_t v72;
  int v73;
  int v74;
  uint64_t v75;
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  _BYTE v79[42];
  int v80;
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  switch(*(_DWORD *)(a1 + 88))
  {
    case 0:
      v3 = 0;
      goto LABEL_19;
    case 1:
      v6 = *(void **)(a1 + 32);
      if (!v6)
        goto LABEL_23;
      v3 = (*(_DWORD *)(*(_QWORD *)(a1 + 40) + 8) - 3) < 2;
      v7 = (void *)objc_msgSend(v6, "copyDict");
      v8 = &ACCMediaLibraryUpdateItemDictionary;
      goto LABEL_15;
    case 2:
      v9 = *(void **)(a1 + 32);
      if (!v9)
        goto LABEL_23;
      v3 = (*(_DWORD *)(*(_QWORD *)(a1 + 40) + 8) - 3) < 2;
      v7 = (void *)objc_msgSend(v9, "copyDict");
      v8 = &ACCMediaLibraryUpdatePlaylistDictionary;
LABEL_15:
      objc_msgSend(v2, "setObject:forKey:", v7, *v8);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;

      break;
    case 3:
      v3 = (*(_DWORD *)(*(_QWORD *)(a1 + 40) + 8) - 1) < 2;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 80));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = &ACCMediaLibraryUpdateItemDeletePersistentID;
      goto LABEL_18;
    case 4:
      v3 = (*(_DWORD *)(*(_QWORD *)(a1 + 40) + 8) - 1) < 2;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 80));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = &ACCMediaLibraryUpdatePlaylistDeletePersistentID;
LABEL_18:
      objc_msgSend(v2, "setObject:forKey:", v10, *v11);

LABEL_19:
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
      break;
    default:
      if (gLogObjects)
        v4 = gNumLogObjects < 1;
      else
        v4 = 1;
      if (v4)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
        v12 = MEMORY[0x24BDACB70];
        v5 = MEMORY[0x24BDACB70];
      }
      else
      {
        v12 = *(id *)gLogObjects;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = *(_QWORD *)(a1 + 48);
        v14 = *(_QWORD *)(a1 + 56);
        v15 = *(_QWORD *)(a1 + 80);
        v16 = *(_DWORD *)(a1 + 88);
        v17 = *(unsigned __int8 *)(a1 + 92);
        v18 = *(_QWORD *)(a1 + 64);
        v19 = *(_QWORD *)(a1 + 32);
        v20 = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v74 = 138414082;
        v75 = v13;
        v76 = 2112;
        v77 = v14;
        v78 = 2048;
        *(_QWORD *)v79 = v15;
        *(_WORD *)&v79[8] = 1024;
        *(_DWORD *)&v79[10] = v16;
        *(_WORD *)&v79[14] = 1024;
        *(_DWORD *)&v79[16] = v17;
        *(_WORD *)&v79[20] = 2112;
        *(_QWORD *)&v79[22] = v19;
        *(_WORD *)&v79[30] = 2112;
        *(_QWORD *)&v79[32] = v18;
        *(_WORD *)&v79[40] = 1024;
        v80 = v20;
        _os_log_impl(&dword_21A4E8000, v12, OS_LOG_TYPE_INFO, "update:%@ revision=%@ persistentID=%llu updateType=%d progress=%u info=%@ accessory=%@ _lastUpdateType=%d, UNKNOWN TYPE!!!", (uint8_t *)&v74, 0x46u);
      }

LABEL_23:
      v3 = 0;
      break;
  }
  *(_DWORD *)(*(_QWORD *)(a1 + 40) + 8) = *(_DWORD *)(a1 + 88);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) == 3)
    goto LABEL_94;
  objc_msgSend(v2, "setObject:forKey:", *(_QWORD *)(a1 + 48), CFSTR("ACCMediaLibraryUIDKey"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 88));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v21, CFSTR("ACCMediaLibraryUpdateTypeKey"));

  objc_msgSend(v2, "setObject:forKey:", *(_QWORD *)(a1 + 56), CFSTR("ACCMediaLibraryUpdateRevisionKey"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", *(unsigned __int8 *)(a1 + 92));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v22, CFSTR("ACCMediaLibraryUpdateProgressKey"));

  v23 = objc_msgSend(*(id *)(a1 + 64), "pendingUpdatesAndWaitingConfirmFullForLibrary:", *(_QWORD *)(a1 + 48));
  if (gLogObjects)
    v24 = gNumLogObjects <= 0;
  else
    v24 = 1;
  v25 = !v24;
  if ((v23 & 1) != 0)
  {
    if (v25)
    {
      v26 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      v26 = MEMORY[0x24BDACB70];
      v28 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v29 = *(_QWORD *)(a1 + 48);
      v30 = *(_QWORD *)(a1 + 56);
      v31 = objc_msgSend(*(id *)(a1 + 64), "pendingAndWaitingConfirmUpdatesCountForLibrary:", v29);
      v32 = objc_msgSend(*(id *)(a1 + 64), "windowPerLibrary");
      v74 = 138413058;
      v75 = v29;
      v76 = 2112;
      v77 = v30;
      v78 = 2048;
      *(_QWORD *)v79 = v31;
      *(_WORD *)&v79[8] = 1024;
      *(_DWORD *)&v79[10] = v32;
      _os_log_impl(&dword_21A4E8000, v26, OS_LOG_TYPE_INFO, "update:%@ revision=%@, ALREADY FULL (%lu / %d), update not added!!!", (uint8_t *)&v74, 0x26u);
    }
    v33 = 2;
  }
  else
  {
    if (v25)
    {
      v27 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      v27 = MEMORY[0x24BDACB70];
      v34 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v35 = *(_QWORD *)(a1 + 48);
      v36 = *(_QWORD *)(a1 + 56);
      v37 = objc_msgSend(*(id *)(a1 + 64), "pendingAndWaitingConfirmUpdatesCountForLibrary:", v35);
      v38 = objc_msgSend(*(id *)(a1 + 64), "windowPerLibrary");
      v74 = 138413314;
      v75 = v35;
      v76 = 2112;
      v77 = v36;
      v78 = 2048;
      *(_QWORD *)v79 = v37;
      *(_WORD *)&v79[8] = 1024;
      *(_DWORD *)&v79[10] = v38;
      *(_WORD *)&v79[14] = 2112;
      *(_QWORD *)&v79[16] = v2;
      _os_log_impl(&dword_21A4E8000, v27, OS_LOG_TYPE_INFO, "update:%@ revision=%@, not full (%lu / %d), addUpdate: dict=%@", (uint8_t *)&v74, 0x30u);
    }

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
    if (v3)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v39 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
        v39 = MEMORY[0x24BDACB70];
        v40 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        v41 = *(_QWORD *)(a1 + 48);
        v74 = 138412546;
        v75 = v41;
        v76 = 1024;
        LODWORD(v77) = 1;
        _os_log_impl(&dword_21A4E8000, v39, OS_LOG_TYPE_INFO, "update:%@ addDeleteChange=%d flushUpdate", (uint8_t *)&v74, 0x12u);
      }

      objc_msgSend(*(id *)(a1 + 40), "flushUpdates:accessory:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
    }
    if (!objc_msgSend(*(id *)(a1 + 64), "addUpdate:library:", v2, *(_QWORD *)(a1 + 48)))
      goto LABEL_67;
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v26 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      v26 = MEMORY[0x24BDACB70];
      v42 = MEMORY[0x24BDACB70];
    }
    v33 = 1;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v43 = *(_QWORD *)(a1 + 48);
      v44 = *(_QWORD *)(a1 + 56);
      v45 = objc_msgSend(*(id *)(a1 + 64), "pendingAndWaitingConfirmUpdatesCountForLibrary:", v43);
      v46 = objc_msgSend(*(id *)(a1 + 64), "windowPerLibrary");
      v74 = 138413058;
      v75 = v43;
      v76 = 2112;
      v77 = v44;
      v78 = 2048;
      *(_QWORD *)v79 = v45;
      *(_WORD *)&v79[8] = 1024;
      *(_DWORD *)&v79[10] = v46;
      v33 = 1;
      _os_log_impl(&dword_21A4E8000, v26, OS_LOG_TYPE_INFO, "update:%@ revision=%@, full after addUpdate (%lu / %d)", (uint8_t *)&v74, 0x26u);
    }
  }

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v33;
LABEL_67:
  if (*(unsigned __int8 *)(a1 + 92) <= 0x63u
    && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) != 1
    && !objc_msgSend(*(id *)(a1 + 64), "pendingUpdatesAndWaitingConfirmFullForLibrary:", *(_QWORD *)(a1 + 48)))
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v57 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      v57 = MEMORY[0x24BDACB70];
      v66 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
    {
      v67 = *(_QWORD *)(a1 + 48);
      v68 = *(_QWORD *)(a1 + 56);
      v69 = *(unsigned __int8 *)(a1 + 92);
      v70 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
      v71 = objc_msgSend(*(id *)(a1 + 64), "pendingUpdatesAndWaitingConfirmFullForLibrary:", v67);
      v72 = objc_msgSend(*(id *)(a1 + 64), "pendingAndWaitingConfirmUpdatesCountForLibrary:", *(_QWORD *)(a1 + 48));
      v73 = objc_msgSend(*(id *)(a1 + 64), "windowPerLibrary");
      v74 = 138414082;
      v75 = v67;
      v76 = 2112;
      v77 = v68;
      v78 = 1024;
      *(_DWORD *)v79 = v69;
      *(_WORD *)&v79[4] = 1024;
      *(_DWORD *)&v79[6] = v3;
      *(_WORD *)&v79[10] = 2048;
      *(_QWORD *)&v79[12] = v70;
      *(_WORD *)&v79[20] = 1024;
      *(_DWORD *)&v79[22] = v71;
      *(_WORD *)&v79[26] = 2048;
      *(_QWORD *)&v79[28] = v72;
      *(_WORD *)&v79[36] = 1024;
      *(_DWORD *)&v79[38] = v73;
      _os_log_impl(&dword_21A4E8000, v57, OS_LOG_TYPE_INFO, "update:%@ revision=%@ progress=%u addDeleteChange=%d status=%ld, pendingUpdatesFull=%d (%lu/%d), Skip sending Update!", (uint8_t *)&v74, 0x42u);
    }
    goto LABEL_93;
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v47 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v47 = MEMORY[0x24BDACB70];
    v48 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
  {
    v49 = *(_QWORD *)(a1 + 48);
    v50 = *(_QWORD *)(a1 + 56);
    v51 = *(unsigned __int8 *)(a1 + 92);
    v52 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    v53 = objc_msgSend(*(id *)(a1 + 64), "pendingUpdatesAndWaitingConfirmFullForLibrary:", v49);
    v54 = objc_msgSend(*(id *)(a1 + 64), "pendingAndWaitingConfirmUpdatesCountForLibrary:", *(_QWORD *)(a1 + 48));
    v55 = objc_msgSend(*(id *)(a1 + 64), "windowPerLibrary");
    v74 = 138413826;
    v75 = v49;
    v76 = 2112;
    v77 = v50;
    v78 = 1024;
    *(_DWORD *)v79 = v51;
    *(_WORD *)&v79[4] = 2048;
    *(_QWORD *)&v79[6] = v52;
    *(_WORD *)&v79[14] = 1024;
    *(_DWORD *)&v79[16] = v53;
    *(_WORD *)&v79[20] = 2048;
    *(_QWORD *)&v79[22] = v54;
    *(_WORD *)&v79[30] = 1024;
    *(_DWORD *)&v79[32] = v55;
    _os_log_impl(&dword_21A4E8000, v47, OS_LOG_TYPE_INFO, "update:%@ revision=%@ progress=%u status=%ld, pendingUpdatesFull=%d (%lu/%d), Send Update!", (uint8_t *)&v74, 0x3Cu);
  }

  objc_msgSend(*(id *)(a1 + 40), "remoteObject");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    v57 = objc_msgSend(*(id *)(a1 + 64), "copyPendingNonContentUpdatesToSendForLibrary:", *(_QWORD *)(a1 + 48));
    if (v57)
    {
      objc_msgSend(*(id *)(a1 + 40), "remoteObject");
      v58 = objc_claimAutoreleasedReturnValue();
      v59 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 64), "accessoryUID");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject update:updates:accessory:](v58, "update:updates:accessory:", v59, v57, v60);

    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v58 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
        v58 = MEMORY[0x24BDACB70];
        v61 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      {
        v62 = *(_QWORD *)(a1 + 48);
        v63 = *(_QWORD *)(a1 + 56);
        v64 = objc_msgSend(*(id *)(a1 + 64), "pendingAndWaitingConfirmUpdatesCountForLibrary:", v62);
        v65 = objc_msgSend(*(id *)(a1 + 64), "windowPerLibrary");
        v74 = 138413058;
        v75 = v62;
        v76 = 2112;
        v77 = v63;
        v78 = 2048;
        *(_QWORD *)v79 = v64;
        *(_WORD *)&v79[8] = 1024;
        *(_DWORD *)&v79[10] = v65;
        _os_log_impl(&dword_21A4E8000, v58, OS_LOG_TYPE_INFO, "update:%@ revision=%@, No Pending Updates (%lu / %d), update not sent!!!", (uint8_t *)&v74, 0x26u);
      }
    }

LABEL_93:
  }
LABEL_94:

}

- (int64_t)update:(id)a3 revision:(id)a4 item:(id)a5 progress:(unsigned __int8)a6 accessory:(id)a7
{
  uint64_t v8;
  id v12;
  id v13;
  id v14;
  id v15;
  BOOL v16;
  id v17;
  NSObject *v18;
  int64_t v19;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v8 = a6;
  v31 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  if (gLogObjects)
    v16 = gNumLogObjects < 1;
  else
    v16 = 1;
  if (v16)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v18 = MEMORY[0x24BDACB70];
    v17 = MEMORY[0x24BDACB70];
  }
  else
  {
    v18 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413314;
    v22 = v12;
    v23 = 2112;
    v24 = v13;
    v25 = 1024;
    v26 = v8;
    v27 = 2112;
    v28 = v14;
    v29 = 2112;
    v30 = v15;
    _os_log_impl(&dword_21A4E8000, v18, OS_LOG_TYPE_INFO, "updateItem:%@ revision=%@ progress=%u item=%@ accessory=%@", buf, 0x30u);
  }

  v19 = -[ACCMediaLibraryProvider update:revision:persistentID:type:updateInfo:progress:accessory:](self, "update:revision:persistentID:type:updateInfo:progress:accessory:", v12, v13, objc_msgSend(v14, "persistentID"), 1, v14, v8, v15);
  return v19;
}

- (int64_t)update:(id)a3 revision:(id)a4 playlist:(id)a5 progress:(unsigned __int8)a6 accessory:(id)a7
{
  uint64_t v8;
  id v12;
  id v13;
  id v14;
  id v15;
  BOOL v16;
  id v17;
  NSObject *v18;
  int64_t v19;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v8 = a6;
  v31 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  if (gLogObjects)
    v16 = gNumLogObjects < 1;
  else
    v16 = 1;
  if (v16)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v18 = MEMORY[0x24BDACB70];
    v17 = MEMORY[0x24BDACB70];
  }
  else
  {
    v18 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413314;
    v22 = v12;
    v23 = 2112;
    v24 = v13;
    v25 = 1024;
    v26 = v8;
    v27 = 2112;
    v28 = v14;
    v29 = 2112;
    v30 = v15;
    _os_log_impl(&dword_21A4E8000, v18, OS_LOG_TYPE_INFO, "updatePlaylist:%@ revision=%@ progress=%u playlist=%@ accessory=%@", buf, 0x30u);
  }

  v19 = -[ACCMediaLibraryProvider update:revision:persistentID:type:updateInfo:progress:accessory:](self, "update:revision:persistentID:type:updateInfo:progress:accessory:", v12, v13, objc_msgSend(v14, "persistentID"), 2, v14, v8, v15);
  return v19;
}

- (int64_t)update:(id)a3 revision:(id)a4 deleteItem:(unint64_t)a5 progress:(unsigned __int8)a6 accessory:(id)a7
{
  uint64_t v8;
  id v12;
  id v13;
  id v14;
  BOOL v15;
  id v16;
  NSObject *v17;
  int64_t v18;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  int v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v8 = a6;
  v30 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a7;
  if (gLogObjects)
    v15 = gNumLogObjects < 1;
  else
    v15 = 1;
  if (v15)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v17 = MEMORY[0x24BDACB70];
    v16 = MEMORY[0x24BDACB70];
  }
  else
  {
    v17 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413314;
    v21 = v12;
    v22 = 2112;
    v23 = v13;
    v24 = 1024;
    v25 = v8;
    v26 = 2048;
    v27 = a5;
    v28 = 2112;
    v29 = v14;
    _os_log_impl(&dword_21A4E8000, v17, OS_LOG_TYPE_INFO, "updateDeleteItem:%@ revision=%@ progress=%u persistentID=%llu accessory=%@", buf, 0x30u);
  }

  v18 = -[ACCMediaLibraryProvider update:revision:persistentID:type:updateInfo:progress:accessory:](self, "update:revision:persistentID:type:updateInfo:progress:accessory:", v12, v13, a5, 3, 0, v8, v14);
  return v18;
}

- (int64_t)update:(id)a3 revision:(id)a4 deletePlaylist:(unint64_t)a5 progress:(unsigned __int8)a6 accessory:(id)a7
{
  uint64_t v8;
  id v12;
  id v13;
  id v14;
  BOOL v15;
  id v16;
  NSObject *v17;
  int64_t v18;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  int v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v8 = a6;
  v30 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a7;
  if (gLogObjects)
    v15 = gNumLogObjects < 1;
  else
    v15 = 1;
  if (v15)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v17 = MEMORY[0x24BDACB70];
    v16 = MEMORY[0x24BDACB70];
  }
  else
  {
    v17 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413314;
    v21 = v12;
    v22 = 2112;
    v23 = v13;
    v24 = 1024;
    v25 = v8;
    v26 = 2048;
    v27 = a5;
    v28 = 2112;
    v29 = v14;
    _os_log_impl(&dword_21A4E8000, v17, OS_LOG_TYPE_INFO, "updateDeletePlaylist:%@ revision=%@ progress=%u persistentID=%llu accessory=%@", buf, 0x30u);
  }

  v18 = -[ACCMediaLibraryProvider update:revision:persistentID:type:updateInfo:progress:accessory:](self, "update:revision:persistentID:type:updateInfo:progress:accessory:", v12, v13, a5, 4, 0, v8, v14);
  return v18;
}

- (int64_t)update:(id)a3 revision:(id)a4 progress:(unsigned __int8)a5 accessory:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  id v12;
  BOOL v13;
  id v14;
  NSObject *v15;
  int64_t v16;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  int v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v7 = a5;
  v26 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (gLogObjects)
    v13 = gNumLogObjects < 1;
  else
    v13 = 1;
  if (v13)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v15 = MEMORY[0x24BDACB70];
    v14 = MEMORY[0x24BDACB70];
  }
  else
  {
    v15 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413058;
    v19 = v10;
    v20 = 2112;
    v21 = v11;
    v22 = 1024;
    v23 = v7;
    v24 = 2112;
    v25 = v12;
    _os_log_impl(&dword_21A4E8000, v15, OS_LOG_TYPE_INFO, "updateProgress:%@ revision=%@ progress=%u accessory=%@", buf, 0x26u);
  }

  v16 = -[ACCMediaLibraryProvider update:revision:persistentID:type:updateInfo:progress:accessory:](self, "update:revision:persistentID:type:updateInfo:progress:accessory:", v10, v11, 0, 0, 0, v7, v12);
  return v16;
}

- (void)flushUpdates:(id)a3 accessory:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  NSObject *processingQueue;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (gLogObjects)
    v8 = gNumLogObjects < 1;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v10 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  else
  {
    v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_21A4E8000, v10, OS_LOG_TYPE_INFO, "flushUpdates:%@ accessory=%@", buf, 0x16u);
  }

  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__ACCMediaLibraryProvider_flushUpdates_accessory___block_invoke;
  block[3] = &unk_24DCCDC68;
  block[4] = self;
  v15 = v7;
  v16 = v6;
  v12 = v6;
  v13 = v7;
  dispatch_async(processingQueue, block);

}

void __50__ACCMediaLibraryProvider_flushUpdates_accessory___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "remoteObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = (void *)objc_msgSend(*(id *)(a1 + 40), "copyPendingNonContentUpdatesToSendForLibrary:", *(_QWORD *)(a1 + 48));
    v4 = v3;
    if (v3 && objc_msgSend(v3, "count"))
    {
      objc_msgSend(*(id *)(a1 + 32), "remoteObject");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 40), "accessoryUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject update:updates:accessory:](v5, "update:updates:accessory:", v6, v4, v7);

    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v5 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
        v5 = MEMORY[0x24BDACB70];
        v8 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v9 = *(_QWORD *)(a1 + 48);
        v10 = objc_msgSend(*(id *)(a1 + 40), "pendingAndWaitingConfirmUpdatesCountForLibrary:", v9);
        v11 = objc_msgSend(*(id *)(a1 + 40), "windowPerLibrary");
        v12 = 138412802;
        v13 = v9;
        v14 = 2048;
        v15 = v10;
        v16 = 1024;
        v17 = v11;
        _os_log_impl(&dword_21A4E8000, v5, OS_LOG_TYPE_INFO, "update:%@, No Pending Updates (%lu / %d), update not sent!!!", (uint8_t *)&v12, 0x1Cu);
      }
    }

  }
}

- (int64_t)update:(id)a3 revision:(id)a4 content:(id)a5 accessory:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  BOOL v14;
  id v15;
  NSObject *v16;
  NSObject *processingQueue;
  id v18;
  id v19;
  id v20;
  id v21;
  int64_t v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  ACCMediaLibraryProvider *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 3;
  if (gLogObjects)
    v14 = gNumLogObjects < 1;
  else
    v14 = 1;
  if (v14)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v16 = MEMORY[0x24BDACB70];
    v15 = MEMORY[0x24BDACB70];
  }
  else
  {
    v16 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413058;
    v36 = v10;
    v37 = 2112;
    v38 = v11;
    v39 = 2112;
    v40 = v12;
    v41 = 2112;
    v42 = v13;
    _os_log_impl(&dword_21A4E8000, v16, OS_LOG_TYPE_INFO, "updateContent:%@ revision=%@ content=%@ accessory=%@", buf, 0x2Au);
  }

  processingQueue = self->_processingQueue;
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __61__ACCMediaLibraryProvider_update_revision_content_accessory___block_invoke;
  v24[3] = &unk_24DCCDFB0;
  v25 = v12;
  v26 = v10;
  v27 = v11;
  v28 = v13;
  v29 = self;
  v30 = &v31;
  v18 = v13;
  v19 = v11;
  v20 = v10;
  v21 = v12;
  dispatch_sync(processingQueue, v24);
  v22 = v32[3];

  _Block_object_dispose(&v31, 8);
  return v22;
}

void __61__ACCMediaLibraryProvider_update_revision_content_accessory___block_invoke(uint64_t a1)
{
  uint64_t *v2;
  void *v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = (uint64_t *)(a1 + 32);
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "copyDict");
  if (gLogObjects)
    v4 = gNumLogObjects < 1;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __61__ACCMediaLibraryProvider_update_revision_content_accessory___block_invoke_cold_2((_QWORD *)a1, v2, v6);

  if (v3)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
    if (objc_msgSend(*(id *)(a1 + 56), "addPlaylistContentUpdate:library:", v3, *(_QWORD *)(a1 + 40)))
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v7 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
        v7 = MEMORY[0x24BDACB70];
        v8 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v9 = *(_QWORD *)(a1 + 40);
        v10 = *(_QWORD *)(a1 + 48);
        v11 = objc_msgSend(*(id *)(a1 + 56), "pendingAndWaitingConfirmUpdatesCountForLibrary:", v9);
        v12 = objc_msgSend(*(id *)(a1 + 56), "windowPerLibrary");
        v13 = 138413058;
        v14 = v9;
        v15 = 2112;
        v16 = v10;
        v17 = 2048;
        v18 = v11;
        v19 = 1024;
        v20 = v12;
        _os_log_impl(&dword_21A4E8000, v7, OS_LOG_TYPE_INFO, "updateContent:%@ revision=%@, full after addPlaylistContentUpdate (%lu / %d)", (uint8_t *)&v13, 0x26u);
      }

      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
    }
    objc_msgSend(*(id *)(a1 + 64), "_checkPlaylistContentToSend:accessory:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  }

}

- (void)resetUpdate:(id)a3 accessory:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  NSObject *processingQueue;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  ACCMediaLibraryProvider *v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (gLogObjects)
    v8 = gNumLogObjects < 1;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v10 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  else
  {
    v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v6;
    _os_log_impl(&dword_21A4E8000, v10, OS_LOG_TYPE_INFO, "resetUpdate:%@", buf, 0xCu);
  }

  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__ACCMediaLibraryProvider_resetUpdate_accessory___block_invoke;
  block[3] = &unk_24DCCDC68;
  v15 = v7;
  v16 = self;
  v17 = v6;
  v12 = v6;
  v13 = v7;
  dispatch_async(processingQueue, block);

}

void __49__ACCMediaLibraryProvider_resetUpdate_accessory___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "clearAllUpdates");
  objc_msgSend(*(id *)(a1 + 40), "remoteObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "accessoryUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetUpdate:accessory:", v2, v3);

}

- (void)_checkPlaylistContentToSend:(id)a3 accessory:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  __int128 v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  int v17;
  BOOL v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  id v26;
  __int128 v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (gLogObjects)
    v8 = gNumLogObjects < 1;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v10 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  else
  {
    v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[ACCMediaLibraryProvider _checkPlaylistContentToSend:accessory:].cold.2((uint64_t)v6, (uint64_t)v7, v10);

  v11 = objc_msgSend(v7, "copyPendingPlaylistContentUpdatesToSendForLibrary:", v6);
  if (v11)
  {
    v13 = (void *)v11;
    v14 = MEMORY[0x24BDACB70];
    *(_QWORD *)&v12 = 134218240;
    v27 = v12;
    do
    {
      objc_msgSend(v13, "objectForKey:", CFSTR("ACCMediaLibraryUpdateRevisionKey"), v27);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = gLogObjects;
      v17 = gNumLogObjects;
      if (gLogObjects)
        v18 = gNumLogObjects < 1;
      else
        v18 = 1;
      if (v18)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v27;
          v29 = v16;
          v30 = 1024;
          LODWORD(v31) = v17;
          _os_log_error_impl(&dword_21A4E8000, v14, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        v19 = v14;
        v20 = v14;
      }
      else
      {
        v20 = *(id *)gLogObjects;
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v29 = (uint64_t)v6;
        v30 = 2112;
        v31 = v15;
        v32 = 2112;
        v33 = v13;
        _os_log_debug_impl(&dword_21A4E8000, v20, OS_LOG_TYPE_DEBUG, "_checkPlaylistContentToSend:%@ itemRevision=%@ item=%@", buf, 0x20u);
      }

      -[ACCMediaLibraryProvider remoteObject](self, "remoteObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        -[ACCMediaLibraryProvider remoteObject](self, "remoteObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "accessoryUID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "update:revision:content:accessory:", v6, v15, v13, v23);

      }
      v24 = objc_msgSend(v7, "copyPendingPlaylistContentUpdatesToSendForLibrary:", v6);

      v13 = (void *)v24;
    }
    while (v24);
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v25 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      v25 = MEMORY[0x24BDACB70];
      v26 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v29 = (uint64_t)v6;
      _os_log_impl(&dword_21A4E8000, v25, OS_LOG_TYPE_INFO, "_checkPlaylistContentToSend:%@ no pending playlistContentUpdates", buf, 0xCu);
    }

  }
}

- (ACCMediaLibraryProviderDelegateProtocol)delegate
{
  return (ACCMediaLibraryProviderDelegateProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSXPCConnection)serverConnection
{
  return self->_serverConnection;
}

- (void)setServerConnection:(id)a3
{
  objc_storeStrong((id *)&self->_serverConnection, a3);
}

- (NSString)providerUID
{
  return self->_providerUID;
}

- (void)setProviderUID:(id)a3
{
  objc_storeStrong((id *)&self->_providerUID, a3);
}

- (OS_dispatch_queue)delegateQ
{
  return (OS_dispatch_queue *)objc_loadWeakRetained((id *)&self->_delegateQ);
}

- (void)setDelegateQ:(id)a3
{
  objc_storeWeak((id *)&self->_delegateQ, a3);
}

- (ACCMediaLibraryXPCServerProtocol)remoteObject
{
  return self->_remoteObject;
}

- (void)setRemoteObject:(id)a3
{
  objc_storeStrong((id *)&self->_remoteObject, a3);
}

- (NSMutableDictionary)accessories
{
  return self->_accessories;
}

- (void)setAccessories:(id)a3
{
  objc_storeStrong((id *)&self->_accessories, a3);
}

- (NSMutableDictionary)libraries
{
  return self->_libraries;
}

- (void)setLibraries:(id)a3
{
  objc_storeStrong((id *)&self->_libraries, a3);
}

- (int)lastUpdateType
{
  return self->_lastUpdateType;
}

- (void)setLastUpdateType:(int)a3
{
  self->_lastUpdateType = a3;
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (void)setProcessingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_processingQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_libraries, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_remoteObject, 0);
  objc_destroyWeak((id *)&self->_delegateQ);
  objc_storeStrong((id *)&self->_providerUID, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __61__ACCMediaLibraryProvider_update_revision_content_accessory___block_invoke_cold_2(_QWORD *a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a1[5];
  v4 = a1[6];
  v5 = *a2;
  v6 = a1[7];
  v7 = 138413058;
  v8 = v3;
  v9 = 2112;
  v10 = v4;
  v11 = 2112;
  v12 = v5;
  v13 = 2112;
  v14 = v6;
  _os_log_debug_impl(&dword_21A4E8000, log, OS_LOG_TYPE_DEBUG, "updateContent:%@ revision=%@ content=%@ accessory=%@", (uint8_t *)&v7, 0x2Au);
}

- (void)_checkPlaylistContentToSend:(os_log_t)log accessory:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_21A4E8000, log, OS_LOG_TYPE_DEBUG, "_checkPlaylistContentToSend:%@ accessory=%@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_2();
}

@end
