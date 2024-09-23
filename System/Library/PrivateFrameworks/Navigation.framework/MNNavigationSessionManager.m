@implementation MNNavigationSessionManager

- (MNNavigationSessionManager)init
{
  MNNavigationSessionManager *result;

  result = (MNNavigationSessionManager *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (MNNavigationSessionManager)initWithAuditToken:(id)a3
{
  id v5;
  MNNavigationSessionManager *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *trafficIncidentAlertCallbacks;
  void *v9;
  MNNavigationSessionManager *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MNNavigationSessionManager;
  v6 = -[MNNavigationSessionManager init](&v12, sel_init);
  if (v6)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    trafficIncidentAlertCallbacks = v6->_trafficIncidentAlertCallbacks;
    v6->_trafficIncidentAlertCallbacks = v7;

    objc_storeStrong((id *)&v6->_auditToken, a3);
    +[MNUserOptionsEngine sharedInstance](MNUserOptionsEngine, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "registerObserver:", v6);

    v10 = v6;
  }

  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[MNNavigationSessionManager stopNavigationWithReason:](self, "stopNavigationWithReason:", 0);
  +[MNUserOptionsEngine sharedInstance](MNUserOptionsEngine, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

  -[MNRouteManager close](self->_routeManager, "close");
  v4.receiver = self;
  v4.super_class = (Class)MNNavigationSessionManager;
  -[MNNavigationSessionManager dealloc](&v4, sel_dealloc);
}

- (void)setRoutesForPreview:(id)a3 selectedRouteIndex:(unint64_t)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  MNSessionUpdateManager *v15;
  MNSessionUpdateManager *updateManager;
  MNSessionUpdateManager *v17;
  MNSessionUpdateManager *v18;
  void *v19;
  MNSessionUpdateManager *v20;
  void *v21;
  id WeakRetained;
  void *v23;
  id v24;

  v24 = a3;
  -[MNNavigationSessionManager _routeManager](self, "_routeManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateWithPreviewRoutes:selectedRouteIndex:", v24, a4);
  v7 = objc_msgSend(v24, "count");
  -[MNNavigationSessionManager _proxyUpdater](self, "_proxyUpdater");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v24, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "route");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "enteredRoutePreviewWithTransportType:", objc_msgSend(v11, "transportType"));

  }
  else
  {
    objc_msgSend(v8, "navigationSessionStopped:", 0);
  }

  -[MNNavigationTraceManager tracePlayer](self->_traceManager, "tracePlayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "sessionUpdater");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {

    }
    else if ((GEOConfigGetBOOL() & 1) != 0)
    {
      goto LABEL_12;
    }
  }
  objc_msgSend(v13, "sessionUpdater");
  v15 = (MNSessionUpdateManager *)objc_claimAutoreleasedReturnValue();
  updateManager = v15;
  if (v15 || (updateManager = self->_updateManager) != 0)
    v17 = updateManager;
  else
    v17 = objc_alloc_init(MNSessionUpdateManager);
  v18 = self->_updateManager;
  self->_updateManager = v17;

  -[MNSessionUpdateManager setDelegate:](self->_updateManager, "setDelegate:", self);
  -[MNRouteManager requestingAppIdentifier](self->_routeManager, "requestingAppIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNSessionUpdateManager setRequestingAppIdentifier:](self->_updateManager, "setRequestingAppIdentifier:", v19);

  -[MNSessionUpdateManager setAuditToken:](self->_updateManager, "setAuditToken:", self->_auditToken);
  v20 = self->_updateManager;
  -[MNRouteManager previewRoutes](self->_routeManager, "previewRoutes");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNSessionUpdateManager startUpdateRequestsForRoutes:andNavigationType:](v20, "startUpdateRequestsForRoutes:andNavigationType:", v21, -[MNNavigationSession navigationType](self->_navigationSession, "navigationType"));

LABEL_12:
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v6, "previewRoutes");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "navigationSessionManager:didUpdatePreviewRoutes:withSelectedRouteIndex:", self, v23, objc_msgSend(v6, "selectedRouteIndex"));

}

- (void)updateForStartNavigation:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  MNNavigationTraceManager *traceManager;
  void *v8;
  MNSimulationLocationProvider *v9;
  MNSimulationLocationProvider *simulationLocationProvider;
  void *v11;
  void *v12;
  MNNavigationTraceManager *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  MNNavigationTraceManager *v17;
  void *v18;
  void *v19;
  MNSessionUpdateManager *updateManager;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id WeakRetained;
  id v28;

  v28 = a3;
  -[MNNavigationSessionManager _routeManager](self, "_routeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MNNavigationSessionManager _traceManager](self, "_traceManager");
  -[MNNavigationTraceManager setNavigationType:](self->_traceManager, "setNavigationType:", objc_msgSend(v28, "navigationType"));
  objc_msgSend(v28, "tracePlaybackPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    traceManager = self->_traceManager;
    objc_msgSend(v28, "tracePlaybackPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNNavigationTraceManager openForPlaybackWithTracePath:](traceManager, "openForPlaybackWithTracePath:", v8);

  }
  objc_msgSend(v4, "updateWithStartNavigationDetails:", v28);
  v9 = -[MNSimulationLocationProvider initWithStartNavigationDetails:]([MNSimulationLocationProvider alloc], "initWithStartNavigationDetails:", v28);
  simulationLocationProvider = self->_simulationLocationProvider;
  self->_simulationLocationProvider = v9;

  -[MNNavigationTraceManager tracePlayer](self->_traceManager, "tracePlayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    if (objc_msgSend(v28, "isReconnecting")
      && (objc_msgSend(v28, "traceRecordingNameOverride"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v12,
          v12))
    {
      v13 = self->_traceManager;
      objc_msgSend(v28, "traceRecordingNameOverride");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNNavigationTraceManager openForRecordingWithTraceRecordingData:traceName:selectedRouteIndex:isReconnecting:isSimulation:](v13, "openForRecordingWithTraceRecordingData:traceName:selectedRouteIndex:isReconnecting:isSimulation:", 0, v14, 0, 1, 0);
    }
    else
    {
      objc_msgSend(v28, "traceRecordingData");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
        goto LABEL_13;
      v16 = objc_msgSend(v28, "simulationType");
      v17 = self->_traceManager;
      if (v16 == -1)
      {
        -[MNRouteManager currentRouteInfo](self->_routeManager, "currentRouteInfo");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "traceRecordingData");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "traceRecordingNameOverride");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[MNNavigationTraceManager openForSimulationWithRoute:traceRecordingData:traceNameOverride:](v17, "openForSimulationWithRoute:traceRecordingData:traceNameOverride:", v14, v18, v19);

      }
      else
      {
        objc_msgSend(v28, "traceRecordingData");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "traceRecordingNameOverride");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[MNNavigationTraceManager openForRecordingWithTraceRecordingData:traceName:selectedRouteIndex:isReconnecting:isSimulation:](v17, "openForRecordingWithTraceRecordingData:traceName:selectedRouteIndex:isReconnecting:isSimulation:", v14, v18, objc_msgSend(v28, "selectedRouteIndex"), 0, objc_msgSend(v28, "simulationType") != 0);
      }

    }
  }
LABEL_13:
  -[MNSessionUpdateManager stopUpdateRequests](self->_updateManager, "stopUpdateRequests");
  -[MNSessionUpdateManager setDelegate:](self->_updateManager, "setDelegate:", 0);
  updateManager = self->_updateManager;
  self->_updateManager = 0;

  v21 = (void *)objc_opt_new();
  objc_msgSend(v21, "setNavigationType:", objc_msgSend(v28, "navigationType"));
  objc_msgSend(v21, "setSimulationType:", objc_msgSend(v28, "simulationType"));
  objc_msgSend(v4, "currentRouteInfo");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setRouteInfo:", v22);

  objc_msgSend(v21, "setIsResumingMultiStopRoute:", objc_msgSend(v28, "isResumingMultipointRoute"));
  if (objc_msgSend(v28, "isReconnecting"))
  {
    objc_msgSend(v28, "reconnectionDetails");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setInitialRouteSource:", objc_msgSend(v23, "initialRouteSource"));
  }
  else
  {
    objc_msgSend(v4, "currentRouteInfo");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "route");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setInitialRouteSource:", objc_msgSend(v24, "source"));

  }
  if (objc_msgSend(v28, "navigationType") == 3)
  {
    +[MNVoiceLanguageUtil systemDefaultVoiceLanguage](MNVoiceLanguageUtil, "systemDefaultVoiceLanguage");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[MNUserOptionsEngine sharedInstance](MNUserOptionsEngine, "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "updateNavigationSessionLanguage:", v25);

    objc_msgSend(v21, "setVoiceLanguage:", v25);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManager:didSendNavigationServiceCallback:", self, v21);

}

- (void)startNavigationWithDetails:(id)a3
{
  id v4;
  MNNavigationSession *v5;
  MNNavigationSession *navigationSession;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  MNSessionUpdateManager *v13;
  MNSessionUpdateManager *updateManager;
  MNSessionUpdateManager *v15;
  MNSessionUpdateManager *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  MNSessionUpdateManager *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[MNNavigationSession initWithRouteManager:auditToken:traceManager:]([MNNavigationSession alloc], "initWithRouteManager:auditToken:traceManager:", self->_routeManager, self->_auditToken, self->_traceManager);
  navigationSession = self->_navigationSession;
  self->_navigationSession = v5;

  -[MNNavigationSession registerObserver:](self->_navigationSession, "registerObserver:", self);
  -[MNNavigationSessionManager _proxyUpdater](self, "_proxyUpdater");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNNavigationSession registerObserver:](self->_navigationSession, "registerObserver:", v7);
  -[MNNavigationSession startNavigationSessionWithDetails:](self->_navigationSession, "startNavigationSessionWithDetails:", v4);

  -[MNRouteManager currentRouteInfo](self->_routeManager, "currentRouteInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("routeManager.currentRouteInfo is unexpectedly nil"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v29 = "-[MNNavigationSessionManager startNavigationWithDetails:]";
      v30 = 2080;
      v31 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSessionManager.m";
      v32 = 1024;
      v33 = 189;
      v34 = 2080;
      v35 = "_routeManager.currentRouteInfo != nil";
      v36 = 2112;
      v37 = v25;
      _os_log_impl(&dword_1B0AD7000, v26, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
    }

  }
  -[MNRouteManager currentRouteInfo](self->_routeManager, "currentRouteInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[MNNavigationTraceManager tracePlayer](self->_traceManager, "tracePlayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "sessionUpdater");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {

      }
      else if ((GEOConfigGetBOOL() & 1) != 0)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    objc_msgSend(v11, "sessionUpdater");
    v13 = (MNSessionUpdateManager *)objc_claimAutoreleasedReturnValue();
    updateManager = v13;
    if (v13 || (updateManager = self->_updateManager) != 0)
      v15 = updateManager;
    else
      v15 = objc_alloc_init(MNSessionUpdateManager);
    v16 = self->_updateManager;
    self->_updateManager = v15;

    -[MNSessionUpdateManager setDelegate:](self->_updateManager, "setDelegate:", self);
    -[MNRouteManager requestingAppIdentifier](self->_routeManager, "requestingAppIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNSessionUpdateManager setRequestingAppIdentifier:](self->_updateManager, "setRequestingAppIdentifier:", v17);

    -[MNSessionUpdateManager setAuditToken:](self->_updateManager, "setAuditToken:", self->_auditToken);
    -[MNRouteManager currentRouteInfo](self->_routeManager, "currentRouteInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "route");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "origin");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "latLng");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNSessionUpdateManager setTripOrigin:](self->_updateManager, "setTripOrigin:", v21);

    v22 = self->_updateManager;
    -[MNRouteManager currentRouteInfo](self->_routeManager, "currentRouteInfo");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNSessionUpdateManager startUpdateRequestsForRoutes:andNavigationType:](v22, "startUpdateRequestsForRoutes:andNavigationType:", v24, -[MNNavigationSession navigationType](self->_navigationSession, "navigationType"));

    goto LABEL_11;
  }
LABEL_12:

}

- (void)updateWithInitialLocation:(id)a3
{
  -[MNNavigationSession updateWithInitialLocation:](self->_navigationSession, "updateWithInitialLocation:", a3);
}

- (void)stopNavigationWithReason:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  uint64_t v7;
  MNSessionUpdateManager *updateManager;
  MNNavigationSession *navigationSession;
  MNNavigationProxyUpdater *proxyUpdater;
  MNRouteManager *routeManager;
  MNNavigationTraceManager *traceManager;
  MNNavigationSession *v13;

  if (a3 == 3)
  {
    v7 = 4;
  }
  else if (a3 == 2)
  {
    -[MNNavigationSession navigationSessionState](self->_navigationSession, "navigationSessionState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "arrivalState") - 2;

    if (v6 >= 3)
      v7 = 3;
    else
      v7 = 6;
  }
  else
  {
    v7 = 0;
  }
  -[MNSessionUpdateManager stopUpdateRequests](self->_updateManager, "stopUpdateRequests");
  -[MNSessionUpdateManager sendFinalETAURequestWithReason:](self->_updateManager, "sendFinalETAURequestWithReason:", v7);
  -[MNSessionUpdateManager setDelegate:](self->_updateManager, "setDelegate:", 0);
  updateManager = self->_updateManager;
  self->_updateManager = 0;

  navigationSession = self->_navigationSession;
  self->_navigationSession = 0;
  v13 = navigationSession;

  -[MNNavigationSession stopNavigationSessionWithReason:](v13, "stopNavigationSessionWithReason:", a3);
  -[MNNavigationSession unregisterObserver:](v13, "unregisterObserver:", self->_proxyUpdater);
  proxyUpdater = self->_proxyUpdater;
  self->_proxyUpdater = 0;

  -[MNNavigationSession unregisterObserver:](v13, "unregisterObserver:", self);
  routeManager = self->_routeManager;
  self->_routeManager = 0;

  -[MNNavigationTraceManager setDelegate:](self->_traceManager, "setDelegate:", 0);
  -[MNNavigationTraceManager close](self->_traceManager, "close");
  traceManager = self->_traceManager;
  self->_traceManager = 0;

}

- (void)rerouteWithWaypoints:(id)a3
{
  id v4;
  MNNavigationSession *navigationSession;
  void *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  navigationSession = self->_navigationSession;
  if (!navigationSession)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Did not find navigation session while rerouting with waypoints"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136316162;
      v9 = "-[MNNavigationSessionManager rerouteWithWaypoints:]";
      v10 = 2080;
      v11 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSessionManager.m";
      v12 = 1024;
      v13 = 254;
      v14 = 2080;
      v15 = "(_navigationSession != nil)";
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v8, 0x30u);
    }

    navigationSession = self->_navigationSession;
  }
  -[MNNavigationSession rerouteWithWaypoints:](navigationSession, "rerouteWithWaypoints:", v4);

}

- (void)insertWaypoint:(id)a3
{
  id v4;
  MNNavigationSession *navigationSession;
  void *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  navigationSession = self->_navigationSession;
  if (!navigationSession)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Did not find navigation session while inserting waypoint"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136316162;
      v9 = "-[MNNavigationSessionManager insertWaypoint:]";
      v10 = 2080;
      v11 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSessionManager.m";
      v12 = 1024;
      v13 = 260;
      v14 = 2080;
      v15 = "(_navigationSession != nil)";
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v8, 0x30u);
    }

    navigationSession = self->_navigationSession;
  }
  -[MNNavigationSession insertWaypoint:](navigationSession, "insertWaypoint:", v4);

}

- (void)removeWaypointAtIndex:(unint64_t)a3
{
  MNNavigationSession *navigationSession;
  void *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  navigationSession = self->_navigationSession;
  if (!navigationSession)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Did not find navigation session while removing waypoint"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136316162;
      v9 = "-[MNNavigationSessionManager removeWaypointAtIndex:]";
      v10 = 2080;
      v11 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSessionManager.m";
      v12 = 1024;
      v13 = 266;
      v14 = 2080;
      v15 = "(_navigationSession != nil)";
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v8, 0x30u);
    }

    navigationSession = self->_navigationSession;
  }
  -[MNNavigationSession removeWaypointAtIndex:](navigationSession, "removeWaypointAtIndex:", a3);
}

- (void)advanceToNextLeg
{
  MNNavigationSession *navigationSession;
  void *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  navigationSession = self->_navigationSession;
  if (!navigationSession)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Did not find navigation session while changing next waypoint"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136316162;
      v7 = "-[MNNavigationSessionManager advanceToNextLeg]";
      v8 = 2080;
      v9 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSessionManager.m";
      v10 = 1024;
      v11 = 272;
      v12 = 2080;
      v13 = "(_navigationSession != nil)";
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v6, 0x30u);
    }

    navigationSession = self->_navigationSession;
  }
  -[MNNavigationSession advanceToNextLeg](navigationSession, "advanceToNextLeg");
}

- (void)updateDestination:(id)a3
{
  id v4;
  MNNavigationSession *navigationSession;
  void *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  navigationSession = self->_navigationSession;
  if (!navigationSession)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Did not find navigation session while updating destination"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136316162;
      v9 = "-[MNNavigationSessionManager updateDestination:]";
      v10 = 2080;
      v11 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSessionManager.m";
      v12 = 1024;
      v13 = 278;
      v14 = 2080;
      v15 = "(_navigationSession != nil)";
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v8, 0x30u);
    }

    navigationSession = self->_navigationSession;
  }
  -[MNNavigationSession updateDestination:](navigationSession, "updateDestination:", v4);

}

- (void)resumeOriginalDestination
{
  MNNavigationSession *navigationSession;
  void *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  navigationSession = self->_navigationSession;
  if (!navigationSession)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Did not find navigation session while resuming original destination"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136316162;
      v7 = "-[MNNavigationSessionManager resumeOriginalDestination]";
      v8 = 2080;
      v9 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSessionManager.m";
      v10 = 1024;
      v11 = 284;
      v12 = 2080;
      v13 = "(_navigationSession != nil)";
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v6, 0x30u);
    }

    navigationSession = self->_navigationSession;
  }
  -[MNNavigationSession resumeOriginalDestination](navigationSession, "resumeOriginalDestination");
}

- (void)forceReroute
{
  MNNavigationSession *navigationSession;
  void *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  navigationSession = self->_navigationSession;
  if (!navigationSession)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Did not find navigation session while forcing reroute"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136316162;
      v7 = "-[MNNavigationSessionManager forceReroute]";
      v8 = 2080;
      v9 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSessionManager.m";
      v10 = 1024;
      v11 = 290;
      v12 = 2080;
      v13 = "(_navigationSession != nil)";
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v6, 0x30u);
    }

    navigationSession = self->_navigationSession;
  }
  -[MNNavigationSession forceReroute](navigationSession, "forceReroute");
}

- (void)switchToRoute:(id)a3
{
  id v4;
  MNNavigationSession *navigationSession;
  void *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  navigationSession = self->_navigationSession;
  if (!navigationSession)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Did not find navigation session while switching to route"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136316162;
      v9 = "-[MNNavigationSessionManager switchToRoute:]";
      v10 = 2080;
      v11 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSessionManager.m";
      v12 = 1024;
      v13 = 296;
      v14 = 2080;
      v15 = "(_navigationSession != nil)";
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v8, 0x30u);
    }

    navigationSession = self->_navigationSession;
  }
  -[MNNavigationSession switchToRoute:](navigationSession, "switchToRoute:", v4);

}

- (void)changeTransportType:(int)a3 route:(id)a4
{
  uint64_t v4;
  id v6;
  MNNavigationSession *navigationSession;
  void *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v4 = *(_QWORD *)&a3;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  navigationSession = self->_navigationSession;
  if (!navigationSession)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Did not find navigation session while switching to route"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 136316162;
      v11 = "-[MNNavigationSessionManager changeTransportType:route:]";
      v12 = 2080;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSessionManager.m";
      v14 = 1024;
      v15 = 302;
      v16 = 2080;
      v17 = "(_navigationSession != nil)";
      v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v10, 0x30u);
    }

    navigationSession = self->_navigationSession;
  }
  -[MNNavigationSession changeTransportType:route:](navigationSession, "changeTransportType:route:", v4, v6);

}

- (void)switchToDestinationRoute
{
  -[MNNavigationSession switchToDestinationRoute](self->_navigationSession, "switchToDestinationRoute");
}

- (void)setVoiceGuidanceLevelOverride:(unint64_t)a3
{
  -[MNNavigationSession setVoiceGuidanceLevelOverride:](self->_navigationSession, "setVoiceGuidanceLevelOverride:", a3);
}

- (BOOL)repeatCurrentGuidance
{
  MNNavigationSession *navigationSession;
  void *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  navigationSession = self->_navigationSession;
  if (!navigationSession)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Did not find navigation session while repeating current guidance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 136316162;
      v8 = "-[MNNavigationSessionManager repeatCurrentGuidance]";
      v9 = 2080;
      v10 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSessionManager.m";
      v11 = 1024;
      v12 = 318;
      v13 = 2080;
      v14 = "(_navigationSession != nil)";
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v7, 0x30u);
    }

    navigationSession = self->_navigationSession;
  }
  return -[MNNavigationSession repeatCurrentGuidance](navigationSession, "repeatCurrentGuidance");
}

- (BOOL)repeatCurrentTrafficAlert
{
  MNNavigationSession *navigationSession;
  void *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  navigationSession = self->_navigationSession;
  if (!navigationSession)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Did not find navigation session while repeating current traffic alert"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 136316162;
      v8 = "-[MNNavigationSessionManager repeatCurrentTrafficAlert]";
      v9 = 2080;
      v10 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSessionManager.m";
      v11 = 1024;
      v12 = 324;
      v13 = 2080;
      v14 = "(_navigationSession != nil)";
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v7, 0x30u);
    }

    navigationSession = self->_navigationSession;
  }
  return -[MNNavigationSession repeatCurrentTrafficAlert](navigationSession, "repeatCurrentTrafficAlert");
}

- (BOOL)vibrateForPrompt:(unint64_t)a3
{
  MNNavigationSession *navigationSession;
  void *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  navigationSession = self->_navigationSession;
  if (!navigationSession)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Did not find navigation session while vibrating for prompt"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 136316162;
      v10 = "-[MNNavigationSessionManager vibrateForPrompt:]";
      v11 = 2080;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSessionManager.m";
      v13 = 1024;
      v14 = 330;
      v15 = 2080;
      v16 = "(_navigationSession != nil)";
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v9, 0x30u);
    }

    navigationSession = self->_navigationSession;
  }
  return -[MNNavigationSession vibrateForPrompt:](navigationSession, "vibrateForPrompt:", a3);
}

- (void)stopCurrentGuidancePrompt
{
  -[MNNavigationSession stopCurrentGuidancePrompt](self->_navigationSession, "stopCurrentGuidancePrompt");
}

- (void)setGuidancePromptsEnabled:(BOOL)a3
{
  -[MNNavigationSession setGuidancePromptsEnabled:](self->_navigationSession, "setGuidancePromptsEnabled:", a3);
}

- (void)setIsDisplayingNavigationTray:(BOOL)a3
{
  -[MNNavigationSession setIsDisplayingNavigationTray:](self->_navigationSession, "setIsDisplayingNavigationTray:", a3);
}

- (void)setIsConnectedToCarplay:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[MNNavigationSession setIsConnectedToCarplay:](self->_navigationSession, "setIsConnectedToCarplay:");
  -[MNNavigationProxyUpdater setIsConnectedToCarplay:](self->_proxyUpdater, "setIsConnectedToCarplay:", v3);
}

- (void)setDisplayedStepIndex:(unint64_t)a3
{
  id WeakRetained;

  if (-[MNNavigationSession displayedStepIndex](self->_navigationSession, "displayedStepIndex") != a3)
  {
    -[MNNavigationSession setDisplayedStepIndex:](self->_navigationSession, "setDisplayedStepIndex:", a3);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "navigationSessionManager:didUpdateDisplayedStepIndex:segmentIndex:", self, a3, 0);

  }
  -[MNNavigationProxyUpdater setDisplayedStepIndex:](self->_proxyUpdater, "setDisplayedStepIndex:", a3);
}

- (void)setRideIndex:(unint64_t)a3 forSegmentIndex:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id WeakRetained;
  id v15;

  -[MNRouteManager currentRouteInfo](self->_routeManager, "currentRouteInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_navigationSession)
  {
    v15 = v7;
    objc_msgSend(v7, "route");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "segments");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    v7 = v15;
    if (v10 > a4)
    {
      objc_msgSend(v15, "route");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "segments");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndex:", a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v13, "type") == 6)
      {
        objc_msgSend(v13, "setSelectedRideOptionIndex:", a3);
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "navigationSessionManager:didUpdateRouteWithNewRideSelection:", self, v15);

        -[MNNavigationProxyUpdater updateClusteredSectionSelectedRideForNavigationSession:](self->_proxyUpdater, "updateClusteredSectionSelectedRideForNavigationSession:", self->_navigationSession);
        -[MNNavigationSession switchToRoute:](self->_navigationSession, "switchToRoute:", v15);
      }

      v7 = v15;
    }
  }

}

- (void)setJunctionViewImageWidth:(double)a3 height:(double)a4
{
  -[MNNavigationSession setJunctionViewImageWidth:height:](self->_navigationSession, "setJunctionViewImageWidth:height:", a3, a4);
}

- (void)disableNavigationCapability:(unint64_t)a3
{
  -[MNNavigationSession setNavigationCapabilities:](self->_navigationSession, "setNavigationCapabilities:", -[MNNavigationSession navigationCapabilities](self->_navigationSession, "navigationCapabilities") & ~a3);
}

- (void)enableNavigationCapability:(unint64_t)a3
{
  -[MNNavigationSession setNavigationCapabilities:](self->_navigationSession, "setNavigationCapabilities:", -[MNNavigationSession navigationCapabilities](self->_navigationSession, "navigationCapabilities") & a3);
}

- (void)changeOfflineMode:(unsigned __int8)a3
{
  -[MNNavigationSession changeOfflineMode:](self->_navigationSession, "changeOfflineMode:", a3);
}

- (void)acceptReroute:(BOOL)a3 forTrafficIncidentAlert:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSMutableDictionary *trafficIncidentAlertCallbacks;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v4 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  trafficIncidentAlertCallbacks = self->_trafficIncidentAlertCallbacks;
  objc_msgSend(v6, "alertID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](trafficIncidentAlertCallbacks, "objectForKey:", v8);
  v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = self->_trafficIncidentAlertCallbacks;
    objc_msgSend(v6, "alertID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v10, "removeObjectForKey:", v11);

    v9[2](v9, v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Did not find traffic incident alert handler"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = 136316162;
      v15 = "-[MNNavigationSessionManager acceptReroute:forTrafficIncidentAlert:]";
      v16 = 2080;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSessionManager.m";
      v18 = 1024;
      v19 = 404;
      v20 = 2080;
      v21 = "(responseHandler != nil)";
      v22 = 2112;
      v23 = v12;
      _os_log_impl(&dword_1B0AD7000, v13, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v14, 0x30u);
    }

  }
}

- (void)setTraceIsPlaying:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[MNNavigationTraceManager tracePlayer](self->_traceManager, "tracePlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "resume");
  else
    objc_msgSend(v4, "pause");

}

- (void)setTracePlaybackSpeed:(double)a3
{
  id v4;

  -[MNNavigationTraceManager tracePlayer](self->_traceManager, "tracePlayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSpeedMultiplier:", a3);

}

- (void)setTracePosition:(double)a3
{
  void *v5;

  -[MNNavigationTraceManager tracePlayer](self->_traceManager, "tracePlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "jumpToTime:", a3);

  -[MNNavigationSession traceJumpedInTime](self->_navigationSession, "traceJumpedInTime");
}

- (void)recordTraceBookmarkAtCurrentPositionWthScreenshotData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  MNTraceBookmarkRecorder *v10;
  void *v11;
  void *v12;
  double v13;
  _QWORD v14[4];
  id v15;
  MNNavigationSessionManager *v16;

  v4 = a3;
  -[MNNavigationTraceManager tracePlayer](self->_traceManager, "tracePlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "trace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "position");
    v9 = v8;
    if (v7)
    {
LABEL_3:
      v10 = -[MNTraceBookmarkRecorder initWithTrace:]([MNTraceBookmarkRecorder alloc], "initWithTrace:", v7);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __84__MNNavigationSessionManager_recordTraceBookmarkAtCurrentPositionWthScreenshotData___block_invoke;
      v14[3] = &unk_1E61D3300;
      v15 = v7;
      v16 = self;
      -[MNTraceBookmarkRecorder recordBookmarkAtTime:withScreenshotData:completionHandler:](v10, "recordBookmarkAtTime:withScreenshotData:completionHandler:", v4, v14, v9);

    }
  }
  else
  {
    -[MNNavigationTraceManager traceRecorder](self->_traceManager, "traceRecorder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "trace");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeSinceRecordingBegan");
      v9 = v13;
    }
    else
    {
      v7 = 0;
      v9 = 0.0;
    }

    if (v7)
      goto LABEL_3;
  }

}

void __84__MNNavigationSessionManager_recordTraceBookmarkAtCurrentPositionWthScreenshotData___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id WeakRetained;
  MNTracePlaybackDetails *v6;

  v6 = objc_alloc_init(MNTracePlaybackDetails);
  -[MNTracePlaybackDetails setEventType:](v6, "setEventType:", 6);
  -[MNTracePlaybackDetails setRecordedBookmarkID:](v6, "setRecordedBookmarkID:", a2);
  objc_msgSend(*(id *)(a1 + 32), "serializableBookmarks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNTracePlaybackDetails setBookmarks:](v6, "setBookmarks:", v4);

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
  objc_msgSend(WeakRetained, "navigationSessionManager:didUpdateTracePlaybackDetails:", *(_QWORD *)(a1 + 40), v6);

}

- (void)recordPedestrianTracePath:(id)a3
{
  MNNavigationTraceManager *traceManager;
  id v4;
  void *v5;
  void *v6;
  id v7;

  traceManager = self->_traceManager;
  v4 = a3;
  -[MNNavigationTraceManager traceRecorder](traceManager, "traceRecorder");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recordMiscInfo:value:", CFSTR("pedestrian_trace_path"), v4);

  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v7, "timeSinceRecordingBegan");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recordMiscInfo:value:", CFSTR("pedestrian_trace_relative_timestamp"), v6);

}

- (void)setSimulationSpeedOverride:(double)a3
{
  -[MNSimulationLocationProvider setSpeedOverride:](self->_simulationLocationProvider, "setSpeedOverride:", a3);
}

- (void)setSimulationSpeedMultiplier:(double)a3
{
  -[MNSimulationLocationProvider setUpdateIntervalSpeedMultiplier:](self->_simulationLocationProvider, "setUpdateIntervalSpeedMultiplier:", a3);
}

- (void)setSimulationPosition:(double)a3
{
  -[MNSimulationLocationProvider updatePosition:](self->_simulationLocationProvider, "updatePosition:", a3);
}

- (id)_routeManager
{
  MNRouteManager *routeManager;
  MNRouteManager *v4;
  MNRouteManager *v5;

  routeManager = self->_routeManager;
  if (!routeManager)
  {
    v4 = -[MNRouteManager initWithAuditToken:]([MNRouteManager alloc], "initWithAuditToken:", self->_auditToken);
    v5 = self->_routeManager;
    self->_routeManager = v4;

    -[MNRouteManager open](self->_routeManager, "open");
    routeManager = self->_routeManager;
  }
  return routeManager;
}

- (id)_proxyUpdater
{
  MNNavigationProxyUpdater *proxyUpdater;
  MNNavigationProxyUpdater *v4;
  MNNavigationProxyUpdater *v5;

  proxyUpdater = self->_proxyUpdater;
  if (!proxyUpdater)
  {
    v4 = objc_alloc_init(MNNavigationProxyUpdater);
    v5 = self->_proxyUpdater;
    self->_proxyUpdater = v4;

    proxyUpdater = self->_proxyUpdater;
  }
  return proxyUpdater;
}

- (id)_traceManager
{
  MNNavigationTraceManager *traceManager;
  MNNavigationTraceManager *v4;
  MNNavigationTraceManager *v5;

  traceManager = self->_traceManager;
  if (!traceManager)
  {
    v4 = objc_alloc_init(MNNavigationTraceManager);
    v5 = self->_traceManager;
    self->_traceManager = v4;

    -[MNNavigationTraceManager setTraceManagerDelegate:](self->_traceManager, "setTraceManagerDelegate:", self);
    traceManager = self->_traceManager;
  }
  return traceManager;
}

- (void)setIsNavigatingInLowGuidance:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[MNNavigationProxyUpdater setIsNavigatingInLowGuidance:](self->_proxyUpdater, "setIsNavigatingInLowGuidance:");
  -[MNNavigationSession setIsNavigatingInLowGuidance:](self->_navigationSession, "setIsNavigatingInLowGuidance:", v3);
}

- (void)pauseRealtimeUpdatesForSubscriber:(id)a3
{
  -[MNSessionUpdateManager pauseUpdateRequestsForSubscriber:](self->_updateManager, "pauseUpdateRequestsForSubscriber:", a3);
}

- (void)resumeRealtimeUpdatesForSubscriber:(id)a3
{
  -[MNSessionUpdateManager resumeUpdateRequestsForSubscriber:](self->_updateManager, "resumeUpdateRequestsForSubscriber:", a3);
}

- (void)updateManager:(id)a3 willSendTransitUpdateRequests:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[MNNavigationTraceManager traceRecorder](self->_traceManager, "traceRecorder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeSinceRecordingBegan");
  v8 = v7;

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13);
        -[MNNavigationTraceManager traceRecorder](self->_traceManager, "traceRecorder", (_QWORD)v16);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "recordTransitUpdateRequest:withTimestamp:", v14, v8);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

}

- (void)updateManager:(id)a3 didReceiveTransitUpdateResponse:(id)a4
{
  MNNavigationTraceManager *traceManager;
  id v5;
  id v6;

  traceManager = self->_traceManager;
  v5 = a4;
  -[MNNavigationTraceManager traceRecorder](traceManager, "traceRecorder");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recordTransitUpdateResponse:", v5);

}

- (void)updateManager:(id)a3 willSendTransitUpdateRequestForRouteIDs:(id)a4
{
  MNNavigationSessionManagerDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManager:willSendTransitUpdateRequestForRouteIDs:", self, v6);

}

- (void)updateManager:(id)a3 didReceiveTransitUpdates:(id)a4
{
  MNNavigationSessionManagerDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManager:didReceiveTransitUpdates:", self, v6);

}

- (void)updateManager:(id)a3 didReceiveTransitError:(id)a4
{
  MNNavigationTraceManager *traceManager;
  id v5;
  id v6;

  traceManager = self->_traceManager;
  v5 = a4;
  -[MNNavigationTraceManager traceRecorder](traceManager, "traceRecorder");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recordTransitUpdateError:", v5);

}

- (void)updateManager:(id)a3 willSendETARequest:(id)a4
{
  -[MNNavigationSession updateManager:willSendETARequest:](self->_navigationSession, "updateManager:willSendETARequest:", a3, a4);
}

- (void)updateManager:(id)a3 didReceiveETAResponse:(id)a4
{
  -[MNNavigationSession updateManager:didReceiveETAResponse:](self->_navigationSession, "updateManager:didReceiveETAResponse:", a3, a4);
}

- (BOOL)wantsETAUpdates
{
  return -[MNNavigationSession wantsETAUpdates](self->_navigationSession, "wantsETAUpdates");
}

- (id)routeInfoForUpdateManager:(id)a3 reason:(unint64_t)a4
{
  return -[MNNavigationSession routeInfoForUpdateManager:reason:](self->_navigationSession, "routeInfoForUpdateManager:reason:", a3, a4);
}

- (id)userLocationForUpdateManager:(id)a3
{
  return -[MNNavigationSession userLocationForUpdateManager:](self->_navigationSession, "userLocationForUpdateManager:", a3);
}

- (id)recentLocationHistoryForUpdateManager:(id)a3
{
  return -[MNNavigationSession recentLocationHistoryForUpdateManager:](self->_navigationSession, "recentLocationHistoryForUpdateManager:", a3);
}

- (unint64_t)targetLegIndex
{
  return -[MNNavigationSession targetLegIndex](self->_navigationSession, "targetLegIndex");
}

- (int)state
{
  return -[MNNavigationSession state](self->_navigationSession, "state");
}

- (void)navigationSession:(id)a3 didChangeNavigationState:(int)a4
{
  uint64_t v4;
  id WeakRetained;

  v4 = *(_QWORD *)&a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManager:didChangeNavigationState:", self, v4);

}

- (void)navigationSession:(id)a3 shouldEndWithReason:(unint64_t)a4
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManager:shouldEndWithReason:", self, a4);

}

- (void)navigationSession:(id)a3 didUpdateMatchedLocation:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  MNGetPuckTrackingLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v7;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_INFO, "[MN] [%@] - Processing - in MNNavigationSessionManager::navigationSession:didUpdateMatchedLocation:", (uint8_t *)&v10, 0xCu);

  }
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setLocation:", v5);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManager:didSendNavigationServiceCallback:", self, v8);

}

- (void)navigationSession:(id)a3 matchedToStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5
{
  id WeakRetained;
  id v9;

  v9 = (id)objc_opt_new();
  objc_msgSend(v9, "setStepIndex:", a4);
  objc_msgSend(v9, "setSegmentIndex:", a5);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManager:didSendNavigationServiceCallback:", self, v9);

}

- (void)navigationSession:(id)a3 currentStepIndex:(unint64_t)a4 didUpdateDistanceUntilManeuver:(double)a5 timeUntilManeuver:(double)a6
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManager:currentStepIndex:didUpdateDistanceUntilManeuver:timeUntilManeuver:", self, a4, a5, a6);

}

- (void)navigationSessionDidFinishLocationUpdate:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManagerDidFinishLocationUpdate:", self);

}

- (void)navigationSession:(id)a3 isApproachingEndOfLeg:(unint64_t)a4
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManager:isApproachingEndOfLeg:", self, a4);

}

- (void)navigationSession:(id)a3 didEnterPreArrivalStateForWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  MNNavigationSessionManagerDelegate **p_delegate;
  id v8;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManager:didEnterPreArrivalStateForWaypoint:endOfLegIndex:", self, v8, a5);

}

- (void)navigationSession:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  MNNavigationSessionManagerDelegate **p_delegate;
  id v8;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManager:didArriveAtWaypoint:endOfLegIndex:", self, v8, a5);

}

- (void)navigationSession:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6
{
  MNSessionUpdateManager *updateManager;
  id v10;
  id WeakRetained;

  updateManager = self->_updateManager;
  v10 = a4;
  -[MNSessionUpdateManager requestImmediateUpdateWithReason:](updateManager, "requestImmediateUpdateWithReason:", 5);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManager:didResumeNavigatingFromWaypoint:endOfLegIndex:reason:", self, v10, a5, a6);

}

- (void)navigationSessionDidEnterPreArrivalState:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManagerDidEnterPreArrivalState:", self);

}

- (void)navigationSessionDidArrive:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManagerDidArrive:", self);

}

- (void)navigationSessionWillPause:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManagerWillPause:", self);

}

- (void)navigationSessionWillResumeFromPause:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManagerWillResumeFromPause:", self);

}

- (void)navigationSession:(id)a3 didReceiveRouteSignalStrength:(unint64_t)a4
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManager:didReceiveRouteSignalStrength:", self, a4);

}

- (void)navigationSession:(id)a3 didReachETAUpdatePosition:(id)a4
{
  -[MNSessionUpdateManager requestUpdateForETAUPosition:](self->_updateManager, "requestUpdateForETAUPosition:", a4);
}

- (void)navigationSession:(id)a3 didUpdateDisplayETA:(id)a4 remainingDistance:(id)a5 batteryChargeInfo:(id)a6
{
  id v9;
  id v10;
  id v11;
  id WeakRetained;
  id v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v13 = (id)objc_opt_new();
  objc_msgSend(v13, "setDisplayETAInfo:", v11);

  objc_msgSend(v13, "setRouteDistanceInfo:", v10);
  objc_msgSend(v13, "setBatteryChargeInfo:", v9);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManager:didSendNavigationServiceCallback:", self, v13);

}

- (void)navigationSession:(id)a3 didUpdateETAResponseForRoute:(id)a4
{
  MNNavigationSessionManagerDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManager:didUpdateETAResponseForRoute:", self, v6);

}

- (void)navigationSession:(id)a3 didUpdateHeading:(double)a4 accuracy:(double)a5
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManager:didUpdateHeading:accuracy:", self, a4, a5);

}

- (void)navigationSession:(id)a3 didUpdateMotionType:(unint64_t)a4 confidence:(unint64_t)a5
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManager:didUpdateMotionType:confidence:", self, a4, a5);

}

- (void)navigationSessionWillReroute:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManagerWillReroute:", self);

}

- (void)navigationSessionDidCancelReroute:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManagerDidCancelReroute:", self);

}

- (void)navigationSession:(id)a3 didReroute:(id)a4 withLocation:(id)a5 withAlternateRoutes:(id)a6 rerouteReason:(unint64_t)a7
{
  MNSessionUpdateManager *updateManager;
  id v12;
  id v13;
  id v14;
  id WeakRetained;

  updateManager = self->_updateManager;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  -[MNSessionUpdateManager restartUpdateTimer](updateManager, "restartUpdateTimer");
  -[MNSimulationLocationProvider updateWithRouteInfo:rerouteReason:](self->_simulationLocationProvider, "updateWithRouteInfo:rerouteReason:", v14, a7);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManager:didRerouteWithRoute:location:withAlternateRoutes:rerouteReason:", self, v14, v13, v12, a7);

}

- (void)navigationSession:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 rerouteReason:(unint64_t)a6
{
  uint64_t v7;
  MNSessionUpdateManager *updateManager;
  id v10;
  id WeakRetained;

  v7 = *(_QWORD *)&a4;
  updateManager = self->_updateManager;
  v10 = a5;
  -[MNSessionUpdateManager restartUpdateTimer](updateManager, "restartUpdateTimer");
  -[MNSimulationLocationProvider updateWithRouteInfo:rerouteReason:](self->_simulationLocationProvider, "updateWithRouteInfo:rerouteReason:", v10, a6);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManager:didSwitchToNewTransportType:newRoute:", self, v7, v10);

}

- (void)navigationSession:(id)a3 didFailRerouteWithError:(id)a4
{
  MNNavigationSessionManagerDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManager:didFailRerouteWithError:", self, v6);

}

- (void)navigationSession:(id)a3 didUpdateAlternateRoutes:(id)a4
{
  MNNavigationSessionManagerDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManager:didUpdateAlternateRoutes:", self, v6);

}

- (void)navigationSession:(id)a3 proceedToRouteDistance:(double)a4 displayString:(id)a5 closestStepIndex:(unint64_t)a6
{
  MNNavigationSessionManagerDelegate **p_delegate;
  id v10;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManager:proceedToRouteDistance:displayString:closestStepIndex:", self, v10, a6, a4);

}

- (void)navigationSession:(id)a3 currentStepIndex:(unint64_t)a4 didUpdateDistanceUntilSign:(double)a5 timeUntilSign:(double)a6
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManager:currentStepIndex:didUpdateDistanceUntilSign:timeUntilSign:", self, a4, a5, a6);

}

- (void)navigationSession:(id)a3 willAnnounce:(unint64_t)a4 inSeconds:(double)a5
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManager:willAnnounce:inSeconds:", self, a4, a5);

}

- (void)navigationSession:(id)a3 displayPrimaryStep:(id)a4 instructions:(id)a5 shieldType:(int)a6 shieldText:(id)a7 drivingSide:(int)a8 maneuverStepIndex:(unint64_t)a9 isSynthetic:(BOOL)a10
{
  uint64_t v10;
  uint64_t v11;
  MNNavigationSessionManagerDelegate **p_delegate;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id WeakRetained;

  v10 = *(_QWORD *)&a8;
  v11 = *(_QWORD *)&a6;
  p_delegate = &self->_delegate;
  v16 = a7;
  v17 = a5;
  v18 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(v19) = a10;
  objc_msgSend(WeakRetained, "navigationSessionManager:displayPrimaryStep:instructions:shieldType:shieldText:drivingSide:maneuverStepIndex:isSynthetic:", self, v18, v17, v11, v16, v10, a9, v19);

}

- (void)navigationSession:(id)a3 displayManeuverAlertForAnnouncementStage:(unint64_t)a4
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManager:displayManeuverAlertForAnnouncementStage:", self, a4);

}

- (void)navigationSession:(id)a3 displaySecondaryStep:(id)a4 instructions:(id)a5 shieldType:(int)a6 shieldText:(id)a7 drivingSide:(int)a8
{
  uint64_t v8;
  uint64_t v9;
  MNNavigationSessionManagerDelegate **p_delegate;
  id v14;
  id v15;
  id v16;
  id WeakRetained;

  v8 = *(_QWORD *)&a8;
  v9 = *(_QWORD *)&a6;
  p_delegate = &self->_delegate;
  v14 = a7;
  v15 = a5;
  v16 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManager:displaySecondaryStep:instructions:shieldType:shieldText:drivingSide:", self, v16, v15, v9, v14, v8);

}

- (void)navigationSessionHideSecondaryStep:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManagerHideSecondaryStep:", self);

}

- (void)navigationSessionBeginGuidanceUpdate:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManagerBeginGuidanceUpdate:", self);

}

- (void)navigationSessionEndGuidanceUpdate:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManagerEndGuidanceUpdate:", self);

}

- (void)navigationSession:(id)a3 updateSignsWithInfo:(id)a4
{
  MNNavigationSessionManagerDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManager:updateSignsWithInfo:", self, v6);

}

- (void)navigationSession:(id)a3 updateSignsWithARInfo:(id)a4
{
  MNNavigationSessionManagerDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManager:updateSignsWithARInfo:", self, v6);

}

- (void)navigationSession:(id)a3 usePersistentDisplay:(BOOL)a4
{
  _BOOL8 v4;
  id WeakRetained;

  v4 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManager:usePersistentDisplay:", self, v4);

}

- (void)navigationSession:(id)a3 showLaneDirections:(id)a4
{
  MNNavigationSessionManagerDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManager:showLaneDirections:", self, v6);

}

- (void)navigationSession:(id)a3 hideLaneDirectionsForId:(id)a4
{
  MNNavigationSessionManagerDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManager:hideLaneDirectionsForId:", self, v6);

}

- (void)navigationSession:(id)a3 showJunctionView:(id)a4
{
  MNNavigationSessionManagerDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManager:showJunctionView:", self, v6);

}

- (void)navigationSession:(id)a3 hideJunctionViewForId:(id)a4
{
  MNNavigationSessionManagerDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManager:hideJunctionViewForId:", self, v6);

}

- (void)navigationSession:(id)a3 didEnableGuidancePrompts:(BOOL)a4
{
  _BOOL8 v4;
  id WeakRetained;

  v4 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManager:didEnableGuidancePrompts:", self, v4);

}

- (void)navigationSession:(id)a3 newGuidanceEventFeedback:(id)a4
{
  MNNavigationSessionManagerDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManager:newGuidanceEventFeedback:", self, v6);

}

- (void)navigationSession:(id)a3 updatedGuidanceEventFeedback:(id)a4
{
  MNNavigationSessionManagerDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManager:updatedGuidanceEventFeedback:", self, v6);

}

- (void)navigationSession:(id)a3 didUpdateBackgroundWalkingRoute:(id)a4
{
  id v5;
  id WeakRetained;
  MNNavigationServiceCallback_DidUpdateBackgroundWalkingRoute *v7;

  v5 = a4;
  v7 = objc_alloc_init(MNNavigationServiceCallback_DidUpdateBackgroundWalkingRoute);
  -[MNNavigationServiceCallback_DidUpdateBackgroundWalkingRoute setRouteInfo:](v7, "setRouteInfo:", v5);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManager:didSendNavigationServiceCallback:", self, v7);

}

- (void)navigationSession:(id)a3 didUpdateVehicleParkingInfo:(id)a4
{
  id v5;
  id WeakRetained;
  MNNavigationServiceCallback_DidUpdateVehicleParkingInfo *v7;

  v5 = a4;
  v7 = objc_alloc_init(MNNavigationServiceCallback_DidUpdateVehicleParkingInfo);
  -[MNNavigationServiceCallback_DidUpdateVehicleParkingInfo setVehicleParkingInfo:](v7, "setVehicleParkingInfo:", v5);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManager:didSendNavigationServiceCallback:", self, v7);

}

- (void)navigationSession:(id)a3 didReceiveTrafficIncidentAlert:(id)a4 responseCallback:(id)a5
{
  NSMutableDictionary *trafficIncidentAlertCallbacks;
  id v8;
  void *v9;
  void *v10;
  id WeakRetained;

  trafficIncidentAlertCallbacks = self->_trafficIncidentAlertCallbacks;
  v8 = a4;
  v9 = (void *)MEMORY[0x1B5E0E364](a5);
  objc_msgSend(v8, "alertID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](trafficIncidentAlertCallbacks, "setObject:forKey:", v9, v10);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManager:didReceiveTrafficIncidentAlert:", self, v8);

}

- (void)navigationSession:(id)a3 didUpdateTrafficIncidentAlert:(id)a4
{
  MNNavigationSessionManagerDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManager:didUpdateTrafficIncidentAlert:", self, v6);

}

- (void)navigationSession:(id)a3 didInvalidateTrafficIncidentAlert:(id)a4
{
  MNNavigationSessionManagerDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManager:didInvalidateTrafficIncidentAlert:", self, v6);

}

- (void)navigationSession:(id)a3 didDismissTrafficIncidentAlert:(id)a4
{
  NSMutableDictionary *trafficIncidentAlertCallbacks;
  id v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  trafficIncidentAlertCallbacks = self->_trafficIncidentAlertCallbacks;
  v6 = a4;
  objc_msgSend(v6, "alertID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](trafficIncidentAlertCallbacks, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Dodgeball response callback not called before dismissing"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = 136316162;
      v13 = "-[MNNavigationSessionManager navigationSession:didDismissTrafficIncidentAlert:]";
      v14 = 2080;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSessionManager.m";
      v16 = 1024;
      v17 = 887;
      v18 = 2080;
      v19 = "_trafficIncidentAlertCallbacks[dismissedAlert.alertID] == nil";
      v20 = 2112;
      v21 = v10;
      _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v12, 0x30u);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManager:didDismissTrafficIncidentAlert:", self, v6);

}

- (void)navigationSession:(id)a3 didStartSpeakingPrompt:(id)a4
{
  MNNavigationSessionManagerDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManager:didStartSpeakingPrompt:", self, v6);

}

- (void)navigationSession:(id)a3 willProcessSpeechEvent:(id)a4
{
  MNNavigationSessionManagerDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManager:willProcessSpeechEvent:", self, v6);

}

- (void)navigationSession:(id)a3 didProcessSpeechEvent:(id)a4
{
  MNNavigationSessionManagerDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManager:didProcessSpeechEvent:", self, v6);

}

- (void)navigationSession:(id)a3 triggerHaptics:(int)a4
{
  uint64_t v4;
  id WeakRetained;

  v4 = *(_QWORD *)&a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManager:triggerHaptics:", self, v4);

}

- (void)navigationSession:(id)a3 didReceiveTransitAlert:(id)a4
{
  MNNavigationSessionManagerDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManager:didReceiveTransitAlert:", self, v6);

}

- (void)navigationSession:(id)a3 didSendNavigationServiceCallback:(id)a4
{
  MNNavigationSessionManagerDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManager:didSendNavigationServiceCallback:", self, v6);

}

- (void)userOptionsEngine:(id)a3 didChangeFrom:(id)a4 to:(id)a5
{
  -[MNNavigationSession didChangeUserOptionsFrom:to:](self->_navigationSession, "didChangeUserOptionsFrom:to:", a4, a5);
}

- (void)navigationTraceManager:(id)a3 didUpdateTracePlaybackDetails:(id)a4
{
  MNNavigationSessionManagerDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationSessionManager:didUpdateTracePlaybackDetails:", self, v6);

}

- (MNNavigationSessionManagerDelegate)delegate
{
  return (MNNavigationSessionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MNSessionUpdateManager)updateManager
{
  return self->_updateManager;
}

- (MNNavigationSession)navigationSession
{
  return self->_navigationSession;
}

- (MNRouteManager)routeManager
{
  return self->_routeManager;
}

- (GEOApplicationAuditToken)auditToken
{
  return self->_auditToken;
}

- (MNNavigationTraceManager)traceManager
{
  return self->_traceManager;
}

- (MNSimulationLocationProvider)simulationLocationProvider
{
  return self->_simulationLocationProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_trafficIncidentAlertCallbacks, 0);
  objc_storeStrong((id *)&self->_simulationLocationProvider, 0);
  objc_storeStrong((id *)&self->_traceManager, 0);
  objc_storeStrong((id *)&self->_proxyUpdater, 0);
  objc_storeStrong((id *)&self->_routeManager, 0);
  objc_storeStrong((id *)&self->_navigationSession, 0);
  objc_storeStrong((id *)&self->_updateManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
