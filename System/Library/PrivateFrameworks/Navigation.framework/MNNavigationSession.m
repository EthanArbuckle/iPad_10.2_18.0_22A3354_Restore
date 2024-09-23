@implementation MNNavigationSession

- (MNNavigationSession)init
{
  MNNavigationSession *result;

  result = (MNNavigationSession *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (MNNavigationSession)initWithRouteManager:(id)a3 auditToken:(id)a4
{
  return -[MNNavigationSession initWithRouteManager:auditToken:traceManager:](self, "initWithRouteManager:auditToken:traceManager:", a3, a4, 0);
}

- (MNNavigationSession)initWithRouteManager:(id)a3 auditToken:(id)a4 traceManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  MNNavigationSession *v12;
  MNObserverHashTable *v13;
  MNObserverHashTable *observers;
  MNTrafficIncidentAlert *activeTrafficIncidentAlert;
  double v16;
  void *v17;
  void *v18;
  MNNavigationSession *v19;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)MNNavigationSession;
  v12 = -[MNNavigationSession init](&v21, sel_init);
  if (v12)
  {
    v13 = -[MNObserverHashTable initWithProtocol:]([MNObserverHashTable alloc], "initWithProtocol:", &unk_1EEECF110);
    observers = v12->_observers;
    v12->_observers = v13;

    v12->_navigationCapabilities = 31;
    objc_storeStrong((id *)&v12->_auditToken, a4);
    objc_storeStrong((id *)&v12->_routeManager, a3);
    objc_storeStrong((id *)&v12->_traceManager, a5);
    v12->_navigationType = 0;
    v12->_guidancePromptsEnabled = 1;
    v12->_isSpeakingTrafficIncidentAlert = 0;
    activeTrafficIncidentAlert = v12->_activeTrafficIncidentAlert;
    v12->_activeTrafficIncidentAlert = 0;

    v12->_displayedStepIndex = 0x7FFFFFFFFFFFFFFFLL;
    GEOConfigGetDouble();
    v12->_locationProjectionTime = v16;
    _GEOConfigAddDelegateListenerForKey();
    objc_msgSend(v11, "tracePlayer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v11, "tracePlayer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "registerObserver:", v12);

    }
    v19 = v12;
  }

  return v12;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  GEOConfigRemoveDelegateListenerForAllKeys();
  -[MNNavigationTraceManager tracePlayer](self->_traceManager, "tracePlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MNNavigationTraceManager tracePlayer](self->_traceManager, "tracePlayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unregisterObserver:", self);

  }
  -[MNNavigationSession _stopLocationUpdates](self, "_stopLocationUpdates");
  -[MNNavigationSession _closeTileLoader](self, "_closeTileLoader");
  -[MNAudioManager unregisterObserver:](self->_audioManager, "unregisterObserver:", self);
  v5.receiver = self;
  v5.super_class = (Class)MNNavigationSession;
  -[MNNavigationSession dealloc](&v5, sel_dealloc);
}

- (MNLocation)lastMatchedLocation
{
  return -[MNLocationTracker lastMatchedLocation](self->_locationTracker, "lastMatchedLocation");
}

- (int)navigationState
{
  return -[MNLocationTracker state](self->_locationTracker, "state");
}

- (void)registerObserver:(id)a3
{
  -[MNObserverHashTable registerObserver:](self->_observers, "registerObserver:", a3);
}

- (void)unregisterObserver:(id)a3
{
  -[MNObserverHashTable unregisterObserver:](self->_observers, "unregisterObserver:", a3);
}

- (void)startNavigationSessionWithDetails:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  GEOComposedWaypoint *v16;
  GEOComposedWaypoint *destination;
  NSMutableArray *v18;
  NSMutableArray *navigationSessionStateListeners;
  MNNavigationSessionState *v20;
  MNNavigationSessionState *navigationSessionState;
  void *v22;
  void *v23;
  MNNavigationSessionState *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  id v31;
  void *v32;
  GEOResourceManifestUpdateAssertion *v33;
  GEOResourceManifestUpdateAssertion *manifestUpdateAssertion;
  MNNavigationSessionLogger *v35;
  MNNavigationSessionLogger *logger;
  void *v37;
  MNTraceNavigationEventRecorder *v38;
  void *v39;
  MNTraceNavigationEventRecorder *v40;
  MNTraceNavigationEventRecorder *navigationEventRecorder;
  MNTraceNavigationUpdateRecorder *v42;
  void *v43;
  MNTraceNavigationUpdateRecorder *v44;
  MNTraceNavigationUpdateRecorder *navigationUpdateRecorder;
  void *v46;
  uint64_t v47;
  MNServerSessionStateInfo *v48;
  MNServerSessionStateInfo *serverSessionStateInfo;
  void *v50;
  void *v51;
  MNServerSessionStateInfo *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  MNVehicleMonitor *v58;
  MNVehicleMonitor *vehicleMonitor;
  GEOProbeCrumbs *v60;
  GEOProbeCrumbs *probeCrumbs;
  MNObserverHashTable *observers;
  void *v63;
  uint8_t buf[4];
  const char *v65;
  __int16 v66;
  const char *v67;
  __int16 v68;
  int v69;
  __int16 v70;
  const char *v71;
  __int16 v72;
  void *v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_navigationType)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Navigation session already started"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v65 = "-[MNNavigationSession startNavigationSessionWithDetails:]";
      v66 = 2080;
      v67 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSession.m";
      v68 = 1024;
      v69 = 252;
      v70 = 2080;
      v71 = "_navigationType == MNNavigationType_None";
      v72 = 2112;
      v73 = v5;
      _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
    }

    goto LABEL_5;
  }
  -[MNRouteManager currentRoute](self->_routeManager, "currentRoute");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v5 = v7;
    objc_msgSend(v7, "origin");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8
      || (v9 = (void *)v8,
          objc_msgSend(v5, "destination"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v10,
          v9,
          !v10))
    {
      objc_msgSend(v5, "origin");
      v11 = objc_claimAutoreleasedReturnValue();
      if (!v11
        || (v12 = (void *)v11,
            objc_msgSend(v5, "destination"),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            v13,
            v12,
            !v13))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Starting navigation session without origin or destination"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        GEOFindOrCreateLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v65 = "-[MNNavigationSession startNavigationSessionWithDetails:]";
          v66 = 2080;
          v67 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSession.m";
          v68 = 1024;
          v69 = 263;
          v70 = 2080;
          v71 = "currentRoute.origin != nil && currentRoute.destination != nil";
          v72 = 2112;
          v73 = v14;
          _os_log_impl(&dword_1B0AD7000, v15, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
        }

      }
    }
    objc_msgSend(v5, "destination");
    v16 = (GEOComposedWaypoint *)objc_claimAutoreleasedReturnValue();
    destination = self->_destination;
    self->_destination = v16;

    self->_navigationType = objc_msgSend(v4, "navigationType");
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    navigationSessionStateListeners = self->_navigationSessionStateListeners;
    self->_navigationSessionStateListeners = v18;

    v20 = objc_alloc_init(MNNavigationSessionState);
    navigationSessionState = self->_navigationSessionState;
    self->_navigationSessionState = v20;

    -[MNNavigationSessionState setAuditToken:](self->_navigationSessionState, "setAuditToken:", self->_auditToken);
    objc_msgSend(v4, "requestingAppIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNNavigationSessionState setRequestingAppIdentifier:](self->_navigationSessionState, "setRequestingAppIdentifier:", v22);

    objc_msgSend(v4, "traits");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNNavigationSessionState setTraits:](self->_navigationSessionState, "setTraits:", v23);

    v24 = self->_navigationSessionState;
    -[MNRouteManager currentRouteInfo](self->_routeManager, "currentRouteInfo");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNNavigationSessionState updateCurrentRouteInfo:rerouteReason:](v24, "updateCurrentRouteInfo:rerouteReason:", v25, 0);

    objc_msgSend(v4, "reconnectionDetails");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v4, "reconnectionDetails");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNNavigationSessionState setInitialRouteSource:](self->_navigationSessionState, "setInitialRouteSource:", objc_msgSend(v27, "initialRouteSource"));

      objc_msgSend(v4, "reconnectionDetails");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNNavigationSessionState setTargetLegIndex:](self->_navigationSessionState, "setTargetLegIndex:", objc_msgSend(v28, "targetLegIndex"));

    }
    else
    {
      -[MNNavigationSessionState setInitialRouteSource:](self->_navigationSessionState, "setInitialRouteSource:", objc_msgSend(v5, "source"));
      -[MNNavigationSessionState setTargetLegIndex:](self->_navigationSessionState, "setTargetLegIndex:", 0x7FFFFFFFFFFFFFFFLL);
    }
    -[MNNavigationSession _openTileLoader](self, "_openTileLoader");
    if (GEOConfigGetBOOL())
    {
      v31 = objc_alloc(MEMORY[0x1E0D27428]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.Navigation.active-session.%p"), self);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (GEOResourceManifestUpdateAssertion *)objc_msgSend(v31, "initWithReason:", v32);
      manifestUpdateAssertion = self->_manifestUpdateAssertion;
      self->_manifestUpdateAssertion = v33;

    }
    v35 = objc_alloc_init(MNNavigationSessionLogger);
    logger = self->_logger;
    self->_logger = v35;

    -[MNNavigationSession registerObserver:](self, "registerObserver:", self->_logger);
    -[NSMutableArray addObject:](self->_navigationSessionStateListeners, "addObject:", self->_logger);
    -[MNNavigationTraceManager traceRecorder](self->_traceManager, "traceRecorder");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      v38 = [MNTraceNavigationEventRecorder alloc];
      -[MNNavigationTraceManager traceRecorder](self->_traceManager, "traceRecorder");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = -[MNTraceNavigationEventRecorder initWithTraceRecorder:](v38, "initWithTraceRecorder:", v39);
      navigationEventRecorder = self->_navigationEventRecorder;
      self->_navigationEventRecorder = v40;

      if (self->_navigationEventRecorder)
        -[MNNavigationSession registerObserver:](self, "registerObserver:");
      v42 = [MNTraceNavigationUpdateRecorder alloc];
      -[MNNavigationTraceManager traceRecorder](self->_traceManager, "traceRecorder");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = -[MNTraceNavigationUpdateRecorder initWithTraceRecorder:](v42, "initWithTraceRecorder:", v43);
      navigationUpdateRecorder = self->_navigationUpdateRecorder;
      self->_navigationUpdateRecorder = v44;

      if (self->_navigationUpdateRecorder)
        -[MNNavigationSession registerObserver:](self, "registerObserver:");
    }
    -[MNNavigationSession _startLocationUpdates](self, "_startLocationUpdates");
    objc_msgSend(v5, "origin");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v46, "isCurrentLocation") & 1) != 0)
    {

    }
    else
    {
      v47 = objc_msgSend(v4, "simulationType");

      if (!v47)
      {
LABEL_31:
        if (self->_navigationType == 3)
        {
          v48 = objc_alloc_init(MNServerSessionStateInfo);
          serverSessionStateInfo = self->_serverSessionStateInfo;
          self->_serverSessionStateInfo = v48;

          -[MNServerSessionStateInfo updateWithRoute:](self->_serverSessionStateInfo, "updateWithRoute:", v5);
          objc_msgSend(v4, "reconnectionDetails");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "serverSessionState");
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          if (v51)
          {
            v52 = self->_serverSessionStateInfo;
            objc_msgSend(v4, "reconnectionDetails");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "serverSessionState");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            -[MNServerSessionStateInfo updateWithSessionState:](v52, "updateWithSessionState:", v54);

          }
          self->_guidancePromptsEnabled = objc_msgSend(v4, "guidanceType") == 0;
          -[MNNavigationSession _startAudioSessionWithGuidanceLevelOverride:](self, "_startAudioSessionWithGuidanceLevelOverride:", objc_msgSend(v4, "guidanceLevelOverride"));
          -[MNNavigationSession _startTravelTimeUpdates](self, "_startTravelTimeUpdates");
          -[MNNavigationSession _startIdleTimerUpdates](self, "_startIdleTimerUpdates");
          v55 = objc_msgSend(v4, "isReconnecting");
          objc_msgSend(v4, "reconnectionDetails");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "spokenAnnouncements");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          -[MNNavigationSession _startGuidanceAllowMidRouteStart:announcementsToIgnore:](self, "_startGuidanceAllowMidRouteStart:announcementsToIgnore:", v55, v57);

          v58 = objc_alloc_init(MNVehicleMonitor);
          vehicleMonitor = self->_vehicleMonitor;
          self->_vehicleMonitor = v58;

          -[MNVehicleMonitor setDelegate:](self->_vehicleMonitor, "setDelegate:", self);
          -[MNVehicleMonitor startMonitoring](self->_vehicleMonitor, "startMonitoring");
          -[MNNavigationSession _startVirtualGarageUpdates](self, "_startVirtualGarageUpdates");
          v60 = (GEOProbeCrumbs *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27388]), "initWithRoute:", v5);
          probeCrumbs = self->_probeCrumbs;
          self->_probeCrumbs = v60;

        }
        if (-[MNAudioManager voiceGuidanceEnabled](self->_audioManager, "voiceGuidanceEnabled")
          && objc_msgSend(v5, "hasInitialPromptType:", 1))
        {
          GEOConfigSetBOOL();
        }
        observers = self->_observers;
        -[MNRouteManager currentRouteInfo](self->_routeManager, "currentRouteInfo");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        -[MNObserverHashTable navigationSession:didStartWithRoute:navigationType:isResumingMultipointRoute:isReconnecting:](observers, "navigationSession:didStartWithRoute:navigationType:isResumingMultipointRoute:isReconnecting:", self, v63, self->_navigationType, objc_msgSend(v4, "isResumingMultipointRoute"), objc_msgSend(v4, "isReconnecting"));

        if (self->_serverSessionStateInfo)
          -[MNNavigationSession _updateResumeRouteInfoFrom:](self, "_updateResumeRouteInfoFrom:", *MEMORY[0x1E0D26AA8]);
        goto LABEL_5;
      }
    }
    -[MNNavigationSession _startMotionUpdates](self, "_startMotionUpdates");
    goto LABEL_31;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Starting a navigation session without a route"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  GEOFindOrCreateLog();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    v65 = "-[MNNavigationSession startNavigationSessionWithDetails:]";
    v66 = 2080;
    v67 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSession.m";
    v68 = 1024;
    v69 = 258;
    v70 = 2080;
    v71 = "currentRoute != nil";
    v72 = 2112;
    v73 = v29;
    _os_log_impl(&dword_1B0AD7000, v30, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
  }

  v5 = 0;
LABEL_5:

}

- (void)updateWithInitialLocation:(id)a3
{
  void *v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  MNGuidanceManager *guidanceManager;
  void *v9;
  void *v10;
  MNTimeAndDistanceUpdater *timeAndDistanceUpdater;
  void *v12;
  id v13;

  v13 = a3;
  +[MNLocationManager sharedLocationManager](MNLocationManager, "sharedLocationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "locationProviderType") == 3)
  {
    v5 = v13 == 0;
  }
  else
  {
    v6 = objc_msgSend(v4, "locationProviderType");
    v5 = v13 == 0;
    if (v13 && v6 != 4)
    {
      objc_msgSend(v4, "pushLocation:", v13);
      v5 = 0;
    }
  }
  if (!self->_locationTracker && (self->_navigationType & 0xFFFFFFFFFFFFFFFELL) == 2)
    -[MNNavigationSession _startLocationTrackingWithInitialLocation:targetLegIndex:](self, "_startLocationTrackingWithInitialLocation:targetLegIndex:", v13, -[MNNavigationSessionState targetLegIndex](self->_navigationSessionState, "targetLegIndex"));
  if (v5 && self->_navigationType == 3)
  {
    -[MNLocationTracker lastMatchedLocation](self->_locationTracker, "lastMatchedLocation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      guidanceManager = self->_guidanceManager;
      -[MNLocationTracker lastMatchedLocation](self->_locationTracker, "lastMatchedLocation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNGuidanceManager updateGuidanceForLocation:navigatorState:](guidanceManager, "updateGuidanceForLocation:navigatorState:", v9, -[MNLocationTracker state](self->_locationTracker, "state"));

    }
    -[MNRouteManager currentRouteInfo](self->_routeManager, "currentRouteInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      timeAndDistanceUpdater = self->_timeAndDistanceUpdater;
      -[MNRouteManager currentRouteInfo](self->_routeManager, "currentRouteInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNTimeAndDistanceUpdater updateDisplayETAForRoute:notificationType:](timeAndDistanceUpdater, "updateDisplayETAForRoute:notificationType:", v12, 2);

    }
  }

}

- (void)stopNavigationSessionWithReason:(unint64_t)a3
{
  MNObserverHashTable *observers;
  void *v6;
  void *v7;
  uint64_t v8;
  GEOResourceManifestUpdateAssertion *manifestUpdateAssertion;
  MNVehicleMonitor *vehicleMonitor;
  MNObserverHashTable *v11;
  void *v12;
  MNNavigationSessionState *navigationSessionState;
  NSMutableArray *navigationSessionStateListeners;
  MNTraceNavigationEventRecorder *navigationEventRecorder;
  MNNavigationSessionLogger *logger;
  void *v17;
  NSObject *v18;
  int v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!self->_navigationType)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Trying to stop navigation session that hasn't been started"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = 136316162;
      v20 = "-[MNNavigationSession stopNavigationSessionWithReason:]";
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSession.m";
      v23 = 1024;
      v24 = 377;
      v25 = 2080;
      v26 = "_navigationType != MNNavigationType_None";
      v27 = 2112;
      v28 = v17;
      _os_log_impl(&dword_1B0AD7000, v18, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v19, 0x30u);
    }

  }
  observers = self->_observers;
  +[MNNavigationServiceCallback_WillEndNavigation willEndNavigationWithReason:](MNNavigationServiceCallback_WillEndNavigation, "willEndNavigationWithReason:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNObserverHashTable navigationSession:didSendNavigationServiceCallback:](observers, "navigationSession:didSendNavigationServiceCallback:", self, v6);

  if (a3 == 3 && !-[MNNavigationSessionState isOnLastLeg](self->_navigationSessionState, "isOnLastLeg"))
  {
    -[MNNavigationSessionState nextLeg](self->_navigationSessionState, "nextLeg");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "startRouteCoordinate");

    -[MNNavigationSession _updateResumeRouteInfoFrom:](self, "_updateResumeRouteInfoFrom:", v8);
  }
  manifestUpdateAssertion = self->_manifestUpdateAssertion;
  self->_manifestUpdateAssertion = 0;

  -[MNNavigationSession _closeTileLoader](self, "_closeTileLoader");
  -[MNNavigationSession _stopLocationTracking](self, "_stopLocationTracking");
  -[MNVehicleMonitor setDelegate:](self->_vehicleMonitor, "setDelegate:", 0);
  -[MNVehicleMonitor stopMonitoring](self->_vehicleMonitor, "stopMonitoring");
  vehicleMonitor = self->_vehicleMonitor;
  self->_vehicleMonitor = 0;

  if (self->_navigationType == 3)
  {
    -[MNNavigationSession _stopAudioSession](self, "_stopAudioSession");
    -[MNNavigationSession _stopGuidance](self, "_stopGuidance");
    -[MNNavigationSession _stopIdleTimerUpdates](self, "_stopIdleTimerUpdates");
    -[MNNavigationSession _stopTravelTimeUpdates](self, "_stopTravelTimeUpdates");
    -[GEOProbeCrumbs clearCache](self->_probeCrumbs, "clearCache");
  }
  -[MNNavigationSession _stopMotionUpdates](self, "_stopMotionUpdates");
  -[MNNavigationSession _stopLocationUpdates](self, "_stopLocationUpdates");
  self->_navigationType = 0;
  -[MNNavigationSession _stopVirtualGarageUpdates](self, "_stopVirtualGarageUpdates");
  v11 = self->_observers;
  +[MNNavigationServiceCallback_DidEndNavigation didEndNavigationWithReason:](MNNavigationServiceCallback_DidEndNavigation, "didEndNavigationWithReason:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNObserverHashTable navigationSession:didSendNavigationServiceCallback:](v11, "navigationSession:didSendNavigationServiceCallback:", self, v12);

  navigationSessionState = self->_navigationSessionState;
  self->_navigationSessionState = 0;

  navigationSessionStateListeners = self->_navigationSessionStateListeners;
  self->_navigationSessionStateListeners = 0;

  if (self->_navigationEventRecorder)
  {
    -[MNNavigationSession unregisterObserver:](self, "unregisterObserver:");
    navigationEventRecorder = self->_navigationEventRecorder;
    self->_navigationEventRecorder = 0;

  }
  -[MNNavigationSession unregisterObserver:](self, "unregisterObserver:", self->_logger);
  logger = self->_logger;
  self->_logger = 0;

}

- (void)rerouteWithWaypoints:(id)a3
{
  id v4;
  MNLocationTracker *locationTracker;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  locationTracker = self->_locationTracker;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__MNNavigationSession_rerouteWithWaypoints___block_invoke;
  v7[3] = &unk_1E61D1AE8;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  -[MNLocationTracker rerouteWithWaypoints:completionHandler:](locationTracker, "rerouteWithWaypoints:completionHandler:", v6, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __44__MNNavigationSession_rerouteWithWaypoints___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained[21], "navigationSession:didRerouteWithWaypoints:", WeakRetained, *(_QWORD *)(a1 + 32));
    v3 = v4;
  }

}

- (void)insertWaypoint:(id)a3
{
  id v4;
  MNLocationTracker *locationTracker;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  locationTracker = self->_locationTracker;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__MNNavigationSession_insertWaypoint___block_invoke;
  v7[3] = &unk_1E61D1AE8;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  -[MNLocationTracker insertWaypoint:completionHandler:](locationTracker, "insertWaypoint:completionHandler:", v6, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __38__MNNavigationSession_insertWaypoint___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained[21], "navigationSession:didInsertWaypoint:", WeakRetained, *(_QWORD *)(a1 + 32));
    v3 = v4;
  }

}

- (void)removeWaypointAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  MNLocationTracker *locationTracker;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  -[MNNavigationSession routeManager](self, "routeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentRoute");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "waypoints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 > a3)
  {
    objc_msgSend(v6, "waypoints");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    locationTracker = self->_locationTracker;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __45__MNNavigationSession_removeWaypointAtIndex___block_invoke;
    v13[3] = &unk_1E61D1AE8;
    objc_copyWeak(&v15, &location);
    v12 = v10;
    v14 = v12;
    -[MNLocationTracker removeWaypointAtIndex:completionHandler:](locationTracker, "removeWaypointAtIndex:completionHandler:", a3, v13);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

  }
}

void __45__MNNavigationSession_removeWaypointAtIndex___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained[21], "navigationSession:didRemoveWaypoint:", WeakRetained, *(_QWORD *)(a1 + 32));
    v3 = v4;
  }

}

- (void)advanceToNextLeg
{
  -[MNLocationTracker advanceToNextLeg](self->_locationTracker, "advanceToNextLeg");
}

- (void)updateDestination:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_destination, a3);
  v5 = a3;
  -[MNLocationTracker updateDestination:completionHandler:](self->_locationTracker, "updateDestination:completionHandler:", v5, 0);
  -[MNGuidanceManager updateDestination:](self->_guidanceManager, "updateDestination:", v5);
  -[MNObserverHashTable navigationSession:didUpdateDestination:](self->_observers, "navigationSession:didUpdateDestination:", self, v5);

}

- (void)resumeOriginalDestination
{
  GEOComposedWaypoint *v3;
  GEOComposedWaypoint *destination;
  MNLocationTracker *locationTracker;
  GEOComposedWaypoint *v6;
  _QWORD v7[5];

  -[MNRouteManager originalDestination](self->_routeManager, "originalDestination");
  v3 = (GEOComposedWaypoint *)objc_claimAutoreleasedReturnValue();
  destination = self->_destination;
  self->_destination = v3;

  v6 = self->_destination;
  locationTracker = self->_locationTracker;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__MNNavigationSession_resumeOriginalDestination__block_invoke;
  v7[3] = &unk_1E61D23C8;
  v7[4] = self;
  -[MNLocationTracker updateDestination:completionHandler:](locationTracker, "updateDestination:completionHandler:", v6, v7);
}

uint64_t __48__MNNavigationSession_resumeOriginalDestination__block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 64))
    return objc_msgSend(*(id *)(v1 + 64), "updateDestination:", *(_QWORD *)(v1 + 24));
  else
    return objc_msgSend((id)v1, "_startGuidanceAllowMidRouteStart:announcementsToIgnore:", 1, 0);
}

- (void)forceReroute
{
  -[MNLocationTracker forceRerouteWithReason:](self->_locationTracker, "forceRerouteWithReason:", 13);
}

- (void)switchToRoute:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  char *v24;
  char *v25;
  id v26;
  GEOProbeCrumbs *probeCrumbs;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "route");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "transportType") != 1)
  {

LABEL_5:
    objc_msgSend(v4, "routeID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      -[MNRouteManager alternateRoutes](self->_routeManager, "alternateRoutes", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v43, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v30;
LABEL_8:
        v15 = 0;
        while (1)
        {
          if (*(_QWORD *)v30 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v15);
          objc_msgSend(v4, "routeID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "routeID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v17, "isEqual:", v18);

          if ((v19 & 1) != 0)
            break;
          if (v13 == ++v15)
          {
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v43, 16);
            if (v13)
              goto LABEL_8;
            goto LABEL_14;
          }
        }
        v26 = v16;

        if (!v26)
          goto LABEL_15;
        goto LABEL_21;
      }
LABEL_14:

    }
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No valid alternate route when calling switch to route."));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v34 = "-[MNNavigationSession switchToRoute:]";
      v35 = 2080;
      v36 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSession.m";
      v37 = 1024;
      v38 = 509;
      v39 = 2080;
      v40 = "validAlternateRoute != nil";
      v41 = 2112;
      v42 = v20;
      _os_log_impl(&dword_1B0AD7000, v21, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
    }

    MNGetMNNavigationSessionLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "route");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "name");
      v24 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "routeID");
      v25 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v34 = v24;
      v35 = 2112;
      v36 = v25;
      _os_log_impl(&dword_1B0AD7000, v22, OS_LOG_TYPE_ERROR, "switchToRoute: was called but no valid alternate route was found for %@ (%@)", buf, 0x16u);

    }
    v26 = 0;
LABEL_21:
    -[MNLocationTracker reroute:reason:](self->_locationTracker, "reroute:reason:", v26, 10);

    goto LABEL_22;
  }
  objc_msgSend(v4, "routeID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNRouteManager currentRouteInfo](self->_routeManager, "currentRouteInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "routeID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqual:", v8);

  if (!v9)
    goto LABEL_5;
  -[MNLocationTracker reroute:reason:](self->_locationTracker, "reroute:reason:", v4, 14);
LABEL_22:
  probeCrumbs = self->_probeCrumbs;
  objc_msgSend(v4, "route");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOProbeCrumbs resetStateWithRoute:](probeCrumbs, "resetStateWithRoute:", v28);

}

- (void)changeTransportType:(int)a3 route:(id)a4
{
  -[MNLocationTracker changeTransportType:route:](self->_locationTracker, "changeTransportType:route:", *(_QWORD *)&a3, a4);
}

- (void)switchToDestinationRoute
{
  -[MNLocationTracker switchToDestinationRoute](self->_locationTracker, "switchToDestinationRoute");
}

- (void)setIsDisplayingNavigationTray:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[MNNavigationSessionState isDisplayingNavigationTray](self->_navigationSessionState, "isDisplayingNavigationTray") != a3)
  {
    -[MNNavigationSessionState setIsDisplayingNavigationTray:](self->_navigationSessionState, "setIsDisplayingNavigationTray:", v3);
    -[MNNavigationSession _updateNavigationSessionState:](self, "_updateNavigationSessionState:", self->_navigationSessionState);
  }
}

- (void)setVoiceGuidanceLevelOverride:(unint64_t)a3
{
  -[MNAudioManager setVoiceGuidanceLevelOverride:](self->_audioManager, "setVoiceGuidanceLevelOverride:", a3);
}

- (BOOL)repeatCurrentGuidance
{
  void *v3;
  void *v4;

  +[MNLocationManager sharedLocationManager](MNLocationManager, "sharedLocationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[MNGuidanceManager repeatLastGuidanceAnnouncement:](self->_guidanceManager, "repeatLastGuidanceAnnouncement:", v4);
  return (char)self;
}

- (BOOL)repeatCurrentTrafficAlert
{
  BOOL v3;
  void *v4;
  void *v5;
  uint64_t v6;
  MNAudioManager *audioManager;
  _QWORD v9[5];

  if (!self->_audioManager)
    return 0;
  if (self->_isSpeakingTrafficIncidentAlert)
    return 1;
  -[MNTrafficIncidentAlert spokenTexts](self->_activeTrafficIncidentAlert, "spokenTexts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "length");
  v3 = v6 != 0;
  if (v6)
  {
    self->_isSpeakingTrafficIncidentAlert = 1;
    audioManager = self->_audioManager;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __48__MNNavigationSession_repeatCurrentTrafficAlert__block_invoke;
    v9[3] = &unk_1E61D7E08;
    v9[4] = self;
    -[MNAudioManager requestSpeech:guidanceLevel:modifier:shortPromptType:completionHandler:](audioManager, "requestSpeech:guidanceLevel:modifier:shortPromptType:completionHandler:", v5, 1, 0, 0, v9);
  }

  return v3;
}

uint64_t __48__MNNavigationSession_repeatCurrentTrafficAlert__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 146) = 0;
  return result;
}

- (BOOL)vibrateForPrompt:(unint64_t)a3
{
  return -[MNAudioManager vibrateForShortPrompt:](self->_audioManager, "vibrateForShortPrompt:", a3);
}

- (void)stopCurrentGuidancePrompt
{
  -[MNAudioManager stopSpeaking](self->_audioManager, "stopSpeaking");
}

- (double)timeSinceLastAnnouncement
{
  double result;

  -[MNGuidanceManager timeSinceLastAnnouncement](self->_guidanceManager, "timeSinceLastAnnouncement");
  return result;
}

- (double)timeUntilNextAnnouncement
{
  double result;

  -[MNGuidanceManager timeUntilNextAnnouncement](self->_guidanceManager, "timeUntilNextAnnouncement");
  return result;
}

- (BOOL)isCurrentlySpeaking
{
  return -[MNAudioManager isSpeaking](self->_audioManager, "isSpeaking");
}

- (void)traceJumpedInTime
{
  -[MNLocationTracker traceJumpedInTime](self->_locationTracker, "traceJumpedInTime");
}

- (void)setIsNavigatingInLowGuidance:(BOOL)a3
{
  -[MNLocationTracker _setIsNavigatingInLowGuidance:](self->_locationTracker, "_setIsNavigatingInLowGuidance:", a3);
}

- (void)setJunctionViewImageWidth:(double)a3 height:(double)a4
{
  -[MNGuidanceManager setJunctionViewImageWidth:height:](self->_guidanceManager, "setJunctionViewImageWidth:height:", a3, a4);
}

- (void)changeOfflineMode:(unsigned __int8)a3
{
  -[MNLocationTracker changeOfflineMode:](self->_locationTracker, "changeOfflineMode:", a3);
}

- (void)didChangeUserOptionsFrom:(id)a3 to:(id)a4
{
  -[MNAudioManager didChangeUserOptionsFrom:to:](self->_audioManager, "didChangeUserOptionsFrom:to:", a3, a4);
}

- (void)setGuidancePromptsEnabled:(BOOL)a3
{
  _BOOL8 v3;

  if (self->_guidancePromptsEnabled != a3)
  {
    v3 = a3;
    self->_guidancePromptsEnabled = a3;
    if (a3)
      -[MNNavigationSession _startGuidanceAllowMidRouteStart:announcementsToIgnore:](self, "_startGuidanceAllowMidRouteStart:announcementsToIgnore:", 1, 0);
    else
      -[MNNavigationSession _stopGuidance](self, "_stopGuidance");
    -[MNObserverHashTable navigationSession:didEnableGuidancePrompts:](self->_observers, "navigationSession:didEnableGuidancePrompts:", self, v3);
  }
}

- (id)recentLocationHistory
{
  return (id)-[GEOProbeCrumbs recentLocationHistory](self->_probeCrumbs, "recentLocationHistory");
}

- (void)_openTileLoader
{
  NSString *v3;
  NSString *tileLoaderClient;
  void *v5;
  id v6;

  if (!self->_tileLoaderClient)
  {
    GEOTileLoaderClientIdentifier();
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    tileLoaderClient = self->_tileLoaderClient;
    self->_tileLoaderClient = v3;

    objc_msgSend(MEMORY[0x1E0D275D0], "modernLoader");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "openForClient:", self->_tileLoaderClient);

    objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "openServerConnection");

  }
}

- (void)_closeTileLoader
{
  void *v3;
  NSString *tileLoaderClient;
  id v5;

  if (self->_tileLoaderClient)
  {
    objc_msgSend(MEMORY[0x1E0D275D0], "modernLoader");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "closeForClient:", self->_tileLoaderClient);
    objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "closeServerConnection:", 1);

    tileLoaderClient = self->_tileLoaderClient;
    self->_tileLoaderClient = 0;

  }
}

- (id)_locationTrackerForTransportType:(int)a3 navigationType:(int64_t)a4
{
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  __objc2_class *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  NSObject *v15;
  _BYTE v16[24];
  __int128 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  switch(a4)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Attempting to create location tracker before specifying navigation type."));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      GEOFindOrCreateLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        goto LABEL_15;
      *(_DWORD *)v16 = 136316162;
      *(_QWORD *)&v16[4] = "-[MNNavigationSession _locationTrackerForTransportType:navigationType:]";
      *(_WORD *)&v16[12] = 2080;
      *(_QWORD *)&v16[14] = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSession.m";
      *(_WORD *)&v16[22] = 1024;
      LODWORD(v17) = 729;
      WORD2(v17) = 2080;
      *(_QWORD *)((char *)&v17 + 6) = "NO";
      HIWORD(v17) = 2112;
      v18 = v5;
      goto LABEL_14;
    case 1:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot start navigation session with planning type."));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      GEOFindOrCreateLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        goto LABEL_15;
      *(_DWORD *)v16 = 136316162;
      *(_QWORD *)&v16[4] = "-[MNNavigationSession _locationTrackerForTransportType:navigationType:]";
      *(_WORD *)&v16[12] = 2080;
      *(_QWORD *)&v16[14] = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSession.m";
      *(_WORD *)&v16[22] = 1024;
      LODWORD(v17) = 725;
      WORD2(v17) = 2080;
      *(_QWORD *)((char *)&v17 + 6) = "NO";
      HIWORD(v17) = 2112;
      v18 = v5;
      goto LABEL_14;
    case 2:
      -[MNRouteManager currentRoute](self->_routeManager, "currentRoute", *(_QWORD *)&a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "transportType");

      if ((v8 - 2) < 2)
        goto LABEL_9;
      if (v8 == 1)
      {
        v9 = MNTransitLocationTracker;
        goto LABEL_26;
      }
      if (!v8)
      {
LABEL_9:
        v9 = MNSteppingLocationTracker;
LABEL_26:
        v12 = (void *)objc_msgSend([v9 alloc], "initWithNavigationSession:", self);
        goto LABEL_27;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported transport type for stepping navigation."));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      GEOFindOrCreateLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v16 = 136316162;
        *(_QWORD *)&v16[4] = "-[MNNavigationSession _locationTrackerForTransportType:navigationType:]";
        *(_WORD *)&v16[12] = 2080;
        *(_QWORD *)&v16[14] = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSession.m";
        *(_WORD *)&v16[22] = 1024;
        LODWORD(v17) = 689;
        WORD2(v17) = 2080;
        *(_QWORD *)((char *)&v17 + 6) = "NO";
        HIWORD(v17) = 2112;
        v18 = v5;
LABEL_14:
        _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", v16, 0x30u);
      }
LABEL_15:

LABEL_16:
      v12 = 0;
LABEL_27:
      -[MNNavigationSession auditToken](self, "auditToken", *(_QWORD *)&a3, *(_OWORD *)v16, *(_QWORD *)&v16[16], v17, v18);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_setAuditToken:", v13);

      objc_msgSend(v12, "setNavigationCapabilities:", self->_navigationCapabilities);
      if (!v12)
      {
        GEOFindOrCreateLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v16 = 136315906;
          *(_QWORD *)&v16[4] = "-[MNNavigationSession _locationTrackerForTransportType:navigationType:]";
          *(_WORD *)&v16[12] = 2080;
          *(_QWORD *)&v16[14] = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSession.m";
          *(_WORD *)&v16[22] = 1024;
          LODWORD(v17) = 736;
          WORD2(v17) = 2080;
          *(_QWORD *)((char *)&v17 + 6) = "locationTracker != nil";
          _os_log_impl(&dword_1B0AD7000, v15, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", v16, 0x26u);
        }

      }
      return v12;
    case 3:
      -[MNRouteManager currentRoute](self->_routeManager, "currentRoute", *(_QWORD *)&a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "transportType");

      switch(v11)
      {
        case 0:
          v9 = MNDrivingTurnByTurnLocationTracker;
          goto LABEL_26;
        case 1:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Only stepping navigation supported for transit routes."));
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          GEOFindOrCreateLog();
          v6 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
            goto LABEL_15;
          *(_DWORD *)v16 = 136316162;
          *(_QWORD *)&v16[4] = "-[MNNavigationSession _locationTrackerForTransportType:navigationType:]";
          *(_WORD *)&v16[12] = 2080;
          *(_QWORD *)&v16[14] = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSession.m";
          *(_WORD *)&v16[22] = 1024;
          LODWORD(v17) = 710;
          WORD2(v17) = 2080;
          *(_QWORD *)((char *)&v17 + 6) = "NO";
          HIWORD(v17) = 2112;
          v18 = v5;
          break;
        case 2:
          v9 = MNWalkingTurnByTurnLocationTracker;
          goto LABEL_26;
        case 3:
          v9 = MNCyclingTurnByTurnLocationTracker;
          goto LABEL_26;
        default:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported transport type for turn by turn navigation."));
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          GEOFindOrCreateLog();
          v6 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
            goto LABEL_15;
          *(_DWORD *)v16 = 136316162;
          *(_QWORD *)&v16[4] = "-[MNNavigationSession _locationTrackerForTransportType:navigationType:]";
          *(_WORD *)&v16[12] = 2080;
          *(_QWORD *)&v16[14] = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSession.m";
          *(_WORD *)&v16[22] = 1024;
          LODWORD(v17) = 714;
          WORD2(v17) = 2080;
          *(_QWORD *)((char *)&v17 + 6) = "NO";
          HIWORD(v17) = 2112;
          v18 = v5;
          break;
      }
      goto LABEL_14;
    case 4:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Should not attempt to create a location tracker when navigation type is \"SteppingNoTracking\"."));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      GEOFindOrCreateLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        goto LABEL_15;
      *(_DWORD *)v16 = 136316162;
      *(_QWORD *)&v16[4] = "-[MNNavigationSession _locationTrackerForTransportType:navigationType:]";
      *(_WORD *)&v16[12] = 2080;
      *(_QWORD *)&v16[14] = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSession.m";
      *(_WORD *)&v16[22] = 1024;
      LODWORD(v17) = 721;
      WORD2(v17) = 2080;
      *(_QWORD *)((char *)&v17 + 6) = "NO";
      HIWORD(v17) = 2112;
      v18 = v5;
      goto LABEL_14;
    default:
      goto LABEL_16;
  }
}

- (void)_startLocationTrackingWithInitialLocation:(id)a3 targetLegIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  MNLocationTracker *v9;
  MNLocationTracker *locationTracker;
  void *v11;
  _QWORD v12[5];

  v6 = a3;
  -[MNNavigationSession routeManager](self, "routeManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentRoute");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNNavigationSession _locationTrackerForTransportType:navigationType:](self, "_locationTrackerForTransportType:navigationType:", objc_msgSend(v8, "transportType"), self->_navigationType);
  v9 = (MNLocationTracker *)objc_claimAutoreleasedReturnValue();
  locationTracker = self->_locationTracker;
  self->_locationTracker = v9;

  -[MNLocationTracker setDelegate:](self->_locationTracker, "setDelegate:", self);
  -[MNLocationTracker setNavigationSessionState:](self->_locationTracker, "setNavigationSessionState:", self->_navigationSessionState);
  -[NSMutableArray addObject:](self->_navigationSessionStateListeners, "addObject:", self->_locationTracker);
  -[MNLocationTracker startTrackingWithInitialLocation:targetLegIndex:](self->_locationTracker, "startTrackingWithInitialLocation:targetLegIndex:", v6, a4);
  -[MNNavigationSessionState setLocation:](self->_navigationSessionState, "setLocation:", v6);

  -[MNNavigationSession _updateNavigationSessionState:](self, "_updateNavigationSessionState:", self->_navigationSessionState);
  +[MNLocationManager sharedLocationManager](MNLocationManager, "sharedLocationManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __80__MNNavigationSession__startLocationTrackingWithInitialLocation_targetLegIndex___block_invoke;
  v12[3] = &unk_1E61D7E30;
  v12[4] = self;
  objc_msgSend(v11, "setLocationCorrector:", v12);

}

uint64_t __80__MNNavigationSession__startLocationTrackingWithInitialLocation_targetLegIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "matchedLocationForLocation:", a2);
}

- (void)_stopLocationTracking
{
  MNLocationTracker *locationTracker;
  id v4;

  +[MNLocationManager sharedLocationManager](MNLocationManager, "sharedLocationManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocationCorrector:", 0);
  -[MNLocationTracker stopTracking](self->_locationTracker, "stopTracking");
  -[MNLocationTracker setDelegate:](self->_locationTracker, "setDelegate:", 0);
  locationTracker = self->_locationTracker;
  self->_locationTracker = 0;

}

- (void)_startLocationUpdates
{
  id v3;

  +[MNLocationManager sharedLocationManager](MNLocationManager, "sharedLocationManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addLocationListener:", self);
  if (objc_msgSend(v3, "isHeadingServicesAvailable"))
    objc_msgSend(v3, "startHeadingUpdateWithObserver:", self);

}

- (void)_stopLocationUpdates
{
  id v3;

  +[MNLocationManager sharedLocationManager](MNLocationManager, "sharedLocationManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeLocationListener:", self);
  objc_msgSend(v3, "stopHeadingUpdateWithObserver:", self);

}

- (void)_startMotionUpdates
{
  void *v3;
  MNCoreMotionContextProvider *v4;
  void *v5;
  GEOMotionContext *v6;
  GEOMotionContext *motionContext;
  MNNavigationTraceManager *v8;

  -[MNNavigationTraceManager tracePlayer](self->_traceManager, "tracePlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v8 = self->_traceManager;
  }
  else
  {
    v4 = [MNCoreMotionContextProvider alloc];
    -[MNNavigationTraceManager traceRecorder](self->_traceManager, "traceRecorder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[MNCoreMotionContextProvider initWithTraceRecorder:](v4, "initWithTraceRecorder:", v5);

  }
  v6 = (GEOMotionContext *)objc_alloc_init(MEMORY[0x1E0D27240]);
  motionContext = self->_motionContext;
  self->_motionContext = v6;

  -[GEOMotionContext setDelegate:](self->_motionContext, "setDelegate:", self);
  -[GEOMotionContext startMotionUpdatesWithProvider:](self->_motionContext, "startMotionUpdatesWithProvider:", v8);

}

- (void)_stopMotionUpdates
{
  GEOMotionContext *motionContext;

  -[GEOMotionContext stopMotionUpdates](self->_motionContext, "stopMotionUpdates");
  -[GEOMotionContext setDelegate:](self->_motionContext, "setDelegate:", 0);
  motionContext = self->_motionContext;
  self->_motionContext = 0;

}

- (void)_startAudioSessionWithGuidanceLevelOverride:(unint64_t)a3
{
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  MNAudioManager *v9;
  void *v10;
  void *v11;
  MNAudioManager *v12;
  MNAudioManager *audioManager;
  MNNavigationServiceCallback_DidChangeVoiceGuidanceLevel *v14;

  objc_msgSend(MEMORY[0x1E0D27008], "sharedConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "currentCountrySupportsNavigation");

  if (v6)
  {
    -[MNRouteManager currentRoute](self->_routeManager, "currentRoute");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "transportType");

    v9 = [MNAudioManager alloc];
    -[MNRouteManager routeAttributes](self->_routeManager, "routeAttributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "phoneticLocaleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[MNAudioManager initWithTransportType:voiceLanguage:guidanceLevelOverride:](v9, "initWithTransportType:voiceLanguage:guidanceLevelOverride:", v8, v11, a3);
    audioManager = self->_audioManager;
    self->_audioManager = v12;

    -[MNAudioManager registerObserver:](self->_audioManager, "registerObserver:", self);
    v14 = objc_alloc_init(MNNavigationServiceCallback_DidChangeVoiceGuidanceLevel);
    -[MNNavigationServiceCallback_DidChangeVoiceGuidanceLevel setVoiceGuidanceLevel:](v14, "setVoiceGuidanceLevel:", -[MNAudioManager voiceGuidanceLevel](self->_audioManager, "voiceGuidanceLevel"));
    -[MNObserverHashTable navigationSession:didSendNavigationServiceCallback:](self->_observers, "navigationSession:didSendNavigationServiceCallback:", self, v14);

  }
}

- (void)_stopAudioSession
{
  MNAudioManager *audioManager;

  -[MNAudioManager forceDeactivate](self->_audioManager, "forceDeactivate");
  audioManager = self->_audioManager;
  self->_audioManager = 0;

}

- (void)_startGuidanceAllowMidRouteStart:(BOOL)a3 announcementsToIgnore:(id)a4
{
  _BOOL8 v4;
  MNGuidanceManager *guidanceManager;
  MNGuidanceManager *v7;
  MNGuidanceManager *v8;
  id v9;

  v4 = a3;
  v9 = a4;
  -[MNNavigationSession _stopGuidance](self, "_stopGuidance");
  guidanceManager = self->_guidanceManager;
  if (guidanceManager)
  {
    -[MNGuidanceManager reset](guidanceManager, "reset");
  }
  else
  {
    v7 = -[MNGuidanceManager initWithNavigationSessionState:audioManager:isReconnecting:announcementsToIgnore:]([MNGuidanceManager alloc], "initWithNavigationSessionState:audioManager:isReconnecting:announcementsToIgnore:", self->_navigationSessionState, self->_audioManager, v4, v9);
    v8 = self->_guidanceManager;
    self->_guidanceManager = v7;

    -[MNGuidanceManager setDelegate:](self->_guidanceManager, "setDelegate:", self);
    -[MNGuidanceManager setNavigationSessionState:](self->_guidanceManager, "setNavigationSessionState:", self->_navigationSessionState);
    -[NSMutableArray addObject:](self->_navigationSessionStateListeners, "addObject:", self->_guidanceManager);
  }

}

- (void)_stopGuidance
{
  -[MNGuidanceManager stop](self->_guidanceManager, "stop");
}

- (void)_startTravelTimeUpdates
{
  MNTimeAndDistanceUpdater *v3;
  MNTimeAndDistanceUpdater *timeAndDistanceUpdater;
  MNTimeAndDistanceUpdater *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = -[MNTimeAndDistanceUpdater initWithNavigationSessionState:]([MNTimeAndDistanceUpdater alloc], "initWithNavigationSessionState:", self->_navigationSessionState);
  timeAndDistanceUpdater = self->_timeAndDistanceUpdater;
  self->_timeAndDistanceUpdater = v3;

  -[MNTimeAndDistanceUpdater setDelegate:](self->_timeAndDistanceUpdater, "setDelegate:", self);
  -[MNTimeAndDistanceUpdater setNavigationSessionState:](self->_timeAndDistanceUpdater, "setNavigationSessionState:", self->_navigationSessionState);
  -[NSMutableArray addObject:](self->_navigationSessionStateListeners, "addObject:", self->_timeAndDistanceUpdater);
  v5 = self->_timeAndDistanceUpdater;
  -[MNRouteManager allRoutes](self->_routeManager, "allRoutes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNRouteManager currentRouteInfo](self->_routeManager, "currentRouteInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNLocationTracker lastMatchedLocation](self->_locationTracker, "lastMatchedLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNTimeAndDistanceUpdater setRoutes:mainRoute:location:notificationType:](v5, "setRoutes:mainRoute:location:notificationType:", v6, v7, v8, 2);

  -[MNTimeAndDistanceUpdater startUpdating](self->_timeAndDistanceUpdater, "startUpdating");
}

- (void)_stopTravelTimeUpdates
{
  MNTimeAndDistanceUpdater *timeAndDistanceUpdater;

  -[MNTimeAndDistanceUpdater setDelegate:](self->_timeAndDistanceUpdater, "setDelegate:", 0);
  -[MNTimeAndDistanceUpdater stopUpdating](self->_timeAndDistanceUpdater, "stopUpdating");
  timeAndDistanceUpdater = self->_timeAndDistanceUpdater;
  self->_timeAndDistanceUpdater = 0;

}

- (void)_startIdleTimerUpdates
{
  MNIdleTimerUpdater *v3;
  MNIdleTimerUpdater *idleTimerUpdater;

  v3 = objc_alloc_init(MNIdleTimerUpdater);
  idleTimerUpdater = self->_idleTimerUpdater;
  self->_idleTimerUpdater = v3;

  -[MNIdleTimerUpdater setDelegate:](self->_idleTimerUpdater, "setDelegate:", self);
  -[MNIdleTimerUpdater setNavigationSessionState:](self->_idleTimerUpdater, "setNavigationSessionState:", self->_navigationSessionState);
  -[NSMutableArray addObject:](self->_navigationSessionStateListeners, "addObject:", self->_idleTimerUpdater);
  -[MNIdleTimerUpdater updateForStartNavigation](self->_idleTimerUpdater, "updateForStartNavigation");
}

- (void)_stopIdleTimerUpdates
{
  MNIdleTimerUpdater *idleTimerUpdater;

  -[MNIdleTimerUpdater setDelegate:](self->_idleTimerUpdater, "setDelegate:", 0);
  idleTimerUpdater = self->_idleTimerUpdater;
  self->_idleTimerUpdater = 0;

}

- (void)_updateResumeRouteInfoFrom:(id)a3
{
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  MNObserverHashTable *observers;
  void *v11;
  id v12;

  if (self->_serverSessionStateInfo)
  {
    -[MNLocationTracker arrivalInfo](self->_locationTracker, "arrivalInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isInArrivalState"))
    {
      v6 = -[MNNavigationSessionState isOnLastLeg](self->_navigationSessionState, "isOnLastLeg");

      if (v6)
      {
LABEL_6:
        v12 = objc_alloc_init(MEMORY[0x1E0D27448]);
        -[MNServerSessionStateInfo sessionState](self->_serverSessionStateInfo, "sessionState");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setServerSessionState:", v7);

        -[MNRouteManager currentRoute](self->_routeManager, "currentRoute");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "geoOriginalWaypointRouteFromRouteCoordinate:purpose:", a3, 6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setRouteGeometry:", v9);

        objc_msgSend(v12, "setHasVisitedFirstStop:", -[MNLocationTracker hasVisitedFirstStop](self->_locationTracker, "hasVisitedFirstStop"));
        observers = self->_observers;
        +[MNNavigationServiceCallback_DidUpdateResumeRouteHandle didUpdateResumeRouteHandle:](MNNavigationServiceCallback_DidUpdateResumeRouteHandle, "didUpdateResumeRouteHandle:", v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[MNObserverHashTable navigationSession:didSendNavigationServiceCallback:](observers, "navigationSession:didSendNavigationServiceCallback:", self, v11);

        return;
      }
      -[MNNavigationSessionState nextLeg](self->_navigationSessionState, "nextLeg");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      a3 = ($212C09783140BCCD23384160D545CE0D)objc_msgSend(v5, "startRouteCoordinate");
    }

    goto LABEL_6;
  }
}

- (void)_updateNavigationSessionState:(id)a3
{
  id v4;
  NSMutableArray *v5;
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
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_navigationSessionStateListeners;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setNavigationSessionState:", v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_startVirtualGarageUpdates
{
  id v3;

  +[MNVirtualGarageManager sharedManager](MNVirtualGarageManager, "sharedManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerObserver:", self);

}

- (void)_stopVirtualGarageUpdates
{
  id v3;

  +[MNVirtualGarageManager sharedManager](MNVirtualGarageManager, "sharedManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

}

- (void)motionContextDidUpdateMotion:(id)a3
{
  MNObserverHashTable *observers;
  id v5;
  uint64_t v6;
  uint64_t v7;

  observers = self->_observers;
  v5 = a3;
  v6 = objc_msgSend(v5, "motionType");
  v7 = objc_msgSend(v5, "confidence");

  -[MNObserverHashTable navigationSession:didUpdateMotionType:confidence:](observers, "navigationSession:didUpdateMotionType:confidence:", self, v6, v7);
}

- (void)locationTracker:(id)a3 didChangeState:(int)a4
{
  uint64_t v4;

  v4 = *(_QWORD *)&a4;
  -[MNNavigationSessionState setNavigationState:](self->_navigationSessionState, "setNavigationState:", *(_QWORD *)&a4);
  -[MNObserverHashTable navigationSession:didChangeNavigationState:](self->_observers, "navigationSession:didChangeNavigationState:", self, v4);
}

- (void)locationTracker:(id)a3 didUpdateArrivalInfo:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;

  v9 = a4;
  -[MNNavigationSessionState setArrivalState:](self->_navigationSessionState, "setArrivalState:", objc_msgSend(v9, "arrivalState"));
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setArrivalInfo:", v9);
  -[MNObserverHashTable navigationSession:didSendNavigationServiceCallback:](self->_observers, "navigationSession:didSendNavigationServiceCallback:", self, v5);
  -[MNRouteManager currentRoute](self->_routeManager, "currentRoute");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "legs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v7, "count") < 2)
    goto LABEL_4;
  v8 = objc_msgSend(v9, "isInArrivalState");

  if (v8)
  {
    -[MNNavigationSession lastMatchedLocation](self, "lastMatchedLocation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "routeMatch");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNNavigationSession _updateResumeRouteInfoFrom:](self, "_updateResumeRouteInfoFrom:", objc_msgSend(v7, "routeCoordinate"));
LABEL_4:

  }
}

- (void)locationTracker:(id)a3 isApproachingEndOfLeg:(unint64_t)a4
{
  -[MNObserverHashTable navigationSession:isApproachingEndOfLeg:](self->_observers, "navigationSession:isApproachingEndOfLeg:", self, a4);
}

- (void)locationTracker:(id)a3 didEnterPreArrivalStateForWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  MNGuidanceManager *guidanceManager;
  id v8;

  guidanceManager = self->_guidanceManager;
  v8 = a4;
  -[MNGuidanceManager setIsInPreArrivalState:](guidanceManager, "setIsInPreArrivalState:", 1);
  -[MNObserverHashTable navigationSession:didEnterPreArrivalStateForWaypoint:endOfLegIndex:](self->_observers, "navigationSession:didEnterPreArrivalStateForWaypoint:endOfLegIndex:", self, v8, a5);

}

- (void)locationTracker:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  -[MNObserverHashTable navigationSession:didArriveAtWaypoint:endOfLegIndex:](self->_observers, "navigationSession:didArriveAtWaypoint:endOfLegIndex:", self, a4, a5);
}

- (void)locationTracker:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6
{
  MNIdleTimerUpdater *idleTimerUpdater;
  MNGuidanceManager *guidanceManager;
  void *v11;
  id v12;

  idleTimerUpdater = self->_idleTimerUpdater;
  v12 = a4;
  -[MNIdleTimerUpdater updateForStartNavigation](idleTimerUpdater, "updateForStartNavigation");
  -[MNGuidanceManager setShouldShowChargingInfo:](self->_guidanceManager, "setShouldShowChargingInfo:", 0);
  -[MNGuidanceManager setIsInPreArrivalState:](self->_guidanceManager, "setIsInPreArrivalState:", 0);
  guidanceManager = self->_guidanceManager;
  -[MNLocationTracker lastMatchedLocation](self->_locationTracker, "lastMatchedLocation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNGuidanceManager updateGuidanceForLocation:navigatorState:](guidanceManager, "updateGuidanceForLocation:navigatorState:", v11, -[MNNavigationSession navigationState](self, "navigationState"));

  -[MNObserverHashTable navigationSession:didResumeNavigatingFromWaypoint:endOfLegIndex:reason:](self->_observers, "navigationSession:didResumeNavigatingFromWaypoint:endOfLegIndex:reason:", self, v12, a5, a6);
}

- (void)locationTracker:(id)a3 didUpdateTargetLegIndex:(unint64_t)a4
{
  _TtC10Navigation51MNNavigationServiceCallback_DidUpdateTargetLegIndex *v6;

  -[MNNavigationSessionState setTargetLegIndex:](self->_navigationSessionState, "setTargetLegIndex:", a4);
  -[MNNavigationSession _updateNavigationSessionState:](self, "_updateNavigationSessionState:", self->_navigationSessionState);
  v6 = -[MNNavigationServiceCallback_DidUpdateTargetLegIndex initWithTargetLegIndex:]([_TtC10Navigation51MNNavigationServiceCallback_DidUpdateTargetLegIndex alloc], "initWithTargetLegIndex:", a4);
  -[MNObserverHashTable navigationSession:didSendNavigationServiceCallback:](self->_observers, "navigationSession:didSendNavigationServiceCallback:", self, v6);
  -[MNObserverHashTable navigationSession:didUpdateTargetLegIndex:](self->_observers, "navigationSession:didUpdateTargetLegIndex:", self, a4);

}

- (void)locationTrackerDidEnterPreArrivalState:(id)a3
{
  -[MNGuidanceManager setIsInPreArrivalState:](self->_guidanceManager, "setIsInPreArrivalState:", 1);
  -[MNObserverHashTable navigationSessionDidEnterPreArrivalState:](self->_observers, "navigationSessionDidEnterPreArrivalState:", self);
}

- (void)locationTrackerDidArrive:(id)a3
{
  MNObserverHashTable *observers;
  id v5;
  MNGuidanceManager *guidanceManager;
  void *v7;
  dispatch_time_t v8;
  _QWORD block[5];

  observers = self->_observers;
  v5 = a3;
  -[MNObserverHashTable navigationSessionDidArrive:](observers, "navigationSessionDidArrive:", self);
  guidanceManager = self->_guidanceManager;
  objc_msgSend(v5, "lastMatchedLocation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[MNGuidanceManager updateGuidanceForLocation:navigatorState:](guidanceManager, "updateGuidanceForLocation:navigatorState:", v7, -[MNNavigationSession navigationState](self, "navigationState"));
  if (GEOConfigGetBOOL())
  {
    v8 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__MNNavigationSession_locationTrackerDidArrive___block_invoke;
    block[3] = &unk_1E61D23C8;
    block[4] = self;
    dispatch_after(v8, MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __48__MNNavigationSession_locationTrackerDidArrive___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "navigationSession:shouldEndWithReason:", *(_QWORD *)(a1 + 32), 8);
}

- (void)locationTracker:(id)a3 didEndNavigatingWithReason:(unint64_t)a4
{
  -[MNObserverHashTable navigationSession:shouldEndWithReason:](self->_observers, "navigationSession:shouldEndWithReason:", self, a4);
}

- (void)locationTracker:(id)a3 didUpdateMatchedLocation:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  char *v9;
  unint64_t navigationCapabilities;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  int64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  _TtC10Navigation61MNNavigationServiceCallback_DidUpdateUpcomingAnchorPointIndex *v33;
  GEOProbeCrumbs *probeCrumbs;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  uint64_t v40;
  void *v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  int v49;
  const char *v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  int v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  MNGetPuckTrackingLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v7, "uuid");
    v9 = (char *)objc_claimAutoreleasedReturnValue();
    v49 = 138412290;
    v50 = v9;
    _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_INFO, "[MN] [%@] - Processing - in MNNavigationSession::locationTracker:didUpdateMatchedLocation:", (uint8_t *)&v49, 0xCu);

  }
  if (v7)
  {
    navigationCapabilities = self->_navigationCapabilities;
    v11 = v7;
    v12 = v11;
    v13 = v11;
    if ((navigationCapabilities & 4) != 0)
    {
      v13 = v11;
      if ((objc_msgSend(v11, "locationUnreliable") & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "timestamp");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timeIntervalSinceDate:", v15);
        v17 = v16;

        v18 = 1.0;
        if (v17 <= 1.0)
          v18 = v17;
        objc_msgSend(v12, "propagatedLocationForTimeInterval:shouldProjectAlongRoute:", objc_msgSend(v6, "shouldProjectAlongRoute"), v18 + self->_locationProjectionTime);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = objc_msgSend(v12, "stepIndex");
        if (v19 != objc_msgSend(v13, "stepIndex"))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Propagating location shouldn't change step index"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          GEOFindOrCreateLog();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            v49 = 136316162;
            v50 = "-[MNNavigationSession locationTracker:didUpdateMatchedLocation:]";
            v51 = 2080;
            v52 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSession.m";
            v53 = 1024;
            v54 = 1019;
            v55 = 2080;
            v56 = "matchedLocation.stepIndex == propagatedLocation.stepIndex";
            v57 = 2112;
            v58 = v47;
            _os_log_impl(&dword_1B0AD7000, v48, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v49, 0x30u);
          }

        }
      }
    }
    -[MNObserverHashTable navigationSession:didUpdateMatchedLocation:](self->_observers, "navigationSession:didUpdateMatchedLocation:", self, v13);
    -[MNRouteManager currentRoute](self->_routeManager, "currentRoute");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNNavigationSessionState location](self->_navigationSessionState, "location");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "stepIndex");

    v23 = objc_msgSend(v12, "stepIndex");
    if (v22 != v23)
    {
      v24 = v23;
      objc_msgSend(v12, "routeMatch");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "segmentIndex");

      -[MNObserverHashTable navigationSession:matchedToStepIndex:segmentIndex:](self->_observers, "navigationSession:matchedToStepIndex:segmentIndex:", self, v24, v26);
      if (v24 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v20, "stepAtIndex:", v24);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "firstNameOrBranch");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        -[MNObserverHashTable navigationSession:didUpdateStepNameInfo:](self->_observers, "navigationSession:didUpdateStepNameInfo:", self, v28);
      }
    }
    if (objc_msgSend(v12, "state") == 1)
    {
      v29 = -[MNNavigationSessionState upcomingAnchorPointIndex](self->_navigationSessionState, "upcomingAnchorPointIndex");
      objc_msgSend(v20, "anchorPoints");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "routeMatch");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v30, "nextAnchorPointIndexAfter:", objc_msgSend(v31, "routeCoordinate"));

      if (v29 != v32)
      {
        -[MNNavigationSessionState setUpcomingAnchorPointIndex:](self->_navigationSessionState, "setUpcomingAnchorPointIndex:", v32);
        v33 = -[MNNavigationServiceCallback_DidUpdateUpcomingAnchorPointIndex initWithAnchorPointIndex:]([_TtC10Navigation61MNNavigationServiceCallback_DidUpdateUpcomingAnchorPointIndex alloc], "initWithAnchorPointIndex:", v32);
        -[MNObserverHashTable navigationSession:didSendNavigationServiceCallback:](self->_observers, "navigationSession:didSendNavigationServiceCallback:", self, v33);

      }
    }
    -[MNNavigationSessionState setLocation:](self->_navigationSessionState, "setLocation:", v12);
    if (objc_msgSend(v12, "state") == 1)
      -[MNNavigationSessionState setHasBeenOnRouteOnce:](self->_navigationSessionState, "setHasBeenOnRouteOnce:", 1);
    -[MNNavigationSession _updateNavigationSessionState:](self, "_updateNavigationSessionState:", self->_navigationSessionState);
    -[MNTraceNavigationEventRecorder setLastMatchedLocation:](self->_navigationEventRecorder, "setLastMatchedLocation:", v12);
    -[MNTimeAndDistanceUpdater setLocation:notificationType:](self->_timeAndDistanceUpdater, "setLocation:notificationType:", v12, 1);
    -[MNLocationTracker updateLocation:](self->_locationTracker, "updateLocation:", v12);
    probeCrumbs = self->_probeCrumbs;
    objc_msgSend(v12, "rawCoordinate");
    v36 = v35;
    v38 = v37;
    objc_msgSend(v12, "routeMatch");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "routeCoordinate");
    objc_msgSend(v12, "timestamp");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "timeIntervalSinceReferenceDate");
    -[GEOProbeCrumbs addLocation:polyCoordinate:timestamp:](probeCrumbs, "addLocation:polyCoordinate:timestamp:", v40, (unint64_t)v42, v36, v38);

    objc_msgSend(v12, "routeMatch");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "route");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNNavigationSession routeManager](self, "routeManager");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "currentRoute");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44 == v46)
      -[MNGuidanceManager updateGuidanceForLocation:navigatorState:](self->_guidanceManager, "updateGuidanceForLocation:navigatorState:", v12, objc_msgSend(v6, "state"));
    -[MNObserverHashTable navigationSessionDidFinishLocationUpdate:](self->_observers, "navigationSessionDidFinishLocationUpdate:", self);

  }
}

- (void)locationTracker:(id)a3 didUpdateETAForRoute:(id)a4
{
  MNTimeAndDistanceUpdater *timeAndDistanceUpdater;
  id v6;

  timeAndDistanceUpdater = self->_timeAndDistanceUpdater;
  v6 = a4;
  -[MNTimeAndDistanceUpdater updateDisplayETAForRoute:notificationType:](timeAndDistanceUpdater, "updateDisplayETAForRoute:notificationType:", v6, 1);
  -[MNObserverHashTable navigationSession:didUpdateETAResponseForRoute:](self->_observers, "navigationSession:didUpdateETAResponseForRoute:", self, v6);

}

- (void)locationTracker:(id)a3 didReachETAUpdatePosition:(id)a4
{
  -[MNObserverHashTable navigationSession:didReachETAUpdatePosition:](self->_observers, "navigationSession:didReachETAUpdatePosition:", self, a4);
}

- (void)locationTrackerWillReroute:(id)a3
{
  -[MNObserverHashTable navigationSessionWillReroute:](self->_observers, "navigationSessionWillReroute:", self);
}

- (void)locationTracker:(id)a3 didSuppressReroute:(id)a4
{
  -[MNObserverHashTable navigationSession:didSuppressReroute:](self->_observers, "navigationSession:didSuppressReroute:", self, a4);
}

- (void)locationTrackerDidCancelReroute:(id)a3
{
  -[MNObserverHashTable navigationSessionDidCancelReroute:](self->_observers, "navigationSessionDidCancelReroute:", self);
}

- (void)locationTracker:(id)a3 didReroute:(id)a4 newAlternateRoutes:(id)a5 rerouteReason:(unint64_t)a6 request:(id)a7 response:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  MNTimeAndDistanceUpdater *timeAndDistanceUpdater;
  void *v25;
  void *v26;
  MNServerSessionStateInfo *serverSessionStateInfo;
  void *v28;
  void *v29;
  GEOProbeCrumbs *probeCrumbs;
  void *v31;
  id v32;
  uint8_t buf[4];
  const __CFString *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  if (a6 != 2)
    -[MNAudioManager clearAllAnnouncements](self->_audioManager, "clearAllAnnouncements");
  -[MNRouteManager updateForReroute:rerouteReason:request:response:](self->_routeManager, "updateForReroute:rerouteReason:request:response:", v14, a6, v16, v17);
  -[MNRouteManager updateWithAlternateRoutes:](self->_routeManager, "updateWithAlternateRoutes:", v15);
  -[MNNavigationSessionState updateCurrentRouteInfo:rerouteReason:](self->_navigationSessionState, "updateCurrentRouteInfo:rerouteReason:", v14, a6);
  -[MNNavigationSessionState setAlternateRouteInfos:](self->_navigationSessionState, "setAlternateRouteInfos:", v15);
  -[MNNavigationSession _updateNavigationSessionState:](self, "_updateNavigationSessionState:", self->_navigationSessionState);
  if (a6 == 12)
  {
    MNGetMNNavigationSessionLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v14, "route");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "source");
      if ((unint64_t)(v20 - 1) > 4)
        v21 = CFSTR("Unknown");
      else
        v21 = off_1E61D7E50[v20 - 1];
      *(_DWORD *)buf = 138412290;
      v34 = v21;
      _os_log_impl(&dword_1B0AD7000, v18, OS_LOG_TYPE_DEFAULT, "Updating initial route source to \"%@\".", buf, 0xCu);

    }
    objc_msgSend(v14, "route");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNNavigationSessionState setInitialRouteSource:](self->_navigationSessionState, "setInitialRouteSource:", objc_msgSend(v22, "source"));

  }
  -[MNLocationTracker lastMatchedLocation](self->_locationTracker, "lastMatchedLocation");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNGuidanceManager updateSessionStateForReroute:reason:location:](self->_guidanceManager, "updateSessionStateForReroute:reason:location:", self->_navigationSessionState, a6, v23);
  timeAndDistanceUpdater = self->_timeAndDistanceUpdater;
  -[MNRouteManager allRoutes](self->_routeManager, "allRoutes");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNRouteManager currentRouteInfo](self->_routeManager, "currentRouteInfo");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNTimeAndDistanceUpdater setRoutes:mainRoute:location:notificationType:](timeAndDistanceUpdater, "setRoutes:mainRoute:location:notificationType:", v25, v26, v23, 0);

  -[MNObserverHashTable navigationSession:didReroute:withLocation:withAlternateRoutes:rerouteReason:](self->_observers, "navigationSession:didReroute:withLocation:withAlternateRoutes:rerouteReason:", self, v14, v23, v15, a6);
  -[MNGuidanceManager updateGuidanceForLocation:navigatorState:](self->_guidanceManager, "updateGuidanceForLocation:navigatorState:", v23, objc_msgSend(v32, "state"));
  serverSessionStateInfo = self->_serverSessionStateInfo;
  objc_msgSend(v14, "route");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNServerSessionStateInfo updateWithRoute:](serverSessionStateInfo, "updateWithRoute:", v28);

  objc_msgSend(v23, "routeMatch");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNNavigationSession _updateResumeRouteInfoFrom:](self, "_updateResumeRouteInfoFrom:", objc_msgSend(v29, "routeCoordinate"));

  probeCrumbs = self->_probeCrumbs;
  objc_msgSend(v14, "route");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOProbeCrumbs resetStateWithRoute:](probeCrumbs, "resetStateWithRoute:", v31);

}

- (void)locationTracker:(id)a3 didFailRerouteWithError:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[MNObserverHashTable navigationSession:didFailRerouteWithError:](self->_observers, "navigationSession:didFailRerouteWithError:", self, v6);
  if (v6)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setError:", v6);
    -[MNObserverHashTable navigationSession:didSendNavigationServiceCallback:](self->_observers, "navigationSession:didSendNavigationServiceCallback:", self, v5);

  }
}

- (void)locationTracker:(id)a3 didUpdateAlternateRoutes:(id)a4
{
  MNRouteManager *routeManager;
  MNTimeAndDistanceUpdater *timeAndDistanceUpdater;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  routeManager = self->_routeManager;
  v10 = a4;
  -[MNRouteManager updateWithAlternateRoutes:](routeManager, "updateWithAlternateRoutes:", v10);
  -[MNNavigationSessionState setAlternateRouteInfos:](self->_navigationSessionState, "setAlternateRouteInfos:", v10);
  -[MNNavigationSession _updateNavigationSessionState:](self, "_updateNavigationSessionState:", self->_navigationSessionState);
  timeAndDistanceUpdater = self->_timeAndDistanceUpdater;
  -[MNRouteManager allRoutes](self->_routeManager, "allRoutes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNRouteManager currentRouteInfo](self->_routeManager, "currentRouteInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNLocationTracker lastMatchedLocation](self->_locationTracker, "lastMatchedLocation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNTimeAndDistanceUpdater setRoutes:mainRoute:location:notificationType:](timeAndDistanceUpdater, "setRoutes:mainRoute:location:notificationType:", v7, v8, v9, 0);

  -[MNObserverHashTable navigationSession:didUpdateAlternateRoutes:](self->_observers, "navigationSession:didUpdateAlternateRoutes:", self, v10);
}

- (void)locationTracker:(id)a3 didSwitchToNewTransportTypeWithRoute:(id)a4 rerouteReason:(unint64_t)a5 request:(id)a6 response:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  const __CFString *v19;
  void *v20;
  MNTimeAndDistanceUpdater *timeAndDistanceUpdater;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  MNAudioManager *audioManager;
  void *v27;
  uint64_t v28;
  MNServerSessionStateInfo *serverSessionStateInfo;
  void *v30;
  GEOProbeCrumbs *probeCrumbs;
  void *v32;
  int v33;
  const __CFString *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a7;
  v13 = a6;
  objc_msgSend(v11, "route");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "transportType");

  -[MNRouteManager updateForReroute:rerouteReason:request:response:](self->_routeManager, "updateForReroute:rerouteReason:request:response:", v11, a5, v13, v12);
  -[MNRouteManager updateWithAlternateRoutes:](self->_routeManager, "updateWithAlternateRoutes:", 0);
  -[MNNavigationSessionState updateCurrentRouteInfo:rerouteReason:](self->_navigationSessionState, "updateCurrentRouteInfo:rerouteReason:", v11, a5);
  -[MNNavigationSessionState setAlternateRouteInfos:](self->_navigationSessionState, "setAlternateRouteInfos:", 0);
  if (a5 == 12)
  {
    MNGetMNNavigationSessionLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "route");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "source");
      if ((unint64_t)(v18 - 1) > 4)
        v19 = CFSTR("Unknown");
      else
        v19 = off_1E61D7E50[v18 - 1];
      v33 = 138412290;
      v34 = v19;
      _os_log_impl(&dword_1B0AD7000, v16, OS_LOG_TYPE_DEFAULT, "Updating initial route source to \"%@\".", (uint8_t *)&v33, 0xCu);

    }
    objc_msgSend(v11, "route");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNNavigationSessionState setInitialRouteSource:](self->_navigationSessionState, "setInitialRouteSource:", objc_msgSend(v20, "source"));

  }
  -[MNNavigationSession _updateNavigationSessionState:](self, "_updateNavigationSessionState:", self->_navigationSessionState);
  timeAndDistanceUpdater = self->_timeAndDistanceUpdater;
  -[MNRouteManager allRoutes](self->_routeManager, "allRoutes");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNRouteManager currentRouteInfo](self->_routeManager, "currentRouteInfo");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNLocationTracker lastMatchedLocation](self->_locationTracker, "lastMatchedLocation");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNTimeAndDistanceUpdater setRoutes:mainRoute:location:notificationType:](timeAndDistanceUpdater, "setRoutes:mainRoute:location:notificationType:", v22, v23, v24, 0);

  -[MNNavigationSession _stopLocationTracking](self, "_stopLocationTracking");
  -[MNAudioManager clearAllAnnouncements](self->_audioManager, "clearAllAnnouncements");
  if (!(_DWORD)v15)
  {
    _MNStringFromSpokenLocalization(CFSTR("Navigation_SwitchToDrivingNotification"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    audioManager = self->_audioManager;
    v27 = v25;
    v28 = 0;
    goto LABEL_12;
  }
  if ((_DWORD)v15 == 2)
  {
    _MNStringFromSpokenLocalization(CFSTR("Navigation_SwitchToWalkingNotification"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    audioManager = self->_audioManager;
    v27 = v25;
    v28 = 5;
LABEL_12:
    -[MNAudioManager requestSpeech:guidanceLevel:modifier:shortPromptType:completionHandler:](audioManager, "requestSpeech:guidanceLevel:modifier:shortPromptType:completionHandler:", v27, 2, 0, v28, 0);

  }
  -[MNObserverHashTable navigationSession:didSwitchToNewTransportType:newRoute:rerouteReason:](self->_observers, "navigationSession:didSwitchToNewTransportType:newRoute:rerouteReason:", self, v15, v11, a5);
  -[MNNavigationSession _startLocationTrackingWithInitialLocation:targetLegIndex:](self, "_startLocationTrackingWithInitialLocation:targetLegIndex:", 0, 0);
  serverSessionStateInfo = self->_serverSessionStateInfo;
  objc_msgSend(v11, "route");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNServerSessionStateInfo updateWithRoute:](serverSessionStateInfo, "updateWithRoute:", v30);

  -[MNNavigationSession _updateResumeRouteInfoFrom:](self, "_updateResumeRouteInfoFrom:", *MEMORY[0x1E0D26AA8]);
  -[MNGuidanceManager updateSessionStateForReroute:reason:location:](self->_guidanceManager, "updateSessionStateForReroute:reason:location:", self->_navigationSessionState, 5, 0);
  -[MNAudioManager changeTransportType:](self->_audioManager, "changeTransportType:", v15);
  probeCrumbs = self->_probeCrumbs;
  objc_msgSend(v11, "route");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOProbeCrumbs resetStateWithRoute:](probeCrumbs, "resetStateWithRoute:", v32);

  -[MNNavigationSession _startGuidanceAllowMidRouteStart:announcementsToIgnore:](self, "_startGuidanceAllowMidRouteStart:announcementsToIgnore:", 1, 0);
}

- (void)locationTracker:(id)a3 didUpdateBackgroundWalkingRoute:(id)a4
{
  -[MNObserverHashTable navigationSession:didUpdateBackgroundWalkingRoute:](self->_observers, "navigationSession:didUpdateBackgroundWalkingRoute:", self, a4);
}

- (void)locationTracker:(id)a3 didUpdateVehicleParkingInfo:(id)a4
{
  -[MNObserverHashTable navigationSession:didUpdateVehicleParkingInfo:](self->_observers, "navigationSession:didUpdateVehicleParkingInfo:", self, a4);
}

- (void)locationTracker:(id)a3 receivedTrafficIncidentAlert:(id)a4 responseCallback:(id)a5
{
  MNTrafficIncidentAlert *v7;
  MNAudioManager *audioManager;
  id v9;
  void *v10;
  void *v11;
  MNTrafficIncidentAlert *activeTrafficIncidentAlert;
  MNTrafficIncidentAlert *v13;
  MNServerSessionStateInfo *serverSessionStateInfo;
  void *v15;
  id v16;

  v7 = (MNTrafficIncidentAlert *)a4;
  audioManager = self->_audioManager;
  v9 = a5;
  -[MNTrafficIncidentAlert spokenTexts](v7, "spokenTexts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNAudioManager requestSpeech:guidanceLevel:modifier:shortPromptType:completionHandler:](audioManager, "requestSpeech:guidanceLevel:modifier:shortPromptType:completionHandler:", v11, 1, 1, 0, 0);

  activeTrafficIncidentAlert = self->_activeTrafficIncidentAlert;
  self->_activeTrafficIncidentAlert = v7;
  v13 = v7;

  -[MNObserverHashTable navigationSession:didReceiveTrafficIncidentAlert:responseCallback:](self->_observers, "navigationSession:didReceiveTrafficIncidentAlert:responseCallback:", self, v13, v9);
  serverSessionStateInfo = self->_serverSessionStateInfo;
  -[MNTrafficIncidentAlert bannerID](v13, "bannerID");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[MNTrafficIncidentAlert eventInfo](v13, "eventInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNServerSessionStateInfo addDisplayedBannerID:withEventInfo:](serverSessionStateInfo, "addDisplayedBannerID:withEventInfo:", v16, v15);

}

- (void)locationTracker:(id)a3 invalidatedTrafficIncidentAlert:(id)a4
{
  MNTrafficIncidentAlert *activeTrafficIncidentAlert;
  id v6;

  activeTrafficIncidentAlert = self->_activeTrafficIncidentAlert;
  self->_activeTrafficIncidentAlert = 0;
  v6 = a4;

  -[MNObserverHashTable navigationSession:didInvalidateTrafficIncidentAlert:](self->_observers, "navigationSession:didInvalidateTrafficIncidentAlert:", self, v6);
}

- (void)locationTracker:(id)a3 dismissedTrafficIncidentAlert:(id)a4
{
  MNTrafficIncidentAlert *activeTrafficIncidentAlert;
  id v6;

  activeTrafficIncidentAlert = self->_activeTrafficIncidentAlert;
  self->_activeTrafficIncidentAlert = 0;
  v6 = a4;

  -[MNObserverHashTable navigationSession:didDismissTrafficIncidentAlert:](self->_observers, "navigationSession:didDismissTrafficIncidentAlert:", self, v6);
}

- (void)locationTracker:(id)a3 updatedTrafficIncidentAlert:(id)a4
{
  -[MNObserverHashTable navigationSession:didUpdateTrafficIncidentAlert:](self->_observers, "navigationSession:didUpdateTrafficIncidentAlert:", self, a4);
}

- (void)locationTracker:(id)a3 shouldShowChargingInfoForWaypoint:(id)a4
{
  -[MNGuidanceManager setShouldShowChargingInfo:](self->_guidanceManager, "setShouldShowChargingInfo:", 1, a4);
}

- (void)locationTracker:(id)a3 didReceiveTransitAlert:(id)a4
{
  -[MNObserverHashTable navigationSession:didReceiveTransitAlert:](self->_observers, "navigationSession:didReceiveTransitAlert:", self, a4);
}

- (void)locationTracker:(id)a3 didReceiveRouteSignalStrength:(unint64_t)a4
{
  -[MNObserverHashTable navigationSession:didReceiveRouteSignalStrength:](self->_observers, "navigationSession:didReceiveRouteSignalStrength:", self, a4);
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  id v4;

  if (!self->_locationTracker)
  {
    objc_msgSend(a3, "lastLocation");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[MNObserverHashTable navigationSession:didUpdateMatchedLocation:](self->_observers, "navigationSession:didUpdateMatchedLocation:", self, v4);

  }
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 0;
}

- (void)locationManagerUpdatedHeading:(id)a3
{
  MNObserverHashTable *observers;
  double v5;
  double v6;
  double v7;
  id v8;

  objc_msgSend(a3, "heading");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  observers = self->_observers;
  objc_msgSend(v8, "trueHeading");
  v6 = v5;
  objc_msgSend(v8, "headingAccuracy");
  -[MNObserverHashTable navigationSession:didUpdateHeading:accuracy:](observers, "navigationSession:didUpdateHeading:accuracy:", self, v6, v7);

}

- (void)guidanceManagerBeginGuidanceUpdate:(id)a3
{
  -[MNObserverHashTable navigationSessionBeginGuidanceUpdate:](self->_observers, "navigationSessionBeginGuidanceUpdate:", self);
}

- (void)guidanceManagerEndGuidanceUpdate:(id)a3
{
  -[MNObserverHashTable navigationSessionEndGuidanceUpdate:](self->_observers, "navigationSessionEndGuidanceUpdate:", self);
}

- (void)guidanceManager:(id)a3 willAnnounce:(unint64_t)a4 inSeconds:(double)a5
{
  -[MNObserverHashTable navigationSession:willAnnounce:inSeconds:](self->_observers, "navigationSession:willAnnounce:inSeconds:", self, a4, a5);
}

- (void)guidanceManager:(id)a3 announce:(id)a4 isImportant:(BOOL)a5 shortPromptType:(unint64_t)a6 ignorePromptStyle:(BOOL)a7 stage:(unint64_t)a8 completionBlock:(id)a9
{
  _BOOL8 v12;
  uint64_t v13;
  MNAudioManager *audioManager;
  id v15;

  v12 = a7;
  if (a5)
    v13 = 1;
  else
    v13 = 2;
  audioManager = self->_audioManager;
  v15 = a4;
  -[MNAudioManager requestSpeech:guidanceLevel:modifier:shortPromptType:completionHandler:](audioManager, "requestSpeech:guidanceLevel:modifier:shortPromptType:completionHandler:", v15, v13, v12, a6, a9);
  -[MNObserverHashTable navigationSession:didAnnounce:stage:](self->_observers, "navigationSession:didAnnounce:stage:", self, v15, a8);

}

- (void)guidanceManager:(id)a3 willProcessSpeechEvent:(id)a4
{
  -[MNObserverHashTable navigationSession:willProcessSpeechEvent:](self->_observers, "navigationSession:willProcessSpeechEvent:", self, a4);
}

- (void)guidanceManager:(id)a3 didProcessSpeechEvent:(id)a4
{
  -[MNObserverHashTable navigationSession:didProcessSpeechEvent:](self->_observers, "navigationSession:didProcessSpeechEvent:", self, a4);
}

- (void)guidanceManager:(id)a3 triggerHaptics:(int)a4
{
  -[MNObserverHashTable navigationSession:triggerHaptics:](self->_observers, "navigationSession:triggerHaptics:", self, *(_QWORD *)&a4);
}

- (void)guidanceManager:(id)a3 showLaneDirections:(id)a4
{
  -[MNObserverHashTable navigationSession:showLaneDirections:](self->_observers, "navigationSession:showLaneDirections:", self, a4);
}

- (void)guidanceManager:(id)a3 hideLaneDirectionsForId:(id)a4
{
  -[MNObserverHashTable navigationSession:hideLaneDirectionsForId:](self->_observers, "navigationSession:hideLaneDirectionsForId:", self, a4);
}

- (void)guidanceManager:(id)a3 updateSignsWithInfo:(id)a4
{
  -[MNObserverHashTable navigationSession:updateSignsWithInfo:](self->_observers, "navigationSession:updateSignsWithInfo:", self, a4);
}

- (void)guidanceManager:(id)a3 updateSignsWithARInfo:(id)a4
{
  -[MNObserverHashTable navigationSession:updateSignsWithARInfo:](self->_observers, "navigationSession:updateSignsWithARInfo:", self, a4);
}

- (void)guidanceManager:(id)a3 didUpdateNavTrayGuidance:(id)a4
{
  id v5;
  _TtC10Navigation52MNNavigationServiceCallback_DidUpdateNavTrayGuidance *v6;

  v5 = a4;
  v6 = -[MNNavigationServiceCallback_DidUpdateNavTrayGuidance initWithNavTrayGuidanceEvent:]([_TtC10Navigation52MNNavigationServiceCallback_DidUpdateNavTrayGuidance alloc], "initWithNavTrayGuidanceEvent:", v5);

  -[MNObserverHashTable navigationSession:didSendNavigationServiceCallback:](self->_observers, "navigationSession:didSendNavigationServiceCallback:", self, v6);
}

- (void)guidanceManager:(id)a3 usePersistentDisplay:(BOOL)a4
{
  -[MNObserverHashTable navigationSession:usePersistentDisplay:](self->_observers, "navigationSession:usePersistentDisplay:", self, a4);
}

- (void)guidanceManager:(id)a3 showJunctionView:(id)a4
{
  -[MNObserverHashTable navigationSession:showJunctionView:](self->_observers, "navigationSession:showJunctionView:", self, a4);
}

- (void)guidanceManager:(id)a3 hideJunctionViewForId:(id)a4
{
  -[MNObserverHashTable navigationSession:hideJunctionViewForId:](self->_observers, "navigationSession:hideJunctionViewForId:", self, a4);
}

- (void)guidanceManager:(id)a3 newGuidanceEventFeedback:(id)a4
{
  -[MNObserverHashTable navigationSession:newGuidanceEventFeedback:](self->_observers, "navigationSession:newGuidanceEventFeedback:", self, a4);
}

- (void)guidanceManager:(id)a3 updatedGuidanceEventFeedback:(id)a4
{
  -[MNObserverHashTable navigationSession:updatedGuidanceEventFeedback:](self->_observers, "navigationSession:updatedGuidanceEventFeedback:", self, a4);
}

- (BOOL)guidanceManagerIsRerouting
{
  return -[MNLocationTracker isRerouting](self->_locationTracker, "isRerouting");
}

- (void)idleTimerUpdater:(id)a3 shouldEnableIdleTimer:(BOOL)a4
{
  _BOOL8 v4;
  MNNavigationServiceCallback_ShouldEnableIdleTimer *v6;

  v4 = a4;
  v6 = objc_alloc_init(MNNavigationServiceCallback_ShouldEnableIdleTimer);
  -[MNNavigationServiceCallback_ShouldEnableIdleTimer setShouldEnable:](v6, "setShouldEnable:", v4);
  -[MNObserverHashTable navigationSession:didSendNavigationServiceCallback:](self->_observers, "navigationSession:didSendNavigationServiceCallback:", self, v6);

}

- (void)timeAndDistanceUpdater:(id)a3 currentStepIndex:(unint64_t)a4 didUpdateDistanceUntilManeuver:(double)a5 timeUntilManeuver:(double)a6
{
  -[MNObserverHashTable navigationSession:currentStepIndex:didUpdateDistanceUntilManeuver:timeUntilManeuver:](self->_observers, "navigationSession:currentStepIndex:didUpdateDistanceUntilManeuver:timeUntilManeuver:", self, a4, a5, a6);
}

- (void)timeAndDistanceUpdater:(id)a3 didUpdateDisplayETA:(id)a4 remainingDistance:(id)a5 batteryChargeInfo:(id)a6
{
  -[MNObserverHashTable navigationSession:didUpdateDisplayETA:remainingDistance:batteryChargeInfo:](self->_observers, "navigationSession:didUpdateDisplayETA:remainingDistance:batteryChargeInfo:", self, a4, a5, a6);
}

- (void)tracePlayer:(id)a3 didJumpToRouteResponse:(id)a4 request:(id)a5 waypoints:(id)a6
{
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  GEOComposedWaypoint *v16;
  GEOComposedWaypoint *destination;
  id v18;

  v9 = (objc_class *)MEMORY[0x1E0D274D8];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = [v9 alloc];
  objc_msgSend(v11, "routeAttributes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (id)objc_msgSend(v13, "initWithWaypoints:routeAttributes:directionsResponse:", v10, v14, v12);
  objc_msgSend(v18, "mainRouteInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastObject");
  v16 = (GEOComposedWaypoint *)objc_claimAutoreleasedReturnValue();

  destination = self->_destination;
  self->_destination = v16;

  -[MNLocationTracker reroute:reason:](self->_locationTracker, "reroute:reason:", v15, 0);
}

- (void)tracePlayerDidPause:(id)a3
{
  -[MNLocationTracker tracePaused](self->_locationTracker, "tracePaused", a3);
}

- (void)tracePlayer:(id)a3 didSeekToTime:(double)a4 fromTime:(double)a5 location:(id)a6
{
  id v10;
  MNLocationTracker *locationTracker;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v10 = a6;
  if (a4 < a5)
    -[MNGuidanceManager reset](self->_guidanceManager, "reset");
  if (v10)
  {
    locationTracker = self->_locationTracker;
    -[MNNavigationSession routeManager](self, "routeManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "currentRoute");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNLocationTracker forceOnRoute:atLocation:](locationTracker, "forceOnRoute:atLocation:", v13, v10);

  }
}

- (void)tracePlayer:(id)a3 didUpdateCurrentRoute:(id)a4 reason:(unint64_t)a5
{
  id v7;
  void *v8;
  GEOComposedWaypoint *v9;
  GEOComposedWaypoint *destination;
  MNActiveRouteInfo *v11;

  v7 = a4;
  v11 = -[MNActiveRouteInfo initWithRoute:]([MNActiveRouteInfo alloc], "initWithRoute:", v7);
  objc_msgSend(v7, "waypoints");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "lastObject");
  v9 = (GEOComposedWaypoint *)objc_claimAutoreleasedReturnValue();
  destination = self->_destination;
  self->_destination = v9;

  -[MNLocationTracker reroute:reason:](self->_locationTracker, "reroute:reason:", v11, a5);
}

- (void)tracePlayer:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6
{
  -[MNNavigationSession locationTracker:didResumeNavigatingFromWaypoint:endOfLegIndex:reason:](self, "locationTracker:didResumeNavigatingFromWaypoint:endOfLegIndex:reason:", 0, a4, a5, a6);
}

- (void)vehicleMonitorDidDisconnectFromVehicle:(id)a3
{
  char BOOL;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  unint64_t v8;
  const __CFString *v9;
  void *v10;
  char v11;
  _BOOL4 v12;
  NSObject *v13;
  _BOOL4 v14;
  MNObserverHashTable *observers;
  MNNavigationSession *v16;
  uint64_t v17;
  NSObject *v18;
  int v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  BOOL = GEOConfigGetBOOL();
  MNGetMNNavigationSessionLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if ((BOOL & 1) != 0)
  {
    if (v6)
    {
      -[MNLocationTracker arrivalInfo](self->_locationTracker, "arrivalInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "arrivalState");
      if (v8 > 6)
        v9 = CFSTR("MNArrivalState_Unknown");
      else
        v9 = off_1E61D7E78[v8];
      v19 = 138412290;
      v20 = v9;
      _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEFAULT, "Received vehicle monitor disconnect notification. Current arrival state: %@", (uint8_t *)&v19, 0xCu);

    }
    -[MNLocationTracker arrivalInfo](self->_locationTracker, "arrivalInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isInArrivalState");

    if ((v11 & 1) != 0)
    {
      v12 = -[MNNavigationSessionState isOnLastLeg](self->_navigationSessionState, "isOnLastLeg");
      MNGetMNNavigationSessionLog();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        if (v14)
        {
          LOWORD(v19) = 0;
          _os_log_impl(&dword_1B0AD7000, v13, OS_LOG_TYPE_DEFAULT, "Trying to end navigation because we are on last leg.", (uint8_t *)&v19, 2u);
        }

        observers = self->_observers;
        v16 = self;
        v17 = 5;
      }
      else
      {
        if (v14)
        {
          LOWORD(v19) = 0;
          _os_log_impl(&dword_1B0AD7000, v13, OS_LOG_TYPE_DEFAULT, "Trying to pause navigation because we are not on last leg.", (uint8_t *)&v19, 2u);
        }

        observers = self->_observers;
        v16 = self;
        v17 = 6;
      }
      -[MNObserverHashTable navigationSession:shouldEndWithReason:](observers, "navigationSession:shouldEndWithReason:", v16, v17);
    }
    else
    {
      MNGetMNNavigationSessionLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_1B0AD7000, v18, OS_LOG_TYPE_DEFAULT, "Not ending navigation because not in arrival state.", (uint8_t *)&v19, 2u);
      }

    }
  }
  else
  {
    if (v6)
    {
      LOWORD(v19) = 0;
    }

  }
}

- (void)audioManager:(id)a3 didActivateAudioSession:(BOOL)a4
{
  -[MNObserverHashTable navigationSession:didActivateAudioSession:](self->_observers, "navigationSession:didActivateAudioSession:", self, a4);
}

- (void)audioManager:(id)a3 didStartSpeakingPrompt:(id)a4
{
  -[MNObserverHashTable navigationSession:didStartSpeakingPrompt:](self->_observers, "navigationSession:didStartSpeakingPrompt:", self, a4);
}

- (void)audioManager:(id)a3 didChangeVoiceGuidanceLevel:(unint64_t)a4
{
  MNNavigationServiceCallback_DidChangeVoiceGuidanceLevel *v6;

  v6 = objc_alloc_init(MNNavigationServiceCallback_DidChangeVoiceGuidanceLevel);
  -[MNNavigationServiceCallback_DidChangeVoiceGuidanceLevel setVoiceGuidanceLevel:](v6, "setVoiceGuidanceLevel:", a4);
  -[MNObserverHashTable navigationSession:didSendNavigationServiceCallback:](self->_observers, "navigationSession:didSendNavigationServiceCallback:", self, v6);
  if (a4 == 2)
    -[MNNavigationSession repeatCurrentGuidance](self, "repeatCurrentGuidance");

}

- (void)updateManager:(id)a3 willSendETARequest:(id)a4
{
  id v5;
  NSObject *v6;
  MNServerSessionStateInfo *serverSessionStateInfo;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  MNServerSessionStateInfo *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  MNGetMNNavigationSessionLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    serverSessionStateInfo = self->_serverSessionStateInfo;
    v14 = 134218242;
    v15 = v5;
    v16 = 2112;
    v17 = serverSessionStateInfo;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEFAULT, "willSendETARequest - Request: %p | %@", (uint8_t *)&v14, 0x16u);
  }

  -[MNServerSessionStateInfo sessionState](self->_serverSessionStateInfo, "sessionState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSessionState:", v8);

  -[MNRouteManager currentRoute](self->_routeManager, "currentRoute");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "directionsResponseID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDirectionsResponseID:", v10);

  v11 = (void *)objc_opt_new();
  objc_msgSend(v5, "setTripInfo:", v11);

  v12 = -[MNLocationTracker hasVisitedFirstStop](self->_locationTracker, "hasVisitedFirstStop");
  objc_msgSend(v5, "tripInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHasVisitedFirstStop:", v12);

  -[MNLocationTracker updateRequestForETAUpdate:](self->_locationTracker, "updateRequestForETAUpdate:", v5);
}

- (void)updateManager:(id)a3 didReceiveETAResponse:(id)a4
{
  MNServerSessionStateInfo *serverSessionStateInfo;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  -[MNLocationTracker updateForETAUResponse:](self->_locationTracker, "updateForETAUResponse:", v12);
  serverSessionStateInfo = self->_serverSessionStateInfo;
  objc_msgSend(v12, "response");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNServerSessionStateInfo updateWithETAUResponse:](serverSessionStateInfo, "updateWithETAUResponse:", v6);

  -[MNNavigationSession lastMatchedLocation](self, "lastMatchedLocation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "routeMatch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNNavigationSession _updateResumeRouteInfoFrom:](self, "_updateResumeRouteInfoFrom:", objc_msgSend(v8, "routeCoordinate"));

  objc_msgSend(v12, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(v12, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setError:", v11);

    -[MNObserverHashTable navigationSession:didSendNavigationServiceCallback:](self->_observers, "navigationSession:didSendNavigationServiceCallback:", self, v10);
  }

}

- (BOOL)wantsETAUpdates
{
  void *v3;
  int v4;

  if ((self->_navigationCapabilities & 1) == 0)
    return 0;
  -[MNRouteManager currentRoute](self->_routeManager, "currentRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "transportType");

  if (self->_navigationType != 3)
    return 0;
  return !v4 || v4 == 3;
}

- (id)routeInfoForUpdateManager:(id)a3 reason:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  if (a4 - 3 >= 4
    && (-[MNLocationTracker isRerouting](self->_locationTracker, "isRerouting")
     || -[MNNavigationSession navigationState](self, "navigationState") == 6))
  {
    v7 = 0;
  }
  else
  {
    -[MNRouteManager currentRouteInfo](self->_routeManager, "currentRouteInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (unint64_t)targetLegIndex
{
  return -[MNLocationTracker targetLegIndex](self->_locationTracker, "targetLegIndex");
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  double v5;

  if (a3.var0 == (_DWORD)NavigationConfig_LocationProjectionTimeSeconds && a3.var1 == off_1EEEC9D90)
  {
    GEOConfigGetDouble();
    self->_locationProjectionTime = v5;
  }
}

- (MNAudioManager)audioManager
{
  return self->_audioManager;
}

- (GEOApplicationAuditToken)auditToken
{
  return self->_auditToken;
}

- (GEOComposedWaypoint)destination
{
  return self->_destination;
}

- (MNRouteManager)routeManager
{
  return self->_routeManager;
}

- (GEOMotionContext)motionContext
{
  return self->_motionContext;
}

- (MNNavigationTraceManager)traceManager
{
  return self->_traceManager;
}

- (BOOL)isAllowedToSwitchTransportTypes
{
  return self->_isAllowedToSwitchTransportTypes;
}

- (int64_t)navigationType
{
  return self->_navigationType;
}

- (MNNavigationSessionState)navigationSessionState
{
  return self->_navigationSessionState;
}

- (MNServerSessionStateInfo)serverSessionStateInfo
{
  return self->_serverSessionStateInfo;
}

- (unint64_t)navigationCapabilities
{
  return self->_navigationCapabilities;
}

- (void)setNavigationCapabilities:(unint64_t)a3
{
  self->_navigationCapabilities = a3;
}

- (BOOL)guidancePromptsEnabled
{
  return self->_guidancePromptsEnabled;
}

- (BOOL)isConnectedToCarplay
{
  return self->_isConnectedToCarplay;
}

- (void)setIsConnectedToCarplay:(BOOL)a3
{
  self->_isConnectedToCarplay = a3;
}

- (unint64_t)displayedStepIndex
{
  return self->_displayedStepIndex;
}

- (void)setDisplayedStepIndex:(unint64_t)a3
{
  self->_displayedStepIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationSessionState, 0);
  objc_storeStrong((id *)&self->_probeCrumbs, 0);
  objc_storeStrong((id *)&self->_manifestUpdateAssertion, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_tileLoaderClient, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_navigationSessionStateListeners, 0);
  objc_storeStrong((id *)&self->_guidanceState, 0);
  objc_storeStrong((id *)&self->_activeTrafficIncidentAlert, 0);
  objc_storeStrong((id *)&self->_navigationUpdateRecorder, 0);
  objc_storeStrong((id *)&self->_navigationEventRecorder, 0);
  objc_storeStrong((id *)&self->_traceManager, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_idleTimerUpdater, 0);
  objc_storeStrong((id *)&self->_vehicleMonitor, 0);
  objc_storeStrong((id *)&self->_timeAndDistanceUpdater, 0);
  objc_storeStrong((id *)&self->_guidanceManager, 0);
  objc_storeStrong((id *)&self->_audioManager, 0);
  objc_storeStrong((id *)&self->_motionContext, 0);
  objc_storeStrong((id *)&self->_serverSessionStateInfo, 0);
  objc_storeStrong((id *)&self->_locationTracker, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_routeManager, 0);
}

@end
