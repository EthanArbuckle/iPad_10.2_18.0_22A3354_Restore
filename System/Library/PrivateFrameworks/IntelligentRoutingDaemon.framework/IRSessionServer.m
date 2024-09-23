@implementation IRSessionServer

uint64_t __93__IRSessionServer_IRServiceContainerDelegate__serviceContainer_didUpdateContexts_withReason___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didUpdateContexts:withReason:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)_refreshUpdateModeForServiceIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v4 = a3;
  -[IRSessionServer services](self, "services");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v12, "getUpdateMode");
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("mode"), &unk_25105EB88);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRSessionServer connections](self, "connections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "filteredArrayUsingPredicate:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count") != 0;

  if (v6 != v11)
    objc_msgSend(v12, "setUpdateMode:", v11);

}

- (NSMutableDictionary)connections
{
  return self->_connections;
}

- (void)refreshUpdateModeForServiceIdentifier:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[IRSessionServer services](self, "services");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[IRSessionServer _refreshUpdateModeForServiceIdentifier:](self, "_refreshUpdateModeForServiceIdentifier:", v4);
  }
  else
  {
    v8 = *MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
      -[IRSessionServer refreshUpdateModeForServiceIdentifier:].cold.1((uint64_t)v4, v8, v9);
  }
  os_unfair_lock_unlock(p_lock);

}

- (NSMutableDictionary)services
{
  return self->_services;
}

- (void)serviceContainer:(id)a3 didUpdateContexts:(id)a4 withReason:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __93__IRSessionServer_IRServiceContainerDelegate__serviceContainer_didUpdateContexts_withReason___block_invoke;
  v12[3] = &unk_251044100;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[IRSessionServer _dispatchToConnectionsForServiceContainer:usingBlock:](self, "_dispatchToConnectionsForServiceContainer:usingBlock:", a3, v12);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (IRSessionServer)initWithQueue:(id)a3
{
  id v4;
  IRSessionServer *v5;
  IRSessionServer *v6;
  void *v7;
  void *v8;
  IRAVOutputDeviceProvider *v9;
  IRAVOutputDeviceDiscoverySessionController *v10;
  void *v11;
  IRAVOutputDeviceDiscoverySessionController *v12;
  void *v13;
  IRPersistenceManager *v14;
  IRBiomeProvider *v15;
  void *v16;
  void *v17;
  void *v18;
  IRRapportProvider *v19;
  IRProximityProvider *v20;
  IRBackgroundActivitiesManager *v21;
  IRDisplayMonitor *v22;
  IRAVOutputContextController *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  dispatch_queue_t v30;
  uint64_t v32;
  id v33;
  id location;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)IRSessionServer;
  v5 = -[IRSessionServer init](&v35, sel_init);
  v6 = v5;
  if (v5)
  {
    -[IRSessionServer setQueue:](v5, "setQueue:", v4);
    -[IRSessionServer setLock:](v6, "setLock:", 0);
    v7 = (void *)objc_opt_new();
    -[IRSessionServer setConnections:](v6, "setConnections:", v7);

    v8 = (void *)objc_opt_new();
    -[IRSessionServer setServices:](v6, "setServices:", v8);

    v9 = objc_alloc_init(IRAVOutputDeviceProvider);
    -[IRSessionServer setAvOutputDeviceProvider:](v6, "setAvOutputDeviceProvider:", v9);

    v10 = [IRAVOutputDeviceDiscoverySessionController alloc];
    -[IRSessionServer avOutputDeviceProvider](v6, "avOutputDeviceProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[IRAVOutputDeviceDiscoverySessionController initWithAVOutputDeviceProvider:](v10, "initWithAVOutputDeviceProvider:", v11);
    -[IRSessionServer avOutputDeviceProvider](v6, "avOutputDeviceProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDiscoverySessionController:", v12);

    v14 = objc_alloc_init(IRPersistenceManager);
    -[IRSessionServer setPersistenceManager:](v6, "setPersistenceManager:", v14);

    v15 = objc_alloc_init(IRBiomeProvider);
    -[IRSessionServer setBiomeProvider:](v6, "setBiomeProvider:", v15);

    -[IRSessionServer biomeProvider](v6, "biomeProvider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "createStandardBiomeInterface");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRSessionServer biomeProvider](v6, "biomeProvider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBiomeInterface:", v17);

    v19 = objc_alloc_init(IRRapportProvider);
    -[IRSessionServer setRapportProvider:](v6, "setRapportProvider:", v19);

    v20 = objc_alloc_init(IRProximityProvider);
    -[IRSessionServer setProximityProvider:](v6, "setProximityProvider:", v20);

    v21 = -[IRBackgroundActivitiesManager initWithServer:]([IRBackgroundActivitiesManager alloc], "initWithServer:", v6);
    -[IRSessionServer setBackgroundActivitiesManager:](v6, "setBackgroundActivitiesManager:", v21);

    v22 = objc_alloc_init(IRDisplayMonitor);
    -[IRSessionServer setDisplayMonitor:](v6, "setDisplayMonitor:", v22);

    v23 = -[IRAVOutputContextController initWithOutputContextType:]([IRAVOutputContextController alloc], "initWithOutputContextType:", 0);
    -[IRSessionServer setAudioAVOutputContextController:](v6, "setAudioAVOutputContextController:", v23);

    -[IRSessionServer persistenceManager](v6, "persistenceManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v17) = objc_msgSend(v24, "connectToStore");

    if ((_DWORD)v17)
    {
      -[IRSessionServer persistenceManager](v6, "persistenceManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[IRServiceStore idendifyAndDeleteDuplicateServicesWithWithPersistenceManager:](IRServiceStore, "idendifyAndDeleteDuplicateServicesWithWithPersistenceManager:", v25);

      -[IRSessionServer persistenceManager](v6, "persistenceManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[IRServiceStore adjustDBToStaticTokens:](IRServiceStore, "adjustDBToStaticTokens:", v26);

      -[IRSessionServer persistenceManager](v6, "persistenceManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[IRServiceStore adjustFirstSeenDateOfCandidates:](IRServiceStore, "adjustFirstSeenDateOfCandidates:", v27);

    }
    else
    {
      v28 = *MEMORY[0x24BE5B270];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
        -[IRSessionServer initWithQueue:].cold.1(v28);
    }
    objc_initWeak(&location, v6);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = dispatch_queue_create("com.apple.intelligentroutingd.stateCapture", v29);
    v32 = MEMORY[0x24BDAC760];
    objc_copyWeak(&v33, &location);
    -[IRSessionServer setStateCaptureHandle:](v6, "setStateCaptureHandle:", os_state_add_handler(), v32, 3221225472, __33__IRSessionServer_initWithQueue___block_invoke, &unk_251044020);

    notify_post((const char *)objc_msgSend((id)*MEMORY[0x24BE5B2B0], "UTF8String"));
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }

  return v6;
}

uint64_t __33__IRSessionServer_initWithQueue___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v3;

  if (*(_DWORD *)(a2 + 16) == 3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v3 = WeakRetained;
    if (WeakRetained)
      objc_msgSend(WeakRetained, "_logStateOnStateCaptureEvent");

  }
  return 0;
}

- (id)registerWithServiceIdentifier:(id)a3 withConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  IRServiceContainer *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  IRServiceContainer *v40;
  void *v41;
  void *v42;
  os_unfair_lock_t lock;
  uint8_t buf[4];
  id v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[IRSessionServer connections](self, "connections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[IRSessionServer connections](self, "connections");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsObject:", v7);

    if (v12)
    {
      v13 = (id)*MEMORY[0x24BE5B270];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v35 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v7, "client");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "connection");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "numberWithInt:", objc_msgSend(v37, "processIdentifier"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v45 = v6;
        v46 = 2112;
        v47 = v38;
        _os_log_error_impl(&dword_23FFBA000, v13, OS_LOG_TYPE_ERROR, "#session-server, [ErrorId - Duplicate connection] Registering the same connection twice: %@ for pid: %@", buf, 0x16u);

      }
LABEL_6:
      v14 = 0;
      goto LABEL_14;
    }
  }
  else
  {
    v15 = (void *)objc_opt_new();
    -[IRSessionServer connections](self, "connections");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v6);

  }
  -[IRSessionServer connections](self, "connections");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObject:", v7);

  -[IRSessionServer services](self, "services");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", v6);
  v14 = (IRServiceContainer *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v40 = [IRServiceContainer alloc];
    -[IRSessionServer avOutputDeviceProvider](self, "avOutputDeviceProvider");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRSessionServer biomeProvider](self, "biomeProvider");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRSessionServer rapportProvider](self, "rapportProvider");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRSessionServer proximityProvider](self, "proximityProvider");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRSessionServer persistenceManager](self, "persistenceManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRSessionServer displayMonitor](self, "displayMonitor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRSessionServer audioAVOutputContextController](self, "audioAVOutputContextController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRSessionServer persistenceManager](self, "persistenceManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v39) = +[IRSessionServer isGlobalLowLatencyMiLoWithPersistenceManager:](IRSessionServer, "isGlobalLowLatencyMiLoWithPersistenceManager:", v25);
    v14 = -[IRServiceContainer initWithServiceIdentifier:delegate:avOutputDeviceProvider:biomeProvider:rapportProvider:proximityProvider:persistenceManager:displayMonitor:audioAVOutputContextController:isLowLatencyMiLo:](v40, "initWithServiceIdentifier:delegate:avOutputDeviceProvider:biomeProvider:rapportProvider:proximityProvider:persistenceManager:displayMonitor:audioAVOutputContextController:isLowLatencyMiLo:", v6, self, v42, v41, v20, v21, v22, v23, v24, v39);

    if (!v14)
    {
      v33 = *MEMORY[0x24BE5B270];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
        -[IRSessionServer registerWithServiceIdentifier:withConnection:].cold.1((uint64_t)v6, v33, v34);
      goto LABEL_6;
    }
    -[IRSessionServer services](self, "services");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v14, v6);

  }
  -[IRServiceContainer requestUpdatedBundlesWithSignificantInteraction](v14, "requestUpdatedBundlesWithSignificantInteraction");
  v27 = (id)*MEMORY[0x24BE5B270];
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v7, "client");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "connection");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "numberWithInt:", objc_msgSend(v30, "processIdentifier"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v45 = v6;
    v46 = 2112;
    v47 = v31;
    _os_log_impl(&dword_23FFBA000, v27, OS_LOG_TYPE_DEFAULT, "#session-server, New connection registered for serviceIdentifier: %@ and pid: %@", buf, 0x16u);

  }
  -[IRSessionServer _logConnectionsAndServices](self, "_logConnectionsAndServices");
LABEL_14:
  os_unfair_lock_unlock(lock);

  return v14;
}

- (BOOL)unregisterWithServiceIdentifier:(id)a3 withConnection:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_lock;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  id v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[IRSessionServer connections](self, "connections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", v7);

  if ((v11 & 1) == 0)
  {
    v19 = (id)*MEMORY[0x24BE5B270];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v7, "client");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "connection");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "numberWithInt:", objc_msgSend(v22, "processIdentifier"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 138412546;
      v40 = v6;
      v41 = 2112;
      v42 = v23;
      _os_log_error_impl(&dword_23FFBA000, v19, OS_LOG_TYPE_ERROR, "#session-server, [ErrorId - Unregister unavailable connection] Unregistering a connection which is not available: %@ for pid: %@", (uint8_t *)&v39, 0x16u);

    }
    goto LABEL_9;
  }
  -[IRSessionServer services](self, "services");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v19 = (id)*MEMORY[0x24BE5B270];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v35 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v7, "client");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "connection");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "numberWithInt:", objc_msgSend(v37, "processIdentifier"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 138412546;
      v40 = v6;
      v41 = 2112;
      v42 = v38;
      _os_log_error_impl(&dword_23FFBA000, v19, OS_LOG_TYPE_ERROR, "#session-server, [ErrorId - Unregister unavailable identifier] Unregistering a serviceIdentifier which is not available: %@ for pid: %@", (uint8_t *)&v39, 0x16u);

    }
LABEL_9:

    v24 = 0;
    goto LABEL_14;
  }
  -[IRSessionServer connections](self, "connections");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeObject:", v7);

  -[IRSessionServer connections](self, "connections");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18)
  {
    -[IRSessionServer _refreshUpdateModeForServiceIdentifier:](self, "_refreshUpdateModeForServiceIdentifier:", v6);
  }
  else
  {
    -[IRSessionServer connections](self, "connections");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "removeObjectForKey:", v6);

    -[IRSessionServer services](self, "services");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKeyedSubscript:", v6);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "deallocSync");

    -[IRSessionServer services](self, "services");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "removeObjectForKey:", v6);

  }
  v29 = (id)*MEMORY[0x24BE5B270];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v30 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v7, "client");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "connection");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "numberWithInt:", objc_msgSend(v32, "processIdentifier"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 138412546;
    v40 = v6;
    v41 = 2112;
    v42 = v33;
    _os_log_impl(&dword_23FFBA000, v29, OS_LOG_TYPE_DEFAULT, "#session-server, Unregister connection for serviceIdentifier: %@ and pid: %@", (uint8_t *)&v39, 0x16u);

  }
  -[IRSessionServer _logConnectionsAndServices](self, "_logConnectionsAndServices");
  v24 = 1;
LABEL_14:
  os_unfair_lock_unlock(p_lock);

  return v24;
}

- (BOOL)shouldAcceptNewConnection:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  IRSessionClientProxy *v6;
  IRSessionConnection *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id location;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = -[IRSessionClientProxy initWithConnection:]([IRSessionClientProxy alloc], "initWithConnection:", v4);
  if (v6)
  {
    v7 = -[IRSessionConnection initWithServer:client:]([IRSessionConnection alloc], "initWithServer:client:", self, v6);
    IRMakeXPCServerInterface();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setExportedInterface:", v8);

    IRMakeXPCClientInterface();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRemoteObjectInterface:", v9);

    objc_msgSend(v4, "setExportedObject:", v7);
    objc_initWeak(&location, v7);
    v10 = MEMORY[0x24BDAC760];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __45__IRSessionServer_shouldAcceptNewConnection___block_invoke;
    v17[3] = &unk_251043FF8;
    objc_copyWeak(&v18, &location);
    objc_msgSend(v4, "setInterruptionHandler:", v17);
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __45__IRSessionServer_shouldAcceptNewConnection___block_invoke_2;
    v15[3] = &unk_251043FF8;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v4, "setInvalidationHandler:", v15);
    objc_msgSend(v4, "resume");
    v11 = (id)*MEMORY[0x24BE5B270];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v4, "processIdentifier"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v21 = v12;
      _os_log_impl(&dword_23FFBA000, v11, OS_LOG_TYPE_DEFAULT, "#session-server, Accepting connection for pid: %@", buf, 0xCu);

    }
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    v7 = (IRSessionConnection *)(id)*MEMORY[0x24BE5B270];
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v4, "processIdentifier"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[IRSessionServer shouldAcceptNewConnection:].cold.1(v13, (uint64_t)buf, &v7->super);
    }
  }

  os_unfair_lock_unlock(p_lock);
  return v6 != 0;
}

void __45__IRSessionServer_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "xpcInvalidationHandler");

}

void __45__IRSessionServer_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "xpcInterruptionHandler");

}

- (void)performXPCActivityUnderServerContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[IRSessionServer queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__IRSessionServer_performXPCActivityUnderServerContext___block_invoke;
  v7[3] = &unk_251044048;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  IRDispatchAsyncWithStrongSelf(v5, self, v7);

}

void __56__IRSessionServer_performXPCActivityUnderServerContext___block_invoke(uint64_t a1, void *a2)
{
  os_unfair_lock_s *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
  os_unfair_lock_lock(v3);
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v7, "persistenceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "services");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v4 + 16))(v4, v5, v6);

  os_unfair_lock_unlock(v3);
}

+ (BOOL)isGlobalLowLatencyMiLoWithPersistenceManager:(id)a3
{
  id v3;
  uint64_t i;
  void *v5;
  IRServiceStore *v6;
  void *v7;
  id v8;
  IRServiceStore *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  BOOL v17;
  id obj;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "connectToStore"))
  {
    +[IRServiceStore fetchAllServicesWithPersistenceManager:](IRServiceStore, "fetchAllServicesWithPersistenceManager:", v3);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v21)
    {
      v20 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v23 != v20)
            objc_enumerationMutation(obj);
          v5 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          v6 = [IRServiceStore alloc];
          objc_msgSend(v5, "serviceIdentifier");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = v3;
          v9 = -[IRServiceStore initWithPersistenceManager:serviceIdentifier:](v6, "initWithPersistenceManager:serviceIdentifier:", v3, v7);

          IRCreateServicePackageAdapter(objc_msgSend(v5, "servicePackage"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[IRServiceStore fetchCandidatesContainer](v9, "fetchCandidatesContainer");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          +[IRPreferences shared](IRPreferences, "shared");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "numberOfHistoryEventsInCache");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[IRServiceStore fetchHistoryEventsContainerWithLimit:](v9, "fetchHistoryEventsContainerWithLimit:", objc_msgSend(v13, "unsignedIntValue"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "historyEvents");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v10, "shouldAskForLowLatencyMiLo:historyEventsAsc:", v11, v15);

          if ((v16 & 1) != 0)
          {
            v17 = 1;
            v3 = v8;
            goto LABEL_13;
          }
          v3 = v8;
        }
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v21)
          continue;
        break;
      }
    }
    v17 = 0;
LABEL_13:

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)dealloc
{
  objc_super v3;

  -[IRSessionServer stateCaptureHandle](self, "stateCaptureHandle");
  os_state_remove_handler();
  v3.receiver = self;
  v3.super_class = (Class)IRSessionServer;
  -[IRSessionServer dealloc](&v3, sel_dealloc);
}

- (void)_logConnectionsAndServices
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)*MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    v5 = v3;
    -[IRSessionServer services](self, "services");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v7;
    _os_log_impl(&dword_23FFBA000, v5, OS_LOG_TYPE_DEFAULT, "#session-server, Number of active services: %@", (uint8_t *)&v9, 0xCu);

  }
  -[IRSessionServer connections](self, "connections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_4);

}

void __45__IRSessionServer__logConnectionsAndServices__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = (void *)*MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x24BDD16E0];
    v7 = v5;
    objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(a3, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v4;
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_23FFBA000, v7, OS_LOG_TYPE_DEFAULT, "#session-server, [%@]: number of active connections: %@", (uint8_t *)&v9, 0x16u);

  }
}

- (void)_logStateOnStateCaptureEvent
{
  os_log_t *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  os_log_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  os_log_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  os_log_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = (os_log_t *)MEMORY[0x24BE5B280];
  v4 = (void *)*MEMORY[0x24BE5B280];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B280], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    +[IRPreferences shared](IRPreferences, "shared");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferenceString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138412290;
    v23 = v7;
    _os_log_impl(&dword_23FFBA000, v5, OS_LOG_TYPE_DEFAULT, "#session-server, %@", (uint8_t *)&v22, 0xCu);

  }
  v8 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    -[IRSessionServer persistenceManager](self, "persistenceManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[IRServiceStore generateLogForStringNumEntitiesInDatabaseWithPersistenceManager:](IRServiceStore, "generateLogForStringNumEntitiesInDatabaseWithPersistenceManager:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138412290;
    v23 = v11;
    _os_log_impl(&dword_23FFBA000, v9, OS_LOG_TYPE_DEFAULT, "#session-server, %@", (uint8_t *)&v22, 0xCu);

  }
  v12 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    -[IRSessionServer persistenceManager](self, "persistenceManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[IRServiceStore generateLogForServicesDatabaseWithPersistenceManager:](IRServiceStore, "generateLogForServicesDatabaseWithPersistenceManager:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138412290;
    v23 = v15;
    _os_log_impl(&dword_23FFBA000, v13, OS_LOG_TYPE_DEFAULT, "#session-server, %@", (uint8_t *)&v22, 0xCu);

  }
  -[IRSessionServer rapportProvider](self, "rapportProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "logActiveDevices");

  -[IRSessionServer avOutputDeviceProvider](self, "avOutputDeviceProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "logActiveDevices");

  v18 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    v19 = v18;
    +[IRAirPlaySettings shared](IRAirPlaySettings, "shared");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dumpState");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138412290;
    v23 = v21;
    _os_log_impl(&dword_23FFBA000, v19, OS_LOG_TYPE_DEFAULT, "#session-server, %@", (uint8_t *)&v22, 0xCu);

  }
}

- (IRPersistenceManager)persistenceManager
{
  return self->_persistenceManager;
}

- (void)setPersistenceManager:(id)a3
{
  objc_storeStrong((id *)&self->_persistenceManager, a3);
}

- (IRBiomeProvider)biomeProvider
{
  return self->_biomeProvider;
}

- (void)setBiomeProvider:(id)a3
{
  objc_storeStrong((id *)&self->_biomeProvider, a3);
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void)setConnections:(id)a3
{
  objc_storeStrong((id *)&self->_connections, a3);
}

- (void)setServices:(id)a3
{
  objc_storeStrong((id *)&self->_services, a3);
}

- (IRAVOutputDeviceProvider)avOutputDeviceProvider
{
  return self->_avOutputDeviceProvider;
}

- (void)setAvOutputDeviceProvider:(id)a3
{
  objc_storeStrong((id *)&self->_avOutputDeviceProvider, a3);
}

- (IRRapportProvider)rapportProvider
{
  return self->_rapportProvider;
}

- (void)setRapportProvider:(id)a3
{
  objc_storeStrong((id *)&self->_rapportProvider, a3);
}

- (IRProximityProvider)proximityProvider
{
  return self->_proximityProvider;
}

- (void)setProximityProvider:(id)a3
{
  objc_storeStrong((id *)&self->_proximityProvider, a3);
}

- (IRBackgroundActivitiesManager)backgroundActivitiesManager
{
  return self->_backgroundActivitiesManager;
}

- (void)setBackgroundActivitiesManager:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundActivitiesManager, a3);
}

- (IRDisplayMonitor)displayMonitor
{
  return self->_displayMonitor;
}

- (void)setDisplayMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_displayMonitor, a3);
}

- (IRAVOutputContextController)audioAVOutputContextController
{
  return self->_audioAVOutputContextController;
}

- (void)setAudioAVOutputContextController:(id)a3
{
  objc_storeStrong((id *)&self->_audioAVOutputContextController, a3);
}

- (unint64_t)stateCaptureHandle
{
  return self->_stateCaptureHandle;
}

- (void)setStateCaptureHandle:(unint64_t)a3
{
  self->_stateCaptureHandle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioAVOutputContextController, 0);
  objc_storeStrong((id *)&self->_displayMonitor, 0);
  objc_storeStrong((id *)&self->_backgroundActivitiesManager, 0);
  objc_storeStrong((id *)&self->_proximityProvider, 0);
  objc_storeStrong((id *)&self->_rapportProvider, 0);
  objc_storeStrong((id *)&self->_avOutputDeviceProvider, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_biomeProvider, 0);
  objc_storeStrong((id *)&self->_persistenceManager, 0);
}

- (void)_dispatchToConnectionsForServiceContainer:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[IRSessionServer queue](self, "queue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __100__IRSessionServer_IRServiceContainerDelegate___dispatchToConnectionsForServiceContainer_usingBlock___block_invoke;
  v11[3] = &unk_2510440D8;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  IRDispatchAsyncWithStrongSelf(v8, self, v11);

}

void __100__IRSessionServer_IRServiceContainerDelegate___dispatchToConnectionsForServiceContainer_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  os_unfair_lock_s *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v7 = a2;
  v3 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
  os_unfair_lock_lock(v3);
  objc_msgSend(*(id *)(a1 + 40), "serviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v7, "connections");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __100__IRSessionServer_IRServiceContainerDelegate___dispatchToConnectionsForServiceContainer_usingBlock___block_invoke_2;
    v8[3] = &unk_2510440B0;
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

  }
  os_unfair_lock_unlock(v3);

}

uint64_t __100__IRSessionServer_IRServiceContainerDelegate___dispatchToConnectionsForServiceContainer_usingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)serviceContainer:(id)a3 didSpotOnLocationCompleteForClientIds:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __112__IRSessionServer_IRServiceContainerDelegate__serviceContainer_didSpotOnLocationCompleteForClientIds_withError___block_invoke;
  v12[3] = &unk_251044100;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[IRSessionServer _dispatchToConnectionsForServiceContainer:usingBlock:](self, "_dispatchToConnectionsForServiceContainer:usingBlock:", a3, v12);

}

void __112__IRSessionServer_IRServiceContainerDelegate__serviceContainer_didSpotOnLocationCompleteForClientIds_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v7 = v3;
  objc_msgSend(v3, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v6);

  if ((_DWORD)v4)
    objc_msgSend(v7, "didSpotOnLocationComplete:", *(_QWORD *)(a1 + 40));

}

- (void)serviceContainer:(id)a3 didUpdateBundlesWithSignificantInteractionPattern:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __114__IRSessionServer_IRServiceContainerDelegate__serviceContainer_didUpdateBundlesWithSignificantInteractionPattern___block_invoke;
  v8[3] = &unk_251044128;
  v9 = v6;
  v7 = v6;
  -[IRSessionServer _dispatchToConnectionsForServiceContainer:usingBlock:](self, "_dispatchToConnectionsForServiceContainer:usingBlock:", a3, v8);

}

uint64_t __114__IRSessionServer_IRServiceContainerDelegate__serviceContainer_didUpdateBundlesWithSignificantInteractionPattern___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didUpdateBundlesWithSignificantInteractionPattern:", *(_QWORD *)(a1 + 32));
}

- (void)initWithQueue:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23FFBA000, log, OS_LOG_TYPE_ERROR, "#session-server, [ErrorId - Server Init - DB access error] Cannot connect to store during server init", v1, 2u);
}

- (void)registerWithServiceIdentifier:(uint64_t)a3 withConnection:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_23FFBA000, a2, a3, "#session-server, [ErrorId - Service create error] Could not create a new service for identifier: %@", (uint8_t *)&v3);
}

- (void)shouldAcceptNewConnection:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_1(&dword_23FFBA000, a3, (uint64_t)a3, "#session-server, [ErrorId - Client proxy create error] Cant create a client proxy, rejecting connection for pid: %@", (uint8_t *)a2);

}

- (void)refreshUpdateModeForServiceIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_23FFBA000, a2, a3, "#session-server, [ErrorId - Refresh unavailable service] Refreshing update mode for a a serviceIdentifier which is not available: %@", (uint8_t *)&v3);
}

@end
