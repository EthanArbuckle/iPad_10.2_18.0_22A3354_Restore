@implementation MNNavigationStateGuidance

+ (id)guidanceStateForStartDetails:(id)a3 stateManager:(id)a4 navigationSessionManager:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  __objc2_class *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v7, "navigationType");
  switch(v10)
  {
    case 4:
      goto LABEL_4;
    case 3:
      if (objc_msgSend(v7, "guidanceType") == 2)
      {
        v11 = MNNavigationStateRoutePreviewGuidance;
      }
      else if (objc_msgSend(v7, "guidanceType") == 1)
      {
        v11 = MNNavigationStateLowGuidance;
      }
      else
      {
        v11 = MNNavigationStateGuidanceTurnByTurn;
      }
      goto LABEL_13;
    case 2:
LABEL_4:
      v11 = MNNavigationStateGuidanceStepping;
LABEL_13:
      v14 = (void *)objc_msgSend([v11 alloc], "initWithStateManager:navigationSessionManager:startDetails:", v8, v9, v7);
      goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid navigationType: %d"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  GEOFindOrCreateLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    v17 = "+[MNNavigationStateGuidance guidanceStateForStartDetails:stateManager:navigationSessionManager:]";
    v18 = 2080;
    v19 = "/Library/Caches/com.apple.xbs/Sources/Navigation/NavigationState/MNNavigationStateGuidance.m";
    v20 = 1024;
    v21 = 63;
    v22 = 2080;
    v23 = "NO";
    v24 = 2112;
    v25 = v12;
    _os_log_impl(&dword_1B0AD7000, v13, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
  }

  v14 = 0;
LABEL_14:

  return v14;
}

- (id)currentDestination
{
  void *v2;
  void *v3;

  -[MNNavigationSessionManager navigationSession](self->_navigationSessionManager, "navigationSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "destination");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)requiresHighMemoryThreshold
{
  return 1;
}

- (unint64_t)desiredLocationProviderType
{
  void *v3;
  void *v4;
  void *v6;

  -[MNNavigationStateGuidance traceManager](self, "traceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tracePlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    return 3;
  -[MNNavigationSessionManager simulationLocationProvider](self->_navigationSessionManager, "simulationLocationProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    return 4;
  else
    return 1;
}

- (id)clParameters
{
  MNLocationProviderCLParameters *v3;
  void *v4;
  int v5;
  void *v6;
  unsigned int v7;
  MNLocationProviderCLParameters *v8;
  uint64_t v9;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MNLocationProviderCLParameters);
  -[MNStartNavigationDetails requestingAppIdentifier](self->_startDetails, "requestingAppIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.Maps"));

  if (v5)
    -[MNLocationProviderCLParameters setFusionInfoEnabled:](v3, "setFusionInfoEnabled:", 1);
  if (-[MNStartNavigationDetails navigationType](self->_startDetails, "navigationType") != 3)
    goto LABEL_6;
  -[MNStartNavigationDetails routeAttributes](self->_startDetails, "routeAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "mainTransportType");

  if (v7 <= 6)
  {
    if (((1 << v7) & 0x6E) != 0)
    {
LABEL_6:
      v8 = v3;
      v9 = 4;
LABEL_7:
      -[MNLocationProviderCLParameters setActivityType:](v8, "setActivityType:", v9);
      return v3;
    }
    if (!v7)
    {
      v8 = v3;
      v9 = 2;
      goto LABEL_7;
    }
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315650;
      v13 = "-[MNNavigationStateGuidance clParameters]";
      v14 = 2080;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Navigation/NavigationState/MNNavigationStateGuidance.m";
      v16 = 1024;
      v17 = 115;
      _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", (uint8_t *)&v12, 0x1Cu);
    }

  }
  return v3;
}

- (BOOL)shouldClearStoredRoutes
{
  return 0;
}

- (id)traceManager
{
  return -[MNNavigationSessionManager traceManager](self->_navigationSessionManager, "traceManager");
}

- (id)simulationLocationProvider
{
  return -[MNNavigationSessionManager simulationLocationProvider](self->_navigationSessionManager, "simulationLocationProvider");
}

- (MNNavigationStateGuidance)initWithStateManager:(id)a3 navigationSessionManager:(id)a4 startDetails:(id)a5
{
  id v9;
  id v10;
  MNNavigationStateGuidance *v11;
  MNNavigationStateGuidance *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MNNavigationStateGuidance;
  v11 = -[MNNavigationState initWithStateManager:](&v14, sel_initWithStateManager_, a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_navigationSessionManager, a4);
    objc_storeStrong((id *)&v12->_startDetails, a5);
  }

  return v12;
}

- (void)enterState
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MNNavigationStateGuidance;
  -[MNNavigationState enterState](&v5, sel_enterState);
  -[MNNavigationState stateManager](self, "stateManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNNavigationSessionManager setDelegate:](self->_navigationSessionManager, "setDelegate:", v4);

  if (self->_startDetails)
    -[MNNavigationSessionManager startNavigationWithDetails:](self->_navigationSessionManager, "startNavigationWithDetails:");
}

- (void)leaveState
{
  MNNavigationSessionManager *navigationSessionManager;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MNNavigationStateGuidance;
  -[MNNavigationState leaveState](&v4, sel_leaveState);
  -[MNNavigationSessionManager setDelegate:](self->_navigationSessionManager, "setDelegate:", 0);
  navigationSessionManager = self->_navigationSessionManager;
  self->_navigationSessionManager = 0;

}

- (void)preEnterState
{
  MNNavigationSessionManager *v3;
  void *v4;
  void *v5;
  MNNavigationSessionManager *v6;
  MNNavigationSessionManager *navigationSessionManager;
  void *v8;
  void *v9;

  if (!self->_navigationSessionManager)
  {
    v3 = [MNNavigationSessionManager alloc];
    -[MNNavigationState stateManager](self, "stateManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "auditToken");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[MNNavigationSessionManager initWithAuditToken:](v3, "initWithAuditToken:", v5);
    navigationSessionManager = self->_navigationSessionManager;
    self->_navigationSessionManager = v6;

  }
  -[MNNavigationState stateManager](self, "stateManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "navigationDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNNavigationSessionManager setDelegate:](self->_navigationSessionManager, "setDelegate:", v9);

  if (self->_startDetails)
    -[MNNavigationSessionManager updateForStartNavigation:](self->_navigationSessionManager, "updateForStartNavigation:");
}

- (void)postEnterState
{
  MNNavigationSessionManager *navigationSessionManager;
  id v3;

  navigationSessionManager = self->_navigationSessionManager;
  -[MNStartNavigationDetails initialUserLocation](self->_startDetails, "initialUserLocation");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[MNNavigationSessionManager updateWithInitialLocation:](navigationSessionManager, "updateWithInitialLocation:", v3);

}

- (void)stopNavigationWithReason:(unint64_t)a3
{
  MNNavigationStateNoDestination *v4;
  void *v5;
  void *v6;
  MNNavigationStateNoDestination *v7;

  -[MNNavigationSessionManager stopNavigationWithReason:](self->_navigationSessionManager, "stopNavigationWithReason:", a3);
  v4 = [MNNavigationStateNoDestination alloc];
  -[MNNavigationState stateManager](self, "stateManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MNNavigationState initWithStateManager:](v4, "initWithStateManager:", v5);

  -[MNNavigationState stateManager](self, "stateManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transitionToState:", v7);

}

- (void)rerouteWithWaypoints:(id)a3
{
  -[MNNavigationSessionManager rerouteWithWaypoints:](self->_navigationSessionManager, "rerouteWithWaypoints:", a3);
}

- (void)insertWaypoint:(id)a3
{
  -[MNNavigationSessionManager insertWaypoint:](self->_navigationSessionManager, "insertWaypoint:", a3);
}

- (void)removeWaypointAtIndex:(unint64_t)a3
{
  -[MNNavigationSessionManager removeWaypointAtIndex:](self->_navigationSessionManager, "removeWaypointAtIndex:", a3);
}

- (void)advanceToNextLeg
{
  -[MNNavigationSessionManager advanceToNextLeg](self->_navigationSessionManager, "advanceToNextLeg");
}

- (void)updateDestination:(id)a3
{
  -[MNNavigationSessionManager updateDestination:](self->_navigationSessionManager, "updateDestination:", a3);
}

- (void)resumeOriginalDestination
{
  -[MNNavigationSessionManager resumeOriginalDestination](self->_navigationSessionManager, "resumeOriginalDestination");
}

- (void)forceReroute
{
  -[MNNavigationSessionManager forceReroute](self->_navigationSessionManager, "forceReroute");
}

- (void)switchToRoute:(id)a3
{
  -[MNNavigationSessionManager switchToRoute:](self->_navigationSessionManager, "switchToRoute:", a3);
}

- (void)changeTransportType:(int)a3 route:(id)a4
{
  -[MNNavigationSessionManager changeTransportType:route:](self->_navigationSessionManager, "changeTransportType:route:", *(_QWORD *)&a3, a4);
}

- (void)switchToDestinationRoute
{
  -[MNNavigationSessionManager switchToDestinationRoute](self->_navigationSessionManager, "switchToDestinationRoute");
}

- (void)setVoiceGuidanceLevelOverride:(unint64_t)a3
{
  -[MNNavigationSessionManager setVoiceGuidanceLevelOverride:](self->_navigationSessionManager, "setVoiceGuidanceLevelOverride:", a3);
}

- (void)repeatCurrentGuidanceWithReply:(id)a3
{
  _BOOL8 v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = -[MNNavigationSessionManager repeatCurrentGuidance](self->_navigationSessionManager, "repeatCurrentGuidance");
  v5 = v6;
  if (v6)
  {
    (*((void (**)(id, _BOOL8))v6 + 2))(v6, v4);
    v5 = v6;
  }

}

- (void)repeatCurrentTrafficAlertWithReply:(id)a3
{
  _BOOL8 v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = -[MNNavigationSessionManager repeatCurrentTrafficAlert](self->_navigationSessionManager, "repeatCurrentTrafficAlert");
  v5 = v6;
  if (v6)
  {
    (*((void (**)(id, _BOOL8))v6 + 2))(v6, v4);
    v5 = v6;
  }

}

- (void)vibrateForPrompt:(unint64_t)a3 withReply:(id)a4
{
  _BOOL8 v6;
  void *v7;
  id v8;

  v8 = a4;
  v6 = -[MNNavigationSessionManager vibrateForPrompt:](self->_navigationSessionManager, "vibrateForPrompt:", a3);
  v7 = v8;
  if (v8)
  {
    (*((void (**)(id, _BOOL8))v8 + 2))(v8, v6);
    v7 = v8;
  }

}

- (void)stopCurrentGuidancePrompt
{
  -[MNNavigationSessionManager stopCurrentGuidancePrompt](self->_navigationSessionManager, "stopCurrentGuidancePrompt");
}

- (void)setIsDisplayingNavigationTray:(BOOL)a3
{
  -[MNNavigationSessionManager setIsDisplayingNavigationTray:](self->_navigationSessionManager, "setIsDisplayingNavigationTray:", a3);
}

- (void)setIsConnectedToCarplay:(BOOL)a3
{
  -[MNNavigationSessionManager setIsConnectedToCarplay:](self->_navigationSessionManager, "setIsConnectedToCarplay:", a3);
}

- (void)setDisplayedStepIndex:(unint64_t)a3
{
  -[MNNavigationSessionManager setDisplayedStepIndex:](self->_navigationSessionManager, "setDisplayedStepIndex:", a3);
}

- (void)setRideIndex:(unint64_t)a3 forSegmentIndex:(unint64_t)a4
{
  -[MNNavigationSessionManager setRideIndex:forSegmentIndex:](self->_navigationSessionManager, "setRideIndex:forSegmentIndex:", a3, a4);
}

- (void)setJunctionViewImageWidth:(double)a3 height:(double)a4
{
  -[MNNavigationSessionManager setJunctionViewImageWidth:height:](self->_navigationSessionManager, "setJunctionViewImageWidth:height:", a3, a4);
}

- (void)disableNavigationCapability:(unint64_t)a3
{
  -[MNNavigationSessionManager disableNavigationCapability:](self->_navigationSessionManager, "disableNavigationCapability:", a3);
}

- (void)enableNavigationCapability:(unint64_t)a3
{
  -[MNNavigationSessionManager enableNavigationCapability:](self->_navigationSessionManager, "enableNavigationCapability:", a3);
}

- (void)acceptReroute:(BOOL)a3 forTrafficIncidentAlert:(id)a4
{
  -[MNNavigationSessionManager acceptReroute:forTrafficIncidentAlert:](self->_navigationSessionManager, "acceptReroute:forTrafficIncidentAlert:", a3, a4);
}

- (void)setTraceIsPlaying:(BOOL)a3
{
  -[MNNavigationSessionManager setTraceIsPlaying:](self->_navigationSessionManager, "setTraceIsPlaying:", a3);
}

- (void)setTracePlaybackSpeed:(double)a3
{
  -[MNNavigationSessionManager setTracePlaybackSpeed:](self->_navigationSessionManager, "setTracePlaybackSpeed:", a3);
}

- (void)setTracePosition:(double)a3
{
  -[MNNavigationSessionManager setTracePosition:](self->_navigationSessionManager, "setTracePosition:", a3);
}

- (void)recordTraceBookmarkAtCurrentPositionWthScreenshotData:(id)a3
{
  -[MNNavigationSessionManager recordTraceBookmarkAtCurrentPositionWthScreenshotData:](self->_navigationSessionManager, "recordTraceBookmarkAtCurrentPositionWthScreenshotData:", a3);
}

- (void)recordPedestrianTracePath:(id)a3
{
  -[MNNavigationSessionManager recordPedestrianTracePath:](self->_navigationSessionManager, "recordPedestrianTracePath:", a3);
}

- (void)setSimulationSpeedOverride:(double)a3
{
  -[MNNavigationSessionManager setSimulationSpeedOverride:](self->_navigationSessionManager, "setSimulationSpeedOverride:", a3);
}

- (void)setSimulationSpeedMultiplier:(double)a3
{
  -[MNNavigationSessionManager setSimulationSpeedMultiplier:](self->_navigationSessionManager, "setSimulationSpeedMultiplier:", a3);
}

- (void)setSimulationPosition:(double)a3
{
  -[MNNavigationSessionManager setSimulationPosition:](self->_navigationSessionManager, "setSimulationPosition:", a3);
}

- (void)pauseRealtimeUpdatesForSubscriber:(id)a3
{
  -[MNNavigationSessionManager pauseRealtimeUpdatesForSubscriber:](self->_navigationSessionManager, "pauseRealtimeUpdatesForSubscriber:", a3);
}

- (void)resumeRealtimeUpdatesForSubscriber:(id)a3
{
  -[MNNavigationSessionManager resumeRealtimeUpdatesForSubscriber:](self->_navigationSessionManager, "resumeRealtimeUpdatesForSubscriber:", a3);
}

- (void)changeOfflineMode:(unsigned __int8)a3
{
  -[MNNavigationSessionManager changeOfflineMode:](self->_navigationSessionManager, "changeOfflineMode:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDetails, 0);
  objc_storeStrong((id *)&self->_navigationSessionManager, 0);
}

@end
