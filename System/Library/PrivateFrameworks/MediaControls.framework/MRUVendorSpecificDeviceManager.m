@implementation MRUVendorSpecificDeviceManager

- (MRUVendorSpecificDeviceManager)initWithAppBundleID:(id)a3 serviceIdentifiers:(id)a4
{
  id v7;
  id v8;
  MRUVendorSpecificDeviceManager *v9;
  MRUVendorSpecificDeviceManager *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *deviceMap;
  NSMutableDictionary *v13;
  NSMutableDictionary *coalescedDeviceMap;
  NSMutableDictionary *v15;
  NSMutableDictionary *activatingDeviceMap;
  NSMutableDictionary *v17;
  NSMutableDictionary *activatedDeviceMap;
  NSMutableDictionary *v19;
  NSMutableDictionary *invalidatingDeviceMap;
  NSMutableDictionary *v21;
  NSMutableDictionary *groupableDeviceIDs;
  NSMutableSet *v23;
  NSMutableSet *mutableResolverManagedAirPlayRouteIDs;
  DADeviceResolver *v25;
  DADeviceResolver *resolver;
  _QWORD v28[4];
  id v29;
  id location;
  objc_super v31;

  v7 = a3;
  v8 = a4;
  v31.receiver = self;
  v31.super_class = (Class)MRUVendorSpecificDeviceManager;
  v9 = -[MRUVendorSpecificDeviceManager init](&v31, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_appBundleID, a3);
    objc_storeStrong((id *)&v10->_serviceIdentifiers, a4);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    deviceMap = v10->_deviceMap;
    v10->_deviceMap = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    coalescedDeviceMap = v10->_coalescedDeviceMap;
    v10->_coalescedDeviceMap = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    activatingDeviceMap = v10->_activatingDeviceMap;
    v10->_activatingDeviceMap = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    activatedDeviceMap = v10->_activatedDeviceMap;
    v10->_activatedDeviceMap = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    invalidatingDeviceMap = v10->_invalidatingDeviceMap;
    v10->_invalidatingDeviceMap = v19;

    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    groupableDeviceIDs = v10->_groupableDeviceIDs;
    v10->_groupableDeviceIDs = v21;

    v23 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    mutableResolverManagedAirPlayRouteIDs = v10->_mutableResolverManagedAirPlayRouteIDs;
    v10->_mutableResolverManagedAirPlayRouteIDs = v23;

    v25 = (DADeviceResolver *)objc_alloc_init(MEMORY[0x1E0D1D0C0]);
    resolver = v10->_resolver;
    v10->_resolver = v25;

    -[DADeviceResolver setBundleID:](v10->_resolver, "setBundleID:", v7);
    objc_initWeak(&location, v10);
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __73__MRUVendorSpecificDeviceManager_initWithAppBundleID_serviceIdentifiers___block_invoke;
    v28[3] = &unk_1E5819728;
    objc_copyWeak(&v29, &location);
    -[DADeviceResolver setEventHandler:](v10->_resolver, "setEventHandler:", v28);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __73__MRUVendorSpecificDeviceManager_initWithAppBundleID_serviceIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "handleResolverEvent:", v3);

}

- (NSArray)devices
{
  void *v3;

  if (-[NSMutableDictionary count](self->_deviceMap, "count"))
  {
    -[NSMutableDictionary allValues](self->_deviceMap, "allValues");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  return (NSArray *)v3;
}

- (NSArray)coalescedDevices
{
  void *v3;

  if (-[NSMutableDictionary count](self->_coalescedDeviceMap, "count"))
  {
    -[NSMutableDictionary allValues](self->_coalescedDeviceMap, "allValues");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  return (NSArray *)v3;
}

- (NSArray)activatedDeviceIDs
{
  void *v3;
  void *v4;

  if (-[NSMutableDictionary count](self->_activatedDeviceMap, "count"))
  {
    -[NSMutableDictionary allValues](self->_activatedDeviceMap, "allValues");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "msv_map:", &__block_literal_global_9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  return (NSArray *)v4;
}

uint64_t __52__MRUVendorSpecificDeviceManager_activatedDeviceIDs__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (NSArray)activatingDeviceIDs
{
  void *v3;
  void *v4;

  if (-[NSMutableDictionary count](self->_activatingDeviceMap, "count"))
  {
    -[NSMutableDictionary allValues](self->_activatingDeviceMap, "allValues");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "msv_map:", &__block_literal_global_4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  return (NSArray *)v4;
}

uint64_t __53__MRUVendorSpecificDeviceManager_activatingDeviceIDs__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (NSArray)invalidatingDeviceIDs
{
  void *v3;
  void *v4;

  if (-[NSMutableDictionary count](self->_invalidatingDeviceMap, "count"))
  {
    -[NSMutableDictionary allValues](self->_invalidatingDeviceMap, "allValues");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "msv_map:", &__block_literal_global_5_0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  return (NSArray *)v4;
}

uint64_t __55__MRUVendorSpecificDeviceManager_invalidatingDeviceIDs__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (NSArray)pendingDeviceIDs
{
  void *v3;
  void *v4;
  void *v5;

  -[MRUVendorSpecificDeviceManager activatingDeviceIDs](self, "activatingDeviceIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUVendorSpecificDeviceManager invalidatingDeviceIDs](self, "invalidatingDeviceIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (NSArray)availableDeviceIDs
{
  void *v2;
  void *v3;
  void *v4;

  -[MRUVendorSpecificDeviceManager deviceMap](self, "deviceMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "msv_map:", &__block_literal_global_6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

uint64_t __52__MRUVendorSpecificDeviceManager_availableDeviceIDs__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (NSArray)resolverManagedAirPlayRouteIDs
{
  return (NSArray *)-[NSMutableSet allObjects](self->_mutableResolverManagedAirPlayRouteIDs, "allObjects");
}

- (int64_t)latestStateForDevice:(id)a3
{
  id v4;
  NSMutableDictionary *deviceMap;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  int64_t v11;

  v4 = a3;
  deviceMap = self->_deviceMap;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](deviceMap, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = self->_deviceMap;
    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "state");

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isGroupingAvailableForDevice:(id)a3
{
  id v4;
  NSMutableDictionary *groupableDeviceIDs;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "supportsGrouping"))
  {
    groupableDeviceIDs = self->_groupableDeviceIDs;
    objc_msgSend(v4, "protocolType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](groupableDeviceIDs, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 && (unint64_t)objc_msgSend(v8, "count") >= 2)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v19;
        while (2)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v19 != v12)
              objc_enumerationMutation(v9);
            -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceMap, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), (_QWORD)v18);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "state");

            if (v15 == 20)
            {
              v16 = 1;
              v8 = v9;
              goto LABEL_16;
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v11)
            continue;
          break;
        }
      }
      v16 = 0;
LABEL_16:

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)isGroupingAvailableFor:(id)a3 activatedIDs:(id)a4 forProtocolID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  unsigned __int8 v14;
  char v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "count"))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_groupableDeviceIDs, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v12 = v8;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v13)
      {
        v20 = v10;
        v21 = v8;
        v14 = 0;
        v15 = 0;
        v16 = *(_QWORD *)v23;
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v23 != v16)
              objc_enumerationMutation(v12);
            v18 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
            if (objc_msgSend(v11, "containsObject:", v18, v20, v21, (_QWORD)v22))
            {
              ++v14;
              if (objc_msgSend(v9, "containsObject:", v18))
                v15 = 1;
              if (v14 >= 2u && v15)
              {
                LOBYTE(v13) = 1;
                goto LABEL_19;
              }
            }
          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          if (v13)
            continue;
          break;
        }
LABEL_19:
        v10 = v20;
        v8 = v21;
      }

    }
    else
    {
      LOBYTE(v13) = 0;
    }

  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (void)startDiscovery
{
  id v3;
  DADiscovery *v4;
  DADiscovery *discovery;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  id v10;
  id location;

  if (!self->_discovery)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0D1D0D0]);
    objc_msgSend(v3, "setBundleID:", self->_appBundleID);
    objc_msgSend(v3, "setBluetoothServices:", MEMORY[0x1E0C9AA60]);
    v4 = (DADiscovery *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D0C8]), "initWithConfiguration:error:", v3, 0);
    discovery = self->_discovery;
    self->_discovery = v4;

    objc_initWeak(&location, self);
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __48__MRUVendorSpecificDeviceManager_startDiscovery__block_invoke;
    v9 = &unk_1E5819728;
    objc_copyWeak(&v10, &location);
    -[DADiscovery setEventHandler:](self->_discovery, "setEventHandler:", &v6);
    -[DADiscovery activate](self->_discovery, "activate", v6, v7, v8, v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);

  }
}

void __48__MRUVendorSpecificDeviceManager_startDiscovery__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "handleDiscoveryEvent:", v3);

}

- (void)updateLocalMapWith:(id)a3 deviceIsLost:(BOOL)a4
{
  _BOOL4 v4;
  NSMutableDictionary *deviceMap;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  NSMutableDictionary *groupableDeviceIDs;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSMutableDictionary *v26;
  void *v27;
  void *v28;
  NSMutableDictionary *v29;
  void *v30;
  uint64_t v31;
  BOOL v32;
  void *v33;
  NSMutableDictionary *v34;
  void *v35;
  NSMutableDictionary *v36;
  id v37;
  NSMutableDictionary *activatingDeviceMap;
  void *v39;
  NSMutableDictionary *activatedDeviceMap;
  void *v41;
  NSMutableDictionary *invalidatingDeviceMap;
  NSMutableDictionary *v43;
  id v44;
  NSMutableDictionary *v45;
  NSMutableDictionary *v46;
  void *v47;
  NSMutableDictionary *v48;
  id v49;
  NSMutableDictionary *v50;
  void *v51;
  NSMutableDictionary *v52;
  NSMutableDictionary *v53;
  id v54;

  v4 = a4;
  v54 = a3;
  deviceMap = self->_deviceMap;
  objc_msgSend(v54, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](deviceMap, "setObject:forKeyedSubscript:", v54, v7);

    v19 = objc_msgSend(v54, "supportsGrouping");
    groupableDeviceIDs = self->_groupableDeviceIDs;
    objc_msgSend(v54, "protocolType");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](groupableDeviceIDs, "objectForKeyedSubscript:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v19)
    {

      if (!v24)
      {
        v25 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v26 = self->_groupableDeviceIDs;
        objc_msgSend(v54, "protocolType");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "identifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v26, "setObject:forKeyedSubscript:", v25, v28);

      }
      v29 = self->_groupableDeviceIDs;
      objc_msgSend(v54, "protocolType");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](v29, "objectForKeyedSubscript:", v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "identifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addObject:", v30);
    }
    else
    {
      objc_msgSend(v54, "identifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "removeObject:", v30);
    }

    v31 = objc_msgSend(v54, "state");
    if (v31 > 19)
    {
      if (v31 != 20)
      {
        v32 = v31 == 30;
        v33 = v54;
        if (!v32)
          goto LABEL_23;
        activatingDeviceMap = self->_activatingDeviceMap;
        objc_msgSend(v54, "identifier");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](activatingDeviceMap, "setObject:forKeyedSubscript:", 0, v39);

        activatedDeviceMap = self->_activatedDeviceMap;
        objc_msgSend(v54, "identifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](activatedDeviceMap, "setObject:forKeyedSubscript:", 0, v41);

        invalidatingDeviceMap = self->_invalidatingDeviceMap;
        objc_msgSend(v54, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = invalidatingDeviceMap;
        v44 = v54;
        goto LABEL_21;
      }
      v50 = self->_activatingDeviceMap;
      objc_msgSend(v54, "identifier");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v50, "setObject:forKeyedSubscript:", 0, v51);

      v52 = self->_activatedDeviceMap;
      objc_msgSend(v54, "identifier");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v52;
      v49 = v54;
    }
    else
    {
      if (v31)
      {
        v32 = v31 == 10;
        v33 = v54;
        if (!v32)
          goto LABEL_23;
        v34 = self->_activatingDeviceMap;
        objc_msgSend(v54, "identifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v34;
        v37 = v54;
      }
      else
      {
        v45 = self->_activatingDeviceMap;
        objc_msgSend(v54, "identifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v45;
        v37 = 0;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](v36, "setObject:forKeyedSubscript:", v37, v35);

      v46 = self->_activatedDeviceMap;
      objc_msgSend(v54, "identifier");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v46;
      v49 = 0;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](v48, "setObject:forKeyedSubscript:", v49, v47);

    v53 = self->_invalidatingDeviceMap;
    objc_msgSend(v54, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v53;
    v44 = 0;
LABEL_21:
    -[NSMutableDictionary setObject:forKeyedSubscript:](v43, "setObject:forKeyedSubscript:", v44, v15);
    goto LABEL_22;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](deviceMap, "setObject:forKeyedSubscript:", 0, v7);

  v8 = self->_activatingDeviceMap;
  objc_msgSend(v54, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", 0, v9);

  v10 = self->_activatedDeviceMap;
  objc_msgSend(v54, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", 0, v11);

  v12 = self->_invalidatingDeviceMap;
  objc_msgSend(v54, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", 0, v13);

  v14 = self->_groupableDeviceIDs;
  objc_msgSend(v54, "protocolType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "removeObject:", v18);

LABEL_22:
  v33 = v54;
LABEL_23:

}

- (void)resolverSetLastSelectedRoute:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v14;
    v5 = objc_alloc_init(MEMORY[0x1E0D1D0D8]);
    if (objc_msgSend(v4, "isAirPlayRoute"))
    {
      objc_msgSend(v4, "underlyingNativeRoute");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "routeUID");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = (void *)v7;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-AirPlay"), v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setIdentifier:", v9);

        -[DADeviceResolver selectEndpoint:](self->_resolver, "selectEndpoint:", v5);
      }
      goto LABEL_9;
    }
    objc_msgSend(v4, "device");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-DeviceAccess"), v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setIdentifier:", v13);

      -[DADeviceResolver selectEndpoint:](self->_resolver, "selectEndpoint:", v5);
LABEL_9:

    }
LABEL_10:

    goto LABEL_11;
  }
  v4 = objc_alloc_init(MEMORY[0x1E0D1D0D8]);
  objc_msgSend(v14, "routeUID");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v5 = (id)v10;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-AirPlay"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIdentifier:", v11);

    -[DADeviceResolver selectEndpoint:](self->_resolver, "selectEndpoint:", v4);
    goto LABEL_10;
  }
LABEL_11:

}

- (void)resolverAddNativeRoutes:(id)a3
{
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v17;
    *(_QWORD *)&v6 = 138412546;
    v15 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "routeUID", v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          if (-[MRUVendorSpecificDeviceManager resolverAddNativeRoute:forRouteUID:](self, "resolverAddNativeRoute:forRouteUID:", v10, v11))
          {
            -[NSMutableSet addObject:](self->_mutableResolverManagedAirPlayRouteIDs, "addObject:", v11);
          }
          else
          {
            MCLogCategoryDeviceAccess();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v10, "routeName");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "dnsNames");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v15;
              v21 = v13;
              v22 = 2112;
              v23 = v14;
              _os_log_impl(&dword_1AA991000, v12, OS_LOG_TYPE_DEFAULT, "Resolver: not able to find a proper dnsName for route: %@, its DNS Names are: %@", buf, 0x16u);

            }
            -[NSMutableSet removeObject:](self->_mutableResolverManagedAirPlayRouteIDs, "removeObject:", v11);
          }
        }

      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v7);
  }

}

- (void)resolverRemoveNativeRoutes:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "routeUID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[MRUVendorSpecificDeviceManager resolverRemoveNativeRouteforRouteUID:](self, "resolverRemoveNativeRouteforRouteUID:", v9);
          -[NSMutableSet removeObject:](self->_mutableResolverManagedAirPlayRouteIDs, "removeObject:", v9);
        }

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)resolverAddVendorSpecificDevice:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0D1D0D8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-DeviceAccess"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIdentifier:", v6);

    objc_msgSend(v12, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setName:", v7);

    objc_msgSend(v12, "protocolType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setProtocolTypeString:", v9);

    objc_msgSend(v5, "setUnderlyingDADevice:", v12);
    objc_msgSend(v12, "networkEndpoint");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBonjourFullName:", v11);

    -[DADeviceResolver addEndpoint:](self->_resolver, "addEndpoint:", v5);
  }

}

- (void)resolverRemoveVendorSpecificRoute:(id)a3
{
  id v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D1D0D8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-DeviceAccess"), v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIdentifier:", v5);

    -[DADeviceResolver removeEndpoint:](self->_resolver, "removeEndpoint:", v4);
  }

}

- (BOOL)resolverAddNativeRoute:(id)a3 forRouteUID:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  unint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  void *v28;
  void *v29;
  const char *v30;
  BOOL v31;
  void *v32;
  void *v33;
  NSObject *v35;
  id v36;
  void *v37;
  void *v38;
  MRUVendorSpecificDeviceManager *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint8_t v61[128];
  uint8_t buf[4];
  id v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  objc_msgSend(v8, "dnsNames");
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
  if (v44)
  {
    v39 = self;
    v45 = *(_QWORD *)v57;
    v10 = 0x1E0D1D000uLL;
    v40 = v8;
    v43 = v9;
    while (2)
    {
      for (i = 0; i != v44; ++i)
      {
        if (*(_QWORD *)v57 != v45)
          objc_enumerationMutation(v9);
        v12 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        if (objc_msgSend(v12, "containsString:", CFSTR("_airplay._tcp")))
        {
          MCLogCategoryDeviceAccess();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v63 = v12;
            _os_log_impl(&dword_1AA991000, v13, OS_LOG_TYPE_DEFAULT, "dnsName: %@", buf, 0xCu);
          }

          v14 = objc_alloc_init(*(Class *)(v10 + 216));
          objc_msgSend(v14, "setAirplayDeviceID:", v7);
          objc_msgSend(v12, "componentsSeparatedByString:", CFSTR("\x1E"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = 0u;
          v53 = 0u;
          v54 = 0u;
          v55 = 0u;
          v16 = v15;
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
          if (v17)
          {
            v18 = v17;
            v46 = *(_QWORD *)v53;
            v41 = v7;
            v42 = v16;
            do
            {
              for (j = 0; j != v18; ++j)
              {
                if (*(_QWORD *)v53 != v46)
                  objc_enumerationMutation(v16);
                v20 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * j);
                if ((objc_msgSend(v20, "containsString:", CFSTR(":")) & 1) != 0
                  || !objc_msgSend(v20, "containsString:", CFSTR(".local.")))
                {
                  MCLogCategoryDeviceAccess();
                  v22 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v63 = v20;
                    _os_log_impl(&dword_1AA991000, v22, OS_LOG_TYPE_DEFAULT, "AirPlay DNSName Parsing: Skip wrong string: %@", buf, 0xCu);
                  }
                }
                else
                {
                  objc_msgSend(v20, "componentsSeparatedByString:", CFSTR("%"));
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  v48 = 0u;
                  v49 = 0u;
                  v50 = 0u;
                  v51 = 0u;
                  v22 = v21;
                  v23 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
                  if (v23)
                  {
                    v24 = v23;
                    v25 = *(_QWORD *)v49;
                    while (2)
                    {
                      for (k = 0; k != v24; ++k)
                      {
                        if (*(_QWORD *)v49 != v25)
                          objc_enumerationMutation(v22);
                        v27 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * k);
                        if (objc_msgSend(v27, "containsString:", CFSTR(".local.")))
                        {
                          objc_msgSend(v14, "setBonjourFullName:", v27);
                          objc_msgSend(v14, "setProtocolTypeString:", CFSTR("com.apple.airplay"));
                          v8 = v40;
                          objc_msgSend(v40, "routeName");
                          v32 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v14, "setName:", v32);

                          v7 = v41;
                          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-AirPlay"), v41);
                          v33 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v14, "setIdentifier:", v33);

                          -[DADeviceResolver addEndpoint:](v39->_resolver, "addEndpoint:", v14);
                          v9 = v43;
                          goto LABEL_35;
                        }
                      }
                      v24 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
                      if (v24)
                        continue;
                      break;
                    }
                  }

                  v10 = 0x1E0D1D000;
                  v16 = v42;
                }

              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
              v7 = v41;
            }
            while (v18);
          }

          v9 = v43;
        }
        else
        {
          objc_msgSend(v12, "componentsSeparatedByString:", CFSTR(":"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          v14 = objc_retainAutorelease(v29);
          v30 = (const char *)objc_msgSend(v14, "UTF8String");
          v47 = 0;
          if (inet_pton(2, v30, &v47) >= 1)
          {
            MCLogCategoryDeviceAccess();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v63 = v14;
              _os_log_impl(&dword_1AA991000, v35, OS_LOG_TYPE_DEFAULT, "found IPv4 address: %@", buf, 0xCu);
            }

            v36 = objc_alloc_init(*(Class *)(v10 + 216));
            objc_msgSend(v36, "setAirplayDeviceID:", v7);
            objc_msgSend(v36, "setProtocolTypeString:", CFSTR("com.apple.airplay"));
            v8 = v40;
            objc_msgSend(v40, "routeName");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "setName:", v37);

            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-AirPlay"), v7);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "setIdentifier:", v38);

            objc_msgSend(v36, "setIpv4String:", v14);
            -[DADeviceResolver addEndpoint:](v39->_resolver, "addEndpoint:", v36);

LABEL_35:
            v31 = 1;
            goto LABEL_37;
          }
        }

      }
      v31 = 0;
      v8 = v40;
      v44 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
      if (v44)
        continue;
      break;
    }
  }
  else
  {
    v31 = 0;
  }
LABEL_37:

  return v31;
}

- (void)resolverRemoveNativeRouteforRouteUID:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (objc_class *)MEMORY[0x1E0D1D0D8];
  v5 = a3;
  v7 = objc_alloc_init(v4);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-AirPlay"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setIdentifier:", v6);
  -[DADeviceResolver removeEndpoint:](self->_resolver, "removeEndpoint:", v7);

}

- (void)connectToDevice:(id)a3
{
  id v4;
  NSMutableDictionary *groupableDeviceIDs;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  void *v18;
  DADiscovery *discovery;
  id v20;
  id v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  MRUVendorSpecificDeviceManager *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "supportsGrouping"))
  {
    groupableDeviceIDs = self->_groupableDeviceIDs;
    objc_msgSend(v4, "protocolType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](groupableDeviceIDs, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  v22 = v4;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[MRUVendorSpecificDeviceManager devices](self, "devices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
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
        v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (objc_msgSend(v14, "state") == 10 || objc_msgSend(v14, "state") == 20)
        {
          objc_msgSend(v14, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v8, "containsObject:", v15);

          if ((v16 & 1) == 0)
          {
            MCLogCategoryDeviceAccess();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v14, "state");
              DADeviceStateToString();
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v32 = v18;
              v33 = 2112;
              v34 = v14;
              _os_log_impl(&dword_1AA991000, v17, OS_LOG_TYPE_DEFAULT, "Automatically unselecting %@ vendor specific device: %@", buf, 0x16u);

            }
            -[DADiscovery setState:device:completionHandler:](self->_discovery, "setState:device:completionHandler:", 30, v14, &__block_literal_global_28);
          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v11);
  }

  discovery = self->_discovery;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __50__MRUVendorSpecificDeviceManager_connectToDevice___block_invoke_29;
  v23[3] = &unk_1E5819870;
  v24 = v22;
  v25 = v8;
  v26 = self;
  v20 = v8;
  v21 = v22;
  -[DADiscovery getAuthorizedDevices:](discovery, "getAuthorizedDevices:", v23);

}

void __50__MRUVendorSpecificDeviceManager_connectToDevice___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  MCLogCategoryDeviceAccess();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1AA991000, v3, OS_LOG_TYPE_DEFAULT, "set state error: %@", (uint8_t *)&v4, 0xCu);
  }

}

void __50__MRUVendorSpecificDeviceManager_connectToDevice___block_invoke_29(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  MCLogCategoryDeviceAccess();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v29 = objc_msgSend(v3, "count");
    v30 = 2112;
    v31 = v3;
    _os_log_impl(&dword_1AA991000, v4, OS_LOG_TYPE_DEFAULT, "%lu authorized devices to unselect first, %@", buf, 0x16u);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v24;
    *(_QWORD *)&v7 = 138412290;
    v22 = v7;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v10);
        if (objc_msgSend(v11, "state", v22, (_QWORD)v23) == 25
          && (objc_msgSend(v11, "identifier"),
              v12 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(*(id *)(a1 + 32), "identifier"),
              v13 = (void *)objc_claimAutoreleasedReturnValue(),
              v14 = objc_msgSend(v12, "isEqualToString:", v13),
              v13,
              v12,
              (v14 & 1) == 0))
        {
          v16 = *(void **)(a1 + 40);
          objc_msgSend(v11, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v16) = objc_msgSend(v16, "containsObject:", v17);

          if ((v16 & 1) == 0)
          {
            MCLogCategoryDeviceAccess();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v22;
              v29 = (uint64_t)v11;
              _os_log_impl(&dword_1AA991000, v18, OS_LOG_TYPE_DEFAULT, "Automatically unselecting authorized vendor specific device: %@", buf, 0xCu);
            }

            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 32), "setState:device:completionHandler:", 30, v11, &__block_literal_global_31);
          }
        }
        else
        {
          MCLogCategoryDeviceAccess();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v22;
            v29 = (uint64_t)v11;
            _os_log_impl(&dword_1AA991000, v15, OS_LOG_TYPE_DEFAULT, "Did not unselect authorized device: %@", buf, 0xCu);
          }

        }
        ++v10;
      }
      while (v8 != v10);
      v19 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      v8 = v19;
    }
    while (v19);
  }

  MCLogCategoryDeviceAccess();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v29 = v21;
    _os_log_impl(&dword_1AA991000, v20, OS_LOG_TYPE_DEFAULT, "Connecting to picked device: %@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 32), "setState:device:completionHandler:", 10, *(_QWORD *)(a1 + 32), &__block_literal_global_33);
}

void __50__MRUVendorSpecificDeviceManager_connectToDevice___block_invoke_30(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  MCLogCategoryDeviceAccess();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1AA991000, v3, OS_LOG_TYPE_DEFAULT, "set state error: %@", (uint8_t *)&v4, 0xCu);
  }

}

void __50__MRUVendorSpecificDeviceManager_connectToDevice___block_invoke_32(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  MCLogCategoryDeviceAccess();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1AA991000, v3, OS_LOG_TYPE_DEFAULT, "set state error: %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)disconnectAllDevices
{
  NSObject *v3;
  DADiscovery *discovery;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[5];
  uint8_t buf[8];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  MCLogCategoryDeviceAccess();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AA991000, v3, OS_LOG_TYPE_DEFAULT, "Unselecting all vendor specific devices", buf, 2u);
  }

  discovery = self->_discovery;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __54__MRUVendorSpecificDeviceManager_disconnectAllDevices__block_invoke;
  v15[3] = &unk_1E5819898;
  v15[4] = self;
  -[DADiscovery getAuthorizedDevices:](discovery, "getAuthorizedDevices:", v15);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[MRUVendorSpecificDeviceManager devices](self, "devices", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v10, "state") == 10 || objc_msgSend(v10, "state") == 20)
          -[DADiscovery setState:device:completionHandler:](self->_discovery, "setState:device:completionHandler:", 30, v10, &__block_literal_global_36);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    }
    while (v7);
  }

}

void __54__MRUVendorSpecificDeviceManager_disconnectAllDevices__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v11, "state") == 25)
        {
          v12 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
          v13[0] = MEMORY[0x1E0C809B0];
          v13[1] = 3221225472;
          v13[2] = __54__MRUVendorSpecificDeviceManager_disconnectAllDevices__block_invoke_2;
          v13[3] = &unk_1E5819098;
          v14 = v6;
          objc_msgSend(v12, "setState:device:completionHandler:", 30, v11, v13);

        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

void __54__MRUVendorSpecificDeviceManager_disconnectAllDevices__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  MCLogCategoryDeviceAccess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_1AA991000, v2, OS_LOG_TYPE_DEFAULT, "set state error: %@", (uint8_t *)&v4, 0xCu);
  }

}

void __54__MRUVendorSpecificDeviceManager_disconnectAllDevices__block_invoke_35(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  MCLogCategoryDeviceAccess();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1AA991000, v3, OS_LOG_TYPE_DEFAULT, "set state error: %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)stopDiscovery
{
  DADiscovery *discovery;

  -[DADiscovery invalidate](self->_discovery, "invalidate");
  -[NSMutableDictionary removeAllObjects](self->_deviceMap, "removeAllObjects");
  discovery = self->_discovery;
  self->_discovery = 0;

}

- (void)setDevice:(id)a3 picked:(BOOL)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  NSMutableDictionary *deviceMap;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  MCLogCategoryDeviceAccess();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = v7;
    _os_log_impl(&dword_1AA991000, v6, OS_LOG_TYPE_DEFAULT, "setting picked for device: %@", (uint8_t *)&v14, 0xCu);

  }
  deviceMap = self->_deviceMap;
  objc_msgSend(v5, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](deviceMap, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    MCLogCategoryDeviceAccess();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1AA991000, v12, OS_LOG_TYPE_DEFAULT, "Picked device from UI is not found in the device map, some discrepancy happened", (uint8_t *)&v14, 2u);
    }
    goto LABEL_15;
  }
  v11 = objc_msgSend(v10, "state");
  if (v11 > 19)
  {
    if (v11 == 20)
    {
      -[DADiscovery setState:device:completionHandler:](self->_discovery, "setState:device:completionHandler:", 30, v10, &__block_literal_global_37);
      goto LABEL_18;
    }
    if (v11 != 25)
    {
      if (v11 != 30)
        goto LABEL_18;
      goto LABEL_13;
    }
LABEL_16:
    -[MRUVendorSpecificDeviceManager connectToDevice:](self, "connectToDevice:", v10);
    goto LABEL_18;
  }
  if (!v11)
    goto LABEL_16;
  if (v11 == 10)
  {
LABEL_13:
    MCLogCategoryDeviceAccess();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "state");
      DADeviceStateToString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v13;
      _os_log_impl(&dword_1AA991000, v12, OS_LOG_TYPE_DEFAULT, "Not sending the pick event again because device is already in a pending state: %@", (uint8_t *)&v14, 0xCu);

    }
LABEL_15:

  }
LABEL_18:

}

void __51__MRUVendorSpecificDeviceManager_setDevice_picked___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  MCLogCategoryDeviceAccess();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1AA991000, v3, OS_LOG_TYPE_DEFAULT, "set state error: %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)handleResolverEvent:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSMutableDictionary *coalescedDeviceMap;
  void *v27;
  MRUVendorSpecificDeviceManager *v28;
  void *v29;
  _QWORD v30[5];
  _QWORD block[5];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "eventType");
  switch(v5)
  {
    case '*':
      objc_msgSend(v4, "device");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      MCLogCategoryDeviceAccess();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "endpoints");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v38 = v7;
        v39 = 2048;
        v40 = objc_msgSend(v23, "count");
        _os_log_impl(&dword_1AA991000, v22, OS_LOG_TYPE_DEFAULT, "Resolver - device changed %@, %lu endpoints", buf, 0x16u);

      }
      goto LABEL_24;
    case ')':
      objc_msgSend(v4, "device");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        MCLogCategoryDeviceAccess();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v7, "endpoints");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v38 = v7;
          v39 = 2048;
          v40 = objc_msgSend(v25, "count");
          _os_log_impl(&dword_1AA991000, v24, OS_LOG_TYPE_DEFAULT, "Resolver - device lost %@, %lu endpoints", buf, 0x16u);

        }
        coalescedDeviceMap = self->_coalescedDeviceMap;
        objc_msgSend(v7, "identifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](coalescedDeviceMap, "setObject:forKeyedSubscript:", 0, v27);

        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __54__MRUVendorSpecificDeviceManager_handleResolverEvent___block_invoke_41;
        v30[3] = &unk_1E5818C88;
        v30[4] = self;
        dispatch_async(MEMORY[0x1E0C80D38], v30);
      }
      goto LABEL_24;
    case '(':
      objc_msgSend(v4, "device");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        v28 = self;
        v8 = self->_coalescedDeviceMap;
        objc_msgSend(v6, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v7, v9);

        MCLogCategoryDeviceAccess();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v7, "endpoints");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v38 = v7;
          v39 = 2048;
          v40 = objc_msgSend(v11, "count");
          _os_log_impl(&dword_1AA991000, v10, OS_LOG_TYPE_DEFAULT, "Resolver - device found %@, %lu endpoints", buf, 0x16u);

        }
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        v29 = v7;
        objc_msgSend(v7, "endpoints");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "allValues");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v33;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v33 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
              MCLogCategoryDeviceAccess();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v18, "name");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "identifier");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v38 = v20;
                v39 = 2112;
                v40 = (uint64_t)v21;
                _os_log_impl(&dword_1AA991000, v19, OS_LOG_TYPE_DEFAULT, "Resolver - endpoint: %@, %@", buf, 0x16u);

              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
          }
          while (v15);
        }

        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __54__MRUVendorSpecificDeviceManager_handleResolverEvent___block_invoke;
        block[3] = &unk_1E5818C88;
        block[4] = v28;
        dispatch_async(MEMORY[0x1E0C80D38], block);
        v7 = v29;
      }
LABEL_24:

      break;
  }

}

void __54__MRUVendorSpecificDeviceManager_handleResolverEvent___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "vendorSpecificManagerDeviceListDidChange:", *(_QWORD *)(a1 + 32));

}

void __54__MRUVendorSpecificDeviceManager_handleResolverEvent___block_invoke_41(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "vendorSpecificManagerDeviceListDidChange:", *(_QWORD *)(a1 + 32));

}

- (void)handleDiscoveryEvent:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSMutableDictionary *deviceMap;
  void *v27;
  void *v28;
  uint64_t v29;
  NSMutableDictionary *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSMutableDictionary *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _BOOL4 v40;
  _BOOL4 v41;
  int v42;
  char v43;
  NSObject *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  uint64_t v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[5];
  id v61;
  _QWORD block[5];
  id v63;
  _BYTE v64[128];
  uint8_t v65[128];
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  void *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "eventType");
  if (v5 <= 40)
  {
    if (v5 == 10)
    {
      MCLogCategoryDeviceAccess();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        -[DADiscovery discoveredDevices](self->_discovery, "discoveredDevices");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v67 = v45;
        _os_log_impl(&dword_1AA991000, v44, OS_LOG_TYPE_DEFAULT, "discovered devices cache: %@", buf, 0xCu);

      }
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      -[DADiscovery discoveredDevices](self->_discovery, "discoveredDevices");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
      if (v46)
      {
        v47 = v46;
        v48 = *(_QWORD *)v57;
        do
        {
          for (i = 0; i != v47; ++i)
          {
            if (*(_QWORD *)v57 != v48)
              objc_enumerationMutation(v13);
            v50 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i);
            -[MRUVendorSpecificDeviceManager updateLocalMapWith:deviceIsLost:](self, "updateLocalMapWith:deviceIsLost:", v50, 0);
            -[MRUVendorSpecificDeviceManager resolverAddVendorSpecificDevice:](self, "resolverAddVendorSpecificDevice:", v50);
          }
          v47 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
        }
        while (v47);
      }
    }
    else
    {
      if (v5 != 40)
        goto LABEL_50;
      objc_msgSend(v4, "device");
      v12 = objc_claimAutoreleasedReturnValue();
      if (!v12)
        goto LABEL_50;
      v13 = (void *)v12;
      MCLogCategoryDeviceAccess();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v13, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "state");
        DADeviceStateToString();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v67 = v15;
        v68 = 2112;
        v69 = v16;
        _os_log_impl(&dword_1AA991000, v14, OS_LOG_TYPE_DEFAULT, "Discovery - got device found: %@, %@", buf, 0x16u);

      }
      -[MRUVendorSpecificDeviceManager updateLocalMapWith:deviceIsLost:](self, "updateLocalMapWith:deviceIsLost:", v13, 0);
      -[MRUVendorSpecificDeviceManager resolverAddVendorSpecificDevice:](self, "resolverAddVendorSpecificDevice:", v13);
    }
LABEL_46:

    goto LABEL_50;
  }
  switch(v5)
  {
    case ')':
      objc_msgSend(v4, "device");
      v17 = objc_claimAutoreleasedReturnValue();
      if (!v17)
        break;
      v13 = (void *)v17;
      MCLogCategoryDeviceAccess();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v13, "name");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "state");
        DADeviceStateToString();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v67 = v19;
        v68 = 2112;
        v69 = v20;
        _os_log_impl(&dword_1AA991000, v18, OS_LOG_TYPE_DEFAULT, "Discovery - got device lost: %@, %@", buf, 0x16u);

      }
      -[MRUVendorSpecificDeviceManager updateLocalMapWith:deviceIsLost:](self, "updateLocalMapWith:deviceIsLost:", v13, 1);
      -[MRUVendorSpecificDeviceManager resolverRemoveVendorSpecificRoute:](self, "resolverRemoveVendorSpecificRoute:", v13);
      goto LABEL_46;
    case '*':
      objc_msgSend(v4, "device");
      v21 = objc_claimAutoreleasedReturnValue();
      if (!v21)
        break;
      v22 = (void *)v21;
      MCLogCategoryDeviceAccess();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v22, "name");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "state");
        DADeviceStateToString();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v67 = v24;
        v68 = 2112;
        v69 = v25;
        _os_log_impl(&dword_1AA991000, v23, OS_LOG_TYPE_DEFAULT, "Discovery - got device change: %@, %@", buf, 0x16u);

      }
      deviceMap = self->_deviceMap;
      objc_msgSend(v22, "identifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](deviceMap, "objectForKeyedSubscript:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = MEMORY[0x1E0C809B0];
      if (v28)
      {
        v30 = self->_deviceMap;
        objc_msgSend(v22, "identifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](v30, "objectForKeyedSubscript:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "mediaPlaybackState");

        if (v33 != objc_msgSend(v22, "mediaPlaybackState"))
          goto LABEL_48;
        v34 = self->_deviceMap;
        objc_msgSend(v22, "identifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](v34, "objectForKeyedSubscript:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "nowPlayingSubtitle");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "nowPlayingSubtitle");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v38;
        v40 = v37 != 0;
        v41 = v37 == 0;
        if (v38)
          v40 = 0;
        else
          v41 = 0;
        v42 = v41 || v40;
        if (v37 && v38)
        {
          v43 = v42 | objc_msgSend(v37, "isEqualToString:", v38) ^ 1;

          if ((v43 & 1) == 0)
            goto LABEL_49;
          goto LABEL_48;
        }

        if (v42)
        {
LABEL_48:
          block[0] = v29;
          block[1] = 3221225472;
          block[2] = __55__MRUVendorSpecificDeviceManager_handleDiscoveryEvent___block_invoke;
          block[3] = &unk_1E5818CB0;
          block[4] = self;
          v63 = v22;
          dispatch_async(MEMORY[0x1E0C80D38], block);

        }
      }
LABEL_49:
      -[MRUVendorSpecificDeviceManager updateLocalMapWith:deviceIsLost:](self, "updateLocalMapWith:deviceIsLost:", v22, 0);
      -[MRUVendorSpecificDeviceManager resolverAddVendorSpecificDevice:](self, "resolverAddVendorSpecificDevice:", v22);
      v60[0] = v29;
      v60[1] = 3221225472;
      v60[2] = __55__MRUVendorSpecificDeviceManager_handleDiscoveryEvent___block_invoke_2;
      v60[3] = &unk_1E5818CB0;
      v60[4] = self;
      v61 = v22;
      v51 = v22;
      dispatch_async(MEMORY[0x1E0C80D38], v60);

      break;
    case '<':
      MCLogCategoryDeviceAccess();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AA991000, v6, OS_LOG_TYPE_DEFAULT, "XPC to dataaccessd interrupted, clearing devices", buf, 2u);
      }

      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      -[MRUVendorSpecificDeviceManager devices](self, "devices", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v53;
        do
        {
          for (j = 0; j != v9; ++j)
          {
            if (*(_QWORD *)v53 != v10)
              objc_enumerationMutation(v7);
            -[MRUVendorSpecificDeviceManager resolverRemoveVendorSpecificRoute:](self, "resolverRemoveVendorSpecificRoute:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j));
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
        }
        while (v9);
      }

      -[NSMutableDictionary removeAllObjects](self->_deviceMap, "removeAllObjects");
      -[NSMutableDictionary removeAllObjects](self->_activatingDeviceMap, "removeAllObjects");
      -[NSMutableDictionary removeAllObjects](self->_activatedDeviceMap, "removeAllObjects");
      -[NSMutableDictionary removeAllObjects](self->_invalidatingDeviceMap, "removeAllObjects");
      break;
  }
LABEL_50:

}

void __55__MRUVendorSpecificDeviceManager_handleDiscoveryEvent___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "vendorSpecificManager:deviceNowPlayingInfoDidChange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __55__MRUVendorSpecificDeviceManager_handleDiscoveryEvent___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "vendorSpecificManager:deviceStateDidChange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)dealloc
{
  objc_super v3;

  -[DADiscovery invalidate](self->_discovery, "invalidate");
  -[DADeviceResolver invalidate](self->_resolver, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MRUVendorSpecificDeviceManager;
  -[MRUVendorSpecificDeviceManager dealloc](&v3, sel_dealloc);
}

- (MRUVendorSpecificDeviceManagerDelegate)delegate
{
  return (MRUVendorSpecificDeviceManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)appBundleID
{
  return self->_appBundleID;
}

- (void)setAppBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)serviceIdentifiers
{
  return self->_serviceIdentifiers;
}

- (void)setServiceIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (DADiscovery)discovery
{
  return self->_discovery;
}

- (void)setDiscovery:(id)a3
{
  objc_storeStrong((id *)&self->_discovery, a3);
}

- (DADeviceResolver)resolver
{
  return self->_resolver;
}

- (void)setResolver:(id)a3
{
  objc_storeStrong((id *)&self->_resolver, a3);
}

- (NSMutableDictionary)deviceMap
{
  return self->_deviceMap;
}

- (void)setDeviceMap:(id)a3
{
  objc_storeStrong((id *)&self->_deviceMap, a3);
}

- (NSMutableDictionary)coalescedDeviceMap
{
  return self->_coalescedDeviceMap;
}

- (void)setCoalescedDeviceMap:(id)a3
{
  objc_storeStrong((id *)&self->_coalescedDeviceMap, a3);
}

- (NSMutableDictionary)activatingDeviceMap
{
  return self->_activatingDeviceMap;
}

- (void)setActivatingDeviceMap:(id)a3
{
  objc_storeStrong((id *)&self->_activatingDeviceMap, a3);
}

- (NSMutableDictionary)activatedDeviceMap
{
  return self->_activatedDeviceMap;
}

- (void)setActivatedDeviceMap:(id)a3
{
  objc_storeStrong((id *)&self->_activatedDeviceMap, a3);
}

- (NSMutableDictionary)invalidatingDeviceMap
{
  return self->_invalidatingDeviceMap;
}

- (void)setInvalidatingDeviceMap:(id)a3
{
  objc_storeStrong((id *)&self->_invalidatingDeviceMap, a3);
}

- (NSMutableSet)mutableResolverManagedAirPlayRouteIDs
{
  return self->_mutableResolverManagedAirPlayRouteIDs;
}

- (void)setMutableResolverManagedAirPlayRouteIDs:(id)a3
{
  objc_storeStrong((id *)&self->_mutableResolverManagedAirPlayRouteIDs, a3);
}

- (NSMutableDictionary)groupableDeviceIDs
{
  return self->_groupableDeviceIDs;
}

- (void)setGroupableDeviceIDs:(id)a3
{
  objc_storeStrong((id *)&self->_groupableDeviceIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupableDeviceIDs, 0);
  objc_storeStrong((id *)&self->_mutableResolverManagedAirPlayRouteIDs, 0);
  objc_storeStrong((id *)&self->_invalidatingDeviceMap, 0);
  objc_storeStrong((id *)&self->_activatedDeviceMap, 0);
  objc_storeStrong((id *)&self->_activatingDeviceMap, 0);
  objc_storeStrong((id *)&self->_coalescedDeviceMap, 0);
  objc_storeStrong((id *)&self->_deviceMap, 0);
  objc_storeStrong((id *)&self->_resolver, 0);
  objc_storeStrong((id *)&self->_discovery, 0);
  objc_storeStrong((id *)&self->_serviceIdentifiers, 0);
  objc_storeStrong((id *)&self->_appBundleID, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
