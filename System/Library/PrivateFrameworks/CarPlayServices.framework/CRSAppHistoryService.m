@implementation CRSAppHistoryService

- (CRSAppHistoryService)initWithDataProvider:(id)a3 applicationLibrary:(id)a4 policyEvaluator:(id)a5
{
  id v8;
  id v9;
  id v10;
  CRSAppHistoryService *v11;
  CRSAppHistoryService *v12;
  void *v13;
  uint64_t v14;
  OS_dispatch_queue *connectionQueue;
  uint64_t v16;
  NSHashTable *connections;
  void *v18;
  id *v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  id v23;
  _QWORD v25[4];
  id *v26;
  objc_super v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)CRSAppHistoryService;
  v11 = -[CRSAppHistoryService init](&v27, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_dataProvider, v8);
    objc_storeStrong((id *)&v12->_applicationLibrary, a4);
    objc_storeStrong((id *)&v12->_policyEvaluator, a5);
    -[CRSAppHistoryService _setupApplicationLibraryObservations](v12, "_setupApplicationLibraryObservations");
    -[CRSAppHistoryService _appLibraryUpdated:](v12, "_appLibraryUpdated:", v12->_applicationLibrary);
    objc_msgSend(MEMORY[0x24BE0BE18], "serial");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = BSDispatchQueueCreate();
    connectionQueue = v12->_connectionQueue;
    v12->_connectionQueue = (OS_dispatch_queue *)v14;

    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 512);
    v16 = objc_claimAutoreleasedReturnValue();
    connections = v12->_connections;
    v12->_connections = (NSHashTable *)v16;

    v18 = (void *)MEMORY[0x24BE0FA28];
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __80__CRSAppHistoryService_initWithDataProvider_applicationLibrary_policyEvaluator___block_invoke;
    v25[3] = &unk_24CD388E8;
    v19 = v12;
    v26 = v19;
    objc_msgSend(v18, "listenerWithConfigurator:", v25);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v19[2];
    v19[2] = (id)v20;

    CRSLogForCategory(0);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = v19[2];
      *(_DWORD *)buf = 138412290;
      v29 = v23;
      _os_log_impl(&dword_212138000, v22, OS_LOG_TYPE_INFO, "Activating listener! %@", buf, 0xCu);
    }

    objc_msgSend(v19[2], "activate");
  }

  return v12;
}

void __80__CRSAppHistoryService_initWithDataProvider_applicationLibrary_policyEvaluator___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setDomain:", CFSTR("com.apple.CarPlay"));
  objc_msgSend(MEMORY[0x24BE15210], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setService:", v3);

  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));
}

- (void)setInstrumentClusterURLs:(id)a3
{
  id v4;
  NSObject *v5;
  NSArray *v6;
  NSArray *instrumentClusterURLs;
  NSArray *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSArray *v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!-[NSArray isEqualToArray:](self->_instrumentClusterURLs, "isEqualToArray:", v4))
  {
    CRSLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v4;
      _os_log_impl(&dword_212138000, v5, OS_LOG_TYPE_DEFAULT, "Cluster URLs updated: %@", buf, 0xCu);
    }

    v6 = (NSArray *)objc_msgSend(v4, "copy");
    instrumentClusterURLs = self->_instrumentClusterURLs;
    self->_instrumentClusterURLs = v6;

    v8 = self->_instrumentClusterURLs;
    if (v8)
    {
      v11 = *MEMORY[0x24BE151C8];
      v12 = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("CRInstrumentClusterURLsDidChangeNotification"), 0, v9);

  }
}

- (void)invalidate
{
  -[FBSApplicationLibrary removeObserverForToken:](self->_applicationLibrary, "removeObserverForToken:", self->_installToken);
  -[FBSApplicationLibrary removeObserverForToken:](self->_applicationLibrary, "removeObserverForToken:", self->_uninstallToken);
  -[FBSApplicationLibrary removeObserverForToken:](self->_applicationLibrary, "removeObserverForToken:", self->_replaceToken);
  -[BSServiceConnectionListener invalidate](self->_listener, "invalidate");
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  char v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  _QWORD block[5];
  id v16;
  _QWORD v17[5];
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  CRSLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v6;
    _os_log_impl(&dword_212138000, v7, OS_LOG_TYPE_INFO, "Received connection! %@", buf, 0xCu);
  }

  objc_msgSend(v6, "remoteProcess");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasEntitlement:", CFSTR("com.apple.private.CarPlayServices.app-history"));

  if ((v9 & 1) == 0)
  {
    CRSLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CRSAppHistoryService listener:didReceiveConnection:withContext:].cold.1(v6);

  }
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __66__CRSAppHistoryService_listener_didReceiveConnection_withContext___block_invoke;
  v17[3] = &unk_24CD38938;
  v17[4] = self;
  objc_msgSend(v6, "configureConnection:", v17);
  CRSLogForCategory(1uLL);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v6;
    _os_log_impl(&dword_212138000, v12, OS_LOG_TYPE_INFO, "Activating connection... %@", buf, 0xCu);
  }

  -[CRSAppHistoryService connectionQueue](self, "connectionQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __66__CRSAppHistoryService_listener_didReceiveConnection_withContext___block_invoke_61;
  block[3] = &unk_24CD38960;
  block[4] = self;
  v16 = v6;
  v14 = v6;
  dispatch_async(v13, block);

}

void __66__CRSAppHistoryService_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v3 = (void *)MEMORY[0x24BE15210];
  v4 = a2;
  objc_msgSend(v3, "serviceQuality");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServiceQuality:", v5);

  objc_msgSend(MEMORY[0x24BE15210], "interface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterface:", v6);

  objc_msgSend(v4, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __66__CRSAppHistoryService_listener_didReceiveConnection_withContext___block_invoke_2;
  v8[3] = &unk_24CD38910;
  v8[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "setInvalidationHandler:", v8);
  objc_msgSend(*(id *)(a1 + 32), "connectionQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTargetQueue:", v7);

}

void __66__CRSAppHistoryService_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  CRSLogForCategory(1uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_212138000, v4, OS_LOG_TYPE_INFO, "Connection invalidated! %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_connectionQueue_removeConnection:", v3);
}

uint64_t __66__CRSAppHistoryService_listener_didReceiveConnection_withContext___block_invoke_61(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_connectionQueue_addConnection:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 40), "activate");
}

- (void)fetchUIContextStatesWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  CRSLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212138000, v5, OS_LOG_TYPE_DEFAULT, "Received request for UI context states.", buf, 2u);
  }

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__CRSAppHistoryService_fetchUIContextStatesWithCompletion___block_invoke;
  v7[3] = &unk_24CD38D10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

void __59__CRSAppHistoryService_fetchUIContextStatesWithCompletion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "dataProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getUIContextStatesWithCompletion:", *(_QWORD *)(a1 + 40));

}

- (void)fetchSessionUIContextStatesWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  CRSLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212138000, v5, OS_LOG_TYPE_DEFAULT, "Received request for session UI context states.", buf, 2u);
  }

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __66__CRSAppHistoryService_fetchSessionUIContextStatesWithCompletion___block_invoke;
  v7[3] = &unk_24CD38D10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

void __66__CRSAppHistoryService_fetchSessionUIContextStatesWithCompletion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "dataProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getSessionUIContextStatesWithCompletion:", *(_QWORD *)(a1 + 40));

}

- (void)fetchSessionEchoContextStatesWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  CRSLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212138000, v5, OS_LOG_TYPE_DEFAULT, "Received request for session UI context states.", buf, 2u);
  }

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __68__CRSAppHistoryService_fetchSessionEchoContextStatesWithCompletion___block_invoke;
  v7[3] = &unk_24CD38D10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

void __68__CRSAppHistoryService_fetchSessionEchoContextStatesWithCompletion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "dataProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getSessionEchoContextStatesWithCompletion:", *(_QWORD *)(a1 + 40));

}

- (void)setAnalyticsValues:(id)a3 onEvent:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  CRSLogForCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v21 = v12;
    _os_log_impl(&dword_212138000, v11, OS_LOG_TYPE_DEFAULT, "Received analytics values for current session, with %@ item(s).", buf, 0xCu);

  }
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __62__CRSAppHistoryService_setAnalyticsValues_onEvent_completion___block_invoke;
  v16[3] = &unk_24CD38D38;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], v16);

}

void __62__CRSAppHistoryService_setAnalyticsValues_onEvent_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "dataProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAnalyticsValues:onEvent:completion:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "unsignedIntegerValue"), *(_QWORD *)(a1 + 56));

}

- (void)serviceFetchInstrumentClusterURLs:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  char v12;
  uint8_t buf[16];

  v4 = a3;
  CRSLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212138000, v5, OS_LOG_TYPE_DEFAULT, "serviceFetchInstrumentClusterURLs: updating geo", buf, 2u);
  }

  -[CRSAppHistoryService policyEvaluator](self, "policyEvaluator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isGeoSupported");

  -[CRSAppHistoryService policyEvaluator](self, "policyEvaluator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __58__CRSAppHistoryService_serviceFetchInstrumentClusterURLs___block_invoke;
  v10[3] = &unk_24CD38D88;
  v12 = v7;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v8, "updateGeoSupportedWithCompletion:", v10);

}

void __58__CRSAppHistoryService_serviceFetchInstrumentClusterURLs___block_invoke(uint64_t a1, char a2)
{
  NSObject *v4;
  void *v5;
  _QWORD block[5];
  id v7;
  char v8;
  char v9;
  uint8_t buf[16];

  CRSLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212138000, v4, OS_LOG_TYPE_DEFAULT, "Geo support updated, updating URLs", buf, 2u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__CRSAppHistoryService_serviceFetchInstrumentClusterURLs___block_invoke_64;
  block[3] = &unk_24CD38D60;
  v8 = a2;
  v9 = *(_BYTE *)(a1 + 48);
  v5 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __58__CRSAppHistoryService_serviceFetchInstrumentClusterURLs___block_invoke_64(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (*(unsigned __int8 *)(a1 + 48) != *(unsigned __int8 *)(a1 + 49))
  {
    CRSLogForCategory(0);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_212138000, v2, OS_LOG_TYPE_DEFAULT, "Geo support changed, updating urls", (uint8_t *)&v9, 2u);
    }

    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "applicationLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_appLibraryUpdated:", v4);

  }
  CRSLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "instrumentClusterURLs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v6;
    _os_log_impl(&dword_212138000, v5, OS_LOG_TYPE_DEFAULT, "serviceFetchInstrumentClusterURLs: URLs supported: %{public}@", (uint8_t *)&v9, 0xCu);

  }
  v7 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "instrumentClusterURLs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v7 + 16))(v7, v8, 0);

}

- (void)fetchDockAppInCategory:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  CRSLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v6;
    _os_log_impl(&dword_212138000, v8, OS_LOG_TYPE_DEFAULT, "Received request for dock app in category %@.", buf, 0xCu);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__CRSAppHistoryService_fetchDockAppInCategory_completion___block_invoke;
  block[3] = &unk_24CD38DB0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __58__CRSAppHistoryService_fetchDockAppInCategory_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "dataProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchDockAppInCategory:completion:", objc_msgSend(*(id *)(a1 + 40), "unsignedIntegerValue"), *(_QWORD *)(a1 + 48));

}

- (void)_connectionQueue_addConnection:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRSAppHistoryService connections](self, "connections");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)_connectionQueue_removeConnection:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRSAppHistoryService connections](self, "connections");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)_setupApplicationLibraryObservations
{
  uint64_t v3;
  void *v4;
  void *v5;
  FBSALOToken *v6;
  FBSALOToken *installToken;
  void *v8;
  FBSALOToken *v9;
  FBSALOToken *uninstallToken;
  void *v11;
  FBSALOToken *v12;
  FBSALOToken *replaceToken;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __60__CRSAppHistoryService__setupApplicationLibraryObservations__block_invoke;
  v16[3] = &unk_24CD38DD8;
  objc_copyWeak(&v17, &location);
  v4 = (void *)MEMORY[0x212BE967C](v16);
  -[CRSAppHistoryService applicationLibrary](self, "applicationLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "observeDidAddApplicationsWithBlock:", v4);
  v6 = (FBSALOToken *)objc_claimAutoreleasedReturnValue();
  installToken = self->_installToken;
  self->_installToken = v6;

  -[CRSAppHistoryService applicationLibrary](self, "applicationLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "observeDidRemoveApplicationsWithBlock:", v4);
  v9 = (FBSALOToken *)objc_claimAutoreleasedReturnValue();
  uninstallToken = self->_uninstallToken;
  self->_uninstallToken = v9;

  -[CRSAppHistoryService applicationLibrary](self, "applicationLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v14[1] = 3221225472;
  v14[2] = __60__CRSAppHistoryService__setupApplicationLibraryObservations__block_invoke_3;
  v14[3] = &unk_24CD38E00;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v11, "observeDidReplaceApplicationsWithBlock:", v14);
  v12 = (FBSALOToken *)objc_claimAutoreleasedReturnValue();
  replaceToken = self->_replaceToken;
  self->_replaceToken = v12;

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __60__CRSAppHistoryService__setupApplicationLibraryObservations__block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__CRSAppHistoryService__setupApplicationLibraryObservations__block_invoke_2;
  block[3] = &unk_24CD38C98;
  block[4] = WeakRetained;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __60__CRSAppHistoryService__setupApplicationLibraryObservations__block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "applicationLibrary");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_appLibraryUpdated:", v2);

}

void __60__CRSAppHistoryService__setupApplicationLibraryObservations__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__CRSAppHistoryService__setupApplicationLibraryObservations__block_invoke_4;
  block[3] = &unk_24CD38C98;
  block[4] = WeakRetained;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __60__CRSAppHistoryService__setupApplicationLibraryObservations__block_invoke_4(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "applicationLibrary");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_appLibraryUpdated:", v2);

}

- (void)_appLibraryUpdated:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, uint64_t, _BYTE *);
  void *v23;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  CRSLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212138000, v5, OS_LOG_TYPE_DEFAULT, "App library updated", buf, 2u);
  }

  if (v4)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    objc_msgSend(v4, "applicationInfoForBundleIdentifier:", CFSTR("com.apple.Maps"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[CRSAppHistoryService policyEvaluator](self, "policyEvaluator");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isGeoSupported");

      if (v9)
      {
        v25 = 0;
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", CFSTR("com.apple.Maps"), 0, &v25);
        v11 = v25;
        objc_msgSend(v10, "carPlayInstrumentClusterURLSchemes");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        CRSLogForCategory(0);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v27 = v12;
          _os_log_impl(&dword_212138000, v13, OS_LOG_TYPE_DEFAULT, "Adding Maps URLs %{public}@", buf, 0xCu);
        }

        objc_msgSend(v6, "addObjectsFromArray:", v12);
      }
    }
    objc_msgSend(v4, "allInstalledApplications");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = MEMORY[0x24BDAC760];
    v21 = 3221225472;
    v22 = __43__CRSAppHistoryService__appLibraryUpdated___block_invoke;
    v23 = &unk_24CD38E28;
    v15 = v6;
    v24 = v15;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", &v20);

    CRSLogForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v15, "allObjects", v20, v21, v22, v23);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v17;
      _os_log_impl(&dword_212138000, v16, OS_LOG_TYPE_DEFAULT, "Setting new cluster URLs: %{public}@", buf, 0xCu);

    }
    objc_msgSend(v15, "allObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRSAppHistoryService setInstrumentClusterURLs:](self, "setInstrumentClusterURLs:", v18);

  }
  else
  {
    CRSLogForCategory(0);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[CRSAppHistoryService _appLibraryUpdated:].cold.1(v19);

    -[CRSAppHistoryService setInstrumentClusterURLs:](self, "setInstrumentClusterURLs:", MEMORY[0x24BDBD1A8]);
  }

}

void __43__CRSAppHistoryService__appLibraryUpdated___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[3];
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.Maps"));

  if ((v8 & 1) == 0)
  {
    v9 = objc_alloc(MEMORY[0x24BDC1540]);
    objc_msgSend(v6, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v11 = (void *)objc_msgSend(v9, "initWithBundleIdentifier:allowPlaceholder:error:", v10, 0, &v18);
    v12 = v18;

    if (v12)
    {
      CRSLogForCategory(0);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __43__CRSAppHistoryService__appLibraryUpdated___block_invoke_cold_1(v6);

    }
    else if (objc_msgSend(v11, "supportsCarPlayInstrumentClusterScene"))
    {
      CRSLogForCategory(0);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "bundleIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v21 = v15;
        _os_log_impl(&dword_212138000, v14, OS_LOG_TYPE_DEFAULT, "Adding default URLs for %{public}@", buf, 0xCu);

      }
      v16 = *(void **)(a1 + 32);
      v19[0] = CFSTR("maps:/car/instrumentcluster/instructioncard");
      v19[1] = CFSTR("maps:/car/instrumentcluster/map");
      v19[2] = CFSTR("maps:/car/instrumentcluster");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObjectsFromArray:", v17);

      *a4 = 1;
    }

  }
}

- (CRSAppHistoryDataProviding)dataProvider
{
  return (CRSAppHistoryDataProviding *)objc_loadWeakRetained((id *)&self->_dataProvider);
}

- (void)setDataProvider:(id)a3
{
  objc_storeWeak((id *)&self->_dataProvider, a3);
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

- (FBSApplicationLibrary)applicationLibrary
{
  return self->_applicationLibrary;
}

- (void)setApplicationLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_applicationLibrary, a3);
}

- (CRCarPlayAppPolicyEvaluator)policyEvaluator
{
  return self->_policyEvaluator;
}

- (void)setPolicyEvaluator:(id)a3
{
  objc_storeStrong((id *)&self->_policyEvaluator, a3);
}

- (FBSALOToken)installToken
{
  return self->_installToken;
}

- (void)setInstallToken:(id)a3
{
  objc_storeStrong((id *)&self->_installToken, a3);
}

- (FBSALOToken)uninstallToken
{
  return self->_uninstallToken;
}

- (void)setUninstallToken:(id)a3
{
  objc_storeStrong((id *)&self->_uninstallToken, a3);
}

- (FBSALOToken)replaceToken
{
  return self->_replaceToken;
}

- (void)setReplaceToken:(id)a3
{
  objc_storeStrong((id *)&self->_replaceToken, a3);
}

- (NSArray)instrumentClusterURLs
{
  return self->_instrumentClusterURLs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instrumentClusterURLs, 0);
  objc_storeStrong((id *)&self->_replaceToken, 0);
  objc_storeStrong((id *)&self->_uninstallToken, 0);
  objc_storeStrong((id *)&self->_installToken, 0);
  objc_storeStrong((id *)&self->_policyEvaluator, 0);
  objc_storeStrong((id *)&self->_applicationLibrary, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_destroyWeak((id *)&self->_dataProvider);
}

- (void)listener:(void *)a1 didReceiveConnection:withContext:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "remoteProcess");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1(&dword_212138000, v2, v3, "Process does not have the required entitlement: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

- (void)_appLibraryUpdated:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_212138000, log, OS_LOG_TYPE_ERROR, "Unable to update instrument cluster URLs, no application library available", v1, 2u);
}

void __43__CRSAppHistoryService__appLibraryUpdated___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1(&dword_212138000, v2, v3, "Error fetching app record for %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

@end
