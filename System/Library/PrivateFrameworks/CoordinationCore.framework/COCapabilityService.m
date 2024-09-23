@implementation COCapabilityService

+ (id)serviceWithDelegate:(id)a3
{
  id v3;
  COServiceListenerProvider *v4;
  COCapabilityAddOnProvider *v5;
  COCapabilityService *v6;

  v3 = a3;
  v4 = -[COServiceListenerProvider initWithServiceName:entitlement:]([COServiceListenerProvider alloc], "initWithServiceName:entitlement:", CFSTR("com.apple.coordination.capability"), CFSTR("com.apple.private.coordination.capability"));
  v5 = objc_alloc_init(COCapabilityAddOnProvider);
  v6 = -[COCapabilityService initWithListenerProvider:addOnProvider:delegate:]([COCapabilityService alloc], "initWithListenerProvider:addOnProvider:delegate:", v4, v5, v3);

  return v6;
}

- (COCapabilityService)initWithListenerProvider:(id)a3 addOnProvider:(id)a4 delegate:(id)a5
{
  COCapabilityService *v5;
  NSDictionary *v6;
  NSDictionary *capabilities;
  NSDictionary *v8;
  NSDictionary *observers;
  NSSet *v10;
  NSSet *supportedCapabilities;
  NSDictionary *v12;
  NSDictionary *availableCapabilities;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)COCapabilityService;
  v5 = -[COService initWithListenerProvider:addOnProvider:delegate:](&v15, sel_initWithListenerProvider_addOnProvider_delegate_, a3, a4, a5);
  if (v5)
  {
    v6 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCE70]);
    capabilities = v5->_capabilities;
    v5->_capabilities = v6;

    v8 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCE70]);
    observers = v5->_observers;
    v5->_observers = v8;

    v10 = (NSSet *)objc_alloc_init(MEMORY[0x24BDBCF20]);
    supportedCapabilities = v5->_supportedCapabilities;
    v5->_supportedCapabilities = v10;

    v12 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCE70]);
    availableCapabilities = v5->_availableCapabilities;
    v5->_availableCapabilities = v12;

    -[COService _serviceReady](v5, "_serviceReady");
  }
  return v5;
}

- (void)_configureServiceInterfacesOnConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)COCapabilityService;
  v4 = a3;
  -[COService _configureServiceInterfacesOnConnection:](&v10, sel__configureServiceInterfacesOnConnection_, v4);
  v5 = (void *)MEMORY[0x24BDD1990];
  v6 = &unk_254E20C88;
  objc_msgSend(v5, "interfaceWithProtocol:", v6, v10.receiver, v10.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExportedInterface:", v7);
  objc_msgSend(v4, "setExportedObject:", self);
  v8 = &unk_254E2D7D0;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setRemoteObjectInterface:", v9);
}

- (void)_clientLost:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  COCapabilityService *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)COCapabilityService;
  -[COService _clientLost:](&v26, sel__clientLost_, v4);
  -[COCapabilityService observers](self, "observers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v8)
  {
    v9 = v8;
    v21 = self;
    v10 = 0;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", v4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          v16 = (void *)objc_msgSend(v14, "mutableCopy");
          objc_msgSend(v16, "removeObjectForKey:", v4);
          if (objc_msgSend(v16, "count"))
          {
            v17 = (void *)objc_msgSend(v16, "copy");
            objc_msgSend(v6, "setObject:forKey:", v17, v13);

          }
          else
          {
            -[COService _releaseAssertionForCluster:](v21, "_releaseAssertionForCluster:", v13);
            objc_msgSend(v6, "removeObjectForKey:", v13);
          }

          v10 = 1;
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v9);

    self = v21;
    if ((v10 & 1) != 0)
      -[COCapabilityService setObservers:](v21, "setObservers:", v6);
  }
  else
  {

  }
  -[COCapabilityService capabilities](self, "capabilities");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKey:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)objc_msgSend(v18, "mutableCopy");
    objc_msgSend(v20, "removeObjectForKey:", v4);
    -[COCapabilityService setCapabilities:](self, "setCapabilities:", v20);
    -[COCapabilityService _updateSupportedCapabilities](self, "_updateSupportedCapabilities");

  }
}

- (void)_addOnAdded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[COCapabilityService supportedCapabilities](self, "supportedCapabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSupportedCapabilities:", v5);

  objc_msgSend(v4, "availableCapabilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[COService _clustersForAddOn:](self, "_clustersForAddOn:", v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[COCapabilityService _cluster:availableCapabilitiesChanged:](self, "_cluster:availableCapabilitiesChanged:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), v6);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  objc_msgSend(v4, "setDelegate:", self);
}

- (void)_addOnRemoved:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "setDelegate:", 0);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[COService _clustersForAddOn:](self, "_clustersForAddOn:", v4, 0);
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
        -[COCapabilityService _cluster:availableCapabilitiesChanged:](self, "_cluster:availableCapabilitiesChanged:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), 0);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (BOOL)_applicableToCluster:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "requiredServices") & 1;

  return v4;
}

- (void)joinClusters:(id)a3 usingMeshController:(id)a4 withClusterIdentifier:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  objc_super v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_initWeak(&location, self);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __89__COCapabilityService_joinClusters_usingMeshController_withClusterIdentifier_completion___block_invoke;
  v17[3] = &unk_24D4B27B8;
  objc_copyWeak(&v20, &location);
  v14 = v10;
  v18 = v14;
  v15 = v13;
  v19 = v15;
  v16.receiver = self;
  v16.super_class = (Class)COCapabilityService;
  -[COService joinClusters:usingMeshController:withClusterIdentifier:completion:](&v16, sel_joinClusters_usingMeshController_withClusterIdentifier_completion_, v14, v11, v12, v17);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

void __89__COCapabilityService_joinClusters_usingMeshController_withClusterIdentifier_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BE19DF0], "pairCluster");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3))
    {
      objc_msgSend(WeakRetained, "_addOnForCluster:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (v4)
      {
        objc_msgSend(v4, "_enableForPairLegacySupport");
      }
      else
      {
        COCoreLogForCategory(5);
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          __89__COCapabilityService_joinClusters_usingMeshController_withClusterIdentifier_completion___block_invoke_cold_1((uint64_t)WeakRetained, v6);

      }
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)registerCapability:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  COCapabilityService *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[COService currentClient](self, "currentClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[COCapabilityService capabilities](self, "capabilities");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v5);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!v7)
      v7 = objc_alloc_init(MEMORY[0x24BDBCF20]);
    if ((objc_msgSend(v7, "containsObject:", v4) & 1) == 0)
    {
      COCoreLogForCategory(5);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v11 = 134218498;
        v12 = self;
        v13 = 2112;
        v14 = v4;
        v15 = 2112;
        v16 = v5;
        _os_log_debug_impl(&dword_215E92000, v8, OS_LOG_TYPE_DEBUG, "%p registering Capability(%@) for Client(%@)", (uint8_t *)&v11, 0x20u);
      }

      objc_msgSend(v7, "setByAddingObject:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v6, "mutableCopy");
      objc_msgSend(v10, "setObject:forKey:", v9, v5);
      -[COCapabilityService setCapabilities:](self, "setCapabilities:", v10);
      -[COCapabilityService _updateSupportedCapabilities](self, "_updateSupportedCapabilities");

    }
  }

}

- (void)unregisterCapability:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  COCapabilityService *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[COService currentClient](self, "currentClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[COCapabilityService capabilities](self, "capabilities");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "containsObject:", v4))
    {
      COCoreLogForCategory(5);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v12 = 134218498;
        v13 = self;
        v14 = 2112;
        v15 = v4;
        v16 = 2112;
        v17 = v5;
        _os_log_debug_impl(&dword_215E92000, v8, OS_LOG_TYPE_DEBUG, "%p unregistering Capability(%@) for Client(%@)", (uint8_t *)&v12, 0x20u);
      }

      v9 = (void *)objc_msgSend(v7, "mutableCopy");
      objc_msgSend(v9, "removeObject:", v4);
      v10 = (void *)objc_msgSend(v6, "mutableCopy");
      v11 = (void *)objc_msgSend(v9, "copy");
      objc_msgSend(v10, "setObject:forKey:", v11, v5);

      -[COCapabilityService setCapabilities:](self, "setCapabilities:", v10);
      -[COCapabilityService _updateSupportedCapabilities](self, "_updateSupportedCapabilities");

    }
  }

}

- (void)addObserverForCapability:(id)a3 inCluster:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL8 v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  int v21;
  void *v22;
  uint8_t buf[4];
  COCapabilityService *v24;
  __int16 v25;
  _BYTE v26[34];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[COService currentClient](self, "currentClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[COCapabilityService _isCapabilityAvailable:inCluster:](self, "_isCapabilityAvailable:inCluster:", v6, v7);
  COCoreLogForCategory(5);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134219010;
    if (v9)
      v21 = 89;
    else
      v21 = 78;
    v24 = self;
    v25 = 1024;
    *(_DWORD *)v26 = v21;
    *(_WORD *)&v26[4] = 2112;
    *(_QWORD *)&v26[6] = v6;
    *(_WORD *)&v26[14] = 2112;
    *(_QWORD *)&v26[16] = v7;
    *(_WORD *)&v26[24] = 2112;
    *(_QWORD *)&v26[26] = v8;
    _os_log_debug_impl(&dword_215E92000, v10, OS_LOG_TYPE_DEBUG, "%p providing initial value(%c) for Capability(%@) in Cluster(%@) to Client(%@)", buf, 0x30u);
  }

  -[COCapabilityService _notifyClient:availability:ofCapability:inCluster:](self, "_notifyClient:availability:ofCapability:inCluster:", v8, v9, v6, v7);
  if (v8)
  {
    COCoreLogForCategory(5);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218754;
      v24 = self;
      v25 = 2112;
      *(_QWORD *)v26 = v6;
      *(_WORD *)&v26[8] = 2112;
      *(_QWORD *)&v26[10] = v7;
      *(_WORD *)&v26[18] = 2112;
      *(_QWORD *)&v26[20] = v8;
      _os_log_debug_impl(&dword_215E92000, v11, OS_LOG_TYPE_DEBUG, "%p adding observer for Capability(%@) in Cluster(%@) for Client(%@)", buf, 0x2Au);
    }

    -[COCapabilityService observers](self, "observers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v7);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      -[COService _takeAssertionForCluster:](self, "_takeAssertionForCluster:", v7);
      v13 = objc_alloc_init(MEMORY[0x24BDBCE70]);
    }
    objc_msgSend(v13, "objectForKey:", v8);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (!v14)
      v14 = objc_alloc_init(MEMORY[0x24BDBCF20]);
    objc_msgSend(v14, "setByAddingObject:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v13, "mutableCopy");
    objc_msgSend(v16, "setObject:forKey:", v15, v8);
    v17 = (void *)objc_msgSend(v12, "mutableCopy");
    v22 = v8;
    v18 = v12;
    v19 = v6;
    v20 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(v17, "setObject:forKey:", v20, v7);

    v6 = v19;
    -[COCapabilityService setObservers:](self, "setObservers:", v17);

    v8 = v22;
  }

}

- (void)removeObserverForCapability:(id)a3 inCluster:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  COCapabilityService *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[COService currentClient](self, "currentClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[COCapabilityService observers](self, "observers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "objectForKey:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "containsObject:", v6))
      {
        COCoreLogForCategory(5);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218754;
          v21 = self;
          v22 = 2112;
          v23 = v6;
          v24 = 2112;
          v25 = v7;
          v26 = 2112;
          v27 = v8;
          _os_log_debug_impl(&dword_215E92000, v13, OS_LOG_TYPE_DEBUG, "%p removing observer for Capability(%@) in Cluster(%@) for Client(%@)", buf, 0x2Au);
        }

        v14 = (void *)objc_msgSend(v12, "mutableCopy");
        objc_msgSend(v14, "removeObject:", v6);
        v15 = (void *)objc_msgSend(v11, "mutableCopy");
        if (objc_msgSend(v14, "count"))
        {
          v16 = (void *)objc_msgSend(v14, "copy");
          objc_msgSend(v15, "setObject:forKey:", v16, v8);

        }
        else
        {
          objc_msgSend(v15, "removeObjectForKey:", v8);
        }
        v17 = (void *)objc_msgSend(v9, "mutableCopy");
        if (objc_msgSend(v15, "count"))
        {
          v19 = v12;
          v18 = (void *)objc_msgSend(v15, "copy");
          objc_msgSend(v17, "setObject:forKey:", v18, v7);

          v12 = v19;
        }
        else
        {
          -[COService _releaseAssertionForCluster:](self, "_releaseAssertionForCluster:", v7);
          objc_msgSend(v17, "removeObjectForKey:", v7);
        }
        -[COCapabilityService setObservers:](self, "setObservers:", v17);

      }
    }

  }
}

- (void)addOn:(id)a3 availableCapabilitiesChanged:(id)a4
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
  block[2] = __58__COCapabilityService_addOn_availableCapabilitiesChanged___block_invoke;
  block[3] = &unk_24D4B08D0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __58__COCapabilityService_addOn_availableCapabilitiesChanged___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_clustersForAddOn:", *(_QWORD *)(a1 + 40), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 32), "_cluster:availableCapabilitiesChanged:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), *(_QWORD *)(a1 + 48));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_updateSupportedCapabilities
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  __int128 v32;
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
  _BYTE v44[128];
  uint8_t v45[128];
  uint8_t buf[4];
  COCapabilityService *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  id v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  -[COCapabilityService supportedCapabilities](self, "supportedCapabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  -[COCapabilityService capabilities](self, "capabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v41;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v41 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v5, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "unionSet:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
    }
    while (v7);
  }
  COCoreLogForCategory(5);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v47 = self;
    v48 = 2112;
    v49 = v3;
    v50 = 2112;
    v51 = v4;
    _os_log_impl(&dword_215E92000, v11, OS_LOG_TYPE_DEFAULT, "%p supported set changing from(%@) to(%@)", buf, 0x20u);
  }

  -[COCapabilityService setSupportedCapabilities:](self, "setSupportedCapabilities:", v4);
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[COService _uniqueAddOns](self, "_uniqueAddOns");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v37;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v37 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v16++), "setSupportedCapabilities:", v4);
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    }
    while (v14);
  }

  -[COCapabilityService supportedCapabilities](self, "supportedCapabilities");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x24BDBCF20];
  -[COService addOns](self, "addOns");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "allKeys");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setWithArray:", v20);
  v21 = objc_claimAutoreleasedReturnValue();

  -[COCapabilityService observers](self, "observers");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v22, "allKeys");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setWithArray:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = (void *)v21;
  objc_msgSend(v25, "minusSet:", v21);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v26 = v25;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v33;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v33 != v29)
          objc_enumerationMutation(v26);
        -[COCapabilityService _effectiveCapabilitiesForCluster:changedFrom:to:](self, "_effectiveCapabilitiesForCluster:changedFrom:to:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v30++), v3, v17);
      }
      while (v28 != v30);
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
    }
    while (v28);
  }

}

- (void)_cluster:(id)a3 availableCapabilitiesChanged:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[COCapabilityService _getEffectiveCapabilitiesForCluster:](self, "_getEffectiveCapabilitiesForCluster:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[COCapabilityService availableCapabilities](self, "availableCapabilities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  v10 = v9;
  if (v6)
    objc_msgSend(v9, "setObject:forKey:", v6, v12);
  else
    objc_msgSend(v9, "removeObjectForKey:", v12);
  -[COCapabilityService setAvailableCapabilities:](self, "setAvailableCapabilities:", v10);
  -[COCapabilityService _getEffectiveCapabilitiesForCluster:](self, "_getEffectiveCapabilitiesForCluster:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[COCapabilityService _effectiveCapabilitiesForCluster:changedFrom:to:](self, "_effectiveCapabilitiesForCluster:changedFrom:to:", v12, v7, v11);

}

- (void)_effectiveCapabilitiesForCluster:(id)a3 changedFrom:(id)a4 to:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[6];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  _BYTE v44[128];
  uint8_t v45[128];
  uint8_t buf[4];
  COCapabilityService *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__25;
  v42 = __Block_byref_object_dispose__25;
  v43 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__25;
  v36 = __Block_byref_object_dispose__25;
  v37 = 0;
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __71__COCapabilityService__effectiveCapabilitiesForCluster_changedFrom_to___block_invoke;
  v31[3] = &unk_24D4B4218;
  v31[4] = &v38;
  v31[5] = &v32;
  -[COCapabilityService _diffCapabilities:withCapabilities:result:](self, "_diffCapabilities:withCapabilities:result:", v9, v10, v31);
  if (objc_msgSend((id)v33[5], "count") || objc_msgSend((id)v39[5], "count"))
  {
    -[COCapabilityService _getEffectiveCapabilitiesForCluster:](self, "_getEffectiveCapabilitiesForCluster:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    COCoreLogForCategory(5);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v33[5];
      v14 = v39[5];
      *(_DWORD *)buf = 134219010;
      v47 = self;
      v48 = 2112;
      v49 = v8;
      v50 = 2112;
      v51 = v11;
      v52 = 2112;
      v53 = v13;
      v54 = 2112;
      v55 = v14;
      _os_log_impl(&dword_215E92000, v12, OS_LOG_TYPE_DEFAULT, "%p Capabilities changed in Cluster(%@). Now(%@), removing(%@), adding(%@)", buf, 0x34u);
    }

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v15 = (id)v33[5];
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v45, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v28;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v28 != v17)
            objc_enumerationMutation(v15);
          -[COCapabilityService _notifyObserversAvailabilityChangedOfCapability:inCluster:](self, "_notifyObserversAvailabilityChangedOfCapability:inCluster:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v18++), v8);
        }
        while (v16 != v18);
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v45, 16);
      }
      while (v16);
    }

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v19 = (id)v39[5];
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v23, v44, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v24;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v24 != v21)
            objc_enumerationMutation(v19);
          -[COCapabilityService _notifyObserversAvailabilityChangedOfCapability:inCluster:](self, "_notifyObserversAvailabilityChangedOfCapability:inCluster:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v22++), v8, (_QWORD)v23);
        }
        while (v20 != v22);
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v23, v44, 16);
      }
      while (v20);
    }

  }
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(&v38, 8);
}

void __71__COCapabilityService__effectiveCapabilitiesForCluster_changedFrom_to___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (id)_getEffectiveCapabilitiesForCluster:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[COCapabilityService availableCapabilities](self, "availableCapabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[COCapabilityService supportedCapabilities](self, "supportedCapabilities");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (BOOL)_isCapabilitySupported:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  int v8;
  int v10;
  COCapabilityService *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[COCapabilityService supportedCapabilities](self, "supportedCapabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);
  COCoreLogForCategory(5);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134218498;
    if (v6)
      v8 = 89;
    else
      v8 = 78;
    v11 = self;
    v12 = 2112;
    v13 = v4;
    v14 = 1024;
    v15 = v8;
    _os_log_impl(&dword_215E92000, v7, OS_LOG_TYPE_DEFAULT, "%p Capability(%@) supported: %c", (uint8_t *)&v10, 0x1Cu);
  }

  return v6;
}

- (BOOL)_isCapabilityAvailable:(id)a3 inCluster:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  int v15;
  int v17;
  COCapabilityService *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[COCapabilityService availableCapabilities](self, "availableCapabilities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = objc_msgSend(v9, "containsObject:", v6);
  }
  else
  {
    COCoreLogForCategory(5);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v17 = 134218498;
      v18 = self;
      v19 = 2112;
      v20 = v7;
      v21 = 2112;
      v22 = v6;
      _os_log_error_impl(&dword_215E92000, v12, OS_LOG_TYPE_ERROR, "%p No such Cluster(%@) for Capability(%@)", (uint8_t *)&v17, 0x20u);
    }

    v11 = -[COCapabilityService _isCapabilitySupported:](self, "_isCapabilitySupported:", v6);
  }
  v13 = v11;
  COCoreLogForCategory(5);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 134218754;
    if (v13)
      v15 = 89;
    else
      v15 = 78;
    v18 = self;
    v19 = 2112;
    v20 = v6;
    v21 = 2112;
    v22 = v7;
    v23 = 1024;
    v24 = v15;
    _os_log_impl(&dword_215E92000, v14, OS_LOG_TYPE_DEFAULT, "%p Resolved availability of Capability(%@) in Cluster(%@): %c", (uint8_t *)&v17, 0x26u);
  }

  return v13;
}

- (void)_diffCapabilities:(id)a3 withCapabilities:(id)a4 result:(id)a5
{
  void (**v7)(id, id, void *);
  id v8;
  id v9;
  void *v10;
  id v11;

  v7 = (void (**)(id, id, void *))a5;
  v8 = a4;
  v9 = a3;
  v11 = (id)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v11, "minusSet:", v9);
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v10, "minusSet:", v8);
  v7[2](v7, v11, v10);

}

- (void)_notifyObserversAvailabilityChangedOfCapability:(id)a3 inCluster:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  _BOOL8 v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[COCapabilityService observers](self, "observers");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "containsObject:", v6))
          objc_msgSend(v8, "addObject:", v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v11);
  }
  v16 = -[COCapabilityService _isCapabilityAvailable:inCluster:](self, "_isCapabilityAvailable:inCluster:", v6, v7);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v17 = v8;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v24 != v20)
          objc_enumerationMutation(v17);
        -[COCapabilityService _notifyClient:availability:ofCapability:inCluster:](self, "_notifyClient:availability:ofCapability:inCluster:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j), v16, v6, v7);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v19);
  }

}

- (void)_notifyClient:(id)a3 availability:(BOOL)a4 ofCapability:(id)a5 inCluster:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  BOOL v25;
  id location;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_initWeak(&location, self);
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __73__COCapabilityService__notifyClient_availability_ofCapability_inCluster___block_invoke;
  v20 = &unk_24D4B4240;
  objc_copyWeak(&v24, &location);
  v13 = v10;
  v21 = v13;
  v14 = v11;
  v22 = v14;
  v25 = v8;
  v15 = v12;
  v23 = v15;
  -[COCapabilityService _remoteInterfaceForClient:withErrorHandler:](self, "_remoteInterfaceForClient:withErrorHandler:", v13, &v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "availabilityChanged:ofCapability:inCluster:", v8, v14, v15, v17, v18, v19, v20);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

void __73__COCapabilityService__notifyClient_availability_ofCapability_inCluster___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    COCoreLogForCategory(5);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __73__COCapabilityService__notifyClient_availability_ofCapability_inCluster___block_invoke_cold_1((uint64_t)WeakRetained, a1, v3);

  }
}

- (id)_remoteInterfaceForClient:(id)a3 withErrorHandler:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  objc_msgSend(a3, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSDictionary)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSDictionary)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSSet)supportedCapabilities
{
  return self->_supportedCapabilities;
}

- (void)setSupportedCapabilities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSDictionary)availableCapabilities
{
  return self->_availableCapabilities;
}

- (void)setAvailableCapabilities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableCapabilities, 0);
  objc_storeStrong((id *)&self->_supportedCapabilities, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
}

void __89__COCapabilityService_joinClusters_usingMeshController_withClusterIdentifier_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_215E92000, a2, OS_LOG_TYPE_ERROR, "%p should have found the pair add-on!", (uint8_t *)&v2, 0xCu);
}

void __73__COCapabilityService__notifyClient_availability_ofCapability_inCluster___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  int v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a2 + 32);
  v4 = *(_QWORD *)(a2 + 40);
  if (*(_BYTE *)(a2 + 64))
    v5 = 89;
  else
    v5 = 78;
  v6 = *(_QWORD *)(a2 + 48);
  v7 = 134219010;
  v8 = a1;
  v9 = 2112;
  v10 = v3;
  v11 = 2112;
  v12 = v4;
  v13 = 1024;
  v14 = v5;
  v15 = 2112;
  v16 = v6;
  _os_log_error_impl(&dword_215E92000, log, OS_LOG_TYPE_ERROR, "%p failed to notify Client(%@) of Capability(%@) availability(%c) in Cluster(%@)", (uint8_t *)&v7, 0x30u);
}

@end
