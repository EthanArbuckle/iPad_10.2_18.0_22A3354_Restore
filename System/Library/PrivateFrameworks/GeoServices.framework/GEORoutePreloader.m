@implementation GEORoutePreloader

- (GEORoutePreloader)init
{
  GEORoutePreloader *result;

  result = (GEORoutePreloader *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEORoutePreloader)initWithRoute:(id)a3 strategies:(id)a4
{
  return -[GEORoutePreloader initWithRoute:strategies:auditToken:](self, "initWithRoute:strategies:auditToken:", a3, a4, 0);
}

- (GEORoutePreloader)initWithRoute:(id)a3 strategies:(id)a4 auditToken:(id)a5
{
  id v9;
  id v10;
  id v11;
  GEORoutePreloader *v12;
  uint64_t v13;
  OS_dispatch_queue *workQueue;
  uint64_t v15;
  geo_isolater *deviceQualitiesIsolation;
  uint64_t v17;
  NSArray *strategies;
  NSArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  GEORoutePreloader *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if ((objc_msgSend(v9, "isOfflineRoute") & 1) != 0)
  {
    v25 = 0;
  }
  else
  {
    v31.receiver = self;
    v31.super_class = (Class)GEORoutePreloader;
    v12 = -[GEORoutePreloader init](&v31, sel_init);
    if (v12)
    {
      v13 = geo_dispatch_queue_create();
      workQueue = v12->_workQueue;
      v12->_workQueue = (OS_dispatch_queue *)v13;

      v15 = geo_isolater_create();
      deviceQualitiesIsolation = v12->_deviceQualitiesIsolation;
      v12->_deviceQualitiesIsolation = (geo_isolater *)v15;

      objc_storeStrong((id *)&v12->_route, a3);
      objc_storeStrong((id *)&v12->_auditToken, a5);
      v12->_networkQuality = 4;
      v12->_batteryNotificationToken = -1;
      v17 = objc_msgSend(v10, "copy");
      strategies = v12->_strategies;
      v12->_strategies = (NSArray *)v17;

      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v19 = v12->_strategies;
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v28 != v22)
              objc_enumerationMutation(v19);
            v24 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
            objc_msgSend(v24, "setPreloader:", v12, (_QWORD)v27);
            objc_msgSend(v24, "updateWithRoute:routeMatch:", v12->_route, 0);
          }
          v21 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        }
        while (v21);
      }

    }
    self = v12;
    v25 = self;
  }

  return v25;
}

- (void)tearDown
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __29__GEORoutePreloader_tearDown__block_invoke;
  v2[3] = &unk_1E1BFF6F8;
  v2[4] = self;
  GEOOnce((uint64_t)&self->_didTearDown, v2);
}

void __29__GEORoutePreloader_tearDown__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__GEORoutePreloader_tearDown__block_invoke_2;
  block[3] = &unk_1E1BFF6F8;
  block[4] = v1;
  dispatch_sync(v2, block);
}

uint64_t __29__GEORoutePreloader_tearDown__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performTearDown");
}

- (void)dealloc
{
  objc_super v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __28__GEORoutePreloader_dealloc__block_invoke;
  v4[3] = &unk_1E1BFF6F8;
  v4[4] = self;
  GEOOnce((uint64_t)&self->_didTearDown, v4);
  v3.receiver = self;
  v3.super_class = (Class)GEORoutePreloader;
  -[GEORoutePreloader dealloc](&v3, sel_dealloc);
}

uint64_t __28__GEORoutePreloader_dealloc__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  GEOGetRoutePreloaderLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_FAULT, "Client did not tear down instance. -dealloc was called without a call to -tearDown", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_performTearDown");
}

- (void)_performTearDown
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  GEORoutePreloaderStatisticsInfo *statistics;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  +[GEOTileLoader modernLoader](GEOTileLoader, "modernLoader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

  -[GEORoutePreloader _unregisterForNetworkQualityObservation](self, "_unregisterForNetworkQualityObservation");
  -[GEORoutePreloader _unregisterForBatteryStatusChanges](self, "_unregisterForBatteryStatusChanges");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_strategies;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "performTearDown", (_QWORD)v10);
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  statistics = self->_statistics;
  -[GEOComposedRoute distance](self->_route, "distance");
  -[GEORoutePreloaderStatisticsInfo finishAndReportIfNecessaryForDistance:](statistics, "finishAndReportIfNecessaryForDistance:");
}

- (void)stop
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__GEORoutePreloader_stop__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __25__GEORoutePreloader_stop__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stop");
}

- (void)_stop
{
  void *v3;
  void *v4;
  NSArray *v5;
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
  if (self->_running)
  {
    self->_running = 0;
    +[GEOTileLoader modernLoader](GEOTileLoader, "modernLoader");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unregisterObserver:", self);

    +[GEONetworkObserver sharedNetworkObserver](GEONetworkObserver, "sharedNetworkObserver");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeNetworkReachableObserver:", self);

    -[GEORoutePreloader _unregisterForBatteryStatusChanges](self, "_unregisterForBatteryStatusChanges");
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = self->_strategies;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "stop", (_QWORD)v10);
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (void)start
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__GEORoutePreloader_start__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __26__GEORoutePreloader_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_start");
}

- (void)_start
{
  void *v3;
  GEORoutePreloaderStatisticsInfo *v4;
  GEORoutePreloaderStatisticsInfo *statistics;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_running)
    -[GEORoutePreloader _stop](self, "_stop");
  +[GEOTileLoader modernLoader](GEOTileLoader, "modernLoader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerObserver:", self);

  -[GEORoutePreloader _registerForNetworkQualityObservation](self, "_registerForNetworkQualityObservation");
  -[GEORoutePreloader _registerForBatteryStatusChanges](self, "_registerForBatteryStatusChanges");
  if (!self->_statistics)
  {
    v4 = -[GEORoutePreloaderStatisticsInfo initWithTransportType:]([GEORoutePreloaderStatisticsInfo alloc], "initWithTransportType:", -[GEOComposedRoute transportType](self->_route, "transportType"));
    statistics = self->_statistics;
    self->_statistics = v4;

  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_strategies;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "start", (_QWORD)v11);
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)updateWithRouteMatch:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  GEORoutePreloader *v9;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__GEORoutePreloader_updateWithRouteMatch___block_invoke;
  v7[3] = &unk_1E1C00738;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

void __42__GEORoutePreloader_updateWithRouteMatch___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[8];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "route");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 24);

  if (v2 != v3)
  {
    GEOGetRoutePreloaderLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_INFO, "Active route changed", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "route");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(void **)(v6 + 24);
    *(_QWORD *)(v6 + 24) = v5;

  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = *(id *)(*(_QWORD *)(a1 + 40) + 16);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if (v2 == v3)
          objc_msgSend(v13, "updateWithRouteMatch:", *(_QWORD *)(a1 + 32), (_QWORD)v14);
        else
          objc_msgSend(v13, "updateWithRoute:routeMatch:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), *(_QWORD *)(a1 + 32));
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v10);
  }

}

- (unint64_t)networkQuality
{
  unint64_t networkQuality;
  geo_isolater *v5;

  v5 = self->_deviceQualitiesIsolation;
  _geo_isolate_lock_data();
  networkQuality = self->_networkQuality;
  _geo_isolate_unlock();

  return networkQuality;
}

- (void)_registerForNetworkQualityObservation
{
  NSObject *v3;
  void *v4;
  uint8_t buf[16];

  GEOGetRoutePreloaderLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "[NetworkQuality] Listening for network reachability changes", buf, 2u);
  }

  +[GEONetworkObserver sharedNetworkObserver](GEONetworkObserver, "sharedNetworkObserver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addNetworkReachableObserver:selector:", self, sel__networkReachabilityChanged_);

  geo_isolate_sync();
}

void __58__GEORoutePreloader__registerForNetworkQualityObservation__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  +[GEONetworkObserver sharedNetworkObserver](GEONetworkObserver, "sharedNetworkObserver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isNetworkReachable");

  if ((v3 & 1) != 0)
  {
    +[GEONetworkObserver sharedNetworkObserver](GEONetworkObserver, "sharedNetworkObserver");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isCellConnection");

    v6 = *(_QWORD *)(a1 + 32);
    if (v5)
      v7 = 4;
    else
      v7 = 6;
    if (*(_BYTE *)(v6 + 76))
      ++v7;
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 1;
  }
  *(_QWORD *)(v6 + 40) = v7;
}

- (void)_unregisterForNetworkQualityObservation
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  GEOGetRoutePreloaderLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "[NetworkQuality] No longer listening for network reachability changes", v5, 2u);
  }

  +[GEONetworkObserver sharedNetworkObserver](GEONetworkObserver, "sharedNetworkObserver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeNetworkReachableObserver:", self);

}

- (void)_networkReachabilityChanged:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  GEORoutePreloader *v9;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__GEORoutePreloader__networkReachabilityChanged___block_invoke;
  v7[3] = &unk_1E1C00738;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

void __49__GEORoutePreloader__networkReachabilityChanged___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  uint64_t v19;
  uint8_t *v20;
  uint64_t *v21;
  char v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t v27[128];
  uint8_t buf[8];
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("GEONetworkObserverReachable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "BOOLValue");
  GEOGetRoutePreloaderLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v4;
    _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_INFO, "[NetworkQuality] Network reachability changed: %i", buf, 8u);
  }

  *(_QWORD *)buf = 0;
  v29 = buf;
  v30 = 0x2020000000;
  v31 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v6 = *(_QWORD *)(a1 + 40);
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __49__GEORoutePreloader__networkReachabilityChanged___block_invoke_13;
  v18 = &unk_1E1C052A8;
  v19 = v6;
  v20 = buf;
  v22 = v4;
  v21 = &v23;
  geo_isolate_sync_data();
  if (*((_QWORD *)v29 + 3) != v24[3])
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v7 = *(id *)(*(_QWORD *)(a1 + 40) + 16);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v27, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "observedNetworkQualityDidChangeFrom:to:", *((_QWORD *)v29 + 3), v24[3], (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v27, 16);
      }
      while (v8);
    }

  }
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(buf, 8);

}

void __49__GEORoutePreloader__networkReachabilityChanged___block_invoke_13(uint64_t a1)
{
  void *v2;
  char v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  if (*(_BYTE *)(a1 + 56) != (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) == 1))
  {
    if (*(_BYTE *)(a1 + 56))
    {
      +[GEONetworkObserver sharedNetworkObserver](GEONetworkObserver, "sharedNetworkObserver");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v2, "isCellConnection");

      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      if ((v3 & 1) != 0)
        v5 = 4;
      else
        v5 = 6;
      if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 76))
        ++v5;
    }
    else
    {
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v5 = 1;
    }
    *(_QWORD *)(v4 + 24) = v5;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }
}

- (void)updateObservedNetworkPerformanceForDownload:(unint64_t)a3 duration:(double)a4
{
  NSObject *workQueue;
  _QWORD block[7];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__GEORoutePreloader_updateObservedNetworkPerformanceForDownload_duration___block_invoke;
  block[3] = &unk_1E1BFFD08;
  block[4] = self;
  block[5] = a3;
  *(double *)&block[6] = a4;
  dispatch_async(workQueue, block);
}

uint64_t __74__GEORoutePreloader_updateObservedNetworkPerformanceForDownload_duration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateObservedNetworkPerformanceForDownload:duration:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
}

- (void)_updateObservedNetworkPerformanceForDownload:(unint64_t)a3 duration:(double)a4
{
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  GEORoutePreloader *v17;
  uint64_t *v18;
  uint64_t *v19;
  unint64_t v20;
  double v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __75__GEORoutePreloader__updateObservedNetworkPerformanceForDownload_duration___block_invoke;
  v16 = &unk_1E1C05258;
  v17 = self;
  v18 = &v26;
  v21 = a4;
  v19 = &v22;
  v20 = a3;
  geo_isolate_sync_data();
  if (v27[3] != v23[3])
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v5 = self->_strategies;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v9, v30, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "observedNetworkQualityDidChangeFrom:to:", v27[3], v23[3], (_QWORD)v9);
        }
        while (v6 != v8);
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v9, v30, 16);
      }
      while (v6);
    }

  }
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
}

void __75__GEORoutePreloader__updateObservedNetworkPerformanceForDownload_duration___block_invoke(uint64_t a1)
{
  unint64_t v2;
  double v3;
  NSObject *v4;
  unint64_t v5;
  double v6;
  BOOL v7;
  uint64_t v8;
  unint64_t v9;
  double v10;
  NSObject *v11;
  unint64_t v12;
  double v13;
  int v14;
  unint64_t v15;
  __int16 v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) & 0xFFFFFFFFFFFFFFFELL;
  if (v2 == 2)
  {
    v9 = *(_QWORD *)(a1 + 56);
    if (v9)
    {
      v10 = *(double *)(a1 + 64);
      if (v10 < 5.0 || (double)v9 / 1000.0 / v10 > 20.0)
      {
        GEOGetRoutePreloaderLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v12 = *(_QWORD *)(a1 + 56);
          v13 = (double)v12 / 1000.0 / *(double *)(a1 + 64);
          v14 = 134349312;
          v15 = v12;
          v16 = 2048;
          v17 = v13;
          _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_INFO, "[NetworkQuality] Loaded %{public,bytes}llu with network data rate of %.1fKB/s. Transitioning to good network quality", (uint8_t *)&v14, 0x16u);
        }

        v7 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 76) == 0;
        v8 = 4;
        goto LABEL_14;
      }
    }
LABEL_17:
    v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    goto LABEL_18;
  }
  if (v2 != 4)
    goto LABEL_17;
  v3 = *(double *)(a1 + 64);
  if (v3 < 10.0 || (double)*(unint64_t *)(a1 + 56) / 1000.0 / v3 >= 5.0)
    goto LABEL_17;
  GEOGetRoutePreloaderLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 56);
    v6 = (double)v5 / 1000.0 / *(double *)(a1 + 64);
    v14 = 134349312;
    v15 = v5;
    v16 = 2048;
    v17 = v6;
    _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_INFO, "[NetworkQuality] Loaded %{public,bytes}llu with network data rate of %.1fKB/s. Transitioning to bad network quality", (uint8_t *)&v14, 0x16u);
  }

  v7 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 76) == 0;
  v8 = 2;
LABEL_14:
  if (!v7)
    ++v8;
LABEL_18:
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v8;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
}

- (void)updateObservedNetworkPerformanceWithServerError
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__GEORoutePreloader_updateObservedNetworkPerformanceWithServerError__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

void __68__GEORoutePreloader_updateObservedNetworkPerformanceWithServerError__block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(_QWORD *);
  void *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v2 = *(_QWORD *)(a1 + 32);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __68__GEORoutePreloader_updateObservedNetworkPerformanceWithServerError__block_invoke_2;
  v14 = &unk_1E1C00788;
  v15 = v2;
  v16 = &v22;
  v17 = &v18;
  geo_isolate_sync_data();
  if (v23[3] != v19[3])
  {
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v3 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v26, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v8;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v8 != v5)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "observedNetworkQualityDidChangeFrom:to:", v23[3], v19[3], (_QWORD)v7);
        }
        while (v4 != v6);
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v26, 16);
      }
      while (v4);
    }

  }
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
}

void __68__GEORoutePreloader_updateObservedNetworkPerformanceWithServerError__block_invoke_2(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint8_t v4[16];

  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_QWORD *)(a1[4] + 40);
  if ((*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    GEOGetRoutePreloaderLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_INFO, "[NetworkQuality] Server error encountered while on good network. Transitioning to bad network.", v4, 2u);
    }

    v3 = 2;
    if (*(_BYTE *)(a1[4] + 76))
      v3 = 3;
  }
  else
  {
    v3 = *(_QWORD *)(a1[4] + 40);
  }
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v3;
  *(_QWORD *)(a1[4] + 40) = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
}

- (BOOL)isPluggedIn
{
  GEORoutePreloader *v2;
  geo_isolater *v4;

  v2 = self;
  v4 = self->_deviceQualitiesIsolation;
  _geo_isolate_lock_data();
  LOBYTE(v2) = v2->_pluggedIn;
  _geo_isolate_unlock();

  return (char)v2;
}

- (void)_registerForBatteryStatusChanges
{
  NSObject *v3;
  int *p_batteryNotificationToken;
  NSObject *workQueue;
  NSObject *v6;
  uint8_t v7[8];
  _QWORD handler[4];
  id v9;
  id buf[2];

  GEOGetRoutePreloaderLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "[BatteryState] Observing battery state", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  p_batteryNotificationToken = &self->_batteryNotificationToken;
  workQueue = self->_workQueue;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __53__GEORoutePreloader__registerForBatteryStatusChanges__block_invoke;
  handler[3] = &unk_1E1C05280;
  objc_copyWeak(&v9, buf);
  if (notify_register_dispatch("com.apple.system.powersources.source", &self->_batteryNotificationToken, workQueue, handler))
  {
    GEOGetRoutePreloaderLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_ERROR, "[BatteryState] Failed to register observer", v7, 2u);
    }

    *p_batteryNotificationToken = -1;
  }
  else
  {
    -[GEORoutePreloader _updateBatteryState](self, "_updateBatteryState");
  }
  objc_destroyWeak(&v9);
  objc_destroyWeak(buf);
}

void __53__GEORoutePreloader__registerForBatteryStatusChanges__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateBatteryState");

}

- (void)_unregisterForBatteryStatusChanges
{
  NSObject *v3;
  uint8_t v4[16];

  notify_cancel(self->_batteryNotificationToken);
  self->_batteryNotificationToken = -1;
  GEOGetRoutePreloaderLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "[BatteryState] No longer observing battery state", v4, 2u);
  }

}

- (void)_updateBatteryState
{
  int v3;
  NSObject *v4;
  const __CFString *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  GEORoutePreloader *v18;
  uint64_t *v19;
  uint64_t *v20;
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t v30[128];
  uint8_t buf[4];
  const __CFString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = IOPSDrawingUnlimitedPower();
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __40__GEORoutePreloader__updateBatteryState__block_invoke;
  v17 = &unk_1E1C052A8;
  v21 = v3;
  v18 = self;
  v19 = &v26;
  v20 = &v22;
  geo_isolate_sync_data();
  GEOGetRoutePreloaderLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = CFSTR("battery");
    if (v3)
      v5 = CFSTR("power");
    *(_DWORD *)buf = 138543362;
    v32 = v5;
    _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_INFO, "[BatteryState] Updated battery state: %{public}@", buf, 0xCu);
  }

  if (v23[3] != v27[3])
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v6 = self->_strategies;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v30, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "observedNetworkQualityDidChangeFrom:to:", v27[3], v23[3], (_QWORD)v10);
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v30, 16);
      }
      while (v7);
    }

  }
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
}

uint64_t __40__GEORoutePreloader__updateBatteryState__block_invoke(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(*(_QWORD *)(result + 32) + 76) = *(_BYTE *)(result + 56);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 40);
  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 40);
  if (*(_BYTE *)(result + 56))
  {
    switch(v1)
    {
      case 2:
        v1 = 3;
        break;
      case 6:
        v1 = 7;
        break;
      case 4:
        v1 = 5;
        break;
    }
  }
  else
  {
    switch(v1)
    {
      case 3:
        v1 = 2;
        break;
      case 7:
        v1 = 6;
        break;
      case 5:
        v1 = 4;
        break;
    }
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24) = v1;
  *(_QWORD *)(*(_QWORD *)(result + 32) + 40) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24);
  return result;
}

- (void)tileLoader:(void *)a3 loadedTileKey:(_BYTE *)a4 sizeInBytes:(uint64_t)a5 fromSource:(uint64_t)a6 withOptions:(char)a7
{
  id v12;
  int v13;

  v12 = a3;
  if ((a7 & 4) == 0 && (*a4 & 0x7F) != 8)
  {
    v13 = 0;
    if (GEOTileKeyStyle((uint64_t)a4, &v13))
    {
      switch(v13)
      {
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 11:
        case 12:
        case 13:
        case 14:
        case 15:
        case 16:
        case 17:
        case 18:
        case 19:
        case 20:
        case 21:
        case 22:
        case 23:
        case 24:
        case 25:
        case 26:
        case 27:
        case 28:
        case 29:
        case 30:
        case 31:
        case 32:
        case 33:
        case 34:
        case 35:
        case 36:
        case 37:
        case 38:
        case 39:
        case 40:
        case 41:
        case 42:
        case 43:
        case 44:
        case 45:
        case 46:
        case 47:
        case 48:
        case 52:
        case 53:
        case 54:
        case 55:
        case 56:
        case 57:
        case 58:
        case 59:
        case 60:
        case 61:
        case 62:
        case 63:
        case 64:
        case 65:
        case 66:
        case 67:
        case 68:
        case 69:
        case 70:
        case 71:
        case 72:
        case 73:
        case 74:
        case 75:
        case 76:
        case 77:
        case 79:
        case 80:
        case 81:
        case 82:
        case 83:
        case 87:
        case 88:
        case 89:
        case 90:
        case 91:
        case 92:
        case 93:
        case 94:
        case 95:
        case 96:
        case 97:
        case 98:
        case 99:
        case 100:
        case 101:
        case 102:
        case 103:
        case 104:
        case 105:
        case 106:
        case 107:
        case 108:
        case 109:
        case 110:
        case 111:
        case 112:
        case 113:
        case 114:
        case 115:
        case 116:
        case 117:
        case 118:
        case 119:
          objc_msgSend(*(id *)(a1 + 80), "incrementTileLoadStatistic:amount:", 6, 1, v12);
          if (a6 == 2)
            objc_msgSend(*(id *)(a1 + 80), "missedTileKey:loadedSuccessfully:sizeInBytes:", a4, 1, a5);
          break;
        default:
          break;
      }
    }
  }

}

- (void)tileLoader:(void *)a3 failedTileKey:(_BYTE *)a4 error:(void *)a5 withOptions:(char)a6
{
  id v10;
  id v11;
  int v12;

  v11 = a3;
  v10 = a5;
  if ((a6 & 4) == 0 && (*a4 & 0x7F) != 8)
  {
    v12 = 0;
    if (GEOTileKeyStyle((uint64_t)a4, &v12))
    {
      switch(v12)
      {
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 11:
        case 12:
        case 13:
        case 14:
        case 15:
        case 16:
        case 17:
        case 18:
        case 19:
        case 20:
        case 21:
        case 22:
        case 23:
        case 24:
        case 25:
        case 26:
        case 27:
        case 28:
        case 29:
        case 30:
        case 31:
        case 32:
        case 33:
        case 34:
        case 35:
        case 36:
        case 37:
        case 38:
        case 39:
        case 40:
        case 41:
        case 42:
        case 43:
        case 44:
        case 45:
        case 46:
        case 47:
        case 48:
        case 52:
        case 53:
        case 54:
        case 55:
        case 56:
        case 57:
        case 58:
        case 59:
        case 60:
        case 61:
        case 62:
        case 63:
        case 64:
        case 65:
        case 66:
        case 67:
        case 68:
        case 69:
        case 70:
        case 71:
        case 72:
        case 73:
        case 74:
        case 75:
        case 76:
        case 77:
        case 79:
        case 80:
        case 81:
        case 82:
        case 83:
        case 87:
        case 88:
        case 89:
        case 90:
        case 91:
        case 92:
        case 93:
        case 94:
        case 95:
        case 96:
        case 97:
        case 98:
        case 99:
        case 100:
        case 101:
        case 102:
        case 103:
        case 104:
        case 105:
        case 106:
        case 107:
        case 108:
        case 109:
        case 110:
        case 111:
        case 112:
        case 113:
        case 114:
        case 115:
        case 116:
        case 117:
        case 118:
        case 119:
          objc_msgSend(*(id *)(a1 + 80), "incrementTileLoadStatistic:amount:", 6, 1, v11);
          if ((a6 & 2) != 0)
            objc_msgSend(*(id *)(a1 + 80), "missedTileKey:loadedSuccessfully:sizeInBytes:", a4, 0, 0);
          break;
        default:
          break;
      }
    }
  }

}

- (void)preloadStrategy:(uint64_t)a3 loadedTileKey:(uint64_t)a4 source:(uint64_t)a5 sizeInBytes:(uint64_t)a6
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 80), "loadedTileKey:source:sizeInBytes:", a4, a5, a6);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  objc_msgSend(WeakRetained, "routePreloader:loadedTileKey:source:", a1, a4, a5);

}

- (void)preloadStrategy:(uint64_t)a3 failedToLoadTileKey:(uint64_t)a4 error:(void *)a5
{
  id *v7;
  id v8;
  id WeakRetained;

  v7 = (id *)(a1 + 88);
  v8 = a5;
  WeakRetained = objc_loadWeakRetained(v7);
  objc_msgSend(WeakRetained, "routePreloader:failedToLoadTileKey:error:", a1, a4, v8);

}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (GEOApplicationAuditToken)auditToken
{
  return self->_auditToken;
}

- (GEORoutePreloaderDelegate)delegate
{
  return (GEORoutePreloaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_statistics, 0);
  objc_storeStrong((id *)&self->_deviceQualitiesIsolation, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_strategies, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)incrementTileLoadStatistic:(int64_t)a3 amount:(unint64_t)a4
{
  -[GEORoutePreloaderStatisticsInfo incrementTileLoadStatistic:amount:](self->_statistics, "incrementTileLoadStatistic:amount:", a3, a4);
}

@end
