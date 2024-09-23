@implementation GEONavigationProxy

- (void)dealloc
{
  objc_super v3;

  -[GEONavigationProxy _closeNavdConnection](self, "_closeNavdConnection");
  -[GEONavigationProxy _clearState](self, "_clearState");
  v3.receiver = self;
  v3.super_class = (Class)GEONavigationProxy;
  -[GEONavigationProxy dealloc](&v3, sel_dealloc);
}

- (void)startWithDestinationName:(id)a3 nextDestinationName:(id)a4
{
  id v6;
  id v7;
  GEONavigationRouteSummary *v8;
  GEONavigationRouteSummary *routeSummary;
  GEONavigationRouteTransitSummary *v10;
  GEONavigationRouteTransitSummary *transitRouteSummary;
  GEONavigationGuidanceState *v12;
  GEONavigationGuidanceState *guidanceState;
  NSString *v14;
  NSString *destinationName;
  id v16;

  v6 = a4;
  v7 = a3;
  -[GEONavigationProxy _clearState](self, "_clearState");
  v8 = objc_alloc_init(GEONavigationRouteSummary);
  routeSummary = self->_routeSummary;
  self->_routeSummary = v8;

  v10 = objc_alloc_init(GEONavigationRouteTransitSummary);
  transitRouteSummary = self->_transitRouteSummary;
  self->_transitRouteSummary = v10;

  v12 = objc_alloc_init(GEONavigationGuidanceState);
  guidanceState = self->_guidanceState;
  self->_guidanceState = v12;

  v14 = (NSString *)objc_msgSend(v7, "copy");
  destinationName = self->_destinationName;
  self->_destinationName = v14;

  -[GEONavigationRouteSummary setDestinationName:](self->_routeSummary, "setDestinationName:", self->_destinationName);
  v16 = (id)objc_msgSend(v6, "copy");

  -[GEONavigationRouteSummary setNextDestinationName:](self->_routeSummary, "setNextDestinationName:", v16);
}

- (void)stop
{
  -[GEONavigationProxy _closeNavdConnection](self, "_closeNavdConnection");
  -[GEONavigationProxy _clearState](self, "_clearState");
}

- (void)setRoute:(id)a3
{
  GEOComposedRoute *v5;
  void *v6;
  NSArray *v7;
  NSArray *rideSelections;
  void *v9;
  GEOComposedRoute *v10;

  v5 = (GEOComposedRoute *)a3;
  if (v5 && self->_route != v5)
  {
    v10 = v5;
    objc_storeStrong((id *)&self->_route, a3);
    -[GEONavigationRouteSummary updateRoute:destinationName:](self->_routeSummary, "updateRoute:destinationName:", v10, self->_destinationName);
    -[GEONavigationRouteTransitSummary updateRoute:](self->_transitRouteSummary, "updateRoute:", v10);
    -[GEOComposedRoute rideSelections](v10, "rideSelections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (NSArray *)objc_msgSend(v6, "copy");
    rideSelections = self->_rideSelections;
    self->_rideSelections = v7;

    -[GEONavigationProxy _sendRouteSummary](self, "_sendRouteSummary");
    -[GEONavigationProxy _sendTransitSummary](self, "_sendTransitSummary");
    -[NSXPCConnection remoteObjectProxy](self->_navdConnection, "remoteObjectProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRoute:", v10);

    v5 = v10;
  }

}

- (void)setETAUpdate:(id)a3
{
  GEOArrivalTimeAndDistanceInfo *v5;
  void *v6;
  GEOArrivalTimeAndDistanceInfo *v7;

  v5 = (GEOArrivalTimeAndDistanceInfo *)a3;
  if (v5 && self->_timeAndDistanceInfo != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_timeAndDistanceInfo, a3);
    -[NSXPCConnection remoteObjectProxy](self->_navdConnection, "remoteObjectProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setETAUpdate:", v7);

    v5 = v7;
  }

}

- (void)setNavigationSessionState:(unint64_t)a3 transportType:(int)a4 navigationType:(int)a5 isResumingMultipointRoute:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  void *v11;
  void *v12;

  v6 = a6;
  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  if (a3)
  {
    -[GEONavigationProxy _openNavdConnection](self, "_openNavdConnection");
    -[NSXPCConnection remoteObjectProxy](self->_navdConnection, "remoteObjectProxy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setNavigationSessionState:transportType:isResumingMultipointRoute:", a3, v8, v6);

    -[GEONavigationGuidanceState setNavigationType:](self->_guidanceState, "setNavigationType:", v7);
    -[GEONavigationGuidanceState setTrackedTransportType:](self->_guidanceState, "setTrackedTransportType:", v8);
  }
  else
  {
    -[NSXPCConnection remoteObjectProxy](self->_navdConnection, "remoteObjectProxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setNavigationSessionState:transportType:isResumingMultipointRoute:", 0, v8, v6);

    -[GEONavigationGuidanceState setNavigationType:](self->_guidanceState, "setNavigationType:", v7);
    -[GEONavigationGuidanceState setTrackedTransportType:](self->_guidanceState, "setTrackedTransportType:", v8);
    -[GEONavigationProxy _closeNavdConnection](self, "_closeNavdConnection");
  }
}

- (void)setNavigationState:(int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  if (-[GEONavigationGuidanceState navigationState](self->_guidanceState, "navigationState") != a3)
  {
    -[GEONavigationGuidanceState setNavigationState:](self->_guidanceState, "setNavigationState:", v3);
    -[GEONavigationProxy _sendGuidanceState](self, "_sendGuidanceState");
  }
}

- (void)setLastLocation:(id)a3 routeMatchedCoordinate:(id)a4
{
  GEOLocation *v7;
  GEOLocation *v8;

  v7 = (GEOLocation *)a3;
  if (self->_lastLocation != v7)
  {
    v8 = v7;
    objc_storeStrong((id *)&self->_lastLocation, a3);
    self->_matchedCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)a4;
    -[GEONavigationProxy _sendLocationAndCoordinate](self, "_sendLocationAndCoordinate");
    v7 = v8;
  }

}

- (void)setLocationUnreliable:(BOOL)a3
{
  if (self->_locationUnreliable != a3)
    self->_locationUnreliable = a3;
}

- (void)setTrafficForCurrentRoute:(id)a3
{
  NSXPCConnection *navdConnection;
  id v4;
  id v5;

  navdConnection = self->_navdConnection;
  v4 = a3;
  -[NSXPCConnection remoteObjectProxy](navdConnection, "remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateTrafficForCurrentRoute:", v4);

}

- (void)setArrivedAtWaypoint:(id)a3 endOfLegIndex:(unint64_t)a4
{
  NSXPCConnection *navdConnection;
  id v6;
  id v7;

  navdConnection = self->_navdConnection;
  v6 = a3;
  -[NSXPCConnection remoteObjectProxy](navdConnection, "remoteObjectProxy");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setArrivedAtWaypoint:endOfLegIndex:", v6, a4);

}

- (void)setResumedNavigatingFromWaypoint:(id)a3 endOfLegIndex:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[GEONavigationProxy _sendRouteSummary](self, "_sendRouteSummary");
  -[NSXPCConnection remoteObjectProxy](self->_navdConnection, "remoteObjectProxy");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setResumedNavigatingFromWaypoint:endOfLegIndex:", v6, a4);

}

- (void)setRouteMatch:(id)a3
{
  GEORouteMatch *v5;
  GEORouteMatch **p_routeMatch;
  GEORouteMatch *routeMatch;
  GEORouteMatch *v8;

  v5 = (GEORouteMatch *)a3;
  routeMatch = self->_routeMatch;
  p_routeMatch = &self->_routeMatch;
  if (routeMatch != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_routeMatch, a3);
    v5 = v8;
  }

}

- (void)setDestinationName:(id)a3 nextDestinationName:(id)a4
{
  id v6;
  NSString *destinationName;
  NSString *v8;
  NSString *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  if (v13)
  {
    destinationName = self->_destinationName;
    if (!destinationName || !-[NSString isEqualToString:](destinationName, "isEqualToString:", v13))
    {
      v8 = (NSString *)objc_msgSend(v13, "copy");
      v9 = self->_destinationName;
      self->_destinationName = v8;

      -[GEONavigationRouteSummary setDestinationName:](self->_routeSummary, "setDestinationName:", self->_destinationName);
    }
  }
  -[GEONavigationRouteSummary nextDestinationName](self->_routeSummary, "nextDestinationName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", v6);

  if ((v11 & 1) == 0)
  {
    v12 = (void *)objc_msgSend(v6, "copy");
    -[GEONavigationRouteSummary setNextDestinationName:](self->_routeSummary, "setNextDestinationName:", v12);

  }
}

- (void)setCurrentRoadName:(id)a3
{
  NSString *v4;
  NSString *currentRoadName;
  BOOL v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;

  v4 = (NSString *)a3;
  currentRoadName = self->_currentRoadName;
  if (currentRoadName != v4)
  {
    v9 = v4;
    v6 = -[NSString isEqualToString:](currentRoadName, "isEqualToString:", v4);
    v4 = v9;
    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v9, "copy");
      v8 = self->_currentRoadName;
      self->_currentRoadName = v7;

      -[GEONavigationProxy _sendCurrentRoadName](self, "_sendCurrentRoadName");
      v4 = v9;
    }
  }

}

- (void)setGuidancePromptsEnabled:(BOOL)a3
{
  if (self->_guidancePromptsEnabled != a3)
    self->_guidancePromptsEnabled = a3;
}

- (void)setActiveRouteDetailsData:(id)a3
{
  objc_storeStrong((id *)&self->_activeRouteDetailsData, a3);
  -[GEONavigationProxy _sendActiveRouteDetailsData](self, "_sendActiveRouteDetailsData");
  -[GEONavigationProxy _sendRideSelections](self, "_sendRideSelections");
}

- (void)setStepIndex:(unint64_t)a3
{
  self->_stepIndex = a3;
  -[GEONavigationProxy _sendStepIndex](self, "_sendStepIndex");
}

- (void)setDisplayedStepIndex:(unint64_t)a3
{
  if (self->_displayedStepIndex != a3)
    self->_displayedStepIndex = a3;
}

- (void)setStepNameInfo:(id)a3
{
  objc_storeStrong((id *)&self->_stepNameInfo, a3);
  -[GEONavigationProxy _sendStepNameInfo](self, "_sendStepNameInfo");
}

- (void)setClusteredSectionSelectedRideFromRoute:(id)a3
{
  void *v4;
  NSArray *v5;
  NSArray *rideSelections;

  objc_msgSend(a3, "rideSelections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (NSArray *)objc_msgSend(v4, "copy");
  rideSelections = self->_rideSelections;
  self->_rideSelections = v5;

  -[GEONavigationProxy _sendRideSelections](self, "_sendRideSelections");
}

- (void)setPositionFromSign:(id)a3
{
  self->_positionFromSign = ($5ED2722C8710615E66118753FC41CC89)a3;
  -[GEONavigationProxy _sendPositionFromSign](self, "_sendPositionFromSign");
}

- (void)setPositionFromManeuver:(id)a3
{
  self->_positionFromManeuver = ($5ED2722C8710615E66118753FC41CC89)a3;
  -[GEONavigationProxy _sendPositionFromManeuver](self, "_sendPositionFromManeuver");
}

- (void)setPositionFromDestination:(id)a3
{
  self->_positionFromDestination = ($5ED2722C8710615E66118753FC41CC89)a3;
  -[GEONavigationProxy _sendPositionFromDestination](self, "_sendPositionFromDestination");
}

- (void)setAnnouncementStage:(unint64_t)a3
{
  if (self->_announcementStage != a3)
    self->_announcementStage = a3;
}

- (void)setNextAnnouncementStage:(unint64_t)a3 timeUntilNextAnnouncement:(double)a4
{
  self->_nextAnnouncementStage = a3;
  self->_timeUntilNextAnnouncement = a4;
}

- (void)setNavigationVoiceVolume:(int)a3
{
  self->_navigationVoiceVolume = a3;
  -[GEONavigationProxy _sendNavigationVoiceVolume](self, "_sendNavigationVoiceVolume");
}

- (void)setIsNavigatingInLowGuidance:(BOOL)a3
{
  if (self->_isNavigatingInLowGuidance != a3)
    self->_isNavigatingInLowGuidance = a3;
}

- (void)setIsConnectedToCarplay:(BOOL)a3
{
  if (self->_isConnectedToCarplay != a3)
    self->_isConnectedToCarplay = a3;
}

- (void)_clearState
{
  NSString *destinationName;
  GEOComposedRoute *route;
  GEOLocation *lastLocation;
  GEORouteMatch *routeMatch;
  GEONavigationRouteSummary *routeSummary;
  GEONavigationRouteTransitSummary *transitRouteSummary;
  GEONavigationGuidanceState *guidanceState;
  NSData *activeRouteDetailsData;
  NSArray *rideSelections;
  GEONameInfo *stepNameInfo;

  destinationName = self->_destinationName;
  self->_destinationName = 0;

  route = self->_route;
  self->_route = 0;

  lastLocation = self->_lastLocation;
  self->_lastLocation = 0;

  routeMatch = self->_routeMatch;
  self->_routeMatch = 0;

  routeSummary = self->_routeSummary;
  self->_routeSummary = 0;

  transitRouteSummary = self->_transitRouteSummary;
  self->_transitRouteSummary = 0;

  guidanceState = self->_guidanceState;
  self->_guidanceState = 0;

  activeRouteDetailsData = self->_activeRouteDetailsData;
  self->_activeRouteDetailsData = 0;

  rideSelections = self->_rideSelections;
  self->_rideSelections = 0;

  self->_locationUnreliable = 0;
  *(int64x2_t *)&self->_stepIndex = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  stepNameInfo = self->_stepNameInfo;
  self->_stepNameInfo = 0;

  self->_positionFromSign = ($5ED2722C8710615E66118753FC41CC89)GEOArrivalTimeAndDistanceInvalid;
  self->_positionFromManeuver = ($5ED2722C8710615E66118753FC41CC89)GEOArrivalTimeAndDistanceInvalid;
  self->_positionFromDestination = ($5ED2722C8710615E66118753FC41CC89)GEOArrivalTimeAndDistanceInvalid;
  self->_announcementStage = 0;
  self->_nextAnnouncementStage = 0;
  self->_timeUntilNextAnnouncement = 1.79769313e308;
  self->_navigationVoiceVolume = 0;
}

- (void)_openNavdConnection
{
  NSXPCConnection *v3;
  NSXPCConnection *navdConnection;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  if (!self->_navdConnection)
  {
    v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.navigationServer"), 0);
    navdConnection = self->_navdConnection;
    self->_navdConnection = v3;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE01F3E8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_navdConnection, "setRemoteObjectInterface:", v5);

    -[NSXPCConnection _setQueue:](self->_navdConnection, "_setQueue:", MEMORY[0x1E0C80D38]);
    objc_initWeak(&location, self);
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __41__GEONavigationProxy__openNavdConnection__block_invoke;
    v9 = &unk_1E1BFF8B0;
    objc_copyWeak(&v10, &location);
    -[NSXPCConnection setInterruptionHandler:](self->_navdConnection, "setInterruptionHandler:", &v6);
    -[NSXPCConnection resume](self->_navdConnection, "resume", v6, v7, v8, v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __41__GEONavigationProxy__openNavdConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_sendRouteSummary");
    objc_msgSend(v2, "_sendTransitSummary");
    objc_msgSend(v2, "_sendGuidanceState");
    objc_msgSend(v2, "_sendActiveRouteDetailsData");
    objc_msgSend(v2, "_sendRideSelections");
    objc_msgSend(v2, "_sendStepIndex");
    objc_msgSend(v2, "_sendStepNameInfo");
    objc_msgSend(v2, "_sendPositionFromDestination");
    objc_msgSend(v2, "_sendPositionFromSign");
    objc_msgSend(v2, "_sendPositionFromManeuver");
    objc_msgSend(v2, "_sendNavigationVoiceVolume");
    WeakRetained = v2;
  }

}

- (void)_closeNavdConnection
{
  NSXPCConnection *navdConnection;
  NSXPCConnection *v4;

  navdConnection = self->_navdConnection;
  if (navdConnection)
  {
    -[NSXPCConnection setInterruptionHandler:](navdConnection, "setInterruptionHandler:", 0);
    -[NSXPCConnection invalidate](self->_navdConnection, "invalidate");
    v4 = self->_navdConnection;
    self->_navdConnection = 0;

  }
}

- (void)_sendRouteSummary
{
  void *v3;
  id v4;

  -[NSXPCConnection remoteObjectProxy](self->_navdConnection, "remoteObjectProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[GEONavigationRouteSummary data](self->_routeSummary, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRouteSummaryWithNavigationRouteSummaryData:", v3);

}

- (void)_sendTransitSummary
{
  void *v3;
  id v4;

  -[NSXPCConnection remoteObjectProxy](self->_navdConnection, "remoteObjectProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[GEONavigationRouteTransitSummary data](self->_transitRouteSummary, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRouteSummaryWithTransitSummaryData:", v3);

}

- (void)_sendGuidanceState
{
  void *v3;
  id v4;

  -[NSXPCConnection remoteObjectProxy](self->_navdConnection, "remoteObjectProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[GEONavigationGuidanceState data](self->_guidanceState, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRouteSummaryWithGuidanceStateData:", v3);

}

- (void)_sendCurrentRoadName
{
  id v3;

  -[NSXPCConnection remoteObjectProxy](self->_navdConnection, "remoteObjectProxy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCurrentRoadName:", self->_currentRoadName);

}

- (void)_sendLocationAndCoordinate
{
  id v3;

  -[NSXPCConnection remoteObjectProxy](self->_navdConnection, "remoteObjectProxy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLocation:routeMatchedCoordinate:", self->_lastLocation, *(_QWORD *)&self->_matchedCoordinate);

}

- (void)_sendStepIndex
{
  void *v2;
  void *v3;
  unint64_t stepIndex;

  stepIndex = self->_stepIndex;
  -[NSXPCConnection remoteObjectProxy](self->_navdConnection, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &stepIndex, 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRouteSummaryWithStepIndexData:", v3);

}

- (void)_sendStepNameInfo
{
  void *v3;
  id v4;

  -[NSXPCConnection remoteObjectProxy](self->_navdConnection, "remoteObjectProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[GEONameInfo data](self->_stepNameInfo, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRouteSummaryWithStepNameInfoData:", v3);

}

- (void)_sendRideSelections
{
  void *v3;
  id v4;

  -[NSXPCConnection remoteObjectProxy](self->_navdConnection, "remoteObjectProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self->_rideSelections, 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRouteSummaryWithRideSelectionsData:", v3);

}

- (void)_sendActiveRouteDetailsData
{
  id v3;

  -[NSXPCConnection remoteObjectProxy](self->_navdConnection, "remoteObjectProxy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRouteSummaryWithActiveRouteDetailsData:", self->_activeRouteDetailsData);

}

- (void)_sendPositionFromSign
{
  void *v2;
  void *v3;
  __int128 v4;

  -[NSXPCConnection remoteObjectProxy](self->_navdConnection, "remoteObjectProxy", *(_QWORD *)&self->_positionFromSign.remainingTime, *(_QWORD *)&self->_positionFromSign.remainingDistance);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v4, 16);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRouteSummaryWithPositionFromSignData:", v3);

}

- (void)_sendPositionFromManeuver
{
  void *v2;
  void *v3;
  __int128 v4;

  -[NSXPCConnection remoteObjectProxy](self->_navdConnection, "remoteObjectProxy", *(_QWORD *)&self->_positionFromManeuver.remainingTime, *(_QWORD *)&self->_positionFromManeuver.remainingDistance);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v4, 16);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRouteSummaryWithPositionFromManeuverData:", v3);

}

- (void)_sendPositionFromDestination
{
  void *v2;
  void *v3;
  __int128 v4;

  -[NSXPCConnection remoteObjectProxy](self->_navdConnection, "remoteObjectProxy", *(_QWORD *)&self->_positionFromDestination.remainingTime, *(_QWORD *)&self->_positionFromDestination.remainingDistance);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v4, 16);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRouteSummaryWithPositionFromDestinationData:", v3);

}

- (void)_sendNavigationVoiceVolume
{
  void *v3;
  id v4;

  -[NSXPCConnection remoteObjectProxy](self->_navdConnection, "remoteObjectProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &self->_navigationVoiceVolume, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNavigationVoiceVolumeWithData:", v3);

}

- (GEOServerFormattedStepStringFormatter)formatter
{
  return self->_formatter;
}

- (void)setFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_formatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_guidanceState, 0);
  objc_storeStrong((id *)&self->_timeAndDistanceInfo, 0);
  objc_storeStrong((id *)&self->_transitRouteSummary, 0);
  objc_storeStrong((id *)&self->_routeSummary, 0);
  objc_storeStrong((id *)&self->_stepNameInfo, 0);
  objc_storeStrong((id *)&self->_rideSelections, 0);
  objc_storeStrong((id *)&self->_activeRouteDetailsData, 0);
  objc_storeStrong((id *)&self->_currentRoadName, 0);
  objc_storeStrong((id *)&self->_routeMatch, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_destinationName, 0);
  objc_storeStrong((id *)&self->_navdConnection, 0);
}

@end
