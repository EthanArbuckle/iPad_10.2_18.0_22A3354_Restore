@implementation GEOResourceManifestManager

- (id)activeTileGroupForCurrentOfflineModeForAuditToken:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  GEOActiveTileGroup *v10;
  void *v11;
  $BD055F43A5DF7FBAA8066526AB28D3ED v12;
  const char *v13;
  NSObject *global_queue;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  GEOResourceManifestManager *v21;
  id v22;
  id location[2];

  location[1] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    +[GEOApplicationAuditToken currentProcessAuditToken](GEOApplicationAuditToken, "currentProcessAuditToken");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  objc_msgSend(v6, "offlineCohortId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[GEOOfflineService activeStateForCohortId:](GEOOfflineService, "activeStateForCohortId:", v8);

  if (v9 < 2u)
  {
LABEL_14:
    -[GEOResourceManifestManager activeTileGroup](self, "activeTileGroup", v17, v18, v19, v20);
    v10 = (GEOActiveTileGroup *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if (v9 != 2)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      LODWORD(location[0]) = 67109120;
      HIDWORD(location[0]) = v9;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", (uint8_t *)location, 8u);
    }
    goto LABEL_14;
  }
  os_unfair_lock_lock_with_options();
  v10 = self->_offlineActiveTileGroup;
  os_unfair_lock_unlock(&self->_activeTileGroupLock);
  if (!v10)
  {
    objc_msgSend(v5, "offlineCohortId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12.var0 = +[GEOOfflineService activeStateForCohortId:](GEOOfflineService, "activeStateForCohortId:", v11);

    -[GEOResourceManifestManager _generateOfflineActiveTileGroup:](self, "_generateOfflineActiveTileGroup:", v12.var0);
    v10 = (GEOActiveTileGroup *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock_with_options();
    objc_storeStrong((id *)&self->_offlineActiveTileGroup, v10);
    if (self->_offlineDataVersionChangeNotifyToken == -1)
    {
      objc_initWeak(location, self);
      v13 = GEOOfflineDataActiveVersionsDidChangeDarwinNotification;
      global_queue = geo_get_global_queue();
      v17 = MEMORY[0x1E0C809B0];
      v18 = 3221225472;
      v19 = __80__GEOResourceManifestManager_activeTileGroupForCurrentOfflineModeForAuditToken___block_invoke;
      v20 = &unk_1E1C0ABD0;
      objc_copyWeak(&v22, location);
      v21 = self;
      notify_register_dispatch(v13, &self->_offlineDataVersionChangeNotifyToken, global_queue, &v17);

      objc_destroyWeak(&v22);
      objc_destroyWeak(location);
    }
    os_unfair_lock_unlock(&self->_activeTileGroupLock);
    if (!v10)
      goto LABEL_14;
  }
LABEL_15:

  return v10;
}

- (GEOActiveTileGroup)activeTileGroup
{
  -[GEOResourceManifestManager _scheduleCachedResourceInfoPurgeTimer]((uint64_t)self);
  return -[GEOResourceManifestManager _loadActiveTileGroupIfNecessary:]((uint64_t)self, 1);
}

- (void)_scheduleCachedResourceInfoPurgeTimer
{
  os_unfair_lock_s *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 96);
    os_unfair_lock_lock_with_options();
    v3 = *(_QWORD *)(a1 + 104);
    os_unfair_lock_unlock(v2);
    if (v3 >= 1)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
      v4 = *(NSObject **)(a1 + 168);
      if (v4)
      {
        dispatch_source_cancel(v4);
        v5 = *(void **)(a1 + 168);
        *(_QWORD *)(a1 + 168) = 0;

      }
      v6 = (id)geo_dispatch_timer_create_on_qos();
      v7 = *(void **)(a1 + 168);
      *(_QWORD *)(a1 + 168) = v6;

      if (*(_QWORD *)(a1 + 168))
        dispatch_activate(v6);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));

    }
  }
}

- (GEOActiveTileGroup)_loadActiveTileGroupIfNecessary:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  GEOActiveTileGroup *v5;
  GEOActiveTileGroup *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;

  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 44);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 44));
    v5 = (GEOActiveTileGroup *)*(id *)(a1 + 24);
    v6 = v5;
    if (*(_BYTE *)(a1 + 72))
      v7 = v5 == 0;
    else
      v7 = 0;
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 8), "activeTileGroup");
      v6 = (GEOActiveTileGroup *)objc_claimAutoreleasedReturnValue();
      GEOActiveTileGroupPath(*(void **)(a1 + 160));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (!v6)
      {
        if (objc_msgSend(v8, "length"))
        {
          v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v9, 1, 0);
          if (v10)
            v6 = -[GEOActiveTileGroup initWithData:]([GEOActiveTileGroup alloc], "initWithData:", v10);
          else
            v6 = 0;

        }
        else
        {
          v6 = 0;
        }
      }
      if (a2)
      {
        objc_storeStrong((id *)(a1 + 24), v6);
        *(_BYTE *)(a1 + 72) = 0;
      }

    }
    os_unfair_lock_unlock(v4);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)allResourceNames
{
  os_unfair_lock_s *p_resourceNamesToPathsLock;
  NSSet *allResourceNames;
  NSSet *v5;

  p_resourceNamesToPathsLock = &self->_resourceNamesToPathsLock;
  os_unfair_lock_lock(&self->_resourceNamesToPathsLock);
  allResourceNames = self->_allResourceNames;
  if (!allResourceNames)
  {
    -[GEOResourceManifestManager _buildResourceNamesToPaths]((uint64_t)self);
    allResourceNames = self->_allResourceNames;
  }
  v5 = allResourceNames;
  os_unfair_lock_unlock(p_resourceNamesToPathsLock);
  -[GEOResourceManifestManager _scheduleCachedResourceInfoPurgeTimer]((uint64_t)self);
  return v5;
}

- (void)removeTileGroupObserver:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  v5 = (void *)-[NSMutableArray copy](self->_tileGroupObservers, "copy");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10);
        v12 = v4;
        v13 = v12;
        if (v11)
        {
          v14 = (void *)MEMORY[0x18D764E2C]();
          os_unfair_lock_lock_with_options();
          objc_msgSend(*(id *)(v11 + 8), "removeObject:", v13);
          os_unfair_lock_unlock((os_unfair_lock_t)(v11 + 16));
          objc_autoreleasePoolPop(v14);

          os_unfair_lock_lock_with_options();
          v15 = objc_msgSend(*(id *)(v11 + 8), "count");
          os_unfair_lock_unlock((os_unfair_lock_t)(v11 + 16));
          if (v15)
            goto LABEL_9;
        }
        else
        {

        }
        -[NSMutableArray removeObject:](self->_tileGroupObservers, "removeObject:", v11);
LABEL_9:
        ++v10;
      }
      while (v8 != v10);
      v16 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v8 = v16;
    }
    while (v16);
  }

  os_unfair_recursive_lock_unlock();
}

- (BOOL)hasLoadedActiveTileGroup
{
  GEOResourceManifestManager *v2;
  os_unfair_lock_s *p_activeTileGroupLock;

  v2 = self;
  p_activeTileGroupLock = &self->_activeTileGroupLock;
  os_unfair_lock_lock(&self->_activeTileGroupLock);
  LOBYTE(v2) = v2->_activeTileGroup != 0;
  os_unfair_lock_unlock(p_activeTileGroupLock);
  return (char)v2;
}

+ (id)modernManagerNoCreate
{
  id v2;

  os_unfair_lock_lock(&stru_1ECDBBED4);
  v2 = (id)qword_1ECDBBEF8;
  os_unfair_lock_unlock(&stru_1ECDBBED4);
  return v2;
}

- (void)addTileGroupObserver:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *tileGroupObservers;
  NSMutableArray *v9;
  NSMutableArray *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  id v17;
  uint64_t v18;
  _GEOResourceManifestTileGroupObserverProxy *v19;
  _GEOResourceManifestTileGroupObserverProxy *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  os_unfair_recursive_lock_lock_with_options();
  tileGroupObservers = self->_tileGroupObservers;
  if (!tileGroupObservers)
  {
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10 = self->_tileGroupObservers;
    self->_tileGroupObservers = v9;

    tileGroupObservers = self->_tileGroupObservers;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = tileGroupObservers;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    while (2)
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD **)(*((_QWORD *)&v21 + 1) + 8 * v15);
        if (v16)
          v17 = (id)v16[3];
        else
          v17 = 0;
        if (v17 == v7)
        {
          v19 = v16;

          if (v16)
            goto LABEL_20;
          goto LABEL_17;
        }
        ++v15;
      }
      while (v13 != v15);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v13 = v18;
      if (v18)
        continue;
      break;
    }
  }

LABEL_17:
  v20 = objc_alloc_init(_GEOResourceManifestTileGroupObserverProxy);
  v19 = v20;
  if (v20)
    objc_storeStrong((id *)&v20->_queue, a4);
  -[NSMutableArray addObject:](self->_tileGroupObservers, "addObject:", v19, (_QWORD)v21);
LABEL_20:
  -[_GEOResourceManifestTileGroupObserverProxy registerObserver:](v19, "registerObserver:", v6, (_QWORD)v21);
  os_unfair_recursive_lock_unlock();

}

+ (id)modernManagerForConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = v4;
  if (v4 && !objc_msgSend(v4, "isDefaultConfiguration"))
  {
    if (qword_1ECDBBF08 != -1)
      dispatch_once(&qword_1ECDBBF08, &__block_literal_global_23);
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECDBBED8);
    objc_msgSend((id)qword_1ECDBBF00, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v6 = -[GEOResourceManifestManager initWithConfiguration:]((void **)[GEOResourceManifestManager alloc], v5);
      objc_msgSend((id)qword_1ECDBBF00, "setObject:forKey:", v6, v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECDBBED8);
  }
  else
  {
    objc_msgSend(a1, "modernManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (id)modernManager
{
  if (qword_1ECDBBEF0 != -1)
    dispatch_once(&qword_1ECDBBEF0, &__block_literal_global_21);
  return (id)qword_1ECDBBEF8;
}

- (id)languageForTileKey:(uint64_t)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "activeTileGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "languageForTileKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)pathForResourceWithName:(id)a3
{
  id v4;
  NSDictionary *resourceNamesToPaths;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;

  v4 = a3;
  os_unfair_lock_lock(&self->_resourceNamesToPathsLock);
  resourceNamesToPaths = self->_resourceNamesToPaths;
  if (!resourceNamesToPaths)
  {
    -[GEOResourceManifestManager _buildResourceNamesToPaths]((uint64_t)self);
    resourceNamesToPaths = self->_resourceNamesToPaths;
  }
  -[NSDictionary objectForKey:](resourceNamesToPaths, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&self->_resourceNamesToPathsLock);
  -[GEOResourceManifestManager _scheduleCachedResourceInfoPurgeTimer]((uint64_t)self);
  if (v7)
  {
    v8 = v7;
  }
  else
  {
    GEORegionalResourcesDirectory(self->_configuration);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingPathComponent:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "fileExistsAtPath:", v10);

    if (v12)
      v8 = v10;
    else
      v8 = 0;

  }
  return v8;
}

void __56__GEOResourceManifestManager__buildResourceNamesToPaths__block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;

  v5 = (objc_class *)MEMORY[0x1E0C99E98];
  v6 = a3;
  v7 = a2;
  v8 = (id)objc_msgSend([v5 alloc], "initFileURLWithPath:isDirectory:relativeToURL:", v6, 0, *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v8, v6);

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v8, v7);
}

- (BOOL)isMuninEnabled
{
  void *v3;
  char v4;

  if (qword_1ECDBBF48 != -1)
    dispatch_once(&qword_1ECDBBF48, &__block_literal_global_133);
  if (!byte_1ECDBBED1)
    return 0;
  -[GEOResourceManifestManager activeTileGroup](self, "activeTileGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isMuninEnabled");

  return v4;
}

- (GEOResourceManifestServerProxy)serverProxy
{
  return self->_serverProxy;
}

- (uint64_t)versionForTileKey:(uint64_t)a3
{
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "activeTileGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "versionForTileKey:", a3);

  return v5;
}

- (id)disputedBordersQueryItemsForTileKey:(uint64_t)a3 country:(void *)a4 region:(void *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a1, "activeTileGroup");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activeTileSetForKey:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "disputedBordersQueryItemsForCountry:region:", v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __56__GEOResourceManifestManager_startObservingDevResources__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  int v4;
  int v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  const __CFArray *v11;
  void *v12;
  FSEventStreamRef v13;
  __FSEventStream *v14;
  NSObject *global_workloop;
  FSEventStreamContext context;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "fileExistsAtPath:", *(_QWORD *)(a1 + 32));

    v5 = v4 ^ 1;
    if (((v4 ^ 1) & 1) != 0 || _devResourcesStream)
    {
      if (!_devResourcesStream)
        v5 = 0;
      if (v5 == 1)
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        _stopObservingFolder();
      }
    }
    else
    {
      v6 = *(void **)(a1 + 40);
      v7 = *(id *)(a1 + 32);
      v8 = v7;
      if (!_devResourcesStream)
      {
        v17[0] = v7;
        v9 = (void *)MEMORY[0x1E0C99D20];
        v10 = v6;
        objc_msgSend(v9, "arrayWithObjects:count:", v17, 1);
        v11 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
        context.version = 0;
        v12 = (void *)objc_msgSend(v10, "copy");

        context.info = v12;
        context.retain = (CFAllocatorRetainCallBack)MEMORY[0x1E0C98BD0];
        context.release = (CFAllocatorReleaseCallBack)MEMORY[0x1E0C98BC0];
        context.copyDescription = (CFAllocatorCopyDescriptionCallBack)MEMORY[0x1E0C98350];

        v13 = FSEventStreamCreate(0, (FSEventStreamCallback)_eventStreamCallback, &context, v11, 0xFFFFFFFFFFFFFFFFLL, 0.0, 0x10u);
        _devResourcesStream = (uint64_t)v13;
        if (v13)
        {
          v14 = v13;
          global_workloop = geo_get_global_workloop();
          FSEventStreamSetDispatchQueue(v14, global_workloop);

          if (!FSEventStreamStart((FSEventStreamRef)_devResourcesStream))
          {
            FSEventStreamRelease((FSEventStreamRef)_devResourcesStream);
            _devResourcesStream = 0;
          }
        }

      }
    }
  }

}

void __43__GEOResourceManifestManager_modernManager__block_invoke()
{
  GEOResourceManifestManager *v0;
  void **v1;
  void *v2;

  os_unfair_lock_lock(&stru_1ECDBBED4);
  v0 = [GEOResourceManifestManager alloc];
  v1 = -[GEOResourceManifestManager initWithConfiguration:]((void **)&v0->super.isa, unk_1ECDBBEE0);
  v2 = (void *)qword_1ECDBBEF8;
  qword_1ECDBBEF8 = (uint64_t)v1;

  os_unfair_lock_unlock(&stru_1ECDBBED4);
}

- (void)initWithConfiguration:(void *)a1
{
  id v4;
  void **v5;
  void **v6;
  GEOResourceManifestConfiguration *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  GEOLocalizationRegionsInfo *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *global_queue;
  void **v20;
  objc_super v21;

  v4 = a2;
  if (a1)
  {
    v21.receiver = a1;
    v21.super_class = (Class)GEOResourceManifestManager;
    v5 = (void **)objc_msgSendSuper2(&v21, sel_init);
    a1 = v5;
    if (v5)
    {
      v6 = v5 + 20;
      objc_storeStrong(v5 + 20, a2);
      if (!a1[20])
      {
        v7 = objc_alloc_init(GEOResourceManifestConfiguration);
        v8 = *v6;
        *v6 = v7;

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObserver:selector:name:object:", a1, sel__localeChanged_, *MEMORY[0x1E0C99720], 0);

      *((_DWORD *)a1 + 11) = 0;
      *((_DWORD *)a1 + 38) = 0;
      a1[11] = 0;
      v10 = geo_isolater_create();
      v11 = a1[18];
      a1[18] = (void *)v10;

      *((_BYTE *)a1 + 72) = 1;
      a1[13] = (void *)1;
      *((_DWORD *)a1 + 24) = 0;
      v12 = objc_alloc_init(GEOLocalizationRegionsInfo);
      v13 = a1[16];
      a1[16] = v12;

      if ((_MergedGlobals_232 & 1) == 0)
      {
        if (qword_1ECDBBEE8)
        {
          v14 = (id)qword_1ECDBBEE8;
        }
        else
        {
          objc_opt_class();
          v14 = (id)objc_claimAutoreleasedReturnValue();
        }
        v15 = objc_msgSend(objc_alloc((Class)v14), "initWithDelegate:configuration:", a1, v4);
        v16 = a1[1];
        a1[1] = (void *)v15;

      }
      v20 = a1;
      geo_dispatch_async_qos();
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObserver:selector:name:object:", v20, sel__offlineStateChanged_, CFSTR("GEOOfflineStateChangedNotification"), 0);

      *((_DWORD *)v20 + 10) = -1;
      global_queue = (void *)geo_get_global_queue();
      GEORegisterPListStateCaptureLegacy();

      a1 = v20;
    }
  }

  return a1;
}

- (id)authToken
{
  return (id)-[GEOResourceManifestServerProxy authToken](self->_serverProxy, "authToken");
}

- (BOOL)hasActiveTileGroup
{
  void *v2;
  BOOL v3;

  -[GEOResourceManifestManager activeTileGroup](self, "activeTileGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)languageForTileKey:(uint64_t)a3 overrideLocale:(void *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a1, "activeTileGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "languageForTileKey:overrideLocale:", a3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)localizationURLStringIfNecessaryForActiveTileSet:(void *)a3 tileKey:(uint64_t)a4 overrideLocale:(void *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "localizationURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (v11)
  {
    objc_msgSend(v8, "bestLanguageWithOverrideLocale:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12
      && ((objc_msgSend(v8, "baseURL"),
           v13 = (void *)objc_claimAutoreleasedReturnValue(),
           v14 = objc_msgSend(v13, "length"),
           v13,
           !v14)
       || objc_msgSend(*(id *)(a1 + 128), "needsLocalizationForKey:language:", a4, v12)))
    {
      objc_msgSend(v8, "localizationURL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)updateManifest:(int64_t)a3 completionHandler:(id)a4
{
  -[GEOResourceManifestServerProxy forceUpdate:completionHandler:](self->_serverProxy, "forceUpdate:completionHandler:", a3, a4);
}

- (void)activateResourceScale:(int)a3
{
  -[GEOResourceManifestServerProxy activateResourceScale:](self->_serverProxy, "activateResourceScale:", *(_QWORD *)&a3);
}

uint64_t __44__GEOResourceManifestManager_isMuninEnabled__block_invoke()
{
  uint64_t result;

  result = GEOConfigGetBOOL(MapsFeaturesConfig_IsMuninEnabled, (uint64_t)off_1EDF4AF48);
  byte_1ECDBBED1 = result;
  return result;
}

- (void)openServerConnection
{
  os_unfair_lock_s *p_closedCountLock;
  int64_t v4;
  NSObject *cachedResourceInfoPurgeTimer;
  OS_dispatch_source *v6;
  id v7;

  p_closedCountLock = &self->_closedCountLock;
  os_unfair_lock_lock_with_options();
  v4 = self->_closedCount - 1;
  self->_closedCount = v4;
  os_unfair_lock_unlock(p_closedCountLock);
  if (!v4)
  {
    os_unfair_lock_lock(&self->_resourceNamesToPathsLock);
    cachedResourceInfoPurgeTimer = self->_cachedResourceInfoPurgeTimer;
    if (cachedResourceInfoPurgeTimer)
    {
      dispatch_source_cancel(cachedResourceInfoPurgeTimer);
      v6 = self->_cachedResourceInfoPurgeTimer;
      self->_cachedResourceInfoPurgeTimer = 0;

    }
    os_unfair_lock_unlock(&self->_resourceNamesToPathsLock);
    -[GEOResourceManifestServerProxy openConnection](self->_serverProxy, "openConnection");
    if (self->_needsToLoadTileGroupFromDisk)
      v7 = -[GEOResourceManifestManager _loadActiveTileGroupIfNecessary:]((uint64_t)self, 1);
  }
}

void __52__GEOResourceManifestManager_initWithConfiguration___block_invoke(uint64_t a1)
{
  void *v1;
  BOOL v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *global_queue;
  dispatch_source_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD *v14;
  void *v15;
  int v16;
  unsigned int v17;
  NSObject *global_workloop;
  uintptr_t v19;
  dispatch_source_t v20;
  void *v21;
  int v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  _QWORD handler[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id location;
  _BYTE v32[9];

  v1 = *(void **)(a1 + 32);
  if (v1)
    v2 = qword_1ECDBBF50 == 0;
  else
    v2 = 0;
  if (v2)
  {
    +[GEOFilePaths pathFor:](GEOFilePaths, "pathFor:", 12);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByDeletingLastPathComponent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v1);
    v5 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __56__GEOResourceManifestManager_startObservingDevResources__block_invoke;
    v29[3] = &unk_1E1BFF8B0;
    objc_copyWeak(&v30, &location);
    v6 = (void *)MEMORY[0x18D765024](v29);
    global_queue = geo_get_global_queue();
    v8 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, global_queue);
    v9 = (void *)qword_1ECDBBF58;
    qword_1ECDBBF58 = (uint64_t)v8;

    dispatch_source_set_timer((dispatch_source_t)qword_1ECDBBF58, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    v10 = qword_1ECDBBF58;
    handler[0] = v5;
    handler[1] = 3221225472;
    handler[2] = __56__GEOResourceManifestManager_startObservingDevResources__block_invoke_2;
    handler[3] = &unk_1E1BFF8B0;
    objc_copyWeak(&v28, &location);
    dispatch_source_set_event_handler(v10, handler);
    dispatch_activate((dispatch_object_t)qword_1ECDBBF58);
    v23[0] = v5;
    v23[1] = 3221225472;
    v23[2] = __56__GEOResourceManifestManager_startObservingDevResources__block_invoke_3;
    v23[3] = &unk_1E1C0AD00;
    objc_copyWeak(&v26, &location);
    v11 = v3;
    v24 = v11;
    v12 = v6;
    v25 = v12;
    v13 = v4;
    v14 = v23;
    if (!qword_1ECDBBF50)
    {
      v32[0] = 0;
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "fileExistsAtPath:isDirectory:", v13, v32);

      if (v16)
      {
        v17 = open((const char *)objc_msgSend(objc_retainAutorelease(v13), "fileSystemRepresentation"), 0x8000);
        _devResourceParentFD = v17;
        if ((v17 & 0x80000000) == 0)
        {
          v22 = v32[0];
          global_workloop = geo_get_global_workloop();
          if (v22)
            v19 = 107;
          else
            v19 = 111;
          v20 = dispatch_source_create(MEMORY[0x1E0C80DE8], v17, v19, global_workloop);
          v21 = (void *)qword_1ECDBBF50;
          qword_1ECDBBF50 = (uint64_t)v20;

          if (qword_1ECDBBF50)
          {
            dispatch_source_set_event_handler((dispatch_source_t)qword_1ECDBBF50, v14);
            dispatch_resume((dispatch_object_t)qword_1ECDBBF50);
          }
          else
          {
            close(_devResourceParentFD);
            _devResourceParentFD = -1;
          }
        }
      }
    }

    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);

  }
}

- (void)_buildResourceNamesToPaths
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  unint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  uint64_t v49;
  id v50;
  void *v51;
  void *v52;
  id obj;
  uint64_t v54;
  void *v55;
  void *v56;
  id v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[4];
  id v64;
  id v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v1 = a1;
    v2 = *(void **)(a1 + 48);
    if (v2)
    {
      *(_QWORD *)(a1 + 48) = 0;

    }
    v3 = *(void **)(v1 + 56);
    if (v3)
    {
      *(_QWORD *)(v1 + 56) = 0;

    }
    v4 = *(void **)(v1 + 64);
    if (v4)
    {
      *(_QWORD *)(v1 + 64) = 0;

    }
    GEOResourcesPath(*(void **)(v1 + 160));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v5, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOResourceManifestManager _loadActiveTileGroupIfNecessary:](v1, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v7, "resourceCanonicalNameToFileName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "allKeys");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setWithArray:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v7, "regionalResourceCanonicalNameToFileName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "allValues");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setWithArray:", v14);
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[GEOFilePaths pathFor:](GEOFilePaths, "pathFor:", 12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "contentsOfDirectoryAtPath:error:", v16, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "resourceCanonicalNameToFileName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v63[0] = MEMORY[0x1E0C809B0];
      v63[1] = 3221225472;
      v63[2] = __56__GEOResourceManifestManager__buildResourceNamesToPaths__block_invoke;
      v63[3] = &unk_1E1C0AC38;
      v50 = v6;
      v64 = v50;
      v57 = v18;
      v65 = v57;
      objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v63);

      if (objc_msgSend(v17, "count"))
      {
        v48 = v5;
        v49 = v1;
        v47 = v11;
        v20 = (void *)objc_msgSend(v11, "mutableCopy");
        objc_msgSend(v7, "regionalResourceCanonicalNameToFileName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "allKeys");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v20;
        objc_msgSend(v20, "addObjectsFromArray:", v22);

        v23 = (void *)MEMORY[0x1E0C99E98];
        +[GEOFilePaths pathFor:](GEOFilePaths, "pathFor:", 12);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "fileURLWithPath:isDirectory:", v24, 1);
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        v61 = 0u;
        v62 = 0u;
        v59 = 0u;
        v60 = 0u;
        obj = v17;
        v25 = v17;
        v26 = v57;
        v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
        if (!v58)
          goto LABEL_23;
        v27 = 0x1E0C99000uLL;
        v54 = *(_QWORD *)v60;
        v52 = v17;
        while (1)
        {
          v28 = 0;
          do
          {
            if (*(_QWORD *)v60 != v54)
              objc_enumerationMutation(obj);
            v29 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v28);
            v30 = (void *)objc_msgSend(objc_alloc(*(Class *)(v27 + 3736)), "initFileURLWithPath:isDirectory:relativeToURL:", v29, 0, v55);
            objc_msgSend(v29, "stringByDeletingPathExtension");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "pathExtension");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v32, "length"))
              objc_msgSend(v26, "setObject:forKeyedSubscript:", v30, v31);
            objc_msgSend(v26, "setObject:forKeyedSubscript:", v30, v29);
            objc_msgSend(v56, "addObject:", v29);
            objc_msgSend(v7, "resourceCanonicalNameToFileName");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "objectForKeyedSubscript:", v29);
            v34 = objc_claimAutoreleasedReturnValue();
            if (v34)
            {
              v35 = (void *)v34;

              v26 = v57;
            }
            else
            {
              objc_msgSend(v7, "regionalResourceCanonicalNameToFileName");
              v36 = v27;
              v37 = v7;
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "objectForKeyedSubscript:", v29);
              v35 = (void *)objc_claimAutoreleasedReturnValue();

              v7 = v37;
              v27 = v36;
              v25 = v52;

              v26 = v57;
              if (!v35)
                goto LABEL_21;
            }
            objc_msgSend(v26, "setObject:forKeyedSubscript:", v30, v35);

LABEL_21:
            ++v28;
          }
          while (v58 != v28);
          v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
          if (!v58)
          {
LABEL_23:

            v39 = (void *)objc_msgSend(v56, "copy");
            v5 = v48;
            v1 = v49;
            goto LABEL_25;
          }
        }
      }
      v39 = v11;
      v25 = v17;
      v26 = v57;
LABEL_25:
      v40 = objc_msgSend(v26, "copy");
      v41 = *(void **)(v1 + 48);
      *(_QWORD *)(v1 + 48) = v40;

      v42 = *(void **)(v1 + 56);
      *(_QWORD *)(v1 + 56) = v39;
      v43 = v39;

      v44 = v26;
      v45 = *(void **)(v1 + 64);
      *(_QWORD *)(v1 + 64) = v51;
      v46 = v51;

    }
  }
}

+ (void)disableServerConnection
{
  _MergedGlobals_232 = 1;
}

+ (void)setServerProxyClass:(Class)a3
{
  qword_1ECDBBEE8 = (uint64_t)a3;
}

+ (void)useRemoteProxy
{
  objc_msgSend(a1, "setServerProxyClass:", objc_opt_class());
}

+ (void)useLocalProxy
{
  objc_msgSend(a1, "setServerProxyClass:", objc_opt_class());
}

+ (void)configureInProcessSingletonWithConfiguration:(id)a3
{
  id v5;
  uint64_t v6;

  objc_storeStrong(&qword_1ECDBBEE0, a3);
  v5 = a3;
  v6 = objc_opt_class();

  objc_msgSend(a1, "setServerProxyClass:", v6);
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_82);
  return +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
}

void __43__GEOResourceManifestManager_sharedManager__block_invoke()
{
  id v0;

  +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "openServerConnection");

}

+ (id)modernManagerForTileGroupIdentifier:(unsigned int)a3
{
  uint64_t v4;
  GEOResourceManifestConfiguration *v5;
  void *v6;

  if (a3)
  {
    v4 = *(_QWORD *)&a3;
    v5 = objc_alloc_init(GEOResourceManifestConfiguration);
    -[GEOResourceManifestConfiguration setTileGroupIdentifier:](v5, "setTileGroupIdentifier:", v4);
    objc_msgSend(a1, "modernManagerForConfiguration:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "modernManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

void __60__GEOResourceManifestManager_modernManagerForConfiguration___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECDBBF00;
  qword_1ECDBBF00 = v0;

}

- (GEOResourceManifestManager)init
{
  return (GEOResourceManifestManager *)-[GEOResourceManifestManager initWithConfiguration:]((void **)&self->super.isa, 0);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  int offlineDataVersionChangeNotifyToken;
  objc_super v7;

  if (self)
  {
    dispatch_source_set_timer((dispatch_source_t)qword_1ECDBBF58, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_source_set_event_handler((dispatch_source_t)qword_1ECDBBF58, &__block_literal_global_145);
    v3 = (void *)qword_1ECDBBF58;
    qword_1ECDBBF58 = 0;

    if (qword_1ECDBBF50)
    {
      dispatch_source_cancel((dispatch_source_t)qword_1ECDBBF50);
      v4 = (void *)qword_1ECDBBF50;
      qword_1ECDBBF50 = 0;

    }
    if ((_devResourceParentFD & 0x80000000) == 0)
    {
      close(_devResourceParentFD);
      _devResourceParentFD = -1;
    }
    _stopObservingFolder();
  }
  GEOUnregisterStateCaptureLegacy();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  offlineDataVersionChangeNotifyToken = self->_offlineDataVersionChangeNotifyToken;
  if (offlineDataVersionChangeNotifyToken != -1)
    notify_cancel(offlineDataVersionChangeNotifyToken);
  -[GEOResourceManifestServerProxy setDelegate:](self->_serverProxy, "setDelegate:", 0);
  v7.receiver = self;
  v7.super_class = (Class)GEOResourceManifestManager;
  -[GEOResourceManifestManager dealloc](&v7, sel_dealloc);
}

- (id)_generateOfflineActiveTileGroup:(id)a3
{
  void *v5;
  id *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  GEOActiveTileSet *v13;
  GEOActiveTileSet *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  GEOResourceManifestManager *v28;
  id v29;
  id obj;
  GEOActiveTileGroup *v31;
  _DWORD v32[6];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  +[GEOOfflineDataAccess sharedInstance](GEOOfflineDataAccess, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  objc_msgSend(v5, "offlineTileMetadataWithState:error:", a3.var0, &v37);
  v6 = (id *)objc_claimAutoreleasedReturnValue();
  v7 = v37;

  if (!v6)
  {
    v31 = 0;
    goto LABEL_25;
  }
  v28 = self;
  v29 = v7;
  v31 = objc_alloc_init(GEOActiveTileGroup);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v6[1];
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (!v8)
    goto LABEL_23;
  v9 = v8;
  v10 = *(_QWORD *)v34;
  do
  {
    v11 = 0;
    do
    {
      if (*(_QWORD *)v34 != v10)
        objc_enumerationMutation(obj);
      v12 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v11);
      v13 = objc_alloc_init(GEOActiveTileSet);
      v14 = v13;
      if (!v12)
      {
        -[GEOActiveTileSet setStyle:](v13, "setStyle:", 0);
LABEL_12:
        v16 = 0;
        goto LABEL_14;
      }
      if ((*(_BYTE *)(v12 + 40) & 2) != 0)
        v15 = *(unsigned int *)(v12 + 36);
      else
        v15 = 0;
      -[GEOActiveTileSet setStyle:](v13, "setStyle:", v15, v28);
      if ((*(_BYTE *)(v12 + 40) & 1) == 0)
        goto LABEL_12;
      v16 = *(unsigned int *)(v12 + 32);
LABEL_14:
      -[GEOActiveTileSet setSize:](v14, "setSize:", v16, v28);
      -[GEOActiveTileSet setScale:](v14, "setScale:", 0);
      v17 = 0;
      if (v12)
      {
LABEL_15:
        v18 = *(_QWORD *)(v12 + 16);
        goto LABEL_16;
      }
      while (1)
      {
        v18 = 0;
LABEL_16:
        if (v17 >= v18)
          break;
        v19 = -[GEOPBTileStyleZoomAvailability zoomAtIndex:](v12, v17);
        v32[0] = 1 << v19;
        v32[1] = 1 << v19;
        v32[2] = v19;
        v32[3] = 0;
        v32[4] = 0;
        v32[5] = v19;
        -[GEOActiveTileSet addAvailableTiles:](v14, "addAvailableTiles:", v32);
        ++v17;
        if (v12)
          goto LABEL_15;
      }
      -[GEOActiveTileGroup addTileSet:](v31, "addTileSet:", v14);

      ++v11;
    }
    while (v11 != v9);
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    v9 = v20;
  }
  while (v20);
LABEL_23:

  -[GEOResourceManifestManager activeTileGroup](v28, "activeTileGroup");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "activeResources");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "mutableCopy");
  -[GEOActiveTileGroup setActiveResources:](v31, "setActiveResources:", v23);

  objc_msgSend(v21, "regionalResources");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "mutableCopy");
  -[GEOActiveTileGroup setRegionalResources:](v31, "setRegionalResources:", v25);

  objc_msgSend(v21, "urlInfoSet");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOActiveTileGroup setUrlInfoSet:](v31, "setUrlInfoSet:", v26);

  v7 = v29;
LABEL_25:

  return v31;
}

void __80__GEOResourceManifestManager_activeTileGroupForCurrentOfflineModeForAuditToken___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  NSObject *v8;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    os_unfair_lock_lock_with_options();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 32);
    *(_QWORD *)(v3 + 32) = 0;

    os_unfair_lock_unlock(WeakRetained + 11);
    +[GEOApplicationAuditToken currentProcessAuditToken](GEOApplicationAuditToken, "currentProcessAuditToken");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "offlineCohortId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = +[GEOOfflineService activeStateForCohortId:](GEOOfflineService, "activeStateForCohortId:", v6);
    if (v7 < 2)
    {
LABEL_10:

      goto LABEL_11;
    }
    if (v7 != 2)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        v10[0] = 67109120;
        v10[1] = v7;
        _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", (uint8_t *)v10, 8u);
      }
      goto LABEL_10;
    }

    GEOGetResourceManifestLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_INFO, "Offline tile config changed. Posting tile group change notifications", (uint8_t *)v10, 2u);
    }

    -[GEOResourceManifestManager _notifyObserversOfResourcesChange](*(_QWORD *)(a1 + 32));
  }
LABEL_11:

}

- (void)_notifyObserversOfResourcesChange
{
  os_unfair_lock_s *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[5];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[5];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[5];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 152);
    os_unfair_lock_lock_with_options();
    v3 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = 0;

    v4 = *(void **)(a1 + 56);
    *(_QWORD *)(a1 + 56) = 0;

    os_unfair_lock_unlock(v2);
    os_unfair_recursive_lock_lock_with_options();
    v5 = (void *)objc_msgSend(*(id *)(a1 + 80), "copy");
    os_unfair_recursive_lock_unlock();
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    v8 = MEMORY[0x1E0C809B0];
    if (v7)
    {
      v9 = v7;
      v10 = *(_QWORD *)v37;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v37 != v10)
            objc_enumerationMutation(v6);
          v12 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v11);
          v35[0] = v8;
          v35[1] = 3221225472;
          v35[2] = __63__GEOResourceManifestManager__notifyObserversOfResourcesChange__block_invoke;
          v35[3] = &unk_1E1C0ACD8;
          v35[4] = a1;
          -[_GEOResourceManifestTileGroupObserverProxy forEachObserver:finished:](v12, v35, 0);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      }
      while (v9);
    }

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v13 = v6;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v32;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v32 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v17);
          v30[0] = v8;
          v30[1] = 3221225472;
          v30[2] = __63__GEOResourceManifestManager__notifyObserversOfResourcesChange__block_invoke_2;
          v30[3] = &unk_1E1C0ACD8;
          v30[4] = a1;
          -[_GEOResourceManifestTileGroupObserverProxy forEachObserver:finished:](v18, v30, 0);
          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
      }
      while (v15);
    }

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v19 = v13;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v40, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v27;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v27 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v23);
          v25[0] = v8;
          v25[1] = 3221225472;
          v25[2] = __63__GEOResourceManifestManager__notifyObserversOfResourcesChange__block_invoke_3;
          v25[3] = &unk_1E1C0ACD8;
          v25[4] = a1;
          -[_GEOResourceManifestTileGroupObserverProxy forEachObserver:finished:](v24, v25, 0);
          ++v23;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v40, 16);
      }
      while (v21);
    }

  }
}

- (void)closeServerConnection
{
  -[GEOResourceManifestManager closeServerConnection:](self, "closeServerConnection:", 0);
}

- (void)closeServerConnection:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_closedCountLock;
  int64_t closedCount;

  v3 = a3;
  p_closedCountLock = &self->_closedCountLock;
  os_unfair_lock_lock_with_options();
  closedCount = self->_closedCount;
  self->_closedCount = closedCount + 1;
  os_unfair_lock_unlock(p_closedCountLock);
  if (!closedCount)
  {
    -[GEOResourceManifestServerProxy closeConnection](self->_serverProxy, "closeConnection");
    if (v3)
      -[GEOResourceManifestManager _purgeCachedResourceInfo]((uint64_t)self);
    else
      -[GEOResourceManifestManager _scheduleCachedResourceInfoPurgeTimer]((uint64_t)self);
  }
}

- (void)_purgeCachedResourceInfo
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a1)
  {
    v2 = (void *)MEMORY[0x18D764E2C]();
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    v3 = *(NSObject **)(a1 + 168);
    if (v3)
    {
      dispatch_source_cancel(v3);
      v4 = *(void **)(a1 + 168);
      *(_QWORD *)(a1 + 168) = 0;

    }
    v5 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = 0;

    v6 = *(void **)(a1 + 56);
    *(_QWORD *)(a1 + 56) = 0;

    v7 = *(void **)(a1 + 64);
    *(_QWORD *)(a1 + 64) = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
    os_unfair_lock_lock_with_options();
    v8 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = 0;

    v9 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = 0;

    *(_BYTE *)(a1 + 72) = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 44));
    objc_autoreleasePoolPop(v2);
  }
}

- (void)_localeChanged:(id)a3
{
  id v3;

  -[GEOResourceManifestManager activeTileGroup](self, "activeTileGroup", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_resetBestLanguages");

}

- (void)addServerProxyObserver:(id)a3
{
  id v4;
  GEOObserverHashTable *serverProxyObservers;
  GEOObserverHashTable *v6;
  GEOObserverHashTable *v7;
  id v8;

  v4 = a3;
  serverProxyObservers = self->_serverProxyObservers;
  v8 = v4;
  if (!serverProxyObservers)
  {
    v6 = -[GEOObserverHashTable initWithProtocol:queue:]([GEOObserverHashTable alloc], "initWithProtocol:queue:", &unk_1EDFBC918, 0);
    v7 = self->_serverProxyObservers;
    self->_serverProxyObservers = v6;

    v4 = v8;
    serverProxyObservers = self->_serverProxyObservers;
  }
  -[GEOObserverHashTable registerObserver:](serverProxyObservers, "registerObserver:", v4);

}

- (void)removeServerProxyObserver:(id)a3
{
  -[GEOObserverHashTable unregisterObserver:](self->_serverProxyObservers, "unregisterObserver:", a3);
}

- (int)mapMatchingTileSetStyle
{
  return 53;
}

- (unsigned)mapMatchingZoomLevel
{
  void *v3;
  void *v4;
  unsigned int v5;

  -[GEOResourceManifestManager activeTileGroup](self, "activeTileGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeTileSetForTileType:scale:", -[GEOResourceManifestManager mapMatchingTileSetStyle](self, "mapMatchingTileSetStyle"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "maximumZoomLevelInRect:", 0.0, 0.0, 268435456.0, 268435456.0);

  return v5;
}

- (uint64_t)requestStyleForTileKey:(uint64_t)a3
{
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "activeTileGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "requestStyleForTileKey:", a3);

  return v5;
}

- (double)timeToLiveForTileKey:(uint64_t)a3
{
  void *v4;
  double v5;
  double v6;

  objc_msgSend(a1, "activeTileGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeToLiveForTileKey:", a3);
  v6 = v5;

  return v6;
}

- (uint64_t)isAvailableForTileKey:(uint64_t)a3
{
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "activeTileGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAvailableForTileKey:", a3);

  return v5;
}

- (uint64_t)useProxyAuthForTileKey:(uint64_t)a3
{
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "activeTileGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "useProxyAuthForTileKey:", a3);

  return v5;
}

- (uint64_t)isDisputedBordersAllowlistedForTileKey:(uint64_t)a3 country:(void *)a4 region:(void *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a1, "activeTileGroup");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activeTileSetForKey:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isDisputedBordersAllowlistedForCountry:region:", v9, v8);

  return v12;
}

- (BOOL)supportsTileStyle:(int)a3 size:(int)a4 scale:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v7 = *(_QWORD *)&a3;
  -[GEOResourceManifestManager activeTileGroup](self, "activeTileGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v8, "supportsTileStyle:size:scale:", v7, v6, v5);

  return v5;
}

- (unsigned)_fromgeod_maximumZoomLevelForStyle:(int)a3 scale:(int)a4 outSize:(int *)a5
{
  return -[GEOResourceManifestServerProxy maximumZoomLevelForStyle:scale:outSize:](self->_serverProxy, "maximumZoomLevelForStyle:scale:outSize:", *(_QWORD *)&a3, *(_QWORD *)&a4, a5);
}

void __67__GEOResourceManifestManager__scheduleCachedResourceInfoPurgeTimer__block_invoke(uint64_t a1)
{
  -[GEOResourceManifestManager _purgeCachedResourceInfo](*(_QWORD *)(a1 + 32));
}

- (id)allRegionalResourceNames
{
  os_unfair_lock_s *p_resourceNamesToPathsLock;
  NSSet *allRegionalResourceNames;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  p_resourceNamesToPathsLock = &self->_resourceNamesToPathsLock;
  os_unfair_lock_lock(&self->_resourceNamesToPathsLock);
  allRegionalResourceNames = self->_allRegionalResourceNames;
  if (!allRegionalResourceNames)
  {
    -[GEOResourceManifestManager _buildResourceNamesToPaths]((uint64_t)self);
    allRegionalResourceNames = self->_allRegionalResourceNames;
  }
  v5 = (void *)-[NSSet mutableCopy](allRegionalResourceNames, "mutableCopy");
  os_unfair_lock_unlock(p_resourceNamesToPathsLock);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  GEORegionalResourcesDirectory(self->_configuration);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentsOfDirectoryAtPath:error:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intersectSet:", v9);

  -[GEOResourceManifestManager _scheduleCachedResourceInfoPurgeTimer]((uint64_t)self);
  return v5;
}

- (id)allResourcePaths
{
  os_unfair_lock_s *p_resourceNamesToPathsLock;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  p_resourceNamesToPathsLock = &self->_resourceNamesToPathsLock;
  os_unfair_lock_lock(&self->_resourceNamesToPathsLock);
  if (!self->_allResourceNames)
    -[GEOResourceManifestManager _buildResourceNamesToPaths]((uint64_t)self);
  v4 = (void *)MEMORY[0x1E0C99E60];
  -[NSDictionary allValues](self->_resourceNamesToPaths, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_resourceNamesToPathsLock);
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_geo_map:", &__block_literal_global_116);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[GEOResourceManifestManager _scheduleCachedResourceInfoPurgeTimer]((uint64_t)self);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __46__GEOResourceManifestManager_allResourcePaths__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "path");
}

- (void)addNetworkActivityHandler:(id)a3
{
  id v3;
  void *v4;

  if (a3)
  {
    v4 = (void *)objc_msgSend(a3, "copy");
    v3 = v4;
    geo_isolate_sync_data();

  }
}

void __56__GEOResourceManifestManager_addNetworkActivityHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 136);
    *(_QWORD *)(v4 + 136) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  }
  v6 = (id)MEMORY[0x18D765024](*(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "addObject:", v6);

}

- (id)bestLocalizedStringForDisplayStringAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[GEOResourceManifestManager activeTileGroup](self, "activeTileGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayStrings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 >= a3)
  {
    -[GEOResourceManifestManager activeTileGroup](self, "activeTileGroup");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayStrings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStrings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "count"))
    {
      +[GEOLocalizedString bestLocalizedStringForCurrentLocale:fallbackToFirstAvailable:](GEOLocalizedString, "bestLocalizedStringForCurrentLocale:fallbackToFirstAvailable:", v12, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)setConstantlyChangeTileGroup:(BOOL)a3
{
  self->_constantlyChangeTileGroup = a3;
  -[GEOResourceManifestManager fakeTileGroupChange]((uint64_t)self);
}

- (void)fakeTileGroupChange
{
  dispatch_time_t v2;
  NSObject *v3;
  _QWORD block[5];

  if (a1)
  {
    if (*(_BYTE *)(a1 + 112))
    {
      v2 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 120) * 1000000000.0));
      objc_msgSend(*(id *)(a1 + 8), "serverQueue");
      v3 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __49__GEOResourceManifestManager_fakeTileGroupChange__block_invoke;
      block[3] = &unk_1E1BFF6F8;
      block[4] = a1;
      dispatch_after(v2, v3, block);

    }
  }
}

- (void)setConstantlyChangeTileGroupInterval:(double)a3
{
  self->_constantlyChangeTileGroupInterval = a3;
}

void __49__GEOResourceManifestManager_fakeTileGroupChange__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[1];
  objc_msgSend(v2, "activeTileGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__GEOResourceManifestManager_fakeTileGroupChange__block_invoke_2;
  v5[3] = &unk_1E1BFF6F8;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "serverProxy:didChangeActiveTileGroup:finishedCallback:", v3, v4, v5);

}

uint64_t __49__GEOResourceManifestManager_fakeTileGroupChange__block_invoke_2(uint64_t a1)
{
  return -[GEOResourceManifestManager fakeTileGroupChange](*(_QWORD *)(a1 + 32));
}

- (void)serverProxy:(id)a3 didChangeActiveTileGroup:(id)a4 finishedCallback:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void (**v14)(_QWORD);
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id obj;
  id v24;
  _QWORD v25[4];
  id v26;
  void (**v27)(_QWORD);
  _QWORD *v28;
  _QWORD *v29;
  _QWORD v30[5];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[3];
  uint64_t v36;
  _QWORD v37[4];
  int v38;
  _QWORD v39[5];
  id v40;
  id v41;
  id v42;
  _QWORD v43[5];
  id v44;
  id v45;
  id v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  os_unfair_recursive_lock_lock_with_options();
  v22 = (void *)-[NSMutableArray mutableCopy](self->_tileGroupObservers, "mutableCopy");
  os_unfair_recursive_lock_unlock();
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __84__GEOResourceManifestManager_serverProxy_didChangeActiveTileGroup_finishedCallback___block_invoke;
  v43[3] = &unk_1E1C01268;
  v43[4] = self;
  v11 = v8;
  v44 = v11;
  v12 = v9;
  v45 = v12;
  v20 = v10;
  v46 = v20;
  v13 = (void *)MEMORY[0x18D765024](v43);
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __84__GEOResourceManifestManager_serverProxy_didChangeActiveTileGroup_finishedCallback___block_invoke_2_123;
  v39[3] = &unk_1E1C01268;
  v39[4] = self;
  v19 = v12;
  v40 = v19;
  v24 = v11;
  v41 = v24;
  v21 = v13;
  v42 = v21;
  v14 = (void (**)(_QWORD))MEMORY[0x18D765024](v39);
  if (objc_msgSend(v22, "count"))
  {
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x2810000000;
    v37[3] = "";
    v38 = 0;
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x2020000000;
    v36 = 0;
    v36 = objc_msgSend(v22, "count", v19);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = v22;
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v47, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v32 != v16)
            objc_enumerationMutation(obj);
          v18 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
          v29 = v35;
          v30[0] = MEMORY[0x1E0C809B0];
          v30[1] = 3221225472;
          v30[2] = __84__GEOResourceManifestManager_serverProxy_didChangeActiveTileGroup_finishedCallback___block_invoke_5;
          v30[3] = &unk_1E1C0ACD8;
          v30[4] = self;
          v25[0] = MEMORY[0x1E0C809B0];
          v25[1] = 3221225472;
          v25[2] = __84__GEOResourceManifestManager_serverProxy_didChangeActiveTileGroup_finishedCallback___block_invoke_6;
          v25[3] = &unk_1E1C0ACB0;
          v28 = v37;
          v26 = v24;
          v27 = v14;
          -[_GEOResourceManifestTileGroupObserverProxy forEachObserver:finished:](v18, v30, v25);

        }
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v47, 16);
      }
      while (v15);
    }

    _Block_object_dispose(v35, 8);
    _Block_object_dispose(v37, 8);
  }
  else
  {
    v14[2](v14);
  }

}

void __84__GEOResourceManifestManager_serverProxy_didChangeActiveTileGroup_finishedCallback___block_invoke(uint64_t a1)
{
  dispatch_group_t v2;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[4];
  dispatch_group_t v8;
  id v9;
  id v10;

  v2 = dispatch_group_create();
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __84__GEOResourceManifestManager_serverProxy_didChangeActiveTileGroup_finishedCallback___block_invoke_2;
  v7[3] = &unk_1E1C0AC60;
  v8 = v2;
  v9 = v3;
  v10 = *(id *)(a1 + 48);
  v5 = v2;
  objc_msgSend(v4, "enumerateObserversWithGroup:visitor:", v5, v7);
  objc_msgSend(*(id *)(a1 + 40), "serverQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_group_notify(v5, v6, *(dispatch_block_t *)(a1 + 56));

}

void __84__GEOResourceManifestManager_serverProxy_didChangeActiveTileGroup_finishedCallback___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[16];

  v3 = a2;
  if (v3)
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v5 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __84__GEOResourceManifestManager_serverProxy_didChangeActiveTileGroup_finishedCallback___block_invoke_121;
    v6[3] = &unk_1E1BFF6F8;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v3, "serverProxy:didChangeActiveTileGroup:finishedCallback:", v5, v4, v6);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: observer != ((void *)0)", buf, 2u);
  }

}

void __84__GEOResourceManifestManager_serverProxy_didChangeActiveTileGroup_finishedCallback___block_invoke_121(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __84__GEOResourceManifestManager_serverProxy_didChangeActiveTileGroup_finishedCallback___block_invoke_2_123(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  id obj;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD v29[5];
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[3];
  uint64_t v36;
  _QWORD v37[4];
  int v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  os_unfair_recursive_lock_lock_with_options();
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "copy");
  os_unfair_recursive_lock_unlock();
  os_unfair_lock_lock_with_options();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(v3 + 104);
  os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 96));
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 44));
  v23 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v21 = v2;
  if (v4 < 1)
  {
LABEL_12:
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 0;
    -[GEOResourceManifestManager _scheduleCachedResourceInfoPurgeTimer](*(_QWORD *)(a1 + 32));
  }
  else
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v5 = v2;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v40;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v40 != v7)
            objc_enumerationMutation(v5);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {

            goto LABEL_12;
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
        if (v6)
          continue;
        break;
      }
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 1;
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 24);
    *(_QWORD *)(v9 + 24) = 0;

  }
  v12 = a1 + 32;
  v11 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v11 + 32);
  *(_QWORD *)(v11 + 32) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 44));
  os_unfair_lock_lock_with_options();
  v14 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  *(_QWORD *)(*(_QWORD *)v12 + 48) = 0;

  v15 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  *(_QWORD *)(*(_QWORD *)v12 + 56) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 152));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "reset");
  if (objc_msgSend(v2, "count"))
  {
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x2810000000;
    v37[3] = "";
    v38 = 0;
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x2020000000;
    v36 = 0;
    v36 = objc_msgSend(v2, "count");
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = v2;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v32;
      v18 = MEMORY[0x1E0C809B0];
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v32 != v17)
            objc_enumerationMutation(obj);
          v20 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j);
          v29[0] = v18;
          v29[1] = 3221225472;
          v29[2] = __84__GEOResourceManifestManager_serverProxy_didChangeActiveTileGroup_finishedCallback___block_invoke_3;
          v29[3] = &unk_1E1C0AC88;
          v29[4] = *(_QWORD *)(a1 + 32);
          v30 = v23;
          v24[0] = v18;
          v24[1] = 3221225472;
          v24[2] = __84__GEOResourceManifestManager_serverProxy_didChangeActiveTileGroup_finishedCallback___block_invoke_4;
          v24[3] = &unk_1E1C0ACB0;
          v27 = v37;
          v28 = v35;
          v25 = *(id *)(a1 + 48);
          v26 = *(id *)(a1 + 56);
          -[_GEOResourceManifestTileGroupObserverProxy forEachObserver:finished:](v20, v29, v24);

        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
      }
      while (v16);
    }

    _Block_object_dispose(v35, 8);
    _Block_object_dispose(v37, 8);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __84__GEOResourceManifestManager_serverProxy_didChangeActiveTileGroup_finishedCallback___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  os_unfair_lock_s *v4;
  id v5;
  id v6;

  v6 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "resourceManifestManagerDidChangeActiveTileGroup:", *(_QWORD *)(a1 + 32));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    os_unfair_lock_lock_with_options();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = (os_unfair_lock_s *)(v3 + 44);
    v5 = *(id *)(v3 + 24);
    os_unfair_lock_unlock(v4);
    objc_msgSend(v6, "resourceManifestManager:didChangeActiveTileGroup:fromOldTileGroup:", *(_QWORD *)(a1 + 32), v5, *(_QWORD *)(a1 + 40));

  }
}

void __84__GEOResourceManifestManager_serverProxy_didChangeActiveTileGroup_finishedCallback___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;

  os_unfair_lock_lock_with_options();
  v2 = --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32));
  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "serverQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v3, *(dispatch_block_t *)(a1 + 40));

  }
}

void __84__GEOResourceManifestManager_serverProxy_didChangeActiveTileGroup_finishedCallback___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "resourceManifestManagerWillChangeActiveTileGroup:", *(_QWORD *)(a1 + 32));

}

void __84__GEOResourceManifestManager_serverProxy_didChangeActiveTileGroup_finishedCallback___block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;

  os_unfair_lock_lock_with_options();
  v2 = --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32));
  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "serverQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v3, *(dispatch_block_t *)(a1 + 40));

  }
}

- (void)serverProxy:(id)a3 didLoadActiveTileGroup:(id)a4
{
  id v7;
  id v8;
  GEOActiveTileGroup *activeTileGroup;
  void *v10;
  void *v11;
  char v12;
  uint8_t v13[16];

  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(&self->_activeTileGroupLock);
  activeTileGroup = self->_activeTileGroup;
  if (activeTileGroup)
  {
    -[GEOActiveTileGroup uniqueIdentifier](activeTileGroup, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uniqueIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqualToString:", v11);

    if ((v12 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: [_activeTileGroup.uniqueIdentifier isEqualToString:activeTileGroup.uniqueIdentifier]", v13, 2u);
    }
    objc_storeStrong((id *)&self->_activeTileGroup, a4);
  }
  os_unfair_lock_unlock(&self->_activeTileGroupLock);
  -[GEOObserverHashTable serverProxy:didLoadActiveTileGroup:](self->_serverProxyObservers, "serverProxy:didLoadActiveTileGroup:", v8, v7);

}

- (void)serverProxyNeedsWiFiResourceActivity:(id)a3
{
  -[GEOObserverHashTable serverProxyNeedsWiFiResourceActivity:](self->_serverProxyObservers, "serverProxyNeedsWiFiResourceActivity:", a3);
}

- (void)setManifestToken:(id)a3 completionHandler:(id)a4
{
  -[GEOResourceManifestServerProxy setManifestToken:completionHandler:](self->_serverProxy, "setManifestToken:completionHandler:", a3, a4);
}

- (void)updateManifestIfNecessary:(id)a3
{
  -[GEOResourceManifestServerProxy updateIfNecessary:](self->_serverProxy, "updateIfNecessary:", a3);
}

- (void)updateManifest:(id)a3
{
  -[GEOResourceManifestManager updateManifest:completionHandler:](self, "updateManifest:completionHandler:", 0, a3);
}

- (id)updateProgress
{
  return (id)-[GEOResourceManifestServerProxy updateProgress](self->_serverProxy, "updateProgress");
}

- (void)activateResourceScenario:(int)a3
{
  -[GEOResourceManifestServerProxy activateResourceScenario:](self->_serverProxy, "activateResourceScenario:", *(_QWORD *)&a3);
}

- (void)activateResourceName:(id)a3
{
  -[GEOResourceManifestServerProxy activateResourceName:](self->_serverProxy, "activateResourceName:", a3);
}

- (void)deactivateResourceScale:(int)a3
{
  -[GEOResourceManifestServerProxy deactivateResourceScale:](self->_serverProxy, "deactivateResourceScale:", *(_QWORD *)&a3);
}

- (void)deactivateResourceScenario:(int)a3
{
  -[GEOResourceManifestServerProxy deactivateResourceScenario:](self->_serverProxy, "deactivateResourceScenario:", *(_QWORD *)&a3);
}

- (void)deactivateResourceName:(id)a3
{
  -[GEOResourceManifestServerProxy deactivateResourceName:](self->_serverProxy, "deactivateResourceName:", a3);
}

- (id)muninBucketURLForId:(unsigned __int16)a3 lod:(unsigned __int8)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = a4;
  v5 = a3;
  -[GEOResourceManifestManager activeTileGroup](self, "activeTileGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "muninBucketURLForId:lod:", v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)detailedDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", &stru_1E1C241D0);
  objc_msgSend(v3, "appendFormat:", CFSTR("Has Resource Manifest: %i\n"), -[GEOResourceManifestManager hasResourceManifest](self, "hasResourceManifest"));
  -[GEOResourceManifestManager activeTileGroup](self, "activeTileGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Active Tile Group: %@\n\n"), v4);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  GEOResourcesPath(self->_configuration);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentsOfDirectoryAtPath:error:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Downloaded Resources: %@\n\n"), v7);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  GEORegionalResourcesDirectory(self->_configuration);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentsOfDirectoryAtPath:error:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Downloaded Regional Resources: %@"), v10);

  return v3;
}

- (BOOL)hasResourceManifest
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  GEOResourceManifestPath(self->_configuration);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  return v5;
}

- (void)getResourceManifestWithHandler:(id)a3
{
  -[GEOResourceManifestServerProxy getResourceManifestWithHandler:](self->_serverProxy, "getResourceManifestWithHandler:", a3);
}

- (unsigned)activeTileGroupIdentifier
{
  void *v2;
  unsigned int v3;

  -[GEOResourceManifestManager activeTileGroup](self, "activeTileGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "identifier");

  return v3;
}

- (void)setActiveTileGroupIdentifier:(unsigned int)a3
{
  GEOResourceManifestServerProxy *serverProxy;
  id v4;

  serverProxy = self->_serverProxy;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[GEOResourceManifestServerProxy setActiveTileGroupIdentifier:](serverProxy, "setActiveTileGroupIdentifier:", v4);

}

- (void)setActiveTileGroupIdentifier:(unsigned int)a3 updateType:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v6;
  GEOResourceManifestServerProxy *serverProxy;
  void *v8;
  id v9;
  id v10;

  v6 = *(_QWORD *)&a3;
  serverProxy = self->_serverProxy;
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a5;
  objc_msgSend(v8, "numberWithUnsignedInt:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[GEOResourceManifestServerProxy setActiveTileGroupIdentifier:updateType:completionHandler:](serverProxy, "setActiveTileGroupIdentifier:updateType:completionHandler:", v10, a4, v9);

}

- (void)resetActiveTileGroup
{
  -[GEOResourceManifestServerProxy resetActiveTileGroup](self->_serverProxy, "resetActiveTileGroup");
}

- (void)_offlineStateChanged:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  GEOGetResourceManifestLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_INFO, "Online/offline state changed. Posting tile group change notifications", v5, 2u);
  }

  -[GEOResourceManifestManager _notifyObserversOfResourcesChange]((uint64_t)self);
}

void __56__GEOResourceManifestManager_startObservingDevResources__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "devResourcesFolderDidChange");

}

void __56__GEOResourceManifestManager_startObservingDevResources__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[GEOResourceManifestManager _notifyObserversOfResourcesChange]((uint64_t)WeakRetained);

}

void __63__GEOResourceManifestManager__notifyObserversOfResourcesChange__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "resourceManifestManagerWillChangeActiveTileGroup:", *(_QWORD *)(a1 + 32));

}

void __63__GEOResourceManifestManager__notifyObserversOfResourcesChange__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "resourceManifestManagerDidChangeActiveTileGroup:", *(_QWORD *)(a1 + 32));

}

void __63__GEOResourceManifestManager__notifyObserversOfResourcesChange__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  os_unfair_lock_s *v4;
  id v5;
  id v6;

  v6 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    os_unfair_lock_lock_with_options();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = (os_unfair_lock_s *)(v3 + 44);
    v5 = *(id *)(v3 + 24);
    os_unfair_lock_unlock(v4);
    objc_msgSend(v6, "resourceManifestManager:didChangeActiveTileGroup:fromOldTileGroup:", *(_QWORD *)(a1 + 32), v5, v5);

  }
}

- (void)devResourcesFolderDidChange
{
  NSObject *v2;
  dispatch_time_t v3;

  v2 = qword_1ECDBBF58;
  if (qword_1ECDBBF58)
  {
    v3 = dispatch_time(0, 1000000000);
    dispatch_source_set_timer(v2, v3, 0xFFFFFFFFFFFFFFFFLL, 1uLL);
  }
}

- (void)removeDevResources
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  +[GEOFilePaths pathFor:](GEOFilePaths, "pathFor:", 12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "fileExistsAtPath:", v3))
  {
    objc_msgSend(v4, "enumeratorAtPath:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nextObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      v8 = 0;
      do
      {
        v9 = v8;
        objc_msgSend(v3, "stringByAppendingPathComponent:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v8;
        objc_msgSend(v4, "removeItemAtPath:error:", v10, &v12);
        v8 = v12;

        objc_msgSend(v5, "nextObject");
        v11 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v11;
      }
      while (v11);

    }
  }
  -[GEOResourceManifestManager devResourcesFolderDidChange](self, "devResourcesFolderDidChange");

}

- (id)captureStatePlistWithHints:(os_state_hints_s *)a3
{
  id v4;
  const __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v30;
  id v31;
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (-[GEOResourceManifestManager hasResourceManifest](self, "hasResourceManifest"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("Has Resource Manifest"));
  os_unfair_lock_lock_with_options();
  -[GEOActiveTileGroup uniqueIdentifier](self->_activeTileGroup, "uniqueIdentifier");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[GEOActiveTileGroup environment](self->_activeTileGroup, "environment");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_activeTileGroupLock);
  -[GEOResourceManifestConfiguration environment](self->_configuration, "environment");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = CFSTR("<null>");
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("Configured Environment"));

  v11 = CFSTR("prod");
  if (v6)
  {
    v12 = v6;
  }
  else
  {
    v11 = CFSTR("<null>");
    v12 = CFSTR("<null>");
  }
  if (v7)
    v13 = v7;
  else
    v13 = v11;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("Tile Group Environment"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("Tile Group ID"));
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  GEOResourcesPath(self->_configuration);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "fileExistsAtPath:", v15);

  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    GEOResourcesPath(self->_configuration);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    objc_msgSend(v17, "contentsOfDirectoryAtPath:error:", v18, &v31);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v31;

    if (v20)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v20;
        _os_log_error_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error fetching directory contents for GEOResourcesPath for State Capture: %@", buf, 0xCu);
      }

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("Downloaded Resources"));
    }

  }
  GEORegionalResourcesDirectory(self->_configuration);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "fileExistsAtPath:", v21);

  if (v23)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    objc_msgSend(v24, "contentsOfDirectoryAtPath:error:", v21, &v30);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v30;

    if (v26)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v26;
        _os_log_error_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error fetching directory contents for GEORegionalResourcesDirectory for State Capture: %@", buf, 0xCu);
      }
    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("Downloaded Regional Resources"));
    }

  }
  +[GEOMapsAuthServiceHelper sharedAuthHelper](GEOMapsAuthServiceHelper, "sharedAuthHelper");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "dictionaryForAuthTokenState");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("Auth Token State"));

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedResourceInfoPurgeTimer, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_networkActivityHandlersIsolation, 0);
  objc_storeStrong((id *)&self->_networkActivityHandlers, 0);
  objc_storeStrong((id *)&self->_localizationRegionsInfo, 0);
  objc_storeStrong((id *)&self->_tileGroupObservers, 0);
  objc_storeStrong((id *)&self->_allRegionalResourceNames, 0);
  objc_storeStrong((id *)&self->_allResourceNames, 0);
  objc_storeStrong((id *)&self->_resourceNamesToPaths, 0);
  objc_storeStrong((id *)&self->_offlineActiveTileGroup, 0);
  objc_storeStrong((id *)&self->_activeTileGroup, 0);
  objc_storeStrong((id *)&self->_serverProxyObservers, 0);
  objc_storeStrong((id *)&self->_serverProxy, 0);
}

@end
