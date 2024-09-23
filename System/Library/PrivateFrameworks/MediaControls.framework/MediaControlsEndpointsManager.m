@implementation MediaControlsEndpointsManager

- (MediaControlsEndpointsManager)initWithConfiguration:(id)a3
{
  id v4;
  MediaControlsEndpointsManager *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *serialQueue;
  NSMutableDictionary *v8;
  NSMutableDictionary *endpointControllersMap;
  uint64_t v10;
  MPMediaControlsConfiguration *configuration;
  MediaControlsHomeObserver *v12;
  MediaControlsHomeObserver *homeObserver;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  MPAVRoutingController *routingController;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)MediaControlsEndpointsManager;
  v5 = -[MediaControlsEndpointsManager init](&v26, sel_init);
  if (v5)
  {
    v6 = dispatch_queue_create("com.apple.MediaControls.MediaControlsEndpointsManager/serialQueue", 0);
    serialQueue = v5->_serialQueue;
    v5->_serialQueue = (OS_dispatch_queue *)v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    endpointControllersMap = v5->_endpointControllersMap;
    v5->_endpointControllersMap = v8;

    v10 = objc_msgSend(v4, "copy");
    configuration = v5->_configuration;
    v5->_configuration = (MPMediaControlsConfiguration *)v10;

    v5->_discoveryMode = 0;
    v12 = objc_alloc_init(MediaControlsHomeObserver);
    homeObserver = v5->_homeObserver;
    v5->_homeObserver = v12;

    -[MediaControlsHomeObserver setDelegate:](v5->_homeObserver, "setDelegate:", v5);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@(endpoints)"), objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[MPMediaControlsConfiguration style](v5->_configuration, "style");
    if (v15 <= 6)
    {
      if (((1 << v15) & 0x72) != 0)
      {
        v16 = (void *)MEMORY[0x1E0CC2318];
        -[MPMediaControlsConfiguration routingContextUID](v5->_configuration, "routingContextUID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "systemRouteWithContextUID:", v17);
        v18 = (id)objc_claimAutoreleasedReturnValue();

        v27[0] = v18;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
      }
      else
      {
        v18 = objc_alloc_init(MEMORY[0x1E0CC22E8]);
        -[MPMediaControlsConfiguration routingContextUID](v5->_configuration, "routingContextUID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setRoutingContextUID:", v19);

        v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC2318]), "initWithDataSource:name:", v18, v14);
        routingController = v5->_routingController;
        v5->_routingController = (MPAVRoutingController *)v20;

        -[MPAVRoutingController setDelegate:](v5->_routingController, "setDelegate:", v5);
        -[MPAVRoutingController setDiscoveryMode:](v5->_routingController, "setDiscoveryMode:", v5->_discoveryMode);
        objc_msgSend(v4, "presentingAppBundleID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPAVRoutingController setPresentedBundleID:](v5->_routingController, "setPresentedBundleID:", v22);

        -[MPAVRoutingController availableRoutes](v5->_routingController, "availableRoutes");
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[MediaControlsEndpointsManager _updateWithRoutes:](v5, "_updateWithRoutes:", v23);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", v5, sel__activeSystemRouteDidChange_, *MEMORY[0x1E0CC1CE0], 0);

    -[MediaControlsEndpointsManager loadActiveSystemRoute](v5, "loadActiveSystemRoute");
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[MediaControlsHomeObserver setDelegate:](self->_homeObserver, "setDelegate:", 0);
  -[MPAVRoutingController setDelegate:](self->_routingController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MediaControlsEndpointsManager;
  -[MediaControlsEndpointsManager dealloc](&v3, sel_dealloc);
}

- (void)setActiveSystemRoute:(id)a3 reason:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;

  v6 = (objc_class *)MEMORY[0x1E0D4C608];
  v7 = a4;
  v8 = a3;
  v9 = (id)objc_msgSend([v6 alloc], "initWithName:requestID:reason:userInitiated:", CFSTR("setActiveSystemRoute:reason:"), 0, v7, 0);

  -[MediaControlsEndpointsManager setActiveSystemRoute:requestDetails:](self, "setActiveSystemRoute:requestDetails:", v8, v9);
}

- (void)setActiveSystemRoute:(id)a3 requestDetails:(id)a4
{
  id v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  MediaControlsEndpointsManager *v18;

  v6 = a4;
  objc_msgSend(a3, "routeUID");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v8 = self->_activeSystemRouteUID;
    if (v8 == v7)
    {

    }
    else
    {
      v9 = v8;
      v10 = -[NSString isEqual:](v8, "isEqual:", v7);

      if ((v10 & 1) == 0)
      {
        -[MediaControlsEndpointsManager updateActiveSystemRoute:](self, "updateActiveSystemRoute:", v7);
        -[MediaControlsEndpointsManager activeSystemRoute](self, "activeSystemRoute");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)MEMORY[0x1E0CC2318];
        objc_msgSend(v6, "reason");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __69__MediaControlsEndpointsManager_setActiveSystemRoute_requestDetails___block_invoke;
        v15[3] = &unk_1E5819A50;
        v16 = v11;
        v17 = v6;
        v18 = self;
        v14 = v11;
        objc_msgSend(v12, "setActiveRoute:reason:completion:", v14, v13, v15);

      }
    }
  }

}

void __69__MediaControlsEndpointsManager_setActiveSystemRoute_requestDetails___block_invoke(id *a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(a1[4], "endpointObject");
  v4 = objc_claimAutoreleasedReturnValue();
  v10 = (id)v4;
  if (a2 || !v4)
  {
    if (a2)
      objc_msgSend(a1[6], "loadActiveSystemRoute");
  }
  else if (objc_msgSend(a1[5], "userInitiated"))
  {
    objc_msgSend(a1[6], "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "donatingAppBundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[6], "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isDonatingAppEligible");

    +[MRURouteRecommender sharedInstance](MRURouteRecommender, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "donatePickerChoiceFor:bundleID:isEligibleApp:reason:", v10, v6, v8, CFSTR("setActiveSystemRoute"));

  }
}

- (void)loadActiveSystemRoute
{
  MPAVRoutingController *routingController;
  _QWORD v4[4];
  id v5;
  id location;

  if (!self->_isRequestingActiveRoute)
  {
    self->_isRequestingActiveRoute = 1;
    objc_initWeak(&location, self);
    routingController = self->_routingController;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __54__MediaControlsEndpointsManager_loadActiveSystemRoute__block_invoke;
    v4[3] = &unk_1E581C338;
    objc_copyWeak(&v5, &location);
    -[MPAVRoutingController getActiveRouteWithTimeout:completion:](routingController, "getActiveRouteWithTimeout:completion:", v4, 3.0);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __54__MediaControlsEndpointsManager_loadActiveSystemRoute__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__MediaControlsEndpointsManager_loadActiveSystemRoute__block_invoke_2;
  v5[3] = &unk_1E5818C18;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __54__MediaControlsEndpointsManager_loadActiveSystemRoute__block_invoke_2(uint64_t a1)
{
  _BYTE *WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    WeakRetained[25] = 0;
    v4 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "routeUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateActiveSystemRoute:", v3);

    WeakRetained = v4;
  }

}

- (void)updateActiveSystemRoute:(id)a3
{
  int64_t v5;
  NSString *v6;
  void *pendingActiveSystemRouteUID;
  int64_t v8;
  NSString *v9;
  char v10;
  NSString *v11;
  void *v12;
  NSString *v13;

  v13 = (NSString *)a3;
  v5 = -[MediaControlsEndpointsManager _indexOfRouteWithUID:](self, "_indexOfRouteWithUID:");
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = (NSString *)-[NSString copy](v13, "copy");
    pendingActiveSystemRouteUID = self->_pendingActiveSystemRouteUID;
    self->_pendingActiveSystemRouteUID = v6;
LABEL_6:

    goto LABEL_7;
  }
  v8 = v5;
  v9 = self->_activeSystemRouteUID;
  pendingActiveSystemRouteUID = v13;
  if (v9 == v13)
    goto LABEL_6;
  v10 = -[NSString isEqual:](v9, "isEqual:", v13);

  if ((v10 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_activeSystemRouteUID, a3);
    v11 = self->_pendingActiveSystemRouteUID;
    self->_pendingActiveSystemRouteUID = 0;

    -[NSArray objectAtIndex:](self->_routes, "objectAtIndex:", v8);
    pendingActiveSystemRouteUID = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsEndpointsManager delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "endpointsManager:activeSystemRouteDidChange:", self, pendingActiveSystemRouteUID);

    goto LABEL_6;
  }
LABEL_7:

}

- (MPAVEndpointRoute)activeSystemRoute
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[MediaControlsEndpointsManager _indexOfRouteWithUID:](self, "_indexOfRouteWithUID:", self->_activeSystemRouteUID);
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = (void *)MEMORY[0x1E0CC2318];
    -[MPMediaControlsConfiguration routingContextUID](self->_configuration, "routingContextUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "systemRouteWithContextUID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[NSArray objectAtIndex:](self->_routes, "objectAtIndex:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (MPAVEndpointRoute *)v6;
}

- (MPAVEndpointRoute)resolvedActiveSystemRoute
{
  int64_t v3;
  void *v4;

  v3 = -[MediaControlsEndpointsManager _indexOfRouteWithUID:](self, "_indexOfRouteWithUID:", self->_activeSystemRouteUID);
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = 0;
  }
  else
  {
    -[NSArray objectAtIndex:](self->_routes, "objectAtIndex:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (MPAVEndpointRoute *)v4;
}

- (void)setDiscoveryMode:(int64_t)a3
{
  int64_t discoveryMode;
  MediaControlsHomeObserver *homeObserver;
  id v7;

  discoveryMode = self->_discoveryMode;
  if (discoveryMode != a3)
  {
    self->_discoveryMode = a3;
    -[MPAVRoutingController setDiscoveryMode:](self->_routingController, "setDiscoveryMode:");
    homeObserver = self->_homeObserver;
    if (a3)
    {
      -[MediaControlsHomeObserver beginObserving](homeObserver, "beginObserving");
      if (discoveryMode)
        return;
LABEL_6:
      -[MPAVRoutingController availableRoutes](self->_routingController, "availableRoutes");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[MediaControlsEndpointsManager _updateWithRoutes:](self, "_updateWithRoutes:", v7);

      return;
    }
    -[MediaControlsHomeObserver stopObserving](homeObserver, "stopObserving");
    if (!discoveryMode)
      goto LABEL_6;
  }
}

- (id)endpointControllerForRoute:(id)a3
{
  NSMutableDictionary *endpointControllersMap;
  void *v4;
  void *v5;

  endpointControllersMap = self->_endpointControllersMap;
  objc_msgSend(a3, "routeUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](endpointControllersMap, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isActiveSystemEndpointEqualToLocalEndpoint
{
  NSString *activeSystemRouteUID;
  void *v3;
  void *v4;

  activeSystemRouteUID = self->_activeSystemRouteUID;
  objc_msgSend(MEMORY[0x1E0CC2318], "systemRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "routeUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(activeSystemRouteUID) = -[NSString isEqualToString:](activeSystemRouteUID, "isEqualToString:", v4);

  return (char)activeSystemRouteUID;
}

- (void)routingControllerAvailableRoutesDidChange:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(a3, "availableRoutes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __75__MediaControlsEndpointsManager_routingControllerAvailableRoutesDidChange___block_invoke;
  v6[3] = &unk_1E5818CB0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

_BYTE *__75__MediaControlsEndpointsManager_routingControllerAvailableRoutesDidChange___block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (result[24])
    return (_BYTE *)objc_msgSend(result, "_updateWithRoutes:", *(_QWORD *)(a1 + 40));
  return result;
}

- (void)getOutputDeviceIsPlaying:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  int v21;
  NSObject *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v27 = 0;
    -[MediaControlsEndpointsManager _endpointControllerContainingOutputDevice:endpointWrapper:](self, "_endpointControllerContainingOutputDevice:endpointWrapper:", v6, &v27);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v27;
    objc_msgSend(v8, "route");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v8 && v9)
    {
      if (objc_msgSend(v10, "supportsRemoteControl"))
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "UUIDString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        _MRLogForCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[MediaControlsEndpointsManager getOutputDeviceIsPlaying:completion:].cold.1();

        v15 = *MEMORY[0x1E0CC1CC8];
        v28[0] = *MEMORY[0x1E0CC1CB8];
        v28[1] = v15;
        v29[0] = v13;
        v29[1] = CFSTR("MediaControlsEndpointsManager-getOutputDeviceIsPlaying");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "route");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "connection");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __69__MediaControlsEndpointsManager_getOutputDeviceIsPlaying_completion___block_invoke;
        v24[3] = &unk_1E581C388;
        v26 = v7;
        v25 = v9;
        objc_msgSend(v18, "connectWithUserInfo:completion:", v16, v24);

        goto LABEL_12;
      }
      objc_msgSend(v8, "route");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isDeviceRoute");

      if (v21)
      {
        _MRLogForCategory();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          -[MediaControlsEndpointsManager getOutputDeviceIsPlaying:completion:].cold.2(v22);

        MRMediaRemoteGetLocalOrigin();
        v23 = v7;
        MRMediaRemoteGetNowPlayingApplicationPlaybackStateForOrigin();

        goto LABEL_12;
      }
    }
    else
    {
      _MRLogForCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[MediaControlsEndpointsManager getOutputDeviceIsPlaying:completion:].cold.3();

    }
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
LABEL_12:

  }
}

void __69__MediaControlsEndpointsManager_getOutputDeviceIsPlaying_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  const void *v6;
  NSObject *v7;
  id v8;

  v3 = a2;
  if (v3)
  {
    _MRLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __69__MediaControlsEndpointsManager_getOutputDeviceIsPlaying_completion___block_invoke_cold_2();

    goto LABEL_5;
  }
  objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "unwrappedValue");
  v5 = MRAVEndpointCopyOrigin();
  if (!v5)
  {
LABEL_5:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_10;
  }
  v6 = (const void *)v5;
  _MRLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __69__MediaControlsEndpointsManager_getOutputDeviceIsPlaying_completion___block_invoke_cold_1();

  v8 = *(id *)(a1 + 40);
  MRMediaRemoteGetNowPlayingApplicationPlaybackStateForOrigin();
  CFRelease(v6);

LABEL_10:
}

uint64_t __69__MediaControlsEndpointsManager_getOutputDeviceIsPlaying_completion___block_invoke_25(uint64_t a1)
{
  MRMediaRemotePlaybackStateIsAdvancing();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __69__MediaControlsEndpointsManager_getOutputDeviceIsPlaying_completion___block_invoke_27(uint64_t a1)
{
  MRMediaRemotePlaybackStateIsAdvancing();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)homeObserverDidUpdateKnownUIDs:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__MediaControlsEndpointsManager_homeObserverDidUpdateKnownUIDs___block_invoke;
  block[3] = &unk_1E5818C88;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __64__MediaControlsEndpointsManager_homeObserverDidUpdateKnownUIDs___block_invoke(uint64_t a1)
{
  id *v1;
  id v2;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 1;
  v1 = *(id **)(a1 + 32);
  objc_msgSend(v1[10], "availableRoutes");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_updateWithRoutes:", v2);

}

- (void)_activeSystemRouteDidChange:(id)a3
{
  void *v4;
  void *v5;
  int v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D4C760]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  if (!v6)
    -[MediaControlsEndpointsManager loadActiveSystemRoute](self, "loadActiveSystemRoute");
}

- (int64_t)_indexOfRouteWithUID:(id)a3
{
  id v4;
  void *v5;
  NSArray *routes;
  int64_t v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = v4;
  if (self->_routes && objc_msgSend(v4, "length"))
  {
    routes = self->_routes;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __54__MediaControlsEndpointsManager__indexOfRouteWithUID___block_invoke;
    v9[3] = &unk_1E581C3B0;
    v10 = v5;
    v7 = -[NSArray indexOfObjectPassingTest:](routes, "indexOfObjectPassingTest:", v9);

  }
  else
  {
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

uint64_t __54__MediaControlsEndpointsManager__indexOfRouteWithUID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "routeUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)_endpointControllerContainingOutputDevice:(id)a3 endpointWrapper:(id *)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  id obj;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "routeUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_endpointControllersMap, "objectEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v23)
  {
    v22 = *(_QWORD *)v29;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v29 != v22)
        objc_enumerationMutation(obj);
      v8 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v7);
      objc_msgSend(v8, "route");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "endpointWrapper");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_retainAutorelease(v10);
      objc_msgSend(v11, "unwrappedValue");
      v12 = (void *)MRAVEndpointCopyOutputDevices();
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v13 = v12;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v25;
        while (2)
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v25 != v16)
              objc_enumerationMutation(v13);
            v18 = (void *)MRAVOutputDeviceCopyUniqueIdentifier();
            if (objc_msgSend(v18, "isEqualToString:", v6))
            {
              if (a4)
                *a4 = objc_retainAutorelease(v11);
              v19 = v8;

              goto LABEL_18;
            }

          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v15)
            continue;
          break;
        }
      }
      v19 = 0;
LABEL_18:

      if (v19)
        break;
      if (++v7 == v23)
      {
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        if (v23)
          goto LABEL_3;
        goto LABEL_21;
      }
    }
  }
  else
  {
LABEL_21:
    v19 = 0;
  }

  return v19;
}

- (BOOL)_homeHasRoute:(id)a3
{
  MediaControlsHomeObserver *homeObserver;
  void *v4;

  homeObserver = self->_homeObserver;
  objc_msgSend(a3, "routeUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(homeObserver) = -[MediaControlsHomeObserver hasAccessoryWithUID:](homeObserver, "hasAccessoryWithUID:", v4);

  return (char)homeObserver;
}

- (void)_setRoutes:(id)a3 withChangeDetails:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSArray *v10;
  NSArray *routes;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  NSUInteger v25;
  void *v26;
  NSArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  NSArray *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  void *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[5];
  id v59;
  id v60;
  _QWORD aBlock[5];
  _QWORD v62[5];
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "deletedItemIndexPaths");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v62[0] = MEMORY[0x1E0C809B0];
  v62[1] = 3221225472;
  v62[2] = __62__MediaControlsEndpointsManager__setRoutes_withChangeDetails___block_invoke;
  v62[3] = &unk_1E581C3D8;
  v62[4] = self;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v62);

  v10 = (NSArray *)objc_msgSend(v6, "copy");
  routes = self->_routes;
  self->_routes = v10;

  aBlock[0] = v9;
  aBlock[1] = 3221225472;
  aBlock[2] = __62__MediaControlsEndpointsManager__setRoutes_withChangeDetails___block_invoke_2;
  aBlock[3] = &unk_1E581C400;
  aBlock[4] = self;
  v12 = _Block_copy(aBlock);
  v45 = v6;
  v13 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v7, "insertedItemIndexPaths");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = v9;
  v58[1] = 3221225472;
  v58[2] = __62__MediaControlsEndpointsManager__setRoutes_withChangeDetails___block_invoke_3;
  v58[3] = &unk_1E581C428;
  v58[4] = self;
  v15 = v12;
  v60 = v15;
  v16 = v13;
  v59 = v16;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v58);

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v17 = v16;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v55 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
        objc_msgSend(v22, "routeUID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](self->_endpointControllersMap, "objectForKey:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setRoute:", v22);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
    }
    while (v19);
  }

  v25 = -[NSArray count](self->_routes, "count");
  if (v25 != -[NSMutableDictionary count](self->_endpointControllersMap, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("Routes does not match EndpointControllersMap."));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_routes, "count"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v27 = self->_routes;
    v28 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v51;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v51 != v30)
            objc_enumerationMutation(v27);
          objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * j), "routeUID");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addObject:", v32);

        }
        v29 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
      }
      while (v29);
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSArray count](self->_routes, "count"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "componentsJoinedByString:", CFSTR(", "));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "appendFormat:", CFSTR("\nRoute Count : %@, UIDs : %@"), v33, v34);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSMutableDictionary count](self->_endpointControllersMap, "count"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary allKeys](self->_endpointControllersMap, "allKeys");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "componentsJoinedByString:", CFSTR(", "));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "appendFormat:", CFSTR("\nEndpoint Controller Map Count : %@, UIDs : %@"), v35, v37);

    objc_msgSend(v44, "appendFormat:", CFSTR("\nChange details: %@"), v7);
    _MRLogForCategory();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      -[MediaControlsEndpointsManager _setRoutes:withChangeDetails:].cold.1();

    -[NSMutableDictionary removeAllObjects](self->_endpointControllersMap, "removeAllObjects");
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v39 = self->_routes;
    v40 = -[NSArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v46, v63, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v47;
      do
      {
        for (k = 0; k != v41; ++k)
        {
          if (*(_QWORD *)v47 != v42)
            objc_enumerationMutation(v39);
          (*((void (**)(id, _QWORD))v15 + 2))(v15, *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * k));
        }
        v41 = -[NSArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v46, v63, 16);
      }
      while (v41);
    }

  }
  if (-[NSString length](self->_pendingActiveSystemRouteUID, "length"))
    -[MediaControlsEndpointsManager updateActiveSystemRoute:](self, "updateActiveSystemRoute:", self->_pendingActiveSystemRouteUID);

}

void __62__MediaControlsEndpointsManager__setRoutes_withChangeDetails___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectAtIndex:", objc_msgSend(a2, "item"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "routeUID");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", v4);
}

void __62__MediaControlsEndpointsManager__setRoutes_withChangeDetails___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  MediaControlsEndpointController *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "routeUID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[MediaControlsEndpointController initWithEndpoint:]([MediaControlsEndpointController alloc], "initWithEndpoint:", v3);

  -[MediaControlsEndpointController setConfiguration:](v4, "setConfiguration:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKey:", v4, v5);

}

void __62__MediaControlsEndpointsManager__setRoutes_withChangeDetails___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectAtIndex:", objc_msgSend(a2, "item"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "removeObject:", v3);

}

- (void)_updateWithRoutes:(id)a3
{
  id v5;
  NSArray *pendingRoutesToUpdate;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
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
  id v26;
  NSMutableDictionary *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  dispatch_block_t v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  _QWORD block[5];
  id v47;
  id v48;
  id v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[5];
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (self->_isUpdatingRoutes)
  {
    objc_storeStrong((id *)&self->_pendingRoutesToUpdate, a3);
  }
  else
  {
    self->_isUpdatingRoutes = 1;
    pendingRoutesToUpdate = self->_pendingRoutesToUpdate;
    self->_pendingRoutesToUpdate = 0;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v45 = v5;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v57 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
          if (objc_msgSend(v13, "isSmartAudio"))
            objc_msgSend(v7, "addObject:", v13);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
      }
      while (v10);
    }

    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __51__MediaControlsEndpointsManager__updateWithRoutes___block_invoke;
    v55[3] = &unk_1E581C450;
    v55[4] = self;
    objc_msgSend(v7, "sortUsingComparator:", v55);
    objc_msgSend(MEMORY[0x1E0D4C650], "currentSettings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "supportRouteRecommendations");

    if (v15)
    {
      +[MRURouteRecommender sharedInstance](MRURouteRecommender, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "updateRecommendations");

      +[MRURouteRecommender sharedInstance](MRURouteRecommender, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "sortEndpointRoutes:", v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = (void *)objc_msgSend(v18, "mutableCopy");
      v20 = (void *)MEMORY[0x1E0CC2318];
      -[MPMediaControlsConfiguration routingContextUID](self->_configuration, "routingContextUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "systemRouteWithContextUID:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "removeObject:", v22);
      objc_msgSend(v19, "insertObject:atIndex:", v22, 0);

      v7 = v19;
    }
    if (!objc_msgSend(v7, "count"))
    {
      v23 = (void *)MEMORY[0x1E0CC2318];
      -[MPMediaControlsConfiguration routingContextUID](self->_configuration, "routingContextUID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "systemRouteWithContextUID:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v25);

    }
    v42 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v43 = (void *)-[NSArray copy](self->_routes, "copy");
    v44 = v7;
    v41 = (void *)objc_msgSend(v7, "copy");
    v26 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v27 = self->_endpointControllersMap;
    v28 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v52;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v52 != v30)
            objc_enumerationMutation(v27);
          v32 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j);
          -[NSMutableDictionary objectForKey:](self->_endpointControllersMap, "objectForKey:", v32, v41);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "routeNames");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = (void *)objc_msgSend(v34, "copy");
          objc_msgSend(v26, "setObject:forKey:", v35, v32);

        }
        v29 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
      }
      while (v29);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__MediaControlsEndpointsManager__updateWithRoutes___block_invoke_2;
    block[3] = &unk_1E581C1F8;
    block[4] = self;
    v47 = v43;
    v48 = v41;
    v49 = v26;
    v50 = v42;
    v36 = v42;
    v37 = v26;
    v38 = v41;
    v39 = v43;
    v40 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
    dispatch_async((dispatch_queue_t)self->_serialQueue, v40);

    v5 = v45;
  }

}

uint64_t __51__MediaControlsEndpointsManager__updateWithRoutes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(*(id *)(a1 + 32), "_homeHasRoute:", v5);
  v8 = objc_msgSend(*(id *)(a1 + 32), "_homeHasRoute:", v6);
  v9 = -1;
  if ((objc_msgSend(v5, "isDeviceRoute") & 1) == 0)
  {
    v10 = objc_msgSend(v6, "isDeviceRoute");
    if (v7)
      v11 = -1;
    else
      v11 = 1;
    if (v7 != v8)
      v12 = v11;
    else
      v12 = 0;
    if (v10)
      v9 = 1;
    else
      v9 = v12;
    if (!v9)
    {
      objc_msgSend(v5, "sortName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "sortName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v14, "localizedCaseInsensitiveCompare:", v15);

      if (!v9)
      {
        objc_msgSend(v5, "routeUID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "routeUID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v16, "compare:", v17);

      }
    }
  }

  return v9;
}

void __51__MediaControlsEndpointsManager__updateWithRoutes___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  _QWORD aBlock[5];
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;

  objc_msgSend(*(id *)(a1 + 32), "_createSectionedCollectionFromRoutes:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_createSectionedCollectionFromRoutes:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __51__MediaControlsEndpointsManager__updateWithRoutes___block_invoke_3;
  v25[3] = &unk_1E581AA10;
  v26 = v2;
  v27 = v3;
  v20[0] = v4;
  v20[1] = 3221225472;
  v20[2] = __51__MediaControlsEndpointsManager__updateWithRoutes___block_invoke_4;
  v20[3] = &unk_1E581C478;
  v21 = v26;
  v22 = v27;
  v23 = *(id *)(a1 + 56);
  v24 = *(id *)(a1 + 64);
  v5 = v27;
  v6 = v26;
  objc_msgSend(v6, "changeDetailsToSectionedCollection:isEqualBlock:isUpdatedBlock:", v5, v25, v20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = v4;
  aBlock[1] = 3221225472;
  aBlock[2] = __51__MediaControlsEndpointsManager__updateWithRoutes___block_invoke_5;
  aBlock[3] = &unk_1E581A9A8;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v17 = *(id *)(a1 + 48);
  v8 = v7;
  v18 = v8;
  v19 = *(id *)(a1 + 64);
  v9 = _Block_copy(aBlock);
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __51__MediaControlsEndpointsManager__updateWithRoutes___block_invoke_7;
  block[3] = &unk_1E581A350;
  v10 = *(_QWORD *)(a1 + 32);
  v14 = v8;
  v15 = v9;
  block[4] = v10;
  v11 = v8;
  v12 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __51__MediaControlsEndpointsManager__updateWithRoutes___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "length") == 1)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "itemAtIndexPath:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "itemAtIndexPath:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "isEqual:", v9);

  }
  return v7;
}

uint64_t __51__MediaControlsEndpointsManager__updateWithRoutes___block_invoke_4(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "length") != 1)
  {
    objc_msgSend(a1[4], "itemAtIndexPath:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "itemAtIndexPath:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "routeUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "routeNames");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToArray:", v11) & 1) == 0)
      objc_msgSend(a1[7], "addObject:", v9);

  }
  return 0;
}

void __51__MediaControlsEndpointsManager__updateWithRoutes___block_invoke_5(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD block[5];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_setRoutes:withChangeDetails:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 56);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "updateRoutePropertiesIfNeeded");

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  v8 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v8 + 32))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__MediaControlsEndpointsManager__updateWithRoutes___block_invoke_6;
    block[3] = &unk_1E5818C88;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    *(_BYTE *)(v8 + 26) = 0;
  }
}

uint64_t __51__MediaControlsEndpointsManager__updateWithRoutes___block_invoke_6(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 26) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_updateWithRoutes:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
}

void __51__MediaControlsEndpointsManager__updateWithRoutes___block_invoke_7(id *a1)
{
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;

  objc_msgSend(a1[4], "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = a1[4];
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __51__MediaControlsEndpointsManager__updateWithRoutes___block_invoke_8;
    v4[3] = &unk_1E581C4A0;
    v6 = a1[6];
    v5 = a1[5];
    objc_msgSend(v2, "endpointsManager:defersRoutesReplacement:", v3, v4);

  }
  else
  {
    (*((void (**)(void))a1[6] + 2))();
  }

}

id __51__MediaControlsEndpointsManager__updateWithRoutes___block_invoke_8(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return *(id *)(a1 + 32);
}

- (id)_createSectionedCollectionFromRoutes:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0CC2498];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "appendSection:", CFSTR("SECTION"));
  objc_msgSend(v5, "appendItems:", v4);

  return v5;
}

- (MPMediaControlsConfiguration)configuration
{
  return self->_configuration;
}

- (int64_t)discoveryMode
{
  return self->_discoveryMode;
}

- (NSArray)routes
{
  return self->_routes;
}

- (MediaControlsEndpointsManagerDelegate)delegate
{
  return (MediaControlsEndpointsManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MediaControlsHomeObserver)homeObserver
{
  return self->_homeObserver;
}

- (MPAVRoutingController)routingController
{
  return self->_routingController;
}

- (NSString)activeSystemRouteUID
{
  return self->_activeSystemRouteUID;
}

- (NSString)pendingActiveSystemRouteUID
{
  return self->_pendingActiveSystemRouteUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingActiveSystemRouteUID, 0);
  objc_storeStrong((id *)&self->_activeSystemRouteUID, 0);
  objc_storeStrong((id *)&self->_routingController, 0);
  objc_storeStrong((id *)&self->_homeObserver, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_routes, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_pendingRoutesToUpdate, 0);
  objc_storeStrong((id *)&self->_endpointControllersMap, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

- (void)getOutputDeviceIsPlaying:completion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  v3 = 2114;
  v4 = v0;
  _os_log_error_impl(&dword_1AA991000, v1, OS_LOG_TYPE_ERROR, "<%{public}@> Connecting to request now playing information for: %{public}@", v2, 0x16u);
  OUTLINED_FUNCTION_3();
}

- (void)getOutputDeviceIsPlaying:(os_log_t)log completion:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AA991000, log, OS_LOG_TYPE_ERROR, "Requesting now playing information for local origin", v1, 2u);
}

- (void)getOutputDeviceIsPlaying:completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1AA991000, v0, v1, "Could not get output device playing information - No endpoint found for: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __69__MediaControlsEndpointsManager_getOutputDeviceIsPlaying_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1AA991000, v0, v1, "Requesting now playing information for: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __69__MediaControlsEndpointsManager_getOutputDeviceIsPlaying_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1AA991000, v0, v1, "Could not get output device playing information from MediaRemote. MediaRemote Error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_setRoutes:withChangeDetails:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1AA991000, v0, v1, "%{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
