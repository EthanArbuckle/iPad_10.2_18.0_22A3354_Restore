@implementation GEOOfflineDataConfiguration

+ (GEOOfflineDataConfiguration)sharedConfiguration
{
  if (qword_1ECDBC630 != -1)
    dispatch_once(&qword_1ECDBC630, &__block_literal_global_4_3);
  return (GEOOfflineDataConfiguration *)(id)qword_1ECDBC628;
}

void __50__GEOOfflineDataConfiguration_sharedConfiguration__block_invoke()
{
  GEOOfflineDataConfiguration *v0;
  void *v1;

  v0 = objc_alloc_init(GEOOfflineDataConfiguration);
  v1 = (void *)qword_1ECDBC628;
  qword_1ECDBC628 = (uint64_t)v0;

}

- (GEOOfflineDataConfiguration)init
{
  GEOOfflineDataConfiguration *v2;
  uint64_t v3;
  geo_isolater *configurationIsolation;
  uint64_t v5;
  OS_dispatch_queue *observerQueue;
  GEOObserverHashTable *v7;
  GEOObserverHashTable *observers;
  uint64_t v9;
  GEOResourceManifestManager *manifestManager;
  OS_dispatch_queue *v11;
  uint64_t v12;
  uint64_t v13;
  id regulatoryRegionOverrideConfigObserver;
  OS_dispatch_queue *v15;
  uint64_t v16;
  id simulateUpdateAvailableConfigObserver;
  GEOOfflineDataConfiguration *v18;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id location;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)GEOOfflineDataConfiguration;
  v2 = -[GEOOfflineDataConfiguration init](&v25, sel_init);
  if (v2)
  {
    v3 = geo_isolater_create();
    configurationIsolation = v2->_configurationIsolation;
    v2->_configurationIsolation = (geo_isolater *)v3;

    v5 = geo_dispatch_queue_create();
    observerQueue = v2->_observerQueue;
    v2->_observerQueue = (OS_dispatch_queue *)v5;

    v7 = -[GEOObserverHashTable initWithProtocol:queue:]([GEOObserverHashTable alloc], "initWithProtocol:queue:", &unk_1EDF59DB0, 0);
    observers = v2->_observers;
    v2->_observers = v7;

    +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
    v9 = objc_claimAutoreleasedReturnValue();
    manifestManager = v2->_manifestManager;
    v2->_manifestManager = (GEOResourceManifestManager *)v9;

    -[GEOResourceManifestManager addTileGroupObserver:queue:](v2->_manifestManager, "addTileGroupObserver:queue:", v2, v2->_observerQueue);
    GEORegisterPListStateCaptureLegacy();
    objc_initWeak(&location, v2);
    v11 = v2->_observerQueue;
    v12 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __35__GEOOfflineDataConfiguration_init__block_invoke;
    v22[3] = &unk_1E1C00800;
    objc_copyWeak(&v23, &location);
    _GEOConfigAddBlockListenerForKey(GeoOfflineConfig_OverrideRegulatoryRegionID, (uint64_t)off_1EDF4EA68, v11, v22);
    v13 = objc_claimAutoreleasedReturnValue();
    regulatoryRegionOverrideConfigObserver = v2->_regulatoryRegionOverrideConfigObserver;
    v2->_regulatoryRegionOverrideConfigObserver = (id)v13;

    v15 = v2->_observerQueue;
    v20[0] = v12;
    v20[1] = 3221225472;
    v20[2] = __35__GEOOfflineDataConfiguration_init__block_invoke_2;
    v20[3] = &unk_1E1C00800;
    objc_copyWeak(&v21, &location);
    _GEOConfigAddBlockListenerForKey(GeoOfflineConfig_SimulateDataUpdateAvailable, (uint64_t)off_1EDF4EAB8, v15, v20);
    v16 = objc_claimAutoreleasedReturnValue();
    simulateUpdateAvailableConfigObserver = v2->_simulateUpdateAvailableConfigObserver;
    v2->_simulateUpdateAvailableConfigObserver = (id)v16;

    v18 = v2;
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v2;
}

void __35__GEOOfflineDataConfiguration_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_regulatoryRegionOverrideDidChange");

}

void __35__GEOOfflineDataConfiguration_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateAvailableOverrideChanged");

}

- (void)dealloc
{
  objc_super v3;

  GEOUnregisterStateCaptureLegacy();
  GEOConfigRemoveBlockListener(self->_simulateUpdateAvailableConfigObserver);
  GEOConfigRemoveBlockListener(self->_regulatoryRegionOverrideConfigObserver);
  -[GEOResourceManifestManager removeTileGroupObserver:](self->_manifestManager, "removeTileGroupObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)GEOOfflineDataConfiguration;
  -[GEOOfflineDataConfiguration dealloc](&v3, sel_dealloc);
}

- (void)registerObserver:(id)a3 queue:(id)a4
{
  -[GEOObserverHashTable registerObserver:queue:](self->_observers, "registerObserver:queue:", a3, a4);
}

- (void)unregisterObserver:(id)a3
{
  -[GEOObserverHashTable unregisterObserver:](self->_observers, "unregisterObserver:", a3);
}

- (void)_updateAvailableOverrideChanged
{
  geo_isolater *v3;

  v3 = self->_configurationIsolation;
  _geo_isolate_lock();
  -[GEOOfflineDataConfiguration _broadcastUpdateAvailability](self, "_broadcastUpdateAvailability");
  _geo_isolate_unlock();

}

- (NSDictionary)activeVersions
{
  void *v3;
  NSDictionary *v4;
  geo_isolater *v6;

  v6 = self->_configurationIsolation;
  _geo_isolate_lock();
  -[GEOOfflineDataConfiguration _configurationIsolated](self, "_configurationIsolated");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_activeVersions;

  _geo_isolate_unlock();
  return v4;
}

- (void)updateCompletedWithVersions:(id)a3 tileMetadata:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;

  v5 = a3;
  v6 = a4;
  _setValue(GeoOfflineConfig_SimulateDataUpdateAvailable, (uint64_t)off_1EDF4EAB8, 0, 0, 0);
  _setValue(GeoOfflineConfig_SimulateDataIncompatible, (uint64_t)off_1EDF4EAC8, 0, 0, 0);
  v7 = v5;
  v8 = v6;
  geo_isolate_sync_data();
  _setValue(GeoOfflineConfig_HasNotifiedForUpcomingUpdateRequiredExpiration, (uint64_t)off_1EDF4EAA8, 0, 0, 0);

}

void __72__GEOOfflineDataConfiguration_updateCompletedWithVersions_tileMetadata___block_invoke(id *a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  __CFString *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  double Current;
  void *v21;
  id v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  id obj;
  _QWORD block[5];
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  _BYTE v34[20];
  uint64_t v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "_configurationIsolated");
  v2 = objc_claimAutoreleasedReturnValue();
  -[GEOPBOfflineDataConfiguration setTileMetadata:](v2, a1[5]);
  if (objc_msgSend(*((id *)a1[4] + 5), "isEqualToDictionary:", a1[6]))
  {
    objc_msgSend(a1[4], "_setLatestReleaseDataVersionIsCurrentWithConfiguration:", v2);
  }
  else
  {
    GEOGetOfflineDataConfigurationLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_INFO, "Setting new active versions", buf, 2u);
    }

    -[GEOPBOfflineDataConfiguration clearActiveVersions](v2);
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = a1[6];
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v30;
      v25 = v2;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v30 != v6)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(a1[6], "objectForKeyedSubscript:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v8, "unsignedIntegerValue");
          v11 = objc_msgSend(v9, "unsignedLongLongValue");
          *(_DWORD *)buf = v10;
          *(_DWORD *)v34 = 0;
          *(_QWORD *)&v34[4] = v11;
          v34[12] = 3;
          *(_DWORD *)&v34[13] = 0;
          *(_DWORD *)&v34[16] = 0;
          -[GEOPBOfflineDataConfiguration addActiveVersion:](v2, (__n128 *)buf);
          GEOGetOfflineDataConfigurationLog();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            if (v10 >= 0x15)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v10);
              v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v13 = off_1E1C127F0[(int)v10];
            }
            objc_msgSend(*((id *)a1[4] + 5), "objectForKeyedSubscript:", v8);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "unsignedLongLongValue");
            v16 = objc_msgSend(v9, "unsignedLongLongValue");
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)v34 = v13;
            *(_WORD *)&v34[8] = 2048;
            *(_QWORD *)&v34[10] = v15;
            *(_WORD *)&v34[18] = 2048;
            v35 = v16;
            _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_INFO, "Layer %{public}@ version: %llu -> %llu", buf, 0x20u);

            v2 = v25;
          }

        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
      }
      while (v5);
    }

    objc_msgSend(*((id *)a1[4] + 2), "activeTileGroup");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "offlineMetadata");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "dataVersion");
    if (v2)
    {
      *(_BYTE *)(v2 + 108) |= 0x40u;
      *(_BYTE *)(v2 + 108) |= 1u;
      *(_QWORD *)(v2 + 72) = v19;
    }

    Current = CFAbsoluteTimeGetCurrent();
    if (v2)
    {
      *(_BYTE *)(v2 + 108) |= 0x40u;
      *(_BYTE *)(v2 + 108) |= 2u;
      *(_QWORD *)(v2 + 80) = (unint64_t)Current;
    }
    objc_msgSend(a1[4], "_writeConfiguration", Current);
    v21 = (void *)objc_msgSend(a1[6], "copy");
    objc_storeStrong((id *)a1[4] + 5, v21);
    v22 = a1[4];
    v23 = *((_QWORD *)v22 + 7);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__GEOOfflineDataConfiguration_updateCompletedWithVersions_tileMetadata___block_invoke_63;
    block[3] = &unk_1E1C00738;
    block[4] = v22;
    v28 = v21;
    v24 = v21;
    dispatch_async(v23, block);
    objc_msgSend(a1[4], "_broadcastUpdateAvailability");

  }
}

uint64_t __72__GEOOfflineDataConfiguration_updateCompletedWithVersions_tileMetadata___block_invoke_63(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "offlineDataConfiguration:didChangeActiveVersions:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return notify_post(GEOOfflineDataActiveVersionsDidChangeDarwinNotification);
}

- (void)_setLatestReleaseDataVersionIsCurrentWithConfiguration:(id)a3
{
  _QWORD *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  unint64_t Current;
  uint8_t v11[16];

  v4 = a3;
  geo_assert_isolated();
  -[GEOResourceManifestManager activeTileGroup](self->_manifestManager, "activeTileGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "offlineMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "dataVersion");

  if (v4)
    v8 = v4[9];
  else
    v8 = 0;
  if (v8 != v7)
  {
    GEOGetOfflineDataConfigurationLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_INFO, "Marking release data version as current", v11, 2u);
    }

    if (v4)
    {
      *((_BYTE *)v4 + 108) |= 0x40u;
      *((_BYTE *)v4 + 108) |= 1u;
      v4[9] = v7;
      Current = (unint64_t)CFAbsoluteTimeGetCurrent();
      *((_BYTE *)v4 + 108) |= 0x40u;
      *((_BYTE *)v4 + 108) |= 2u;
      v4[10] = Current;
    }
    else
    {
      CFAbsoluteTimeGetCurrent();
    }
    -[GEOOfflineDataConfiguration _writeConfiguration](self, "_writeConfiguration");
    -[GEOOfflineDataConfiguration _broadcastUpdateAvailability](self, "_broadcastUpdateAvailability");
  }

}

- (GEOPBOfflineTileMetadata)tileMetadata
{
  id *v3;
  void *v4;
  geo_isolater *v6;

  v6 = self->_configurationIsolation;
  _geo_isolate_lock_data();
  -[GEOOfflineDataConfiguration _configurationIsolated](self, "_configurationIsolated");
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPBOfflineDataConfiguration tileMetadata](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  _geo_isolate_unlock();
  return (GEOPBOfflineTileMetadata *)v4;
}

- (void)setTileMetadata:(id)a3
{
  id v4;
  void *v5;
  geo_isolater *v6;

  v4 = a3;
  v6 = self->_configurationIsolation;
  _geo_isolate_lock();
  -[GEOOfflineDataConfiguration _configurationIsolated](self, "_configurationIsolated");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPBOfflineDataConfiguration setTileMetadata:]((uint64_t)v5, v4);
  -[GEOOfflineDataConfiguration _writeConfiguration](self, "_writeConfiguration");

  _geo_isolate_unlock();
}

- (void)setLastUpdatedDateToNow
{
  geo_isolate_sync_data();
  _setValue(GeoOfflineConfig_HasNotifiedForUpcomingUpdateRequiredExpiration, (uint64_t)off_1EDF4EAA8, 0, 0, 0);
}

void __54__GEOOfflineDataConfiguration_setLastUpdatedDateToNow__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  double Current;
  uint8_t v5[16];

  objc_msgSend(*(id *)(a1 + 32), "_configurationIsolated");
  v2 = objc_claimAutoreleasedReturnValue();
  GEOGetOfflineDataConfigurationLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_INFO, "Setting last-updated date", v5, 2u);
  }

  Current = CFAbsoluteTimeGetCurrent();
  if (v2)
  {
    *(_BYTE *)(v2 + 108) |= 0x40u;
    *(_BYTE *)(v2 + 108) |= 2u;
    *(_QWORD *)(v2 + 80) = (unint64_t)Current;
  }
  objc_msgSend(*(id *)(a1 + 32), "_writeConfiguration", Current);

}

- (unint64_t)activeReleaseDataVersion
{
  _QWORD *v3;
  unint64_t v4;
  geo_isolater *v6;

  v6 = self->_configurationIsolation;
  _geo_isolate_lock();
  -[GEOOfflineDataConfiguration _configurationIsolated](self, "_configurationIsolated");
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = v3[9];
  else
    v4 = 0;

  _geo_isolate_unlock();
  return v4;
}

- (void)setActiveReleaseDataVersion:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  geo_isolater *v9;
  uint8_t buf[4];
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = self->_configurationIsolation;
  _geo_isolate_lock();
  -[GEOOfflineDataConfiguration _configurationIsolated](self, "_configurationIsolated");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = *(_QWORD *)(v5 + 72);
  else
    v7 = 0;
  if (v7 != a3)
  {
    GEOGetOfflineDataConfigurationLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v11 = a3;
      _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_INFO, "Setting new latest active release version: %llu", buf, 0xCu);
    }

    if (v6)
    {
      *(_BYTE *)(v6 + 108) |= 0x40u;
      *(_BYTE *)(v6 + 108) |= 1u;
      *(_QWORD *)(v6 + 72) = a3;
    }
    -[GEOOfflineDataConfiguration _writeConfiguration](self, "_writeConfiguration");
    -[GEOOfflineDataConfiguration _broadcastUpdateAvailability](self, "_broadcastUpdateAvailability");
  }

  _geo_isolate_unlock();
}

- (NSDictionary)latestAvailableVersions
{
  void *v3;
  NSDictionary *v4;
  geo_isolater *v6;

  v6 = self->_configurationIsolation;
  _geo_isolate_lock();
  -[GEOOfflineDataConfiguration _configurationIsolated](self, "_configurationIsolated");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_latestAvailableVersions;

  _geo_isolate_unlock();
  return v4;
}

- (void)setLatestAvailableVersions:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  geo_isolate_sync_data();

}

void __58__GEOOfflineDataConfiguration_setLatestAvailableVersions___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  __CFString *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  void *v21;
  id obj;
  _QWORD block[5];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  _BYTE v30[20];
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_configurationIsolated");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "isEqualToDictionary:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    GEOGetOfflineDataConfigurationLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_INFO, "Setting new latest available versions", buf, 2u);
    }

    -[GEOPBOfflineDataConfiguration clearLatestAvailableVersions]((uint64_t)v2);
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    obj = *(id *)(a1 + 40);
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v26;
      v21 = v2;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v26 != v6)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v8, "unsignedIntegerValue");
          v11 = objc_msgSend(v9, "unsignedLongLongValue");
          *(_DWORD *)buf = v10;
          *(_DWORD *)v30 = 0;
          *(_QWORD *)&v30[4] = v11;
          v30[12] = 3;
          *(_DWORD *)&v30[13] = 0;
          *(_DWORD *)&v30[16] = 0;
          -[GEOPBOfflineDataConfiguration addLatestAvailableVersion:]((uint64_t)v2, (__n128 *)buf);
          GEOGetOfflineDataConfigurationLog();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            if (v10 >= 0x15)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v10);
              v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v13 = off_1E1C127F0[(int)v10];
            }
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", v8);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "unsignedLongLongValue");
            v16 = objc_msgSend(v9, "unsignedLongLongValue");
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)v30 = v13;
            *(_WORD *)&v30[8] = 2048;
            *(_QWORD *)&v30[10] = v15;
            *(_WORD *)&v30[18] = 2048;
            v31 = v16;
            _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_INFO, "Layer %{public}@ version: %llu -> %llu", buf, 0x20u);

            v2 = v21;
          }

        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
      }
      while (v5);
    }

    objc_msgSend(*(id *)(a1 + 32), "_writeConfiguration");
    v17 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), v17);
    v18 = *(_QWORD *)(a1 + 32);
    v19 = *(NSObject **)(v18 + 56);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__GEOOfflineDataConfiguration_setLatestAvailableVersions___block_invoke_64;
    block[3] = &unk_1E1C00738;
    block[4] = v18;
    v24 = v17;
    v20 = v17;
    dispatch_async(v19, block);
    objc_msgSend(*(id *)(a1 + 32), "_broadcastUpdateAvailability");

  }
}

uint64_t __58__GEOOfflineDataConfiguration_setLatestAvailableVersions___block_invoke_64(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "offlineDataConfiguration:didChangeLatestAvailableVersions:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (NSArray)requiredLayers
{
  void *v3;
  geo_isolater *v5;

  v5 = self->_configurationIsolation;
  _geo_isolate_lock();
  -[GEOOfflineDataConfiguration _requiredLayersIsolated](self, "_requiredLayersIsolated");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _geo_isolate_unlock();

  return (NSArray *)v3;
}

- (id)_requiredLayersIsolated
{
  NSArray *requiredLayers;
  NSArray **p_requiredLayers;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  NSObject *v30;
  const char *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  uint8_t v36[16];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  p_requiredLayers = &self->_requiredLayers;
  requiredLayers = self->_requiredLayers;
  if (requiredLayers)
    return requiredLayers;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: gsFramework != ((void *)0)", buf, 2u);
    }
    v15 = &unk_1E1E856F0;
    goto LABEL_40;
  }
  objc_msgSend(v4, "bundleURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("MapsOfflineService.bundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "URLForResource:withExtension:", CFSTR("SupportedLayers"), CFSTR("plist"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v10, 1, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v41 = 0;
        objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v11, 0, 0, &v41);
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = v41;
        v14 = v13;
        if (!v12)
        {
          GEOGetOfflineDataConfigurationLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138543362;
            v43 = v14;
            _os_log_impl(&dword_1885A9000, v16, OS_LOG_TYPE_FAULT, "Failed to decode SupportedLayers.plist. Can not determine required layers: %{public}@", buf, 0xCu);
          }
          goto LABEL_37;
        }

        v14 = (void *)v12;
      }
      else
      {
        v14 = 0;
      }
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Layers"));
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v33 = v14;
          v34 = v11;
          v35 = v5;
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = 0u;
          v38 = 0u;
          v39 = 0u;
          v40 = 0u;
          v32 = v16;
          v17 = v16;
          v18 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v37, buf, 16);
          if (!v18)
            goto LABEL_34;
          v19 = v18;
          v20 = *(_QWORD *)v38;
          while (1)
          {
            v21 = 0;
            do
            {
              if (*(_QWORD *)v38 != v20)
                objc_enumerationMutation(v17);
              v22 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v21);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("id"));
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                if (v23)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_msgSend(v15, "addObject:", v23);
LABEL_23:

                    goto LABEL_24;
                  }
                  if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
                    goto LABEL_23;
                  *(_WORD *)v36 = 0;
                  v24 = MEMORY[0x1E0C81028];
                  v25 = "Assertion failed: [layerID isKindOfClass:NSNumber.class]";
                }
                else
                {
                  if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
                    goto LABEL_23;
                  *(_WORD *)v36 = 0;
                  v24 = MEMORY[0x1E0C81028];
                  v25 = "Assertion failed: layerID != nil";
                }
                _os_log_fault_impl(&dword_1885A9000, v24, OS_LOG_TYPE_FAULT, v25, v36, 2u);
                goto LABEL_23;
              }
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)v36 = 0;
                _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: [layer isKindOfClass:NSDictionary.class]", v36, 2u);
              }
LABEL_24:
              ++v21;
            }
            while (v19 != v21);
            v26 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v37, buf, 16);
            v19 = v26;
            if (!v26)
            {
LABEL_34:

              v5 = v35;
              v14 = v33;
              v11 = v34;
              v16 = v32;
              goto LABEL_38;
            }
          }
        }
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
          goto LABEL_37;
        *(_WORD *)buf = 0;
        v30 = MEMORY[0x1E0C81028];
        v31 = "Assertion failed: [layerInfos isKindOfClass:NSArray.class]";
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
          goto LABEL_37;
        *(_WORD *)buf = 0;
        v30 = MEMORY[0x1E0C81028];
        v31 = "Assertion failed: layerInfos != ((void *)0)";
      }
      _os_log_fault_impl(&dword_1885A9000, v30, OS_LOG_TYPE_FAULT, v31, buf, 2u);
LABEL_37:
      v15 = &unk_1E1E856F0;
LABEL_38:

      goto LABEL_39;
    }
  }
  else
  {
    GEOGetOfflineDataConfigurationLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_FAULT, "Could not find MapsOfflineService.bundle. Can not determine required layers", buf, 2u);
    }
  }
  v15 = &unk_1E1E856F0;
LABEL_39:

LABEL_40:
  if (objc_msgSend(v15, "count"))
  {
    objc_msgSend(v15, "arrayByAddingObjectsFromArray:", &unk_1E1E856D8);
    v27 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v27;
  }
  if (v15)
    v28 = v15;
  else
    v28 = (void *)MEMORY[0x1E0C9AA60];
  objc_storeStrong((id *)p_requiredLayers, v28);

  requiredLayers = *p_requiredLayers;
  return requiredLayers;
}

- (id)_configurationIsolated
{
  GEOPBOfflineDataConfiguration *configuration;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  NSObject *v10;
  GEOPBOfflineDataConfiguration *v11;
  GEOPBOfflineDataConfiguration *v12;
  NSObject *v13;
  GEOPBOfflineDataConfiguration *v14;
  NSObject *v15;
  GEOPBOfflineDataConfiguration *v16;
  GEOPBOfflineDataConfiguration *v17;
  GEOPBOfflineDataConfiguration *v18;
  uint64_t activeVersionsCount;
  NSDictionary *v20;
  NSDictionary *activeVersions;
  GEOPBOfflineDataConfiguration *v22;
  GEOPBOfflineDataConfiguration *v23;
  uint64_t latestAvailableVersionsCount;
  NSDictionary *v25;
  NSDictionary *latestAvailableVersions;
  NSDictionary *v27;
  void *v28;
  void *v29;
  NSDictionary *v30;
  id v32;
  uint8_t buf[4];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  geo_assert_isolated();
  configuration = self->_configuration;
  if (!configuration)
  {
    +[GEOFilePaths urlFor:](GEOFilePaths, "urlFor:", 38);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "fileExistsAtPath:", v6);

    if (v7)
    {
      v32 = 0;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v4, 0, &v32);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v32;
      if (!v8)
      {
        GEOGetOfflineDataConfigurationLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v34 = v9;
          _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_ERROR, "Failed to read existing config: %{public}@", buf, 0xCu);
        }

      }
      v11 = -[GEOPBOfflineDataConfiguration initWithData:]([GEOPBOfflineDataConfiguration alloc], "initWithData:", v8);
      v12 = self->_configuration;
      self->_configuration = v11;

      if (!self->_configuration)
      {
        GEOGetOfflineDataConfigurationLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1885A9000, v13, OS_LOG_TYPE_FAULT, "Failed to decode existing config", buf, 2u);
        }

      }
    }
    v14 = self->_configuration;
    if (!v14)
    {
      GEOGetOfflineDataConfigurationLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_DEBUG, "Generating empty config", buf, 2u);
      }

      v16 = objc_alloc_init(GEOPBOfflineDataConfiguration);
      v17 = self->_configuration;
      self->_configuration = v16;

      v14 = self->_configuration;
      if (!v14)
        goto LABEL_26;
    }
    -[GEOPBOfflineDataConfiguration _readActiveVersions]((uint64_t)v14);
    v14 = (GEOPBOfflineDataConfiguration *)v14->_activeVersions;
    v18 = self->_configuration;
    if (v18)
    {
      -[GEOPBOfflineDataConfiguration _readActiveVersions]((uint64_t)self->_configuration);
      activeVersionsCount = v18->_activeVersionsCount;
    }
    else
    {
LABEL_26:
      activeVersionsCount = 0;
    }
    _versionDictionaryFromProtobuf((uint64_t)v14, activeVersionsCount);
    v20 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    activeVersions = self->_activeVersions;
    self->_activeVersions = v20;

    v22 = self->_configuration;
    if (v22
      && (-[GEOPBOfflineDataConfiguration _readLatestAvailableVersions]((uint64_t)self->_configuration),
          v22 = (GEOPBOfflineDataConfiguration *)v22->_latestAvailableVersions,
          (v23 = self->_configuration) != 0))
    {
      -[GEOPBOfflineDataConfiguration _readLatestAvailableVersions]((uint64_t)self->_configuration);
      latestAvailableVersionsCount = v23->_latestAvailableVersionsCount;
    }
    else
    {
      latestAvailableVersionsCount = 0;
    }
    _versionDictionaryFromProtobuf((uint64_t)v22, latestAvailableVersionsCount);
    v25 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    latestAvailableVersions = self->_latestAvailableVersions;
    self->_latestAvailableVersions = v25;

    if (GEOConfigGetBOOL(GeoOfflineConfig_SimulateDataIncompatible, (uint64_t)off_1EDF4EAC8))
    {
      v27 = (NSDictionary *)-[NSDictionary mutableCopy](self->_activeVersions, "mutableCopy");
      -[NSDictionary allKeys](v27, "allKeys");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "firstObject");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary removeObjectForKey:](v27, "removeObjectForKey:", v29);

      v30 = self->_activeVersions;
      self->_activeVersions = v27;

    }
    configuration = self->_configuration;
  }
  return configuration;
}

- (void)_writeConfiguration
{
  void *v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  geo_assert_isolated();
  -[GEOPBOfflineDataConfiguration data](self->_configuration, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOFilePaths urlFor:](GEOFilePaths, "urlFor:", 38);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v5 = objc_msgSend(v3, "writeToURL:options:error:", v4, 268435457, &v8);
  v6 = v8;

  if ((v5 & 1) == 0)
  {
    GEOGetOfflineDataConfigurationLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v10 = v6;
      _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_FAULT, "Failed to write configuration: %{public}@", buf, 0xCu);
    }

  }
}

- (unsigned)regulatoryRegionID
{
  void *v4;
  void *v5;
  unsigned int v6;

  if (_GEOConfigHasValue(GeoOfflineConfig_OverrideRegulatoryRegionID, (uint64_t)off_1EDF4EA68))
    return GEOConfigGetUInteger(GeoOfflineConfig_OverrideRegulatoryRegionID, (uint64_t)off_1EDF4EA68);
  -[GEOResourceManifestManager activeTileGroup](self->_manifestManager, "activeTileGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "offlineMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "regulatoryRegionId");

  return v6;
}

- (void)_regulatoryRegionOverrideDidChange
{
  -[GEOObserverHashTable offlineDataConfiguration:didChangeRegulatoryRegionID:](self->_observers, "offlineDataConfiguration:didChangeRegulatoryRegionID:", self, -[GEOOfflineDataConfiguration regulatoryRegionID](self, "regulatoryRegionID"));
}

- (BOOL)isUpdateAvailable
{
  GEOOfflineDataConfiguration *v2;
  geo_isolater *v4;

  v2 = self;
  v4 = self->_configurationIsolation;
  _geo_isolate_lock();
  LOBYTE(v2) = -[GEOOfflineDataConfiguration _isUpdateAvailableIsolated](v2, "_isUpdateAvailableIsolated");
  _geo_isolate_unlock();

  return (char)v2;
}

- (BOOL)_isUpdateAvailableIsolated
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSDictionary *latestAvailableVersions;
  char BOOL;

  geo_assert_isolated();
  -[GEOOfflineDataConfiguration _configurationIsolated](self, "_configurationIsolated");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = *(_QWORD *)(v3 + 72);
  else
    v5 = 0;
  -[GEOResourceManifestManager activeTileGroup](self->_manifestManager, "activeTileGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "offlineMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == objc_msgSend(v7, "dataVersion")
    && ((latestAvailableVersions = self->_latestAvailableVersions, latestAvailableVersions == self->_activeVersions)
     || -[NSDictionary isEqualToDictionary:](latestAvailableVersions, "isEqualToDictionary:"))
    && !-[GEOOfflineDataConfiguration _isUpdateRequiredIsolated](self, "_isUpdateRequiredIsolated"))
  {
    BOOL = GEOConfigGetBOOL(GeoOfflineConfig_SimulateDataUpdateAvailable, (uint64_t)off_1EDF4EAB8);
  }
  else
  {
    BOOL = 1;
  }

  return BOOL;
}

- (BOOL)isUpdateRequired
{
  GEOOfflineDataConfiguration *v2;
  geo_isolater *v4;

  v2 = self;
  v4 = self->_configurationIsolation;
  _geo_isolate_lock();
  LOBYTE(v2) = -[GEOOfflineDataConfiguration _isUpdateRequiredIsolated](v2, "_isUpdateRequiredIsolated");
  _geo_isolate_unlock();

  return (char)v2;
}

- (BOOL)_isUpdateRequiredIsolated
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  geo_assert_isolated();
  -[GEOOfflineDataConfiguration _configurationIsolated](self, "_configurationIsolated");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary allKeys](self->_activeVersions, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOOfflineDataConfiguration _requiredLayersIsolated](self, "_requiredLayersIsolated");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if (!objc_msgSend(v4, "containsObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSDate)lastUpdatedDate
{
  uint64_t v3;
  void *v4;
  void *v5;
  geo_isolater *v7;

  v7 = self->_configurationIsolation;
  _geo_isolate_lock_data();
  -[GEOOfflineDataConfiguration _configurationIsolated](self, "_configurationIsolated");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3 && (*(_BYTE *)(v3 + 108) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)*(unint64_t *)(v3 + 80));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  _geo_isolate_unlock();
  return (NSDate *)v5;
}

- (void)_broadcastUpdateAvailability
{
  BOOL v3;
  NSObject *observerQueue;
  _QWORD v5[5];
  BOOL v6;

  geo_assert_isolated();
  v3 = -[GEOOfflineDataConfiguration _isUpdateAvailableIsolated](self, "_isUpdateAvailableIsolated");
  observerQueue = self->_observerQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__GEOOfflineDataConfiguration__broadcastUpdateAvailability__block_invoke;
  v5[3] = &unk_1E1C0B1F0;
  v5[4] = self;
  v6 = v3;
  dispatch_async(observerQueue, v5);
}

uint64_t __59__GEOOfflineDataConfiguration__broadcastUpdateAvailability__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "offlineDataConfiguration:didChangeUpdateAvailability:");
}

- (void)resourceManifestManager:(id)a3 didChangeActiveTileGroup:(id)a4 fromOldTileGroup:(id)a5
{
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *observerQueue;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  unint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  objc_msgSend(v7, "offlineMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "regulatoryRegionId");
  objc_msgSend(v8, "offlineMetadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "regulatoryRegionId");

  v13 = MEMORY[0x1E0C809B0];
  if (v10 != v12)
  {
    GEOGetOfflineDataConfigurationLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "offlineMetadata");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "regulatoryRegionId");
      objc_msgSend(v7, "offlineMetadata");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218240;
      v31 = v16;
      v32 = 2048;
      v33 = objc_msgSend(v17, "regulatoryRegionId");
      _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_INFO, "Offline regulatory region ID changed (%llu -> %llu)", buf, 0x16u);

    }
    observerQueue = self->_observerQueue;
    block[0] = v13;
    block[1] = 3221225472;
    block[2] = __97__GEOOfflineDataConfiguration_resourceManifestManager_didChangeActiveTileGroup_fromOldTileGroup___block_invoke;
    block[3] = &unk_1E1BFF6F8;
    block[4] = self;
    dispatch_async(observerQueue, block);
  }
  objc_msgSend(v7, "offlineMetadata");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "dataVersion");
  objc_msgSend(v8, "offlineMetadata");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "dataVersion");

  if (v20 != v22)
  {
    GEOGetOfflineDataConfigurationLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "offlineMetadata");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "dataVersion");
      objc_msgSend(v7, "offlineMetadata");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "dataVersion");
      v28 = -[GEOOfflineDataConfiguration activeReleaseDataVersion](self, "activeReleaseDataVersion");
      *(_DWORD *)buf = 134218496;
      v31 = v25;
      v32 = 2048;
      v33 = v27;
      v34 = 2048;
      v35 = v28;
      _os_log_impl(&dword_1885A9000, v23, OS_LOG_TYPE_INFO, "Offline release data version changed (latest: %llu -> %llu, active: %llu). Update available", buf, 0x20u);

    }
    geo_isolate_sync();
  }

}

uint64_t __97__GEOOfflineDataConfiguration_resourceManifestManager_didChangeActiveTileGroup_fromOldTileGroup___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "offlineDataConfiguration:didChangeRegulatoryRegionID:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "regulatoryRegionID"));
}

uint64_t __97__GEOOfflineDataConfiguration_resourceManifestManager_didChangeActiveTileGroup_fromOldTileGroup___block_invoke_72(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_broadcastUpdateAvailability");
}

- (id)captureStatePlistWithHints:(os_state_hints_s *)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  uint64_t v25;
  __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  geo_isolater *v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v45 = self->_configurationIsolation;
  _geo_isolate_lock_data();
  -[GEOOfflineDataConfiguration _configurationIsolated](self, "_configurationIsolated");
  v35 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  -[NSDictionary allKeys](self->_activeVersions, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingSelector:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSDictionary count](self->_activeVersions, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v42 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "unsignedIntValue");
        if (v12 >= 0x15)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v12);
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v13 = off_1E1C127F0[(int)v12];
        }
        -[NSDictionary objectForKeyedSubscript:](self->_activeVersions, "objectForKeyedSubscript:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, v13);

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    }
    while (v8);
  }

  objc_msgSend(v36, "setObject:forKeyedSubscript:", v6, CFSTR("ActiveVersions"));
  if (v35)
    v15 = *(_QWORD *)(v35 + 72);
  else
    v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setObject:forKeyedSubscript:", v16, CFSTR("ActiveReleaseDataVersion"));

  -[NSDictionary allKeys](self->_latestAvailableVersions, "allKeys");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sortedArrayUsingSelector:", sel_compare_);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSDictionary count](self->_latestAvailableVersions, "count"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v20 = v18;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v38 != v22)
          objc_enumerationMutation(v20);
        v24 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
        v25 = objc_msgSend(v24, "unsignedIntValue");
        if (v25 >= 0x15)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v25);
          v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v26 = off_1E1C127F0[(int)v25];
        }
        -[NSDictionary objectForKeyedSubscript:](self->_latestAvailableVersions, "objectForKeyedSubscript:", v24);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v27, v26);

      }
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    }
    while (v21);
  }

  objc_msgSend(v36, "setObject:forKeyedSubscript:", v19, CFSTR("LatestKnownVersions"));
  v28 = (void *)MEMORY[0x1E0CB37E8];
  -[GEOResourceManifestManager activeTileGroup](self->_manifestManager, "activeTileGroup");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "offlineMetadata");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "numberWithUnsignedLongLong:", objc_msgSend(v30, "dataVersion"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setObject:forKeyedSubscript:", v31, CFSTR("LatestReleaseDataVersion"));

  v32 = (void *)v35;
  if (v35 && *(_QWORD *)(v35 + 80))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setObject:forKeyedSubscript:", v33, CFSTR("LastUpdatedTimestamp"));

    v32 = (void *)v35;
  }

  _geo_isolate_unlock();
  return v36;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_simulateUpdateAvailableConfigObserver, 0);
  objc_storeStrong(&self->_regulatoryRegionOverrideConfigObserver, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_requiredLayers, 0);
  objc_storeStrong((id *)&self->_activeVersions, 0);
  objc_storeStrong((id *)&self->_latestAvailableVersions, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_manifestManager, 0);
  objc_storeStrong((id *)&self->_configurationIsolation, 0);
}

@end
