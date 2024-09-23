@implementation CRSUIClusterThemeService

- (CRSUIClusterThemeService)init
{
  CRSUIClusterThemeService *v2;
  CRSUIClusterThemeService *v3;
  void *v4;
  uint64_t v5;
  OS_dispatch_queue *connectionQueue;
  uint64_t v7;
  NSHashTable *connections;
  void *v9;
  id *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  id v14;
  _QWORD v16[4];
  id *v17;
  objc_super v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v18.receiver = self;
  v18.super_class = (Class)CRSUIClusterThemeService;
  v2 = -[CRSUIClusterThemeService init](&v18, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BE0BE18], "serial");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = BSDispatchQueueCreate();
    connectionQueue = v3->_connectionQueue;
    v3->_connectionQueue = (OS_dispatch_queue *)v5;

    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 512);
    v7 = objc_claimAutoreleasedReturnValue();
    connections = v3->_connections;
    v3->_connections = (NSHashTable *)v7;

    v9 = (void *)MEMORY[0x24BE383C8];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __32__CRSUIClusterThemeService_init__block_invoke;
    v16[3] = &unk_24C7697F8;
    v10 = v3;
    v17 = v10;
    objc_msgSend(v9, "listenerWithConfigurator:", v16);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v10[4];
    v10[4] = (id)v11;

    CRSUILogForCategory(6uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v10[4];
      *(_DWORD *)buf = 138412290;
      v20 = v14;
      _os_log_impl(&dword_20D6CC000, v13, OS_LOG_TYPE_DEFAULT, "Activating listener! %@", buf, 0xCu);
    }

    objc_msgSend(v10[4], "activate");
  }
  return v3;
}

void __32__CRSUIClusterThemeService_init__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setDomain:", CFSTR("com.apple.CarPlay.ClusterTheme"));
  +[CRSUIClusterThemeSpecification identifier](CRSUIClusterThemeSpecification, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setService:", v3);

  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));
}

- (void)invalidate
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  CRSUILogForCategory(6uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[CRSUIClusterThemeService listener](self, "listener");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_20D6CC000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating listener! %@", (uint8_t *)&v6, 0xCu);

  }
  -[CRSUIClusterThemeService listener](self, "listener");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *connectionQueue;
  id v18;
  NSObject *v19;
  _QWORD block[4];
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id location;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  CRSUILogForCategory(6uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v9;
    _os_log_impl(&dword_20D6CC000, v11, OS_LOG_TYPE_DEFAULT, "Received connection! %@", buf, 0xCu);
  }

  objc_msgSend(v9, "remoteProcess");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12
    && (objc_msgSend(v9, "remoteProcess"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "hasEntitlement:", CFSTR("com.apple.private.CarPlayUIServices.cluster-theme")),
        v13,
        v12,
        (v14 & 1) != 0))
  {
    objc_initWeak(&location, self);
    v15 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __70__CRSUIClusterThemeService_listener_didReceiveConnection_withContext___block_invoke;
    v23[3] = &unk_24C769848;
    v23[4] = self;
    objc_copyWeak(&v24, &location);
    objc_msgSend(v9, "configureConnection:", v23);
    CRSUILogForCategory(6uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v9;
      _os_log_impl(&dword_20D6CC000, v16, OS_LOG_TYPE_DEFAULT, "Activating connection... %@", buf, 0xCu);
    }

    connectionQueue = self->_connectionQueue;
    block[0] = v15;
    block[1] = 3221225472;
    block[2] = __70__CRSUIClusterThemeService_listener_didReceiveConnection_withContext___block_invoke_11;
    block[3] = &unk_24C769870;
    objc_copyWeak(&v22, &location);
    v18 = v9;
    v21 = v18;
    dispatch_async(connectionQueue, block);
    objc_msgSend(v18, "activate");

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  else
  {
    CRSUILogForCategory(6uLL);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[CRSUIClusterThemeService listener:didReceiveConnection:withContext:].cold.1(v9, v19);

    objc_msgSend(v9, "invalidate");
  }

}

void __70__CRSUIClusterThemeService_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  +[CRSUIClusterThemeSpecification serviceQuality](CRSUIClusterThemeSpecification, "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  +[CRSUIClusterThemeSpecification interface](CRSUIClusterThemeSpecification, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __70__CRSUIClusterThemeService_listener_didReceiveConnection_withContext___block_invoke_2;
  v8[3] = &unk_24C769820;
  a1 += 40;
  objc_copyWeak(&v9, (id *)a1);
  objc_msgSend(v3, "setInvalidationHandler:", v8);
  WeakRetained = objc_loadWeakRetained((id *)a1);
  objc_msgSend(WeakRetained, "connectionQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTargetQueue:", v7);

  objc_destroyWeak(&v9);
}

void __70__CRSUIClusterThemeService_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id WeakRetained;

  v3 = a2;
  CRSUILogForCategory(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __70__CRSUIClusterThemeService_listener_didReceiveConnection_withContext___block_invoke_2_cold_1((uint64_t)v3, v4, v5);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_connectionQueue_removeConnection:", v3);

}

void __70__CRSUIClusterThemeService_listener_didReceiveConnection_withContext___block_invoke_11(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_connectionQueue_addConnection:", *(_QWORD *)(a1 + 32));

}

- (void)getClusterThemeLayoutData:(id)a3
{
  void (**v4)(id, _CRSUIClusterThemeLayoutData *, void *);
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _CRSUIClusterThemeLayoutData *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  const __CFString *v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _CRSUIClusterThemeLayoutData *, void *))a3;
  CRSUILogForCategory(6uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BE383B0], "currentContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v29 = v6;
    _os_log_impl(&dword_20D6CC000, v5, OS_LOG_TYPE_DEFAULT, "Received request for cluster layouts (connection: %@)", buf, 0xCu);

  }
  -[CRSUIClusterThemeService themeDataProvider](self, "themeDataProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CRSUIClusterThemeService themeDataProvider](self, "themeDataProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "themeData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[CRSUIClusterThemeService themeDataProvider](self, "themeDataProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "clusterThemeDisplays");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[CRSUIClusterThemeService themeDataProvider](self, "themeDataProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "extraAssetsURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_alloc_init(_CRSUIClusterThemeLayoutData);
    -[_CRSUIClusterThemeLayoutData setThemeData:](v14, "setThemeData:", v9);
    -[_CRSUIClusterThemeLayoutData setDisplays:](v14, "setDisplays:", v11);
    -[_CRSUIClusterThemeLayoutData setExtraAssetsURL:](v14, "setExtraAssetsURL:", v13);
    -[CRSUIClusterThemeService themeDataProvider](self, "themeDataProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CRSUIClusterThemeLayoutData setAssetVersion:](v14, "setAssetVersion:", objc_msgSend(v15, "assetVersion"));

    v16 = 0;
  }
  else
  {
    CRSUILogForCategory(6uLL);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[CRSUIClusterThemeService getClusterThemeLayoutData:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);

    v25 = (void *)MEMORY[0x24BDD1540];
    v26 = *MEMORY[0x24BDD0FC8];
    v27 = CFSTR("Unable to retrieve cluster theme data");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CarPlayUIServices.cluster-theme-service"), 1, v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
  }

  v4[2](v4, v14, v16);
}

- (void)getURLForAssetWithIdentifier:(id)a3 displayID:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, void *);
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  const __CFString *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, void *))a5;
  CRSUILogForCategory(6uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BE383B0], "currentContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v29 = v12;
    v30 = 2112;
    v31 = v9;
    v32 = 2112;
    v33 = v8;
    _os_log_impl(&dword_20D6CC000, v11, OS_LOG_TYPE_DEFAULT, "Received request for asset url (connection: %@): %@:%@", buf, 0x20u);

  }
  -[CRSUIClusterThemeService themeDataProvider](self, "themeDataProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[CRSUIClusterThemeService themeDataProvider](self, "themeDataProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "getURLForAssetWithIdentifier:displayID:", v8, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
  }
  else
  {
    CRSUILogForCategory(6uLL);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[CRSUIClusterThemeService getURLForAssetWithIdentifier:displayID:reply:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);

    v25 = (void *)MEMORY[0x24BDD1540];
    v26 = *MEMORY[0x24BDD0FC8];
    v27 = CFSTR("Unable to retrieve asset url");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CarPlayUIServices.cluster-theme-service"), 1, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
  }

  v10[2](v10, v15, v16);
}

- (void)setThemeData:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  CRSUILogForCategory(6uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BE383B0], "currentContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "themeData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v17 = v9;
    v18 = 2112;
    v19 = v10;
    _os_log_impl(&dword_20D6CC000, v8, OS_LOG_TYPE_DEFAULT, "Received request to set theme data (connection: %@): %@", buf, 0x16u);

  }
  -[CRSUIClusterThemeService delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "themeData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __47__CRSUIClusterThemeService_setThemeData_reply___block_invoke;
  v14[3] = &unk_24C769898;
  v15 = v7;
  v13 = v7;
  objc_msgSend(v11, "clusterThemeService:didSetThemeData:completion:", self, v12, v14);

}

uint64_t __47__CRSUIClusterThemeService_setThemeData_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updateExtraAssetsURL:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *connectionQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CRSUILogForCategory(6uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl(&dword_20D6CC000, v5, OS_LOG_TYPE_DEFAULT, "service extraAssetsURL=%@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  connectionQueue = self->_connectionQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__CRSUIClusterThemeService_updateExtraAssetsURL___block_invoke;
  v8[3] = &unk_24C769870;
  objc_copyWeak(&v10, (id *)buf);
  v9 = v4;
  v7 = v4;
  dispatch_async(connectionQueue, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __49__CRSUIClusterThemeService_updateExtraAssetsURL___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(WeakRetained, "connections", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "remoteTarget");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "updateExtraAssetsURL:", *(_QWORD *)(a1 + 32));

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)_connectionQueue_addConnection:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  BSDispatchQueueAssert();
  -[CRSUIClusterThemeService connections](self, "connections");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)_connectionQueue_removeConnection:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  BSDispatchQueueAssert();
  -[CRSUIClusterThemeService connections](self, "connections");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (CRSUIClusterThemeDataProviding)themeDataProvider
{
  return (CRSUIClusterThemeDataProviding *)objc_loadWeakRetained((id *)&self->_themeDataProvider);
}

- (void)setThemeDataProvider:(id)a3
{
  objc_storeWeak((id *)&self->_themeDataProvider, a3);
}

- (CRSUIClusterThemeServiceDelegate)delegate
{
  return (CRSUIClusterThemeServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BSServiceConnectionListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (void)setConnectionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_connectionQueue, a3);
}

- (NSHashTable)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
  objc_storeStrong((id *)&self->_connections, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_themeDataProvider);
}

- (void)listener:(void *)a1 didReceiveConnection:(NSObject *)a2 withContext:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "remoteProcess");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_1(&dword_20D6CC000, a2, v4, "Process does not have the required entitlement: %@", (uint8_t *)&v5);

}

void __70__CRSUIClusterThemeService_listener_didReceiveConnection_withContext___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_1(&dword_20D6CC000, a2, a3, "Connection invalidated! %@", (uint8_t *)&v3);
}

- (void)getClusterThemeLayoutData:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20D6CC000, a1, a3, "No theme data provider set! Unable to complete request for cluster layouts", a5, a6, a7, a8, 0);
}

- (void)getURLForAssetWithIdentifier:(uint64_t)a3 displayID:(uint64_t)a4 reply:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20D6CC000, a1, a3, "No theme data provider set! Unable to complete request for assert URL", a5, a6, a7, a8, 0);
}

@end
