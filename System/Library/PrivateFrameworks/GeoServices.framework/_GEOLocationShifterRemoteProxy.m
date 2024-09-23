@implementation _GEOLocationShifterRemoteProxy

- (BOOL)isLocationShiftEnabled
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  char v7;
  NSObject *queue;
  void *v9;
  NSObject *v10;
  void *v11;
  GEOLocationShiftingEnabledRequest *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  NSNumber *v17;
  NSNumber *shiftingEnabled;
  NSObject *v19;
  int v20;
  const __CFString *v21;
  _QWORD v23[6];
  uint8_t buf[8];
  uint8_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint8_t v30[4];
  const __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  +[GEOResourceManifestManager modernManagerNoCreate](GEOResourceManifestManager, "modernManagerNoCreate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasLoadedActiveTileGroup");

  if (v4)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOLocationShifter");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_DEBUG, "going local for location shifting state", buf, 2u);
    }

    _GEOGetURLWithSource(15, 0, 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length") != 0;

  }
  else
  {
    *(_QWORD *)buf = 0;
    v25 = buf;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__20;
    v28 = __Block_byref_object_dispose__20;
    v29 = 0;
    queue = self->_queue;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __56___GEOLocationShifterRemoteProxy_isLocationShiftEnabled__block_invoke;
    v23[3] = &unk_1E1C00760;
    v23[4] = self;
    v23[5] = buf;
    dispatch_async_and_wait(queue, v23);
    v9 = (void *)*((_QWORD *)v25 + 5);
    if (v9)
    {
      v7 = objc_msgSend(v9, "BOOLValue");
    }
    else
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "GEOLocationShifter");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v30 = 0;
        _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_DEBUG, "going to geod for location shifting state", v30, 2u);
      }

      +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 8, CFSTR("enabled"), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[GEOLocationShiftingEnabledRequest initWithTraits:auditToken:throttleToken:]([GEOLocationShiftingEnabledRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
      -[GEOXPCRequest sendSync:error:](v12, "sendSync:error:", v11, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        objc_msgSend(v13, "error");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15 == 0;

        if (v16)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v14, "enabled"));
          v17 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          shiftingEnabled = self->_shiftingEnabled;
          self->_shiftingEnabled = v17;

          GEOFindOrCreateLog("com.apple.GeoServices", "GEOLocationShifter");
          v19 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            v20 = objc_msgSend(v14, "enabled");
            v21 = CFSTR("DISABLED");
            if (v20)
              v21 = CFSTR("ENABLED");
            *(_DWORD *)v30 = 138412290;
            v31 = v21;
            _os_log_impl(&dword_1885A9000, v19, OS_LOG_TYPE_DEBUG, "Caching location shifting %@", v30, 0xCu);
          }

        }
      }
      v7 = objc_msgSend(v14, "enabled");

    }
    _Block_object_dispose(buf, 8);

  }
  return v7;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSCache)memoryCache
{
  return self->_shiftFunctionCache;
}

- (_GEOLocationShifterRemoteProxy)init
{
  _GEOLocationShifterRemoteProxy *v2;
  uint64_t v3;
  OS_dispatch_queue *queue;
  NSCache *v5;
  NSCache *shiftFunctionCache;
  void *v7;
  id v8;
  const char *v9;
  NSObject *v10;
  _QWORD v12[4];
  id v13;
  id location;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_GEOLocationShifterRemoteProxy;
  v2 = -[_GEOLocationShifterRemoteProxy init](&v15, sel_init);
  if (v2)
  {
    geo_dispatch_queue_create_with_qos();
    v3 = objc_claimAutoreleasedReturnValue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    shiftFunctionCache = v2->_shiftFunctionCache;
    v2->_shiftFunctionCache = v5;

    -[NSCache setMinimumObjectCount:](v2->_shiftFunctionCache, "setMinimumObjectCount:", GEOConfigGetUInteger(GeoServicesConfig_LocationShiftMinimumNumberToKeep, (uint64_t)off_1EDF4D1A8));
    objc_initWeak(&location, v2);
    +[GEOResourceManifestConfiguration defaultConfiguration](GEOResourceManifestConfiguration, "defaultConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    GEOActiveTileGroupChangedInternalDarwinNotificationName(v7);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = (const char *)objc_msgSend(v8, "UTF8String");
    v10 = v2->_queue;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __38___GEOLocationShifterRemoteProxy_init__block_invoke;
    v12[3] = &unk_1E1C05280;
    objc_copyWeak(&v13, &location);
    notify_register_dispatch(v9, (int *)&init_dispatchToken, v10, v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)shiftLatLng:(id)a3 auditToken:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  GEOLocationShiftingFunctionRequest *v12;
  OS_dispatch_queue *queue;
  id v14;
  _QWORD v15[4];
  id v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 8, CFSTR("shift"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[GEOLocationShiftingFunctionRequest initWithTraits:auditToken:throttleToken:]([GEOLocationShiftingFunctionRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, v9, 0);

  -[GEOLocationShiftingFunctionRequest setLatLng:](v12, "setLatLng:", v10);
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __75___GEOLocationShifterRemoteProxy_shiftLatLng_auditToken_completionHandler___block_invoke;
  v15[3] = &unk_1E1C07000;
  v16 = v8;
  v14 = v8;
  -[GEOXPCRequest send:withReply:handler:](v12, "send:withReply:handler:", v11, queue, v15);

}

- (BOOL)isLocationShiftRequiredForCoordinate:(id)a3
{
  double var1;
  double var0;
  _BOOL4 v6;
  void *v7;
  int v8;

  var1 = a3.var1;
  var0 = a3.var0;
  v6 = -[_GEOLocationShifterRemoteProxy isLocationShiftEnabled](self, "isLocationShiftEnabled");
  if (v6)
  {
    +[GEOResourceManifestManager modernManagerNoCreate](GEOResourceManifestManager, "modernManagerNoCreate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasLoadedActiveTileGroup");

    if (v8)
      LOBYTE(v6) = -[_GEOLocationShifterRemoteProxy _isLocationShiftRequiredForCoordinateInProcess:](self, "_isLocationShiftRequiredForCoordinateInProcess:", var0, var1);
    else
      LOBYTE(v6) = -[_GEOLocationShifterRemoteProxy _isLocationShiftRequiredForCoordinateViaProxy:](self, "_isLocationShiftRequiredForCoordinateViaProxy:", var0, var1);
  }
  return v6;
}

- (BOOL)isLocationShiftRequiredForRegion:(id)a3
{
  id v4;
  void *v5;
  int v6;
  BOOL v7;
  BOOL v8;

  v4 = a3;
  if (-[_GEOLocationShifterRemoteProxy isLocationShiftEnabled](self, "isLocationShiftEnabled"))
  {
    +[GEOResourceManifestManager modernManagerNoCreate](GEOResourceManifestManager, "modernManagerNoCreate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hasLoadedActiveTileGroup");

    if (v6)
      v7 = -[_GEOLocationShifterRemoteProxy _isLocationShiftRequiredForRegionInProcess:](self, "_isLocationShiftRequiredForRegionInProcess:", v4);
    else
      v7 = -[_GEOLocationShifterRemoteProxy _isLocationShiftRequiredForRegionViaProxy:](self, "_isLocationShiftRequiredForRegionViaProxy:", v4);
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_isLocationShiftRequiredForCoordinateInProcess:(id)a3
{
  double var1;
  double var0;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  var1 = a3.var1;
  var0 = a3.var0;
  v18 = *MEMORY[0x1E0C80C00];
  +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeTileGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "locationShiftEnabledRegions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v8);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "containsCoordinate:", var0, var1, (_QWORD)v13) & 1) != 0)
          {
            LOBYTE(v9) = 1;
            goto LABEL_12;
          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    LOBYTE(v9) = 1;
  }

  return v9;
}

- (BOOL)_isLocationShiftRequiredForRegionInProcess:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  double v19;
  double v20;
  double v21;
  double v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_GEOLocationShifterRemoteProxy isLocationShiftEnabled](self, "isLocationShiftEnabled"))
  {
    v5 = GEOMapRectForMapRegion(v4);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "activeTileGroup");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "locationShiftEnabledRegions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v14, "count"))
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v15 = v14;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v25;
        while (2)
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v25 != v17)
              objc_enumerationMutation(v15);
            v19 = GEOMapRectForMapRegion(*(void **)(*((_QWORD *)&v24 + 1) + 8 * i));
            if ((GEOMapRectIntersectsRect(v19, v20, v21, v22, v5, v7, v9, v11) & 1) != 0)
            {
              LOBYTE(v16) = 1;
              goto LABEL_13;
            }
          }
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          if (v16)
            continue;
          break;
        }
      }
LABEL_13:

    }
    else
    {
      LOBYTE(v16) = 1;
    }

  }
  else
  {
    LOBYTE(v16) = 0;
  }

  return v16;
}

- (BOOL)_isLocationShiftRequiredForCoordinateViaProxy:(id)a3
{
  double var1;
  double var0;
  void *v5;
  GEOLocationShiftingIsRequiredRequest *v6;
  void *v7;
  char v8;

  var1 = a3.var1;
  var0 = a3.var0;
  +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 8, CFSTR("required"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[GEOLocationShiftingIsRequiredRequest initWithTraits:auditToken:throttleToken:]([GEOLocationShiftingIsRequiredRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  -[GEOLocationShiftingIsRequiredRequest setCoordinate:](v6, "setCoordinate:", var0, var1);
  -[GEOXPCRequest sendSync:error:](v6, "sendSync:error:", v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "required");

  return v8;
}

- (BOOL)_isLocationShiftRequiredForRegionViaProxy:(id)a3
{
  id v3;
  void *v4;
  GEOLocationShiftingIsRequiredRequest *v5;
  void *v6;
  char v7;

  v3 = a3;
  +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 8, CFSTR("required"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[GEOLocationShiftingIsRequiredRequest initWithTraits:auditToken:throttleToken:]([GEOLocationShiftingIsRequiredRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  -[GEOLocationShiftingIsRequiredRequest setRegion:](v5, "setRegion:", v3);

  -[GEOXPCRequest sendSync:error:](v5, "sendSync:error:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "required");

  return v7;
}

- (unsigned)locationShiftFunctionVersion
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  unsigned int v7;
  NSObject *queue;
  void *v10;
  unsigned int v11;
  void *v12;
  GEOLocationShiftingVersionRequest *v13;
  void *v14;
  void *v15;
  void *v16;
  NSNumber *v17;
  NSNumber *shiftingFxnVersion;
  _QWORD v19[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  +[GEOResourceManifestManager modernManagerNoCreate](GEOResourceManifestManager, "modernManagerNoCreate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasLoadedActiveTileGroup");

  if (v4)
  {
    +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activeTileGroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "locationShiftVersion");

    return v7;
  }
  else
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__20;
    v24 = __Block_byref_object_dispose__20;
    v25 = 0;
    queue = self->_queue;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __62___GEOLocationShifterRemoteProxy_locationShiftFunctionVersion__block_invoke;
    v19[3] = &unk_1E1C00760;
    v19[4] = self;
    v19[5] = &v20;
    dispatch_async_and_wait(queue, v19);
    v10 = (void *)v21[5];
    if (v10)
    {
      v11 = objc_msgSend(v10, "unsignedIntValue");
    }
    else
    {
      +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 8, CFSTR("version"), 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[GEOLocationShiftingVersionRequest initWithTraits:auditToken:throttleToken:]([GEOLocationShiftingVersionRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
      -[GEOXPCRequest sendSync:error:](v13, "sendSync:error:", v12, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        objc_msgSend(v14, "error");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v15, "version"));
          v17 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          shiftingFxnVersion = self->_shiftingFxnVersion;
          self->_shiftingFxnVersion = v17;

        }
      }
      v11 = objc_msgSend(v15, "version");

    }
    _Block_object_dispose(&v20, 8);

    return v11;
  }
}

- (void)flushDiskCache
{
  GEOLocationShiftingFlushCacheRequest *v2;
  id v3;

  +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 8, CFSTR("flush"), 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = -[GEOLocationShiftingFlushCacheRequest initWithTraits:auditToken:throttleToken:]([GEOLocationShiftingFlushCacheRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  -[GEOXPCRequest send:](v2, "send:", v3);

}

- (void)pruneDiskCache
{
  GEOLocationShiftingPruneCacheRequest *v2;
  id v3;

  +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 8, CFSTR("prune"), 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = -[GEOLocationShiftingPruneCacheRequest initWithTraits:auditToken:throttleToken:]([GEOLocationShiftingPruneCacheRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  -[GEOXPCRequest send:](v2, "send:", v3);

}

- (void)getAllShiftEntries:(id)a3 queue:(id)a4 handler:(id)a5
{
  NSObject *v7;
  id v8;
  void *v9;
  GEOLocationShiftingListCacheRequest *v10;
  OS_dispatch_queue *queue;
  NSObject *v12;
  id v13;
  _QWORD v14[4];
  NSObject *v15;
  id v16;

  v7 = a3;
  v8 = a5;
  +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 8, CFSTR("list"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[GEOLocationShiftingListCacheRequest initWithTraits:auditToken:throttleToken:]([GEOLocationShiftingListCacheRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  dispatch_group_enter(v7);
  queue = self->_queue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __67___GEOLocationShifterRemoteProxy_getAllShiftEntries_queue_handler___block_invoke;
  v14[3] = &unk_1E1C07028;
  v15 = v7;
  v16 = v8;
  v12 = v7;
  v13 = v8;
  -[GEOXPCRequest send:withReply:handler:](v10, "send:withReply:handler:", v9, queue, v14);

}

- (void)fetchCachedShiftFunctionResponseForLocation:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  GEOLocationShiftingCachedResponseFetchRequest *v10;
  OS_dispatch_queue *queue;
  id v12;
  _QWORD v13[4];
  id v14;

  v7 = a5;
  v8 = a3;
  +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 8, CFSTR("shift"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[GEOLocationShiftingCachedResponseFetchRequest initWithTraits:auditToken:throttleToken:]([GEOLocationShiftingCachedResponseFetchRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  -[GEOLocationShiftingCachedResponseFetchRequest setLatLng:](v10, "setLatLng:", v8);

  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __110___GEOLocationShifterRemoteProxy_fetchCachedShiftFunctionResponseForLocation_callbackQueue_completionHandler___block_invoke;
  v13[3] = &unk_1E1C07050;
  v14 = v7;
  v12 = v7;
  -[GEOXPCRequest send:withReply:handler:](v10, "send:withReply:handler:", v9, queue, v13);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shiftFunctionCache, 0);
  objc_storeStrong((id *)&self->_shiftingFxnVersion, 0);
  objc_storeStrong((id *)&self->_shiftingEnabled, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
