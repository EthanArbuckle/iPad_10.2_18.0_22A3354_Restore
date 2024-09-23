@implementation GEONetworkObserver

void __42__GEONetworkObserver__networkPathUpdated___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("GEONetworkObserverNetworkReachableNotification"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

_BYTE *__43__GEONetworkObserver_initializeIfNecessary__block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (!result[32])
    return (_BYTE *)objc_msgSend(result, "_initializeNetworkMonitor");
  return result;
}

+ (id)sharedNetworkObserver
{
  if (qword_1ECDBC080 != -1)
    dispatch_once(&qword_1ECDBC080, &__block_literal_global_94);
  return (id)_MergedGlobals_242;
}

- (BOOL)isNetworkReachable
{
  GEONetworkObserver *v2;
  NSObject *isolationQueue;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  isolationQueue = v2->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__GEONetworkObserver_isNetworkReachable__block_invoke;
  v5[3] = &unk_1E1BFF920;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)addNetworkReachableObserver:(id)a3 selector:(SEL)a4
{
  id v6;
  id v7;

  if (a3)
  {
    v6 = a3;
    -[GEONetworkObserver initializeIfNecessary](self, "initializeIfNecessary");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, a4, CFSTR("GEONetworkObserverNetworkReachableNotification"), self);

  }
}

- (void)initializeIfNecessary
{
  NSObject *isolationQueue;
  _QWORD block[5];

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__GEONetworkObserver_initializeIfNecessary__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_sync(isolationQueue, block);
}

void __43__GEONetworkObserver_sharedNetworkObserver__block_invoke()
{
  GEONetworkObserver *v0;
  void *v1;

  v0 = objc_alloc_init(GEONetworkObserver);
  v1 = (void *)_MergedGlobals_242;
  _MergedGlobals_242 = (uint64_t)v0;

}

- (GEONetworkObserver)init
{
  GEONetworkObserver *v2;
  uint64_t v3;
  OS_dispatch_queue *isolationQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEONetworkObserver;
  v2 = -[GEONetworkObserver init](&v6, sel_init);
  if (v2)
  {
    geo_dispatch_queue_create_with_qos();
    v3 = objc_claimAutoreleasedReturnValue();
    isolationQueue = v2->_isolationQueue;
    v2->_isolationQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

_BYTE *__40__GEONetworkObserver_isNetworkReachable__block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (!result[32])
  {
    objc_msgSend(result, "_initializeNetworkMonitor");
    result = *(_BYTE **)(a1 + 32);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result[33];
  return result;
}

- (void)_initializeNetworkMonitor
{
  void *v3;
  nw_endpoint_t url;
  OS_nw_path_evaluator *evaluator_for_endpoint;
  OS_nw_path_evaluator *evaluator;
  void *v7;
  uint64_t v8;
  id v9;
  id location;

  objc_initWeak(&location, self);
  _GEOGetURLWithSource(0, 0, 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    url = nw_endpoint_create_url((const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));
    if (url)
    {
      evaluator_for_endpoint = (OS_nw_path_evaluator *)nw_path_create_evaluator_for_endpoint();
      evaluator = self->_evaluator;
      self->_evaluator = evaluator_for_endpoint;

      if (self->_evaluator)
      {
        nw_path_evaluator_set_queue();
        v8 = MEMORY[0x1E0C809B0];
        objc_copyWeak(&v9, &location);
        nw_path_evaluator_set_update_handler();
        v7 = (void *)nw_path_evaluator_copy_path();
        -[GEONetworkObserver _networkPathUpdated:](self, "_networkPathUpdated:", v7, v8, 3221225472, __47__GEONetworkObserver__initializeNetworkMonitor__block_invoke, &unk_1E1C0C858);
        nw_path_evaluator_start();
        self->_initialized = 1;

        objc_destroyWeak(&v9);
      }
    }

  }
  objc_destroyWeak(&location);
}

- (void)_networkPathUpdated:(id)a3
{
  NSObject *v5;
  _BOOL4 networkReachable;
  _BOOL4 networkConstrained;
  unsigned __int32 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  BOOL v13;
  NSObject *v15;
  _BOOL4 v16;
  _BOOL4 is_expensive;
  _BOOL4 v18;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  _BOOL4 v26;
  _QWORD v27[5];
  _QWORD block[5];
  id v29;
  uint8_t buf[4];
  _BOOL4 v31;
  __int16 v32;
  _BOOL4 v33;
  __int16 v34;
  _BOOL4 v35;
  __int16 v36;
  _BOOL4 v37;
  __int16 v38;
  _BOOL4 v39;
  __int16 v40;
  _BOOL4 v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    networkReachable = self->_networkReachable;
    networkConstrained = self->_networkConstrained;
    objc_storeStrong((id *)&self->_currentPath, a3);
    v8 = nw_path_get_status(v5) & 0xFFFFFFFD;
    v9 = nw_path_uses_interface_type(v5, nw_interface_type_wifi);
    v10 = nw_path_uses_interface_type(v5, nw_interface_type_cellular);
    v11 = nw_path_uses_interface_type(v5, nw_interface_type_wired);
    v12 = v11;
    v13 = v8 == 1;
    if (v8 == 1 && !v9)
      v13 = v10 || v11;
    self->_networkReachable = v13;
    self->_networkConstrained = nw_path_is_constrained(v5);
    GEOGetNetworkStatusLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v16 = self->_networkReachable;
      is_expensive = nw_path_is_expensive((nw_path_t)self->_currentPath);
      v18 = self->_networkConstrained;
      *(_DWORD *)buf = 67241728;
      v31 = v16;
      v32 = 1026;
      v33 = v9;
      v34 = 1026;
      v35 = v10;
      v36 = 1026;
      v37 = v12;
      v38 = 1026;
      v39 = is_expensive;
      v40 = 1026;
      v41 = v18;
      v42 = 1026;
      v43 = 0;
      _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_DEBUG, "Updating with new path. Reachable: %{public}i, WiFi: %{public}i, Cellular: %{public}i, Wired: %{public}i, Expensive: %{public}i, Constrained: %{public}i, Companion: %{public}i", buf, 0x2Cu);
    }

    if (self->_networkReachable != networkReachable)
    {
      GEOGetNetworkStatusLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = self->_networkReachable;
        *(_DWORD *)buf = 67240448;
        v31 = networkReachable;
        v32 = 1026;
        v33 = v20;
        _os_log_impl(&dword_1885A9000, v19, OS_LOG_TYPE_INFO, "Network reachability changed (%{public}i -> %{public}i). Notifying observers", buf, 0xEu);
      }

      v21 = (void *)MEMORY[0x1E0C99D80];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_networkReachable);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "dictionaryWithObject:forKey:", v22, CFSTR("GEONetworkObserverReachable"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __42__GEONetworkObserver__networkPathUpdated___block_invoke;
      block[3] = &unk_1E1C00738;
      block[4] = self;
      v29 = v23;
      v24 = v23;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
    if (self->_networkConstrained != networkConstrained)
    {
      GEOGetNetworkStatusLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = self->_networkConstrained;
        *(_DWORD *)buf = 67240448;
        v31 = networkConstrained;
        v32 = 1026;
        v33 = v26;
        _os_log_impl(&dword_1885A9000, v25, OS_LOG_TYPE_INFO, "Constrained network changed (%{public}i -> %{public}i). Notifying.", buf, 0xEu);
      }

      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __42__GEONetworkObserver__networkPathUpdated___block_invoke_13;
      v27[3] = &unk_1E1BFF6F8;
      v27[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], v27);
    }
  }

}

- (void)dealloc
{
  objc_super v3;

  if (self->_evaluator)
    nw_path_evaluator_cancel();
  v3.receiver = self;
  v3.super_class = (Class)GEONetworkObserver;
  -[GEONetworkObserver dealloc](&v3, sel_dealloc);
}

void __47__GEONetworkObserver__initializeNetworkMonitor__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_networkPathUpdated:", v3);

}

void __42__GEONetworkObserver__networkPathUpdated___block_invoke_13(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("GEONetworkObserverConstrainedNetworkDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

- (BOOL)isNetworkConstrained
{
  GEONetworkObserver *v2;
  NSObject *isolationQueue;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  isolationQueue = v2->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__GEONetworkObserver_isNetworkConstrained__block_invoke;
  v5[3] = &unk_1E1BFF920;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

_BYTE *__42__GEONetworkObserver_isNetworkConstrained__block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (!result[32])
  {
    objc_msgSend(result, "_initializeNetworkMonitor");
    result = *(_BYTE **)(a1 + 32);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result[34];
  return result;
}

- (void)removeNetworkReachableObserver:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", v5, CFSTR("GEONetworkObserverNetworkReachableNotification"), self);

}

- (BOOL)_isConnectionType:(int)a3
{
  NSObject *isolationQueue;
  _QWORD block[6];
  int v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__GEONetworkObserver__isConnectionType___block_invoke;
  block[3] = &unk_1E1C0C880;
  block[4] = self;
  block[5] = &v9;
  v8 = a3;
  dispatch_sync(isolationQueue, block);
  LOBYTE(a3) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return a3;
}

BOOL __40__GEONetworkObserver__isConnectionType___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _BOOL8 result;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 32))
  {
    objc_msgSend((id)v2, "_initializeNetworkMonitor");
    v2 = *(_QWORD *)(a1 + 32);
  }
  result = nw_path_uses_interface_type(*(nw_path_t *)(v2 + 24), *(nw_interface_type_t *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isCellConnection
{
  return -[GEONetworkObserver _isConnectionType:](self, "_isConnectionType:", 2);
}

- (BOOL)isWiFiConnection
{
  return -[GEONetworkObserver _isConnectionType:](self, "_isConnectionType:", 1);
}

- (BOOL)isCompanionConnected
{
  return self->_companionConnected;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentPath, 0);
  objc_storeStrong((id *)&self->_evaluator, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

@end
