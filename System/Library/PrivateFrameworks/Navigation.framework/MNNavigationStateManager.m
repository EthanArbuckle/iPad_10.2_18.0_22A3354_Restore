@implementation MNNavigationStateManager

+ (id)sharedManager
{
  if (qword_1ED0C4150 != -1)
    dispatch_once(&qword_1ED0C4150, &__block_literal_global_52);
  return (id)_MergedGlobals_51;
}

void __41__MNNavigationStateManager_sharedManager__block_invoke()
{
  MNNavigationStateManager *v0;
  void *v1;

  v0 = objc_alloc_init(MNNavigationStateManager);
  v1 = (void *)_MergedGlobals_51;
  _MergedGlobals_51 = (uint64_t)v0;

}

- (MNNavigationStateManager)init
{
  MNNavigationStateManager *v2;
  void *v3;
  void *v4;
  GEOApplicationAuditToken *v5;
  GEOApplicationAuditToken *auditToken;
  GEOApplicationAuditToken *v7;
  uint64_t v8;
  geo_isolater *isolater;
  MNNavigationStateManager *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MNNavigationStateManager;
  v2 = -[MNNavigationStateManager init](&v12, sel_init);
  if (v2)
  {
    +[MNLocationManager sharedLocationManager](MNLocationManager, "sharedLocationManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setEffectiveBundleIdentifier:", CFSTR("com.apple.Maps"));
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D26EF8]), "initWithProxiedApplicationBundleId:", CFSTR("com.apple.Maps"));
    objc_msgSend(v4, "overrideTokenWithOfflineCohortId:", CFSTR("com.apple.Maps"));
    v5 = (GEOApplicationAuditToken *)objc_claimAutoreleasedReturnValue();

    auditToken = v2->_auditToken;
    v2->_auditToken = v5;
    v7 = v5;

    v8 = geo_isolater_create();
    isolater = v2->_isolater;
    v2->_isolater = (geo_isolater *)v8;

    v10 = v2;
  }

  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[MNLocationManager sharedLocationManager](MNLocationManager, "sharedLocationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stop");
  objc_msgSend(v3, "removeLocationAccessForAll");

  v4.receiver = self;
  v4.super_class = (Class)MNNavigationStateManager;
  -[MNNavigationStateManager dealloc](&v4, sel_dealloc);
}

- (void)start
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t buf[4];
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
  if (self->_isStarted)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Start should only be called once."));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v7 = "-[MNNavigationStateManager start]";
      v8 = 2080;
      v9 = "/Library/Caches/com.apple.xbs/Sources/Navigation/NavigationState/MNNavigationStateManager.m";
      v10 = 1024;
      v11 = 83;
      v12 = 2080;
      v13 = "!_isStarted";
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
    }

  }
  -[MNNavigationStateManager _initialState](self, "_initialState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNNavigationStateManager transitionToState:](self, "transitionToState:", v3);

  geo_isolate_sync();
}

uint64_t __33__MNNavigationStateManager_start__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 8) = 1;
  return result;
}

- (void)reset
{
  id v3;

  -[MNNavigationStateManager _initialState](self, "_initialState");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[MNNavigationStateManager transitionToState:](self, "transitionToState:", v3);

}

- (void)registerObserver:(id)a3
{
  id v4;
  MNObserverHashTable *v5;
  MNObserverHashTable *navigationStateObservers;
  id v7;

  v4 = a3;
  v7 = v4;
  if (!self->_navigationStateObservers)
  {
    v5 = -[MNObserverHashTable initWithProtocol:]([MNObserverHashTable alloc], "initWithProtocol:", &unk_1EEED4898);
    navigationStateObservers = self->_navigationStateObservers;
    self->_navigationStateObservers = v5;

    v4 = v7;
  }
  -[MNNavigationStateManager _replayStateForNewObserver:](self, "_replayStateForNewObserver:", v4);
  -[MNObserverHashTable registerObserver:](self->_navigationStateObservers, "registerObserver:", v7);

}

- (void)unregisterObserver:(id)a3
{
  -[MNObserverHashTable unregisterObserver:](self->_navigationStateObservers, "unregisterObserver:", a3);
}

- (BOOL)isStarted
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
  geo_isolate_sync_data();
  v2 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __37__MNNavigationStateManager_isStarted__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

- (MNNavigationState)currentState
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
  v7 = __Block_byref_object_copy__17;
  v8 = __Block_byref_object_dispose__17;
  v9 = 0;
  geo_isolate_sync_data();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (MNNavigationState *)v2;
}

void __40__MNNavigationStateManager_currentState__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
}

- (unint64_t)currentStateType
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[MNNavigationStateManager currentState](self, "currentState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "type");
  else
    v4 = 0;

  return v4;
}

- (void)_replayStateForNewObserver:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  -[MNNavigationStateManager currentState](self, "currentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type");

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "stateManager:willChangeFromState:toState:", self, 0, v5);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "stateManager:didChangeFromState:toState:", self, 0, v5);

}

- (id)_initialState
{
  return -[MNNavigationState initWithStateManager:]([MNNavigationStateNoDestination alloc], "initWithStateManager:", self);
}

- (void)setRoutesForPreview:(id)a3 selectedRouteIndex:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  uint8_t v15[16];
  uint8_t buf[16];

  v6 = a3;
  MNGetMNNavigationStateManagerLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);
  v9 = v7;
  v10 = v9;
  if (v8 - 1 > 0xFFFFFFFFFFFFFFFDLL)
  {

    -[MNNavigationStateManager currentState](self, "currentState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRoutesForPreview:selectedRouteIndex:", v6, a4);

    v14 = v10;
  }
  else
  {
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "SetRoutesForPreview", ", buf, 2u);
    }

    -[MNNavigationStateManager currentState](self, "currentState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setRoutesForPreview:selectedRouteIndex:", v6, a4);

    v12 = v10;
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)v15 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v12, OS_SIGNPOST_INTERVAL_END, v8, "SetRoutesForPreview", ", v15, 2u);
    }
  }

}

- (void)startNavigationWithDetails:(id)a3 activeBlock:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[MNNavigationStateManager currentState](self, "currentState");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startNavigationWithDetails:activeBlock:", v7, v6);

}

- (void)stopNavigationWithReason:(unint64_t)a3
{
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  MNGetMNNavigationStateManagerLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);
  v7 = v5;
  v8 = v7;
  if (v6 - 1 > 0xFFFFFFFFFFFFFFFDLL)
  {

    -[MNNavigationStateManager currentState](self, "currentState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stopNavigationWithReason:", a3);

    v12 = v8;
  }
  else
  {
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "StopNavigation", ", buf, 2u);
    }

    -[MNNavigationStateManager currentState](self, "currentState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stopNavigationWithReason:", a3);

    v10 = v8;
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)v13 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v10, OS_SIGNPOST_INTERVAL_END, v6, "StopNavigation", ", v13, 2u);
    }
  }

}

- (void)rerouteWithWaypoints:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MNNavigationStateManager currentState](self, "currentState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rerouteWithWaypoints:", v4);

}

- (void)insertWaypoint:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MNNavigationStateManager currentState](self, "currentState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertWaypoint:", v4);

}

- (void)removeWaypointAtIndex:(unint64_t)a3
{
  id v4;

  -[MNNavigationStateManager currentState](self, "currentState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeWaypointAtIndex:", a3);

}

- (void)advanceToNextLeg
{
  id v2;

  -[MNNavigationStateManager currentState](self, "currentState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "advanceToNextLeg");

}

- (void)updateDestination:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MNNavigationStateManager currentState](self, "currentState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateDestination:", v4);

}

- (void)resumeOriginalDestination
{
  id v2;

  -[MNNavigationStateManager currentState](self, "currentState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resumeOriginalDestination");

}

- (void)forceReroute
{
  id v2;

  -[MNNavigationStateManager currentState](self, "currentState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "forceReroute");

}

- (void)switchToRoute:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MNNavigationStateManager currentState](self, "currentState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "switchToRoute:", v4);

}

- (void)changeTransportType:(int)a3 route:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  -[MNNavigationStateManager currentState](self, "currentState");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "changeTransportType:route:", v4, v6);

}

- (void)switchToDestinationRoute
{
  id v2;

  -[MNNavigationStateManager currentState](self, "currentState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "switchToDestinationRoute");

}

- (void)setGuidanceType:(unint64_t)a3
{
  id v4;

  -[MNNavigationStateManager currentState](self, "currentState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGuidanceType:", a3);

}

- (void)changeUserOptions:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MNNavigationStateManager currentState](self, "currentState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "changeUserOptions:", v4);

}

- (void)setVoiceGuidanceLevelOverride:(unint64_t)a3
{
  id v4;

  -[MNNavigationStateManager currentState](self, "currentState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVoiceGuidanceLevelOverride:", a3);

}

- (void)repeatCurrentGuidanceWithReply:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MNNavigationStateManager currentState](self, "currentState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "repeatCurrentGuidanceWithReply:", v4);

}

- (void)repeatCurrentTrafficAlertWithReply:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MNNavigationStateManager currentState](self, "currentState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "repeatCurrentTrafficAlertWithReply:", v4);

}

- (void)vibrateForPrompt:(unint64_t)a3 withReply:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[MNNavigationStateManager currentState](self, "currentState");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "vibrateForPrompt:withReply:", a3, v6);

}

- (void)stopCurrentGuidancePrompt
{
  id v2;

  -[MNNavigationStateManager currentState](self, "currentState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopCurrentGuidancePrompt");

}

- (void)setGuidancePromptsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[MNNavigationStateManager currentState](self, "currentState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGuidancePromptsEnabled:", v3);

}

- (void)setIsDisplayingNavigationTray:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[MNNavigationStateManager currentState](self, "currentState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsDisplayingNavigationTray:", v3);

}

- (void)setIsConnectedToCarplay:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[MNNavigationStateManager currentState](self, "currentState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsConnectedToCarplay:", v3);

}

- (void)setDisplayedStepIndex:(unint64_t)a3
{
  id v4;

  -[MNNavigationStateManager currentState](self, "currentState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisplayedStepIndex:", a3);

}

- (void)setRideIndex:(unint64_t)a3 forSegmentIndex:(unint64_t)a4
{
  id v6;

  -[MNNavigationStateManager currentState](self, "currentState");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRideIndex:forSegmentIndex:", a3, a4);

}

- (void)setJunctionViewImageWidth:(double)a3 height:(double)a4
{
  id v6;

  -[MNNavigationStateManager currentState](self, "currentState");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setJunctionViewImageWidth:height:", a3, a4);

}

- (void)disableNavigationCapability:(unint64_t)a3
{
  id v4;

  -[MNNavigationStateManager currentState](self, "currentState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "disableNavigationCapability:", a3);

}

- (void)enableNavigationCapability:(unint64_t)a3
{
  id v4;

  -[MNNavigationStateManager currentState](self, "currentState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enableNavigationCapability:", a3);

}

- (void)acceptReroute:(BOOL)a3 forTrafficIncidentAlert:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[MNNavigationStateManager currentState](self, "currentState");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "acceptReroute:forTrafficIncidentAlert:", v4, v6);

}

- (void)setTraceIsPlaying:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[MNNavigationStateManager currentState](self, "currentState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTraceIsPlaying:", v3);

}

- (void)setTracePlaybackSpeed:(double)a3
{
  id v4;

  -[MNNavigationStateManager currentState](self, "currentState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTracePlaybackSpeed:", a3);

}

- (void)setTracePosition:(double)a3
{
  id v4;

  -[MNNavigationStateManager currentState](self, "currentState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTracePosition:", a3);

}

- (void)recordTraceBookmarkAtCurrentPositionWthScreenshotData:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MNNavigationStateManager currentState](self, "currentState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordTraceBookmarkAtCurrentPositionWthScreenshotData:", v4);

}

- (void)recordPedestrianTracePath:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MNNavigationStateManager currentState](self, "currentState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordPedestrianTracePath:", v4);

}

- (void)setSimulationSpeedOverride:(double)a3
{
  id v4;

  -[MNNavigationStateManager currentState](self, "currentState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSimulationSpeedOverride:", a3);

}

- (void)setSimulationSpeedMultiplier:(double)a3
{
  id v4;

  -[MNNavigationStateManager currentState](self, "currentState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSimulationSpeedMultiplier:", a3);

}

- (void)setSimulationPosition:(double)a3
{
  id v4;

  -[MNNavigationStateManager currentState](self, "currentState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSimulationPosition:", a3);

}

- (void)pauseRealtimeUpdatesForSubscriber:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MNNavigationStateManager currentState](self, "currentState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pauseRealtimeUpdatesForSubscriber:", v4);

}

- (void)resumeRealtimeUpdatesForSubscriber:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MNNavigationStateManager currentState](self, "currentState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resumeRealtimeUpdatesForSubscriber:", v4);

}

- (void)changeOfflineMode:(unsigned __int8)a3
{
  uint64_t v3;
  id v4;

  v3 = a3;
  -[MNNavigationStateManager currentState](self, "currentState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changeOfflineMode:", v3);

}

- (GEOApplicationAuditToken)auditToken
{
  return self->_auditToken;
}

- (MNNavigationSessionManagerDelegate)navigationDelegate
{
  return (MNNavigationSessionManagerDelegate *)objc_loadWeakRetained((id *)&self->_navigationDelegate);
}

- (void)setNavigationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_navigationDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_navigationDelegate);
  objc_storeStrong((id *)&self->_isolater, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_navigationStateObservers, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
}

- (id)navSessionDestination
{
  void *v2;
  void *v3;

  -[MNNavigationStateManager currentState](self, "currentState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "currentDestination");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)transitionToState:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  NSObject *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  id v13;
  const __CFString *v14;
  const __CFString *v15;
  NSObject *v16;
  const __CFString *v17;
  const __CFString *v18;
  void *v19;
  __CFString *v20;
  NSObject *v21;
  uint64_t v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MNNavigationStateManager transitionToState: should be called on the main queue"));
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "[NSThread isMainThread]";
      v25 = 2112;
      v26 = v20;
      _os_log_impl(&dword_1B0AD7000, v21, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }

  }
  -[MNNavigationStateManager currentState](self, "currentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MNNavigationStateManager _stateTypeForState:](self, "_stateTypeForState:", v5);
  v7 = -[MNNavigationStateManager _stateTypeForState:](self, "_stateTypeForState:", v4);
  MNGetMNNavigationStateManagerLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v8))
  {
    if (v6 > 6)
      v9 = CFSTR("MNNavigationStateTypeInvalid");
    else
      v9 = off_1E61D82B8[v6];
    if (v7 > 6)
      v10 = CFSTR("MNNavigationStateTypeInvalid");
    else
      v10 = off_1E61D82B8[v7];
    *(_DWORD *)buf = 138543618;
    v24 = (const char *)v9;
    v25 = 2114;
    v26 = v10;
    _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "TransitionToState", "%{public}@ to %{public}@", buf, 0x16u);
  }
  objc_msgSend(v4, "preEnterState");
  -[MNObserverHashTable stateManager:willChangeFromState:toState:](self->_navigationStateObservers, "stateManager:willChangeFromState:toState:", self, v6, v7);
  objc_msgSend(v5, "leaveState");
  if (objc_msgSend(v4, "requiresLocationAccess"))
  {
    +[MNLocationManager sharedLocationManager](MNLocationManager, "sharedLocationManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "requestLocationAccessFor:", v4);

  }
  -[MNNavigationStateManager _changeToDesiredLocationProviderTypeForState:](self, "_changeToDesiredLocationProviderTypeForState:", v4);
  +[MNLocationManager sharedLocationManager](MNLocationManager, "sharedLocationManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeLocationAccessFor:", v5);

  v22 = MEMORY[0x1E0C809B0];
  v13 = v4;
  geo_isolate_sync();
  objc_msgSend(v13, "enterState", v22, 3221225472, __66__MNNavigationStateManager_StateTransitioning__transitionToState___block_invoke, &unk_1E61D1D10, self);
  if (os_signpost_enabled(v8))
  {
    if (v6 > 6)
      v14 = CFSTR("MNNavigationStateTypeInvalid");
    else
      v14 = off_1E61D82B8[v6];
    if (v7 > 6)
      v15 = CFSTR("MNNavigationStateTypeInvalid");
    else
      v15 = off_1E61D82B8[v7];
    *(_DWORD *)buf = 138543618;
    v24 = (const char *)v14;
    v25 = 2114;
    v26 = v15;
    _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "TransitionToState", "%{public}@ to %{public}@", buf, 0x16u);
  }
  GEOFindOrCreateLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    if (v6 > 6)
      v17 = CFSTR("MNNavigationStateTypeInvalid");
    else
      v17 = off_1E61D82B8[v6];
    if (v7 > 6)
      v18 = CFSTR("MNNavigationStateTypeInvalid");
    else
      v18 = off_1E61D82B8[v7];
    *(_DWORD *)buf = 138412546;
    v24 = (const char *)v17;
    v25 = 2112;
    v26 = v18;
    _os_log_impl(&dword_1B0AD7000, v16, OS_LOG_TYPE_DEFAULT, "Changed from state %@ to %@", buf, 0x16u);
  }

  if (objc_msgSend(v13, "shouldClearStoredRoutes"))
  {
    MNRecommendedDateForClearingRoutes();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    MNClearStoredRoutesWithSubpathUsedBefore(v19, 0);

  }
  -[MNObserverHashTable stateManager:didChangeFromState:toState:](self->_navigationStateObservers, "stateManager:didChangeFromState:toState:", self, v6, v7);
  objc_msgSend(v13, "postEnterState");

}

void __66__MNNavigationStateManager_StateTransitioning__transitionToState___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
}

- (void)_changeToDesiredLocationProviderTypeForState:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  +[MNLocationManager sharedLocationManager](MNLocationManager, "sharedLocationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v4 = objc_msgSend(v6, "desiredLocationProviderType");
  else
    v4 = 0;
  objc_msgSend(v3, "locationProviderType");
  switch(v4)
  {
    case 0:
      objc_msgSend(v3, "stop");
      break;
    case 1:
      objc_msgSend(v6, "clParameters");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "useGPSLocationProviderWithCLParameters:", v5);
      goto LABEL_10;
    case 2:
      objc_msgSend(v3, "useHybridLocationProvider");
      break;
    case 3:
      objc_msgSend(v6, "traceManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "useTraceLocationProvider:", v5);
      goto LABEL_10;
    case 4:
      objc_msgSend(v6, "simulationLocationProvider");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "useSimulationLocationProvider:", v5);
LABEL_10:

      break;
    default:
      break;
  }

}

- (unint64_t)_stateTypeForState:(id)a3
{
  if (a3)
    return objc_msgSend(a3, "type");
  else
    return 0;
}

- (void)setCurrentState:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  geo_isolate_sync();

}

void __53__MNNavigationStateManager_Testing__setCurrentState___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  if (v2 != *(void **)(a1 + 40))
  {
    *(_QWORD *)(v1 + 16) = 0;

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
  }
}

@end
