@implementation GEOOfflineDataAccess

+ (void)_setSharedInstanceUseLocalPersistence:(BOOL)a3
{
  _MergedGlobals_288 = a3;
}

+ (id)sharedInstance
{
  if (qword_1ECDBC608 != -1)
    dispatch_once(&qword_1ECDBC608, &__block_literal_global_150);
  return (id)qword_1ECDBC610;
}

void __38__GEOOfflineDataAccess_sharedInstance__block_invoke()
{
  void *v0;
  GEOOfflineLocalDataAccess *v1;
  void *v2;
  GEOOfflineRemoteDataAccess *v3;
  GEOOfflineDataAccess *v4;
  void *v5;
  uint8_t v6[16];

  if (_MergedGlobals_288)
  {
    _GEOGetSharedTileDB();
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: diskCache != nil", v6, 2u);
    }
    v1 = [GEOOfflineLocalDataAccess alloc];
    +[GEOOfflineDataConfiguration sharedConfiguration](GEOOfflineDataConfiguration, "sharedConfiguration");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[GEOOfflineLocalDataAccess initWithDiskCache:configuration:](v1, "initWithDiskCache:configuration:", v0, v2);

  }
  else
  {
    v3 = objc_alloc_init(GEOOfflineRemoteDataAccess);
  }
  v4 = -[GEOOfflineDataAccess initWithAccessor:]([GEOOfflineDataAccess alloc], "initWithAccessor:", v3);
  v5 = (void *)qword_1ECDBC610;
  qword_1ECDBC610 = (uint64_t)v4;

}

- (GEOOfflineDataAccess)initWithAccessor:(id)a3
{
  id v5;
  GEOOfflineDataAccess *v6;
  GEOOfflineDataAccess *v7;
  uint64_t v8;
  geo_isolater *isolation;
  const char *v10;
  NSObject *global_queue;
  GEOOfflineDataAccess *v12;
  _QWORD v14[4];
  id v15;
  id location;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)GEOOfflineDataAccess;
  v6 = -[GEOOfflineDataAccess init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accessor, a3);
    v8 = geo_isolater_create();
    isolation = v7->_isolation;
    v7->_isolation = (geo_isolater *)v8;

    objc_initWeak(&location, v7);
    v10 = GEOMapDataSubscriptionManagerFullyDownloadedSubscriptionsDidChangeDarwinNotification;
    global_queue = geo_get_global_queue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __41__GEOOfflineDataAccess_initWithAccessor___block_invoke;
    v14[3] = &unk_1E1C05280;
    objc_copyWeak(&v15, &location);
    notify_register_dispatch(v10, &v7->_fullyDownloadedSubscriptionsChangedToken, global_queue, v14);

    v12 = v7;
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __41__GEOOfflineDataAccess_initWithAccessor___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_resetFullyDownloadedRegions");

}

- (void)dealloc
{
  int fullyDownloadedSubscriptionsChangedToken;
  objc_super v4;

  fullyDownloadedSubscriptionsChangedToken = self->_fullyDownloadedSubscriptionsChangedToken;
  if (fullyDownloadedSubscriptionsChangedToken != -1)
  {
    notify_cancel(fullyDownloadedSubscriptionsChangedToken);
    self->_fullyDownloadedSubscriptionsChangedToken = -1;
  }
  v4.receiver = self;
  v4.super_class = (Class)GEOOfflineDataAccess;
  -[GEOOfflineDataAccess dealloc](&v4, sel_dealloc);
}

- (void)getDataForKey:(id)a3 callbackQueue:(id)a4 callback:(id)a5
{
  -[GEOOfflineDataAccessor getDataForKey:callbackQueue:callback:](self->_accessor, "getDataForKey:callbackQueue:callback:", a3, a4, a5);
}

- (id)dataForKey:(id)a3 error:(id *)a4
{
  return (id)-[GEOOfflineDataAccessor dataForKey:error:](self->_accessor, "dataForKey:error:", a3, a4);
}

- (void)hasDataForKey:(id)a3 callbackQueue:(id)a4 callback:(id)a5
{
  -[GEOOfflineDataAccessor hasDataForKey:callbackQueue:callback:](self->_accessor, "hasDataForKey:callbackQueue:callback:", a3, a4, a5);
}

- (BOOL)hasDataForKey:(id)a3 error:(id *)a4
{
  return -[GEOOfflineDataAccessor hasDataForKey:error:](self->_accessor, "hasDataForKey:error:", a3, a4);
}

- (void)getAvailableKeysForLayer:(unsigned int)a3 callbackQueue:(id)a4 callback:(id)a5
{
  -[GEOOfflineDataAccessor getAvailableKeysForLayer:callbackQueue:callback:](self->_accessor, "getAvailableKeysForLayer:callbackQueue:callback:", *(_QWORD *)&a3, a4, a5);
}

- (void)_resetFullyDownloadedRegions
{
  geo_isolate_sync_data();
}

void __52__GEOOfflineDataAccess__resetFullyDownloadedRegions__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 24);
  *(_QWORD *)(v1 + 24) = 0;

}

- (void)getFullyDownloadedRegionsWithCallbackQueue:(id)a3 callback:(id)a4
{
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  NSObject *v11;
  GEOOfflineDataAccess *v12;
  id v13;
  _QWORD block[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  GEOOfflineDataAccess *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v6 = a3;
  v7 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__74;
  v27 = __Block_byref_object_dispose__74;
  v28 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __76__GEOOfflineDataAccess_getFullyDownloadedRegionsWithCallbackQueue_callback___block_invoke;
  v20 = &unk_1E1C00760;
  v21 = self;
  v22 = &v23;
  geo_isolate_sync_data();
  if (v24[5])
  {
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __76__GEOOfflineDataAccess_getFullyDownloadedRegionsWithCallbackQueue_callback___block_invoke_2;
    block[3] = &unk_1E1C03F50;
    v15 = v7;
    v16 = &v23;
    dispatch_async(v6, block);
    v9 = v15;
  }
  else
  {
    +[GEOMapDataSubscriptionManager sharedManager](GEOMapDataSubscriptionManager, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v8;
    v10[1] = 3221225472;
    v10[2] = __76__GEOOfflineDataAccess_getFullyDownloadedRegionsWithCallbackQueue_callback___block_invoke_3;
    v10[3] = &unk_1E1C029A8;
    v11 = v6;
    v12 = self;
    v13 = v7;
    objc_msgSend(v9, "_fetchFullyDownloadedSubscriptionsOfType:includeOutOfDate:callbackQueue:completionHandler:", 1024, 1, v11, v10);

  }
  _Block_object_dispose(&v23, 8);

}

void __76__GEOOfflineDataAccess_getFullyDownloadedRegionsWithCallbackQueue_callback___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

uint64_t __76__GEOOfflineDataAccess_getFullyDownloadedRegionsWithCallbackQueue_callback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 0);
}

void __76__GEOOfflineDataAccess_getFullyDownloadedRegionsWithCallbackQueue_callback___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  _QWORD block[4];
  id v12;
  id v13;

  v5 = a3;
  if (a2)
  {
    objc_msgSend(a2, "_geo_map:", &__block_literal_global_10_1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v10;
    geo_isolate_sync_data();
    (*(void (**)(_QWORD, id, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v6, 0, v7, v8);

  }
  else
  {
    v9 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__GEOOfflineDataAccess_getFullyDownloadedRegionsWithCallbackQueue_callback___block_invoke_4;
    block[3] = &unk_1E1BFF970;
    v13 = *(id *)(a1 + 48);
    v12 = v5;
    dispatch_async(v9, block);

  }
}

uint64_t __76__GEOOfflineDataAccess_getFullyDownloadedRegionsWithCallbackQueue_callback___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __76__GEOOfflineDataAccess_getFullyDownloadedRegionsWithCallbackQueue_callback___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "region");
}

void __76__GEOOfflineDataAccess_getFullyDownloadedRegionsWithCallbackQueue_callback___block_invoke_6(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
}

- (void)getOfflineVersionMetadataWithCallbackQueue:(id)a3 callback:(id)a4
{
  -[GEOOfflineDataAccessor getOfflineVersionMetadataWithCallbackQueue:callback:](self->_accessor, "getOfflineVersionMetadataWithCallbackQueue:callback:", a3, a4);
}

- (id)offlineTileMetadataWithState:(id)a3 error:(id *)a4
{
  return (id)-[GEOOfflineDataAccessor offlineTileMetadataWithState:error:](self->_accessor, "offlineTileMetadataWithState:error:", a3.var0, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullyDownloadedRegions, 0);
  objc_storeStrong((id *)&self->_isolation, 0);
  objc_storeStrong((id *)&self->_accessor, 0);
}

@end
