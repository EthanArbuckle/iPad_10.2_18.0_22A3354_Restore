@implementation GEOMapDataSubscriptionLocalSyncManager

- (GEOMapDataSubscriptionLocalSyncManager)initWithPersistence:(id)a3 tileDB:(id)a4 dataConfiguration:(id)a5
{
  id v8;
  id v9;
  id v10;
  GEOMapDataSubscriptionLocalSyncManager *v11;
  OS_dispatch_queue *v12;
  OS_dispatch_queue *workQueue;
  geo_isolater *v14;
  geo_isolater *isolation;
  NSMutableArray *v16;
  NSMutableArray *observedIdentifiers;
  NSMutableDictionary *v18;
  NSMutableDictionary *observedStates;
  dispatch_group_t v20;
  void *v21;
  OS_dispatch_queue *v22;
  NSObject *v23;
  GEOMapDataSubscriptionLocalSyncManager *v24;
  GEOMapDataSubscriptionLocalSyncManager *v25;
  _QWORD v27[4];
  NSObject *v28;
  GEOMapDataSubscriptionLocalSyncManager *v29;
  id v30;
  id location;
  objc_super v32;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (NanoRegistryLibraryCore()
    && (v32.receiver = self,
        v32.super_class = (Class)GEOMapDataSubscriptionLocalSyncManager,
        v11 = -[GEOMapDataSubscriptionLocalSyncManager init](&v32, sel_init),
        (self = v11) != 0))
  {
    objc_storeWeak((id *)&v11->_persistence, v8);
    objc_storeStrong((id *)&self->_db, a4);
    geo_dispatch_queue_create_with_qos();
    v12 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
    workQueue = self->_workQueue;
    self->_workQueue = v12;

    v14 = (geo_isolater *)geo_isolater_create();
    isolation = self->_isolation;
    self->_isolation = v14;

    objc_storeStrong((id *)&self->_offlineDataConfiguration, a5);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    observedIdentifiers = self->_observedIdentifiers;
    self->_observedIdentifiers = v16;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v18 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    observedStates = self->_observedStates;
    self->_observedStates = v18;

    v20 = dispatch_group_create();
    objc_storeStrong((id *)&self->_initialNanoRegistryFetchGroup, v20);
    dispatch_group_enter(v20);
    objc_initWeak(&location, self);
    +[GEOKeyBagNotification sharedObject](GEOKeyBagNotification, "sharedObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = self->_workQueue;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __87__GEOMapDataSubscriptionLocalSyncManager_initWithPersistence_tileDB_dataConfiguration___block_invoke;
    v27[3] = &unk_1E1C15308;
    objc_copyWeak(&v30, &location);
    v23 = v20;
    v28 = v23;
    v24 = self;
    v29 = v24;
    objc_msgSend(v21, "runAfterFirstUnlock:block:", v22, v27);

    self = v24;
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);

    v25 = self;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

void __87__GEOMapDataSubscriptionLocalSyncManager_initWithPersistence_tileDB_dataConfiguration___block_invoke(uint64_t a1)
{
  id *v2;
  _QWORD *WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD block[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    getNRPairedDeviceRegistryDevicesDidUpdateNotification();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", WeakRetained, sel__pairedDevicesDidChange_, v5, 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", WeakRetained, sel__pairedDeviceConnectivityDidChange_, CFSTR("GEOPairedDeviceConnectionConnectivityDidChange"), 0);

    v7 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __87__GEOMapDataSubscriptionLocalSyncManager_initWithPersistence_tileDB_dataConfiguration___block_invoke_2;
    v18[3] = &unk_1E1BFF6F8;
    v19 = *(id *)(a1 + 32);
    -[GEOMapDataSubscriptionLocalSyncManager _updatePairedDevicesWithCompletionHandler:]((uint64_t)WeakRetained, v18);
    v8 = (void *)WeakRetained[3];
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __87__GEOMapDataSubscriptionLocalSyncManager_initWithPersistence_tileDB_dataConfiguration___block_invoke_3;
    v16[3] = &unk_1E1C152E0;
    objc_copyWeak(&v17, v2);
    MapsFeature_AddBlockListener(MapsFeaturesConfig_StandaloneWatchOffline, off_1EDF4B158, v8, v16);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(void **)(v10 + 96);
    *(_QWORD *)(v10 + 96) = v9;

    v12 = *(NSObject **)(a1 + 32);
    v13 = WeakRetained[3];
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __87__GEOMapDataSubscriptionLocalSyncManager_initWithPersistence_tileDB_dataConfiguration___block_invoke_4;
    block[3] = &unk_1E1BFF8B0;
    objc_copyWeak(&v15, v2);
    dispatch_group_notify(v12, v13, block);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);

  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }

}

void __87__GEOMapDataSubscriptionLocalSyncManager_initWithPersistence_tileDB_dataConfiguration___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)_updatePairedDevicesWithCompletionHandler:(uint64_t)a1
{
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[5];
  void (**v19)(_QWORD);
  id v20[6];
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    if ((GEOConfigGetBOOL(MapsFeaturesConfig_StandaloneWatchOffline, (uint64_t)off_1EDF4B158) & 1) != 0)
    {
      objc_msgSend(getNRPairedDeviceRegistryClass(), "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "getPairedDevices");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_geo_filtered:", &__block_literal_global_177);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      GEOGetSubscriptionsLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v8 = objc_msgSend(v6, "count");
        v9 = objc_msgSend(v5, "count");
        *(_DWORD *)buf = 134349312;
        v23 = v8;
        v24 = 2050;
        v25 = v9 - objc_msgSend(v6, "count");
        _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_DEBUG, "[PairedDevice] Found %{public}llu supported paired devices, %{public}llu unsupported devices", buf, 0x16u);
      }

      v10 = MEMORY[0x1E0C809B0];
      v20[1] = (id)MEMORY[0x1E0C809B0];
      v20[2] = (id)3221225472;
      v20[3] = __84__GEOMapDataSubscriptionLocalSyncManager__updatePairedDevicesWithCompletionHandler___block_invoke_33;
      v20[4] = &unk_1E1C00738;
      v20[5] = (id)a1;
      v11 = v6;
      v21 = v11;
      geo_isolate_sync_data();
      objc_msgSend(v11, "_geo_map:", &__block_literal_global_36_1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "count")
        || !GEOConfigGetBOOL(GeoOfflineConfig_HasPerformedInitialPairedDeviceSyncMigration, (uint64_t)off_1EDF4EC58))
      {
        if (objc_msgSend(v12, "count")
          && (GEOConfigGetBOOL(GeoOfflineConfig_HasPerformedInitialPairedDeviceSyncMigration, (uint64_t)off_1EDF4EC58) & 1) == 0)
        {
          GEOGetSubscriptionsLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_INFO, "[PairedDevice] Became aware of supported device pairing(s) for the first time. Setting initial sync values if appropriate", buf, 2u);
          }

          GEOConfigSetBOOL(GeoOfflineConfig_HasPerformedInitialPairedDeviceSyncMigration, (uint64_t)off_1EDF4EC58);
          objc_initWeak((id *)buf, (id)a1);
          v16 = *(void **)(a1 + 40);
          v17 = *(_QWORD *)(a1 + 24);
          v18[0] = v10;
          v18[1] = 3221225472;
          v18[2] = __84__GEOMapDataSubscriptionLocalSyncManager__updatePairedDevicesWithCompletionHandler___block_invoke_37;
          v18[3] = &unk_1E1C153A0;
          v18[4] = a1;
          v19 = v3;
          objc_copyWeak(v20, (id *)buf);
          objc_msgSend(v16, "fetchAllSubscriptionsWithQueue:callback:", v17, v18);
          objc_destroyWeak(v20);

          objc_destroyWeak((id *)buf);
        }
        else
        {
          -[GEOMapDataSubscriptionLocalSyncManager _considerDisplayingLowDiskSpaceNotification]((dispatch_queue_t *)a1);
          if (v3)
            v3[2](v3);
        }
      }
      else
      {
        GEOGetSubscriptionsLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1885A9000, v13, OS_LOG_TYPE_INFO, "[PairedDevice] No supported device pairings remain. Clearing sync flags", buf, 2u);
        }

        objc_msgSend(*(id *)(a1 + 40), "clearShouldSyncSubscriptionsForPairedDevice:", 0);
        _setValue(GeoOfflineConfig_HasPerformedInitialPairedDeviceSyncMigration, (uint64_t)off_1EDF4EC58, 0, 0, 0);
        _setValue(GeoOfflineConfig_LastPairedDeviceCheckedForDiskSpaceNotification, (uint64_t)off_1EDF4ECD8, 0, 0, 0);
      }

    }
    else if (GEOConfigGetBOOL(GeoOfflineConfig_HasPerformedInitialPairedDeviceSyncMigration, (uint64_t)off_1EDF4EC58))
    {
      GEOGetSubscriptionsLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_INFO, "[PairedDevice] Feature flag is disabled. Clearing paired device sync configuration", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 40), "clearShouldSyncSubscriptionsForPairedDevice:", 0);
      _setValue(GeoOfflineConfig_HasPerformedInitialPairedDeviceSyncMigration, (uint64_t)off_1EDF4EC58, 0, 0, 0);
    }
  }

}

void __87__GEOMapDataSubscriptionLocalSyncManager_initWithPersistence_tileDB_dataConfiguration___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[GEOMapDataSubscriptionLocalSyncManager _updatePairedDevicesWithCompletionHandler:]((uint64_t)WeakRetained, 0);

}

void __87__GEOMapDataSubscriptionLocalSyncManager_initWithPersistence_tileDB_dataConfiguration___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setNeedsPairedDeviceStateSynchronization");

}

- (void)dealloc
{
  objc_super v3;

  MapsFeature_RemoveBlockListener(self->_featureFlagObserver);
  v3.receiver = self;
  v3.super_class = (Class)GEOMapDataSubscriptionLocalSyncManager;
  -[GEOMapDataSubscriptionLocalSyncManager dealloc](&v3, sel_dealloc);
}

- (id)_pairedDeviceDaemonConnection
{
  id v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  void (*v7)(uint64_t);
  id v8;

  if (!a1)
    return 0;
  v3 = 0;
  v4 = &v3;
  v5 = 0x3032000000;
  v6 = __Block_byref_object_copy__88;
  v7 = __Block_byref_object_dispose__88;
  v8 = 0;
  geo_isolate_sync();
  v1 = (id)v4[5];
  _Block_object_dispose(&v3, 8);

  return v1;
}

void __71__GEOMapDataSubscriptionLocalSyncManager__pairedDeviceDaemonConnection__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 112));
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.nanomaps.xpc.GeoServices"), 0);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE046D88);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setRemoteObjectInterface:", v5);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setExportedObject:", *(_QWORD *)(a1 + 32));
    objc_initWeak(&location, *(id *)(a1 + 32));
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __71__GEOMapDataSubscriptionLocalSyncManager__pairedDeviceDaemonConnection__block_invoke_2;
    v9 = &unk_1E1BFF8B0;
    objc_copyWeak(&v10, &location);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setInvalidationHandler:", &v6);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 112), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "resume", v6, v7, v8, v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __71__GEOMapDataSubscriptionLocalSyncManager__pairedDeviceDaemonConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    geo_isolate_sync_data();
    WeakRetained = v2;
  }

}

void __71__GEOMapDataSubscriptionLocalSyncManager__pairedDeviceDaemonConnection__block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 112);
  *(_QWORD *)(v1 + 112) = 0;

}

- (void)setNeedsPairedDeviceStateSynchronization
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__GEOMapDataSubscriptionLocalSyncManager_setNeedsPairedDeviceStateSynchronization__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

void __82__GEOMapDataSubscriptionLocalSyncManager_setNeedsPairedDeviceStateSynchronization__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest *v6;
  void *v7;
  void *v8;
  id v9;

  if (GEOConfigGetUInteger(GeoOfflineConfig_SubscriptionIDSMessagesMode, (uint64_t)off_1EDF4ECA8) != 1)
  {
    -[GEOMapDataSubscriptionLocalSyncManager _pairedDeviceSubscriptionStatesSummary](*(_QWORD *)(a1 + 32));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "data");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2)
    {
      v4 = v2;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "data");
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v4;

    v6 = objc_alloc_init(GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest);
    objc_msgSend(v5, "_geo_SHA256Hash");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest setSummarySHA256Hash:](v6, "setSummarySHA256Hash:", v7);

    +[GEOPairedDeviceConnection sharedInstance](GEOPairedDeviceConnection, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sendCheckinWithSubscriptionStateSummary:", v6);

    -[GEOMapDataSubscriptionLocalSyncManager _updateObservedStateSubscriptionIdentifiersForPairedDevice](*(_QWORD *)(a1 + 32));
  }
}

- (id)_pairedDeviceSubscriptionStatesSummary
{
  id v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  void (*v7)(uint64_t);
  id v8;

  if (!a1)
    return 0;
  v3 = 0;
  v4 = &v3;
  v5 = 0x3032000000;
  v6 = __Block_byref_object_copy__88;
  v7 = __Block_byref_object_dispose__88;
  v8 = 0;
  geo_isolate_sync();
  v1 = (id)v4[5];
  _Block_object_dispose(&v3, 8);

  return v1;
}

- (void)_updateObservedStateSubscriptionIdentifiersForPairedDevice
{
  uint64_t UInteger;
  uint64_t v3;
  void *v4;
  void *v5;
  GEOPairedDeviceSubscriptionStateSynchronizationRequest *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  if (a1)
  {
    UInteger = GEOConfigGetUInteger(GeoOfflineConfig_SubscriptionIDSMessagesMode, (uint64_t)off_1EDF4ECA8);
    if (UInteger == 2)
      goto LABEL_4;
    v3 = UInteger;
    -[GEOMapDataSubscriptionLocalSyncManager _pairedDeviceDaemonConnection](a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remoteObjectProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateObservedStateSubscriptionIdentifiers");

    if (v3 != 1)
    {
LABEL_4:
      v11 = 0;
      v12 = &v11;
      v13 = 0x3032000000;
      v14 = __Block_byref_object_copy__88;
      v15 = __Block_byref_object_dispose__88;
      v16 = 0;
      v9 = MEMORY[0x1E0C809B0];
      v10 = a1;
      geo_isolate_sync_data();
      v6 = objc_alloc_init(GEOPairedDeviceSubscriptionStateSynchronizationRequest);
      v7 = (void *)objc_msgSend((id)v12[5], "mutableCopy", v9, 3221225472, __100__GEOMapDataSubscriptionLocalSyncManager__updateObservedStateSubscriptionIdentifiersForPairedDevice__block_invoke, &unk_1E1C00760, v10, &v11);
      -[GEOPairedDeviceSubscriptionStateSynchronizationRequest setIdentifiersToObserves:](v6, "setIdentifiersToObserves:", v7);

      +[GEOPairedDeviceConnection sharedInstance](GEOPairedDeviceConnection, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sendSetObservedSubscriptionIdentifiers:", v6);

      _Block_object_dispose(&v11, 8);
    }
  }
}

- (void)_pairedDevicesDidChange:(id)a3
{
  NSObject *v4;
  NSObject *workQueue;
  _QWORD block[5];
  uint8_t buf[16];

  GEOGetSubscriptionsLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_INFO, "[PairedDevice] Paired devices changed", buf, 2u);
  }

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__GEOMapDataSubscriptionLocalSyncManager__pairedDevicesDidChange___block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

void __66__GEOMapDataSubscriptionLocalSyncManager__pairedDevicesDidChange___block_invoke(uint64_t a1)
{
  -[GEOMapDataSubscriptionLocalSyncManager _updatePairedDevicesWithCompletionHandler:](*(_QWORD *)(a1 + 32), 0);
}

- (void)_pairedDeviceConnectivityDidChange:(id)a3
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__GEOMapDataSubscriptionLocalSyncManager__pairedDeviceConnectivityDidChange___block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

void __77__GEOMapDataSubscriptionLocalSyncManager__pairedDeviceConnectivityDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint8_t v28[128];
  uint8_t buf[4];
  const __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  +[GEOPairedDeviceConnection sharedInstance](GEOPairedDeviceConnection, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isConnected");

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__88;
  v26 = __Block_byref_object_dispose__88;
  v27 = 0;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = MEMORY[0x1E0C809B0];
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __77__GEOMapDataSubscriptionLocalSyncManager__pairedDeviceConnectivityDidChange___block_invoke_2;
  v19 = &unk_1E1BFF920;
  v20 = v4;
  v21 = &v22;
  geo_isolate_sync_data();
  if (objc_msgSend((id)v23[5], "count"))
  {
    GEOGetSubscriptionsLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = CFSTR("not connected");
      if (v3)
        v7 = CFSTR("connected");
      *(_DWORD *)buf = 138543362;
      v30 = v7;
      _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_INFO, "[PairedDevice] Paired device connectivity changed (%{public}@). Updating observed state(s) accordingly", buf, 0xCu);
    }

  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v8 = (id)v23[5];
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v28, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(a1 + 32), "fetchStateForPairedDeviceSubscriptionWithIdentifier:callbackQueue:completionHandler:", v5, 3221225472, __77__GEOMapDataSubscriptionLocalSyncManager__pairedDeviceConnectivityDidChange___block_invoke_27, &unk_1E1C15330, *(_QWORD *)(a1 + 32), *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v28, 16);
    }
    while (v9);
  }

  _Block_object_dispose(&v22, 8);
}

void __77__GEOMapDataSubscriptionLocalSyncManager__pairedDeviceConnectivityDidChange___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeAllObjects");
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __77__GEOMapDataSubscriptionLocalSyncManager__pairedDeviceConnectivityDidChange___block_invoke_27(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = a2;
    objc_msgSend(v3, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "syncManager:didUpdatePairedDeviceState:forIdentifier:", *(_QWORD *)(a1 + 32), v4, *(_QWORD *)(a1 + 40));

  }
}

- (void)didAddSubscription:(id)a3
{
  id v4;
  NSObject *initialNanoRegistryFetchGroup;
  NSObject *workQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (GEOConfigGetBOOL(MapsFeaturesConfig_StandaloneWatchOffline, (uint64_t)off_1EDF4B158))
  {
    initialNanoRegistryFetchGroup = self->_initialNanoRegistryFetchGroup;
    workQueue = self->_workQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __61__GEOMapDataSubscriptionLocalSyncManager_didAddSubscription___block_invoke;
    v7[3] = &unk_1E1C00738;
    v7[4] = self;
    v8 = v4;
    dispatch_group_notify(initialNanoRegistryFetchGroup, workQueue, v7);

  }
}

void __61__GEOMapDataSubscriptionLocalSyncManager_didAddSubscription___block_invoke(uint64_t a1)
{
  uint64_t BOOL;
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v8 = *(_QWORD *)(a1 + 32);
  geo_isolate_sync_data();
  if (*((_BYTE *)v10 + 24))
  {
    BOOL = GEOConfigGetBOOL(GeoOfflineConfig_SyncToWatchEnabled, (uint64_t)off_1EDF4EC18);
    GEOGetSubscriptionsLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 40), "identifier", v7, 3221225472, __61__GEOMapDataSubscriptionLocalSyncManager_didAddSubscription___block_invoke_2, &unk_1E1C00760, v8, &v9);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109635;
      v14 = BOOL;
      v15 = 2160;
      v16 = 1752392040;
      v17 = 2113;
      v18 = v4;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_INFO, "[PairedDevice] Setting should_sync = %i for new subscription '%{private, mask.hash}@' (if not already configured)", buf, 0x1Cu);

    }
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSubscriptionWithIdentifier:shouldSync:toPairedDevice:shouldOverwriteExistingValue:", v6, BOOL, 0, 0);
  }
  else
  {
    GEOGetSubscriptionsLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_DEBUG, "[PairedDevice] Not configuring sync state because there are no paired devices", buf, 2u);
    }
  }

  _Block_object_dispose(&v9, 8);
}

uint64_t __61__GEOMapDataSubscriptionLocalSyncManager_didAddSubscription___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 80);
  return result;
}

- (void)didUpdateSubscriptionWithIdentifier:(id)a3
{
  void *v3;
  id v4;

  -[GEOMapDataSubscriptionLocalSyncManager _pairedDeviceDaemonConnection]((uint64_t)self);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsSubscriptionSynchronizationUpdate");

}

- (void)_synchronizedSubscriptionsDidChange
{
  void *v2;
  id v3;

  if (a1)
  {
    notify_post(GEOMapDataSubscriptionManagerPairedDeviceSubscriptionsDidChangeDarwinNotification);
    -[GEOMapDataSubscriptionLocalSyncManager _pairedDeviceDaemonConnection](a1);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "remoteObjectProxy");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setNeedsSubscriptionSynchronizationUpdate");

  }
}

uint64_t __84__GEOMapDataSubscriptionLocalSyncManager__updatePairedDevicesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = (objc_class *)MEMORY[0x1E0CB3A28];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithUUIDString:", CFSTR("3B512C1E-F8D5-4FE7-B109-1AD8EF7F924D"));
  v5 = objc_msgSend(v3, "supportsCapability:", v4);

  return v5;
}

void __84__GEOMapDataSubscriptionLocalSyncManager__updatePairedDevicesWithCompletionHandler___block_invoke_33(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint8_t v18[16];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 80) = objc_msgSend(*(id *)(a1 + 40), "count") != 0;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v2 = *(id *)(a1 + 40);
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        getNRDevicePropertyIsActive();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "valueForProperty:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "BOOLValue");

        if (v9)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "pairingID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pairingID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqual:", v11);

  if ((v12 & 1) == 0)
  {
    v13 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v13 + 88))
    {
      GEOGetSubscriptionsLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_DEBUG, "[PairedDevice] Active device changed", v18, 2u);
      }

      v13 = *(_QWORD *)(a1 + 32);
    }
    v15 = *(void **)(v13 + 104);
    *(_QWORD *)(v13 + 104) = 0;

  }
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(void **)(v16 + 88);
  *(_QWORD *)(v16 + 88) = v3;

}

uint64_t __84__GEOMapDataSubscriptionLocalSyncManager__updatePairedDevicesWithCompletionHandler___block_invoke_34(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pairingID");
}

void __84__GEOMapDataSubscriptionLocalSyncManager__updatePairedDevicesWithCompletionHandler___block_invoke_37(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  id v15;
  _QWORD *v16;
  uint64_t v17;
  void *v18;
  _QWORD *v19;
  id v20;
  uint64_t BOOL;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  _QWORD block[4];
  id v26;
  _QWORD v27[2];
  void (*v28)(uint64_t, uint64_t);
  void *v29;
  id v30;
  NSObject *v31;
  id v32;
  __int128 buf;
  void (*v34)(uint64_t, void *, void *);
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 || !v6)
  {
    v10 = dispatch_group_create();
    objc_msgSend(v5, "_geo_filtered:", &__block_literal_global_40_1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");
    v13 = MEMORY[0x1E0C809B0];
    if (v12)
    {
      dispatch_group_enter(v10);
      v14 = *(_QWORD **)(a1 + 32);
      v27[0] = v13;
      v27[1] = 3221225472;
      v28 = __84__GEOMapDataSubscriptionLocalSyncManager__updatePairedDevicesWithCompletionHandler___block_invoke_41;
      v29 = &unk_1E1C15378;
      objc_copyWeak(&v32, (id *)(a1 + 48));
      v30 = v11;
      v31 = v10;
      v15 = v30;
      v16 = v27;
      if (v14)
      {
        if (_GEOConfigHasValue(GeoOfflineConfig_SyncToWatchEnabled, (uint64_t)off_1EDF4EC18)
          || (v17 = 1000000
                  * GEOConfigGetUint64(GeoOfflineConfig_SyncToWatchDefaultEnabledSizeThreshold, (uint64_t)off_1EDF4EC28)) == 0)
        {
          BOOL = GEOConfigGetBOOL(GeoOfflineConfig_SyncToWatchEnabled, (uint64_t)off_1EDF4EC18);
          v28((uint64_t)v16, BOOL);
        }
        else
        {
          objc_msgSend(v15, "_geo_map:", &__block_literal_global_46_0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
          *((_QWORD *)&buf + 1) = 3221225472;
          v34 = __115__GEOMapDataSubscriptionLocalSyncManager__setInitialSyncToWatchStateIfNecessaryForSubscriptions_completionHandler___block_invoke_2;
          v35 = &unk_1E1C153C8;
          v19 = v16;
          v36 = v18;
          v37 = v19;
          v38 = v17;
          v20 = v18;
          -[GEOMapDataSubscriptionLocalSyncManager _fetchStatesForSubscriptionsWithIdentifiers:completionHandler:](v14, v20, &buf);

        }
      }

      objc_destroyWeak(&v32);
    }
    else
    {
      GEOGetSubscriptionsLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1885A9000, v22, OS_LOG_TYPE_INFO, "[PairedDevice] No offline subscriptions found", (uint8_t *)&buf, 2u);
      }

    }
    v23 = *(void **)(a1 + 40);
    v24 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __84__GEOMapDataSubscriptionLocalSyncManager__updatePairedDevicesWithCompletionHandler___block_invoke_43;
    block[3] = &unk_1E1C01F48;
    v26 = v23;
    dispatch_group_notify(v10, v24, block);

  }
  else
  {
    GEOGetSubscriptionsLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v7;
      _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_ERROR, "[PairedDevice] Error fetching existing subscriptions. Will retry initial configuration later: %{public}@", (uint8_t *)&buf, 0xCu);
    }

    _setValue(GeoOfflineConfig_HasPerformedInitialPairedDeviceSyncMigration, (uint64_t)off_1EDF4EC58, 0, 0, 0);
    v9 = *(_QWORD *)(a1 + 40);
    if (v9)
      (*(void (**)(void))(v9 + 16))();
  }

}

unint64_t __84__GEOMapDataSubscriptionLocalSyncManager__updatePairedDevicesWithCompletionHandler___block_invoke_38(uint64_t a1, void *a2)
{
  return ((unint64_t)objc_msgSend(a2, "dataTypes") >> 10) & 1;
}

void __84__GEOMapDataSubscriptionLocalSyncManager__updatePairedDevicesWithCompletionHandler___block_invoke_41(uint64_t a1, uint64_t a2)
{
  dispatch_queue_t *WeakRetained;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  dispatch_queue_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  int v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    GEOGetSubscriptionsLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = objc_msgSend(*(id *)(a1 + 32), "count");
      *(_DWORD *)buf = 67109376;
      v20 = a2;
      v21 = 2048;
      v22 = v6;
      _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_INFO, "[PairedDevice] Setting should sync to %i for %llu subscriptions", buf, 0x12u);
    }

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = *(id *)(a1 + 32);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = WeakRetained[5];
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "identifier", (_QWORD)v14);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setSubscriptionWithIdentifier:shouldSync:toPairedDevice:](v12, "setSubscriptionWithIdentifier:shouldSync:toPairedDevice:", v13, a2, 0);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

    -[GEOMapDataSubscriptionLocalSyncManager _synchronizedSubscriptionsDidChange]((uint64_t)WeakRetained);
    -[GEOMapDataSubscriptionLocalSyncManager _considerDisplayingLowDiskSpaceNotification](WeakRetained);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }

}

- (void)_considerDisplayingLowDiskSpaceNotification
{
  uint64_t v2;
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  dispatch_queue_t v7;
  _QWORD v8[6];
  uint8_t buf[16];
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  dispatch_queue_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  dispatch_assert_queue_V2(a1[3]);
  if (GEOConfigGetBOOL(MapsFeaturesConfig_StandaloneWatchOffline, (uint64_t)off_1EDF4B158))
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__88;
    v20 = __Block_byref_object_dispose__88;
    v21 = 0;
    v2 = MEMORY[0x1E0C809B0];
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __85__GEOMapDataSubscriptionLocalSyncManager__considerDisplayingLowDiskSpaceNotification__block_invoke;
    v13 = &unk_1E1C00760;
    v14 = a1;
    v15 = &v16;
    geo_isolate_sync_data();
    if (v17[5])
    {
      _getValue(GeoOfflineConfig_LastPairedDeviceCheckedForDiskSpaceNotification, (uint64_t)off_1EDF4ECD8, 1, 0, 0, 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3
        && (objc_msgSend((id)v17[5], "UUIDString"),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            v5 = objc_msgSend(v3, "isEqualToString:", v4),
            v4,
            v5))
      {
        GEOGetSubscriptionsLog();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_DEBUG, "[PairedDevice] Already considered displaying low-space notification for active device", buf, 2u);
        }

      }
      else
      {
        v7 = a1[3];
        v8[0] = v2;
        v8[1] = 3221225472;
        v8[2] = __85__GEOMapDataSubscriptionLocalSyncManager__considerDisplayingLowDiskSpaceNotification__block_invoke_48;
        v8[3] = &unk_1E1C15490;
        v8[4] = a1;
        v8[5] = &v16;
        -[dispatch_queue_t fetchSubscriptionIdentifiersToSyncToPairedDeviceWithQueue:completionHandler:](a1, "fetchSubscriptionIdentifiersToSyncToPairedDeviceWithQueue:completionHandler:", v7, v8);
      }

    }
    else
    {
      _setValue(GeoOfflineConfig_LastPairedDeviceCheckedForDiskSpaceNotification, (uint64_t)off_1EDF4ECD8, 0, 0, 0);
    }
    _Block_object_dispose(&v16, 8);

  }
}

uint64_t __84__GEOMapDataSubscriptionLocalSyncManager__updatePairedDevicesWithCompletionHandler___block_invoke_43(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __115__GEOMapDataSubscriptionLocalSyncManager__setInitialSyncToWatchStateIfNecessaryForSubscriptions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

void __115__GEOMapDataSubscriptionLocalSyncManager__setInitialSyncToWatchStateIfNecessaryForSubscriptions_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t BOOL;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v7 = *(id *)(a1 + 32);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v29 != v11)
            objc_enumerationMutation(v7);
          v13 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v5, "objectForKeyedSubscript:", v13, (_QWORD)v28);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v14)
          {
            GEOGetSubscriptionsLog();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 141558275;
              v33 = 1752392040;
              v34 = 2113;
              v35 = v13;
              _os_log_impl(&dword_1885A9000, v16, OS_LOG_TYPE_ERROR, "[PairedDevice] Missing state for identifier '%{private,mask.hash}@'. Not considering disabling sync-to-watch by default.", buf, 0x16u);
            }

            v17 = *(_QWORD *)(a1 + 40);
            BOOL = GEOConfigGetBOOL(GeoOfflineConfig_SyncToWatchEnabled, (uint64_t)off_1EDF4EC18);
            (*(void (**)(uint64_t, uint64_t))(v17 + 16))(v17, BOOL);

            goto LABEL_26;
          }
          v15 = v14;
          v10 += objc_msgSend(v14, "downloadedDataSize");

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v9)
          continue;
        break;
      }
    }
    else
    {
      v10 = 0;
    }

    v22 = *(_QWORD *)(a1 + 48);
    GEOGetSubscriptionsLog();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v10 >= v22)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v27 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 134218240;
        v33 = v10;
        v34 = 2048;
        v35 = v27;
        _os_log_impl(&dword_1885A9000, v24, OS_LOG_TYPE_INFO, "[PairedDevice] Current offline data size (%{bytes}llu) is above threshold (%{bytes}llu). Disabling sync-to-watch by default.", buf, 0x16u);
      }

      GEOConfigSetBOOL(GeoOfflineConfig_SyncToWatchEnabled, (uint64_t)off_1EDF4EC18);
      v26 = 0;
    }
    else
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        v25 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 134218240;
        v33 = v10;
        v34 = 2048;
        v35 = v25;
        _os_log_impl(&dword_1885A9000, v24, OS_LOG_TYPE_DEBUG, "[PairedDevice] Current offline data size (%{bytes}llu) is less than threshold (%{bytes}llu). Not disabling sync-to-watch by default.", buf, 0x16u);
      }

      v26 = GEOConfigGetBOOL(GeoOfflineConfig_SyncToWatchEnabled, (uint64_t)off_1EDF4EC18);
    }
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v26);
  }
  else
  {
    GEOGetSubscriptionsLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v33 = (uint64_t)v6;
      _os_log_impl(&dword_1885A9000, v19, OS_LOG_TYPE_ERROR, "[PairedDevice] Failed to fetch states for subscriptions. Not considering disabling sync-to-watch by default: %{private}@", buf, 0xCu);
    }

    v20 = *(_QWORD *)(a1 + 40);
    v21 = GEOConfigGetBOOL(GeoOfflineConfig_SyncToWatchEnabled, (uint64_t)off_1EDF4EC18);
    (*(void (**)(uint64_t, uint64_t))(v20 + 16))(v20, v21);
  }
LABEL_26:

}

- (void)_fetchStatesForSubscriptionsWithIdentifiers:(void *)a3 completionHandler:
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  id obj;
  void *v17;
  _QWORD block[4];
  id v19;
  uint8_t *v20;
  _QWORD *v21;
  _QWORD v22[5];
  NSObject *v23;
  uint8_t *v24;
  _QWORD *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[5];
  id v31;
  uint8_t buf[8];
  uint8_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v15 = a2;
  v14 = a3;
  if (a1)
  {
    if (objc_msgSend(v15, "count"))
    {
      objc_msgSend(a1, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        *(_QWORD *)buf = 0;
        v33 = buf;
        v34 = 0x3032000000;
        v35 = __Block_byref_object_copy__88;
        v36 = __Block_byref_object_dispose__88;
        v37 = 0;
        v30[0] = 0;
        v30[1] = v30;
        v30[2] = 0x3032000000;
        v30[3] = __Block_byref_object_copy__88;
        v30[4] = __Block_byref_object_dispose__88;
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
        v31 = (id)objc_claimAutoreleasedReturnValue();
        v5 = dispatch_group_create();
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        obj = v15;
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
        if (v6)
        {
          v7 = *(_QWORD *)v27;
          do
          {
            for (i = 0; i != v6; ++i)
            {
              if (*(_QWORD *)v27 != v7)
                objc_enumerationMutation(obj);
              v9 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
              dispatch_group_enter(v5);
              v10 = a1[3];
              v22[0] = MEMORY[0x1E0C809B0];
              v22[1] = 3221225472;
              v22[2] = __104__GEOMapDataSubscriptionLocalSyncManager__fetchStatesForSubscriptionsWithIdentifiers_completionHandler___block_invoke_2;
              v22[3] = &unk_1E1C154B8;
              v24 = buf;
              v25 = v30;
              v22[4] = v9;
              v23 = v5;
              objc_msgSend(v17, "syncManager:fetchStateForSubscriptionWithIdentifier:callbackQueue:completionHandler:", a1, v9, v10, v22);

            }
            v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
          }
          while (v6);
        }

        v11 = a1[3];
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __104__GEOMapDataSubscriptionLocalSyncManager__fetchStatesForSubscriptionsWithIdentifiers_completionHandler___block_invoke_3;
        block[3] = &unk_1E1C016C8;
        v19 = v14;
        v20 = buf;
        v21 = v30;
        dispatch_group_notify(v5, v11, block);

        _Block_object_dispose(v30, 8);
        _Block_object_dispose(buf, 8);

      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: delegate != ((void *)0)", buf, 2u);
        }
        v13 = a1[3];
        v38[0] = MEMORY[0x1E0C809B0];
        v38[1] = 3221225472;
        v38[2] = __104__GEOMapDataSubscriptionLocalSyncManager__fetchStatesForSubscriptionsWithIdentifiers_completionHandler___block_invoke_58;
        v38[3] = &unk_1E1C01F48;
        v39 = v14;
        dispatch_async(v13, v38);

      }
    }
    else
    {
      v12 = a1[3];
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __104__GEOMapDataSubscriptionLocalSyncManager__fetchStatesForSubscriptionsWithIdentifiers_completionHandler___block_invoke;
      v40[3] = &unk_1E1C01F48;
      v41 = v14;
      dispatch_async(v12, v40);

    }
  }

}

void __85__GEOMapDataSubscriptionLocalSyncManager__considerDisplayingLowDiskSpaceNotification__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "pairingID");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __85__GEOMapDataSubscriptionLocalSyncManager__considerDisplayingLowDiskSpaceNotification__block_invoke_48(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  __int128 v12;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    if (objc_msgSend(v5, "count"))
    {
      v7 = *(_QWORD **)(a1 + 32);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __85__GEOMapDataSubscriptionLocalSyncManager__considerDisplayingLowDiskSpaceNotification__block_invoke_49;
      v10[3] = &unk_1E1C15468;
      v11 = v5;
      v12 = *(_OWORD *)(a1 + 32);
      -[GEOMapDataSubscriptionLocalSyncManager _fetchStatesForSubscriptionsWithIdentifiers:completionHandler:](v7, v11, v10);
      v8 = v11;
    }
    else
    {
      GEOGetSubscriptionsLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_DEBUG, "[PairedDevice] No subscriptions will sync to active watch. No need to query available disk space", buf, 2u);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "UUIDString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _setValue(GeoOfflineConfig_LastPairedDeviceCheckedForDiskSpaceNotification, (uint64_t)off_1EDF4ECD8, v8, 1, 0);
    }

  }
}

void __85__GEOMapDataSubscriptionLocalSyncManager__considerDisplayingLowDiskSpaceNotification__block_invoke_49(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  GEOPairedDeviceGetStorageInfoRequest *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  id v20;
  int8x16_t v21;
  _QWORD v22[4];
  int8x16_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v7 = (GEOPairedDeviceGetStorageInfoRequest *)*(id *)(a1 + 32);
    v8 = -[GEOPairedDeviceGetStorageInfoRequest countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v27 != v11)
            objc_enumerationMutation(v7);
          v13 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v5, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v14)
          {
            GEOGetSubscriptionsLog();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 141558275;
              v31 = 1752392040;
              v32 = 2113;
              v33 = v13;
              _os_log_impl(&dword_1885A9000, v16, OS_LOG_TYPE_ERROR, "[PairedDevice] Missing state for identifier '%{private,mask.hash}@'. Not considering displaying low-space notification", buf, 0x16u);
            }

            goto LABEL_20;
          }
          v15 = v14;
          v10 += objc_msgSend(v14, "downloadedDataSize");

        }
        v9 = -[GEOPairedDeviceGetStorageInfoRequest countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v9)
          continue;
        break;
      }
    }
    else
    {
      v10 = 0;
    }

    v17 = v10
        + (unint64_t)(GEOConfigGetDouble(GeoOfflineConfig_DownloadAvailableDiskCapacityAdditionalMultiplier, (uint64_t)off_1EDF4ECB8)* (double)v10);
    GEOGetSubscriptionsLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v31 = v17;
      _os_log_impl(&dword_1885A9000, v18, OS_LOG_TYPE_DEBUG, "[PairedDevice] Sync-to-watch subscriptions require up to %{public,bytes}llu. Checking available disk space on paired device", buf, 0xCu);
    }

    v7 = objc_alloc_init(GEOPairedDeviceGetStorageInfoRequest);
    +[GEOPairedDeviceConnection sharedInstance](GEOPairedDeviceConnection, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __85__GEOMapDataSubscriptionLocalSyncManager__considerDisplayingLowDiskSpaceNotification__block_invoke_51;
    v22[3] = &unk_1E1C15440;
    v25 = v17;
    v21 = *(int8x16_t *)(a1 + 32);
    v20 = (id)v21.i64[0];
    v23 = vextq_s8(v21, v21, 8uLL);
    v24 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v19, "sendGetStorageInfo:withReply:", v7, v22);

  }
  else
  {
    GEOGetSubscriptionsLog();
    v7 = (GEOPairedDeviceGetStorageInfoRequest *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v31 = (uint64_t)v6;
      _os_log_impl(&dword_1885A9000, &v7->super.super, OS_LOG_TYPE_ERROR, "[PairedDevice] Failed to fetch states for subscriptions. Not considering displaying low-space notification: %{private}@", buf, 0xCu);
    }
  }
LABEL_20:

}

void __85__GEOMapDataSubscriptionLocalSyncManager__considerDisplayingLowDiskSpaceNotification__block_invoke_51(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  NSObject *v25;
  unint64_t v26;
  __int128 buf;
  void (*v28)(uint64_t, void *);
  void *v29;
  NSObject *v30;
  uint64_t *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = objc_msgSend(v5, "availableStorageBytesOfflineMaps");
    v8 = a1[7];
    if (v7 >= v8)
    {
      GEOGetSubscriptionsLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1885A9000, v19, OS_LOG_TYPE_DEBUG, "[PairedDevice] Paired device has sufficient disk space for estimated subscription sizes", (uint8_t *)&buf, 2u);
      }
    }
    else
    {
      v9 = v8 - objc_msgSend(v5, "availableStorageBytesOfflineMaps");
      GEOGetSubscriptionsLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 134349056;
        *(_QWORD *)((char *)&buf + 4) = v9;
        _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_INFO, "[PairedDevice] Paired device requires %{public,bytes}llu additional space for synced subscriptions", (uint8_t *)&buf, 0xCu);
      }

      v11 = MEMORY[0x1E0C809B0];
      v13 = a1[4];
      v12 = (void *)a1[5];
      v21 = MEMORY[0x1E0C809B0];
      v22 = 3221225472;
      v23 = __85__GEOMapDataSubscriptionLocalSyncManager__considerDisplayingLowDiskSpaceNotification__block_invoke_52;
      v24 = &unk_1E1C15418;
      v26 = v9;
      v25 = v12;
      v14 = v25;
      v15 = &v21;
      if (v13)
      {
        v16 = *(void **)(v13 + 40);
        v17 = *(_QWORD *)(v13 + 24);
        *(_QWORD *)&buf = v11;
        *((_QWORD *)&buf + 1) = 3221225472;
        v28 = __105__GEOMapDataSubscriptionLocalSyncManager__fetchDisplayNamesForSubscriptionIdentifiers_completionHandler___block_invoke;
        v29 = &unk_1E1C154E0;
        v18 = v14;
        v30 = v18;
        v31 = v15;
        objc_msgSend(v16, "fetchSubscriptionsMatchingIdentifiers:queue:callback:", v18, v17, &buf, v21, v22, v23, v24);

      }
      v19 = v25;
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "UUIDString");
    v20 = objc_claimAutoreleasedReturnValue();
    _setValue(GeoOfflineConfig_LastPairedDeviceCheckedForDiskSpaceNotification, (uint64_t)off_1EDF4ECD8, v20, 1, 0);
  }
  else
  {
    GEOGetSubscriptionsLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_1885A9000, v20, OS_LOG_TYPE_ERROR, "[PairedDevice] Failed to fetch storage info from paired device: %{public}@", (uint8_t *)&buf, 0xCu);
    }
  }

}

void __85__GEOMapDataSubscriptionLocalSyncManager__considerDisplayingLowDiskSpaceNotification__block_invoke_52(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0CB3B38];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __85__GEOMapDataSubscriptionLocalSyncManager__considerDisplayingLowDiskSpaceNotification__block_invoke_2;
  v7[3] = &unk_1E1C153F0;
  v5 = *(void **)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v8 = v5;
  v9 = v3;
  v6 = v3;
  objc_msgSend(v4, "geo_withMapsNotificationProviderDaemon:errorHandler:", v7, &__block_literal_global_55);

}

uint64_t __85__GEOMapDataSubscriptionLocalSyncManager__considerDisplayingLowDiskSpaceNotification__block_invoke_2(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "pairedDeviceHasInsufficientDiskSpace:forSubscriptions:withDisplayNames:", a1[6], a1[4], a1[5]);
}

void __85__GEOMapDataSubscriptionLocalSyncManager__considerDisplayingLowDiskSpaceNotification__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  GEOGetSubscriptionsLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_ERROR, "[PairedDevice] Could not communicate with notification provider to display notification: %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

uint64_t __104__GEOMapDataSubscriptionLocalSyncManager__fetchStatesForSubscriptionsWithIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __104__GEOMapDataSubscriptionLocalSyncManager__fetchStatesForSubscriptionsWithIdentifiers_completionHandler___block_invoke_58(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -13);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __104__GEOMapDataSubscriptionLocalSyncManager__fetchStatesForSubscriptionsWithIdentifiers_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (v5 && (v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8), v8 = *(_QWORD *)(v6 + 40), v7 = (id *)(v6 + 40), !v8))
  {
    objc_storeStrong(v7, a3);
  }
  else if (v9)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setObject:forKey:", v9, *(_QWORD *)(a1 + 32));
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

uint64_t __104__GEOMapDataSubscriptionLocalSyncManager__fetchStatesForSubscriptionsWithIdentifiers_completionHandler___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1[4];
  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
    v3 = 0;
  else
    v3 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

void __105__GEOMapDataSubscriptionLocalSyncManager__fetchDisplayNamesForSubscriptionIdentifiers_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v11 = *(void **)(a1 + 32);
        objc_msgSend(v10, "identifier", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "containsObject:", v12))
        {
          objc_msgSend(v10, "displayName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v13)
            continue;
          objc_msgSend(v10, "displayName");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v14);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)fetchSubscriptionsForSyncToWatchWithIdentifier:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  GEOPBCompanionSubscriptionsInfo *v11;
  GEOTileDB *db;
  id v13;
  GEOPBCompanionSubscriptionsInfo *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  GEOPBCompanionSubscriptionsInfo *v19;
  GEOMapDataSubscriptionLocalSyncManager *v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(GEOPBCompanionSubscriptionsInfo);
  -[GEOPBCompanionSubscriptionsInfo setPadding:](v11, "setPadding:", 1);
  db = self->_db;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __121__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionsForSyncToWatchWithIdentifier_callbackQueue_completionHandler___block_invoke;
  v17[3] = &unk_1E1C155A0;
  v21 = v8;
  v22 = v10;
  v18 = v9;
  v19 = v11;
  v20 = self;
  v13 = v8;
  v14 = v11;
  v15 = v10;
  v16 = v9;
  -[GEOTileDB fetchAllSubscriptionsWithQueue:callback:](db, "fetchAllSubscriptionsWithQueue:callback:", v16, v17);

}

void __121__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionsForSyncToWatchWithIdentifier_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  NSObject *v27;
  _QWORD *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  id v32;
  void *v33;
  id obj;
  void *v35;
  void *v36;
  _QWORD block[4];
  id v38;
  NSObject *v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  id v44;
  _QWORD *v45;
  _QWORD v46[4];
  NSObject *v47;
  _QWORD *v48;
  _QWORD v49[5];
  id v50;
  _QWORD v51[4];
  id v52;
  void *v53;
  id v54;
  NSObject *v55;
  _QWORD *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[5];
  id v62;
  _QWORD v63[4];
  id v64;
  NSObject *v65;
  _QWORD v66[4];
  id v67;
  id v68;
  _QWORD v69[4];
  id v70;
  id v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v31 = v5;
  v32 = a3;
  if (!v5)
  {
    v27 = *(NSObject **)(a1 + 32);
    v69[0] = MEMORY[0x1E0C809B0];
    v69[1] = 3221225472;
    v69[2] = __121__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionsForSyncToWatchWithIdentifier_callbackQueue_completionHandler___block_invoke_2;
    v69[3] = &unk_1E1BFF970;
    v28 = v69;
    v71 = *(id *)(a1 + 64);
    v70 = v32;
    dispatch_async(v27, v69);

LABEL_18:
    v26 = (void *)v28[5];
    goto LABEL_15;
  }
  if (!objc_msgSend(v5, "count"))
  {
    v29 = *(NSObject **)(a1 + 32);
    v66[0] = MEMORY[0x1E0C809B0];
    v66[1] = 3221225472;
    v66[2] = __121__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionsForSyncToWatchWithIdentifier_callbackQueue_completionHandler___block_invoke_3;
    v66[3] = &unk_1E1BFF970;
    v28 = v66;
    v68 = *(id *)(a1 + 64);
    v67 = *(id *)(a1 + 40);
    dispatch_async(v29, v66);

    goto LABEL_18;
  }
  objc_msgSend(v5, "_geo_filtered:", &__block_literal_global_61_1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v33, "count"))
  {
    v6 = dispatch_group_create();
    v61[0] = 0;
    v61[1] = v61;
    v61[2] = 0x3032000000;
    v61[3] = __Block_byref_object_copy__88;
    v61[4] = __Block_byref_object_dispose__88;
    v62 = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v33, "count"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v33, "count"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    obj = v33;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v72, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v58 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
          dispatch_group_enter(v6);
          objc_msgSend(*(id *)(a1 + 48), "delegate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = *(_QWORD *)(a1 + 48);
          objc_msgSend(v10, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = *(_QWORD *)(a1 + 32);
          v51[0] = MEMORY[0x1E0C809B0];
          v51[1] = 3221225472;
          v51[2] = __121__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionsForSyncToWatchWithIdentifier_callbackQueue_completionHandler___block_invoke_6;
          v51[3] = &unk_1E1C15508;
          v56 = v61;
          v52 = v36;
          v53 = v10;
          v54 = v35;
          v55 = v6;
          objc_msgSend(v11, "syncManager:fetchStateForSubscriptionWithIdentifier:callbackQueue:completionHandler:", v12, v13, v14, v51);

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v72, 16);
      }
      while (v7);
    }

    v49[0] = 0;
    v49[1] = v49;
    v49[2] = 0x3032000000;
    v49[3] = __Block_byref_object_copy__88;
    v49[4] = __Block_byref_object_dispose__88;
    v50 = 0;
    if (GEOConfigGetBOOL(MapsFeaturesConfig_StandaloneWatchOffline, (uint64_t)off_1EDF4B158))
    {
      dispatch_group_enter(v6);
      v15 = *(_QWORD *)(a1 + 56);
      v16 = *(void **)(*(_QWORD *)(a1 + 48) + 40);
      v17 = *(_QWORD *)(a1 + 32);
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __121__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionsForSyncToWatchWithIdentifier_callbackQueue_completionHandler___block_invoke_7;
      v46[3] = &unk_1E1C15490;
      v48 = v49;
      v47 = v6;
      objc_msgSend(v16, "fetchAllSubscriptionsToSyncToPairedDevice:queue:callback:", v15, v17, v46);

    }
    +[GEOOfflineDataAccess sharedInstance](GEOOfflineDataAccess, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "offlineTileMetadataWithState:error:", 66050, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = *(void **)(a1 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __121__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionsForSyncToWatchWithIdentifier_callbackQueue_completionHandler___block_invoke_9;
    block[3] = &unk_1E1C15578;
    v38 = v36;
    v39 = v20;
    v44 = *(id *)(a1 + 64);
    v21 = *(id *)(a1 + 40);
    v45 = v49;
    v40 = v21;
    v41 = v35;
    v22 = *(_QWORD *)(a1 + 48);
    v42 = v19;
    v43 = v22;
    v23 = v19;
    v24 = v35;
    v25 = v36;
    dispatch_group_notify(v6, v39, block);

    _Block_object_dispose(v49, 8);
    _Block_object_dispose(v61, 8);

  }
  else
  {
    v30 = *(NSObject **)(a1 + 32);
    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = __121__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionsForSyncToWatchWithIdentifier_callbackQueue_completionHandler___block_invoke_5;
    v63[3] = &unk_1E1BFF970;
    v65 = *(id *)(a1 + 64);
    v64 = *(id *)(a1 + 40);
    dispatch_async(v30, v63);

    v6 = v65;
  }

  v26 = v33;
LABEL_15:

}

uint64_t __121__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionsForSyncToWatchWithIdentifier_callbackQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __121__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionsForSyncToWatchWithIdentifier_callbackQueue_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

unint64_t __121__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionsForSyncToWatchWithIdentifier_callbackQueue_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  return ((unint64_t)objc_msgSend(a2, "dataTypes") >> 10) & 1;
}

uint64_t __121__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionsForSyncToWatchWithIdentifier_callbackQueue_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __121__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionsForSyncToWatchWithIdentifier_callbackQueue_completionHandler___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (v10)
  {
    if ((unint64_t)(objc_msgSend(v10, "loadState") - 1) <= 2)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
      v6 = *(void **)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v10, v7);
LABEL_6:

    }
  }
  else
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    if (!*(_QWORD *)(v8 + 40))
    {
      v9 = v5;
      v7 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v9;
      goto LABEL_6;
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

void __121__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionsForSyncToWatchWithIdentifier_callbackQueue_completionHandler___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "_geo_map:", &__block_literal_global_62);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __121__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionsForSyncToWatchWithIdentifier_callbackQueue_completionHandler___block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

void __121__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionsForSyncToWatchWithIdentifier_callbackQueue_completionHandler___block_invoke_9(uint64_t a1)
{
  void *v2;
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  GEOPBCompanionSubscription *(*v11)(uint64_t, void *);
  void *v12;
  _QWORD v13[2];
  _QWORD block[4];
  id v15;
  id v16;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "sortUsingComparator:", &__block_literal_global_65);
    v2 = *(void **)(a1 + 32);
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __121__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionsForSyncToWatchWithIdentifier_callbackQueue_completionHandler___block_invoke_12;
    v12 = &unk_1E1C15550;
    v13[1] = *(_QWORD *)(a1 + 88);
    v3 = (id *)v13;
    v13[0] = *(id *)(a1 + 56);
    objc_msgSend(v2, "_geo_map:", &v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy", v9, v10, v11, v12);
    objc_msgSend(*(id *)(a1 + 48), "setLoadedSubscriptions:", v5);

    objc_msgSend(*(id *)(a1 + 48), "setOfflineTileMetadata:", *(_QWORD *)(a1 + 64));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 72) + 48), "lastUpdatedDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "timeIntervalSinceReferenceDate");
      objc_msgSend(*(id *)(a1 + 48), "setOfflineLastUpdatedTimestamp:");
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();

  }
  else
  {
    v8 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __121__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionsForSyncToWatchWithIdentifier_callbackQueue_completionHandler___block_invoke_10;
    block[3] = &unk_1E1BFF970;
    v3 = &v16;
    v16 = *(id *)(a1 + 80);
    v15 = *(id *)(a1 + 48);
    dispatch_async(v8, block);
    v4 = v15;
  }

}

uint64_t __121__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionsForSyncToWatchWithIdentifier_callbackQueue_completionHandler___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __121__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionsForSyncToWatchWithIdentifier_callbackQueue_completionHandler___block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

GEOPBCompanionSubscription *__121__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionsForSyncToWatchWithIdentifier_callbackQueue_completionHandler___block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  GEOPBCompanionSubscription *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a2;
  v4 = objc_alloc_init(GEOPBCompanionSubscription);
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPBCompanionSubscription setIdentifier:](v4, "setIdentifier:", v5);

  objc_msgSend(v3, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPBCompanionSubscription setDisplayName:](v4, "setDisplayName:", v6);

  objc_msgSend(v3, "region");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPBCompanionSubscription setRegion:](v4, "setRegion:", v7);

  -[GEOPBCompanionSubscription setDataType:](v4, "setDataType:", objc_msgSend(v3, "dataTypes"));
  -[GEOPBCompanionSubscription setPolicy:](v4, "setPolicy:", objc_msgSend(v3, "policy"));
  objc_msgSend(v3, "_originatingBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPBCompanionSubscription setOriginatingBundleIdentifier:](v4, "setOriginatingBundleIdentifier:", v8);

  v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(v3, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPBCompanionSubscription setSyncToWatch:](v4, "setSyncToWatch:", objc_msgSend(v9, "containsObject:", v10));

  v11 = *(void **)(a1 + 32);
  objc_msgSend(v3, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    -[GEOPBCompanionSubscription setDownloadedDataBytes:](v4, "setDownloadedDataBytes:", objc_msgSend(v13, "downloadedDataSize"));

  return v4;
}

- (void)setSubscriptionWithIdentifier:(id)a3 shouldSyncToPairedDevice:(BOOL)a4 callbackQueue:(id)a5 completionHandler:(id)a6
{
  _BOOL8 v8;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  uint64_t *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if ((GEOConfigGetBOOL(MapsFeaturesConfig_StandaloneWatchOffline, (uint64_t)off_1EDF4B158) & 1) != 0)
  {
    -[GEOTileDB setSubscriptionWithIdentifier:shouldSync:toPairedDevice:](self->_db, "setSubscriptionWithIdentifier:shouldSync:toPairedDevice:", v10, v8, 0);
    -[GEOMapDataSubscriptionLocalSyncManager _synchronizedSubscriptionsDidChange]((uint64_t)self);
    v16 = MEMORY[0x1E0C809B0];
    v13 = __129__GEOMapDataSubscriptionLocalSyncManager_setSubscriptionWithIdentifier_shouldSyncToPairedDevice_callbackQueue_completionHandler___block_invoke_2;
    v14 = &v16;
  }
  else
  {
    v17 = MEMORY[0x1E0C809B0];
    v13 = __129__GEOMapDataSubscriptionLocalSyncManager_setSubscriptionWithIdentifier_shouldSyncToPairedDevice_callbackQueue_completionHandler___block_invoke;
    v14 = &v17;
  }
  v14[1] = 3221225472;
  v14[2] = (uint64_t)v13;
  v14[3] = (uint64_t)&unk_1E1C01F48;
  v14[4] = (uint64_t)v12;
  v15 = v12;
  dispatch_async(v11, v14);

}

void __129__GEOMapDataSubscriptionLocalSyncManager_setSubscriptionWithIdentifier_shouldSyncToPairedDevice_callbackQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -6);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

uint64_t __129__GEOMapDataSubscriptionLocalSyncManager_setSubscriptionWithIdentifier_shouldSyncToPairedDevice_callbackQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchSubscriptionIdentifiersToSyncToPairedDeviceWithQueue:(id)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  GEOTileDB *db;
  id *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD block[4];
  id v15;

  v6 = a4;
  v7 = a3;
  if ((GEOConfigGetBOOL(MapsFeaturesConfig_StandaloneWatchOffline, (uint64_t)off_1EDF4B158) & 1) != 0)
  {
    db = self->_db;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __118__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionIdentifiersToSyncToPairedDeviceWithQueue_completionHandler___block_invoke_2;
    v12[3] = &unk_1E1C021B8;
    v9 = &v13;
    v13 = v6;
    v10 = v6;
    -[GEOTileDB fetchAllSubscriptionsToSyncToPairedDevice:queue:callback:](db, "fetchAllSubscriptionsToSyncToPairedDevice:queue:callback:", 0, v7, v12);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __118__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionIdentifiersToSyncToPairedDeviceWithQueue_completionHandler___block_invoke;
    block[3] = &unk_1E1C01F48;
    v9 = &v15;
    v15 = v6;
    v11 = v6;
    dispatch_async(v7, block);
  }

}

void __118__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionIdentifiersToSyncToPairedDeviceWithQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -6);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __118__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionIdentifiersToSyncToPairedDeviceWithQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  if (a2)
  {
    objc_msgSend(a2, "_geo_map:", &__block_literal_global_67);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

uint64_t __118__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionIdentifiersToSyncToPairedDeviceWithQueue_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (void)startDownloadForPairedDeviceSubscriptionIdentifiers:(id)a3 mode:(unint64_t)a4
{
  id v6;
  void *v7;
  uint64_t UInteger;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  GEOPairedDeviceSubscriptionStartStopDownloadRequest *v13;

  v6 = a3;
  v13 = objc_alloc_init(GEOPairedDeviceSubscriptionStartStopDownloadRequest);
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  -[GEOPairedDeviceSubscriptionStartStopDownloadRequest setIdentifiers:](v13, "setIdentifiers:", v7);
  -[GEOPairedDeviceSubscriptionStartStopDownloadRequest setShouldDownload:](v13, "setShouldDownload:", 1);
  -[GEOPairedDeviceSubscriptionStartStopDownloadRequest setMode:](v13, "setMode:", a4);
  UInteger = GEOConfigGetUInteger(GeoOfflineConfig_SubscriptionIDSMessagesMode, (uint64_t)off_1EDF4ECA8);
  switch(UInteger)
  {
    case 2:
      +[GEOPairedDeviceConnection sharedInstance](GEOPairedDeviceConnection, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "sendStartStopSubscriptionDownload:", v13);
      goto LABEL_7;
    case 1:
LABEL_5:
      -[GEOMapDataSubscriptionLocalSyncManager _pairedDeviceDaemonConnection]((uint64_t)self);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "remoteObjectProxy");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPairedDeviceSubscriptionStartStopDownloadRequest data](v13, "data");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "startOrStopDownloadForSubscriptionIdentifiers:", v12);

LABEL_7:
      break;
    case 0:
      +[GEOPairedDeviceConnection sharedInstance](GEOPairedDeviceConnection, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sendStartStopSubscriptionDownload:", v13);

      goto LABEL_5;
  }

}

- (void)cancelDownloadForPairedDeviceSubscriptionIdentifiers:(id)a3
{
  id v4;
  void *v5;
  uint64_t UInteger;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  GEOPairedDeviceSubscriptionStartStopDownloadRequest *v11;

  v4 = a3;
  v11 = objc_alloc_init(GEOPairedDeviceSubscriptionStartStopDownloadRequest);
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[GEOPairedDeviceSubscriptionStartStopDownloadRequest setIdentifiers:](v11, "setIdentifiers:", v5);
  -[GEOPairedDeviceSubscriptionStartStopDownloadRequest setShouldDownload:](v11, "setShouldDownload:", 0);
  UInteger = GEOConfigGetUInteger(GeoOfflineConfig_SubscriptionIDSMessagesMode, (uint64_t)off_1EDF4ECA8);
  switch(UInteger)
  {
    case 2:
      +[GEOPairedDeviceConnection sharedInstance](GEOPairedDeviceConnection, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sendStartStopSubscriptionDownload:", v11);
      goto LABEL_7;
    case 1:
LABEL_5:
      -[GEOMapDataSubscriptionLocalSyncManager _pairedDeviceDaemonConnection]((uint64_t)self);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "remoteObjectProxy");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPairedDeviceSubscriptionStartStopDownloadRequest data](v11, "data");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "startOrStopDownloadForSubscriptionIdentifiers:", v10);

LABEL_7:
      break;
    case 0:
      +[GEOPairedDeviceConnection sharedInstance](GEOPairedDeviceConnection, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "sendStartStopSubscriptionDownload:", v11);

      goto LABEL_5;
  }

}

- (void)fetchLastUpdatedDateForPairedDeviceOfflineSubscriptionsWithQueue:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __125__GEOMapDataSubscriptionLocalSyncManager_fetchLastUpdatedDateForPairedDeviceOfflineSubscriptionsWithQueue_completionHandler___block_invoke;
  block[3] = &unk_1E1BFFC90;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(workQueue, block);

}

void __125__GEOMapDataSubscriptionLocalSyncManager_fetchLastUpdatedDateForPairedDeviceOfflineSubscriptionsWithQueue_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;

  -[GEOMapDataSubscriptionLocalSyncManager _pairedDeviceSubscriptionStatesSummary](*(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    if (objc_msgSend(v2, "hasLastUpdatedTimestamp"))
    {
      v4 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v3, "lastUpdatedTimestamp");
      objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __125__GEOMapDataSubscriptionLocalSyncManager_fetchLastUpdatedDateForPairedDeviceOfflineSubscriptionsWithQueue_completionHandler___block_invoke_3;
    block[3] = &unk_1E1BFF970;
    v6 = *(NSObject **)(a1 + 40);
    v7 = *(id *)(a1 + 48);
    v11 = v5;
    v12 = v7;
    v8 = v5;
    dispatch_async(v6, block);

  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __125__GEOMapDataSubscriptionLocalSyncManager_fetchLastUpdatedDateForPairedDeviceOfflineSubscriptionsWithQueue_completionHandler___block_invoke_2;
    v13[3] = &unk_1E1C01F48;
    v9 = *(NSObject **)(a1 + 40);
    v14 = *(id *)(a1 + 48);
    dispatch_async(v9, v13);
    v8 = v14;
  }

}

uint64_t __125__GEOMapDataSubscriptionLocalSyncManager_fetchLastUpdatedDateForPairedDeviceOfflineSubscriptionsWithQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __125__GEOMapDataSubscriptionLocalSyncManager_fetchLastUpdatedDateForPairedDeviceOfflineSubscriptionsWithQueue_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (void)fetchAvailableDiskSpaceForPairedDeviceOfflineSubscriptionsWithQueue:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  GEOPairedDeviceGetStorageInfoRequest *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(GEOPairedDeviceGetStorageInfoRequest);
  +[GEOPairedDeviceConnection sharedInstance](GEOPairedDeviceConnection, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __128__GEOMapDataSubscriptionLocalSyncManager_fetchAvailableDiskSpaceForPairedDeviceOfflineSubscriptionsWithQueue_completionHandler___block_invoke;
  v11[3] = &unk_1E1C155C8;
  v12 = v5;
  v13 = v6;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v8, "sendGetStorageInfo:withReply:", v7, v11);

}

void __128__GEOMapDataSubscriptionLocalSyncManager_fetchAvailableDiskSpaceForPairedDeviceOfflineSubscriptionsWithQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __128__GEOMapDataSubscriptionLocalSyncManager_fetchAvailableDiskSpaceForPairedDeviceOfflineSubscriptionsWithQueue_completionHandler___block_invoke_2;
  block[3] = &unk_1E1C01358;
  v7 = *(NSObject **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __128__GEOMapDataSubscriptionLocalSyncManager_fetchAvailableDiskSpaceForPairedDeviceOfflineSubscriptionsWithQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 48);
  if (objc_msgSend(*(id *)(a1 + 32), "hasAvailableStorageBytesOfflineMaps"))
    v3 = objc_msgSend(*(id *)(a1 + 32), "availableStorageBytesOfflineMaps");
  else
    v3 = -1;
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(a1 + 40));
}

- (void)setSerializedPairedDeviceSubscriptionsSummary:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  NSObject *v8;
  id v9;
  id v10;
  GEOPairedDeviceSubscriptionStatesSummary *v11;
  _QWORD block[4];
  id v13;
  uint8_t buf[16];

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = -[GEOPairedDeviceSubscriptionStatesSummary initWithData:]([GEOPairedDeviceSubscriptionStatesSummary alloc], "initWithData:", v10);

  if (v11)
  {
    -[GEOMapDataSubscriptionLocalSyncManager setPairedDeviceSubscriptionsSummary:callbackQueue:completionHandler:](self, "setPairedDeviceSubscriptionsSummary:callbackQueue:completionHandler:", v11, v8, v9);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: summary", buf, 2u);
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __120__GEOMapDataSubscriptionLocalSyncManager_setSerializedPairedDeviceSubscriptionsSummary_callbackQueue_completionHandler___block_invoke;
    block[3] = &unk_1E1C01F48;
    v13 = v9;
    dispatch_async(v8, block);

  }
}

void __120__GEOMapDataSubscriptionLocalSyncManager_setSerializedPairedDeviceSubscriptionsSummary_callbackQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -12, CFSTR("Invalid serialized summary data"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)setPairedDeviceSubscriptionsSummary:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *workQueue;
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
  workQueue = self->_workQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __110__GEOMapDataSubscriptionLocalSyncManager_setPairedDeviceSubscriptionsSummary_callbackQueue_completionHandler___block_invoke;
  v15[3] = &unk_1E1C01268;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(workQueue, v15);

}

void __110__GEOMapDataSubscriptionLocalSyncManager_setPairedDeviceSubscriptionsSummary_callbackQueue_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  NSObject *v19;
  id *v20;
  NSObject *v21;
  id v22;
  id *v23;
  id v24;
  _QWORD *v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  _QWORD block[4];
  id v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t);
  void *v42;
  uint64_t v43;
  id v44;
  id v45;
  uint8_t *v46;
  uint64_t *v47;
  uint8_t buf[8];
  uint8_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  char v57;
  uint8_t v58[4];
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  GEOGetSubscriptionsLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_DEBUG, "[PairedDevice] Received new subscription state summary", buf, 2u);
  }

  v54 = 0;
  v55 = &v54;
  v56 = 0x2020000000;
  v57 = 0;
  -[GEOMapDataSubscriptionLocalSyncManager _pairedDeviceSubscriptionStatesSummary](*(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  v49 = buf;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__88;
  v52 = __Block_byref_object_dispose__88;
  v53 = 0;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = MEMORY[0x1E0C809B0];
  v39 = MEMORY[0x1E0C809B0];
  v40 = 3221225472;
  v41 = __110__GEOMapDataSubscriptionLocalSyncManager_setPairedDeviceSubscriptionsSummary_callbackQueue_completionHandler___block_invoke_73;
  v42 = &unk_1E1C155F0;
  v46 = buf;
  v43 = v4;
  v6 = v3;
  v44 = v6;
  v47 = &v54;
  v45 = *(id *)(a1 + 40);
  geo_isolate_sync_data();
  if (!*((_QWORD *)v49 + 5))
  {
    v37[0] = v5;
    v37[1] = 3221225472;
    v37[2] = __110__GEOMapDataSubscriptionLocalSyncManager_setPairedDeviceSubscriptionsSummary_callbackQueue_completionHandler___block_invoke_2;
    v37[3] = &unk_1E1C01F48;
    v28 = *(NSObject **)(a1 + 48);
    v38 = *(id *)(a1 + 56);
    dispatch_async(v28, v37);
    v7 = v38;
    goto LABEL_18;
  }
  +[GEOPairedDeviceFilePaths urlFor:forDevice:](GEOPairedDeviceFilePaths, "urlFor:forDevice:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByDeletingLastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "fileExistsAtPath:", v10);

  if ((v11 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    v13 = objc_msgSend(v12, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v36);
    v14 = v36;

    if ((v13 & 1) == 0)
    {
      GEOGetSubscriptionsLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)v58 = 138543362;
        v59 = v14;
        _os_log_impl(&dword_1885A9000, v26, OS_LOG_TYPE_FAULT, "[PairedDevice] Failed to create directory for paired device subscriptions state summary: %{public}@", v58, 0xCu);
      }

      block[0] = v5;
      block[1] = 3221225472;
      block[2] = __110__GEOMapDataSubscriptionLocalSyncManager_setPairedDeviceSubscriptionsSummary_callbackQueue_completionHandler___block_invoke_78;
      block[3] = &unk_1E1BFF970;
      v20 = &v35;
      v21 = *(NSObject **)(a1 + 48);
      v27 = *(id *)(a1 + 56);
      v23 = &v34;
      v34 = v14;
      v35 = v27;
      v24 = v14;
      v25 = block;
      goto LABEL_17;
    }

  }
  objc_msgSend(*(id *)(a1 + 40), "data");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOPairedDeviceFilePaths urlFor:forDevice:](GEOPairedDeviceFilePaths, "urlFor:forDevice:", 1, *((_QWORD *)v49 + 5));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v17 = objc_msgSend(v15, "writeToURL:options:error:", v16, 1073741825, &v32);
  v18 = v32;

  if ((v17 & 1) == 0)
  {
    GEOGetSubscriptionsLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v58 = 138543362;
      v59 = v18;
      _os_log_impl(&dword_1885A9000, v19, OS_LOG_TYPE_FAULT, "[PairedDevice] Failed to write paired device subscriptions state summary: %{public}@", v58, 0xCu);
    }

  }
  if (*((_BYTE *)v55 + 24))
    notify_post(GEOMapDataSubscriptionManagerPairedDeviceOfflineLastUpdatedDateDidChangeDarwinNotification);
  v29[0] = v5;
  v29[1] = 3221225472;
  v29[2] = __110__GEOMapDataSubscriptionLocalSyncManager_setPairedDeviceSubscriptionsSummary_callbackQueue_completionHandler___block_invoke_79;
  v29[3] = &unk_1E1BFF970;
  v20 = &v31;
  v21 = *(NSObject **)(a1 + 48);
  v22 = *(id *)(a1 + 56);
  v23 = &v30;
  v30 = v18;
  v31 = v22;
  v24 = v18;
  v25 = v29;
LABEL_17:
  dispatch_async(v21, v25);

LABEL_18:
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v54, 8);
}

void __110__GEOMapDataSubscriptionLocalSyncManager_setPairedDeviceSubscriptionsSummary_callbackQueue_completionHandler___block_invoke_73(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  char v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 88));
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    objc_msgSend(v2, "lastUpdatedTimestamp");
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 48), "lastUpdatedTimestamp");
    v6 = vabdd_f64(v4, v5) >= 0.00000011920929;
  }
  else
  {
    v6 = objc_msgSend(*(id *)(a1 + 48), "hasLastUpdatedTimestamp");
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v6;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 104), *(id *)(a1 + 48));
}

void __110__GEOMapDataSubscriptionLocalSyncManager_setPairedDeviceSubscriptionsSummary_callbackQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -13, CFSTR("No supported active device"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

uint64_t __110__GEOMapDataSubscriptionLocalSyncManager_setPairedDeviceSubscriptionsSummary_callbackQueue_completionHandler___block_invoke_78(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __110__GEOMapDataSubscriptionLocalSyncManager_setPairedDeviceSubscriptionsSummary_callbackQueue_completionHandler___block_invoke_79(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __80__GEOMapDataSubscriptionLocalSyncManager__pairedDeviceSubscriptionStatesSummary__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  GEOPairedDeviceSubscriptionStatesSummary *v6;
  uint64_t v7;
  void *v8;
  GEOPairedDeviceSubscriptionStatesSummary *v9;
  uint64_t v10;
  void *v11;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 104);
  if (!v3)
  {
    if (*(_QWORD *)(v2 + 88))
    {
      +[GEOPairedDeviceFilePaths urlFor:forDevice:](GEOPairedDeviceFilePaths, "urlFor:forDevice:", 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[GEOPairedDeviceSubscriptionStatesSummary initWithData:]([GEOPairedDeviceSubscriptionStatesSummary alloc], "initWithData:", v5);
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(v7 + 104);
      *(_QWORD *)(v7 + 104) = v6;

      if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104))
      {
        v9 = objc_alloc_init(GEOPairedDeviceSubscriptionStatesSummary);
        v10 = *(_QWORD *)(a1 + 32);
        v11 = *(void **)(v10 + 104);
        *(_QWORD *)(v10 + 104) = v9;

      }
      v3 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
    }
    else
    {
      v3 = 0;
    }
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
}

- (void)fetchSerializedPairedDeviceSubscriptionsSummaryWithCallbackQueue:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __125__GEOMapDataSubscriptionLocalSyncManager_fetchSerializedPairedDeviceSubscriptionsSummaryWithCallbackQueue_completionHandler___block_invoke;
  v8[3] = &unk_1E1BFF970;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  dispatch_async((dispatch_queue_t)a3, v8);

}

void __125__GEOMapDataSubscriptionLocalSyncManager_fetchSerializedPairedDeviceSubscriptionsSummaryWithCallbackQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  -[GEOMapDataSubscriptionLocalSyncManager _pairedDeviceSubscriptionStatesSummary](*(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v1 + 16))(v1, v2, 0);

}

- (void)fetchStateForPairedDeviceSubscriptionWithIdentifier:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  id *v14;
  _QWORD v15[4];
  id v16;
  GEOMapDataSubscriptionLocalSyncManager *v17;
  NSObject *v18;
  id v19;
  _QWORD block[4];
  _QWORD v21[7];
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__88;
  v28 = __Block_byref_object_dispose__88;
  v29 = 0;
  v11 = MEMORY[0x1E0C809B0];
  v21[2] = MEMORY[0x1E0C809B0];
  v21[3] = 3221225472;
  v21[4] = __126__GEOMapDataSubscriptionLocalSyncManager_fetchStateForPairedDeviceSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke;
  v21[5] = &unk_1E1C041E8;
  v23 = &v24;
  v21[6] = self;
  v12 = v8;
  v22 = v12;
  geo_isolate_sync_data();
  if (v25[5])
  {
    GEOGetSubscriptionsLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 141558275;
      v31 = 1752392040;
      v32 = 2113;
      v33 = v12;
      _os_log_impl(&dword_1885A9000, v13, OS_LOG_TYPE_DEBUG, "[PairedDevice] Returning cached state for currently-observed subscription '%{private, mask.hash}@'", buf, 0x16u);
    }

    block[0] = v11;
    block[1] = 3221225472;
    block[2] = __126__GEOMapDataSubscriptionLocalSyncManager_fetchStateForPairedDeviceSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke_80;
    block[3] = &unk_1E1C03F50;
    v14 = (id *)v21;
    v21[0] = v10;
    v21[1] = &v24;
    dispatch_async(v9, block);
  }
  else
  {
    v15[0] = v11;
    v15[1] = 3221225472;
    v15[2] = __126__GEOMapDataSubscriptionLocalSyncManager_fetchStateForPairedDeviceSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke_2;
    v15[3] = &unk_1E1C03FA0;
    v19 = v10;
    v16 = v12;
    v17 = self;
    v18 = v9;
    -[GEOMapDataSubscriptionLocalSyncManager fetchSubscriptionIdentifiersToSyncToPairedDeviceWithQueue:completionHandler:](self, "fetchSubscriptionIdentifiersToSyncToPairedDeviceWithQueue:completionHandler:", v18, v15);

    v14 = &v19;
  }

  _Block_object_dispose(&v24, 8);
}

void __126__GEOMapDataSubscriptionLocalSyncManager_fetchStateForPairedDeviceSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 64), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __126__GEOMapDataSubscriptionLocalSyncManager_fetchStateForPairedDeviceSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke_80(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 0);
}

void __126__GEOMapDataSubscriptionLocalSyncManager_fetchStateForPairedDeviceSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  GEOMapDataSubscriptionState *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  char v17;
  NSObject *v18;
  id v19;
  GEOMapDataSubscriptionState *v20;
  _QWORD v21[4];
  GEOMapDataSubscriptionState *v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    GEOGetSubscriptionsLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v25 = (uint64_t)v6;
      _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_ERROR, "[PairedDevice] Error fetching list of synced subscription identifiers. Failing to return state: %{public}@", buf, 0xCu);
    }
    goto LABEL_13;
  }
  if ((objc_msgSend(v5, "containsObject:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    GEOGetSubscriptionsLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v15 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 141558275;
      v25 = 1752392040;
      v26 = 2113;
      v27 = v15;
      _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_DEBUG, "[PairedDevice] Subscription '%{private, mask.hash}@' is not in the list of synced subscriptions. Returning null state", buf, 0x16u);
    }
LABEL_13:

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    goto LABEL_18;
  }
  v7 = objc_alloc_init(GEOMapDataSubscriptionState);
  -[GEOMapDataSubscriptionLocalSyncManager _pairedDeviceSubscriptionStatesSummary](*(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subscriptionStatesForKey:", *(_QWORD *)(a1 + 32));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && objc_msgSend(v9, "fullyDownloaded"))
  {
    v11 = objc_msgSend(v8, "isUpdateAvailable");
    v12 = 0;
    if (v11)
      v13 = 1;
    else
      v13 = 2;
  }
  else
  {
    +[GEOPairedDeviceConnection sharedInstance](GEOPairedDeviceConnection, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isConnected");

    if ((v17 & 1) == 0)
      objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1E1E81628, CFSTR("GEOMapDataSubscriptionStateWaitingReasonKey"));
    v13 = 0;
    v12 = 5;
  }
  -[GEOMapDataSubscriptionState _setLoadState:downloadState:downloadProgress:lastError:downloadedDataCount:downloadedDataSize:userInfo:]((uint64_t)v7, v13, v12, 0, 0, 0, 0, v10);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __126__GEOMapDataSubscriptionLocalSyncManager_fetchStateForPairedDeviceSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke_83;
  v21[3] = &unk_1E1BFF970;
  v18 = *(NSObject **)(a1 + 48);
  v19 = *(id *)(a1 + 56);
  v22 = v7;
  v23 = v19;
  v20 = v7;
  dispatch_async(v18, v21);

LABEL_18:
}

uint64_t __126__GEOMapDataSubscriptionLocalSyncManager_fetchStateForPairedDeviceSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke_83(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (void)beginMonitoringStateForPairedDeviceSubscriptionWithIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4 = a3;
  geo_isolate_sync_data();
  if (*((_BYTE *)v6 + 24))
    -[GEOMapDataSubscriptionLocalSyncManager _updateObservedStateSubscriptionIdentifiersForPairedDevice]((uint64_t)self);

  _Block_object_dispose(&v5, 8);
}

uint64_t __104__GEOMapDataSubscriptionLocalSyncManager_beginMonitoringStateForPairedDeviceSubscriptionWithIdentifier___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 56), "containsObject:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result ^ 1;
  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
    return objc_msgSend(*(id *)(a1[4] + 56), "addObject:", a1[5]);
  return result;
}

- (void)endMonitoringStateForPairedDeviceSubscriptionWithIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4 = a3;
  geo_isolate_sync_data();
  if (*((_BYTE *)v6 + 24))
    -[GEOMapDataSubscriptionLocalSyncManager _updateObservedStateSubscriptionIdentifiersForPairedDevice]((uint64_t)self);

  _Block_object_dispose(&v5, 8);
}

uint64_t __102__GEOMapDataSubscriptionLocalSyncManager_endMonitoringStateForPairedDeviceSubscriptionWithIdentifier___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 56), "containsObject:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    objc_msgSend(*(id *)(a1[4] + 56), "removeObject:", a1[5]);
    return objc_msgSend(*(id *)(a1[4] + 64), "removeObjectForKey:", a1[5]);
  }
  return result;
}

void __100__GEOMapDataSubscriptionLocalSyncManager__updateObservedStateSubscriptionIdentifiersForPairedDevice__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)fetchSerializedPairedDeviceSubscriptionIdentifiersToObserveWithCallbackQueue:(id)a3 completionHandler:(id)a4
{
  NSObject *v6;
  id v7;
  uint64_t v8;
  GEOPairedDeviceSubscriptionStateSynchronizationRequest *v9;
  void *v10;
  GEOPairedDeviceSubscriptionStateSynchronizationRequest *v11;
  id v12;
  _QWORD v13[4];
  GEOPairedDeviceSubscriptionStateSynchronizationRequest *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  GEOMapDataSubscriptionLocalSyncManager *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  v7 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__88;
  v26 = __Block_byref_object_dispose__88;
  v27 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __137__GEOMapDataSubscriptionLocalSyncManager_fetchSerializedPairedDeviceSubscriptionIdentifiersToObserveWithCallbackQueue_completionHandler___block_invoke;
  v19 = &unk_1E1C00760;
  v20 = self;
  v21 = &v22;
  geo_isolate_sync_data();
  v9 = objc_alloc_init(GEOPairedDeviceSubscriptionStateSynchronizationRequest);
  v10 = (void *)objc_msgSend((id)v23[5], "mutableCopy");
  -[GEOPairedDeviceSubscriptionStateSynchronizationRequest setIdentifiersToObserves:](v9, "setIdentifiersToObserves:", v10);

  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __137__GEOMapDataSubscriptionLocalSyncManager_fetchSerializedPairedDeviceSubscriptionIdentifiersToObserveWithCallbackQueue_completionHandler___block_invoke_2;
  v13[3] = &unk_1E1BFF970;
  v14 = v9;
  v15 = v7;
  v11 = v9;
  v12 = v7;
  dispatch_async(v6, v13);

  _Block_object_dispose(&v22, 8);
}

void __137__GEOMapDataSubscriptionLocalSyncManager_fetchSerializedPairedDeviceSubscriptionIdentifiersToObserveWithCallbackQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __137__GEOMapDataSubscriptionLocalSyncManager_fetchSerializedPairedDeviceSubscriptionIdentifiersToObserveWithCallbackQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "data");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

- (void)handleSerializedPairedDeviceStateUpdate:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  GEOPairedDeviceSubscriptionStateUpdate *v11;
  _QWORD v12[4];
  id v13;
  _QWORD block[4];
  GEOPairedDeviceSubscriptionStateUpdate *v15;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    v11 = -[GEOPairedDeviceSubscriptionStateUpdate initWithData:]([GEOPairedDeviceSubscriptionStateUpdate alloc], "initWithData:", v8);
    if (v11)
    {
      -[GEOMapDataSubscriptionLocalSyncManager handlePairedDeviceStateUpdate:callbackQueue:completionHandler:](self, "handlePairedDeviceStateUpdate:callbackQueue:completionHandler:", v11, v9, v10);
    }
    else
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __114__GEOMapDataSubscriptionLocalSyncManager_handleSerializedPairedDeviceStateUpdate_callbackQueue_completionHandler___block_invoke_2;
      v12[3] = &unk_1E1C01F48;
      v13 = v10;
      dispatch_async(v9, v12);

    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: serializedUpdate != ((void *)0)", buf, 2u);
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __114__GEOMapDataSubscriptionLocalSyncManager_handleSerializedPairedDeviceStateUpdate_callbackQueue_completionHandler___block_invoke;
    block[3] = &unk_1E1C01F48;
    v15 = (GEOPairedDeviceSubscriptionStateUpdate *)v10;
    dispatch_async(v9, block);
    v11 = v15;
  }

}

void __114__GEOMapDataSubscriptionLocalSyncManager_handleSerializedPairedDeviceStateUpdate_callbackQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -10);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __114__GEOMapDataSubscriptionLocalSyncManager_handleSerializedPairedDeviceStateUpdate_callbackQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -10);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)handlePairedDeviceStateUpdate:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "identifier");
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__88;
  v18 = __Block_byref_object_dispose__88;
  v19 = 0;
  v11 = (id)objc_claimAutoreleasedReturnValue();
  geo_isolate_sync();
  v12 = v15[5];
  if (v12)
  {
    -[GEOMapDataSubscriptionState _updateWithPairedDeviceState:](v12, v8);
    -[GEOMapDataSubscriptionLocalSyncManager delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "syncManager:didUpdatePairedDeviceState:forIdentifier:", self, v15[5], v11);

  }
  else
  {
    -[GEOMapDataSubscriptionLocalSyncManager _updateObservedStateSubscriptionIdentifiersForPairedDevice]((uint64_t)self);
  }

  _Block_object_dispose(&v14, 8);
}

void __104__GEOMapDataSubscriptionLocalSyncManager_handlePairedDeviceStateUpdate_callbackQueue_completionHandler___block_invoke(_QWORD *a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  GEOMapDataSubscriptionState *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1[4] + 56), "containsObject:", a1[5]);
  GEOGetSubscriptionsLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4)
    {
      v5 = a1[5];
      v13 = 141558275;
      v14 = 1752392040;
      v15 = 2113;
      v16 = v5;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "[PairedDevice] Received state update for subscription '%{private, mask.hash}@'", (uint8_t *)&v13, 0x16u);
    }

    objc_msgSend(*(id *)(a1[4] + 64), "objectForKeyedSubscript:", a1[5]);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1[6] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
    {
      v9 = objc_alloc_init(GEOMapDataSubscriptionState);
      v10 = *(_QWORD *)(a1[6] + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

      objc_msgSend(*(id *)(a1[4] + 64), "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), a1[5]);
    }
  }
  else
  {
    if (v4)
    {
      v12 = a1[5];
      v13 = 141558275;
      v14 = 1752392040;
      v15 = 2113;
      v16 = v12;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "[PairedDevice] Received state update for non-observed subscription '%{private, mask.hash}@'", (uint8_t *)&v13, 0x16u);
    }

  }
}

- (GEOMapDataSubscriptionPersistence)persistence
{
  return (GEOMapDataSubscriptionPersistence *)objc_loadWeakRetained((id *)&self->_persistence);
}

- (GEOMapDataSubscriptionSyncManagerDelegate)delegate
{
  return (GEOMapDataSubscriptionSyncManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedDeviceDaemonConnection, 0);
  objc_storeStrong((id *)&self->_subscriptionsSummary, 0);
  objc_storeStrong(&self->_featureFlagObserver, 0);
  objc_storeStrong((id *)&self->_activeDevice, 0);
  objc_storeStrong((id *)&self->_initialNanoRegistryFetchGroup, 0);
  objc_storeStrong((id *)&self->_observedStates, 0);
  objc_storeStrong((id *)&self->_observedIdentifiers, 0);
  objc_storeStrong((id *)&self->_offlineDataConfiguration, 0);
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_isolation, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_persistence);
}

@end
