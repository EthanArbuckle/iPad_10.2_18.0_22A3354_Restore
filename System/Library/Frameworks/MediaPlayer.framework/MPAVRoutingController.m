@implementation MPAVRoutingController

void __83__MPAVRoutingController_fetchAvailableRoutesWithCompletionQueue_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "getRoutesForCategory:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  objc_msgSend(*(id *)(a1 + 32), "setCachedRoutes:", v3);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __83__MPAVRoutingController_fetchAvailableRoutesWithCompletionQueue_completionHandler___block_invoke_2;
  v7[3] = &unk_1E3162560;
  v4 = *(NSObject **)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

- (void)setCachedRoutes:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  msv_dispatch_sync_on_queue();

}

+ (void)getActiveRouteWithCompletion:(id)a3
{
  objc_msgSend(a1, "getActiveRouteWithTimeout:completion:", a3, 0.0);
}

- (void)setDiscoveryMode:(int64_t)a3
{
  self->_discoveryMode = a3;
  -[MPAVRoutingDataSource setDiscoveryMode:](self->_dataSource, "setDiscoveryMode:");
}

+ (void)getActiveRouteWithTimeout:(double)a3 completion:(id)a4
{
  id v6;

  v6 = a4;
  objc_msgSend(a1, "_getActiveRouteWithTimeout:type:completion:", objc_msgSend(a1, "activeRouteType"), v6, a3);

}

+ (void)_getActiveRouteWithTimeout:(double)a3 type:(int64_t)a4 completion:(id)a5
{
  id v5;
  id v6;
  void *v7;

  v5 = a5;
  if (_getActiveRouteWithTimeout_type_completion__onceToken != -1)
    dispatch_once(&_getActiveRouteWithTimeout_type_completion__onceToken, &__block_literal_global_105);
  v7 = v5;
  v6 = v5;
  MRAVEndpointResolveActiveSystemEndpointWithType();

}

void __36__MPAVRoutingController_systemRoute__block_invoke()
{
  MPAVEndpointRoute *v0;
  void *v1;

  v0 = -[MPAVEndpointRoute initWithEndpoint:]([MPAVEndpointRoute alloc], "initWithEndpoint:", MRAVEndpointGetLocalEndpoint());
  v1 = (void *)systemRoute_systemRoute;
  systemRoute_systemRoute = (uint64_t)v0;

}

- (MPAVRoutingController)initWithName:(id)a3
{
  id v4;
  MPAVOutputDeviceRoutingDataSource *v5;
  MPAVRoutingController *v6;

  v4 = a3;
  v5 = objc_alloc_init(MPAVOutputDeviceRoutingDataSource);
  v6 = -[MPAVRoutingController initWithDataSource:name:](self, "initWithDataSource:name:", v5, v4);

  return v6;
}

- (MPAVRoutingController)initWithDataSource:(id)a3 name:(id)a4
{
  id v7;
  id v8;
  MPAVRoutingController *v9;
  MPAVRoutingController *v10;
  uint64_t v11;
  NSString *name;
  MPAVRoutingControllerSelectionQueue *v13;
  MPAVRoutingControllerSelectionQueue *routingControllerSelectionQueue;
  dispatch_queue_t v15;
  OS_dispatch_queue *serialQueue;
  MPAVRoutingController *v17;
  _QWORD v19[5];
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)MPAVRoutingController;
  v9 = -[MPAVRoutingController init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_alwaysAllowUpdates = 1;
    objc_storeStrong((id *)&v9->_dataSource, a3);
    v11 = objc_msgSend(v8, "copy");
    name = v10->_name;
    v10->_name = (NSString *)v11;

    v10->_discoveryMode = 0;
    v10->_routeTypes = -1;
    v13 = -[MPAVRoutingControllerSelectionQueue initWithRoutingController:]([MPAVRoutingControllerSelectionQueue alloc], "initWithRoutingController:", v10);
    routingControllerSelectionQueue = v10->_routingControllerSelectionQueue;
    v10->_routingControllerSelectionQueue = v13;

    v15 = dispatch_queue_create("com.apple.MediaPlayer.MPAVRoutingController/serialQueue", 0);
    serialQueue = v10->_serialQueue;
    v10->_serialQueue = (OS_dispatch_queue *)v15;

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __49__MPAVRoutingController_initWithDataSource_name___block_invoke;
    v19[3] = &unk_1E315D7F8;
    v19[4] = v10;
    v17 = v10;
    v17->_stateHandle = __49__MPAVRoutingController_initWithDataSource_name___block_invoke((uint64_t)v19);
    -[MPAVRoutingController _registerNotifications](v17, "_registerNotifications");

  }
  return v10;
}

uint64_t __49__MPAVRoutingController_initWithDataSource_name___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v6;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  dispatch_get_global_queue(0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(), *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_copyWeak(&v6, &location);
  v4 = MSVLogAddStateHandler();
  objc_destroyWeak(&v6);

  objc_destroyWeak(&location);
  return v4;
}

void __68__MPAVRoutingController__getActiveRouteWithTimeout_type_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  MPAVEndpointRoute *v4;
  void *v5;
  MPAVRouteConnection *v6;
  MPAVEndpointRoute *v7;
  MPAVEndpointRoute *v8;
  MPAVEndpointRoute *v9;

  +[MPAVRoutingController systemRoute](MPAVRoutingController, "systemRoute");
  v4 = (MPAVEndpointRoute *)objc_claimAutoreleasedReturnValue();
  if (!a2 || MRAVEndpointGetLocalEndpoint() == a2)
  {
    v7 = v4;
  }
  else
  {
    v8 = -[MPAVEndpointRoute initWithEndpoint:]([MPAVEndpointRoute alloc], "initWithEndpoint:", a2);

    MRAVEndpointGetExternalDevice();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = -[MPAVRouteConnection initWithExternalDeviceObject:]([MPAVRouteConnection alloc], "initWithExternalDeviceObject:", v5);
      -[MPAVEndpointRoute setConnection:](v8, "setConnection:", v6);

    }
    v7 = v8;
  }
  v9 = v7;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (MPAVRoute)systemRoute
{
  if (systemRoute_onceToken != -1)
    dispatch_once(&systemRoute_onceToken, &__block_literal_global_95);
  return (MPAVRoute *)(id)systemRoute_systemRoute;
}

void __68__MPAVRoutingController__getActiveRouteWithTimeout_type_completion___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x1E0D4C770], 0, 0, &__block_literal_global_108);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_getActiveRouteWithTimeout_type_completion____activeRouteNotificationObserver;
  _getActiveRouteWithTimeout_type_completion____activeRouteNotificationObserver = v0;

}

uint64_t __83__MPAVRoutingController_fetchAvailableRoutesWithCompletionQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_registerNotifications
{
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__pickableRoutesDidChangeNotification_, CFSTR("MPAVRoutingDataSourceRoutesDidChangeNotification"), self->_dataSource);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__routeStatusDidChangeNotification_, CFSTR("MPAVRoutingDataSourceFailureNotification"), self->_dataSource);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__volumeControlAvailabilityDidChangeNotification_, CFSTR("MPAVRoutingDataSourceVolumeControlAvailabilityDidChangeNotification"), self->_dataSource);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__externalScreenTypeDidChangeNotification_, CFSTR("MPAVRoutingDataSourceExternalScreenTypeDidChangeNotification"), self->_dataSource);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__activeAudioRouteDidChangeNotification_, CFSTR("MPAVRoutingDataSourceActiveAudioRouteDidChangeNotification"), self->_dataSource);
  objc_initWeak(&location, self);
  objc_msgSend((id)objc_opt_class(), "_sharedWorkerQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__MPAVRoutingController__registerNotifications__block_invoke;
  v5[3] = &unk_1E315E6B0;
  objc_copyWeak(&v6, &location);
  notify_register_dispatch("com.apple.airplay.deviceAvailability", &self->_deviceAvailabilityNotifyToken, v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __43__MPAVRoutingController_cachedPickedRoutes__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setFetchAvailableRoutesSynchronously:(BOOL)a3
{
  self->_fetchAvailableRoutesSynchronously = a3;
}

uint64_t __43__MPAVRoutingController_alwaysAllowUpdates__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 80);
  return result;
}

void __36__MPAVRoutingController_pickedRoute__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 136));
}

uint64_t __62__MPAVRoutingController__pickableRoutesDidChangeNotification___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62__MPAVRoutingController__pickableRoutesDidChangeNotification___block_invoke_2;
  v3[3] = &unk_1E3163530;
  v3[4] = v1;
  return objc_msgSend(v1, "fetchAvailableRoutesWithCompletionQueue:completionHandler:", MEMORY[0x1E0C80D38], v3);
}

- (void)_pickableRoutesDidChangeNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  objc_msgSend((id)objc_opt_class(), "_sharedWorkerQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__MPAVRoutingController__pickableRoutesDidChangeNotification___block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)fetchAvailableRoutesWithCompletionQueue:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_msgSend((id)objc_opt_class(), "_sharedWorkerQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83__MPAVRoutingController_fetchAvailableRoutesWithCompletionQueue_completionHandler___block_invoke;
    block[3] = &unk_1E3161780;
    block[4] = self;
    v10 = v6;
    v11 = v7;
    dispatch_async(v8, block);

  }
}

+ (id)_sharedWorkerQueue
{
  if (_sharedWorkerQueue_onceToken != -1)
    dispatch_once(&_sharedWorkerQueue_onceToken, &__block_literal_global_8687);
  return (id)_sharedWorkerQueue___sharedWorkerQueue;
}

- (void)_scheduleSendDelegateRoutesChanged
{
  _QWORD block[5];

  if (-[MPAVRoutingController _shouldSendDelegateRoutesChanged](self, "_shouldSendDelegateRoutesChanged"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__MPAVRoutingController__scheduleSendDelegateRoutesChanged__block_invoke;
    block[3] = &unk_1E3163508;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

- (BOOL)_shouldSendDelegateRoutesChanged
{
  void *v3;
  void *v4;
  int v5;
  _BOOL4 v6;

  -[MPAVRoutingController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "didReceiveDiscoveryResults") & 1) == 0)
  {

    goto LABEL_7;
  }
  -[MPAVRoutingController dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasActiveAudioCategory");

  if (!v5)
  {
LABEL_7:
    LOBYTE(v6) = 0;
    return v6;
  }
  if (-[MPAVRoutingController discoveryMode](self, "discoveryMode")
    || (v6 = -[MPAVRoutingController alwaysAllowUpdates](self, "alwaysAllowUpdates")))
  {
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (MPAVRoutingDataSource)dataSource
{
  return self->_dataSource;
}

- (int64_t)discoveryMode
{
  return self->_discoveryMode;
}

- (BOOL)alwaysAllowUpdates
{
  char v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  msv_dispatch_sync_on_queue();
  v2 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __57__MPAVRoutingController__sendDelegatePickedRoutesChanged__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 88));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(v2, "pickedRoute");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "routingController:pickedRouteDidChange:", v2, v3);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "pickedRoutes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "routingController:pickedRoutesDidChange:", v4, v5);

  }
}

- (MPAVRoute)pickedRoute
{
  void *v3;
  NSObject *serialQueue;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint8_t buf[4];
  MPAVRoutingController *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[MPAVRoutingController pickedRoutes](self, "pickedRoutes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__8481;
  v16 = __Block_byref_object_dispose__8482;
  v17 = 0;
  serialQueue = self->_serialQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __36__MPAVRoutingController_pickedRoute__block_invoke;
  v11[3] = &unk_1E3163580;
  v11[4] = self;
  v11[5] = &v12;
  dispatch_sync(serialQueue, v11);
  v5 = (void *)v13[5];
  if (v5)
  {
    v6 = v5;
  }
  else
  {
    objc_msgSend(v3, "firstObject");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  v8 = os_log_create("com.apple.amp.mediaplayer", "Routing");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v7, "routeName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = self;
    v20 = 2114;
    v21 = v9;
    _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ returning single pickedRoute: %{public}@", buf, 0x16u);

  }
  _Block_object_dispose(&v12, 8);

  return (MPAVRoute *)v7;
}

- (NSArray)pickedRoutes
{
  void *v3;
  uint64_t v4;

  -[MPAVRoutingController cachedPickedRoutes](self, "cachedPickedRoutes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count")
    && -[MPAVRoutingController fetchAvailableRoutesSynchronously](self, "fetchAvailableRoutesSynchronously"))
  {
    -[MPAVRoutingController _syncUpdateRoutes](self, "_syncUpdateRoutes");
    -[MPAVRoutingController cachedPickedRoutes](self, "cachedPickedRoutes");
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return (NSArray *)v3;
}

- (id)cachedPickedRoutes
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__8481;
  v8 = __Block_byref_object_dispose__8482;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

- (BOOL)fetchAvailableRoutesSynchronously
{
  return self->_fetchAvailableRoutesSynchronously;
}

void __59__MPAVRoutingController__scheduleSendDelegateRoutesChanged__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 88));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "routingControllerAvailableRoutesDidChange:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 33) = 0;

}

uint64_t __62__MPAVRoutingController__pickableRoutesDidChangeNotification___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_sendDelegatePickedRoutesChanged");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "pickedRouteDidChange");
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleSendDelegateRoutesChanged");
}

- (void)_sendDelegatePickedRoutesChanged
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__MPAVRoutingController__sendDelegatePickedRoutesChanged__block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __41__MPAVRoutingController_setCachedRoutes___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  v5 = os_log_create("com.apple.amp.mediaplayer", "Routing");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(v6 + 8), "valueForKey:", CFSTR("routeName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v6;
    v18 = 2112;
    v19 = v8;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ updated routes: [%@]", (uint8_t *)&v16, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_pickedRoutesInArray:", *(_QWORD *)(a1 + 40));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = v9;

  v12 = os_log_create("com.apple.amp.mediaplayer", "Routing");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(v13 + 16), "valueForKey:", CFSTR("routeName"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "componentsJoinedByString:", CFSTR(", "));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v13;
    v18 = 2112;
    v19 = v15;
    _os_log_impl(&dword_193B9B000, v12, OS_LOG_TYPE_DEBUG, "%{public}@ updated picked routes: [%@]", (uint8_t *)&v16, 0x16u);

  }
}

- (id)_pickedRoutesInArray:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "isPicked", (_QWORD)v12))
          objc_msgSend(v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

void __43__MPAVRoutingController__sharedWorkerQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.MediaPlayer.MPAVRoutingController/sharedWorkerQueue", v2);
  v1 = (void *)_sharedWorkerQueue___sharedWorkerQueue;
  _sharedWorkerQueue___sharedWorkerQueue = (uint64_t)v0;

}

void __59__MPAVRoutingController__scheduleSendDelegateRoutesChanged__block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 33))
  {
    *(_BYTE *)(v1 + 33) = 1;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__MPAVRoutingController__scheduleSendDelegateRoutesChanged__block_invoke_2;
    block[3] = &unk_1E3163508;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

- (int64_t)activeRouteType
{
  if (self->_presentedBundleID)
    return MRActiveEndpointTypeForBundleIdentifier();
  else
    return objc_msgSend((id)objc_opt_class(), "activeRouteType");
}

- (MPAVRoutingController)init
{
  MPAVOutputDeviceRoutingDataSource *v3;
  MPAVRoutingController *v4;

  v3 = objc_alloc_init(MPAVOutputDeviceRoutingDataSource);
  v4 = -[MPAVRoutingController initWithDataSource:name:](self, "initWithDataSource:name:", v3, 0);

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  MEMORY[0x194038908](self->_stateHandle, a2);
  -[MPAVRoutingController _unregisterNotifications](self, "_unregisterNotifications");
  v3.receiver = self;
  v3.super_class = (Class)MPAVRoutingController;
  -[MPAVRoutingController dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  NSString *name;
  void *v4;
  uint64_t v5;
  uint64_t v7;

  name = self->_name;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_opt_class();
  if (name)
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ %p \"%@\" dataSource=%@>"), v5, self, self->_name, self->_dataSource);
  else
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ %p dataSource=%@>"), v5, self, self->_dataSource, v7);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setAlwaysAllowUpdates:(BOOL)a3
{
  msv_dispatch_sync_on_queue();
}

- (id)cachedRoutes
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__8481;
  v8 = __Block_byref_object_dispose__8482;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

- (NSArray)availableRoutes
{
  void *v3;
  void *v4;
  NSArray *v5;
  _QWORD v7[5];

  -[MPAVRoutingController cachedRoutes](self, "cachedRoutes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (-[MPAVRoutingController fetchAvailableRoutesSynchronously](self, "fetchAvailableRoutesSynchronously"))
    {
      -[MPAVRoutingController _syncUpdateRoutes](self, "_syncUpdateRoutes");
      -[MPAVRoutingController cachedRoutes](self, "cachedRoutes");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPAVRoutingController _scheduleSendDelegateRoutesChanged](self, "_scheduleSendDelegateRoutesChanged");
    }
    else
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __40__MPAVRoutingController_availableRoutes__block_invoke;
      v7[3] = &unk_1E3163530;
      v7[4] = self;
      -[MPAVRoutingController fetchAvailableRoutesWithCompletionQueue:completionHandler:](self, "fetchAvailableRoutesWithCompletionQueue:completionHandler:", MEMORY[0x1E0C80D38], v7);
      v3 = 0;
    }
  }
  if (objc_msgSend(v3, "count"))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (int64_t)externalScreenType
{
  int64_t v3;
  MPAVRoutingDataSource *dataSource;
  _QWORD v6[5];
  char v7;

  v7 = 0;
  v3 = -[MPAVRoutingController _externalScreenType:](self, "_externalScreenType:", &v7);
  if (!v7)
  {
    dataSource = self->_dataSource;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __43__MPAVRoutingController_externalScreenType__block_invoke;
    v6[3] = &unk_1E3159898;
    v6[4] = self;
    -[MPAVRoutingDataSource getExternalScreenTypeWithCompletion:](dataSource, "getExternalScreenTypeWithCompletion:", v6);
  }
  return v3;
}

- (BOOL)hasPendingPickedRoutes
{
  return -[MPAVRoutingControllerSelectionQueue hasPendingRoutes](self->_routingControllerSelectionQueue, "hasPendingRoutes");
}

- (MPAVRoute)pendingPickedRoute
{
  return -[MPAVRoutingControllerSelectionQueue pendingPickedRoute](self->_routingControllerSelectionQueue, "pendingPickedRoute");
}

- (NSSet)pendingPickedRoutes
{
  return -[MPAVRoutingControllerSelectionQueue pendingPickedRoutes](self->_routingControllerSelectionQueue, "pendingPickedRoutes");
}

- (BOOL)routeIsLeaderOfEndpoint:(id)a3
{
  return -[MPAVRoutingDataSource routeIsLeaderOfEndpoint:](self->_dataSource, "routeIsLeaderOfEndpoint:", a3);
}

- (BOOL)routeIsPendingPick:(id)a3
{
  return -[MPAVRoutingControllerSelectionQueue routeIsPendingPick:](self->_routingControllerSelectionQueue, "routeIsPendingPick:", a3);
}

- (void)setCategory:(id)a3
{
  NSString *v4;
  NSString *category;
  NSObject *v6;
  NSString *v7;
  int v8;
  NSString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = (NSString *)objc_msgSend(a3, "copy");
  category = self->_category;
  self->_category = v4;

  v6 = os_log_create("com.apple.amp.mediaplayer", "Routing");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = self->_category;
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_193B9B000, v6, OS_LOG_TYPE_DEFAULT, "Audio category override changed to %{public}@", (uint8_t *)&v8, 0xCu);
  }

  -[MPAVRoutingController _updateCachedRoutes](self, "_updateCachedRoutes");
}

- (void)setRouteTypes:(int64_t)a3
{
  self->_routeTypes = a3;
  -[MPAVRoutingController _updateCachedRoutes](self, "_updateCachedRoutes");
}

- (BOOL)volumeControlIsAvailable
{
  int64_t v3;
  MPAVRoutingDataSource *dataSource;
  _QWORD v6[5];

  v3 = -[MPAVRoutingController _volumeControlStateForPickedRoute](self, "_volumeControlStateForPickedRoute");
  if (!v3)
  {
    dataSource = self->_dataSource;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __49__MPAVRoutingController_volumeControlIsAvailable__block_invoke;
    v6[3] = &unk_1E31631D8;
    v6[4] = self;
    -[MPAVRoutingDataSource getPickedRouteHasVolumeControlWithCompletion:](dataSource, "getPickedRouteHasVolumeControlWithCompletion:", v6);
  }
  return v3 == 1;
}

- (void)setPresentedBundleID:(id)a3
{
  NSString *v5;
  char v6;
  NSString *v7;

  v5 = (NSString *)a3;
  if (self->_presentedBundleID != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_presentedBundleID, a3);
    if ((objc_msgSend((id)objc_opt_class(), "bundleIdRepresentsLongFormVideoContent:", self->_presentedBundleID) & 1) != 0)
      v6 = 1;
    else
      v6 = objc_msgSend((id)objc_opt_class(), "bundleIdRepresentsLongFormVideoContent:", self->_representedBundleID);
    self->_representsLongFormVideoContent = v6;
    v5 = v7;
  }

}

- (void)setRepresentedBundleID:(id)a3
{
  NSString *v5;
  char v6;
  NSString *v7;

  v5 = (NSString *)a3;
  if (self->_representedBundleID != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_representedBundleID, a3);
    if ((objc_msgSend((id)objc_opt_class(), "bundleIdRepresentsLongFormVideoContent:", self->_representedBundleID) & 1) != 0)
      v6 = 1;
    else
      v6 = objc_msgSend((id)objc_opt_class(), "bundleIdRepresentsLongFormVideoContent:", self->_presentedBundleID);
    self->_representsLongFormVideoContent = v6;
    v5 = v7;
  }

}

- (BOOL)airtunesRouteIsPicked
{
  void *v2;
  BOOL v3;

  -[MPAVRoutingController pickedRoute](self, "pickedRoute");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "routeSubtype") == 9;

  return v3;
}

- (id)updateAvailableRoutes
{
  -[MPAVRoutingController _syncUpdateRoutes](self, "_syncUpdateRoutes");
  return -[MPAVRoutingController cachedRoutes](self, "cachedRoutes");
}

- (id)updatePickedRoutes
{
  -[MPAVRoutingController _syncUpdateRoutes](self, "_syncUpdateRoutes");
  return -[MPAVRoutingController cachedPickedRoutes](self, "cachedPickedRoutes");
}

- (void)fetchAvailableRoutesWithCompletionHandler:(id)a3
{
  -[MPAVRoutingController fetchAvailableRoutesWithCompletionQueue:completionHandler:](self, "fetchAvailableRoutesWithCompletionQueue:completionHandler:", MEMORY[0x1E0C80D38], a3);
}

- (void)getActiveRouteWithTimeout:(double)a3 completion:(id)a4
{
  id v6;

  v6 = a4;
  objc_msgSend((id)objc_opt_class(), "_getActiveRouteWithTimeout:type:completion:", -[MPAVRoutingController activeRouteType](self, "activeRouteType"), v6, a3);

}

- (BOOL)handsetRouteIsPicked
{
  void *v2;
  BOOL v3;

  -[MPAVRoutingController pickedRoute](self, "pickedRoute");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "pickableRouteType") == 0;

  return v3;
}

- (BOOL)pickBestDeviceRoute
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  BOOL v9;
  MPAVRoutingControllerSelectionQueue *routingControllerSelectionQueue;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  void *v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[MPAVRoutingController availableRoutes](self, "availableRoutes", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v8, "routeSubtype") == 1 || objc_msgSend(v8, "routeSubtype") == 2)
        {
          routingControllerSelectionQueue = self->_routingControllerSelectionQueue;
          v17 = v8;
          v9 = 1;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPAVRoutingControllerSelectionQueue enqueueSelectionOperation:forRoutes:completion:](routingControllerSelectionQueue, "enqueueSelectionOperation:forRoutes:completion:", 0, v11, 0);

          goto LABEL_13;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      v9 = 0;
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v9 = 0;
  }
LABEL_13:

  return v9;
}

- (BOOL)pickHandsetRoute
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  MPAVRoutingControllerSelectionQueue *routingControllerSelectionQueue;
  void *v9;
  NSObject *serialQueue;
  _QWORD v12[6];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  void *v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[MPAVRoutingController availableRoutes](self, "availableRoutes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (!objc_msgSend(v7, "pickableRouteType"))
        {
          routingControllerSelectionQueue = self->_routingControllerSelectionQueue;
          v17 = v7;
          LOBYTE(v4) = 1;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPAVRoutingControllerSelectionQueue enqueueSelectionOperation:forRoutes:completion:](routingControllerSelectionQueue, "enqueueSelectionOperation:forRoutes:completion:", 0, v9, 0);

          serialQueue = self->_serialQueue;
          v12[0] = MEMORY[0x1E0C809B0];
          v12[1] = 3221225472;
          v12[2] = __41__MPAVRoutingController_pickHandsetRoute__block_invoke;
          v12[3] = &unk_1E31635F8;
          v12[4] = self;
          v12[5] = v7;
          dispatch_sync(serialQueue, v12);
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)pickSpeakerRoute
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  MPAVRoutingControllerSelectionQueue *routingControllerSelectionQueue;
  void *v10;
  NSObject *serialQueue;
  _QWORD v13[6];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  void *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[MPAVRoutingController availableRoutes](self, "availableRoutes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v8, "routeSubtype") == 1)
        {
          routingControllerSelectionQueue = self->_routingControllerSelectionQueue;
          v18 = v8;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPAVRoutingControllerSelectionQueue enqueueSelectionOperation:forRoutes:completion:](routingControllerSelectionQueue, "enqueueSelectionOperation:forRoutes:completion:", 0, v10, 0);

          serialQueue = self->_serialQueue;
          v13[0] = MEMORY[0x1E0C809B0];
          v13[1] = 3221225472;
          v13[2] = __41__MPAVRoutingController_pickSpeakerRoute__block_invoke;
          v13[3] = &unk_1E31635F8;
          v13[4] = self;
          v13[5] = v8;
          dispatch_sync(serialQueue, v13);
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return 1;
}

- (void)selectRoute:(id)a3 operation:(int64_t)a4 completion:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", &v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPAVRoutingController selectRoutes:operation:completion:](self, "selectRoutes:operation:completion:", v11, a4, v9, v12, v13);
}

- (void)selectRoutes:(id)a3 operation:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a3;
  v9 = a5;
  -[MPAVRoutingControllerSelectionQueue addPendingRoutes:](self->_routingControllerSelectionQueue, "addPendingRoutes:", v8);
  objc_msgSend(v8, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__MPAVRoutingController_selectRoutes_operation_completion___block_invoke;
  v13[3] = &unk_1E3154668;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  v12 = v8;
  -[MPAVRoutingController _promptForHijackIfNeeded:handler:](self, "_promptForHijackIfNeeded:handler:", v10, v13);

}

- (BOOL)speakerRouteIsPicked
{
  void *v2;
  BOOL v3;

  -[MPAVRoutingController pickedRoute](self, "pickedRoute");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "routeSubtype") == 1;

  return v3;
}

- (BOOL)receiverRouteIsPicked
{
  void *v2;
  BOOL v3;

  -[MPAVRoutingController pickedRoute](self, "pickedRoute");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "routeSubtype") == 4;

  return v3;
}

- (BOOL)routeOtherThanHandsetAndSpeakerAvailable
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[MPAVRoutingController availableRoutes](self, "availableRoutes", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "pickableRouteType") && objc_msgSend(v8, "routeSubtype") != 1)
        {

          return 1;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }

  return -[MPAVRoutingController _deviceAvailabilityOverrideState](self, "_deviceAvailabilityOverrideState")
      || -[MPAVRoutingDataSource devicePresenceDetected](self->_dataSource, "devicePresenceDetected");
}

- (BOOL)routeOtherThanHandsetAvailable
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[MPAVRoutingController availableRoutes](self, "availableRoutes", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "pickableRouteType"))
        {

          return 1;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }

  return -[MPAVRoutingController _deviceAvailabilityOverrideState](self, "_deviceAvailabilityOverrideState")
      || -[MPAVRoutingDataSource devicePresenceDetected](self->_dataSource, "devicePresenceDetected");
}

- (void)unpickAirPlayScreenRouteWithCompletion:(id)a3
{
  id v4;
  MPAVRoutingDataSource *dataSource;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  dataSource = self->_dataSource;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__MPAVRoutingController_unpickAirPlayScreenRouteWithCompletion___block_invoke;
  v7[3] = &unk_1E31624C0;
  v8 = v4;
  v6 = v4;
  -[MPAVRoutingDataSource unpickAirPlayAVRoutesWithCompletion:](dataSource, "unpickAirPlayAVRoutesWithCompletion:", v7);

}

- (id)videoRouteForRoute:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "routeUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[MPAVRoutingController availableRoutes](self, "availableRoutes", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v9, "routeUID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v4, "isEqualToString:", v10))
          {
            v11 = objc_msgSend(v9, "routeType");

            if (v11 == 1)
            {
              v6 = v9;
              goto LABEL_15;
            }
          }
          else
          {

          }
        }
        v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }
LABEL_15:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)wirelessDisplayRouteIsPicked
{
  void *v2;
  BOOL v3;

  -[MPAVRoutingController pickedRoute](self, "pickedRoute");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "routeType") == 2;

  return v3;
}

- (BOOL)wirelessDisplayRoutesAvailable
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[MPAVRoutingController availableRoutes](self, "availableRoutes", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((objc_msgSend(v8, "supportsWirelessDisplay") & 1) != 0 || objc_msgSend(v8, "routeType") == 2)
        {

          return 1;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }

  return -[MPAVRoutingController _deviceAvailabilityOverrideState](self, "_deviceAvailabilityOverrideState")
      || -[MPAVRoutingDataSource devicePresenceDetected](self->_dataSource, "devicePresenceDetected");
}

- (void)clearCachedRoutes
{
  -[MPAVRoutingController setCachedRoutes:](self, "setCachedRoutes:", 0);
}

- (void)unpickTVRoutes
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  MRAVOutputContextGetSharedAudioPresentationContext();
  v2 = (void *)MRAVOutputContextCopyOutputDevices();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        if (MRAVOutputDeviceGetSubtype() == 11 || MRAVOutputDeviceGetSubtype() == 13)
          objc_msgSend(v3, "addObject:", v9, (_QWORD)v13);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v3, "count"))
  {
    MRAVOutputContextGetSharedAudioPresentationContext();
    MRAVOutputContextRemoveOutputDevices();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C8B2A8], "sharedAudioPresentationOutputContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C8B2A8], "sharedAudioPresentationOutputContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "outputDevices");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setOutputDevices:", v12);

  }
}

- (void)_syncUpdateRoutes
{
  id v3;

  -[MPAVRoutingDataSource getRoutesForCategory:](self->_dataSource, "getRoutesForCategory:", self->_category);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[MPAVRoutingController setCachedRoutes:](self, "setCachedRoutes:", v3);

}

- (void)_clearLegacyCachedRoute
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__MPAVRoutingController__clearLegacyCachedRoute__block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

- (BOOL)_deviceAvailabilityOverrideState
{
  NSObject *serialQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__MPAVRoutingController__deviceAvailabilityOverrideState__block_invoke;
  v5[3] = &unk_1E3163580;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)_externalScreenType:(BOOL *)a3
{
  NSObject *serialQueue;
  int64_t v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__MPAVRoutingController__externalScreenType___block_invoke;
  block[3] = &unk_1E31626B8;
  block[4] = self;
  block[5] = &v12;
  block[6] = &v8;
  dispatch_sync(serialQueue, block);
  if (a3)
    *a3 = *((_BYTE *)v9 + 24);
  v5 = v13[3];
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v5;
}

- (void)_onQueueSetExternalScreenType:(int64_t)a3
{
  uint64_t v3;
  _QWORD block[5];

  if (self->_externalScreenType != a3)
  {
    self->_externalScreenType = a3;
    v3 = MEMORY[0x1E0C809B0];
    self->_hasExternalScreenType = 1;
    block[0] = v3;
    block[1] = 3221225472;
    block[2] = __55__MPAVRoutingController__onQueueSetExternalScreenType___block_invoke;
    block[3] = &unk_1E3163508;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

- (id)_pickedRouteInArray:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "isPicked"))
        {
          v10 = v9;

          v6 = v10;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_promptForHijackIfNeeded:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  char v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  char v19;
  char v20;
  void *v21;
  char isKindOfClass;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  MPAVRoutingController *v36;
  id v37;
  id v38;
  id v39;
  _QWORD *v40;
  _QWORD v41[5];
  id v42;
  id v43;
  id v44;
  _QWORD *v45;
  _QWORD v46[5];
  id v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      v46[0] = 0;
      v46[1] = v46;
      v46[2] = 0x3032000000;
      v46[3] = __Block_byref_object_copy__8481;
      v46[4] = __Block_byref_object_dispose__8482;
      v47 = 0;
      v10 = objc_alloc(MEMORY[0x1E0CA5870]);
      -[MPAVRoutingController presentedBundleID](self, "presentedBundleID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithBundleIdentifier:allowPlaceholder:error:", v11, 0, 0);

      objc_msgSend(v12, "localizedName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __58__MPAVRoutingController__promptForHijackIfNeeded_handler___block_invoke;
      v41[3] = &unk_1E31546D8;
      v41[4] = self;
      v14 = v6;
      v42 = v14;
      v45 = v46;
      v15 = v13;
      v43 = v15;
      v16 = v7;
      v44 = v16;
      v30 = (void *)MEMORY[0x19403A810](v41);
      v17 = objc_loadWeakRetained((id *)&self->_playbackDataSource);
      v18 = objc_loadWeakRetained((id *)&self->_delegate);
      v19 = objc_msgSend(v14, "isPicked");
      if (v17)
        v20 = v19;
      else
        v20 = 1;
      if ((v20 & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v25 = os_log_create("com.apple.amp.mediaplayer", "Routing");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v49 = v14;
          v50 = 2114;
          v51 = v17;
          _os_log_impl(&dword_193B9B000, v25, OS_LOG_TYPE_DEFAULT, "Skipping playback checks. Route: %{public}@, playbackDataSource: %{public}@", buf, 0x16u);
        }

        (*((void (**)(id, uint64_t))v16 + 2))(v16, 1);
      }
      else
      {
        v29 = v14;
        -[MPAVRoutingController dataSource](self, "dataSource");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          -[MPAVRoutingController dataSource](self, "dataSource");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "endpointRoute");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v24 = 0;
        }
        v26 = os_log_create("com.apple.amp.mediaplayer", "Routing");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v49 = v29;
          _os_log_impl(&dword_193B9B000, v26, OS_LOG_TYPE_DEFAULT, "Hijack - Requesting playbackState for %@", buf, 0xCu);
        }

        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __58__MPAVRoutingController__promptForHijackIfNeeded_handler___block_invoke_119;
        v31[3] = &unk_1E3154728;
        v32 = v29;
        v27 = v24;
        v33 = v27;
        v28 = v32;
        v34 = v28;
        v35 = v18;
        v38 = v30;
        v36 = self;
        v39 = v16;
        v40 = v46;
        v37 = v15;
        objc_msgSend(v17, "getOutputDeviceIsPlaying:completion:", v28, v31);

      }
      _Block_object_dispose(v46, 8);

    }
    else
    {
      (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
    }
  }

}

- (void)_sendDelegateFailedToPickRouteWithError:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__MPAVRoutingController__sendDelegateFailedToPickRouteWithError___block_invoke;
  v6[3] = &unk_1E31635F8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

- (void)_setExternalScreenType:(int64_t)a3
{
  NSObject *serialQueue;
  _QWORD v4[6];

  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__MPAVRoutingController__setExternalScreenType___block_invoke;
  v4[3] = &unk_1E3161620;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(serialQueue, v4);
}

- (void)_setVolumeControlStateForPickedRoute:(int64_t)a3
{
  NSObject *serialQueue;
  _QWORD v4[6];

  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__MPAVRoutingController__setVolumeControlStateForPickedRoute___block_invoke;
  v4[3] = &unk_1E3161620;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(serialQueue, v4);
}

- (void)_unregisterNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("MPAVRoutingDataSourceRoutesDidChangeNotification"), self->_dataSource);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("MPAVRoutingDataSourceFailureNotification"), self->_dataSource);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("MPAVRoutingDataSourceVolumeControlAvailabilityDidChangeNotification"), self->_dataSource);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("MPAVRoutingDataSourceExternalScreenTypeDidChangeNotification"), self->_dataSource);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("MPAVRoutingDataSourceActiveAudioRouteDidChangeNotification"), self->_dataSource);
  notify_cancel(self->_deviceAvailabilityNotifyToken);

}

- (void)_updateCachedRoutes
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __44__MPAVRoutingController__updateCachedRoutes__block_invoke;
  v2[3] = &unk_1E3163530;
  v2[4] = self;
  -[MPAVRoutingController fetchAvailableRoutesWithCompletionQueue:completionHandler:](self, "fetchAvailableRoutesWithCompletionQueue:completionHandler:", MEMORY[0x1E0C80D38], v2);
}

- (int64_t)_volumeControlStateForPickedRoute
{
  NSObject *serialQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__MPAVRoutingController__volumeControlStateForPickedRoute__block_invoke;
  v5[3] = &unk_1E3163580;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_activeAudioRouteDidChangeNotification:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  MPAVRoutingController *v12;

  v4 = a3;
  -[MPAVRoutingController _clearLegacyCachedRoute](self, "_clearLegacyCachedRoute");
  -[MPAVRoutingController _updateCachedRoutes](self, "_updateCachedRoutes");
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __64__MPAVRoutingController__activeAudioRouteDidChangeNotification___block_invoke;
  v10 = &unk_1E31635F8;
  v5 = v4;
  v11 = v5;
  v12 = self;
  v6 = (void (**)(_QWORD))MEMORY[0x19403A810](&v7);
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", v7, v8, v9, v10))
    v6[2](v6);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v6);

}

- (void)_externalScreenTypeDidChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("ExternalScreenType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  -[MPAVRoutingController _setExternalScreenType:](self, "_setExternalScreenType:", v6);
}

- (void)_mediaServerDiedNotification:(id)a3
{
  -[MPAVRoutingController _unregisterNotifications](self, "_unregisterNotifications", a3);
  -[MPAVRoutingController _registerNotifications](self, "_registerNotifications");
}

- (void)_routeStatusDidChangeNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("Route"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("Error"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v10;
  if (v10)
  {
    v9 = objc_msgSend(v10, "isPicked");
    v8 = v10;
    if ((v9 & 1) != 0 || v7)
    {
      -[MPAVRoutingControllerSelectionQueue cancelInProgressSelectionForRoute:](self->_routingControllerSelectionQueue, "cancelInProgressSelectionForRoute:", v10);
      v8 = v10;
    }
  }
  if (objc_msgSend(v8, "routeSubtype") == 9)
    -[MPAVRoutingController _sendDelegateFailedToPickRouteWithError:](self, "_sendDelegateFailedToPickRouteWithError:", v7);

}

- (void)_volumeControlAvailabilityDidChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id WeakRetained;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("VolumeControlAvailability"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if ((_DWORD)v6)
    v7 = 1;
  else
    v7 = 2;
  -[MPAVRoutingController _setVolumeControlStateForPickedRoute:](self, "_setVolumeControlStateForPickedRoute:", v7);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "routingController:volumeControlAvailabilityDidChange:", self, v6);

}

- (BOOL)pickRoute:(id)a3
{
  return -[MPAVRoutingController pickRoute:withPassword:](self, "pickRoute:withPassword:", a3, 0);
}

- (BOOL)pickRoute:(id)a3 withPassword:(id)a4
{
  return -[MPAVRoutingController pickRoute:withPassword:completion:](self, "pickRoute:withPassword:completion:", a3, a4, 0);
}

- (BOOL)pickRoute:(id)a3 withPassword:(id)a4 completion:(id)a5
{
  return -[MPAVRoutingController _pickRoute:completion:](self, "_pickRoute:completion:", a3, a5);
}

- (BOOL)_pickRoute:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  MPAVRoutingDataSource *dataSource;
  id v15;
  id v16;
  id v17;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id location;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPAVRoutingController.m"), 1431, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("route"));

  }
  -[MPAVRoutingController _clearLegacyCachedRoute](self, "_clearLegacyCachedRoute");
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[MPAVRoutingController cachedPickedRoutes](self, "cachedPickedRoutes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v27;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v12++), "setPicked:", 0);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v10);
  }

  v30 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPAVRoutingControllerSelectionQueue addPendingRoutes:](self->_routingControllerSelectionQueue, "addPendingRoutes:", v13);
  objc_initWeak(&location, self);
  dataSource = self->_dataSource;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __47__MPAVRoutingController__pickRoute_completion___block_invoke;
  v20[3] = &unk_1E3154750;
  objc_copyWeak(&v24, &location);
  v15 = v13;
  v21 = v15;
  v16 = v7;
  v22 = v16;
  v17 = v8;
  v23 = v17;
  -[MPAVRoutingDataSource setPickedRoute:withPassword:completion:](dataSource, "setPickedRoute:withPassword:completion:", v16, 0, v20);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

  return 1;
}

- (BOOL)supportsMultipleSelection
{
  return -[MPAVRoutingDataSource supportsMultipleSelection](self->_dataSource, "supportsMultipleSelection");
}

- (BOOL)addPickedRoute:(id)a3
{
  return -[MPAVRoutingController addPickedRoute:completion:](self, "addPickedRoute:completion:", a3, 0);
}

- (BOOL)addPickedRoute:(id)a3 completion:(id)a4
{
  -[MPAVRoutingController selectRoute:operation:completion:](self, "selectRoute:operation:completion:", a3, 1, a4);
  return -[MPAVRoutingController supportsMultipleSelection](self, "supportsMultipleSelection");
}

- (BOOL)removePickedRoute:(id)a3
{
  return -[MPAVRoutingController removePickedRoute:completion:](self, "removePickedRoute:completion:", a3, 0);
}

- (BOOL)removePickedRoute:(id)a3 completion:(id)a4
{
  -[MPAVRoutingController selectRoute:operation:completion:](self, "selectRoute:operation:completion:", a3, 2, a4);
  return -[MPAVRoutingController supportsMultipleSelection](self, "supportsMultipleSelection");
}

- (id)_stateDumpObject
{
  void *v3;
  const __CFString *name;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("_obj");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("name");
  v8[0] = v3;
  name = (const __CFString *)self->_name;
  if (!name)
    name = CFSTR("<NONE>");
  v8[1] = name;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_fullStateDumpObject
{
  uint64_t v3;
  void *v4;
  const __CFString *name;
  MPAVRoutingDataSource *dataSource;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  _QWORD v20[7];
  _QWORD v21[8];

  v21[7] = *MEMORY[0x1E0C80C00];
  v20[0] = CFSTR("_obj");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(), self);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  dataSource = self->_dataSource;
  name = (const __CFString *)self->_name;
  if (!name)
    name = CFSTR("<NONE>");
  v21[0] = v3;
  v21[1] = name;
  v20[1] = CFSTR("name");
  v20[2] = CFSTR("dataSource");
  if (dataSource)
    v7 = (const __CFString *)dataSource;
  else
    v7 = CFSTR("<NONE>");
  v21[2] = v7;
  v20[3] = CFSTR("discoveryMode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_discoveryMode);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v8;
  v20[4] = CFSTR("cachedRoutes");
  -[MPAVRoutingController cachedRoutes](self, "cachedRoutes");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (const __CFString *)v9;
  else
    v11 = CFSTR("<NONE>");
  v21[4] = v11;
  v20[5] = CFSTR("cachedPickedRoutes");
  -[MPAVRoutingController cachedPickedRoutes](self, "cachedPickedRoutes");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (const __CFString *)v12;
  else
    v14 = CFSTR("<NONE>");
  v21[5] = v14;
  v20[6] = CFSTR("pendingRoutes");
  -[MPAVRoutingControllerSelectionQueue pendingPickedRoute](self->_routingControllerSelectionQueue, "pendingPickedRoute");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
    v17 = (const __CFString *)v15;
  else
    v17 = CFSTR("<NONE>");
  v21[6] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (MPAVRoutingControllerDelegate)delegate
{
  return (MPAVRoutingControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)category
{
  return self->_category;
}

- (int64_t)routeTypes
{
  return self->_routeTypes;
}

- (MPAVRoute)legacyCachedRoute
{
  return self->_legacyCachedRoute;
}

- (void)setLegacyCachedRoute:(id)a3
{
  objc_storeStrong((id *)&self->_legacyCachedRoute, a3);
}

- (MPAVOutputDevicePlaybackDataSource)playbackDataSource
{
  return (MPAVOutputDevicePlaybackDataSource *)objc_loadWeakRetained((id *)&self->_playbackDataSource);
}

- (void)setPlaybackDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_playbackDataSource, a3);
}

- (NSString)presentedBundleID
{
  return self->_presentedBundleID;
}

- (NSString)representedBundleID
{
  return self->_representedBundleID;
}

- (BOOL)representsLongFormVideoContent
{
  return self->_representsLongFormVideoContent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_representedBundleID, 0);
  objc_storeStrong((id *)&self->_presentedBundleID, 0);
  objc_destroyWeak((id *)&self->_playbackDataSource);
  objc_storeStrong((id *)&self->_legacyCachedRoute, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_routingControllerSelectionQueue, 0);
  objc_storeStrong((id *)&self->_cachedPickedRoutes, 0);
  objc_storeStrong((id *)&self->_cachedRoutes, 0);
}

void __47__MPAVRoutingController__pickRoute_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[6], "removePendingRoutes:", *(_QWORD *)(a1 + 32));
    v6 = os_log_create("com.apple.amp.mediaplayer", "Routing");
    v7 = v6;
    if (v3)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v8 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v17 = v8;
        v18 = 2114;
        v19 = v3;
        _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_ERROR, "Failed to pick single route %{public}@ error: %{public}@", buf, 0x16u);
      }

      objc_msgSend(v5, "_sendDelegateFailedToPickRouteWithError:", v3);
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        v17 = v9;
        _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEFAULT, "Successfully picked single route %{public}@", buf, 0xCu);
      }

      v10 = *(_QWORD *)(a1 + 40);
      v14 = CFSTR("MPAVRoutingControllerRouteUserInfoKey");
      v15 = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "postNotificationName:object:userInfo:", CFSTR("MPAVRoutingControllerDidPickRouteNotification"), v5, v11);

    }
  }
  v13 = *(_QWORD *)(a1 + 48);
  if (v13)
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v3);

}

void __47__MPAVRoutingController__registerNotifications__block_invoke(uint64_t a1, int a2)
{
  _BYTE *WeakRetained;
  uint64_t state64;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    state64 = 0;
    notify_get_state(a2, &state64);
    WeakRetained[60] = (state64 & 3) != 0;
    objc_msgSend(WeakRetained, "_scheduleSendDelegateRoutesChanged");
  }

}

void __64__MPAVRoutingController__activeAudioRouteDidChangeNotification___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id WeakRetained;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.mediaplayer", "Playback");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "userInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136446466;
    v9 = "-[MPAVRoutingController _activeAudioRouteDidChangeNotification:]_block_invoke";
    v10 = 2114;
    v11 = v3;
    _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_DEFAULT, "🎥 %{public}s %{public}@", (uint8_t *)&v8, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D47E58]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 88));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "routingControllerDidPauseFromActiveRouteChange:", *(_QWORD *)(a1 + 40));

  }
}

uint64_t __58__MPAVRoutingController__volumeControlStateForPickedRoute__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 40);
  return result;
}

uint64_t __44__MPAVRoutingController__updateCachedRoutes__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleSendDelegateRoutesChanged");
}

void __62__MPAVRoutingController__setVolumeControlStateForPickedRoute___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(v1 + 40);
  *(_QWORD *)(v1 + 40) = *(_QWORD *)(a1 + 40);
  if (v2 != *(_QWORD *)(a1 + 40))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__MPAVRoutingController__setVolumeControlStateForPickedRoute___block_invoke_2;
    block[3] = &unk_1E3163508;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

void __62__MPAVRoutingController__setVolumeControlStateForPickedRoute___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("MPAVRoutingControllerDidUpdateVolumeControlStateNotification"), *(_QWORD *)(a1 + 32), 0);

}

uint64_t __48__MPAVRoutingController__setExternalScreenType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueueSetExternalScreenType:", *(_QWORD *)(a1 + 40));
}

void __65__MPAVRoutingController__sendDelegateFailedToPickRouteWithError___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 88));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "routingController:didFailToPickRouteWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __58__MPAVRoutingController__promptForHijackIfNeeded_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 88));
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__MPAVRoutingController__promptForHijackIfNeeded_handler___block_invoke_2;
  v9[3] = &unk_1E31596D8;
  v9[4] = v5;
  v8 = *(_QWORD *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  objc_msgSend(WeakRetained, "routingController:shouldHijackRoute:alertStyle:busyRouteName:presentingAppName:completion:", v5, v6, a2, v7, v8, v9);

}

void __58__MPAVRoutingController__promptForHijackIfNeeded_handler___block_invoke_119(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  char v21;
  int8x16_t v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  int v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = os_log_create("com.apple.amp.mediaplayer", "Routing");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 67109378;
    v31 = a2;
    v32 = 2112;
    v33 = v5;
    _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_DEFAULT, "Hijack - playbackState is %{BOOL}u for %@", buf, 0x12u);
  }

  if ((objc_msgSend(*(id *)(a1 + 40), "isDeviceRoute") & 1) != 0
    || !objc_msgSend(*(id *)(a1 + 48), "isDeviceRoute"))
  {
    v6 = objc_msgSend(*(id *)(a1 + 48), "isProxyGroupPlayer");
    if (v6)
      LOBYTE(v6) = objc_msgSend(*(id *)(a1 + 64), "routeIsLeaderOfEndpoint:", *(_QWORD *)(a1 + 48));
    if (a2 && (v6 & 1) == 0 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 56), "routingController:shouldHijackRoute:alertStyle:busyRouteName:presentingAppName:completion:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 88));
    }
    else
    {
      MRAVOutputContextGetSharedAudioPresentationContext();
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v7 = (id)MRAVOutputContextCopyOutputDevices();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v8)
      {
        v9 = v8;
        v10 = 0;
        v11 = *(_QWORD *)v26;
LABEL_16:
        v12 = 0;
        while (1)
        {
          if (*(_QWORD *)v26 != v11)
            objc_enumerationMutation(v7);
          v13 = (void *)MRAVOutputDeviceCopyUniqueIdentifier();
          objc_msgSend(*(id *)(a1 + 48), "routeUID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "isEqualToString:", v14);

          if ((v10 & 1) != 0 || (MRAVOutputDeviceIsLocalDevice() & 1) == 0)
          {
            v16 = MRAVOutputDeviceCopyName();
            v17 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
            v18 = *(void **)(v17 + 40);
            *(_QWORD *)(v17 + 40) = v16;

            if (v15)
            {

              goto LABEL_30;
            }
            v10 = 1;
          }
          else
          {
            v10 = 0;
          }
          if (v9 == ++v12)
          {
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
            if (v9)
              goto LABEL_16;

            if ((v10 & 1) == 0)
              goto LABEL_38;
            if (!v15)
            {
LABEL_34:
              objc_msgSend(*(id *)(a1 + 64), "pickedRoute");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend(v20, "isDeviceRoute"))
              {

                goto LABEL_38;
              }
              v21 = objc_opt_respondsToSelector();

              if ((v21 & 1) == 0)
                goto LABEL_38;
              (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
              goto LABEL_39;
            }
LABEL_30:
            if (objc_msgSend(*(id *)(a1 + 48), "isAirPlayRoute"))
            {
              v22 = *(int8x16_t *)(a1 + 56);
              v19 = (id)v22.i64[0];
              v23 = *(id *)(a1 + 80);
              v24 = *(id *)(a1 + 88);
              MRMediaRemoteGetNowPlayingClient();

              goto LABEL_39;
            }
            goto LABEL_34;
          }
        }
      }

LABEL_38:
      (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
LABEL_39:

    }
  }
  else if (a2 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
  }
}

void __58__MPAVRoutingController__promptForHijackIfNeeded_handler___block_invoke_120(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend((id)MRNowPlayingClientGetBundleIdentifier(), "copy");
  objc_msgSend(*(id *)(a1 + 32), "presentedBundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", v2);

  v5 = os_log_create("com.apple.amp.mediaplayer", "Routing");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (v4)
      v6 = CFSTR("does NOT represent NowPlaying App");
    else
      v6 = CFSTR("represents NowPlaying App");
    objc_msgSend(*(id *)(a1 + 32), "presentedBundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543874;
    v9 = v6;
    v10 = 2114;
    v11 = v7;
    v12 = 2114;
    v13 = v2;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "Hijack - RoutingController %{public}@ Presenting: %{public}@ NowPlaying: %{public}@", (uint8_t *)&v8, 0x20u);

  }
  if ((v4 & 1) == 0 && *(_BYTE *)(a1 + 64) && (objc_opt_respondsToSelector() & 1) != 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

uint64_t __58__MPAVRoutingController__promptForHijackIfNeeded_handler___block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = os_log_create("com.apple.amp.mediaplayer", "Routing");
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "presentedBundleID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_DEFAULT, "Perform hijack for %@", (uint8_t *)&v9, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "presentedBundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setAttribute:forKey:error:](v4, "setAttribute:forKey:error:", v7, *MEMORY[0x1E0D47E88], 0);
    goto LABEL_7;
  }
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "presentedBundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v7;
    _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_DEFAULT, "Do not perform hijack for %@", (uint8_t *)&v9, 0xCu);
LABEL_7:

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __55__MPAVRoutingController__onQueueSetExternalScreenType___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 88));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "routingControllerExternalScreenTypeDidChange:", *(_QWORD *)(a1 + 32));

}

_QWORD *__45__MPAVRoutingController__externalScreenType___block_invoke(_QWORD *result)
{
  *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24) = *(_QWORD *)(result[4] + 24);
  *(_BYTE *)(*(_QWORD *)(result[6] + 8) + 24) = *(_BYTE *)(result[4] + 32);
  return result;
}

uint64_t __57__MPAVRoutingController__deviceAvailabilityOverrideState__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 60);
  return result;
}

void __48__MPAVRoutingController__clearLegacyCachedRoute__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 136);
  *(_QWORD *)(v1 + 136) = 0;

}

uint64_t __64__MPAVRoutingController_unpickAirPlayScreenRouteWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __59__MPAVRoutingController_selectRoutes_operation_completion___block_invoke(_QWORD *a1, int a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)(a1[4] + 48);
  if (a2)
  {
    objc_msgSend(v3, "enqueueSelectionOperation:forRoutes:completion:", a1[7], a1[5], a1[6]);
  }
  else
  {
    objc_msgSend(v3, "removePendingRoutes:", a1[5]);
    v4 = a1[6];
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), 1, 0);
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);

  }
}

void __41__MPAVRoutingController_pickSpeakerRoute__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 136), *(id *)(a1 + 40));
}

void __41__MPAVRoutingController_pickHandsetRoute__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 136), *(id *)(a1 + 40));
}

uint64_t __49__MPAVRoutingController_volumeControlIsAvailable__block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;

  if (a2)
    v3 = 1;
  else
    v3 = 2;
  objc_msgSend(*(id *)(a1 + 32), "_setVolumeControlStateForPickedRoute:", v3);
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleSendDelegateRoutesChanged");
}

uint64_t __43__MPAVRoutingController_externalScreenType__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setExternalScreenType:", a2);
}

uint64_t __40__MPAVRoutingController_availableRoutes__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleSendDelegateRoutesChanged");
}

void __37__MPAVRoutingController_cachedRoutes__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __47__MPAVRoutingController_setAlwaysAllowUpdates___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 80) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __49__MPAVRoutingController_initWithDataSource_name___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t (**v5)(id, void *);
  uint64_t v6;
  id WeakRetained;
  void *v8;
  void *v9;

  v5 = a3;
  if ((a2 & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v8 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "_fullStateDumpObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5[2](v5, v9);

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)_symbolNameMap
{
  if (_symbolNameMap_onceToken != -1)
    dispatch_once(&_symbolNameMap_onceToken, &__block_literal_global_9);
  return (id)_symbolNameMap___symbolNameMap;
}

+ (id)_symbolImageForIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", a3);
}

+ (id)_symbolImageForRoutes:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "_symbolNameForRoutes:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_symbolImageForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_symbolImageForRoute:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "_symbolNameForRoute:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_symbolImageForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_symbolNameForRoute:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  int v16;
  int v17;
  const __CFString *v18;
  const __CFString *v19;

  v4 = a3;
  if (objc_msgSend(v4, "routeSubtype") == 13
    || objc_msgSend(v4, "routeSubtype") == 12
    || objc_msgSend(v4, "routeSubtype") == 11)
  {
    if ((objc_msgSend(v4, "isAirpodsRoute") & 1) != 0)
    {
LABEL_5:
      if (!objc_msgSend(v4, "isAppleAccessory"))
        goto LABEL_7;
    }
  }
  else
  {
    v8 = objc_msgSend(v4, "routeSubtype");
    v9 = objc_msgSend(v4, "isAirpodsRoute");
    if (v8 != 21)
      goto LABEL_7;
    if (v9)
      goto LABEL_5;
  }
  objc_msgSend(v4, "productIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_symbolNameForProductIdentifier:", v5);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_32;
LABEL_7:
  if (objc_msgSend(v4, "isClusterRoute"))
  {
    objc_msgSend(a1, "_symbolNameForClusterRoute:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v6 = (__CFString *)v7;
    goto LABEL_32;
  }
  if (objc_msgSend(v4, "routeSubtype") == 16)
  {
    v6 = CFSTR("tv.inset.filled");
    goto LABEL_32;
  }
  if ((objc_msgSend(v4, "isSetTopBoxRoute") & 1) != 0)
  {
    v6 = CFSTR("tv.and.mediabox");
    goto LABEL_32;
  }
  if ((objc_msgSend(v4, "isTVStickRoute") & 1) != 0)
  {
    v6 = CFSTR("mediastick");
    goto LABEL_32;
  }
  if ((objc_msgSend(v4, "isAppleTVRoute") & 1) != 0)
  {
    v6 = CFSTR("appletv.fill");
    goto LABEL_32;
  }
  if ((objc_msgSend(v4, "isBeatsLegacyRoute") & 1) != 0)
  {
    v6 = CFSTR("beatslogo");
    goto LABEL_32;
  }
  if (objc_msgSend(v4, "isVisionRoute"))
  {
    objc_msgSend(v4, "productIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_symbolNameForModelID:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = CFSTR("vision.pro");
LABEL_29:
    if (v11)
      v13 = (__CFString *)v11;
    v6 = v13;

    goto LABEL_32;
  }
  if (objc_msgSend(v4, "isiOSRoute"))
  {
    objc_msgSend(v4, "productIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_symbolNameForModelID:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = CFSTR("iphone");
    goto LABEL_29;
  }
  if (objc_msgSend(v4, "isMacRoute"))
  {
    objc_msgSend(v4, "productIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_symbolNameForModelID:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = CFSTR("display");
    goto LABEL_29;
  }
  if ((objc_msgSend(v4, "isJ327Route") & 1) != 0)
  {
    v6 = CFSTR("display");
    goto LABEL_32;
  }
  if ((objc_msgSend(v4, "isCarplayRoute") & 1) != 0)
  {
    v6 = CFSTR("carplay");
    goto LABEL_32;
  }
  if (!objc_msgSend(v4, "isHomePodRoute"))
  {
    if ((objc_msgSend(v4, "isHearingDeviceRoute") & 1) != 0)
    {
      v6 = CFSTR("hearingdevice.ear");
      goto LABEL_32;
    }
    if ((objc_msgSend(v4, "isDeviceSpeakerPhoneRoute") & 1) != 0)
    {
      v6 = CFSTR("speaker.wave.2.fill");
      goto LABEL_32;
    }
    if ((objc_msgSend(v4, "isDeviceSpeakerRoute") & 1) != 0
      || MSVDeviceIsAppleTV() && objc_msgSend(v4, "isDeviceRoute"))
    {
      objc_msgSend(a1, "_currentDeviceRoutingSymbolName");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(a1, "_fallbackSymbolNameForRoute:", v4);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_9;
  }
  v16 = objc_msgSend(v4, "isStereoPair");
  v17 = objc_msgSend(v4, "isB520Route");
  if (v16)
  {
    v18 = CFSTR("homepod.2.fill");
    v19 = CFSTR("homepodmini.2.fill");
  }
  else
  {
    v18 = CFSTR("homepod.fill");
    v19 = CFSTR("homepodmini.fill");
  }
  if (v17)
    v6 = (__CFString *)v19;
  else
    v6 = (__CFString *)v18;
LABEL_32:
  v14 = v6;

  return v14;
}

+ (id)_fallbackSymbolNameForRoute:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  v4 = CFSTR("headphones");
  switch(objc_msgSend(v3, "routeSubtype"))
  {
    case 2:
    case 13:
      break;
    case 4:
    case 5:
    case 9:
      if (objc_msgSend(v3, "isLowFidelityRoute"))
        v4 = CFSTR("speaker.wave.2.fill");
      else
        v4 = CFSTR("hifispeaker.fill");
      break;
    case 8:
    case 10:
    case 16:
      v4 = CFSTR("tv.inset.filled");
      break;
    case 11:
    case 12:
    case 21:
      v4 = CFSTR("speaker.bluetooth.fill");
      break;
    case 15:
    case 19:
      v4 = CFSTR("car.fill");
      break;
    default:
      v4 = CFSTR("speaker.wave.2.fill");
      break;
  }

  return (id)v4;
}

+ (id)_symbolNameForRoutes:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[13];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25 = v4;
  if (objc_msgSend(v4, "count") != 1)
  {
    v67 = 0;
    v68 = 0;
    v69 = &v68;
    v70 = 0x2020000000;
    v71 = 0;
    v64 = 0;
    v65 = &v64;
    v66 = 0x2020000000;
    v60 = 0;
    v61 = &v60;
    v62 = 0x2020000000;
    v63 = 0;
    v56 = 0;
    v57 = &v56;
    v58 = 0x2020000000;
    v59 = 0;
    v52 = 0;
    v53 = &v52;
    v54 = 0x2020000000;
    v55 = 0;
    v48 = 0;
    v49 = &v48;
    v50 = 0x2020000000;
    v51 = 0;
    v44 = 0;
    v45 = &v44;
    v46 = 0x2020000000;
    v47 = 0;
    v40 = 0;
    v41 = &v40;
    v42 = 0x2020000000;
    v43 = 0;
    v36 = 0;
    v37 = &v36;
    v38 = 0x2020000000;
    v39 = 0;
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __46__MPAVRoutingController__symbolNameForRoutes___block_invoke;
    v35[3] = &unk_1E3154690;
    v35[4] = &v60;
    v35[5] = &v64;
    v35[6] = &v68;
    v35[7] = &v56;
    v35[8] = &v52;
    v35[9] = &v48;
    v35[10] = &v44;
    v35[11] = &v40;
    v35[12] = &v36;
    v7 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x19403A810](v35);
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    obj = v4;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v73, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v32 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          if (objc_msgSend(v11, "originalRouteSubtype", v25) == 20)
          {
            v29 = 0u;
            v30 = 0u;
            v27 = 0u;
            v28 = 0u;
            objc_msgSend(v11, "clusterComposition");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v72, 16);
            if (v13)
            {
              v14 = *(_QWORD *)v28;
              do
              {
                for (j = 0; j != v13; ++j)
                {
                  if (*(_QWORD *)v28 != v14)
                    objc_enumerationMutation(v12);
                  v16 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
                  v17 = objc_msgSend(v16, "routeSubtype");
                  objc_msgSend(v16, "modelID");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  ((void (**)(_QWORD, _QWORD, uint64_t, void *))v7)[2](v7, 0, v17, v18);

                }
                v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v72, 16);
              }
              while (v13);
            }
          }
          else
          {
            v19 = objc_msgSend(v11, "originalRouteSubtype");
            objc_msgSend(v11, "productIdentifier");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, void *, uint64_t, void *))v7)[2](v7, v11, v19, v12);
          }

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v73, 16);
      }
      while (v8);
    }

    v20 = v69[3];
    v21 = v65[3];
    if (v20 >= 1)
    {
      if (v21 > 0)
      {
        v6 = CFSTR("homepod.and.appletv.fill");
LABEL_58:

        _Block_object_dispose(&v36, 8);
        _Block_object_dispose(&v40, 8);
        _Block_object_dispose(&v44, 8);
        _Block_object_dispose(&v48, 8);
        _Block_object_dispose(&v52, 8);
        _Block_object_dispose(&v56, 8);
        _Block_object_dispose(&v60, 8);
        _Block_object_dispose(&v64, 8);
        _Block_object_dispose(&v68, 8);
        goto LABEL_59;
      }
      if (v61[3] > 0)
      {
        v6 = CFSTR("homepodmini.and.appletv.fill");
        goto LABEL_58;
      }
      if (v37[3] > 0)
      {
        v6 = CFSTR("hifispeaker.and.appletv");
        goto LABEL_58;
      }
      v23 = v37[3];
      goto LABEL_40;
    }
    v22 = v61[3];
    if (v21 < 1)
    {
      v23 = v37[3];
      if (v22 < 1)
      {
LABEL_40:
        if (v23 > 1)
        {
          v6 = CFSTR("hifispeaker.2.fill");
          goto LABEL_58;
        }
        goto LABEL_42;
      }
      if (v23 > 0)
      {
        v6 = CFSTR("hifispeaker.and.homepodmini.fill");
        goto LABEL_58;
      }
      if ((unint64_t)v22 > 1)
      {
        v6 = CFSTR("homepodmini.2.fill");
        goto LABEL_58;
      }
    }
    else
    {
      if (v22 > 0)
      {
        v6 = CFSTR("homepod.and.homepodmini.fill");
        goto LABEL_58;
      }
      v23 = v37[3];
      if (v23 > 0)
      {
        v6 = CFSTR("hifispeaker.and.homepod.fill");
        goto LABEL_58;
      }
      if ((unint64_t)v21 > 1)
      {
        v6 = CFSTR("homepod.2.fill");
        goto LABEL_58;
      }
    }
LABEL_42:
    if (v23 == 1)
      v6 = CFSTR("hifispeaker.fill");
    else
      v6 = CFSTR("appletv.fill");
    if (v23 != 1 && v20 <= 0)
    {
      if (v53[3] <= 0)
      {
        if (v49[3] <= 0)
        {
          if (v45[3] <= 0)
          {
            if (v41[3] <= 0)
            {
              if (v57[3] <= 1)
                v6 = CFSTR("speaker.wave.2.fill");
              else
                v6 = CFSTR("person.2.fill");
            }
            else
            {
              v6 = CFSTR("display");
            }
          }
          else
          {
            v6 = CFSTR("tv.inset.filled");
          }
        }
        else
        {
          v6 = CFSTR("mediastick");
        }
      }
      else
      {
        v6 = CFSTR("tv.and.mediabox");
      }
    }
    goto LABEL_58;
  }
  objc_msgSend(v4, "firstObject", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_symbolNameForRoute:", v5);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_59:
  return v6;
}

+ (id)_currentDeviceRoutingSymbolImage
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "_currentDeviceRoutingSymbolName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_symbolNameForClusterRoute:(id)a3
{
  id v4;
  int v5;
  const __CFString *v6;
  const __CFString *v7;
  __CFString *v8;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  if (objc_msgSend(v4, "isHomeTheaterRoute"))
  {
    v5 = objc_msgSend(v4, "isHomeTheaterB520Route");
    v6 = CFSTR("homepod.and.appletv.fill");
    v7 = CFSTR("homepodmini.and.appletv.fill");
    goto LABEL_5;
  }
  if (objc_msgSend(v4, "isStereoPair"))
  {
    v5 = objc_msgSend(v4, "isB520Route");
    v6 = CFSTR("homepod.2.fill");
    v7 = CFSTR("homepodmini.2.fill");
LABEL_5:
    if (v5)
      v8 = (__CFString *)v7;
    else
      v8 = (__CFString *)v6;
    goto LABEL_8;
  }
  objc_msgSend(v4, "clusterCompositionRoutes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    objc_msgSend(v4, "clusterCompositionRoutes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_symbolNameForRoutes:", v12);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = CFSTR("speaker.wave.2.fill");
  }
LABEL_8:

  return v8;
}

+ (void)getProactiveRouteWithCompletion:(id)a3
{
  objc_msgSend(a1, "getProactiveRouteWithTimeout:completion:", a3, 0.0);
}

+ (void)getProactiveRouteWithTimeout:(double)a3 completion:(id)a4
{
  objc_msgSend(a1, "_getActiveRouteWithTimeout:type:completion:", 1, a4, a3);
}

+ (void)setActiveRoute:(id)a3 completion:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "setActiveRoute:reason:completion:", v6, 0, v5);

}

+ (void)setActiveRoute:(id)a3 reason:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v7;
  v11 = v10;
  if (v10 && (v12 = objc_msgSend(v10, "isDeviceRoute"), v11, !v12))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "endpointWrapper");
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v14, "unwrappedValue");
      v17 = v9;
      MRAVEndpointUpdateActiveSystemEndpointWithReason();

      v13 = v17;
    }
    else
    {
      if (!v9)
        goto LABEL_5;
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v19 = *MEMORY[0x1E0CB2938];
      v20[0] = CFSTR("Active route must be of type MPAVEndpointRoute.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("MPAVRoutingControllerErrorDomain"), 4, v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v9 + 2))(v9, v16);

    }
  }
  else
  {
    v18 = v9;
    MRAVEndpointUpdateActiveSystemEndpointWithReason();
    v13 = v18;
  }

LABEL_5:
}

+ (id)systemRouteWithContextUID:(id)a3
{
  MPAVEndpointRoute *v3;

  if (a3)
  {
    v3 = -[MPAVEndpointRoute initWithEndpoint:]([MPAVEndpointRoute alloc], "initWithEndpoint:", MRAVEndpointGetLocalEndpoint());
  }
  else
  {
    objc_msgSend(a1, "systemRoute");
    v3 = (MPAVEndpointRoute *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (BOOL)bundleIdRepresentsLongFormVideoContent:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;

  v3 = (void *)MEMORY[0x1E0D48560];
  v4 = a3;
  objc_msgSend(v3, "sharedAVSystemController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasRouteSharingPolicyLongFormVideo:", v4);

  return v6;
}

+ (id)_currentDeviceRoutingSymbolName
{
  if (_currentDeviceRoutingSymbolName_onceToken != -1)
    dispatch_once(&_currentDeviceRoutingSymbolName_onceToken, &__block_literal_global_99);
  return (id)_currentDeviceRoutingSymbolName___symbolName;
}

+ (id)_symbolNameForModelID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(a1, "_symbolNameMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CEC3F8], "_typeWithDeviceModelCode:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0D3A838];
      objc_msgSend(v7, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      objc_msgSend(v8, "symbolForTypeIdentifier:withResolutionStrategy:variantOptions:error:", v9, 1, 1, &v16);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v16;

      objc_msgSend(v10, "name");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if (v11)
      {
        v14 = os_log_create("com.apple.amp.mediaplayer", "Routing");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          v18 = v4;
          v19 = 2114;
          v20 = v7;
          v21 = 2114;
          v22 = v11;
          _os_log_impl(&dword_193B9B000, v14, OS_LOG_TYPE_ERROR, "Failed to find product symbol with model: %{public}@ uti: %{public}@ error: %{public}@", buf, 0x20u);
        }
      }
      else
      {
        if (!v12)
        {
LABEL_10:
          v6 = v13;

          goto LABEL_11;
        }
        objc_msgSend(a1, "_symbolNameMap");
        v14 = objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKey:](v14, "setObject:forKey:", v13, v4);
      }

      goto LABEL_10;
    }
  }
  else
  {
    v6 = 0;
  }
LABEL_11:

  return v6;
}

+ (id)_symbolNameForProductIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    return 0;
  v5 = v4;
  objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_symbolNameMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(v7, "componentsSeparatedByString:", CFSTR(","));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (!v11 || !v12)
      goto LABEL_13;
    objc_msgSend(MEMORY[0x1E0CEC3F8], "_typeWithBluetoothProductID:vendorID:", objc_msgSend(v12, "intValue"), (unsigned __int16)objc_msgSend(v11, "intValue"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0D3A838];
    objc_msgSend(v14, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    objc_msgSend(v15, "symbolForTypeIdentifier:withResolutionStrategy:variantOptions:error:", v16, 1, 1, &v23);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v23;

    objc_msgSend(v17, "name");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    if (v18)
    {
      v21 = os_log_create("com.apple.amp.mediaplayer", "Routing");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v25 = v7;
        v26 = 2114;
        v27 = v14;
        v28 = 2114;
        v29 = v18;
        _os_log_impl(&dword_193B9B000, v21, OS_LOG_TYPE_ERROR, "Failed to find bluetooth symbol with model: %{public}@ uti: %{public}@ error: %{public}@", buf, 0x20u);
      }
    }
    else
    {
      if (!v19)
      {
LABEL_12:
        v9 = v20;

LABEL_13:
        goto LABEL_14;
      }
      objc_msgSend(a1, "_symbolNameMap");
      v21 = objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKey:](v21, "setObject:forKey:", v20, v7);
    }

    goto LABEL_12;
  }
LABEL_14:

  return v9;
}

void __68__MPAVRoutingController__getActiveRouteWithTimeout_type_completion___block_invoke_2()
{
  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_109);
}

void __68__MPAVRoutingController__getActiveRouteWithTimeout_type_completion___block_invoke_3()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("MPAVRoutingControllerActiveSystemRouteDidChangeNotification"), 0);

}

void __56__MPAVRoutingController__currentDeviceRoutingSymbolName__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEC3F8], "_typeOfCurrentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0D3A838], "symbolForTypeIdentifier:withResolutionStrategy:variantOptions:error:", v1, 1, 1, &v7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v7;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.mediaplayer", "Routing");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v9 = v1;
      v10 = 2114;
      v11 = v3;
      _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_ERROR, "Failed to find symbol with uti: %{public}@ error: %{public}@", buf, 0x16u);
    }

  }
  objc_msgSend(v2, "name");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)_currentDeviceRoutingSymbolName___symbolName;
  _currentDeviceRoutingSymbolName___symbolName = v5;

}

uint64_t __58__MPAVRoutingController_setActiveRoute_reason_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __58__MPAVRoutingController_setActiveRoute_reason_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __46__MPAVRoutingController__symbolNameForRoutes___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  int v10;
  id v11;

  v11 = a2;
  v7 = a4;
  v8 = v7;
  switch(a3)
  {
    case 9:
      if ((objc_msgSend(v11, "isLowFidelityRoute") & 1) == 0)
      {
        v9 = a1 + 96;
        goto LABEL_13;
      }
      break;
    case 11:
      v9 = a1 + 56;
      goto LABEL_13;
    case 16:
      v9 = a1 + 80;
      goto LABEL_13;
    case 17:
      v10 = objc_msgSend(v7, "containsString:", CFSTR("AudioAccessory5"));
      v9 = a1 + 40;
      if (v10)
        v9 = a1 + 32;
      goto LABEL_13;
    case 18:
      v9 = a1 + 48;
      goto LABEL_13;
    case 22:
      v9 = a1 + 64;
      goto LABEL_13;
    case 23:
      v9 = a1 + 72;
      goto LABEL_13;
    case 24:
      v9 = a1 + 88;
LABEL_13:
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v9 + 8) + 24);
      break;
    default:
      break;
  }

}

void __39__MPAVRoutingController__symbolNameMap__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_symbolNameMap___symbolNameMap;
  _symbolNameMap___symbolNameMap = v0;

}

@end
