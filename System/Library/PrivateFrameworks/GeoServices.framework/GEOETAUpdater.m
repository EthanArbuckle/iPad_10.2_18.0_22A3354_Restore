@implementation GEOETAUpdater

- (GEOETAUpdater)init
{
  GEOETAUpdater *v2;
  uint64_t v3;
  NSString *requestingAppIdentifier;
  GEOCommonOptions *v5;
  GEOCommonOptions *commonOptions;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GEOETAUpdater;
  v2 = -[GEOETAUpdater init](&v8, sel_init);
  if (v2)
  {
    GEOApplicationIdentifierOrProcessName();
    v3 = objc_claimAutoreleasedReturnValue();
    requestingAppIdentifier = v2->_requestingAppIdentifier;
    v2->_requestingAppIdentifier = (NSString *)v3;

    *(_WORD *)&v2->_allowRequests = 257;
    v2->_shouldUpdateTrafficOnRoute = 1;
    v2->_requestInterval = 270.0;
    v2->_maxAlternateRoutesCount = 0;
    v5 = objc_alloc_init(GEOCommonOptions);
    commonOptions = v2->_commonOptions;
    v2->_commonOptions = v5;

    -[GEOCommonOptions setIncludeTravelTimeAggressive:](v2->_commonOptions, "setIncludeTravelTimeAggressive:", 1);
    -[GEOCommonOptions setIncludeTravelTimeConservative:](v2->_commonOptions, "setIncludeTravelTimeConservative:", 1);
    -[GEOCommonOptions setIncludeTravelTimeEstimate:](v2->_commonOptions, "setIncludeTravelTimeEstimate:", 1);
    -[GEOCommonOptions setExcludeGuidance:](v2->_commonOptions, "setExcludeGuidance:", 1);
  }
  return v2;
}

- (GEOETAUpdater)initWithRoute:(id)a3 waypoints:(id)a4 routeAttributes:(id)a5
{
  id v8;
  id v9;
  id v10;
  GEOETAUpdater *v11;
  GEOETAUpdater *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[GEOETAUpdater init](self, "init");
  v12 = v11;
  if (v11)
  {
    -[GEOETAUpdater setRoute:](v11, "setRoute:", v8);
    -[GEOETAUpdater setWaypoints:](v12, "setWaypoints:", v9);
    -[GEOETAUpdater setRouteAttributes:](v12, "setRouteAttributes:", v10);
  }

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  -[GEOETAUpdater _clearTimer](self, "_clearTimer");
  v3.receiver = self;
  v3.super_class = (Class)GEOETAUpdater;
  -[GEOETAUpdater dealloc](&v3, sel_dealloc);
}

- (BOOL)requestInProgress
{
  return self->_currentETARequest != 0;
}

- (void)reset
{
  NSObject *v3;
  uint8_t v4[16];

  GEOFindOrCreateLog("com.apple.GeoServices", "ETAUpdates");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "resetting", v4, 2u);
  }

  -[GEOETAUpdater cancelRequest](self, "cancelRequest");
  -[GEOETAUpdater _clearTimer](self, "_clearTimer");
  -[GEOETAUpdater _continueUpdateRequests](self, "_continueUpdateRequests");
}

- (void)_clearTimer
{
  NSObject *v3;
  NSTimer *etaIdleTimer;
  uint8_t v5[16];

  GEOFindOrCreateLog("com.apple.GeoServices", "ETAUpdates");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "Removing timer", v5, 2u);
  }

  -[NSTimer invalidate](self->_etaIdleTimer, "invalidate");
  etaIdleTimer = self->_etaIdleTimer;
  self->_etaIdleTimer = 0;

}

- (void)requestUpdate
{
  id v3;

  if (!self->_currentETARequest)
  {
    -[GEOETAUpdater _updateOrCreateRequest:](self, "_updateOrCreateRequest:", 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[GEOETAUpdater _sendRequest:](self, "_sendRequest:", v3);

  }
}

- (void)cancelRequest
{
  NSObject *v3;
  void *v4;
  GEOETATrafficUpdateRequest *currentETARequest;
  GEOComposedETARoute *etaRoute;
  uint8_t v7[16];

  if (self->_currentETARequest)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "ETAUpdates");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "Clearing current ETA request", v7, 2u);
    }

    +[GEOETARequester sharedRequester](GEOETARequester, "sharedRequester");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelRequest:", self->_currentETARequest);

    currentETARequest = self->_currentETARequest;
    self->_currentETARequest = 0;

    etaRoute = self->_etaRoute;
    self->_etaRoute = 0;

  }
}

- (void)startUpdateRequests
{
  self->_etaState = 1;
  -[GEOETAUpdater _continueUpdateRequests](self, "_continueUpdateRequests");
}

- (void)stopUpdateRequests
{
  NSObject *v3;
  uint8_t v4[16];

  GEOFindOrCreateLog("com.apple.GeoServices", "ETAUpdates");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "Stopping update requests", v4, 2u);
  }

  self->_etaState = 0;
  -[GEOETAUpdater reset](self, "reset");
}

- (void)setRoute:(id)a3
{
  GEOComposedRoute *v5;
  GEORouteMatch *routeMatch;
  GEOComposedRoute *v7;

  v5 = (GEOComposedRoute *)a3;
  if (self->_route != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_route, a3);
    routeMatch = self->_routeMatch;
    self->_routeMatch = 0;

    v5 = v7;
  }

}

- (id)destination
{
  return -[NSArray lastObject](self->_waypoints, "lastObject");
}

- (void)_updateRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  GEOComposedETARoute *v23;
  GEOComposedETARoute *etaRoute;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "setRequestingAppId:", self->_requestingAppIdentifier);
  +[GEOUserSession sharedInstance](GEOUserSession, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __32__GEOETAUpdater__updateRequest___block_invoke;
  v29[3] = &unk_1E1C04548;
  v6 = v4;
  v30 = v6;
  objc_msgSend(v5, "shortSessionValues:", v29);

  objc_msgSend(v6, "setCurrentUserLocation:", self->_userLocation);
  objc_msgSend(v6, "setDirectionsResponseID:", self->_directionsResponseID);
  objc_msgSend(v6, "setCommonOptions:", self->_commonOptions);
  objc_msgSend(v6, "setMaxAlternateRouteCount:", LODWORD(self->_maxAlternateRoutesCount));
  +[GEOExperimentConfiguration sharedConfiguration](GEOExperimentConfiguration, "sharedConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_mapsAbClientMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientDatasetMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAbClientMetadata:", v9);

  if (GEOConfigGetBOOL(MapsFeaturesConfig_DrivingMultiWaypointRoutesEnabled, (uint64_t)off_1EDF4B0C8))
  {
    objc_msgSend(v6, "clearWaypointTypeds");
    -[GEOETAUpdater waypoints](self, "waypoints");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOETAUpdater waypoints](self, "waypoints");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "subarrayWithRange:", 1, objc_msgSend(v11, "count") - 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v26;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v26 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v17), "geoWaypointTyped", (_QWORD)v25);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addWaypointTyped:", v18);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      }
      while (v15);
    }

  }
  else
  {
    objc_msgSend(v6, "clearDestinationWaypointTypeds");
    -[GEOETAUpdater destination](self, "destination");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "geoWaypointTyped");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addDestinationWaypointTyped:", v19);

  }
  +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "clientCapabilities");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClientCapabilities:", v21);

  objc_msgSend(v6, "clientCapabilities");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "updateWithETATrafficUpdateRequest:", v6);

  v23 = objc_alloc_init(GEOComposedETARoute);
  etaRoute = self->_etaRoute;
  self->_etaRoute = v23;

  -[GEOComposedETARoute prepareForRequest:route:routeMatch:targetLegIndex:state:](self->_etaRoute, "prepareForRequest:route:routeMatch:targetLegIndex:state:", v6, self->_route, self->_routeMatch, 0x7FFFFFFFFFFFFFFFLL, 0);
}

void __32__GEOETAUpdater__updateRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10)
{
  GEOPrivacyMetadata *v15;
  void *v16;
  id v17;

  objc_msgSend(*(id *)(a1 + 32), "setSessionID:", a2, a3);
  objc_msgSend(*(id *)(a1 + 32), "setSessionRelativeTimestamp:", a6);
  if (a10)
  {
    v15 = objc_alloc_init(GEOPrivacyMetadata);
    objc_msgSend(*(id *)(a1 + 32), "setPrivacyMetadata:", v15);

    objc_msgSend(*(id *)(a1 + 32), "privacyMetadata");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setIsUnderageAccount:", a8);

    objc_msgSend(*(id *)(a1 + 32), "privacyMetadata");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setIsManagedAccount:", a9);

  }
}

- (void)_addRouteAttributesToRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  GEORouteAttributes *routeAttributes;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  routeAttributes = self->_routeAttributes;
  if (routeAttributes)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __57__GEOETAUpdater__addRouteAttributesToRequest_completion___block_invoke;
    v10[3] = &unk_1E1C0DB18;
    v11 = v6;
    v12 = v8;
    -[GEORouteAttributes buildRouteAttributesForETAUpdateRequest:queue:result:](routeAttributes, "buildRouteAttributesForETAUpdateRequest:queue:result:", v11, MEMORY[0x1E0C80D38], v10);

  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __57__GEOETAUpdater__addRouteAttributesToRequest_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(v5, "setRouteAttributes:", a2);
  v6 = v7;
  if (a2)
    v6 = 0;
  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v6);

}

- (void)setRouteMatch:(id)a3
{
  objc_storeStrong((id *)&self->_routeMatch, a3);
}

- (void)_startStateWaitingForBestTimeStart:(id)a3
{
  double v4;
  id v5;

  -[GEOETAUpdater _clearTimer](self, "_clearTimer", a3);
  if (self->_etaState)
  {
    -[GEOETAUpdater _currentTime](self, "_currentTime");
    self->_lastETARequestTime = v4;
    if (self->_allowRequests)
    {
      if (-[GEOETAUpdater _shouldStartConditionalETARequest](self, "_shouldStartConditionalETARequest"))
      {
        self->_etaState = 2;
        -[GEOETAUpdater _startConditionalConnectionETARequest](self, "_startConditionalConnectionETARequest");
      }
      else
      {
        self->_etaState = 3;
        -[GEOETAUpdater _updateOrCreateRequest:](self, "_updateOrCreateRequest:", 0);
        v5 = (id)objc_claimAutoreleasedReturnValue();
        -[GEOETAUpdater _sendRequest:](self, "_sendRequest:", v5);

      }
    }
    else
    {
      -[GEOETAUpdater _continueUpdateRequests](self, "_continueUpdateRequests");
    }
  }
}

- (void)_startConditionalConnectionETARequest
{
  NSObject *v3;
  GEOETATrafficUpdateRequest *v4;
  uint64_t v5;
  void *v6;
  GEOETATrafficUpdateRequest *v7;
  id v8;
  void *v9;
  GEOETATrafficUpdateRequest *v10;
  void *v11;
  double debugTimeWindowDuration;
  GEODataConditionalConnectionProperties *v13;
  id WeakRetained;
  void *v15;
  GEOETATrafficUpdateRequest *currentETARequest;
  void *v17;
  _QWORD v18[5];
  GEOETATrafficUpdateRequest *v19;
  _QWORD v20[5];
  GEOETATrafficUpdateRequest *v21;
  id v22;
  _QWORD v23[5];
  uint8_t buf[16];

  GEOFindOrCreateLog("com.apple.GeoServices", "ETAUpdates");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "Queue conditional connection ETA Request", buf, 2u);
  }

  v4 = objc_alloc_init(GEOETATrafficUpdateRequest);
  objc_storeStrong((id *)&self->_currentETARequest, v4);
  -[GEOETAUpdater _updateRequest:](self, "_updateRequest:", v4);
  v5 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __54__GEOETAUpdater__startConditionalConnectionETARequest__block_invoke;
  v23[3] = &unk_1E1C00E10;
  v23[4] = self;
  v6 = (void *)MEMORY[0x18D765024](v23);
  v20[0] = v5;
  v20[1] = 3221225472;
  v20[2] = __54__GEOETAUpdater__startConditionalConnectionETARequest__block_invoke_16;
  v20[3] = &unk_1E1C0DB68;
  v20[4] = self;
  v7 = v4;
  v21 = v7;
  v22 = v6;
  v8 = v6;
  v9 = (void *)MEMORY[0x18D765024](v20);
  v18[0] = v5;
  v18[1] = 3221225472;
  v18[2] = __54__GEOETAUpdater__startConditionalConnectionETARequest__block_invoke_3;
  v18[3] = &unk_1E1C0DB90;
  v18[4] = self;
  v19 = v7;
  v10 = v7;
  v11 = (void *)MEMORY[0x18D765024](v18);
  debugTimeWindowDuration = self->_debugTimeWindowDuration;
  if (debugTimeWindowDuration == 0.0)
    debugTimeWindowDuration = 420.0 - self->_requestInterval;
  v13 = -[GEODataConditionalConnectionProperties initWithWorkload:timeWindowDuration:]([GEODataConditionalConnectionProperties alloc], "initWithWorkload:timeWindowDuration:", 1000, debugTimeWindowDuration);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "etaUpdater:willSendETATrafficUpdateRequest:", self, self->_currentETARequest);

  +[GEOETARequester sharedRequester](GEOETARequester, "sharedRequester");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  currentETARequest = self->_currentETARequest;
  -[GEOETAUpdater auditToken](self, "auditToken");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "startRequest:connectionProperties:auditToken:throttleToken:callbackQueue:willSendRequest:finished:networkActivity:error:", currentETARequest, v13, v17, 0, MEMORY[0x1E0C80D38], v9, v11, 0, v8);

}

void __54__GEOETAUpdater__startConditionalConnectionETARequest__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  GEOFindOrCreateLog("com.apple.GeoServices", "ETAUpdates");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138412290;
    v11 = v3;
    _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_DEBUG, "Could not complete ETA request %@", (uint8_t *)&v10, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = 0;

  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 72);
  *(_QWORD *)(v7 + 72) = 0;

  objc_msgSend(*(id *)(a1 + 32), "_currentTime");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) = v9;
  objc_msgSend(*(id *)(a1 + 32), "_continueUpdateRequests");

}

void __54__GEOETAUpdater__startConditionalConnectionETARequest__block_invoke_16(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  GEOFindOrCreateLog("com.apple.GeoServices", "ETAUpdates");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
    *(_DWORD *)buf = 67109120;
    v17 = v5;
    _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_DEBUG, "Send conditional connection ETA Request, ETA state: %i", buf, 8u);
  }

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = 0;

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 72);
  *(_QWORD *)(v8 + 72) = 0;

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__GEOETAUpdater__startConditionalConnectionETARequest__block_invoke_17;
  v12[3] = &unk_1E1C067D8;
  v10 = *(void **)(a1 + 40);
  v12[4] = *(_QWORD *)(a1 + 32);
  v13 = v10;
  v14 = v3;
  v15 = *(id *)(a1 + 48);
  v11 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

}

void __54__GEOETAUpdater__startConditionalConnectionETARequest__block_invoke_17(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 80))
  {
    *(_QWORD *)(v2 + 80) = 3;
    objc_msgSend(*(id *)(a1 + 32), "_currentTime");
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) = v3;
    objc_msgSend(*(id *)(a1 + 32), "_updateOrCreateRequest:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __54__GEOETAUpdater__startConditionalConnectionETARequest__block_invoke_2;
    v7[3] = &unk_1E1C0DB40;
    v9 = *(id *)(a1 + 48);
    v10 = *(id *)(a1 + 56);
    v8 = v4;
    v6 = v4;
    objc_msgSend(v5, "_addRouteAttributesToRequest:completion:", v6, v7);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __54__GEOETAUpdater__startConditionalConnectionETARequest__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void (*v5)(void);
  id v6;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  v6 = v3;
  if (v3)
  {
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    v5 = *(void (**)(void))(v4 + 16);
  }
  v5();

}

uint64_t __54__GEOETAUpdater__startConditionalConnectionETARequest__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_trafficRequest:finished:", *(_QWORD *)(a1 + 40), a2);
}

- (id)_updateOrCreateRequest:(id)a3
{
  GEOETATrafficUpdateRequest *v4;

  v4 = (GEOETATrafficUpdateRequest *)a3;
  if (!v4)
    v4 = objc_alloc_init(GEOETATrafficUpdateRequest);
  objc_storeStrong((id *)&self->_currentETARequest, v4);
  -[GEOETAUpdater _updateRequest:](self, "_updateRequest:", v4);
  return v4;
}

- (void)_sendRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id location;
  _QWORD v21[5];
  _QWORD v22[5];
  id v23;

  v4 = a3;
  +[GEOExperimentConfiguration sharedConfiguration](GEOExperimentConfiguration, "sharedConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_mapsAbClientMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientDatasetMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAbClientMetadata:", v7);

  v8 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __30__GEOETAUpdater__sendRequest___block_invoke;
  v22[3] = &unk_1E1C0DB90;
  v22[4] = self;
  v9 = v4;
  v23 = v9;
  v10 = (void *)MEMORY[0x18D765024](v22);
  v21[0] = v8;
  v21[1] = 3221225472;
  v21[2] = __30__GEOETAUpdater__sendRequest___block_invoke_2;
  v21[3] = &unk_1E1C00E10;
  v21[4] = self;
  v11 = (void *)MEMORY[0x18D765024](v21);
  objc_initWeak(&location, self);
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __30__GEOETAUpdater__sendRequest___block_invoke_24;
  v15[3] = &unk_1E1C0DBB8;
  v12 = v11;
  v17 = v12;
  objc_copyWeak(&v19, &location);
  v13 = v9;
  v16 = v13;
  v14 = v10;
  v18 = v14;
  -[GEOETAUpdater _addRouteAttributesToRequest:completion:](self, "_addRouteAttributesToRequest:completion:", v13, v15);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

uint64_t __30__GEOETAUpdater__sendRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_trafficRequest:finished:", *(_QWORD *)(a1 + 40), a2);
}

void __30__GEOETAUpdater__sendRequest___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;
  id v8;
  char v9;
  id v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  GEOFindOrCreateLog("com.apple.GeoServices", "ETAUpdates");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412290;
    v12 = v3;
    _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_DEBUG, "Could not complete ETA request %@", (uint8_t *)&v11, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = 0;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "etaUpdater:receivedError:", *(_QWORD *)(a1 + 32), v3);

  v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v10 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(v10, "etaUpdaterRequestCompleted:", *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(*(id *)(a1 + 32), "_continueUpdateRequests");

}

void __30__GEOETAUpdater__sendRequest___block_invoke_24(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      v8 = WeakRetained;
      objc_msgSend(WeakRetained, "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "etaUpdater:willSendETATrafficUpdateRequest:", v8, *(_QWORD *)(a1 + 32));

      +[GEONavdPowerLogManager _powerLogWithEventName:](GEONavdPowerLogManager, "_powerLogWithEventName:", CFSTR("SendingETARequest"));
      +[GEOETARequester sharedRequester](GEOETARequester, "sharedRequester");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v8, "auditToken");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "startRequest:connectionProperties:auditToken:throttleToken:callbackQueue:willSendRequest:finished:networkActivity:error:", v6, 0, v7, 0, MEMORY[0x1E0C80D38], 0, *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 40));

      WeakRetained = v8;
    }

  }
}

- (void)_trafficRequest:(id)a3 finished:(id)a4
{
  id v5;
  NSObject *v6;
  GEOETATrafficUpdateRequest *currentETARequest;
  _BOOL4 v8;
  id WeakRetained;
  GEOComposedETARoute *etaRoute;
  id v11;
  id v12;
  char v13;
  id v14;
  _DWORD v15[2];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  GEOFindOrCreateLog("com.apple.GeoServices", "ETAUpdates");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v15[0] = 67109120;
    v15[1] = objc_msgSend(v5, "status");
    _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_DEBUG, "Response ETARouteStatus : %i", (uint8_t *)v15, 8u);
  }

  currentETARequest = self->_currentETARequest;
  self->_currentETARequest = 0;

  if (objc_msgSend(v5, "status"))
    v8 = 0;
  else
    v8 = -[GEOComposedETARoute updateForResponse:route:](self->_etaRoute, "updateForResponse:route:", v5, self->_route);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "etaUpdater:receivedETATrafficUpdateResponse:etaRoute:", self, v5, self->_etaRoute);

  etaRoute = self->_etaRoute;
  self->_etaRoute = 0;

  if (v8)
  {
    v11 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v11, "etaUpdaterUpdatedETA:", self);

  }
  v12 = objc_loadWeakRetained((id *)&self->_delegate);
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    v14 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v14, "etaUpdaterRequestCompleted:", self);

  }
  -[GEOETAUpdater _continueUpdateRequests](self, "_continueUpdateRequests");

}

- (double)_calculateNextTransitionTime
{
  double requestInterval;
  void *v4;
  int v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  NSObject *v11;
  uint64_t v13;
  double v14;
  uint64_t v15;

  requestInterval = self->_requestInterval;
  -[GEOComposedRoute routeAttributes](self->_route, "routeAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasTimepoint");

  v6 = 0.0;
  if (v5)
  {
    v14 = 0.0;
    v15 = 0;
    -[GEOComposedRoute routeAttributes](self->_route, "routeAttributes", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "timepoint");
    }
    else
    {
      v13 = 0;
      v14 = 0.0;
      v15 = 0;
    }

    -[GEOETAUpdater _currentTime](self, "_currentTime", v13);
    v6 = v14 - v9;
  }
  if (v6 >= requestInterval + 72000.0)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "ETAUpdates");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_DEBUG, "Delaying ETA requests until near to departure..", (uint8_t *)&v13, 2u);
    }

    return v6 + -72000.0;
  }
  else if (self->_lastETARequestTime > 0.0)
  {
    -[GEOETAUpdater _currentTime](self, "_currentTime");
    return requestInterval - (v10 - self->_lastETARequestTime);
  }
  return requestInterval;
}

- (void)_continueUpdateRequests
{
  double v3;
  double v4;
  NSObject *v5;
  NSTimer *v6;
  NSTimer *etaIdleTimer;
  int v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_etaState)
  {
    -[GEOETAUpdater _clearTimer](self, "_clearTimer");
    -[GEOETAUpdater _calculateNextTransitionTime](self, "_calculateNextTransitionTime");
    v4 = v3;
    GEOFindOrCreateLog("com.apple.GeoServices", "ETAUpdates");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v8 = 134217984;
      v9 = v4;
      _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_DEBUG, "Starting Idle State transition time %f", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__startStateWaitingForBestTimeStart_, 0, 0, v4);
    v6 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    etaIdleTimer = self->_etaIdleTimer;
    self->_etaIdleTimer = v6;

  }
}

- (BOOL)_shouldStartConditionalETARequest
{
  return self->_shouldUseConditionalRequest;
}

- (id)currentStep
{
  void *routeMatch;

  routeMatch = self->_routeMatch;
  if (routeMatch)
  {
    -[GEOComposedRoute stepAtIndex:](self->_route, "stepAtIndex:", objc_msgSend(routeMatch, "stepIndex"));
    routeMatch = (void *)objc_claimAutoreleasedReturnValue();
  }
  return routeMatch;
}

- (GEOETAUpdaterDelegate)delegate
{
  return (GEOETAUpdaterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)requestingAppIdentifier
{
  return self->_requestingAppIdentifier;
}

- (void)setRequestingAppIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_requestingAppIdentifier, a3);
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (GEORouteMatch)routeMatch
{
  return self->_routeMatch;
}

- (GEOLocation)userLocation
{
  return self->_userLocation;
}

- (void)setUserLocation:(id)a3
{
  objc_storeStrong((id *)&self->_userLocation, a3);
}

- (NSArray)waypoints
{
  return self->_waypoints;
}

- (void)setWaypoints:(id)a3
{
  objc_storeStrong((id *)&self->_waypoints, a3);
}

- (GEORouteAttributes)routeAttributes
{
  return self->_routeAttributes;
}

- (void)setRouteAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_routeAttributes, a3);
}

- (NSData)directionsResponseID
{
  return self->_directionsResponseID;
}

- (void)setDirectionsResponseID:(id)a3
{
  objc_storeStrong((id *)&self->_directionsResponseID, a3);
}

- (BOOL)allowRequests
{
  return self->_allowRequests;
}

- (void)setAllowRequests:(BOOL)a3
{
  self->_allowRequests = a3;
}

- (BOOL)shouldUseConditionalRequest
{
  return self->_shouldUseConditionalRequest;
}

- (void)setShouldUseConditionalRequest:(BOOL)a3
{
  self->_shouldUseConditionalRequest = a3;
}

- (BOOL)shouldUpdateTrafficOnRoute
{
  return self->_shouldUpdateTrafficOnRoute;
}

- (void)setShouldUpdateTrafficOnRoute:(BOOL)a3
{
  self->_shouldUpdateTrafficOnRoute = a3;
}

- (double)requestInterval
{
  return self->_requestInterval;
}

- (void)setRequestInterval:(double)a3
{
  self->_requestInterval = a3;
}

- (double)debugTimeWindowDuration
{
  return self->_debugTimeWindowDuration;
}

- (void)setDebugTimeWindowDuration:(double)a3
{
  self->_debugTimeWindowDuration = a3;
}

- (unint64_t)maxAlternateRoutesCount
{
  return self->_maxAlternateRoutesCount;
}

- (void)setMaxAlternateRoutesCount:(unint64_t)a3
{
  self->_maxAlternateRoutesCount = a3;
}

- (GEOApplicationAuditToken)auditToken
{
  return self->_auditToken;
}

- (void)setAuditToken:(id)a3
{
  objc_storeStrong((id *)&self->_auditToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypoints, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_commonOptions, 0);
  objc_storeStrong((id *)&self->_directionsResponseID, 0);
  objc_storeStrong((id *)&self->_etaIdleTimer, 0);
  objc_storeStrong((id *)&self->_etaRoute, 0);
  objc_storeStrong((id *)&self->_routeAttributes, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_routeMatch, 0);
  objc_storeStrong((id *)&self->_userLocation, 0);
  objc_storeStrong((id *)&self->_currentETARequest, 0);
  objc_storeStrong((id *)&self->_requestingAppIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
