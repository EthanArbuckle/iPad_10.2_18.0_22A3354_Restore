@implementation COService

- (COService)initWithListenerProvider:(id)a3 addOnProvider:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  COService *v12;
  COService *v13;
  COCoordinationServiceClientSet *v14;
  COCoordinationServiceClientSet *clients;
  NSDictionary *v16;
  NSDictionary *assertions;
  NSDictionary *v18;
  NSDictionary *addOns;
  uint64_t v20;
  OS_dispatch_queue *dispatchQueue;
  uint64_t v22;
  NSXPCListener *listener;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  NSXPCListener *v27;
  objc_super v29;
  uint8_t buf[4];
  COService *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  NSXPCListener *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v29.receiver = self;
  v29.super_class = (Class)COService;
  v12 = -[COService init](&v29, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_listenerProvider, a3);
    objc_storeStrong((id *)&v13->_addOnProvider, a4);
    objc_storeWeak((id *)&v13->_delegate, v11);
    v14 = objc_alloc_init(COCoordinationServiceClientSet);
    clients = v13->_clients;
    v13->_clients = v14;

    v16 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCE70]);
    assertions = v13->_assertions;
    v13->_assertions = v16;

    v18 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCE70]);
    addOns = v13->_addOns;
    v13->_addOns = v18;

    -[COServiceListenerProvider dispatchQueue](v13->_listenerProvider, "dispatchQueue");
    v20 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v13->_dispatchQueue;
    v13->_dispatchQueue = (OS_dispatch_queue *)v20;

    -[COServiceListenerProvider serviceListener](v13->_listenerProvider, "serviceListener");
    v22 = objc_claimAutoreleasedReturnValue();
    listener = v13->_listener;
    v13->_listener = (NSXPCListener *)v22;

    -[NSXPCListener _setQueue:](v13->_listener, "_setQueue:", v13->_dispatchQueue);
    -[NSXPCListener setDelegate:](v13->_listener, "setDelegate:", v13);
    COCoreLogForCategory(1);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v13->_listener;
      *(_DWORD *)buf = 134218498;
      v31 = v13;
      v32 = 2112;
      v33 = v26;
      v34 = 2112;
      v35 = v27;
      _os_log_impl(&dword_215E92000, v24, OS_LOG_TYPE_DEFAULT, "%p <%@> created with listener %@", buf, 0x20u);

    }
  }

  return v13;
}

- (void)_serviceReady
{
  -[NSXPCListener resume](self->_listener, "resume");
}

+ (BOOL)_isAllowedClient:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  int v11;
  _QWORD block[5];
  uint8_t buf[40];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__COService__isAllowedClient___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_isAllowedClient__once != -1)
    dispatch_once(&_isAllowedClient__once, block);
  if (v4)
    objc_msgSend(v4, "auditToken");
  memset(buf, 0, 32);
  v5 = 0;
  CPCopyBundleIdentifierAndTeamFromAuditToken();
  v6 = objc_msgSend(v4, "processIdentifier");
  if (v6 == getpid())
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v8 = 1;
      goto LABEL_12;
    }
    objc_msgSend(v4, "co_SetClientBundleIdentifier:", v5);
    v8 = 1;
  }
  else
  {
    COCoreLogForCategory(1);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_msgSend(v4, "processIdentifier");
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = a1;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = 0;
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = v11;
      *(_WORD *)&buf[28] = 2112;
      *(_QWORD *)&buf[30] = _isAllowedClient__sAllowedClients;
      _os_log_error_impl(&dword_215E92000, v9, OS_LOG_TYPE_ERROR, "%@ disallowed client %@ [%d] attempted to connect - allowed clients: %@", buf, 0x26u);
    }

    v8 = 0;
  }

LABEL_12:
  return v8;
}

void __30__COService__isAllowedClient___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("com.apple.coordinated"), CFSTR("com.apple.willowd"), CFSTR("com.apple.SoundBoard"), CFSTR("com.apple.homehubd"), CFSTR("com.apple.Coordination.cmdmesh"), CFSTR("com.apple.nexusd"), CFSTR("com.apple.homepodsettingsd"), CFSTR("com.apple.HomePlatformSettingsUI.HPSUIViewService"), CFSTR("com.apple.conductord"), CFSTR("com.apple.Home"), CFSTR("com.apple.homed"), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_isAllowedClient__sAllowedClients;
  _isAllowedClient__sAllowedClients = v2;

  if (objc_msgSend(MEMORY[0x24BE19E30], "isOpalEnabled"))
  {
    objc_msgSend((id)_isAllowedClient__sAllowedClients, "setByAddingObject:", CFSTR("com.apple.opal"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)_isAllowedClient__sAllowedClients;
    _isAllowedClient__sAllowedClients = v4;

  }
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arguments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "indexOfObject:", CFSTR("--allowed"));
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = v8 + 1;
    if (v8 + 1 < (unint64_t)objc_msgSend(v7, "count"))
    {
      objc_msgSend(v7, "objectAtIndex:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "componentsSeparatedByString:", CFSTR(","));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v13 = v11;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v24 != v16)
              objc_enumerationMutation(v13);
            objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "stringByTrimmingCharactersInSet:", v12);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v18, "length"))
            {
              objc_msgSend((id)_isAllowedClient__sAllowedClients, "setByAddingObject:", v18);
              v19 = objc_claimAutoreleasedReturnValue();
              v20 = (void *)_isAllowedClient__sAllowedClients;
              _isAllowedClient__sAllowedClients = v19;

            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        }
        while (v15);
      }

    }
  }
  COCoreLogForCategory(1);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218242;
    v28 = v22;
    v29 = 2112;
    v30 = _isAllowedClient__sAllowedClients;
    _os_log_impl(&dword_215E92000, v21, OS_LOG_TYPE_DEFAULT, "%p allowing %@", buf, 0x16u);
  }

}

- (id)clientForConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[COService clients](self, "clients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serviceClientForXPCConnection:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)currentClient
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[COService clientForConnection:](self, "clientForConnection:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)joinClusters:(id)a3 usingMeshController:(id)a4 withClusterIdentifier:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  -[COService dispatchQueue](self, "dispatchQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __79__COService_joinClusters_usingMeshController_withClusterIdentifier_completion___block_invoke;
  v16[3] = &unk_24D4B0EC8;
  v16[4] = self;
  v17 = v10;
  v18 = v9;
  v19 = v11;
  v13 = v11;
  v14 = v9;
  v15 = v10;
  dispatch_async(v12, v16);

}

uint64_t __79__COService_joinClusters_usingMeshController_withClusterIdentifier_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_addMesh:forClusters:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)leaveClusters:(id)a3 withClusterIdentifier:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a3;
  v8 = a5;
  -[COService dispatchQueue](self, "dispatchQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__COService_leaveClusters_withClusterIdentifier_completion___block_invoke;
  block[3] = &unk_24D4B0D28;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, block);

}

uint64_t __60__COService_leaveClusters_withClusterIdentifier_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_removeMeshForClusters:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  BOOL v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  COService *v20;
  id v21;
  id v22;
  id location;
  uint8_t buf[4];
  COService *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  COCoreLogForCategory(1);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v25 = self;
    v26 = 1024;
    v27 = objc_msgSend(v7, "processIdentifier");
    _os_log_impl(&dword_215E92000, v8, OS_LOG_TYPE_DEFAULT, "%p received new connection from %d", buf, 0x12u);
  }

  -[COService listenerProvider](self, "listenerProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)objc_opt_class(), "_isAllowedClient:", v7)
    && ((objc_opt_respondsToSelector() & 1) == 0
     || objc_msgSend(v9, "serviceShouldAcceptNewConnection:", v7)))
  {
    -[COService _configureServiceInterfacesOnConnection:](self, "_configureServiceInterfacesOnConnection:", v7);
    -[COService dispatchQueue](self, "dispatchQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setQueue:", v10);

    objc_initWeak((id *)buf, self);
    objc_initWeak(&location, v7);
    v16 = MEMORY[0x24BDAC760];
    v17 = 3221225472;
    v18 = __48__COService_listener_shouldAcceptNewConnection___block_invoke;
    v19 = &unk_24D4B3740;
    objc_copyWeak(&v21, (id *)buf);
    objc_copyWeak(&v22, &location);
    v20 = self;
    v11 = (void *)MEMORY[0x2199F3D40](&v16);
    objc_msgSend(v7, "setInterruptionHandler:", v11, v16, v17, v18, v19);
    objc_msgSend(v7, "setInvalidationHandler:", v11);
    v12 = -[COService _newClientForConnection:](self, "_newClientForConnection:", v7);
    -[COService clients](self, "clients");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addServiceClient:", v12);

    objc_msgSend(v7, "resume");
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
    v14 = 1;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __48__COService_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = v3;
  if (WeakRetained && v3)
  {
    COCoreLogForCategory(1);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v8 = 134218240;
      v9 = v6;
      v10 = 1024;
      v11 = objc_msgSend(v4, "processIdentifier");
      _os_log_impl(&dword_215E92000, v5, OS_LOG_TYPE_DEFAULT, "Service %p lost connection from %d", (uint8_t *)&v8, 0x12u);
    }

    objc_msgSend(WeakRetained, "clientForConnection:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(WeakRetained, "_clientLost:", v7);

  }
}

- (void)_takeAssertionForCluster:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  int v15;
  COService *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[COService dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  COCoreLogForCategory(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[COService _takeAssertionForCluster:].cold.1();

  if (-[COService _applicableToCluster:](self, "_applicableToCluster:", v4))
  {
    -[COService delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "takeAssertionForCluster:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[COService assertions](self, "assertions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (id)objc_msgSend(v11, "mutableCopy");

      if (!v12)
        v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      objc_msgSend(v12, "addObject:", v9);
      v13 = (void *)objc_msgSend(v10, "mutableCopy");
      objc_msgSend(v13, "setObject:forKey:", v12, v4);
      -[COService setAssertions:](self, "setAssertions:", v13);
      COCoreLogForCategory(1);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 134218754;
        v16 = self;
        v17 = 2048;
        v18 = v9;
        v19 = 2112;
        v20 = v4;
        v21 = 2048;
        v22 = objc_msgSend(v12, "count");
        _os_log_impl(&dword_215E92000, v14, OS_LOG_TYPE_DEFAULT, "%p took assertion %p for %@ (now %lu)", (uint8_t *)&v15, 0x2Au);
      }

    }
  }

}

- (void)_releaseAssertionForCluster:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  COService *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[COService dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  COCoreLogForCategory(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[COService _releaseAssertionForCluster:].cold.1();

  -[COService assertions](self, "assertions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "removeLastObject");
    v10 = (void *)objc_msgSend(v7, "mutableCopy");
    if (objc_msgSend(v9, "count"))
      objc_msgSend(v10, "setObject:forKey:", v9, v4);
    else
      objc_msgSend(v10, "removeObjectForKey:", v4);
    -[COService setAssertions:](self, "setAssertions:", v10);
    COCoreLogForCategory(1);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134218498;
      v13 = self;
      v14 = 2112;
      v15 = v4;
      v16 = 2048;
      v17 = objc_msgSend(v9, "count");
      _os_log_impl(&dword_215E92000, v11, OS_LOG_TYPE_DEFAULT, "%p released assertion for %@ (remaining %lu)", (uint8_t *)&v12, 0x20u);
    }

  }
}

- (BOOL)_applicableToCluster:(id)a3
{
  return 0;
}

- (void)_addOnForCluster:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  void (**v17)(_QWORD);
  uint64_t *v18;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint8_t buf[4];
  COService *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  -[COService dispatchQueue](self, "dispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__21;
  v24 = __Block_byref_object_dispose__21;
  v25 = 0;
  -[COService _addOnForCluster:](self, "_addOnForCluster:", v6);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v21[5];
  v21[5] = v9;

  if (v21[5])
  {
    v7[2](v7);
  }
  else if (-[COService _applicableToCluster:](self, "_applicableToCluster:", v6))
  {
    -[COService delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      COCoreLogForCategory(1);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v27 = self;
        v28 = 2112;
        v29 = v6;
        _os_log_impl(&dword_215E92000, v12, OS_LOG_TYPE_DEFAULT, "%p not in cluster %@ and will request creation", buf, 0x16u);
      }

      objc_initWeak((id *)buf, self);
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __41__COService__addOnForCluster_completion___block_invoke;
      v15[3] = &unk_24D4B1080;
      objc_copyWeak(&v19, (id *)buf);
      v18 = &v20;
      v16 = v6;
      v17 = v7;
      objc_msgSend(v11, "waitForClusterBootstrap:completion:", v16, v15);

      objc_destroyWeak(&v19);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      COCoreLogForCategory(1);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v27 = self;
        v28 = 2112;
        v29 = v6;
        _os_log_impl(&dword_215E92000, v14, OS_LOG_TYPE_DEFAULT, "%p not in cluster %@ and does not have delegate", buf, 0x16u);
      }

      ((void (*)(void (**)(_QWORD), _QWORD))v7[2])(v7, 0);
    }

  }
  else
  {
    COCoreLogForCategory(1);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v27 = self;
      v28 = 2112;
      v29 = v6;
      _os_log_impl(&dword_215E92000, v13, OS_LOG_TYPE_DEFAULT, "%p not in cluster %@ and cannot request creation", buf, 0x16u);
    }

    ((void (*)(void (**)(_QWORD), _QWORD))v7[2])(v7, 0);
  }
  _Block_object_dispose(&v20, 8);

}

void __41__COService__addOnForCluster_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;
  id v7;
  uint64_t v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "dispatchQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __41__COService__addOnForCluster_completion___block_invoke_2;
    v5[3] = &unk_24D4B3768;
    v8 = *(_QWORD *)(a1 + 48);
    v5[4] = v3;
    v6 = *(id *)(a1 + 32);
    v7 = *(id *)(a1 + 40);
    dispatch_async(v4, v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __41__COService__addOnForCluster_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_addOnForCluster:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  COCoreLogForCategory(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v10 = 134218498;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    v14 = 2048;
    v15 = v8;
    _os_log_impl(&dword_215E92000, v5, OS_LOG_TYPE_DEFAULT, "%p after cluster %@ creation request got %p", (uint8_t *)&v10, 0x20u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_addMesh:(id)a3 forClusters:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  COService *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[COService dispatchQueue](self, "dispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  COCoreLogForCategory(1);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v41 = self;
    v42 = 2048;
    v43 = v6;
    v44 = 2112;
    v45 = v7;
    _os_log_impl(&dword_215E92000, v9, OS_LOG_TYPE_DEFAULT, "%p will add %p for clusters %@", buf, 0x20u);
  }

  -[COService addOns](self, "addOns");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = 0;
    v16 = *(_QWORD *)v36;
    while (2)
    {
      v17 = 0;
      v18 = v14;
      do
      {
        if (*(_QWORD *)v36 != v16)
          objc_enumerationMutation(v11);
        objc_msgSend(v10, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v17));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v14, "meshController");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v6, "isEqual:", v19);

          if (!v20)
          {

            COCoreLogForCategory(1);
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              -[COService _addMesh:forClusters:].cold.1();

            -[COService _removeMeshForClusters:](self, "_removeMeshForClusters:", v11);
            goto LABEL_21;
          }
          v15 = 1;
        }
        ++v17;
        v18 = v14;
      }
      while (v13 != v17);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
      if (v13)
        continue;
      break;
    }

    if ((v15 & 1) != 0)
    {
      COCoreLogForCategory(1);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218498;
        v41 = self;
        v42 = 2048;
        v43 = v6;
        v44 = 2112;
        v45 = v11;
        _os_log_debug_impl(&dword_215E92000, v21, OS_LOG_TYPE_DEBUG, "%p already associated with %p for clusters %@", buf, 0x20u);
      }
      goto LABEL_32;
    }
  }
  else
  {

    v14 = 0;
  }
LABEL_21:
  v23 = v14;
  -[COService addOnProvider](self, "addOnProvider");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "serviceAddOn");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  COCoreLogForCategory(1);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    v41 = self;
    v42 = 2048;
    v43 = v14;
    v44 = 2048;
    v45 = v6;
    v46 = 2112;
    v47 = v11;
    _os_log_impl(&dword_215E92000, v25, OS_LOG_TYPE_DEFAULT, "%p associating %p with %p for clusters %@", buf, 0x2Au);
  }

  if (v14)
  {
    objc_msgSend(v6, "addAddOn:", v14);
    v21 = objc_msgSend(v10, "mutableCopy");
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v26 = v11;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v32 != v29)
            objc_enumerationMutation(v26);
          -[NSObject setObject:forKey:](v21, "setObject:forKey:", v14, *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i), (_QWORD)v31);
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      }
      while (v28);
    }

    -[COService setAddOns:](self, "setAddOns:", v21);
    -[COService _addOnAdded:](self, "_addOnAdded:", v14);
LABEL_32:

  }
}

- (void)_removeMeshForClusters:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  COService *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[COService dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  COCoreLogForCategory(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v24 = self;
    v25 = 2112;
    v26 = v4;
    _os_log_impl(&dword_215E92000, v6, OS_LOG_TYPE_DEFAULT, "%p will remove from clusters %@", buf, 0x16u);
  }

  -[COService addOns](self, "addOns");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "meshController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  COCoreLogForCategory(1);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    v24 = self;
    v25 = 2048;
    v26 = v9;
    v27 = 2048;
    v28 = v10;
    v29 = 2112;
    v30 = v4;
    _os_log_impl(&dword_215E92000, v11, OS_LOG_TYPE_DEFAULT, "%p disassociating %p with %p for clusters %@", buf, 0x2Au);
  }

  if (v9)
  {
    if (v10)
      objc_msgSend(v10, "removeAddOn:", v9);
    -[COService _addOnRemoved:](self, "_addOnRemoved:", v9);
    v12 = (void *)objc_msgSend(v7, "mutableCopy");
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v13 = v4;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v19;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v19 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(v12, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v17++), (_QWORD)v18);
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v15);
    }

    -[COService setAddOns:](self, "setAddOns:", v12);
  }

}

- (id)_clustersForAddOn:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[COService dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  -[COService addOns](self, "addOns");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "isEqual:", v4))
          objc_msgSend(v6, "addObject:", v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  return v6;
}

- (id)_addOnForCluster:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[COService dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[COService addOns](self, "addOns");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_uniqueAddOns
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  -[COService dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = objc_alloc(MEMORY[0x24BDBCF20]);
  -[COService addOns](self, "addOns");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithArray:", v6);

  return v7;
}

- (id)_newClientForConnection:(id)a3
{
  id v3;
  COCoordinationServiceClient *v4;

  v3 = a3;
  v4 = -[COCoordinationServiceClient initWithConnection:]([COCoordinationServiceClient alloc], "initWithConnection:", v3);

  return v4;
}

- (void)_configureServiceInterfacesOnConnection:(id)a3
{
  NSObject *v3;

  -[COService dispatchQueue](self, "dispatchQueue", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

}

- (void)_clientLost:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  COService *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[COService dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  COCoreLogForCategory(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = 134218242;
    v9 = self;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_215E92000, v6, OS_LOG_TYPE_INFO, "%p lost connection for client %@", (uint8_t *)&v8, 0x16u);
  }

  -[COService clients](self, "clients");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeServiceClient:", v4);

}

- (void)_addOnAdded:(id)a3
{
  NSObject *v3;

  -[COService dispatchQueue](self, "dispatchQueue", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

}

- (void)_addOnRemoved:(id)a3
{
  NSObject *v3;

  -[COService dispatchQueue](self, "dispatchQueue", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

}

- (COServiceListenerProvider)listenerProvider
{
  return self->_listenerProvider;
}

- (COServiceAddOnProvider)addOnProvider
{
  return self->_addOnProvider;
}

- (COServiceDelegate)delegate
{
  return (COServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (COCoordinationServiceClientSet)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDictionary)assertions
{
  return self->_assertions;
}

- (void)setAssertions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDictionary)addOns
{
  return self->_addOns;
}

- (void)setAddOns:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addOns, 0);
  objc_storeStrong((id *)&self->_assertions, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_addOnProvider, 0);
  objc_storeStrong((id *)&self->_listenerProvider, 0);
}

- (void)_takeAssertionForCluster:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_6(&dword_215E92000, v0, v1, "%p attempting to take assertion for %@");
  OUTLINED_FUNCTION_2_0();
}

- (void)_releaseAssertionForCluster:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_6(&dword_215E92000, v0, v1, "%p attempting to release assertion for %@");
  OUTLINED_FUNCTION_2_0();
}

- (void)_addMesh:forClusters:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6_0();
  _os_log_error_impl(&dword_215E92000, v0, OS_LOG_TYPE_ERROR, "%p will remove existing use before add of clusters %@", v1, 0x16u);
  OUTLINED_FUNCTION_2_0();
}

@end
