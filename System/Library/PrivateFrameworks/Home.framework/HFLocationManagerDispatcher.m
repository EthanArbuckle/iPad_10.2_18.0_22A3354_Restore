@implementation HFLocationManagerDispatcher

void __35__HFLocationManagerDispatcher_init__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = objc_alloc(MEMORY[0x1E0C9E3C8]);
  HFPlatformSpecificHomeAppBundleID();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithEffectiveBundleIdentifier:delegate:onQueue:", v3, v4, v5);
  objc_msgSend(*(id *)(a1 + 32), "setLocationManager:", v6);

  v7 = *(void **)(a1 + 32);
  objc_msgSend(v7, "locationManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_updateCachedAuthorizationStatus:", objc_msgSend(v8, "authorizationStatus"));

}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (NAFuture)authorizationStatusFuture
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  id v6;

  v3 = -[HFLocationManagerDispatcher hasInitializedAuthorizationStatus](self, "hasInitializedAuthorizationStatus");
  v4 = (void *)MEMORY[0x1E0D519C0];
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[HFLocationManagerDispatcher cachedAuthorizationStatus](self, "cachedAuthorizationStatus"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "futureWithResult:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    -[HFLocationManagerDispatcher pendingAuthorizationStatusFutures](self, "pendingAuthorizationStatusFutures");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);
  }

  return (NAFuture *)v6;
}

- (int)authorizationStatus
{
  uint64_t v3;
  void *v4;
  void *v5;

  LODWORD(v3) = -[HFLocationManagerDispatcher cachedAuthorizationStatus](self, "cachedAuthorizationStatus");
  if (!-[HFLocationManagerDispatcher hasInitializedAuthorizationStatus](self, "hasInitializedAuthorizationStatus"))
  {
    v4 = (void *)MEMORY[0x1E0C9E3C8];
    HFPlatformSpecificHomeAppBundleID();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "authorizationStatusForBundleIdentifier:", v5);

    -[HFLocationManagerDispatcher _updateCachedAuthorizationStatus:](self, "_updateCachedAuthorizationStatus:", v3);
  }
  return v3;
}

- (BOOL)hasInitializedAuthorizationStatus
{
  return self->_hasInitializedAuthorizationStatus;
}

- (int)cachedAuthorizationStatus
{
  return self->_cachedAuthorizationStatus;
}

+ (HFLocationManagerDispatcher)sharedDispatcher
{
  if (_MergedGlobals_217 != -1)
    dispatch_once(&_MergedGlobals_217, &__block_literal_global_3);
  return (HFLocationManagerDispatcher *)(id)qword_1ED378D10;
}

void __87__HFLocationManagerDispatcher_dispatchLocationManagerObserverMessage_withBlock_sender___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  uint64_t v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "locationObservers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        HFLogForCategory(0x2AuLL);
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v16 = v8;
          _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "observer:%@", buf, 0xCu);
        }

        if (v8 != *(_QWORD *)(a1 + 40) && (objc_opt_respondsToSelector() & 1) != 0)
        {
          HFLogForCategory(0x2AuLL);
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v16 = v8;
            _os_log_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_DEFAULT, "observer responds to selector:%@", buf, 0xCu);
          }

          (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    }
    while (v5);
  }

}

uint64_t __69__HFLocationManagerDispatcher_locationManagerDidChangeAuthorization___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "locationManagerDidChangeAuthorization:", *(_QWORD *)(a1 + 32));
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (+[HFUtilities isAMac](HFUtilities, "isAMac")
    || +[HFUtilities isAVisionPro](HFUtilities, "isAVisionPro"))
  {
    -[HFLocationManagerDispatcher _updateMacAuthorizationStatus:](self, "_updateMacAuthorizationStatus:", objc_msgSend(v5, "authorizationStatus"));
  }
  HFLogForCategory(0x2AuLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v11 = v5;
    v12 = 1024;
    v13 = objc_msgSend(v5, "authorizationStatus");
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "locationManagerDidChangeAuthorization: %@ status: %d", buf, 0x12u);
  }

  -[HFLocationManagerDispatcher _updateCachedAuthorizationStatus:](self, "_updateCachedAuthorizationStatus:", objc_msgSend(v5, "authorizationStatus"));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__HFLocationManagerDispatcher_locationManagerDidChangeAuthorization___block_invoke;
  v8[3] = &unk_1EA728BB0;
  v9 = v5;
  v7 = v5;
  -[HFLocationManagerDispatcher dispatchLocationManagerObserverMessage:withBlock:sender:](self, "dispatchLocationManagerObserverMessage:withBlock:sender:", a2, v8, 0);

}

- (void)_updateCachedAuthorizationStatus:(int)a3
{
  void *v5;
  _QWORD v6[5];
  int v7;

  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__HFLocationManagerDispatcher__updateCachedAuthorizationStatus___block_invoke;
  v6[3] = &unk_1EA728AC0;
  v7 = a3;
  v6[4] = self;
  objc_msgSend(v5, "performBlock:", v6);

}

- (void)dispatchLocationManagerObserverMessage:(SEL)a3 withBlock:(id)a4 sender:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  SEL v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  HFLogForCategory(0x2AuLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[HFLocationManagerDispatcher locationObservers](self, "locationObservers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v19 = v11;
    _os_log_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_DEFAULT, "all observers:%@", buf, 0xCu);

  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __87__HFLocationManagerDispatcher_dispatchLocationManagerObserverMessage_withBlock_sender___block_invoke;
  v14[3] = &unk_1EA728B10;
  v14[4] = self;
  v15 = v9;
  v16 = v8;
  v17 = a3;
  v12 = v8;
  v13 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], v14);

}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFLocationManagerDispatcher locationObservers](self, "locationObservers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (NSHashTable)locationObservers
{
  return self->_locationObservers;
}

void __64__HFLocationManagerDispatcher__updateCachedAuthorizationStatus___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  const char *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  int v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x2AuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_DWORD *)(a1 + 40);
    v4 = "unavailable";
    if ((v3 - 3) < 2)
      v4 = "available";
    *(_DWORD *)buf = 67109378;
    v10 = v3;
    v11 = 2080;
    v12 = v4;
    _os_log_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_DEFAULT, "Updating location services authorization status to %d (%s)", buf, 0x12u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setHasInitializedAuthorizationStatus:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setCachedAuthorizationStatus:", *(unsigned int *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "pendingAuthorizationStatusFutures");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__HFLocationManagerDispatcher__updateCachedAuthorizationStatus___block_invoke_16;
  v7[3] = &__block_descriptor_36_e18_v16__0__NAFuture_8l;
  v8 = *(_DWORD *)(a1 + 40);
  objc_msgSend(v5, "na_each:", v7);

  objc_msgSend(*(id *)(a1 + 32), "pendingAuthorizationStatusFutures");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

}

- (NSMutableArray)pendingAuthorizationStatusFutures
{
  return self->_pendingAuthorizationStatusFutures;
}

- (void)setHasInitializedAuthorizationStatus:(BOOL)a3
{
  self->_hasInitializedAuthorizationStatus = a3;
}

- (void)setCachedAuthorizationStatus:(int)a3
{
  self->_cachedAuthorizationStatus = a3;
}

- (id)getAuthorizationStatusAsync
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v2 = (void *)MEMORY[0x1E0D519C0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__HFLocationManagerDispatcher_getAuthorizationStatusAsync__block_invoke;
  v6[3] = &unk_1EA728A78;
  v6[4] = self;
  objc_msgSend(MEMORY[0x1E0D519E8], "globalAsyncScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithBlock:scheduler:", v6, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __47__HFLocationManagerDispatcher_sharedDispatcher__block_invoke_2()
{
  HFLocationManagerDispatcher *v0;
  void *v1;

  v0 = objc_alloc_init(HFLocationManagerDispatcher);
  v1 = (void *)qword_1ED378D10;
  qword_1ED378D10 = (uint64_t)v0;

}

- (HFLocationManagerDispatcher)init
{
  HFLocationManagerDispatcher *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  NSMutableArray *pendingAuthorizationStatusFutures;
  uint64_t v8;
  NSHashTable *locationObservers;
  NSObject *v10;
  CLLocationManager *locationManager;
  NSObject *v12;
  NSHashTable *v13;
  NSObject *v14;
  _QWORD block[4];
  HFLocationManagerDispatcher *v17;
  objc_super v18;
  uint8_t buf[4];
  HFLocationManagerDispatcher *v20;
  __int16 v21;
  CLLocationManager *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)HFLocationManagerDispatcher;
  v2 = -[HFLocationManagerDispatcher init](&v18, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)0xFFFF8000, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.Home.LocationDispatcher", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = objc_opt_new();
    pendingAuthorizationStatusFutures = v2->_pendingAuthorizationStatusFutures;
    v2->_pendingAuthorizationStatusFutures = (NSMutableArray *)v6;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v8 = objc_claimAutoreleasedReturnValue();
    locationObservers = v2->_locationObservers;
    v2->_locationObservers = (NSHashTable *)v8;

    HFLogForCategory(0x2AuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      locationManager = v2->_locationManager;
      *(_DWORD *)buf = 138412546;
      v20 = v2;
      v21 = 2112;
      v22 = locationManager;
      _os_log_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_DEFAULT, "Initialized location manager dispatcher: %@ with manager: %@", buf, 0x16u);
    }

    HFLogForCategory(0x2AuLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v2->_locationObservers;
      *(_DWORD *)buf = 138412290;
      v20 = (HFLocationManagerDispatcher *)v13;
      _os_log_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_DEFAULT, "Initializing location observers: %@", buf, 0xCu);
    }

    -[HFLocationManagerDispatcher queue](v2, "queue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__HFLocationManagerDispatcher_init__block_invoke;
    block[3] = &unk_1EA727DD8;
    v17 = v2;
    dispatch_async(v14, block);

  }
  return v2;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

void __58__HFLocationManagerDispatcher_getAuthorizationStatusAsync__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "numberWithInt:", objc_msgSend(v3, "authorizationStatus"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishWithResult:", v5);

}

- (void)dealloc
{
  void *v3;
  dispatch_time_t v4;
  NSObject *v5;
  objc_super v6;
  _QWORD block[4];
  id v8;

  -[HFLocationManagerDispatcher locationManager](self, "locationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = dispatch_time(0, 1000000000);
    -[HFLocationManagerDispatcher queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__HFLocationManagerDispatcher_dealloc__block_invoke;
    block[3] = &unk_1EA727DD8;
    v8 = v3;
    dispatch_after(v4, v5, block);

  }
  v6.receiver = self;
  v6.super_class = (Class)HFLocationManagerDispatcher;
  -[HFLocationManagerDispatcher dealloc](&v6, sel_dealloc);
}

void __64__HFLocationManagerDispatcher__updateCachedAuthorizationStatus___block_invoke_16(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  v3 = *(unsigned int *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "numberWithInt:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishWithResult:", v5);

}

- (void)triggerLocationFetch
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[HFLocationManagerDispatcher queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__HFLocationManagerDispatcher_triggerLocationFetch__block_invoke;
  v4[3] = &unk_1EA728AE8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __51__HFLocationManagerDispatcher_triggerLocationFetch__block_invoke(uint64_t a1)
{
  void *v1;
  int v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "locationManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "locationServicesEnabled");

  if (v2)
  {
    objc_msgSend(WeakRetained, "locationManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "requestLocation");

  }
}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFLocationManagerDispatcher locationObservers](self, "locationObservers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v7 = a3;
  v8 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__HFLocationManagerDispatcher_locationManager_didUpdateLocations___block_invoke;
  v11[3] = &unk_1EA728B38;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  -[HFLocationManagerDispatcher dispatchLocationManagerObserverMessage:withBlock:sender:](self, "dispatchLocationManagerObserverMessage:withBlock:sender:", a2, v11, 0);

}

uint64_t __66__HFLocationManagerDispatcher_locationManager_didUpdateLocations___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "locationManager:didUpdateLocations:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)locationManager:(id)a3 didUpdateHeading:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  HFLogForCategory(0x2AuLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v8;
    _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "didUpdateHeading: %@", buf, 0xCu);
  }

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__HFLocationManagerDispatcher_locationManager_didUpdateHeading___block_invoke;
  v12[3] = &unk_1EA728B38;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  -[HFLocationManagerDispatcher dispatchLocationManagerObserverMessage:withBlock:sender:](self, "dispatchLocationManagerObserverMessage:withBlock:sender:", a2, v12, 0);

}

uint64_t __64__HFLocationManagerDispatcher_locationManager_didUpdateHeading___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "locationManager:didUpdateHeading:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  int64_t v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  HFLogForCategory(0x2AuLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v19 = a4;
    v20 = 2112;
    v21 = v10;
    _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "didDetermineState: %d forRegion: %@", buf, 0x12u);
  }

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __75__HFLocationManagerDispatcher_locationManager_didDetermineState_forRegion___block_invoke;
  v14[3] = &unk_1EA728B60;
  v16 = v10;
  v17 = a4;
  v15 = v9;
  v12 = v10;
  v13 = v9;
  -[HFLocationManagerDispatcher dispatchLocationManagerObserverMessage:withBlock:sender:](self, "dispatchLocationManagerObserverMessage:withBlock:sender:", a2, v14, 0);

}

uint64_t __75__HFLocationManagerDispatcher_locationManager_didDetermineState_forRegion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "locationManager:didDetermineState:forRegion:", a1[4], a1[6], a1[5]);
}

- (void)locationManager:(id)a3 didRangeBeacons:(id)a4 inRegion:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  HFLogForCategory(0x2AuLL);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v21 = v10;
    v22 = 2112;
    v23 = v11;
    _os_log_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_DEFAULT, "didRangeBeacons: %@ inRegion: %@", buf, 0x16u);
  }

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __72__HFLocationManagerDispatcher_locationManager_didRangeBeacons_inRegion___block_invoke;
  v16[3] = &unk_1EA728B88;
  v17 = v9;
  v18 = v10;
  v19 = v11;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  -[HFLocationManagerDispatcher dispatchLocationManagerObserverMessage:withBlock:sender:](self, "dispatchLocationManagerObserverMessage:withBlock:sender:", a2, v16, 0);

}

uint64_t __72__HFLocationManagerDispatcher_locationManager_didRangeBeacons_inRegion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "locationManager:didRangeBeacons:inRegion:", a1[4], a1[5], a1[6]);
}

- (void)locationManager:(id)a3 rangingBeaconsDidFailForRegion:(id)a4 withError:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  HFLogForCategory(0x2AuLL);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v21 = v10;
    v22 = 2112;
    v23 = v11;
    _os_log_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_DEFAULT, "rangingBeaconsDidFailForRegion: %@ withError: %@", buf, 0x16u);
  }

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __88__HFLocationManagerDispatcher_locationManager_rangingBeaconsDidFailForRegion_withError___block_invoke;
  v16[3] = &unk_1EA728B88;
  v17 = v9;
  v18 = v10;
  v19 = v11;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  -[HFLocationManagerDispatcher dispatchLocationManagerObserverMessage:withBlock:sender:](self, "dispatchLocationManagerObserverMessage:withBlock:sender:", a2, v16, 0);

}

uint64_t __88__HFLocationManagerDispatcher_locationManager_rangingBeaconsDidFailForRegion_withError___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "locationManager:rangingBeaconsDidFailForRegion:withError:", a1[4], a1[5], a1[6]);
}

- (void)locationManager:(id)a3 didEnterRegion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  HFLogForCategory(0x2AuLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v8;
    _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "didEnterRegion: %@", buf, 0xCu);
  }

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__HFLocationManagerDispatcher_locationManager_didEnterRegion___block_invoke;
  v12[3] = &unk_1EA728B38;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  -[HFLocationManagerDispatcher dispatchLocationManagerObserverMessage:withBlock:sender:](self, "dispatchLocationManagerObserverMessage:withBlock:sender:", a2, v12, 0);

}

uint64_t __62__HFLocationManagerDispatcher_locationManager_didEnterRegion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "locationManager:didEnterRegion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)locationManager:(id)a3 didExitRegion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  HFLogForCategory(0x2AuLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v8;
    _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "didExitRegion: %@", buf, 0xCu);
  }

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __61__HFLocationManagerDispatcher_locationManager_didExitRegion___block_invoke;
  v12[3] = &unk_1EA728B38;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  -[HFLocationManagerDispatcher dispatchLocationManagerObserverMessage:withBlock:sender:](self, "dispatchLocationManagerObserverMessage:withBlock:sender:", a2, v12, 0);

}

uint64_t __61__HFLocationManagerDispatcher_locationManager_didExitRegion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "locationManager:didExitRegion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  HFLogForCategory(0x2AuLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v8;
    _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "didFailWithError: %@", buf, 0xCu);
  }

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__HFLocationManagerDispatcher_locationManager_didFailWithError___block_invoke;
  v12[3] = &unk_1EA728B38;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  -[HFLocationManagerDispatcher dispatchLocationManagerObserverMessage:withBlock:sender:](self, "dispatchLocationManagerObserverMessage:withBlock:sender:", a2, v12, 0);

}

uint64_t __64__HFLocationManagerDispatcher_locationManager_didFailWithError___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "locationManager:didFailWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  HFLogForCategory(0x2AuLL);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v21 = v10;
    v22 = 2112;
    v23 = v11;
    _os_log_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_DEFAULT, "monitoringDidFailForRegion: %@ withError: %@", buf, 0x16u);
  }

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __84__HFLocationManagerDispatcher_locationManager_monitoringDidFailForRegion_withError___block_invoke;
  v16[3] = &unk_1EA728B88;
  v17 = v9;
  v18 = v10;
  v19 = v11;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  -[HFLocationManagerDispatcher dispatchLocationManagerObserverMessage:withBlock:sender:](self, "dispatchLocationManagerObserverMessage:withBlock:sender:", a2, v16, 0);

}

uint64_t __84__HFLocationManagerDispatcher_locationManager_monitoringDidFailForRegion_withError___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "locationManager:monitoringDidFailForRegion:withError:", a1[4], a1[5], a1[6]);
}

- (void)locationManager:(id)a3 didStartMonitoringForRegion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  HFLogForCategory(0x2AuLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v8;
    _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "didStartMonitoringForRegion: %@", buf, 0xCu);
  }

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75__HFLocationManagerDispatcher_locationManager_didStartMonitoringForRegion___block_invoke;
  v12[3] = &unk_1EA728B38;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  -[HFLocationManagerDispatcher dispatchLocationManagerObserverMessage:withBlock:sender:](self, "dispatchLocationManagerObserverMessage:withBlock:sender:", a2, v12, 0);

}

uint64_t __75__HFLocationManagerDispatcher_locationManager_didStartMonitoringForRegion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "locationManager:didStartMonitoringForRegion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)locationManagerDidPauseLocationUpdates:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  v5 = a3;
  HFLogForCategory(0x2AuLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "DidPauseLocationUpdates", buf, 2u);
  }

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__HFLocationManagerDispatcher_locationManagerDidPauseLocationUpdates___block_invoke;
  v8[3] = &unk_1EA728BB0;
  v9 = v5;
  v7 = v5;
  -[HFLocationManagerDispatcher dispatchLocationManagerObserverMessage:withBlock:sender:](self, "dispatchLocationManagerObserverMessage:withBlock:sender:", a2, v8, 0);

}

uint64_t __70__HFLocationManagerDispatcher_locationManagerDidPauseLocationUpdates___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "locationManagerDidPauseLocationUpdates:", *(_QWORD *)(a1 + 32));
}

- (void)locationManagerDidResumeLocationUpdates:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  v5 = a3;
  HFLogForCategory(0x2AuLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "DidResumeLocationUpdates", buf, 2u);
  }

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__HFLocationManagerDispatcher_locationManagerDidResumeLocationUpdates___block_invoke;
  v8[3] = &unk_1EA728BB0;
  v9 = v5;
  v7 = v5;
  -[HFLocationManagerDispatcher dispatchLocationManagerObserverMessage:withBlock:sender:](self, "dispatchLocationManagerObserverMessage:withBlock:sender:", a2, v8, 0);

}

uint64_t __71__HFLocationManagerDispatcher_locationManagerDidResumeLocationUpdates___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "locationManagerDidResumeLocationUpdates:", *(_QWORD *)(a1 + 32));
}

- (void)locationManager:(id)a3 didFinishDeferredUpdatesWithError:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  HFLogForCategory(0x2AuLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v8;
    _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "didFinishDeferredUpdatesWithError: %@", buf, 0xCu);
  }

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __81__HFLocationManagerDispatcher_locationManager_didFinishDeferredUpdatesWithError___block_invoke;
  v12[3] = &unk_1EA728B38;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  -[HFLocationManagerDispatcher dispatchLocationManagerObserverMessage:withBlock:sender:](self, "dispatchLocationManagerObserverMessage:withBlock:sender:", a2, v12, 0);

}

uint64_t __81__HFLocationManagerDispatcher_locationManager_didFinishDeferredUpdatesWithError___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "locationManager:didFinishDeferredUpdatesWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void)setLocationObservers:(id)a3
{
  objc_storeStrong((id *)&self->_locationObservers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingAuthorizationStatusFutures, 0);
  objc_storeStrong((id *)&self->_locationObservers, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
