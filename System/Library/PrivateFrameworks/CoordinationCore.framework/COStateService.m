@implementation COStateService

+ (id)serviceWithDelegate:(id)a3
{
  id v3;
  COServiceListenerProvider *v4;
  COStateAddOnProvider *v5;
  COStateService *v6;

  v3 = a3;
  v4 = -[COServiceListenerProvider initWithServiceName:entitlement:]([COServiceListenerProvider alloc], "initWithServiceName:entitlement:", CFSTR("com.apple.coordination.state"), CFSTR("com.apple.private.coordination.state"));
  v5 = objc_alloc_init(COStateAddOnProvider);
  v6 = -[COStateService initWithListenerProvider:addOnProvider:delegate:]([COStateService alloc], "initWithListenerProvider:addOnProvider:delegate:", v4, v5, v3);

  return v6;
}

- (COStateService)initWithListenerProvider:(id)a3 addOnProvider:(id)a4 delegate:(id)a5
{
  COStateService *v5;
  NSDictionary *v6;
  NSDictionary *connectedClients;
  COEndpointMonitor *v8;
  COEndpointMonitor *endpointMonitor;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)COStateService;
  v5 = -[COService initWithListenerProvider:addOnProvider:delegate:](&v11, sel_initWithListenerProvider_addOnProvider_delegate_, a3, a4, a5);
  if (v5)
  {
    v6 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCE70]);
    connectedClients = v5->_connectedClients;
    v5->_connectedClients = v6;

    v5->_doorbellDelay = 0.2;
    v8 = objc_alloc_init(COEndpointMonitor);
    endpointMonitor = v5->_endpointMonitor;
    v5->_endpointMonitor = v8;

    -[COEndpointMonitor setDelegate:](v5->_endpointMonitor, "setDelegate:", v5);
    -[COEndpointMonitor startMonitoring](v5->_endpointMonitor, "startMonitoring");
    -[COService _serviceReady](v5, "_serviceReady");
  }
  return v5;
}

- (void)_clientLost:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)COStateService;
  v4 = a3;
  -[COService _clientLost:](&v5, sel__clientLost_, v4);
  -[COStateService _cleanupDisconnectedClient:](self, "_cleanupDisconnectedClient:", v4, v5.receiver, v5.super_class);

}

- (void)_configureServiceInterfacesOnConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)COStateService;
  v4 = a3;
  -[COService _configureServiceInterfacesOnConnection:](&v21, sel__configureServiceInterfacesOnConnection_, v4);
  v5 = (void *)MEMORY[0x24BDD1990];
  v6 = &unk_254E1A9F8;
  objc_msgSend(v5, "interfaceWithProtocol:", v6, v21.receiver, v21.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE19DF0], "_allowedClusterClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_requestCompositionForCluster_withCallback_, 0, 0);

  objc_msgSend(MEMORY[0x24BE19DF0], "_allowedClusterClasses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setByAddingObject:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_addObserverWithPredicate_suite_interestClusters_, 2, 0);
  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_setDictionary_suite_interestClusters_targetCluster_withCallback_, 2, 0);
  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_setDictionary_suite_interestClusters_targetCluster_withCallback_, 3, 0);
  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_removeKeyPaths_targetClusters_withCallback_, 1, 0);
  objc_msgSend(v7, "classesForSelector:argumentIndex:ofReply:", sel_setDictionary_suite_interestClusters_targetCluster_withCallback_, 0, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE19DF0], "_allowedClusterClasses");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setByAddingObjectsFromSet:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_setDictionary_suite_interestClusters_targetCluster_withCallback_, 0, 1);
  objc_msgSend(v7, "classesForSelector:argumentIndex:ofReply:", sel_removeKeyPaths_targetClusters_withCallback_, 0, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE19DF0], "_allowedClusterClasses");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setByAddingObjectsFromSet:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_removeKeyPaths_targetClusters_withCallback_, 0, 1);
  objc_msgSend(v4, "setExportedInterface:", v7);
  objc_msgSend(v4, "setExportedObject:", self);
  v17 = &unk_254E2A3F0;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "classesForSelector:argumentIndex:ofReply:", sel_changesObserved_forPredicate_, 0, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "setByAddingObject:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setClasses:forSelector:argumentIndex:ofReply:", v20, sel_changesObserved_forPredicate_, 0, 0);
  objc_msgSend(v4, "setRemoteObjectInterface:", v18);

}

- (void)_addOnAdded:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  COStateService *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[COService _clustersForAddOn:](self, "_clustersForAddOn:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  COCoreLogForCategory(6);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134218498;
    v9 = self;
    v10 = 2048;
    v11 = v4;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_215E92000, v6, OS_LOG_TYPE_DEFAULT, "%p AddOn %p added for clusters %@. Seeding mesh state", (uint8_t *)&v8, 0x20u);
  }

  -[COStateService _stateSetByClientsForAddOn:](self, "_stateSetByClientsForAddOn:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMeshState:", v7);
  objc_msgSend(v4, "setDelegate:", self);

}

- (void)_addOnRemoved:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  COStateService *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[COService _clustersForAddOn:](self, "_clustersForAddOn:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  COCoreLogForCategory(6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v16 = self;
    v17 = 2048;
    v18 = v6;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_215E92000, v7, OS_LOG_TYPE_DEFAULT, "%p AddOn %p removed for clusters %@", buf, 0x20u);
  }

  objc_msgSend(v6, "meshState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[COStateService _stateSetByClientsForAddOn:](self, "_stateSetByClientsForAddOn:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __32__COStateService__addOnRemoved___block_invoke;
  v12[3] = &unk_24D4B2A38;
  v12[4] = self;
  v13 = v6;
  v14 = v5;
  v10 = v5;
  v11 = v6;
  determineStateChanges(v8, v9, v12);

}

void __32__COStateService__addOnRemoved___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  COCoreLogForCategory(6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 134219010;
    v22 = v8;
    v23 = 2048;
    v24 = v9;
    v25 = 2112;
    v26 = v5;
    v27 = 2112;
    v28 = v6;
    v29 = 2112;
    v30 = v10;
    _os_log_impl(&dword_215E92000, v7, OS_LOG_TYPE_DEFAULT, "%p removal of %p updating %@ and removing %@ for clusters %@", buf, 0x34u);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = *(id *)(a1 + 48);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(a1 + 32), "_informClientsOfUpdates:removals:inCluster:", v5, v6, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15++), (_QWORD)v16);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

}

- (BOOL)_applicableToCluster:(id)a3
{
  void *v3;
  unint64_t v4;

  objc_msgSend(a3, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = ((unint64_t)objc_msgSend(v3, "requiredServices") >> 1) & 1;

  return v4;
}

- (void)addOn:(id)a3 receivedUpdates:(id)a4 removals:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
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
  -[COService dispatchQueue](self, "dispatchQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __49__COStateService_addOn_receivedUpdates_removals___block_invoke;
  v15[3] = &unk_24D4B0E50;
  v15[4] = self;
  v16 = v9;
  v17 = v10;
  v18 = v8;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  dispatch_async(v11, v15);

}

void __49__COStateService_addOn_receivedUpdates_removals___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  COCoreLogForCategory(6);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v3, "connectedClients");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v18 = v3;
    v19 = 2112;
    v20 = v4;
    v21 = 2112;
    v22 = v5;
    v23 = 2048;
    v24 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_215E92000, v2, OS_LOG_TYPE_DEFAULT, "StateService %p receivedUpdates %@ and removals %@. Service has %ld connectedClients", buf, 0x2Au);

  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_clustersForAddOn:", *(_QWORD *)(a1 + 56), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(a1 + 32), "_informClientsOfUpdates:removals:inCluster:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)stateForAddOn:(id)a3 withCallback:(id)a4
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
  -[COService dispatchQueue](self, "dispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__COStateService_stateForAddOn_withCallback___block_invoke;
  block[3] = &unk_24D4B0D28;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __45__COStateService_stateForAddOn_withCallback___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id obj;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_clustersForAddOn:", *(_QWORD *)(a1 + 40));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v23)
  {
    v22 = *(_QWORD *)v33;
    v25 = v2;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v33 != v22)
          objc_enumerationMutation(obj);
        v24 = v3;
        v4 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v3);
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        objc_msgSend(*(id *)(a1 + 32), "connectedClients");
        v27 = (id)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v5)
        {
          v6 = v5;
          v7 = *(_QWORD *)v29;
          do
          {
            v8 = 0;
            v26 = v6;
            do
            {
              if (*(_QWORD *)v29 != v7)
                objc_enumerationMutation(v27);
              v9 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v8);
              objc_msgSend(*(id *)(a1 + 32), "connectedClients");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "objectForKeyedSubscript:", v9);
              v11 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v11, "clusters");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v10) = objc_msgSend(v12, "containsObject:", v4);

              if ((_DWORD)v10)
              {
                v13 = a1;
                objc_msgSend(v11, "suite");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v2, "objectForKeyedSubscript:", v14);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                if (v15)
                {
                  objc_msgSend(v11, "suite");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v2, "objectForKeyedSubscript:", v16);
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  v18 = (void *)objc_msgSend(v17, "mutableCopy");

                }
                else
                {
                  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                }

                objc_msgSend(v11, "stateForCluster:", v4);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                if (v19)
                  objc_msgSend(v18, "addEntriesFromDictionary:", v19);
                v2 = v25;
                if (objc_msgSend(v18, "count"))
                {
                  objc_msgSend(v11, "suite");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "setObject:forKey:", v18, v20);

                }
                a1 = v13;
                v6 = v26;
              }

              ++v8;
            }
            while (v6 != v8);
            v6 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          }
          while (v6);
        }

        v3 = v24 + 1;
      }
      while (v24 + 1 != v23);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v23);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)addObserverWithPredicate:(id)a3 suite:(id)a4 interestClusters:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  char v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  id obj;
  uint64_t v52;
  COStateService *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  _QWORD v59[5];
  id v60;
  id v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _QWORD v71[3];
  _QWORD v72[3];
  _BYTE v73[128];
  uint8_t v74[128];
  uint8_t buf[4];
  int v76;
  __int16 v77;
  id v78;
  __int16 v79;
  void *v80;
  __int16 v81;
  void *v82;
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[COService currentClient](self, "currentClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[COStateService connectedClients](self, "connectedClients");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    -[COStateService _checkinClientWithSuite:clusters:](self, "_checkinClientWithSuite:clusters:", v9, v10);
  v45 = v10;
  v46 = v9;
  -[COStateService connectedClients](self, "connectedClients");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  objc_msgSend(v15, "objectForKey:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "mutableCopy");
  COCoreLogForCategory(6);
  v18 = objc_claimAutoreleasedReturnValue();
  v53 = self;
  v55 = v16;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v11, "connection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "processIdentifier");
    objc_msgSend(v55, "suite");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "clusters");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109890;
    v76 = v20;
    v16 = v55;
    v77 = 2112;
    v78 = v8;
    v79 = 2112;
    v80 = v21;
    v81 = 2112;
    v82 = v22;
    _os_log_impl(&dword_215E92000, v18, OS_LOG_TYPE_DEFAULT, "Adding observer for client %d with predicate %@ for suite %@ and clusters %@ ", buf, 0x26u);

    self = v53;
  }

  objc_msgSend(v17, "addObserverWithPredicate:", v8);
  v43 = v17;
  v50 = v11;
  objc_msgSend(v15, "setObject:forKey:", v17, v11);
  v44 = v15;
  -[COStateService setConnectedClients:](self, "setConnectedClients:", v15);
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  objc_msgSend(v16, "clusters");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
  if (v56)
  {
    v23 = 0;
    v54 = 0;
    v52 = *(_QWORD *)v68;
    v49 = *MEMORY[0x24BE19CA0];
    v48 = *MEMORY[0x24BE19CB0];
    v47 = *MEMORY[0x24BE19CA8];
    do
    {
      for (i = 0; i != v56; ++i)
      {
        if (*(_QWORD *)v68 != v52)
          objc_enumerationMutation(obj);
        v25 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * i);
        -[COService _addOnForCluster:](self, "_addOnForCluster:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = v25;
        v58 = v26;
        if (v26)
        {
          objc_msgSend(v26, "meshState");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "suite");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectForKeyedSubscript:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(v16, "suite");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[COStateService _stateSetByClientsForSuite:cluster:](self, "_stateSetByClientsForSuite:cluster:", v28, v25);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
        }

        v65 = 0u;
        v66 = 0u;
        v63 = 0u;
        v64 = 0u;
        v31 = v30;
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
        if (v32)
        {
          v33 = v32;
          v34 = *(_QWORD *)v64;
          do
          {
            for (j = 0; j != v33; ++j)
            {
              if (*(_QWORD *)v64 != v34)
                objc_enumerationMutation(v31);
              v36 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * j);
              if (objc_msgSend(v8, "evaluateWithObject:", v36))
              {
                objc_msgSend(v31, "objectForKeyedSubscript:", v36);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setObject:forKey:", v37, v36);

                v23 = 1;
              }
            }
            v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
          }
          while (v33);
        }

        if ((v23 & 1) != 0)
        {
          v71[0] = v49;
          v71[1] = v48;
          v72[0] = v57;
          v72[1] = v27;
          v71[2] = v47;
          objc_msgSend(MEMORY[0x24BDBCF20], "set");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v72[2] = v38;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v72, v71, 3);
          v39 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v50, "connection");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v59[0] = MEMORY[0x24BDAC760];
          v59[1] = 3221225472;
          v59[2] = __66__COStateService_addObserverWithPredicate_suite_interestClusters___block_invoke;
          v59[3] = &unk_24D4B2A60;
          self = v53;
          v59[4] = v53;
          v60 = v40;
          v61 = v50;
          v62 = v57;
          v41 = v40;
          objc_msgSend(v41, "remoteObjectProxyWithErrorHandler:", v59);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "changesObserved:forPredicate:", v39, v8);

          v54 = (void *)v39;
        }
        else
        {
          self = v53;
        }
        v16 = v55;

      }
      v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
    }
    while (v56);
  }
  else
  {
    v54 = 0;
  }

}

void __66__COStateService_addObserverWithPredicate_suite_interestClusters___block_invoke(uint64_t a1)
{
  NSObject *v2;

  COCoreLogForCategory(6);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __66__COStateService_addObserverWithPredicate_suite_interestClusters___block_invoke_cold_1(a1);

}

- (void)removeObserverWithPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  _BYTE v17[24];
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[COService currentClient](self, "currentClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[COStateService connectedClients](self, "connectedClients");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "objectForKey:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, "mutableCopy");
    COCoreLogForCategory(6);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "connection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v15, "processIdentifier");
      objc_msgSend(v9, "suite");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "clusters");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v17 = v12;
      *(_WORD *)&v17[4] = 2112;
      *(_QWORD *)&v17[6] = v4;
      *(_WORD *)&v17[14] = 2112;
      *(_QWORD *)&v17[16] = v13;
      v18 = 2112;
      v19 = v14;
      _os_log_impl(&dword_215E92000, v11, OS_LOG_TYPE_DEFAULT, "Removing observer for client %d with predicate %@ for suite %@ and clusters %@ ", buf, 0x26u);

    }
    -[NSObject removeObserverWithPredicate:](v10, "removeObserverWithPredicate:", v4);
    objc_msgSend(v7, "setObject:forKey:", v10, v5);
    -[COStateService setConnectedClients:](self, "setConnectedClients:", v7);
  }
  else
  {
    COCoreLogForCategory(6);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)v17 = v5;
      *(_WORD *)&v17[8] = 2112;
      *(_QWORD *)&v17[10] = v4;
      _os_log_impl(&dword_215E92000, v10, OS_LOG_TYPE_DEFAULT, "Client [%p] wants to remove an observer for predicate %@ but is not checked in", buf, 0x16u);
    }
  }

}

- (void)setDictionary:(id)a3 suite:(id)a4 interestClusters:(id)a5 targetCluster:(id)a6 withCallback:(id)a7
{
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id obj;
  id v36;
  uint64_t v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  _QWORD v42[4];
  id v43;
  uint64_t v44;
  id v45;
  COStateService *v46;
  id v47;
  id v48;
  uint64_t *v49;
  _QWORD *v50;
  uint8_t *v51;
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  uint64_t v56;
  id v57;
  id location;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD v67[5];
  id v68;
  uint8_t v69[128];
  uint8_t buf[8];
  _BYTE v71[24];
  void (*v72)(uint64_t);
  id v73;
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v39 = a3;
  v33 = a4;
  v34 = a5;
  v12 = a6;
  v36 = a7;
  -[COService currentClient](self, "currentClient");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[COStateService connectedClients](self, "connectedClients");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v40);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    -[COStateService _checkinClientWithSuite:clusters:](self, "_checkinClientWithSuite:clusters:", v33, v34);
  COCoreLogForCategory(6);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v40, "connection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)&buf[4] = objc_msgSend(v16, "processIdentifier");
    *(_WORD *)v71 = 2112;
    *(_QWORD *)&v71[2] = v39;
    *(_WORD *)&v71[10] = 2112;
    *(_QWORD *)&v71[12] = v12;
    _os_log_impl(&dword_215E92000, v15, OS_LOG_TYPE_DEFAULT, "Client %d setting values %@ in clusters %@", buf, 0x1Cu);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)v71 = buf;
  *(_QWORD *)&v71[8] = 0x3032000000;
  *(_QWORD *)&v71[16] = __Block_byref_object_copy__14;
  v72 = __Block_byref_object_dispose__14;
  v73 = 0;
  v67[0] = 0;
  v67[1] = v67;
  v67[2] = 0x3032000000;
  v67[3] = __Block_byref_object_copy__14;
  v67[4] = __Block_byref_object_dispose__14;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v68 = (id)objc_claimAutoreleasedReturnValue();
  -[COStateService connectedClients](self, "connectedClients");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", v40);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  -[COStateService _setIsWriting:forClient:](self, "_setIsWriting:forClient:", 1, v40);
  v63 = 0;
  v64 = &v63;
  v65 = 0x2020000000;
  v66 = 0;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = v12;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
  if (v18)
  {
    v37 = *(_QWORD *)v60;
    do
    {
      v41 = v18;
      for (i = 0; i != v41; ++i)
      {
        if (*(_QWORD *)v60 != v37)
          objc_enumerationMutation(obj);
        v20 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i);
        -[COService _addOnForCluster:](self, "_addOnForCluster:", v20, v33);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_initWeak(&location, self);
        v53[0] = MEMORY[0x24BDAC760];
        v53[1] = 3221225472;
        v53[2] = __82__COStateService_setDictionary_suite_interestClusters_targetCluster_withCallback___block_invoke;
        v53[3] = &unk_24D4B2A88;
        objc_copyWeak(&v57, &location);
        v22 = v40;
        v54 = v22;
        v23 = v39;
        v55 = v23;
        v56 = v20;
        v24 = MEMORY[0x2199F3D40](v53);
        v25 = (void *)v24;
        if (v21)
        {
          ++v64[3];
          objc_msgSend(v38, "suite");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v42[0] = MEMORY[0x24BDAC760];
          v42[1] = 3221225472;
          v42[2] = __82__COStateService_setDictionary_suite_interestClusters_targetCluster_withCallback___block_invoke_2;
          v42[3] = &unk_24D4B2AD8;
          objc_copyWeak(&v52, &location);
          v49 = &v63;
          v27 = v23;
          v43 = v27;
          v44 = v20;
          v45 = v22;
          v50 = v67;
          v28 = v25;
          v51 = buf;
          v46 = self;
          v47 = v28;
          v48 = v36;
          objc_msgSend(v21, "setDictionary:suite:withCallback:", v27, v26, v42);

          objc_destroyWeak(&v52);
        }
        else
        {
          (*(void (**)(uint64_t))(v24 + 16))(v24);
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "suite");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setObject:forKey:", v23, v30);

          -[COStateService _informClientsOfUpdates:removals:inCluster:](self, "_informClientsOfUpdates:removals:inCluster:", v29, MEMORY[0x24BDBD1B8], v20);
        }

        objc_destroyWeak(&v57);
        objc_destroyWeak(&location);

      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
    }
    while (v18);
  }

  if (!v64[3])
  {
    -[COStateService _setIsWriting:forClient:](self, "_setIsWriting:forClient:", 0, v40);
    -[COStateService connectedClients](self, "connectedClients");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectForKey:", v40);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v32, "disconnected") & 1) != 0)
      -[COStateService _cleanupDisconnectedClient:](self, "_cleanupDisconnectedClient:", v40);
    else
      (*((void (**)(id, _QWORD))v36 + 2))(v36, *(_QWORD *)(*(_QWORD *)v71 + 40));

  }
  _Block_object_dispose(&v63, 8);

  _Block_object_dispose(v67, 8);
  _Block_object_dispose(buf, 8);

}

void __82__COStateService_setDictionary_suite_interestClusters_targetCluster_withCallback___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  void *v26;
  id obj;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v1 = a1;
  v48 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "connectedClients");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");

    v31 = v5;
    objc_msgSend(v5, "objectForKey:", *(_QWORD *)(v1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v6, "mutableCopy");

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v32 = v3;
    objc_msgSend(v3, "connectedClients");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    if (v29)
    {
      v28 = *(_QWORD *)v42;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v42 != v28)
            objc_enumerationMutation(obj);
          v30 = v7;
          v8 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v7);
          v37 = 0u;
          v38 = 0u;
          v39 = 0u;
          v40 = 0u;
          v9 = v1;
          objc_msgSend(*(id *)(v1 + 40), "allKeys");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v38;
            do
            {
              for (i = 0; i != v12; ++i)
              {
                if (*(_QWORD *)v38 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
                objc_msgSend(v32, "connectedClients");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "objectForKeyedSubscript:", v8);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = (void *)objc_msgSend(v17, "mutableCopy");

                objc_msgSend(v18, "removeKeyPath:cluster:", v15, *(_QWORD *)(v9 + 48));
                objc_msgSend(v31, "setObject:forKey:", v18, v8);

              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
            }
            while (v12);
          }

          v7 = v30 + 1;
          v1 = v9;
        }
        while (v30 + 1 != v29);
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      }
      while (v29);
    }

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    objc_msgSend(*(id *)(v1 + 40), "allKeys");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v34 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j);
          objc_msgSend(*(id *)(v1 + 40), "objectForKeyedSubscript:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setValue:forKeyPath:cluster:", v25, v24, *(_QWORD *)(v1 + 48));

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
      }
      while (v21);
    }

    objc_msgSend(v31, "setObject:forKey:", v26, *(_QWORD *)(v1 + 32));
    v3 = v32;
    objc_msgSend(v32, "setConnectedClients:", v31);

  }
}

void __82__COStateService_setDictionary_suite_interestClusters_targetCluster_withCallback___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  _QWORD block[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "dispatchQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __82__COStateService_setDictionary_suite_interestClusters_targetCluster_withCallback___block_invoke_3;
    block[3] = &unk_24D4B2AB0;
    v23 = *(_QWORD *)(a1 + 80);
    v15 = v3;
    v7 = *(id *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(void **)(a1 + 48);
    v16 = v7;
    v17 = v8;
    v10 = v9;
    v11 = *(_QWORD *)(a1 + 88);
    v18 = v10;
    v24 = v11;
    v12 = *(id *)(a1 + 64);
    v13 = *(_QWORD *)(a1 + 96);
    v20 = v5;
    v21 = v12;
    v25 = v13;
    v19 = *(_QWORD *)(a1 + 56);
    v22 = *(id *)(a1 + 72);
    dispatch_async(v6, block);

  }
}

void __82__COStateService_setDictionary_suite_interestClusters_targetCluster_withCallback___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
  if (*(_QWORD *)(a1 + 32))
  {
    COCoreLogForCategory(6);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __82__COStateService_setDictionary_suite_interestClusters_targetCluster_withCallback___block_invoke_3_cold_1(a1);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "addObject:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "count"))
    {
      v10 = *MEMORY[0x24BE19CE0];
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "allObjects");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = v3;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE19CD8], -1002, v4);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

    }
    objc_msgSend(*(id *)(a1 + 64), "_setIsWriting:forClient:", 0, *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 72), "connectedClients");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", *(_QWORD *)(a1 + 56));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v9, "disconnected") & 1) != 0)
      objc_msgSend(*(id *)(a1 + 72), "_cleanupDisconnectedClient:", *(_QWORD *)(a1 + 56));
    else
      (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();

  }
}

- (void)removeKeyPaths:(id)a3 targetClusters:(id)a4 withCallback:(id)a5
{
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id obj;
  id v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  _QWORD v35[4];
  id v36;
  uint64_t v37;
  COStateService *v38;
  id v39;
  id v40;
  id v41;
  uint64_t *v42;
  _QWORD *v43;
  _BYTE *v44;
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  uint64_t v49;
  id v50;
  id location;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD v60[5];
  id v61;
  uint8_t v62[128];
  _BYTE buf[32];
  __int128 v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v31 = a3;
  v27 = a4;
  v29 = a5;
  -[COService currentClient](self, "currentClient");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[COStateService connectedClients](self, "connectedClients");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  COCoreLogForCategory(6);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v32)
  {
    if (v10)
    {
      objc_msgSend(v33, "connection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&buf[4] = objc_msgSend(v11, "processIdentifier");
      *(_WORD *)&buf[8] = 2112;
      *(_QWORD *)&buf[10] = v31;
      *(_WORD *)&buf[18] = 2112;
      *(_QWORD *)&buf[20] = v27;
      _os_log_impl(&dword_215E92000, v9, OS_LOG_TYPE_DEFAULT, "Client %d removing keyPaths %@ in clusters %@", buf, 0x1Cu);

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    *(_QWORD *)&buf[24] = __Block_byref_object_copy__14;
    *(_QWORD *)&v64 = __Block_byref_object_dispose__14;
    *((_QWORD *)&v64 + 1) = 0;
    v60[0] = 0;
    v60[1] = v60;
    v60[2] = 0x3032000000;
    v60[3] = __Block_byref_object_copy__14;
    v60[4] = __Block_byref_object_dispose__14;
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v61 = (id)objc_claimAutoreleasedReturnValue();
    -[COStateService _setIsWriting:forClient:](self, "_setIsWriting:forClient:", 1, v33);
    v56 = 0;
    v57 = &v56;
    v58 = 0x2020000000;
    v59 = 0;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    obj = v27;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
    if (v12)
    {
      v30 = *(_QWORD *)v53;
      do
      {
        v34 = v12;
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v53 != v30)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
          -[COService _addOnForCluster:](self, "_addOnForCluster:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_initWeak(&location, self);
          v46[0] = MEMORY[0x24BDAC760];
          v46[1] = 3221225472;
          v46[2] = __61__COStateService_removeKeyPaths_targetClusters_withCallback___block_invoke;
          v46[3] = &unk_24D4B2A88;
          objc_copyWeak(&v50, &location);
          v16 = v33;
          v47 = v16;
          v17 = v31;
          v48 = v17;
          v49 = v14;
          v18 = MEMORY[0x2199F3D40](v46);
          v19 = (void *)v18;
          if (v15)
          {
            ++v57[3];
            objc_msgSend(v32, "suite");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v35[0] = MEMORY[0x24BDAC760];
            v35[1] = 3221225472;
            v35[2] = __61__COStateService_removeKeyPaths_targetClusters_withCallback___block_invoke_2;
            v35[3] = &unk_24D4B2B28;
            objc_copyWeak(&v45, &location);
            v42 = &v56;
            v21 = v17;
            v36 = v21;
            v37 = v14;
            v43 = v60;
            v22 = v19;
            v44 = buf;
            v40 = v22;
            v38 = self;
            v39 = v16;
            v41 = v29;
            objc_msgSend(v15, "removeKeyPaths:suite:withCallback:", v21, v20, v35);

            objc_destroyWeak(&v45);
          }
          else
          {
            (*(void (**)(uint64_t))(v18 + 16))(v18);
            objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "suite");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setObject:forKey:", v17, v24);

            -[COStateService _informClientsOfUpdates:removals:inCluster:](self, "_informClientsOfUpdates:removals:inCluster:", MEMORY[0x24BDBD1B8], v23, v14);
          }

          objc_destroyWeak(&v50);
          objc_destroyWeak(&location);

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
      }
      while (v12);
    }

    if (!v57[3])
    {
      -[COStateService _setIsWriting:forClient:](self, "_setIsWriting:forClient:", 0, v33);
      -[COStateService connectedClients](self, "connectedClients");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKey:", v33);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v26, "disconnected") & 1) != 0)
        -[COStateService _cleanupDisconnectedClient:](self, "_cleanupDisconnectedClient:", v33);
      else
        (*((void (**)(id, _QWORD))v29 + 2))(v29, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));

    }
    _Block_object_dispose(&v56, 8);
    _Block_object_dispose(v60, 8);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (v10)
    {
      *(_DWORD *)buf = 134218754;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v33;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&buf[24] = v31;
      LOWORD(v64) = 2112;
      *(_QWORD *)((char *)&v64 + 2) = v27;
      _os_log_impl(&dword_215E92000, v9, OS_LOG_TYPE_DEFAULT, "%p Client [%p] wants to remove keypaths [%@] in clusters [%@] but is not checked in", buf, 0x2Au);
    }

    (*((void (**)(id, _QWORD))v29 + 2))(v29, 0);
  }

}

void __61__COStateService_removeKeyPaths_targetClusters_withCallback___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "connectedClients");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");

    objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = *(id *)(a1 + 40);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v7, "removeKeyPath:cluster:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), *(_QWORD *)(a1 + 48), (_QWORD)v13);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

    objc_msgSend(v5, "setObject:forKey:", v7, *(_QWORD *)(a1 + 32));
    objc_msgSend(v3, "setConnectedClients:", v5);

  }
}

void __61__COStateService_removeKeyPaths_targetClusters_withCallback___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD block[4];
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "dispatchQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __61__COStateService_removeKeyPaths_targetClusters_withCallback___block_invoke_3;
    block[3] = &unk_24D4B2B00;
    v21 = *(_QWORD *)(a1 + 80);
    v13 = v3;
    v7 = *(id *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v14 = v7;
    v15 = v8;
    v22 = *(_QWORD *)(a1 + 88);
    v9 = *(id *)(a1 + 64);
    v23 = *(_QWORD *)(a1 + 96);
    v10 = *(_QWORD *)(a1 + 48);
    v11 = *(void **)(a1 + 56);
    v19 = v9;
    v16 = v10;
    v17 = v11;
    v18 = v5;
    v20 = *(id *)(a1 + 72);
    dispatch_async(v6, block);

  }
}

void __61__COStateService_removeKeyPaths_targetClusters_withCallback___block_invoke_3(uint64_t a1)
{
  uint64_t *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
  v2 = (uint64_t *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    COCoreLogForCategory(6);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __61__COStateService_removeKeyPaths_targetClusters_withCallback___block_invoke_3_cold_1(a1, v2, v3);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "addObject:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "count"))
    {
      v11 = *MEMORY[0x24BE19CE0];
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "allObjects");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = v4;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE19CD8], -1002, v5);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

    }
    objc_msgSend(*(id *)(a1 + 56), "_setIsWriting:forClient:", 0, *(_QWORD *)(a1 + 64));
    objc_msgSend(*(id *)(a1 + 72), "connectedClients");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", *(_QWORD *)(a1 + 64));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v10, "disconnected") & 1) != 0)
      objc_msgSend(*(id *)(a1 + 72), "_cleanupDisconnectedClient:", *(_QWORD *)(a1 + 64));
    else
      (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();

  }
}

- (void)doorbellDelayWithCallback:(id)a3
{
  id v5;

  v5 = a3;
  -[COStateService doorbellDelay](self, "doorbellDelay");
  (*((void (**)(id))a3 + 2))(v5);

}

- (void)_checkinClientWithSuite:(id)a3 clusters:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  COStateClientInfo *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  int v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[COService currentClient](self, "currentClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  COCoreLogForCategory(6);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "connection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109634;
    v25 = objc_msgSend(v10, "processIdentifier");
    v26 = 2112;
    v27 = v6;
    v28 = 2112;
    v29 = v7;
    _os_log_impl(&dword_215E92000, v9, OS_LOG_TYPE_DEFAULT, "Client %d checking in with suite %@ and clusters %@", buf, 0x1Cu);

  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        -[COService _takeAssertionForCluster:](self, "_takeAssertionForCluster:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v15++), (_QWORD)v19);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  v16 = -[COStateClientInfo initWithSuite:clusters:]([COStateClientInfo alloc], "initWithSuite:clusters:", v6, v11);
  -[COStateService connectedClients](self, "connectedClients");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  objc_msgSend(v18, "setObject:forKey:", v16, v8);
  -[COStateService setConnectedClients:](self, "setConnectedClients:", v18);

}

- (void)_informClientsOfUpdates:(id)a3 removals:(id)a4 inCluster:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  uint64_t v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  uint64_t v42;
  uint64_t v43;
  id v44;
  COStateService *v45;
  uint64_t v46;
  id obj;
  void *v48;
  void *v49;
  uint64_t v50;
  id v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  id v57;
  uint64_t v58;
  void *v59;
  id v60;
  uint64_t v61;
  void *v62;
  void *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _QWORD v76[5];
  id v77;
  void *v78;
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  v57 = a3;
  v56 = a4;
  v8 = a5;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  -[COStateService connectedClients](self, "connectedClients");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v10;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v80, v87, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v81;
    v55 = *MEMORY[0x24BE19CA0];
    v53 = *MEMORY[0x24BE19CA8];
    v54 = *MEMORY[0x24BE19CB0];
    v44 = v8;
    v45 = self;
    v43 = *(_QWORD *)v81;
    do
    {
      v14 = 0;
      v46 = v12;
      do
      {
        if (*(_QWORD *)v81 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * v14);
        -[COStateService connectedClients](self, "connectedClients");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "clusters");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "containsObject:", v8))
        {
          v49 = v18;
          v50 = v14;
          objc_msgSend(v15, "connection");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v76[0] = MEMORY[0x24BDAC760];
          v76[1] = 3221225472;
          v76[2] = __61__COStateService__informClientsOfUpdates_removals_inCluster___block_invoke;
          v76[3] = &unk_24D4B2A60;
          v76[4] = self;
          v20 = v19;
          v77 = v20;
          v78 = v15;
          v60 = v8;
          v79 = v60;
          v48 = v20;
          objc_msgSend(v20, "remoteObjectProxyWithErrorHandler:", v76);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = 0u;
          v73 = 0u;
          v74 = 0u;
          v75 = 0u;
          objc_msgSend(v17, "observers");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "allKeys");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v51 = v22;
          v61 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v72, v86, 16);
          if (v61)
          {
            v58 = *(_QWORD *)v73;
            v59 = v17;
            do
            {
              for (i = 0; i != v61; ++i)
              {
                if (*(_QWORD *)v73 != v58)
                  objc_enumerationMutation(v51);
                v24 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
                objc_msgSend(v17, "suite");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "objectForKeyedSubscript:", v25);
                v26 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v17, "suite");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v56, "objectForKeyedSubscript:", v27);
                v62 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v63, "setObject:forKey:", v60, v55);
                objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDBCEF0], "set");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v68 = 0u;
                v69 = 0u;
                v70 = 0u;
                v71 = 0u;
                v30 = v26;
                v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v68, v85, 16);
                if (v31)
                {
                  v32 = v31;
                  v33 = *(_QWORD *)v69;
                  do
                  {
                    for (j = 0; j != v32; ++j)
                    {
                      if (*(_QWORD *)v69 != v33)
                        objc_enumerationMutation(v30);
                      v35 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * j);
                      if (objc_msgSend(v24, "evaluateWithObject:", v35))
                      {
                        objc_msgSend(v30, "objectForKeyedSubscript:", v35);
                        v36 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v28, "setObject:forKey:", v36, v35);

                      }
                    }
                    v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v68, v85, 16);
                  }
                  while (v32);
                }

                objc_msgSend(v63, "setObject:forKey:", v28, v54);
                v66 = 0u;
                v67 = 0u;
                v64 = 0u;
                v65 = 0u;
                v37 = v62;
                v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v64, v84, 16);
                if (v38)
                {
                  v39 = v38;
                  v40 = *(_QWORD *)v65;
                  do
                  {
                    for (k = 0; k != v39; ++k)
                    {
                      if (*(_QWORD *)v65 != v40)
                        objc_enumerationMutation(v37);
                      v42 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * k);
                      if (objc_msgSend(v24, "evaluateWithObject:", v42))
                        objc_msgSend(v29, "addObject:", v42);
                    }
                    v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v64, v84, 16);
                  }
                  while (v39);
                }

                objc_msgSend(v63, "setObject:forKey:", v29, v53);
                if (objc_msgSend(v28, "count") || objc_msgSend(v29, "count"))
                  objc_msgSend(v52, "changesObserved:forPredicate:", v63, v24);

                v17 = v59;
              }
              v61 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v72, v86, 16);
            }
            while (v61);
          }

          v8 = v44;
          self = v45;
          v13 = v43;
          v12 = v46;
          v18 = v49;
          v14 = v50;
        }

        ++v14;
      }
      while (v14 != v12);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v87, 16);
    }
    while (v12);
  }

}

void __61__COStateService__informClientsOfUpdates_removals_inCluster___block_invoke(uint64_t a1)
{
  NSObject *v2;

  COCoreLogForCategory(6);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __61__COStateService__informClientsOfUpdates_removals_inCluster___block_invoke_cold_1(a1);

}

- (id)_stateSetByClientsForSuite:(id)a3 cluster:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[COStateService connectedClients](self, "connectedClients");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v13);
        -[COStateService connectedClients](self, "connectedClients");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "suite");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqualToString:", v6);

        if (v18)
        {
          objc_msgSend(v16, "stateForCluster:", v7);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addEntriesFromDictionary:", v19);

        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }

  return v21;
}

- (id)_stateSetByClientsForAddOn:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  id obj;
  uint64_t v22;
  COStateService *v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = self;
  v20 = v4;
  -[COService _clustersForAddOn:](self, "_clustersForAddOn:", v4);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v24)
  {
    v22 = *(_QWORD *)v31;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v31 != v22)
          objc_enumerationMutation(obj);
        v25 = v6;
        v7 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v6);
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        -[COStateService connectedClients](v23, "connectedClients");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "allValues");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v27;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v27 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
              objc_msgSend(v14, "stateForCluster:", v7);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v15, "count"))
              {
                objc_msgSend(v14, "suite");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "objectForKey:", v16);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = (void *)objc_msgSend(v17, "mutableCopy");

                if (!v18)
                {
                  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                }
                objc_msgSend(v18, "addEntriesFromDictionary:", v15);
                objc_msgSend(v5, "setObject:forKey:", v18, v16);

              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          }
          while (v11);
        }

        v6 = v25 + 1;
      }
      while (v25 + 1 != v24);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v24);
  }

  return v5;
}

- (void)compositionForCluster:(id)a3 withCallback:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  double v30;
  double v31;
  BOOL v32;
  unint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  _QWORD v45[5];
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  _QWORD v52[4];
  id v53;
  id v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  -[COService _addOnForCluster:](self, "_addOnForCluster:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "meshController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__14;
  v60 = __Block_byref_object_dispose__14;
  v61 = objc_alloc_init(MEMORY[0x24BDBCE30]);
  if (v9)
  {
    objc_msgSend(v9, "leader");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "nodes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    v52[0] = MEMORY[0x24BDAC760];
    v52[1] = 3221225472;
    v52[2] = __53__COStateService_compositionForCluster_withCallback___block_invoke;
    v52[3] = &unk_24D4B2B78;
    v44 = v10;
    v53 = v44;
    v54 = v8;
    v55 = &v56;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v52);
    v43 = v12;
    objc_msgSend(v9, "nodeManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "nodeForMe");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "IDSIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v16, *MEMORY[0x24BE19D18]);

    objc_msgSend(v15, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE19D30]);
    objc_msgSend(v14, "HomeKitIdentifier");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
      objc_msgSend(v15, "setObject:forKey:", v17, *MEMORY[0x24BE19CE8]);
    v42 = (void *)v17;
    objc_msgSend(v9, "me");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v44 && objc_msgSend(v18, "isEqual:", v44))
      objc_msgSend(v15, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE19D28]);
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v20, *MEMORY[0x24BE19D20]);

    objc_msgSend(v14, "underlyingNode");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "state");

    +[CONode descriptionForState:](CONode, "descriptionForState:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v23, *MEMORY[0x24BE19D48]);

    +[CONode statusFromState:](CONode, "statusFromState:", v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v24, *MEMORY[0x24BE19D50]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v9, "generation"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v25, *MEMORY[0x24BE19D08]);

    objc_msgSend(v9, "ballot");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      v46 = 0;
      v47 = &v46;
      v48 = 0x3032000000;
      v49 = __Block_byref_object_copy__14;
      v50 = __Block_byref_object_dispose__14;
      v51 = objc_alloc_init(MEMORY[0x24BDBCE30]);
      objc_msgSend(v26, "candidates");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = MEMORY[0x24BDAC760];
      v45[1] = 3221225472;
      v45[2] = __53__COStateService_compositionForCluster_withCallback___block_invoke_3;
      v45[3] = &unk_24D4B2B50;
      v45[4] = &v46;
      objc_msgSend(v27, "enumerateObjectsUsingBlock:", v45);

      objc_msgSend(v15, "setObject:forKey:", v47[5], *MEMORY[0x24BE19CF0]);
      _Block_object_dispose(&v46, 8);

    }
    v28 = objc_msgSend(v9, "electionStart");
    v29 = objc_msgSend(v9, "electionEnd");
    v30 = 0.0;
    v31 = 0.0;
    v32 = v29 >= v28;
    v33 = v29 - v28;
    if (v33 != 0 && v32)
    {
      v31 = (double)v33 / 1000000000.0;
      v30 = (double)(clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - v29) / 1000000000.0;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v30);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v34, *MEMORY[0x24BE19CC0]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v31);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v35, *MEMORY[0x24BE19CB8]);

    v36 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v9, "pingMinimum");
    objc_msgSend(v36, "numberWithDouble:");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v37, *MEMORY[0x24BE19CD0]);

    v38 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v9, "pingMaximum");
    objc_msgSend(v38, "numberWithDouble:");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v39, *MEMORY[0x24BE19CC8]);

    objc_msgSend((id)v57[5], "arrayByAddingObject:", v15);
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = (void *)v57[5];
    v57[5] = v40;

  }
  v7[2](v7, v57[5], 0);
  _Block_object_dispose(&v56, 8);

}

void __53__COStateService_compositionForCluster_withCallback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
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
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[5];
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "IDSIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, *MEMORY[0x24BE19D18]);

  objc_msgSend(v3, "HomeKitIdentifier");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (v42)
    objc_msgSend(v4, "setObject:forKey:", v42, *MEMORY[0x24BE19CE8]);
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v3, "remote");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32));

    if (v7)
      objc_msgSend(v4, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE19D28]);
  }
  objc_msgSend(v3, "remote");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (v44)
  {
    objc_msgSend(v44, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, *MEMORY[0x24BE19D20]);

  }
  objc_msgSend(v3, "underlyingNode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "state");

  +[CONode descriptionForState:](CONode, "descriptionForState:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v11, *MEMORY[0x24BE19D48]);

  +[CONode statusFromState:](CONode, "statusFromState:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v12, *MEMORY[0x24BE19D50]);

  objc_msgSend(v3, "underlyingNode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lastElectionInfoReceived");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v45, "generation"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v14, *MEMORY[0x24BE19D08]);

  objc_msgSend(v45, "ballot");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v51 = 0;
    v52 = &v51;
    v53 = 0x3032000000;
    v54 = __Block_byref_object_copy__14;
    v55 = __Block_byref_object_dispose__14;
    v56 = objc_alloc_init(MEMORY[0x24BDBCE30]);
    objc_msgSend(v43, "candidates");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = MEMORY[0x24BDAC760];
    v50[1] = 3221225472;
    v50[2] = __53__COStateService_compositionForCluster_withCallback___block_invoke_2;
    v50[3] = &unk_24D4B2B50;
    v50[4] = &v51;
    objc_msgSend(v15, "enumerateObjectsUsingBlock:", v50);

    objc_msgSend(v4, "setObject:forKey:", v52[5], *MEMORY[0x24BE19CF0]);
    _Block_object_dispose(&v51, 8);

  }
  v16 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v3, "underlyingNode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "lastHeard");
  objc_msgSend(v16, "numberWithDouble:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v18, *MEMORY[0x24BE19D38]);

  v19 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v3, "underlyingNode");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "numberWithBool:", objc_msgSend(v20, "hasOutstandingProbe"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v21, *MEMORY[0x24BE19D10]);

  objc_msgSend(*(id *)(a1 + 40), "meshController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "nodeManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "nodeControllers");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "IDSIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "objectForKey:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  objc_msgSend(v25, "transports");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (id)objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v47;
LABEL_12:
    v29 = 0;
    while (1)
    {
      if (*(_QWORD *)v47 != v28)
        objc_enumerationMutation(v26);
      v30 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v29);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      if (v27 == (id)++v29)
      {
        v27 = (id)objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
        if (v27)
          goto LABEL_12;
        goto LABEL_21;
      }
    }
    v27 = v30;

    if (!v27)
      goto LABEL_22;
    v31 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v27, "averageRequestTime");
    objc_msgSend(v31, "numberWithDouble:");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v26, *MEMORY[0x24BE19D40]);
  }
LABEL_21:

LABEL_22:
  v32 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v3, "underlyingNode");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "numberWithUnsignedInteger:", objc_msgSend(v33, "discoveryType"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v34, *MEMORY[0x24BE19D00]);

  v35 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v3, "underlyingNode");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "numberWithUnsignedInteger:", objc_msgSend(v36, "connectionType"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v37, *MEMORY[0x24BE19CF8]);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "arrayByAddingObject:", v4);
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v40 = *(void **)(v39 + 40);
  *(_QWORD *)(v39 + 40) = v38;

}

void __53__COStateService_compositionForCluster_withCallback___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(a2, "dictionaryRepresentation");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObject:", v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __53__COStateService_compositionForCluster_withCallback___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(a2, "dictionaryRepresentation");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObject:", v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)requestCompositionForCluster:(id)a3 withCallback:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  double v26;
  double v27;
  BOOL v28;
  unint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[5];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  _QWORD v48[4];
  id v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  if (objc_msgSend(MEMORY[0x24BE19E30], "isGlobalMessagingEnabled"))
  {
    -[COStateService compositionForCluster:withCallback:](self, "compositionForCluster:withCallback:", v6, v7);
  }
  else
  {
    -[COService _addOnForCluster:](self, "_addOnForCluster:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "meshController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0;
    v52 = &v51;
    v53 = 0x3032000000;
    v54 = __Block_byref_object_copy__14;
    v55 = __Block_byref_object_dispose__14;
    v56 = objc_alloc_init(MEMORY[0x24BDBCE30]);
    if (v9)
    {
      objc_msgSend(v9, "leader");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "trackers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = MEMORY[0x24BDAC760];
      v48[1] = 3221225472;
      v48[2] = __60__COStateService_requestCompositionForCluster_withCallback___block_invoke;
      v48[3] = &unk_24D4B2BA0;
      v12 = v10;
      v49 = v12;
      v50 = &v51;
      objc_msgSend(v11, "enumerateNodeStateTrackersUsingBlock:", v48);

      objc_msgSend(v9, "listener");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        objc_msgSend(v13, "client");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "localDevice");
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "IDSIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKey:", v17, *MEMORY[0x24BE19D18]);

        objc_msgSend(v16, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE19D30]);
        objc_msgSend(v39, "homeKitIdentifier");
        v18 = objc_claimAutoreleasedReturnValue();
        if (v18)
          objc_msgSend(v16, "setObject:forKey:", v18, *MEMORY[0x24BE19CE8]);
        v38 = (void *)v18;
        objc_msgSend(v9, "me");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12 && objc_msgSend(v40, "isEqual:", v12))
          objc_msgSend(v16, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE19D28]);
        objc_msgSend(v40, "dictionaryRepresentation");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKey:", v19, *MEMORY[0x24BE19D20]);

        COMeshControllerStateDescription(objc_msgSend(v9, "state"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKey:", v20, *MEMORY[0x24BE19D48]);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v9, "generation"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKey:", v21, *MEMORY[0x24BE19D08]);

        objc_msgSend(v9, "ballot");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          v42 = 0;
          v43 = &v42;
          v44 = 0x3032000000;
          v45 = __Block_byref_object_copy__14;
          v46 = __Block_byref_object_dispose__14;
          v47 = objc_alloc_init(MEMORY[0x24BDBCE30]);
          objc_msgSend(v22, "candidates");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v41[0] = MEMORY[0x24BDAC760];
          v41[1] = 3221225472;
          v41[2] = __60__COStateService_requestCompositionForCluster_withCallback___block_invoke_3;
          v41[3] = &unk_24D4B2B50;
          v41[4] = &v42;
          objc_msgSend(v23, "enumerateObjectsUsingBlock:", v41);

          objc_msgSend(v16, "setObject:forKey:", v43[5], *MEMORY[0x24BE19CF0]);
          _Block_object_dispose(&v42, 8);

        }
        v24 = objc_msgSend(v9, "electionStart");
        v25 = objc_msgSend(v9, "electionEnd");
        v26 = 0.0;
        v27 = 0.0;
        v28 = v25 >= v24;
        v29 = v25 - v24;
        if (v29 != 0 && v28)
        {
          v27 = (double)v29 / 1000000000.0;
          v26 = (double)(clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - v25) / 1000000000.0;
        }
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v26);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKey:", v30, *MEMORY[0x24BE19CC0]);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v27);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKey:", v31, *MEMORY[0x24BE19CB8]);

        v32 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v9, "pingMinimum");
        objc_msgSend(v32, "numberWithDouble:");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKey:", v33, *MEMORY[0x24BE19CD0]);

        v34 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v9, "pingMaximum");
        objc_msgSend(v34, "numberWithDouble:");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKey:", v35, *MEMORY[0x24BE19CC8]);

        objc_msgSend((id)v52[5], "arrayByAddingObject:", v16);
        v36 = objc_claimAutoreleasedReturnValue();
        v37 = (void *)v52[5];
        v52[5] = v36;

      }
    }
    v7[2](v7, v52[5], 0);
    _Block_object_dispose(&v51, 8);

  }
}

void __60__COStateService_requestCompositionForCluster_withCallback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
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
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  unsigned int v31;
  void *v32;
  _QWORD v33[5];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v3 = a2;
  objc_msgSend(v3, "node");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "state");
  v6 = objc_msgSend(v3, "status");
  v7 = objc_msgSend(v3, "lastGenerationReceived");
  objc_msgSend(v3, "lastBallotReceived");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastHeard");
  v9 = v8;
  v31 = objc_msgSend(v3, "hasOutstandingProbe");
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "IDSIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v11, *MEMORY[0x24BE19D18]);

  objc_msgSend(v4, "HomeKitIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v10, "setObject:forKey:", v12, *MEMORY[0x24BE19CE8]);
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v4, "remote");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqual:", *(_QWORD *)(a1 + 32));

    if (v14)
      objc_msgSend(v10, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE19D28]);
  }
  objc_msgSend(v4, "remote");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v17, *MEMORY[0x24BE19D20]);

  }
  COMeshControllerStateDescription(v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v18, *MEMORY[0x24BE19D48]);

  COMeshNodeStateTrackerStatusDescription(v6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v19, *MEMORY[0x24BE19D50]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v20, *MEMORY[0x24BE19D08]);

  if (v32)
  {
    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__14;
    v38 = __Block_byref_object_dispose__14;
    v39 = objc_alloc_init(MEMORY[0x24BDBCE30]);
    objc_msgSend(v32, "candidates");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __60__COStateService_requestCompositionForCluster_withCallback___block_invoke_2;
    v33[3] = &unk_24D4B2B50;
    v33[4] = &v34;
    objc_msgSend(v21, "enumerateObjectsUsingBlock:", v33);

    objc_msgSend(v10, "setObject:forKey:", v35[5], *MEMORY[0x24BE19CF0]);
    _Block_object_dispose(&v34, 8);

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v22, *MEMORY[0x24BE19D38]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v31);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v23, *MEMORY[0x24BE19D10]);

  v24 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "averageRequestTime");
  objc_msgSend(v24, "numberWithDouble:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v25, *MEMORY[0x24BE19D40]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "discoveryType"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v26, *MEMORY[0x24BE19D00]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "connectionType"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v27, *MEMORY[0x24BE19CF8]);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "arrayByAddingObject:", v10);
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v30 = *(void **)(v29 + 40);
  *(_QWORD *)(v29 + 40) = v28;

}

void __60__COStateService_requestCompositionForCluster_withCallback___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(a2, "dictionaryRepresentation");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObject:", v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __60__COStateService_requestCompositionForCluster_withCallback___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(a2, "dictionaryRepresentation");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObject:", v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)_setIsWriting:(BOOL)a3 forClient:(id)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  v13 = a4;
  -[COStateService connectedClients](self, "connectedClients");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  v9 = objc_msgSend(v8, "outstandingWriteCount");
  if (v4)
    v10 = v9 + 1;
  else
    v10 = v9 - 1;
  objc_msgSend(v8, "setOutstandingWriteCount:", v10);
  if (objc_msgSend(v8, "outstandingWriteCount") < 0)
    objc_msgSend(v8, "setOutstandingWriteCount:", 0);
  -[COStateService connectedClients](self, "connectedClients");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  objc_msgSend(v12, "setObject:forKey:", v8, v13);
  -[COStateService setConnectedClients:](self, "setConnectedClients:", v12);

}

- (void)_cleanupDisconnectedClient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id obj;
  void *v27;
  _QWORD v28[5];
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[COStateService connectedClients](self, "connectedClients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "outstandingWriteCount");
  COCoreLogForCategory(6);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7 < 1)
  {
    if (v9)
    {
      *(_DWORD *)buf = 134217984;
      v36 = v4;
      _os_log_impl(&dword_215E92000, v8, OS_LOG_TYPE_DEFAULT, "Cleaning up client %p ", buf, 0xCu);
    }
    v27 = v4;

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v6, "clusters");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v31 != v15)
            objc_enumerationMutation(obj);
          v17 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v6, "stateForCluster:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)MEMORY[0x24BDBCF20];
          objc_msgSend(v18, "allKeys");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setWithArray:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "suite");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKey:", v21, v23);

          -[COService _addOnForCluster:](self, "_addOnForCluster:", v17);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v28[0] = MEMORY[0x24BDAC760];
          v28[1] = 3221225472;
          v28[2] = __45__COStateService__cleanupDisconnectedClient___block_invoke;
          v28[3] = &unk_24D4B1CB0;
          v28[4] = v17;
          v29 = v27;
          objc_msgSend(v24, "sendStateUpdates:removals:withCallback:", 0, v22, v28);
          -[COService _releaseAssertionForCluster:](self, "_releaseAssertionForCluster:", v17);

        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v14);
    }

    -[COStateService connectedClients](self, "connectedClients");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v25, "mutableCopy");

    v4 = v27;
    objc_msgSend(v10, "removeObjectForKey:", v27);
    -[COStateService setConnectedClients:](self, "setConnectedClients:", v10);
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 134217984;
      v36 = v4;
      _os_log_impl(&dword_215E92000, v8, OS_LOG_TYPE_DEFAULT, "Client %p lost but it has outstanding writes. Defering cleanup", buf, 0xCu);
    }

    v10 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v10, "setDisconnected:", 1);
    -[COStateService connectedClients](self, "connectedClients");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    objc_msgSend(v12, "setObject:forKey:", v10, v4);
    -[COStateService setConnectedClients:](self, "setConnectedClients:", v12);

  }
}

void __45__COStateService__cleanupDisconnectedClient___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  COCoreLogForCategory(6);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412546;
    v6 = v3;
    v7 = 2048;
    v8 = v4;
    _os_log_impl(&dword_215E92000, v2, OS_LOG_TYPE_DEFAULT, "Removed keys for cluster %@ set by client %p", (uint8_t *)&v5, 0x16u);

  }
}

- (void)endpointAvailableInHomeChanged:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[COService dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__COStateService_endpointAvailableInHomeChanged___block_invoke;
  v6[3] = &unk_24D4B2BC8;
  v7 = a3;
  v6[4] = self;
  dispatch_async(v5, v6);

}

uint64_t __49__COStateService_endpointAvailableInHomeChanged___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  double v4;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  COCoreLogForCategory(6);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(a1 + 40))
      v3 = 89;
    else
      v3 = 78;
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_215E92000, v2, OS_LOG_TYPE_DEFAULT, "Endpoint availability changed to %c", (uint8_t *)v6, 8u);
  }

  v4 = 0.2;
  if (*(_BYTE *)(a1 + 40))
    v4 = 1.0;
  return objc_msgSend(*(id *)(a1 + 32), "setDoorbellDelay:", v4);
}

- (NSDictionary)connectedClients
{
  return self->_connectedClients;
}

- (void)setConnectedClients:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (COEndpointMonitor)endpointMonitor
{
  return self->_endpointMonitor;
}

- (void)setEndpointMonitor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (double)doorbellDelay
{
  return self->_doorbellDelay;
}

- (void)setDoorbellDelay:(double)a3
{
  self->_doorbellDelay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointMonitor, 0);
  objc_storeStrong((id *)&self->_connectedClients, 0);
}

void __66__COStateService_addObserverWithPredicate_suite_interestClusters___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_3_2(a1);
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_5(&dword_215E92000, v1, v2, "%p failed to notify client %d %@ of the initial state in cluster %@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

void __82__COStateService_setDictionary_suite_interestClusters_targetCluster_withCallback___block_invoke_3_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 56), "connection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "processIdentifier");
  OUTLINED_FUNCTION_0_5(&dword_215E92000, v2, v3, "Failed to set state %@ in cluster %@ for client %d. Error = %@", v4, v5, v6, v7, 2u);

}

void __61__COStateService_removeKeyPaths_targetClusters_withCallback___block_invoke_3_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *a2;
  v6 = 138412802;
  v7 = v3;
  v8 = 2112;
  v9 = v4;
  v10 = 2112;
  v11 = v5;
  _os_log_error_impl(&dword_215E92000, log, OS_LOG_TYPE_ERROR, "Failed to remove keyPaths %@ for cluster %@. Error = %@", (uint8_t *)&v6, 0x20u);
}

void __61__COStateService__informClientsOfUpdates_removals_inCluster___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_3_2(a1);
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_5(&dword_215E92000, v1, v2, "%p failed to notify client %d %@ of state changes in cluster %@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

@end
