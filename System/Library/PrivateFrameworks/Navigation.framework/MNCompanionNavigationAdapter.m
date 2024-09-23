@implementation MNCompanionNavigationAdapter

- (MNCompanionNavigationAdapter)init
{
  MNCompanionNavigationAdapter *v2;
  GEONavigationGuidanceState *v3;
  GEONavigationGuidanceState *guidanceState;
  MNNanoFormattedStringFormatter *v5;
  GEOServerFormattedStepStringFormatter *formatter;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MNCompanionNavigationAdapter;
  v2 = -[MNCompanionNavigationAdapter init](&v8, sel_init);
  if (v2)
  {
    v3 = (GEONavigationGuidanceState *)objc_alloc_init(MEMORY[0x1E0D27270]);
    guidanceState = v2->_guidanceState;
    v2->_guidanceState = v3;

    v5 = objc_alloc_init(MNNanoFormattedStringFormatter);
    formatter = v2->_formatter;
    v2->_formatter = (GEOServerFormattedStepStringFormatter *)v5;

  }
  return v2;
}

- (MNCompanionNavigationAdapter)initWithDelegate:(id)a3
{
  id v5;
  MNCompanionNavigationAdapter *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  MNCompanionNavigationAdapter *v10;
  id v11;
  void (**v12)(_QWORD);
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  MNCompanionNavigationAdapter *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = -[MNCompanionNavigationAdapter init](self, "init");
  if (v6)
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v8;
      _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_INFO, "%{public}@", buf, 0xCu);

    }
    objc_storeWeak((id *)&v6->_delegate, v5);
    +[MNNavigationService sharedService](MNNavigationService, "sharedService");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __49__MNCompanionNavigationAdapter_initWithDelegate___block_invoke;
    v17 = &unk_1E61D1D10;
    v10 = v6;
    v18 = v10;
    v11 = v9;
    v19 = v11;
    v12 = (void (**)(_QWORD))MEMORY[0x1B5E0E364](&v14);
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", v14, v15, v16, v17))
      v12[2](v12);
    else
      dispatch_sync(MEMORY[0x1E0C80D38], v12);
    objc_msgSend(v11, "registerObserver:", v10);

  }
  return v6;
}

void __49__MNCompanionNavigationAdapter_initWithDelegate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = objc_msgSend(*(id *)(a1 + 40), "guidancePromptsEnabled");
  objc_msgSend(*(id *)(a1 + 40), "destinationName");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  objc_msgSend(*(id *)(a1 + 40), "route");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = *(void **)(a1 + 32);
    v8 = v5;
    objc_msgSend(v5, "traffic");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setRoute:traffic:isTrace:", v8, v7, objc_msgSend(*(id *)(a1 + 40), "traceIsPlaying"));

    v5 = v8;
  }

}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MNCompanionNavigationAdapter;
  -[MNCompanionNavigationAdapter dealloc](&v2, sel_dealloc);
}

- (BOOL)_isInvalidated
{
  id WeakRetained;
  BOOL v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = WeakRetained == 0;

  return v3;
}

- (void)invalidate
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_INFO, "%{public}@", (uint8_t *)&v6, 0xCu);

  }
  objc_storeWeak((id *)&self->_delegate, 0);
  -[MNCompanionNavigationAdapter _cancelScheduledRouteStatus](self, "_cancelScheduledRouteStatus");
  -[MNCompanionNavigationAdapter _cancelScheduledRouteUpdates](self, "_cancelScheduledRouteUpdates");
  -[MNCompanionNavigationAdapter _reset](self, "_reset");
}

- (void)_reset
{
  NSObject *v4;
  void *v5;
  GEOCompanionRouteDetails *companionRouteDetails;
  GEOCompanionRouteStatus *companionRouteStatus;
  NSArray *companionRouteUpdates;
  NSString *destinationName;
  GEOComposedRoute *route;
  GEOLocation *lastLocation;
  GEORouteMatch *routeMatch;
  GEONavigationGuidanceState *v13;
  GEONavigationGuidanceState *guidanceState;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v5;
    _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_INFO, "%{public}@", (uint8_t *)&v15, 0xCu);

  }
  -[MNCompanionNavigationAdapter _cancelScheduledRouteStatus](self, "_cancelScheduledRouteStatus");
  -[MNCompanionNavigationAdapter _cancelScheduledRouteUpdates](self, "_cancelScheduledRouteUpdates");
  companionRouteDetails = self->_companionRouteDetails;
  self->_companionRouteDetails = 0;

  companionRouteStatus = self->_companionRouteStatus;
  self->_companionRouteStatus = 0;

  companionRouteUpdates = self->_companionRouteUpdates;
  self->_companionRouteUpdates = 0;

  self->_shouldSendRouteWithStatus = 0;
  destinationName = self->_destinationName;
  self->_destinationName = 0;

  route = self->_route;
  self->_route = 0;

  lastLocation = self->_lastLocation;
  self->_lastLocation = 0;

  routeMatch = self->_routeMatch;
  self->_routeMatch = 0;

  v13 = (GEONavigationGuidanceState *)objc_alloc_init(MEMORY[0x1E0D27270]);
  guidanceState = self->_guidanceState;
  self->_guidanceState = v13;

  self->_locationUnreliable = 0;
  self->_displayedStepIndex = 0x7FFFFFFFFFFFFFFFLL;
  self->_positionFromManeuver = -1.0;
  self->_positionFromDestination = ($5ED2722C8710615E66118753FC41CC89)*MEMORY[0x1E0D26448];
  self->_announcementStage = 0;
  self->_nextAnnouncementStage = 0;
  self->_timeUntilNextAnnouncement = 1.79769313e308;
  self->_shouldSendRouteWithStatus = 0;
}

- (void)setIsNavigatingInLowGuidance:(BOOL)a3
{
  if (self->_isNavigatingInLowGuidance != a3)
  {
    self->_isNavigatingInLowGuidance = a3;
    -[GEOCompanionRouteStatus setLowGuidanceNavigation:](self->_companionRouteStatus, "setLowGuidanceNavigation:");
    -[MNCompanionNavigationAdapter _scheduleCoalescedRouteStatusUpdate](self, "_scheduleCoalescedRouteStatusUpdate");
  }
}

- (void)setIsConnectedToCarplay:(BOOL)a3
{
  if (self->_isConnectedToCarplay != a3)
  {
    self->_isConnectedToCarplay = a3;
    -[GEOCompanionRouteStatus setIsConnectedToCarplay:](self->_companionRouteStatus, "setIsConnectedToCarplay:");
    -[MNCompanionNavigationAdapter _scheduleCoalescedRouteStatusUpdate](self, "_scheduleCoalescedRouteStatusUpdate");
  }
}

- (void)_updateNavigationStatesOnRouteStatus
{
  -[GEOCompanionRouteStatus updateFeedbackWithNavigationState:locationUnreliable:announcementStage:nextAnnouncementStage:nextAnnouncementTime:](self->_companionRouteStatus, "updateFeedbackWithNavigationState:locationUnreliable:announcementStage:nextAnnouncementStage:nextAnnouncementTime:", -[GEONavigationGuidanceState navigationState](self->_guidanceState, "navigationState"), self->_locationUnreliable, self->_announcementStage, self->_nextAnnouncementStage, self->_timeUntilNextAnnouncement);
}

- (void)_setRoute:(id)a3 traffic:(id)a4 isTrace:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  GEOCompanionRouteDetails *v10;
  GEOCompanionRouteDetails *companionRouteDetails;
  id v12;
  void *v13;
  GEOCompanionRouteStatus *v14;
  GEOCompanionRouteStatus *companionRouteStatus;
  GEOComposedRoute *v16;

  v5 = a5;
  v16 = (GEOComposedRoute *)a3;
  v9 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (v16 && self->_route != v16)
  {
    objc_storeStrong((id *)&self->_route, a3);
    v10 = (GEOCompanionRouteDetails *)objc_msgSend(objc_alloc(MEMORY[0x1E0D26F78]), "initWithRoute:destinationName:stringFormatter:traffic:", v16, self->_destinationName, self->_formatter, v9);
    companionRouteDetails = self->_companionRouteDetails;
    self->_companionRouteDetails = v10;

    -[GEOCompanionRouteDetails setCanNavigate:](self->_companionRouteDetails, "setCanNavigate:", -[GEOComposedRoute isNavigableForWatch](v16, "isNavigableForWatch"));
    -[GEOCompanionRouteDetails setIsTrace:](self->_companionRouteDetails, "setIsTrace:", v5);
    v12 = objc_alloc(MEMORY[0x1E0D26F80]);
    -[GEOCompanionRouteDetails routeID](self->_companionRouteDetails, "routeID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (GEOCompanionRouteStatus *)objc_msgSend(v12, "initWithRoute:routeID:", v16, v13);
    companionRouteStatus = self->_companionRouteStatus;
    self->_companionRouteStatus = v14;

    -[GEOCompanionRouteStatus setGuidancePromptsEnabled:](self->_companionRouteStatus, "setGuidancePromptsEnabled:", self->_guidancePromptsEnabled);
    -[GEOCompanionRouteStatus setIsConnectedToCarplay:](self->_companionRouteStatus, "setIsConnectedToCarplay:", self->_isConnectedToCarplay);
    -[GEOCompanionRouteStatus setLowGuidanceNavigation:](self->_companionRouteStatus, "setLowGuidanceNavigation:", self->_isNavigatingInLowGuidance);
    -[GEOCompanionRouteStatus setStepID:](self->_companionRouteStatus, "setStepID:", 0);
    -[MNCompanionNavigationAdapter _populateInitialDistanceToManeuver](self, "_populateInitialDistanceToManeuver");
    -[MNCompanionNavigationAdapter _updateNavigationStatesOnRouteStatus](self, "_updateNavigationStatesOnRouteStatus");
    -[MNCompanionNavigationAdapter _setIsOfflineStatus:](self, "_setIsOfflineStatus:", -[GEOComposedRoute isOfflineRoute](v16, "isOfflineRoute"));
    self->_displayedStepIndex = 0x7FFFFFFFFFFFFFFFLL;
    if (!-[GEOCompanionRouteStatus feedbackType](self->_companionRouteStatus, "feedbackType"))
      -[GEOCompanionRouteStatus setFeedbackType:](self->_companionRouteStatus, "setFeedbackType:", 1);
    self->_shouldSendRouteWithStatus = 1;
    -[MNCompanionNavigationAdapter _scheduleCoalescedRouteStatusUpdate](self, "_scheduleCoalescedRouteStatusUpdate");
  }

}

- (void)_populateInitialDistanceToManeuver
{
  unsigned int v3;
  void *v4;
  float v5;
  id v6;

  v3 = -[GEOCompanionRouteStatus stepID](self->_companionRouteStatus, "stepID");
  if (-[GEOCompanionRouteDetails stepsCount](self->_companionRouteDetails, "stepsCount") <= (unint64_t)v3)
  {
    v6 = 0;
  }
  else
  {
    -[GEOCompanionRouteDetails steps](self->_companionRouteDetails, "steps");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", v3);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v6, "hasDistanceMeters"))
  {
    objc_msgSend(v6, "distanceMeters");
    -[MNCompanionNavigationAdapter _setPositionFromManeuver:](self, "_setPositionFromManeuver:", v5);
  }

}

- (void)_setNavigationState:(int)a3
{
  uint64_t v3;
  NSObject *v6;
  id v7;
  uint64_t v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  __CFString *v15;
  __int16 v16;
  __CFString *v17;
  uint64_t v18;

  v3 = *(_QWORD *)&a3;
  v18 = *MEMORY[0x1E0C80C00];
  if (-[GEONavigationGuidanceState navigationState](self->_guidanceState, "navigationState") != a3)
  {
    -[GEONavigationGuidanceState setNavigationState:](self->_guidanceState, "setNavigationState:", v3);
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v8 = -[GEONavigationGuidanceState navigationState](self->_guidanceState, "navigationState");
      if (v8 >= 9)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = off_1E61D3660[(int)v8];
      }
      v10 = v9;
      if (v3 >= 9)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v3);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = off_1E61D3660[(int)v3];
      }
      *(_DWORD *)buf = 138543874;
      v13 = v7;
      v14 = 2114;
      v15 = v10;
      v16 = 2114;
      v17 = v11;
      _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_INFO, "%{public}@ navigationState is now %{public}@ / %{public}@", buf, 0x20u);

    }
    -[MNCompanionNavigationAdapter _updateNavigationStatesOnRouteStatus](self, "_updateNavigationStatesOnRouteStatus");
    -[MNCompanionNavigationAdapter _scheduleCoalescedRouteStatusUpdate](self, "_scheduleCoalescedRouteStatusUpdate");
  }
}

- (void)_setLastLocation:(id)a3
{
  void *v5;
  GEOLocation *v6;

  v6 = (GEOLocation *)a3;
  if (self->_lastLocation != v6)
  {
    objc_storeStrong((id *)&self->_lastLocation, a3);
    -[GEOCompanionRouteStatus setLocation:](self->_companionRouteStatus, "setLocation:", v6);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    -[GEOCompanionRouteStatus setTimestamp:](self->_companionRouteStatus, "setTimestamp:");

    -[MNCompanionNavigationAdapter _scheduleCoalescedRouteStatusUpdate](self, "_scheduleCoalescedRouteStatusUpdate");
  }

}

- (void)_setLocationUnreliable:(BOOL)a3
{
  if (self->_locationUnreliable != a3)
  {
    self->_locationUnreliable = a3;
    -[MNCompanionNavigationAdapter _updateNavigationStatesOnRouteStatus](self, "_updateNavigationStatesOnRouteStatus");
    -[MNCompanionNavigationAdapter _scheduleCoalescedRouteStatusUpdate](self, "_scheduleCoalescedRouteStatusUpdate");
  }
}

- (void)_setRouteMatch:(id)a3
{
  GEORouteMatch *v5;
  double v6;
  double v7;
  uint64_t v8;
  id v9;
  void *v10;
  GEORouteMatch *v11;

  v5 = (GEORouteMatch *)a3;
  if (self->_routeMatch != v5)
  {
    v11 = v5;
    objc_storeStrong((id *)&self->_routeMatch, a3);
    if (self->_displayedStepIndex == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[GEOCompanionRouteStatus setStepID:](self->_companionRouteStatus, "setStepID:", -[GEORouteMatch stepIndex](v11, "stepIndex"));
      -[MNCompanionNavigationAdapter _populateInitialDistanceToManeuver](self, "_populateInitialDistanceToManeuver");
    }
    -[GEOCompanionRouteStatus setRouteLocationIndex:](self->_companionRouteStatus, "setRouteLocationIndex:", -[GEORouteMatch routeCoordinate](v11, "routeCoordinate"));
    LODWORD(v6) = (unint64_t)-[GEORouteMatch routeCoordinate](v11, "routeCoordinate") >> 32;
    -[GEOCompanionRouteStatus setRouteLocationOffset:](self->_companionRouteStatus, "setRouteLocationOffset:", v6);
    -[GEORouteMatch distanceFromRoute](v11, "distanceFromRoute");
    LODWORD(v8) = vcvtad_u64_f64(v7);
    -[GEOCompanionRouteStatus setDistanceToRoute:](self->_companionRouteStatus, "setDistanceToRoute:", v8);
    if (v11)
    {
      v9 = objc_alloc(MEMORY[0x1E0D27140]);
      -[GEORouteMatch locationCoordinate](v11, "locationCoordinate");
      v10 = (void *)objc_msgSend(v9, "initWithCoordinate:");
      -[GEOCompanionRouteStatus setRouteMatchCoordinate:](self->_companionRouteStatus, "setRouteMatchCoordinate:", v10);

    }
    -[MNCompanionNavigationAdapter _scheduleCoalescedRouteStatusUpdate](self, "_scheduleCoalescedRouteStatusUpdate");
    v5 = v11;
  }

}

- (void)_setDestinationName:(id)a3
{
  id v4;
  NSString *destinationName;
  BOOL v6;
  NSString *v7;
  NSString *v8;
  id v9;

  v4 = a3;
  destinationName = self->_destinationName;
  v9 = v4;
  if (!destinationName || (v6 = -[NSString isEqualToString:](destinationName, "isEqualToString:", v4), v4 = v9, !v6))
  {
    v7 = (NSString *)objc_msgSend(v4, "copy");
    v8 = self->_destinationName;
    self->_destinationName = v7;

    -[GEOCompanionRouteDetails setDestinationName:](self->_companionRouteDetails, "setDestinationName:", self->_destinationName);
    self->_shouldSendRouteWithStatus = 1;
    -[MNCompanionNavigationAdapter _scheduleCoalescedRouteStatusUpdate](self, "_scheduleCoalescedRouteStatusUpdate");
    v4 = v9;
  }

}

- (void)_setIsOfflineStatus:(BOOL)a3
{
  -[GEOCompanionRouteStatus setIsOffline:](self->_companionRouteStatus, "setIsOffline:", a3);
}

- (void)_setGuidancePromptsEnabled:(BOOL)a3
{
  if (self->_guidancePromptsEnabled != a3)
  {
    self->_guidancePromptsEnabled = a3;
    -[GEOCompanionRouteStatus setGuidancePromptsEnabled:](self->_companionRouteStatus, "setGuidancePromptsEnabled:");
    -[MNCompanionNavigationAdapter _scheduleCoalescedRouteStatusUpdate](self, "_scheduleCoalescedRouteStatusUpdate");
  }
}

- (void)_setActiveStepIndex:(unint64_t)a3
{
  if (self->_activeStepIndex != a3)
  {
    self->_activeStepIndex = a3;
    if (-[GEONavigationGuidanceState navigationState](self->_guidanceState, "navigationState") != 6
      && -[GEONavigationGuidanceState navigationState](self->_guidanceState, "navigationState") != 7)
    {
      -[GEOCompanionRouteStatus setFeedbackType:](self->_companionRouteStatus, "setFeedbackType:", 2);
    }
    -[GEOCompanionRouteStatus setStepID:](self->_companionRouteStatus, "setStepID:", a3);
    -[MNCompanionNavigationAdapter _populateInitialDistanceToManeuver](self, "_populateInitialDistanceToManeuver");
    -[MNCompanionNavigationAdapter _scheduleCoalescedRouteStatusUpdate](self, "_scheduleCoalescedRouteStatusUpdate");
  }
}

- (void)_setDisplayedStepIndex:(unint64_t)a3
{
  if (self->_displayedStepIndex != a3)
  {
    self->_displayedStepIndex = a3;
    if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[GEOCompanionRouteStatus setDisplayedStepID:](self->_companionRouteStatus, "setDisplayedStepID:", 0);
      -[GEOCompanionRouteStatus setHasDisplayedStepID:](self->_companionRouteStatus, "setHasDisplayedStepID:", 0);
    }
    else
    {
      -[GEOCompanionRouteStatus setDisplayedStepID:](self->_companionRouteStatus, "setDisplayedStepID:");
    }
    -[MNCompanionNavigationAdapter _scheduleCoalescedRouteStatusUpdate](self, "_scheduleCoalescedRouteStatusUpdate");
  }
}

- (void)_setPositionFromManeuver:(double)a3
{
  uint64_t v3;
  double positionFromManeuver;

  positionFromManeuver = self->_positionFromManeuver;
  self->_positionFromManeuver = a3;
  if (vabdd_f64(a3, positionFromManeuver) >= 2.22044605e-16)
  {
    LODWORD(v3) = vcvtad_u64_f64(a3);
    -[GEOCompanionRouteStatus setDistanceToManeuver:](self->_companionRouteStatus, "setDistanceToManeuver:", v3);
    -[MNCompanionNavigationAdapter _scheduleCoalescedRouteStatusUpdate](self, "_scheduleCoalescedRouteStatusUpdate");
  }
}

- (void)_setPositionFromDestination:(id)a3
{
  uint64_t v3;
  double var0;
  double remainingDistance;
  double remainingTime;
  uint64_t v8;

  var0 = a3.var0;
  remainingTime = self->_positionFromDestination.remainingTime;
  remainingDistance = self->_positionFromDestination.remainingDistance;
  self->_positionFromDestination.remainingTime = var0;
  self->_positionFromDestination.remainingDistance = a3.var1;
  if (vabdd_f64(remainingTime, var0) >= 0.01
    || (remainingDistance = vabdd_f64(remainingDistance, a3.var1), remainingDistance >= 0.01))
  {
    LODWORD(v3) = vcvtad_u64_f64(a3.var1);
    -[GEOCompanionRouteStatus setDistanceRemainingOnRoute:](self->_companionRouteStatus, "setDistanceRemainingOnRoute:", v3, remainingDistance);
    LODWORD(v8) = vcvtmd_u64_f64(var0);
    -[GEOCompanionRouteStatus setRemainingTime:](self->_companionRouteStatus, "setRemainingTime:", v8);
    -[MNCompanionNavigationAdapter _scheduleCoalescedRouteStatusUpdate](self, "_scheduleCoalescedRouteStatusUpdate");
  }
}

- (void)_setAnnouncementStage:(unint64_t)a3
{
  NSObject *v6;
  void *v7;
  unint64_t announcementStage;
  int v9;
  void *v10;
  __int16 v11;
  unint64_t v12;
  __int16 v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_announcementStage != a3)
  {
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      announcementStage = self->_announcementStage;
      v9 = 138543874;
      v10 = v7;
      v11 = 2048;
      v12 = announcementStage;
      v13 = 2048;
      v14 = a3;
      _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_INFO, "%{public}@ changing announcementStage from %lu to %lu", (uint8_t *)&v9, 0x20u);

    }
    self->_announcementStage = a3;
    -[MNCompanionNavigationAdapter _updateNavigationStatesOnRouteStatus](self, "_updateNavigationStatesOnRouteStatus");
    -[MNCompanionNavigationAdapter _scheduleCoalescedRouteStatusUpdate](self, "_scheduleCoalescedRouteStatusUpdate");
  }
}

- (void)_setNextAnnouncementStage:(unint64_t)a3 timeUntilNextAnnouncement:(double)a4
{
  NSObject *v8;
  void *v9;
  unint64_t nextAnnouncementStage;
  int v11;
  void *v12;
  __int16 v13;
  unint64_t v14;
  __int16 v15;
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_nextAnnouncementStage != a3)
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      nextAnnouncementStage = self->_nextAnnouncementStage;
      v11 = 138543874;
      v12 = v9;
      v13 = 2048;
      v14 = nextAnnouncementStage;
      v15 = 2048;
      v16 = a3;
      _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_INFO, "%{public}@ changing nextAnnouncementStage from %lu to %lu", (uint8_t *)&v11, 0x20u);

    }
  }
  self->_nextAnnouncementStage = a3;
  self->_timeUntilNextAnnouncement = a4;
  -[MNCompanionNavigationAdapter _updateNavigationStatesOnRouteStatus](self, "_updateNavigationStatesOnRouteStatus");
  -[MNCompanionNavigationAdapter _scheduleCoalescedRouteStatusUpdate](self, "_scheduleCoalescedRouteStatusUpdate");
}

- (void)_setRealtimeUpdates:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSArray *v14;
  NSArray *companionRouteUpdates;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v11, "transitUpdate", (_QWORD)v16);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D26F88]), "initWithTransitRouteUpdate:", v12);
            objc_msgSend(v5, "addObject:", v13);

          }
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v14 = (NSArray *)objc_msgSend(v5, "copy");
  companionRouteUpdates = self->_companionRouteUpdates;
  self->_companionRouteUpdates = v14;

  -[MNCompanionNavigationAdapter _scheduleCoalescedRouteUpdates](self, "_scheduleCoalescedRouteUpdates");
}

- (void)_setTransitAlightMessage:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  GEOFindOrCreateLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_INFO, "%@ %@", (uint8_t *)&v8, 0x16u);

  }
  -[GEOCompanionRouteStatus setAlightMessage:](self->_companionRouteStatus, "setAlightMessage:", v5);
  -[MNCompanionNavigationAdapter _scheduleCoalescedRouteStatusUpdate](self, "_scheduleCoalescedRouteStatusUpdate");

}

- (void)_triggerHaptics:(int)a3
{
  uint64_t v3;
  NSObject *v6;
  id v7;
  __CFString *v8;
  uint8_t buf[4];
  id v10;
  __int16 v11;
  __CFString *v12;
  uint64_t v13;

  v3 = *(_QWORD *)&a3;
  v13 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = CFSTR("NO_TURN");
    switch((int)v3)
    {
      case 0:
        break;
      case 1:
        v8 = CFSTR("LEFT_TURN");
        break;
      case 2:
        v8 = CFSTR("RIGHT_TURN");
        break;
      case 3:
        v8 = CFSTR("STRAIGHT_AHEAD");
        break;
      case 4:
        v8 = CFSTR("U_TURN");
        break;
      case 5:
        v8 = CFSTR("FOLLOW_ROAD");
        break;
      case 6:
        v8 = CFSTR("ENTER_ROUNDABOUT");
        break;
      case 7:
        v8 = CFSTR("EXIT_ROUNDABOUT");
        break;
      case 11:
        v8 = CFSTR("OFF_RAMP");
        break;
      case 12:
        v8 = CFSTR("ON_RAMP");
        break;
      case 16:
        v8 = CFSTR("ARRIVE_END_OF_NAVIGATION");
        break;
      case 17:
        v8 = CFSTR("START_ROUTE");
        break;
      case 18:
        v8 = CFSTR("ARRIVE_AT_DESTINATION");
        break;
      case 20:
        v8 = CFSTR("KEEP_LEFT");
        break;
      case 21:
        v8 = CFSTR("KEEP_RIGHT");
        break;
      case 22:
        v8 = CFSTR("ENTER_FERRY");
        break;
      case 23:
        v8 = CFSTR("EXIT_FERRY");
        break;
      case 24:
        v8 = CFSTR("CHANGE_FERRY");
        break;
      case 25:
        v8 = CFSTR("START_ROUTE_WITH_U_TURN");
        break;
      case 26:
        v8 = CFSTR("U_TURN_AT_ROUNDABOUT");
        break;
      case 27:
        v8 = CFSTR("LEFT_TURN_AT_END");
        break;
      case 28:
        v8 = CFSTR("RIGHT_TURN_AT_END");
        break;
      case 29:
        v8 = CFSTR("HIGHWAY_OFF_RAMP_LEFT");
        break;
      case 30:
        v8 = CFSTR("HIGHWAY_OFF_RAMP_RIGHT");
        break;
      case 33:
        v8 = CFSTR("ARRIVE_AT_DESTINATION_LEFT");
        break;
      case 34:
        v8 = CFSTR("ARRIVE_AT_DESTINATION_RIGHT");
        break;
      case 35:
        v8 = CFSTR("U_TURN_WHEN_POSSIBLE");
        break;
      case 39:
        v8 = CFSTR("ARRIVE_END_OF_DIRECTIONS");
        break;
      case 41:
        v8 = CFSTR("ROUNDABOUT_EXIT_1");
        break;
      case 42:
        v8 = CFSTR("ROUNDABOUT_EXIT_2");
        break;
      case 43:
        v8 = CFSTR("ROUNDABOUT_EXIT_3");
        break;
      case 44:
        v8 = CFSTR("ROUNDABOUT_EXIT_4");
        break;
      case 45:
        v8 = CFSTR("ROUNDABOUT_EXIT_5");
        break;
      case 46:
        v8 = CFSTR("ROUNDABOUT_EXIT_6");
        break;
      case 47:
        v8 = CFSTR("ROUNDABOUT_EXIT_7");
        break;
      case 48:
        v8 = CFSTR("ROUNDABOUT_EXIT_8");
        break;
      case 49:
        v8 = CFSTR("ROUNDABOUT_EXIT_9");
        break;
      case 50:
        v8 = CFSTR("ROUNDABOUT_EXIT_10");
        break;
      case 51:
        v8 = CFSTR("ROUNDABOUT_EXIT_11");
        break;
      case 52:
        v8 = CFSTR("ROUNDABOUT_EXIT_12");
        break;
      case 53:
        v8 = CFSTR("ROUNDABOUT_EXIT_13");
        break;
      case 54:
        v8 = CFSTR("ROUNDABOUT_EXIT_14");
        break;
      case 55:
        v8 = CFSTR("ROUNDABOUT_EXIT_15");
        break;
      case 56:
        v8 = CFSTR("ROUNDABOUT_EXIT_16");
        break;
      case 57:
        v8 = CFSTR("ROUNDABOUT_EXIT_17");
        break;
      case 58:
        v8 = CFSTR("ROUNDABOUT_EXIT_18");
        break;
      case 59:
        v8 = CFSTR("ROUNDABOUT_EXIT_19");
        break;
      case 60:
        v8 = CFSTR("SHARP_LEFT_TURN");
        break;
      case 61:
        v8 = CFSTR("SHARP_RIGHT_TURN");
        break;
      case 62:
        v8 = CFSTR("SLIGHT_LEFT_TURN");
        break;
      case 63:
        v8 = CFSTR("SLIGHT_RIGHT_TURN");
        break;
      case 64:
        v8 = CFSTR("CHANGE_HIGHWAY");
        break;
      case 65:
        v8 = CFSTR("CHANGE_HIGHWAY_LEFT");
        break;
      case 66:
        v8 = CFSTR("CHANGE_HIGHWAY_RIGHT");
        break;
      case 80:
        v8 = CFSTR("TOLL_STATION");
        break;
      case 81:
        v8 = CFSTR("ENTER_TUNNEL");
        break;
      case 82:
        v8 = CFSTR("WAYPOINT_STOP");
        break;
      case 83:
        v8 = CFSTR("WAYPOINT_STOP_LEFT");
        break;
      case 84:
        v8 = CFSTR("WAYPOINT_STOP_RIGHT");
        break;
      case 85:
        v8 = CFSTR("RESUME_ROUTE");
        break;
      case 86:
        v8 = CFSTR("RESUME_ROUTE_WITH_U_TURN");
        break;
      case 87:
        v8 = CFSTR("CUSTOM");
        break;
      case 88:
        v8 = CFSTR("TURN_AROUND");
        break;
      default:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v3);
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
    }
    *(_DWORD *)buf = 138543618;
    v10 = v7;
    v11 = 2114;
    v12 = v8;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_INFO, "%{public}@ %{public}@", buf, 0x16u);

  }
  -[GEOCompanionRouteStatus setHapticsType:](self->_companionRouteStatus, "setHapticsType:", v3);
  -[MNCompanionNavigationAdapter _scheduleCoalescedRouteStatusUpdate](self, "_scheduleCoalescedRouteStatusUpdate");
}

- (void)_scheduleCoalescedRouteStatusUpdate
{
  NSTimer *v3;
  NSTimer *coalescedRouteStatusTimer;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (!self->_coalescedRouteStatusTimer && !-[MNCompanionNavigationAdapter _isInvalidated](self, "_isInvalidated"))
  {
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__sendRouteStatus, 0, 0, 0.1);
    v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    coalescedRouteStatusTimer = self->_coalescedRouteStatusTimer;
    self->_coalescedRouteStatusTimer = v3;

  }
}

- (void)_cancelScheduledRouteStatus
{
  NSTimer *coalescedRouteStatusTimer;

  if (self->_coalescedRouteStatusTimer)
  {
    dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
    -[NSTimer invalidate](self->_coalescedRouteStatusTimer, "invalidate");
    coalescedRouteStatusTimer = self->_coalescedRouteStatusTimer;
    self->_coalescedRouteStatusTimer = 0;

  }
}

- (void)_scheduleCoalescedRouteUpdates
{
  NSTimer *v3;
  NSTimer *coalescedRouteUpdatesTimer;

  if (!self->_coalescedRouteUpdatesTimer && !-[MNCompanionNavigationAdapter _isInvalidated](self, "_isInvalidated"))
  {
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__sendRouteUpdates, 0, 0, 0.0);
    v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    coalescedRouteUpdatesTimer = self->_coalescedRouteUpdatesTimer;
    self->_coalescedRouteUpdatesTimer = v3;

  }
}

- (void)_cancelScheduledRouteUpdates
{
  NSTimer *coalescedRouteUpdatesTimer;
  NSTimer *v4;

  coalescedRouteUpdatesTimer = self->_coalescedRouteUpdatesTimer;
  if (coalescedRouteUpdatesTimer)
  {
    -[NSTimer invalidate](coalescedRouteUpdatesTimer, "invalidate");
    v4 = self->_coalescedRouteUpdatesTimer;
    self->_coalescedRouteUpdatesTimer = 0;

  }
}

- (void)_sendRouteDetailsAndStatus
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  BOOL v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (void *)-[GEOCompanionRouteDetails copy](self->_companionRouteDetails, "copy");
  v5 = (void *)-[GEOCompanionRouteStatus copy](self->_companionRouteStatus, "copy");
  v6 = v5;
  if (v4 && !objc_msgSend(v5, "hasFeedbackType"))
  {
    v10 = 1;
  }
  else
  {
    -[MNCompanionNavigationAdapter _cancelScheduledRouteStatus](self, "_cancelScheduledRouteStatus");
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v8;
      _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_INFO, "%{public}@", (uint8_t *)&v11, 0xCu);

    }
    -[MNCompanionNavigationAdapter delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateNavigationRouteDetails:routeStatus:", v4, v6);

    v10 = 0;
  }
  self->_shouldSendRouteWithStatus = v10;

}

- (void)_sendRouteStatus
{
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[MNCompanionNavigationAdapter _cancelScheduledRouteStatus](self, "_cancelScheduledRouteStatus");
  v4 = (void *)-[GEOCompanionRouteStatus copy](self->_companionRouteStatus, "copy");
  if ((objc_msgSend(v4, "hasFeedbackType") & 1) != 0)
  {
    if (self->_shouldSendRouteWithStatus)
    {
      -[MNCompanionNavigationAdapter _sendRouteDetailsAndStatus](self, "_sendRouteDetailsAndStatus");
    }
    else
    {
      GEOFindOrCreateLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138543362;
        v11 = v8;
        _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_INFO, "%{public}@", (uint8_t *)&v10, 0xCu);

      }
      -[MNCompanionNavigationAdapter delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "updateNavigationRouteStatus:", v4);

    }
    -[MNCompanionNavigationAdapter _markCurrentHapticsAsTriggered](self, "_markCurrentHapticsAsTriggered");
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v6;
      v12 = 2114;
      v13 = CFSTR("early return; no feedback type");
      _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_INFO, "%{public}@ %{public}@", (uint8_t *)&v10, 0x16u);

    }
  }

}

- (void)_sendRouteUpdates
{
  NSArray *v4;
  NSArray *companionRouteUpdates;
  NSObject *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[MNCompanionNavigationAdapter _cancelScheduledRouteUpdates](self, "_cancelScheduledRouteUpdates");
  v4 = self->_companionRouteUpdates;
  if (-[NSArray count](v4, "count"))
  {
    companionRouteUpdates = self->_companionRouteUpdates;
    self->_companionRouteUpdates = 0;

    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v7;
      _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_INFO, "%{public}@", buf, 0xCu);

    }
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = v4;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12);
          -[MNCompanionNavigationAdapter delegate](self, "delegate", (_QWORD)v15);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "updateNavigationRouteWithUpdate:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

  }
}

- (void)_markCurrentHapticsAsTriggered
{
  __CFString *v2;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[GEOCompanionRouteStatus hasHapticsType](self->_companionRouteStatus, "hasHapticsType");
    if (v7)
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      v9 = -[GEOCompanionRouteStatus hapticsType](self->_companionRouteStatus, "hapticsType");
      v2 = CFSTR("NO_TURN");
      switch((int)v9)
      {
        case 0:
          break;
        case 1:
          v2 = CFSTR("LEFT_TURN");
          break;
        case 2:
          v2 = CFSTR("RIGHT_TURN");
          break;
        case 3:
          v2 = CFSTR("STRAIGHT_AHEAD");
          break;
        case 4:
          v2 = CFSTR("U_TURN");
          break;
        case 5:
          v2 = CFSTR("FOLLOW_ROAD");
          break;
        case 6:
          v2 = CFSTR("ENTER_ROUNDABOUT");
          break;
        case 7:
          v2 = CFSTR("EXIT_ROUNDABOUT");
          break;
        case 11:
          v2 = CFSTR("OFF_RAMP");
          break;
        case 12:
          v2 = CFSTR("ON_RAMP");
          break;
        case 16:
          v2 = CFSTR("ARRIVE_END_OF_NAVIGATION");
          break;
        case 17:
          v2 = CFSTR("START_ROUTE");
          break;
        case 18:
          v2 = CFSTR("ARRIVE_AT_DESTINATION");
          break;
        case 20:
          v2 = CFSTR("KEEP_LEFT");
          break;
        case 21:
          v2 = CFSTR("KEEP_RIGHT");
          break;
        case 22:
          v2 = CFSTR("ENTER_FERRY");
          break;
        case 23:
          v2 = CFSTR("EXIT_FERRY");
          break;
        case 24:
          v2 = CFSTR("CHANGE_FERRY");
          break;
        case 25:
          v2 = CFSTR("START_ROUTE_WITH_U_TURN");
          break;
        case 26:
          v2 = CFSTR("U_TURN_AT_ROUNDABOUT");
          break;
        case 27:
          v2 = CFSTR("LEFT_TURN_AT_END");
          break;
        case 28:
          v2 = CFSTR("RIGHT_TURN_AT_END");
          break;
        case 29:
          v2 = CFSTR("HIGHWAY_OFF_RAMP_LEFT");
          break;
        case 30:
          v2 = CFSTR("HIGHWAY_OFF_RAMP_RIGHT");
          break;
        case 33:
          v2 = CFSTR("ARRIVE_AT_DESTINATION_LEFT");
          break;
        case 34:
          v2 = CFSTR("ARRIVE_AT_DESTINATION_RIGHT");
          break;
        case 35:
          v2 = CFSTR("U_TURN_WHEN_POSSIBLE");
          break;
        case 39:
          v2 = CFSTR("ARRIVE_END_OF_DIRECTIONS");
          break;
        case 41:
          v2 = CFSTR("ROUNDABOUT_EXIT_1");
          break;
        case 42:
          v2 = CFSTR("ROUNDABOUT_EXIT_2");
          break;
        case 43:
          v2 = CFSTR("ROUNDABOUT_EXIT_3");
          break;
        case 44:
          v2 = CFSTR("ROUNDABOUT_EXIT_4");
          break;
        case 45:
          v2 = CFSTR("ROUNDABOUT_EXIT_5");
          break;
        case 46:
          v2 = CFSTR("ROUNDABOUT_EXIT_6");
          break;
        case 47:
          v2 = CFSTR("ROUNDABOUT_EXIT_7");
          break;
        case 48:
          v2 = CFSTR("ROUNDABOUT_EXIT_8");
          break;
        case 49:
          v2 = CFSTR("ROUNDABOUT_EXIT_9");
          break;
        case 50:
          v2 = CFSTR("ROUNDABOUT_EXIT_10");
          break;
        case 51:
          v2 = CFSTR("ROUNDABOUT_EXIT_11");
          break;
        case 52:
          v2 = CFSTR("ROUNDABOUT_EXIT_12");
          break;
        case 53:
          v2 = CFSTR("ROUNDABOUT_EXIT_13");
          break;
        case 54:
          v2 = CFSTR("ROUNDABOUT_EXIT_14");
          break;
        case 55:
          v2 = CFSTR("ROUNDABOUT_EXIT_15");
          break;
        case 56:
          v2 = CFSTR("ROUNDABOUT_EXIT_16");
          break;
        case 57:
          v2 = CFSTR("ROUNDABOUT_EXIT_17");
          break;
        case 58:
          v2 = CFSTR("ROUNDABOUT_EXIT_18");
          break;
        case 59:
          v2 = CFSTR("ROUNDABOUT_EXIT_19");
          break;
        case 60:
          v2 = CFSTR("SHARP_LEFT_TURN");
          break;
        case 61:
          v2 = CFSTR("SHARP_RIGHT_TURN");
          break;
        case 62:
          v2 = CFSTR("SLIGHT_LEFT_TURN");
          break;
        case 63:
          v2 = CFSTR("SLIGHT_RIGHT_TURN");
          break;
        case 64:
          v2 = CFSTR("CHANGE_HIGHWAY");
          break;
        case 65:
          v2 = CFSTR("CHANGE_HIGHWAY_LEFT");
          break;
        case 66:
          v2 = CFSTR("CHANGE_HIGHWAY_RIGHT");
          break;
        case 80:
          v2 = CFSTR("TOLL_STATION");
          break;
        case 81:
          v2 = CFSTR("ENTER_TUNNEL");
          break;
        case 82:
          v2 = CFSTR("WAYPOINT_STOP");
          break;
        case 83:
          v2 = CFSTR("WAYPOINT_STOP_LEFT");
          break;
        case 84:
          v2 = CFSTR("WAYPOINT_STOP_RIGHT");
          break;
        case 85:
          v2 = CFSTR("RESUME_ROUTE");
          break;
        case 86:
          v2 = CFSTR("RESUME_ROUTE_WITH_U_TURN");
          break;
        case 87:
          v2 = CFSTR("CUSTOM");
          break;
        case 88:
          v2 = CFSTR("TURN_AROUND");
          break;
        default:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v9);
          v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
          break;
      }
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ -> %@"), v2, CFSTR("NO_TURN"));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = CFSTR("N/A");
    }
    *(_DWORD *)buf = 138543618;
    v12 = v6;
    v13 = 2114;
    v14 = v10;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_INFO, "%{public}@ %{public}@", buf, 0x16u);
    if (v7)
    {

    }
  }

  if (-[GEOCompanionRouteStatus hasHapticsType](self->_companionRouteStatus, "hasHapticsType"))
    -[GEOCompanionRouteStatus setHapticsType:](self->_companionRouteStatus, "setHapticsType:", 0);
}

- (void)navigationServiceDidSynchronize:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  GEOFindOrCreateLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    MNNavigationServiceStateAsString(objc_msgSend(v5, "state"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v7;
    v13 = 2114;
    v14 = v8;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_INFO, "%{public}@ with state %{public}@", (uint8_t *)&v11, 0x16u);

  }
  if (!objc_msgSend(v5, "state"))
  {
    if ((-[GEOCompanionRouteStatus isNavigating](self->_companionRouteStatus, "isNavigating") & 1) != 0
      || (-[GEOCompanionRouteDetails routeID](self->_companionRouteDetails, "routeID"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "length"),
          v9,
          v10))
    {
      -[MNCompanionNavigationAdapter _handleNavigationServiceStopped](self, "_handleNavigationServiceStopped");
    }
  }

}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  id v8;
  id v9;

  v8 = a3;
  v9 = v8;
  if (a4 > 3 || a5 < 4)
  {
    if (a4 >= 4 && !a5)
      -[MNCompanionNavigationAdapter _handleNavigationServiceStopped](self, "_handleNavigationServiceStopped");
  }
  else
  {
    -[MNCompanionNavigationAdapter _reloadRouteFromNavigationService:](self, "_reloadRouteFromNavigationService:", v8);
  }
  -[MNCompanionNavigationAdapter setIsNavigatingInLowGuidance:](self, "setIsNavigatingInLowGuidance:", a5 == 5);

}

- (void)navigationService:(id)a3 didChangeNavigationState:(int)a4
{
  -[MNCompanionNavigationAdapter _setNavigationState:](self, "_setNavigationState:", *(_QWORD *)&a4);
}

- (void)navigationService:(id)a3 isApproachingEndOfLeg:(unint64_t)a4
{
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a3, "route");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "legs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") - 1 == a4)
    v8 = 6;
  else
    v8 = 7;

  -[MNCompanionNavigationAdapter _setNavigationState:](self, "_setNavigationState:", v8);
}

- (void)navigationService:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6
{
  if (-[GEONavigationGuidanceState navigationState](self->_guidanceState, "navigationState", a3, a4, a5, a6) == 7)-[MNCompanionNavigationAdapter _setNavigationState:](self, "_setNavigationState:", 1);
}

- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
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
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_INFO, "[MN] [%@] - Processing - in MNCompanionNavigationAdapter::navigationService:didUpdateMatchedLocation:", (uint8_t *)&v10, 0xCu);

  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27168]), "initWithCLLocation:", v5);
  -[MNCompanionNavigationAdapter _setLastLocation:](self, "_setLastLocation:", v8);
  objc_msgSend(v5, "routeMatch");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNCompanionNavigationAdapter _setRouteMatch:](self, "_setRouteMatch:", v9);

}

- (void)navigationService:(id)a3 didUpdateDisplayETA:(id)a4 remainingDistance:(id)a5 batteryChargeInfo:(id)a6
{
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  int v14;
  double v15;
  double v16;
  id v17;

  v17 = a4;
  v8 = a5;
  -[GEOComposedRoute uniqueRouteID](self->_route, "uniqueRouteID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "routeID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9;
  v12 = v10;
  if (!(v11 | v12)
    || (v13 = (void *)v12,
        v14 = objc_msgSend((id)v11, "isEqual:", v12),
        v13,
        (id)v11,
        v13,
        (id)v11,
        v14))
  {
    v15 = (double)(unint64_t)objc_msgSend(v17, "displayRemainingMinutesToEndOfLeg") * 60.0;
    objc_msgSend(v8, "distanceRemainingToEndOfLeg");
    -[MNCompanionNavigationAdapter _setPositionFromDestination:](self, "_setPositionFromDestination:", v15, v16);
  }

}

- (void)navigationServiceWillReroute:(id)a3
{
  -[GEOCompanionRouteStatus setFeedbackType:](self->_companionRouteStatus, "setFeedbackType:", 5);
  -[MNCompanionNavigationAdapter _scheduleCoalescedRouteStatusUpdate](self, "_scheduleCoalescedRouteStatusUpdate");
}

- (void)navigationServiceDidCancelReroute:(id)a3
{
  -[GEOCompanionRouteStatus setFeedbackType:](self->_companionRouteStatus, "setFeedbackType:", 1);
  -[MNCompanionNavigationAdapter _scheduleCoalescedRouteStatusUpdate](self, "_scheduleCoalescedRouteStatusUpdate");
}

- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "destinationName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNCompanionNavigationAdapter _setDestinationName:](self, "_setDestinationName:", v9);

  objc_msgSend(v7, "traffic");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "traceIsPlaying");

  -[MNCompanionNavigationAdapter _setRoute:traffic:isTrace:](self, "_setRoute:traffic:isTrace:", v7, v11, v10);
}

- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6
{
  id v9;
  id v10;

  v9 = a6;
  v10 = a5;
  -[MNCompanionNavigationAdapter _setRoute:traffic:isTrace:](self, "_setRoute:traffic:isTrace:", v10, v9, objc_msgSend(a3, "traceIsPlaying"));

}

- (void)navigationService:(id)a3 didUpdateStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5
{
  -[MNCompanionNavigationAdapter _setActiveStepIndex:](self, "_setActiveStepIndex:", a4);
}

- (void)navigationService:(id)a3 didUpdateDisplayedStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5
{
  -[MNCompanionNavigationAdapter _setDisplayedStepIndex:](self, "_setDisplayedStepIndex:", a4);
}

- (void)navigationService:(id)a3 updateSignsWithInfo:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a4, "primarySign", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayRemainingDistance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3AD8], "meters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "measurementByConvertingToUnit:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "doubleValue");
  -[MNCompanionNavigationAdapter _setPositionFromManeuver:](self, "_setPositionFromManeuver:");

}

- (void)navigationService:(id)a3 didUpdateDistanceUntilManeuver:(double)a4 timeUntilManeuver:(double)a5 forStepIndex:(unint64_t)a6
{
  void *v9;
  void *v10;
  uint64_t v11;

  objc_msgSend(a3, "route", a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "composedGuidanceEvents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (!v11)
  {
    -[MNCompanionNavigationAdapter _setDisplayedStepIndex:](self, "_setDisplayedStepIndex:", a6);
    -[MNCompanionNavigationAdapter _setPositionFromManeuver:](self, "_setPositionFromManeuver:", a4);
  }
}

- (void)navigationService:(id)a3 willAnnounce:(unint64_t)a4 inSeconds:(double)a5
{
  -[MNCompanionNavigationAdapter _setNextAnnouncementStage:timeUntilNextAnnouncement:](self, "_setNextAnnouncementStage:timeUntilNextAnnouncement:", a4, a5);
}

- (void)navigationService:(id)a3 displayPrimaryStep:(id)a4 instructions:(id)a5 shieldType:(int)a6 shieldText:(id)a7 drivingSide:(int)a8 maneuverStepIndex:(unint64_t)a9 isSynthetic:(BOOL)a10
{
  -[MNCompanionNavigationAdapter _setDisplayedStepIndex:](self, "_setDisplayedStepIndex:", a9, a4, a5, *(_QWORD *)&a6, a7, *(_QWORD *)&a8);
}

- (void)navigationService:(id)a3 triggerHaptics:(int)a4
{
  -[MNCompanionNavigationAdapter _triggerHaptics:](self, "_triggerHaptics:", *(_QWORD *)&a4);
}

- (void)navigationService:(id)a3 displayManeuverAlertForAnnouncementStage:(unint64_t)a4
{
  -[MNCompanionNavigationAdapter _setAnnouncementStage:](self, "_setAnnouncementStage:", a4);
}

- (void)navigationService:(id)a3 didEnableGuidancePrompts:(BOOL)a4
{
  -[MNCompanionNavigationAdapter _setGuidancePromptsEnabled:](self, "_setGuidancePromptsEnabled:", a4);
}

- (void)navigationService:(id)a3 didReceiveRealtimeUpdates:(id)a4
{
  id v5;

  objc_msgSend(a4, "allObjects", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MNCompanionNavigationAdapter _setRealtimeUpdates:](self, "_setRealtimeUpdates:", v5);

}

- (void)navigationService:(id)a3 didReceiveTransitAlert:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  objc_msgSend(v13, "command");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

LABEL_4:
    v7 = (void *)objc_opt_new();
    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIdentifier:", v9);

    objc_msgSend(v7, "setStepID:", objc_msgSend(v13, "stepIndex"));
    objc_msgSend(v7, "setStopID:", objc_msgSend(v13, "stopIndex"));
    objc_msgSend(v13, "artwork");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setArtwork:", v10);

    objc_msgSend(v13, "command");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:", v11);

    objc_msgSend(v13, "detail");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDetail:", v12);

    -[MNCompanionNavigationAdapter _setTransitAlightMessage:](self, "_setTransitAlightMessage:", v7);
    goto LABEL_5;
  }
  objc_msgSend(v13, "command");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_4;
LABEL_5:

}

- (void)navigationService:(id)a3 didUpdateRouteWithNewRideSelection:(id)a4
{
  GEOCompanionRouteStatus *companionRouteStatus;
  id v6;
  void *v7;
  void *v8;

  companionRouteStatus = self->_companionRouteStatus;
  v6 = a4;
  objc_msgSend(v6, "uniqueRouteID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_maps_data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOCompanionRouteStatus updateClusteredSectionSelectedRideIndicesFromRoute:routeID:](companionRouteStatus, "updateClusteredSectionSelectedRideIndicesFromRoute:routeID:", v6, v8);

  -[MNCompanionNavigationAdapter _scheduleCoalescedRouteStatusUpdate](self, "_scheduleCoalescedRouteStatusUpdate");
}

- (void)_reloadRouteFromNavigationService:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "route");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v10, "destinationName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNCompanionNavigationAdapter _setDestinationName:](self, "_setDestinationName:", v5);

    objc_msgSend(v4, "traffic");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNCompanionNavigationAdapter _setRoute:traffic:isTrace:](self, "_setRoute:traffic:isTrace:", v4, v6, objc_msgSend(v10, "traceIsPlaying"));

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "realtimeUpdatesForRoutes:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNCompanionNavigationAdapter _setRealtimeUpdates:](self, "_setRealtimeUpdates:", v9);

  }
  else
  {
    -[MNCompanionNavigationAdapter _cancelScheduledRouteStatus](self, "_cancelScheduledRouteStatus");
    -[MNCompanionNavigationAdapter _cancelScheduledRouteUpdates](self, "_cancelScheduledRouteUpdates");
  }

}

- (void)_handleNavigationServiceStopped
{
  -[MNCompanionNavigationAdapter _reset](self, "_reset");
  -[MNCompanionNavigationAdapter _sendRouteDetailsAndStatus](self, "_sendRouteDetailsAndStatus");
}

- (MNCompanionNavigationDelegate)delegate
{
  return (MNCompanionNavigationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_coalescedRouteUpdatesTimer, 0);
  objc_storeStrong((id *)&self->_coalescedRouteStatusTimer, 0);
  objc_storeStrong((id *)&self->_companionRouteUpdates, 0);
  objc_storeStrong((id *)&self->_companionRouteStatus, 0);
  objc_storeStrong((id *)&self->_companionRouteDetails, 0);
  objc_storeStrong((id *)&self->_guidanceState, 0);
  objc_storeStrong((id *)&self->_currentRoadName, 0);
  objc_storeStrong((id *)&self->_routeMatch, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_destinationName, 0);
}

@end
