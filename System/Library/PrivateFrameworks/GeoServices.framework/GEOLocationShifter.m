@implementation GEOLocationShifter

+ (BOOL)isLocationShiftEnabled
{
  void *v2;
  char v3;

  objc_msgSend(a1, "_proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLocationShiftEnabled");

  return v3;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  notify_cancel(self->_resetPrivacyToken);
  +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeTileGroupObserver:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)GEOLocationShifter;
  -[GEOLocationShifter dealloc](&v5, sel_dealloc);
}

- (GEOLocationShifter)init
{
  GEOLocationShifter *v2;
  void *v3;
  NSMutableArray *v4;
  NSMutableArray *locationsToShift;
  void *v6;
  uint64_t v7;
  OS_dispatch_queue *queue;
  void *v9;
  uint64_t v10;
  NSCache *shiftFunctionCache;
  void *v12;
  void *global_queue;
  NSObject *v14;
  _QWORD v16[4];
  id v17;
  id location;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)GEOLocationShifter;
  v2 = -[GEOLocationShifter init](&v19, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__countryProvidersDidChange_, CFSTR("GEOCountryConfigurationProvidersDidChangeNotification"), 0);
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    locationsToShift = v2->_locationsToShift;
    v2->_locationsToShift = v4;

    objc_msgSend((id)objc_opt_class(), "_proxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    objc_msgSend((id)objc_opt_class(), "_proxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "memoryCache");
    v10 = objc_claimAutoreleasedReturnValue();
    shiftFunctionCache = v2->_shiftFunctionCache;
    v2->_shiftFunctionCache = (NSCache *)v10;

    +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    global_queue = (void *)geo_get_global_queue();
    objc_msgSend(v12, "addTileGroupObserver:queue:", v2, global_queue);

    objc_initWeak(&location, v2);
    v14 = v2->_queue;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __26__GEOLocationShifter_init__block_invoke;
    v16[3] = &unk_1E1C05280;
    objc_copyWeak(&v17, &location);
    notify_register_dispatch("com.apple.Preferences.ResetPrivacyWarningsNotification", &v2->_resetPrivacyToken, v14, v16);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

  }
  return v2;
}

+ (BOOL)isLocationShiftRequiredForCoordinate:(id)a3
{
  double var1;
  double var0;
  void *v6;
  int v7;
  void *v8;
  char v9;

  var1 = a3.var1;
  var0 = a3.var0;
  objc_msgSend(a1, "_proxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isLocationShiftEnabled");

  if (!v7)
    return 0;
  objc_msgSend(a1, "_proxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isLocationShiftRequiredForCoordinate:", var0, var1);

  return v9;
}

+ (_GEOLocationShifterProxy)_proxy
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__GEOLocationShifter__proxy__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECDBBC18 != -1)
    dispatch_once(&qword_1ECDBBC18, block);
  return (_GEOLocationShifterProxy *)(id)_MergedGlobals_207;
}

- (void)shiftCoordinate:(id)a3 accuracy:(double)a4 withCompletionHandler:(id)a5 mustGoToNetworkCallback:(id)a6 errorHandler:(id)a7 callbackQueue:(id)a8
{
  double var1;
  double var0;
  id v15;
  id v16;
  id v17;
  id v18;
  GEOLatLng *v19;

  var1 = a3.var1;
  var0 = a3.var0;
  v15 = a8;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = -[GEOLatLng initWithCoordinate:]([GEOLatLng alloc], "initWithCoordinate:", var0, var1);
  -[GEOLocationShifter shiftLatLng:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:](self, "shiftLatLng:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:", v19, v18, v17, v16, v15, a4);

}

- (void)shiftLatLng:(id)a3 accuracy:(double)a4 withCompletionHandler:(id)a5 mustGoToNetworkCallback:(id)a6 errorHandler:(id)a7 callbackQueue:(id)a8
{
  -[GEOLocationShifter shiftLatLng:accuracy:auditToken:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:](self, "shiftLatLng:accuracy:auditToken:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:", a3, 0, a5, a6, a7, a8, a4);
}

- (void)shiftLatLng:(id)a3 accuracy:(double)a4 auditToken:(id)a5 withCompletionHandler:(id)a6 mustGoToNetworkCallback:(id)a7 errorHandler:(id)a8 callbackQueue:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _GEOLocationShiftLocation *v22;

  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a3;
  v22 = -[_GEOLocationShiftLocation initWithLatLng:accuracy:completionHandler:errorHandler:mustGoToNetworkCallback:callbackQueue:auditToken:]([_GEOLocationShiftLocation alloc], "initWithLatLng:accuracy:completionHandler:errorHandler:mustGoToNetworkCallback:callbackQueue:auditToken:", v21, v19, v17, v18, v16, v20, a4);

  -[GEOLocationShifter _shiftLocation:](self, "_shiftLocation:", v22);
}

- (BOOL)_shiftLocation:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  BOOL v16;
  double v17;
  uint64_t v18;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "latLng");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "coordinate");
  v7 = v6;
  v9 = v8;

  if (objc_msgSend((id)objc_opt_class(), "isLocationShiftRequiredForCoordinate:", v7, v9))
  {
    os_unfair_lock_lock_with_options();
    -[NSCache allObjects](self->_shiftFunctionCache, "allObjects");
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if ((objc_msgSend(v15, "isValidForCoordinate:", v7, v9) & 1) != 0)
          {
            os_unfair_lock_unlock(&self->_lock);
            objc_msgSend(v4, "accuracy");
            v20 = v18;
            objc_msgSend(v15, "shiftedCoordinateForCoordinate:accuracy:", &v20, v7, v9);
            objc_msgSend(v4, "performCompletionHandlerWithShiftedCoordinate:accuracy:function:", v15);

            v16 = 1;
            goto LABEL_13;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v12)
          continue;
        break;
      }
    }

    -[NSMutableArray addObject:](self->_locationsToShift, "addObject:", v4);
    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend(v4, "performMustGoToNetwork");
    -[GEOLocationShifter _requestNextShiftFunctionIfNecessary](self, "_requestNextShiftFunctionIfNecessary");
    v16 = 0;
LABEL_13:

  }
  else
  {
    objc_msgSend(v4, "accuracy");
    objc_msgSend(v4, "performCompletionHandlerWithShiftedCoordinate:accuracy:function:", 0, v7, v9, v17);
    v16 = 0;
  }

  return v16;
}

void __28__GEOLocationShifter__proxy__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init((Class)objc_msgSend(*(id *)(a1 + 32), "proxyClass"));
  v2 = (void *)_MergedGlobals_207;
  _MergedGlobals_207 = (uint64_t)v1;

}

+ (Class)proxyClass
{
  void *v2;

  v2 = (void *)qword_1ECDBBC10;
  if (!qword_1ECDBBC10)
    v2 = (void *)objc_opt_class();
  return (Class)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_shiftFunctionCache, 0);
  objc_storeStrong((id *)&self->_locationsToShift, 0);
}

+ (void)setProxyClass:(Class)a3
{
  void *v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  id v8;
  uint8_t buf[2];
  __int16 v10;

  v4 = &unk_1EDF90F48;
  if (_MergedGlobals_207)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      v10 = 0;
      v5 = MEMORY[0x1E0C81028];
      v6 = "Assertion failed: !_shifterProxy";
      v7 = (uint8_t *)&v10;
LABEL_8:
      _os_log_fault_impl(&dword_1885A9000, v5, OS_LOG_TYPE_FAULT, v6, v7, 2u);
    }
  }
  else
  {
    v8 = v4;
    if ((-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", v4) & 1) != 0)
    {
      qword_1ECDBBC10 = (uint64_t)a3;

      return;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v5 = MEMORY[0x1E0C81028];
      v6 = "Assertion failed: [proxyClass conformsToProtocol:protocol]";
      v7 = buf;
      goto LABEL_8;
    }
  }
  __break(1u);
}

void __26__GEOLocationShifter_init__block_invoke(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v2;
  id *v3;

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained + 3;
    v3 = (id *)WeakRetained;
    os_unfair_lock_lock_with_options();
    objc_msgSend(v3[3], "removeAllObjects");
    os_unfair_lock_unlock(v2);
    WeakRetained = (os_unfair_lock_s *)v3;
  }

}

+ (unsigned)locationShiftFunctionVersion
{
  void *v2;
  unsigned int v3;

  objc_msgSend(a1, "_proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "locationShiftFunctionVersion");

  return v3;
}

- (BOOL)locationShiftEnabled
{
  return objc_msgSend((id)objc_opt_class(), "isLocationShiftEnabled");
}

- (void)_reset
{
  os_unfair_lock_s *p_lock;
  void *v4;
  id v5;
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

  v15 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_isRequestingShiftFunction = 0;
  v4 = (void *)-[NSMutableArray copy](self->_locationsToShift, "copy");
  -[NSMutableArray removeAllObjects](self->_locationsToShift, "removeAllObjects");
  -[NSCache removeAllObjects](self->_shiftFunctionCache, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4;
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
        -[GEOLocationShifter _shiftLocation:](self, "_shiftLocation:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_requestNextShiftFunctionIfNecessary
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_isRequestingShiftFunction || !-[NSMutableArray count](self->_locationsToShift, "count"))
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_isRequestingShiftFunction = 1;
    -[NSMutableArray firstObject](self->_locationsToShift, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "latLng");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_lock);
    objc_msgSend((id)objc_opt_class(), "_proxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "auditToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __58__GEOLocationShifter__requestNextShiftFunctionIfNecessary__block_invoke;
    v8[3] = &unk_1E1C06F38;
    v8[4] = self;
    objc_msgSend(v6, "shiftLatLng:auditToken:completionHandler:", v5, v7, v8);

  }
}

void __58__GEOLocationShifter__requestNextShiftFunctionIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  id obj;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  os_unfair_lock_lock_with_options();
  if (v6)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
    v7 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v50 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * i), "performErrorHandler:", v6);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
      }
      while (v10);
    }
    v13 = v8;
  }
  else
  {
    if (v5)
    {
      v14 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "UUIDString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKey:", v5, v16);

    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
    v17 = a1;
    v18 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v19 = v18;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    obj = v19;
    if (v20)
    {
      v21 = v20;
      v22 = 0;
      v23 = *(_QWORD *)v46;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v46 != v23)
            objc_enumerationMutation(obj);
          v25 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
          objc_msgSend(v25, "latLng", obj);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "coordinate");
          v27 = objc_msgSend(v5, "isValidForCoordinate:");

          if (v27)
          {
            if (!v22)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v22, "addObject:", v25);
            objc_msgSend(*(id *)(*(_QWORD *)(v17 + 32) + 16), "removeObject:", v25);
          }
        }
        v19 = obj;
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
      }
      while (v21);
    }
    else
    {
      v22 = 0;
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(v17 + 32) + 12));
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v8 = v22;
    v28 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v42;
      do
      {
        for (k = 0; k != v29; ++k)
        {
          if (*(_QWORD *)v42 != v30)
            objc_enumerationMutation(v8);
          v32 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * k);
          objc_msgSend(v32, "latLng", obj);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "coordinate");
          v35 = v34;
          v37 = v36;

          v40 = 0;
          objc_msgSend(v32, "accuracy");
          v40 = v38;
          objc_msgSend(v5, "shiftedCoordinateForCoordinate:accuracy:", &v40, v35, v37);
          objc_msgSend(v32, "performCompletionHandlerWithShiftedCoordinate:accuracy:function:", v5);
        }
        v29 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
      }
      while (v29);
    }

    objc_msgSend(*(id *)(v17 + 32), "_requestNextShiftFunctionIfNecessary");
    v13 = obj;
  }

}

- (void)shiftCoordinate:(id)a3 accuracy:(double)a4 withCompletionHandler:(id)a5
{
  double var1;
  double var0;
  id v9;
  GEOLatLng *v10;

  var1 = a3.var1;
  var0 = a3.var0;
  v9 = a5;
  v10 = -[GEOLatLng initWithCoordinate:]([GEOLatLng alloc], "initWithCoordinate:", var0, var1);
  -[GEOLocationShifter shiftLatLng:accuracy:withCompletionHandler:](self, "shiftLatLng:accuracy:withCompletionHandler:", v10, v9, a4);

}

- (void)shiftLatLng:(id)a3 accuracy:(double)a4 withCompletionHandler:(id)a5
{
  -[GEOLocationShifter shiftLatLng:accuracy:auditToken:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:](self, "shiftLatLng:accuracy:auditToken:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:", a3, 0, a5, 0, 0, MEMORY[0x1E0C80D38], a4);
}

- (BOOL)shiftCoordinate:(id)a3 accuracy:(double)a4 shiftedCoordinate:(id *)a5 shiftedAccuracy:(double *)a6
{
  GEOLatLng *v10;

  v10 = -[GEOLatLng initWithCoordinate:]([GEOLatLng alloc], "initWithCoordinate:", a3.var0, a3.var1);
  LOBYTE(a6) = -[GEOLocationShifter shiftLatLng:accuracy:shiftedCoordinate:shiftedAccuracy:](self, "shiftLatLng:accuracy:shiftedCoordinate:shiftedAccuracy:", v10, a5, a6, a4);

  return (char)a6;
}

- (BOOL)shiftLatLng:(id)a3 accuracy:(double)a4 shiftedCoordinate:(id *)a5 shiftedAccuracy:(double *)a6
{
  id v10;
  uint64_t v11;
  uint64_t v12;
  _GEOLocationShiftLocation *v13;
  _GEOLocationShiftLocation *v14;
  BOOL v15;
  _QWORD v17[7];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  double *v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  $F24F406B2B787EFB06265DBA3D28CBD5 *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;

  v10 = a3;
  v26 = 0;
  v27 = ($F24F406B2B787EFB06265DBA3D28CBD5 *)&v26;
  v28 = 0x3010000000;
  v30 = 0;
  v31 = 0;
  v29 = "";
  objc_msgSend(v10, "coordinate");
  v30 = v11;
  v31 = v12;
  v22 = 0;
  v23 = (double *)&v22;
  v24 = 0x2020000000;
  v25 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v13 = [_GEOLocationShiftLocation alloc];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __77__GEOLocationShifter_shiftLatLng_accuracy_shiftedCoordinate_shiftedAccuracy___block_invoke;
  v17[3] = &unk_1E1C06F60;
  v17[4] = &v18;
  v17[5] = &v26;
  v17[6] = &v22;
  v14 = -[_GEOLocationShiftLocation initWithLatLng:accuracy:completionHandler:errorHandler:mustGoToNetworkCallback:callbackQueue:](v13, "initWithLatLng:accuracy:completionHandler:errorHandler:mustGoToNetworkCallback:callbackQueue:", v10, v17, 0, 0, 0, a4);
  if (-[GEOLocationShifter _shiftLocation:](self, "_shiftLocation:", v14) && *((_BYTE *)v19 + 24))
  {
    if (a5)
      *a5 = v27[2];
    if (a6)
      *a6 = v23[3];
    v15 = 1;
  }
  else
  {
    v15 = 0;
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  return v15;
}

_QWORD *__77__GEOLocationShifter_shiftLatLng_accuracy_shiftedCoordinate_shiftedAccuracy___block_invoke(_QWORD *result, double a2, double a3, double a4)
{
  uint64_t v4;

  *(_BYTE *)(*(_QWORD *)(result[4] + 8) + 24) = 1;
  v4 = *(_QWORD *)(result[5] + 8);
  *(double *)(v4 + 32) = a2;
  *(double *)(v4 + 40) = a3;
  *(double *)(*(_QWORD *)(result[6] + 8) + 24) = a4;
  return result;
}

- (void)_fetchShiftFunctionForLatLng:(id)a3 auditToken:(id)a4 callbackQueue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _GEOLocationShiftLocation *v14;
  uint64_t v15;
  _GEOLocationShiftLocation *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v10 = a6;
  if (v10)
  {
    v11 = a5;
    v12 = a4;
    v13 = a3;
    v14 = [_GEOLocationShiftLocation alloc];
    v15 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __94__GEOLocationShifter__fetchShiftFunctionForLatLng_auditToken_callbackQueue_completionHandler___block_invoke;
    v22[3] = &unk_1E1C06F88;
    v23 = v10;
    v17 = v15;
    v18 = 3221225472;
    v19 = __94__GEOLocationShifter__fetchShiftFunctionForLatLng_auditToken_callbackQueue_completionHandler___block_invoke_2;
    v20 = &unk_1E1C03638;
    v21 = v23;
    v16 = -[_GEOLocationShiftLocation initWithLatLng:auditToken:functionHandler:errorHandler:callbackQueue:](v14, "initWithLatLng:auditToken:functionHandler:errorHandler:callbackQueue:", v13, v12, v22, &v17, v11);

    -[GEOLocationShifter _shiftLocation:](self, "_shiftLocation:", v16, v17, v18, v19, v20);
  }

}

uint64_t __94__GEOLocationShifter__fetchShiftFunctionForLatLng_auditToken_callbackQueue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __94__GEOLocationShifter__fetchShiftFunctionForLatLng_auditToken_callbackQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_fetchSerializedCachedShiftFunctionResponseForRequest:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  GEOPolyLocationShiftRequest *v12;
  GEOPolyLocationShiftRequest *v13;
  void *v14;
  void *v15;
  id *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD block[4];
  GEOPolyLocationShiftRequest *v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v8)
  {
    v12 = -[GEOPolyLocationShiftRequest initWithData:]([GEOPolyLocationShiftRequest alloc], "initWithData:", v8);
    v13 = v12;
    if (v12
      && (-[GEOPolyLocationShiftRequest location](v12, "location"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v14,
          v14))
    {
      -[GEOPolyLocationShiftRequest location](v13, "location");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __108__GEOLocationShifter__fetchSerializedCachedShiftFunctionResponseForRequest_callbackQueue_completionHandler___block_invoke_3;
      v17[3] = &unk_1E1C06FB0;
      v16 = &v18;
      v18 = v11;
      -[GEOLocationShifter _fetchCachedShiftFunctionResponseForLocation:callbackQueue:completionHandler:](self, "_fetchCachedShiftFunctionResponseForLocation:callbackQueue:completionHandler:", v15, v9, v17);

    }
    else
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __108__GEOLocationShifter__fetchSerializedCachedShiftFunctionResponseForRequest_callbackQueue_completionHandler___block_invoke_2;
      v19[3] = &unk_1E1C01F48;
      v16 = &v20;
      v20 = v11;
      dispatch_async(v9, v19);
    }

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __108__GEOLocationShifter__fetchSerializedCachedShiftFunctionResponseForRequest_callbackQueue_completionHandler___block_invoke;
    block[3] = &unk_1E1C01F48;
    v22 = (GEOPolyLocationShiftRequest *)v10;
    dispatch_async(v9, block);
    v13 = v22;
  }

}

void __108__GEOLocationShifter__fetchSerializedCachedShiftFunctionResponseForRequest_callbackQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -10);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __108__GEOLocationShifter__fetchSerializedCachedShiftFunctionResponseForRequest_callbackQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -10);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __108__GEOLocationShifter__fetchSerializedCachedShiftFunctionResponseForRequest_callbackQueue_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v5;
  void *v6;
  void (*v7)(uint64_t, _QWORD);
  id v8;

  v3 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    v5 = a3;
    objc_msgSend(a2, "toServerResponse");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v3 + 16))(v3, v6, v5);

  }
  else
  {
    v7 = *(void (**)(uint64_t, _QWORD))(v3 + 16);
    v8 = a3;
    v7(v3, 0);
  }

}

- (void)_fetchCachedShiftFunctionResponseForLocation:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  if (a5)
  {
    v7 = a5;
    v8 = a4;
    v9 = a3;
    objc_msgSend((id)objc_opt_class(), "_proxy");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fetchCachedShiftFunctionResponseForLocation:callbackQueue:completionHandler:", v9, v8, v7);

  }
}

+ (void)flushDiskCache
{
  id v2;

  objc_msgSend(a1, "_proxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flushDiskCache");

}

+ (void)pruneDiskCache
{
  id v2;

  objc_msgSend(a1, "_proxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pruneDiskCache");

}

- (void)getAllShiftEntries:(id)a3 queue:(id)a4 handler:(id)a5
{
  objc_msgSend((id)_MergedGlobals_207, "getAllShiftEntries:queue:handler:", a3, a4, a5);
}

@end
