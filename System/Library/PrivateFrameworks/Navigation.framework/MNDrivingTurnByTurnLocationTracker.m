@implementation MNDrivingTurnByTurnLocationTracker

- (MNDrivingTurnByTurnLocationTracker)initWithNavigationSession:(id)a3
{
  MNDrivingTurnByTurnLocationTracker *v3;
  MNDrivingTurnByTurnLocationTracker *v4;
  MNDrivingTurnByTurnLocationTracker *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MNDrivingTurnByTurnLocationTracker;
  v3 = -[MNTurnByTurnLocationTracker initWithNavigationSession:](&v7, sel_initWithNavigationSession_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_detectedTransportType = 4;
    v3->_lastKnownCourse = -1.0;
    v5 = v3;
  }

  return v4;
}

- (id)_currentVehicleParkingInfoForParkingType:(int64_t)a3
{
  MNVehicleParkingInfo *v5;
  MNWalkingRouteBackgroundLoader *walkingRouteBackgroundLoader;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = objc_alloc_init(MNVehicleParkingInfo);
  -[MNVehicleParkingInfo setParkingType:](v5, "setParkingType:", a3);
  walkingRouteBackgroundLoader = self->_walkingRouteBackgroundLoader;
  if (walkingRouteBackgroundLoader)
  {
    -[MNWalkingRouteBackgroundLoader walkingRouteInfo](walkingRouteBackgroundLoader, "walkingRouteInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "route");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNVehicleParkingInfo setRemainingWalkingRoute:](v5, "setRemainingWalkingRoute:", v8);

    -[MNWalkingRouteBackgroundLoader walkingRouteInfo](self->_walkingRouteBackgroundLoader, "walkingRouteInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayETAInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNVehicleParkingInfo setWalkingRouteDisplayETAInfo:](v5, "setWalkingRouteDisplayETAInfo:", v10);

  }
  return v5;
}

- (void)setNavigationSessionState:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  int v10;
  objc_super v11;

  v4 = a3;
  -[MNLocationTracker navigationSessionState](self, "navigationSessionState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "arrivalState");
  v7 = objc_msgSend(v4, "arrivalState");

  -[MNLocationTracker navigationSessionState](self, "navigationSessionState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isDisplayingNavigationTray");
  v10 = objc_msgSend(v4, "isDisplayingNavigationTray");

  v11.receiver = self;
  v11.super_class = (Class)MNDrivingTurnByTurnLocationTracker;
  -[MNTurnByTurnLocationTracker setNavigationSessionState:](&v11, sel_setNavigationSessionState_, v4);
  -[MNWalkingRouteBackgroundLoader setNavigationSessionState:](self->_walkingRouteBackgroundLoader, "setNavigationSessionState:", v4);

  if (v6 != v7 || v9 != v10)
    -[MNDrivingTurnByTurnLocationTracker _updateWalkingRouteBackgroundLoader](self, "_updateWalkingRouteBackgroundLoader");
}

- (int)transportType
{
  return 0;
}

- (BOOL)shouldProjectAlongRoute
{
  return 1;
}

- (void)startTrackingWithInitialLocation:(id)a3 targetLegIndex:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  MNTunnelLocationProjector *v20;
  MNTunnelLocationProjector *tunnelLocationProjector;
  MNTunnelLocationProjector *v22;
  void *v23;
  MNAlternateRoutesUpdater *v24;
  MNAlternateRoutesUpdater *alternateRoutesUpdater;
  MNAlternateRoutesUpdater *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSMutableArray *v33;
  NSMutableArray *etauPositions;
  void *v35;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)MNDrivingTurnByTurnLocationTracker;
  -[MNTurnByTurnLocationTracker startTrackingWithInitialLocation:targetLegIndex:](&v36, sel_startTrackingWithInitialLocation_targetLegIndex_, a3, a4);
  -[MNLocationTracker navigationSession](self, "navigationSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "traceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tracePlayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[MNLocationTracker navigationSession](self, "navigationSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "routeManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7
    || !GEOConfigGetBOOL()
    || (objc_msgSend(v7, "sessionUpdater"), v10 = (void *)objc_claimAutoreleasedReturnValue(), v10, v10))
  {
    -[MNLocationTracker navigationSession](self, "navigationSession");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "routeManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "currentRouteInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNLocationTracker navigationSession](self, "navigationSession");
    v35 = v9;
    v14 = v7;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "routeManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "alternateRoutes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[MNTrafficIncidentAlert validTrafficIncidentAlertsForMainRouteInfo:alternateRouteInfo:](MNTrafficIncidentAlert, "validTrafficIncidentAlertsForMainRouteInfo:alternateRouteInfo:", v13, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNTurnByTurnLocationTracker _updateForNewTrafficIncidentAlerts:](self, "_updateForNewTrafficIncidentAlerts:", v19);

    v7 = v14;
    v9 = v35;

  }
  v20 = objc_alloc_init(MNTunnelLocationProjector);
  tunnelLocationProjector = self->_tunnelLocationProjector;
  self->_tunnelLocationProjector = v20;

  -[MNTunnelLocationProjector setDelegate:](self->_tunnelLocationProjector, "setDelegate:", self);
  v22 = self->_tunnelLocationProjector;
  objc_msgSend(v9, "currentRouteInfo");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNTunnelLocationProjector updateForRouteInfo:](v22, "updateForRouteInfo:", v23);

  v24 = objc_alloc_init(MNAlternateRoutesUpdater);
  alternateRoutesUpdater = self->_alternateRoutesUpdater;
  self->_alternateRoutesUpdater = v24;

  v26 = self->_alternateRoutesUpdater;
  objc_msgSend(v9, "alternateRoutes");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentRouteInfo");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNAlternateRoutesUpdater setAlternateRoutes:forMainRoute:](v26, "setAlternateRoutes:forMainRoute:", v27, v28);

  -[MNLocationTracker safeDelegate](self, "safeDelegate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNAlternateRoutesUpdater alternateRoutes](self->_alternateRoutesUpdater, "alternateRoutes");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "locationTracker:didUpdateAlternateRoutes:", self, v30);

  objc_msgSend(v9, "currentRoute");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "etauPositions");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (NSMutableArray *)objc_msgSend(v32, "mutableCopy");
  etauPositions = self->_etauPositions;
  self->_etauPositions = v33;

}

- (void)stopTracking
{
  MNAlternateRoutesUpdater *alternateRoutesUpdater;
  MNTunnelLocationProjector *tunnelLocationProjector;
  MNWalkingRouteBackgroundLoader *walkingRouteBackgroundLoader;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MNDrivingTurnByTurnLocationTracker;
  -[MNTurnByTurnLocationTracker stopTracking](&v6, sel_stopTracking);
  alternateRoutesUpdater = self->_alternateRoutesUpdater;
  self->_alternateRoutesUpdater = 0;

  -[MNTunnelLocationProjector setDelegate:](self->_tunnelLocationProjector, "setDelegate:", 0);
  -[MNTunnelLocationProjector stop](self->_tunnelLocationProjector, "stop");
  tunnelLocationProjector = self->_tunnelLocationProjector;
  self->_tunnelLocationProjector = 0;

  -[MNWalkingRouteBackgroundLoader stop](self->_walkingRouteBackgroundLoader, "stop");
  -[MNWalkingRouteBackgroundLoader setDelegate:](self->_walkingRouteBackgroundLoader, "setDelegate:", 0);
  walkingRouteBackgroundLoader = self->_walkingRouteBackgroundLoader;
  self->_walkingRouteBackgroundLoader = 0;

}

- (void)updateRequestForETAUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MNDrivingTurnByTurnLocationTracker;
  -[MNTurnByTurnLocationTracker updateRequestForETAUpdate:](&v11, sel_updateRequestForETAUpdate_, v4);
  -[MNLocationTracker navigationSession](self, "navigationSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serverSessionStateInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayedTrafficBanners");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__MNDrivingTurnByTurnLocationTracker_updateRequestForETAUpdate___block_invoke;
  v9[3] = &unk_1E61D21A8;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v9);

}

void __64__MNDrivingTurnByTurnLocationTracker_updateRequestForETAUpdate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v5 = *(void **)(a1 + 32);
  v6 = (void *)objc_msgSend(a2, "copy");
  objc_msgSend(v5, "addDisplayedBannerId:", v6);

  if (objc_msgSend(v11, "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "clientFeedbackInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = (void *)objc_opt_new();
      objc_msgSend(*(id *)(a1 + 32), "setClientFeedbackInfo:", v8);

    }
    objc_msgSend(*(id *)(a1 + 32), "clientFeedbackInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v9, "addDisplayedBannerEventInfo:", v10);

  }
}

- (void)updateForETAUResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)MNDrivingTurnByTurnLocationTracker;
  -[MNTurnByTurnLocationTracker updateForETAUResponse:](&v32, sel_updateForETAUResponse_, v4);
  -[MNLocationTracker navigationSessionState](self, "navigationSessionState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentRouteInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "route");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(MEMORY[0x1E0D274D8]);
  objc_msgSend(v4, "waypoints");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "request");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "routeAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "response");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "styleAttributes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v8, "initWithWaypoints:routeAttributes:etauResponse:styleAttributes:", v9, v11, v12, v13);

  objc_msgSend(v14, "allETAUAlternateRouteInfos");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNLocationTracker navigationSession](self, "navigationSession");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "routeManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "currentRouteInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[MNTrafficIncidentAlert validTrafficIncidentAlertsForMainRouteInfo:alternateRouteInfo:](MNTrafficIncidentAlert, "validTrafficIncidentAlertsForMainRouteInfo:alternateRouteInfo:", v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[MNTurnByTurnLocationTracker _updateForNewTrafficIncidentAlerts:](self, "_updateForNewTrafficIncidentAlerts:", v20);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v21 = v20;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (!v22)
  {

LABEL_11:
    -[MNDrivingTurnByTurnLocationTracker _updateForAlternateRoutes:](self, "_updateForAlternateRoutes:", v15, (_QWORD)v28);
    goto LABEL_12;
  }
  v23 = v22;
  v24 = 0;
  v25 = *(_QWORD *)v29;
  do
  {
    for (i = 0; i != v23; ++i)
    {
      if (*(_QWORD *)v29 != v25)
        objc_enumerationMutation(v21);
      objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "alternateRoute", (_QWORD)v28);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v24 |= v27 != 0;

    }
    v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  }
  while (v23);

  if ((v24 & 1) == 0)
    goto LABEL_11;
LABEL_12:

}

- (id)_matchedLocationForLocation:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  double v11;
  double v12;
  double v13;
  NSObject *v14;
  const char *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  NSObject *v24;
  objc_super v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MNGetPuckTrackingLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v28 = v6;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_INFO, "[MN] [%@] - Processing - in MNDrivingTurnByTurnLocationTracker::_matchedLocationForLocation:", buf, 0xCu);

  }
  MNGetMNLocationTrackerLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);
  v9 = v7;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "MatchedDrivingTBTLocationForLocation", ", buf, 2u);
  }

  if (-[MNTunnelLocationProjector isProjecting](self->_tunnelLocationProjector, "isProjecting"))
  {
    objc_msgSend(v4, "horizontalAccuracy");
    if (v11 > 65.0 || (objc_msgSend(v4, "course"), v12 < 0.0) || (objc_msgSend(v4, "speed"), v13 < 0.0))
    {
      GEOFindOrCreateLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
LABEL_13:
        v16 = 0;
        goto LABEL_18;
      }
      *(_WORD *)buf = 0;
      v15 = "We are still projecting and have not processed a high quality location. Ignoring current location.";
LABEL_12:
      _os_log_impl(&dword_1B0AD7000, v14, OS_LOG_TYPE_DEBUG, v15, buf, 2u);
      goto LABEL_13;
    }
    -[MNLocationTracker lastMatchedLocation](self, "lastMatchedLocation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timestamp");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "timeIntervalSinceReferenceDate");
    v20 = v19;

    objc_msgSend(v4, "timestamp");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "timeIntervalSinceReferenceDate");
    v23 = v22;

    if (v23 + 2.0 < v20)
    {
      GEOFindOrCreateLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        goto LABEL_13;
      *(_WORD *)buf = 0;
      v15 = "Filtering location was generated more than 2 seconds before our last projected location.";
      goto LABEL_12;
    }
  }
  v26.receiver = self;
  v26.super_class = (Class)MNDrivingTurnByTurnLocationTracker;
  -[MNTurnByTurnLocationTracker _matchedLocationForLocation:](&v26, sel__matchedLocationForLocation_, v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v10;
  v14 = v24;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v14, OS_SIGNPOST_INTERVAL_END, v8, "MatchedDrivingTBTLocationForLocation", ", buf, 2u);
  }
LABEL_18:

  return v16;
}

- (id)_newMapMatcherForRoute:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x1E0D27268];
  v5 = a3;
  v6 = [v4 alloc];
  -[MNLocationTracker _auditToken](self, "_auditToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithRoute:auditToken:", v5, v7);

  objc_msgSend(v8, "setUseMatchedCoordinateForMatching:", GEOConfigGetBOOL());
  return v8;
}

- (id)_overrideLocationForLocation:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double lastKnownCourse;
  double v12;
  NSObject *v13;
  double v14;
  double v15;
  uint8_t v17[16];

  v4 = a3;
  v5 = v4;
  if (self->_lastKnownCourse < 0.0 || (objc_msgSend(v4, "rawCourse"), v6 < 0.0))
  {
    objc_msgSend(v5, "rawCourse");
    v8 = v7;
    objc_msgSend(v5, "courseAccuracy");
    if (v9 < 0.0 || v9 >= 20.0)
    {
      lastKnownCourse = self->_lastKnownCourse;
      objc_msgSend(v5, "speed");
      if (v8 < 0.0)
      {
        self->_consecutiveValidCourseCount = 1.0;
        lastKnownCourse = self->_lastKnownCourse;
        GEOFindOrCreateLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v17 = 0;
          _os_log_impl(&dword_1B0AD7000, v13, OS_LOG_TYPE_DEBUG, "Current course less than 0. Setting _consecutiveValidCourseCount to 1.", v17, 2u);
        }

        goto LABEL_16;
      }
      if (v12 <= 3.0
        || (v15 = self->_consecutiveValidCourseCount + 1.0, self->_consecutiveValidCourseCount = v15, v15 <= 3.0))
      {
LABEL_16:
        self->_lastKnownCourse = lastKnownCourse;
        objc_msgSend(v5, "setCourse:", lastKnownCourse);
        return v5;
      }
      self->_consecutiveValidCourseCount = 0.0;
    }
    lastKnownCourse = v8;
    goto LABEL_16;
  }
  objc_msgSend(v5, "rawCourse");
  self->_lastKnownCourse = v14;
  return v5;
}

- (void)_updateForLocation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  -[MNTunnelLocationProjector updateLocation:](self->_tunnelLocationProjector, "updateLocation:", v10);
  if (-[MNAlternateRoutesUpdater updateForLocation:](self->_alternateRoutesUpdater, "updateForLocation:", v10))
  {
    -[MNLocationTracker safeDelegate](self, "safeDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNAlternateRoutesUpdater alternateRoutes](self->_alternateRoutesUpdater, "alternateRoutes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationTracker:didUpdateAlternateRoutes:", self, v5);

  }
  -[NSMutableArray firstObject](self->_etauPositions, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v10, "routeMatch");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "routeCoordinate");
    objc_msgSend(v6, "routeCoordinate");
    v8 = GEOPolylineCoordinateCompare();

    if (v8 != -1)
    {
      -[MNLocationTracker safeDelegate](self, "safeDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "locationTracker:didReachETAUpdatePosition:", self, v6);

      -[NSMutableArray removeObject:](self->_etauPositions, "removeObject:", v6);
    }
  }

}

- (void)_updateForReroute:(id)a3 rerouteReason:(unint64_t)a4 request:(id)a5 response:(id)a6
{
  id v10;
  id v11;
  uint64_t Integer;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSMutableArray *v27;
  NSMutableArray *etauPositions;
  void *v29;
  void *v30;
  void *v31;
  id v32;

  v32 = a3;
  v10 = a6;
  v11 = a5;
  Integer = GEOConfigGetInteger();
  if (Integer)
  {
    v13 = Integer;
    -[MNLocationTracker lastMatchedLocation](self, "lastMatchedLocation");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      -[MNLocationTracker lastMatchedLocation](self, "lastMatchedLocation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "routeMatch");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        -[MNLocationTracker lastMatchedLocation](self, "lastMatchedLocation");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "routeMatch");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v32, "route");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "distanceToEndFromRouteCoordinate:", objc_msgSend(v18, "routeCoordinate"));
        v14 = v20;

      }
      else
      {
        v14 = 0;
      }
    }
    v21 = -[MNLocationTracker targetLegIndex](self, "targetLegIndex");
    -[MNAlternateRoutesUpdater alternateRoutes](self->_alternateRoutesUpdater, "alternateRoutes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addFakeTrafficIncidentAlert:targetLegIndex:mainRouteInfo:alternateRouteInfo:currentDistance:", v13, v21, v32, v23, v14);

  }
  -[MNTunnelLocationProjector updateForRouteInfo:](self->_tunnelLocationProjector, "updateForRouteInfo:", v32);
  -[MNAlternateRoutesUpdater updateForReroute:rerouteReason:](self->_alternateRoutesUpdater, "updateForReroute:rerouteReason:", v32, a4);
  -[MNAlternateRoutesUpdater alternateRoutes](self->_alternateRoutesUpdater, "alternateRoutes");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "route");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "etauPositions");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (NSMutableArray *)objc_msgSend(v26, "mutableCopy");
  etauPositions = self->_etauPositions;
  self->_etauPositions = v27;

  -[MNLocationTracker safeDelegate](self, "safeDelegate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "locationTracker:didReroute:newAlternateRoutes:rerouteReason:request:response:", self, v32, v24, a4, v11, v10);

  objc_msgSend(v24, "firstObject");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[MNTrafficIncidentAlert validTrafficIncidentAlertsForMainRouteInfo:alternateRouteInfo:](MNTrafficIncidentAlert, "validTrafficIncidentAlertsForMainRouteInfo:alternateRouteInfo:", v32, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNTurnByTurnLocationTracker _updateForNewTrafficIncidentAlerts:](self, "_updateForNewTrafficIncidentAlerts:", v31);

}

- (void)_updateForArrivalAtLegIndex:(unint64_t)a3
{
  objc_super v5;

  -[MNTunnelLocationProjector setDelegate:](self->_tunnelLocationProjector, "setDelegate:", 0);
  -[MNTunnelLocationProjector stop](self->_tunnelLocationProjector, "stop");
  v5.receiver = self;
  v5.super_class = (Class)MNDrivingTurnByTurnLocationTracker;
  -[MNTurnByTurnLocationTracker _updateForArrivalAtLegIndex:](&v5, sel__updateForArrivalAtLegIndex_, a3);
}

- (void)_updateForSelectedNewRoute:(id)a3 alternateRoutes:(id)a4
{
  void *v5;
  id v6;

  -[MNAlternateRoutesUpdater setAlternateRoutes:forMainRoute:](self->_alternateRoutesUpdater, "setAlternateRoutes:forMainRoute:", a4, a3);
  -[MNLocationTracker safeDelegate](self, "safeDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MNAlternateRoutesUpdater alternateRoutes](self->_alternateRoutesUpdater, "alternateRoutes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "locationTracker:didUpdateAlternateRoutes:", self, v5);

}

- (int)_detectedMotionForLocation:(id)a3
{
  id v4;
  double v5;
  void *v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  int detectedTransportType;
  void *v11;
  double v12;
  double v13;
  uint8_t v15[16];

  v4 = a3;
  if ((objc_msgSend(v4, "locationUnreliable") & 1) != 0 || (objc_msgSend(v4, "horizontalAccuracy"), v5 >= 50.0))
  {
    self->_vehicleExitConfidence = 0;
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_DEBUG, "Unreliable location to detect motion. Resetting motion.", v15, 2u);
    }

    detectedTransportType = 4;
  }
  else
  {
    -[MNLocationTracker navigationSession](self, "navigationSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "motionContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "isDriving"))
    {
      if (objc_msgSend(v7, "confidence"))
        v8 = 0;
      else
        v8 = self->_vehicleExitConfidence & 0xFFFFFFFE;
      self->_vehicleExitConfidence = v8;
      self->_detectedTransportType = 0;
    }
    else
    {
      if (!self->_vehicleExitConfidence)
      {
        objc_msgSend(v4, "rawLocation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "coordinate");
        self->_vehicleExitCoordinate.latitude = v12;
        self->_vehicleExitCoordinate.longitude = v13;

      }
      if ((objc_msgSend(v7, "isWalking") & 1) != 0 || objc_msgSend(v7, "isRunning"))
      {
        self->_vehicleExitConfidence |= 1uLL;
        self->_detectedTransportType = 2;
      }
      if (objc_msgSend(v7, "exitType") == 1)
        self->_vehicleExitConfidence |= 4uLL;
      if (objc_msgSend(v7, "exitType") == 2)
        self->_vehicleExitConfidence |= 6uLL;
    }
    detectedTransportType = self->_detectedTransportType;

  }
  return detectedTransportType;
}

- (BOOL)_allowSwitchToTransportType:(int)a3 forLocation:(id)a4
{
  return 0;
}

- (void)_updateForAlternateRoutes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[MNLocationTracker state](self, "state") != 2)
  {
    -[MNLocationTracker lastMatchedLocation](self, "lastMatchedLocation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "coordinate");
    -[MNLocationTracker navigationSession](self, "navigationSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "destination");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "geoMapItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "centerCoordinate");
    GEOCalculateDistance();
    v10 = v9;

    if (v10 < 1600.0)
    {

      v4 = 0;
    }

  }
  -[MNLocationTracker navigationSession](self, "navigationSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "routeManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "currentRouteInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[MNAlternateRoutesUpdater setAlternateRoutes:forMainRoute:](self->_alternateRoutesUpdater, "setAlternateRoutes:forMainRoute:", v4, v13))
  {
    -[MNLocationTracker safeDelegate](self, "safeDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNAlternateRoutesUpdater alternateRoutes](self->_alternateRoutesUpdater, "alternateRoutes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "locationTracker:didUpdateAlternateRoutes:", self, v15);

  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[MNAlternateRoutesUpdater alternateRoutes](self->_alternateRoutesUpdater, "alternateRoutes", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v20);
        -[MNLocationTracker safeDelegate](self, "safeDelegate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "locationTracker:didUpdateETAForRoute:", self, v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v18);
  }

}

- (void)arrivalUpdater:(id)a3 didUpdateArrivalInfo:(id)a4
{
  unint64_t v5;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a4;
  v5 = objc_msgSend(v9, "arrivalState");
  if (v5 <= 6 && ((1 << v5) & 0x62) != 0)
  {
    -[MNDrivingTurnByTurnLocationTracker _updateWalkingRouteBackgroundLoader](self, "_updateWalkingRouteBackgroundLoader");
    if (objc_msgSend(v9, "arrivalState") == 1)
      v7 = 1;
    else
      v7 = 2;
    -[MNDrivingTurnByTurnLocationTracker _currentVehicleParkingInfoForParkingType:](self, "_currentVehicleParkingInfoForParkingType:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setVehicleParkingInfo:", v8);

  }
  -[MNLocationTracker _updateArrivalInfo:](self, "_updateArrivalInfo:", v9);

}

- (void)_updateWalkingRouteBackgroundLoader
{
  void *v3;
  int isInParkingDetectionRegion;
  NSObject *v5;
  MNWalkingRouteBackgroundLoader *walkingRouteBackgroundLoader;
  MNWalkingRouteBackgroundLoader *v7;
  MNWalkingRouteBackgroundLoader *v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[MNLocationTracker navigationSessionState](self, "navigationSessionState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isInParkingDetectionRegion = 0;
  switch(objc_msgSend(v3, "arrivalState"))
  {
    case 0:
      if (self->_isInParkingDetectionRegion)
        isInParkingDetectionRegion = objc_msgSend(v3, "isDisplayingNavigationTray");
      else
        isInParkingDetectionRegion = 0;
      break;
    case 1:
    case 5:
      isInParkingDetectionRegion = 1;
      break;
    case 6:
      isInParkingDetectionRegion = self->_isInParkingDetectionRegion;
      break;
    default:
      break;
  }
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = isInParkingDetectionRegion;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEFAULT, "Should start walking route background loader: %d", (uint8_t *)v9, 8u);
  }

  walkingRouteBackgroundLoader = self->_walkingRouteBackgroundLoader;
  if ((isInParkingDetectionRegion & 1) != 0)
  {
    if (!walkingRouteBackgroundLoader)
    {
      v7 = objc_alloc_init(MNWalkingRouteBackgroundLoader);
      v8 = self->_walkingRouteBackgroundLoader;
      self->_walkingRouteBackgroundLoader = v7;

      -[MNWalkingRouteBackgroundLoader setDelegate:](self->_walkingRouteBackgroundLoader, "setDelegate:", self);
      walkingRouteBackgroundLoader = self->_walkingRouteBackgroundLoader;
    }
    -[MNWalkingRouteBackgroundLoader setNavigationSessionState:](walkingRouteBackgroundLoader, "setNavigationSessionState:", v3);
    -[MNWalkingRouteBackgroundLoader start](self->_walkingRouteBackgroundLoader, "start");
  }
  else
  {
    -[MNWalkingRouteBackgroundLoader stop](walkingRouteBackgroundLoader, "stop");
  }

}

- (void)arrivalUpdaterDidEnterParkingDetectionRegion:(id)a3
{
  self->_isInParkingDetectionRegion = 1;
  -[MNDrivingTurnByTurnLocationTracker _updateWalkingRouteBackgroundLoader](self, "_updateWalkingRouteBackgroundLoader", a3);
}

- (void)arrivalUpdaterDidLeaveParkingDetectionRegion:(id)a3
{
  self->_isInParkingDetectionRegion = 0;
  -[MNDrivingTurnByTurnLocationTracker _updateWalkingRouteBackgroundLoader](self, "_updateWalkingRouteBackgroundLoader", a3);
}

- (void)arrivalUpdater:(id)a3 didUpdateVehicleParkingType:(int64_t)a4
{
  void *v5;
  id v6;

  -[MNDrivingTurnByTurnLocationTracker _currentVehicleParkingInfoForParkingType:](self, "_currentVehicleParkingInfoForParkingType:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MNLocationTracker safeDelegate](self, "safeDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationTracker:didUpdateVehicleParkingInfo:", self, v6);

}

- (void)tunnelLocationProjector:(id)a3 didUpdateLocation:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[MNLocationTracker _updateMatchedLocation:](self, "_updateMatchedLocation:", v5);
  -[MNLocationTracker safeDelegate](self, "safeDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "locationTracker:didUpdateMatchedLocation:", self, v5);

}

- (void)walkingRouteBackgroundLoader:(id)a3 didUpdateWalkingRoute:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[MNLocationTracker safeDelegate](self, "safeDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "locationTracker:didUpdateBackgroundWalkingRoute:", self, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_etauPositions, 0);
  objc_storeStrong((id *)&self->_walkingRouteBackgroundLoader, 0);
  objc_storeStrong((id *)&self->_alternateRoutesUpdater, 0);
  objc_storeStrong((id *)&self->_tunnelLocationProjector, 0);
}

- (void)tracePaused
{
  -[MNTunnelLocationProjector stop](self->_tunnelLocationProjector, "stop");
}

@end
