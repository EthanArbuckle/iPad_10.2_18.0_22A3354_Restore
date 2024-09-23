@implementation MNCyclingTurnByTurnLocationTracker

- (MNCyclingTurnByTurnLocationTracker)initWithNavigationSession:(id)a3
{
  MNCyclingTurnByTurnLocationTracker *v3;
  MNCyclingTurnByTurnLocationTracker *v4;
  MNCyclingTurnByTurnLocationTracker *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MNCyclingTurnByTurnLocationTracker;
  v3 = -[MNTurnByTurnLocationTracker initWithNavigationSession:](&v7, sel_initWithNavigationSession_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_lastKnownCourse = -1.0;
    v5 = v3;
  }

  return v4;
}

- (int)transportType
{
  return 3;
}

- (BOOL)shouldProjectAlongRoute
{
  return 1;
}

- (void)startTrackingWithInitialLocation:(id)a3 targetLegIndex:(unint64_t)a4
{
  MNTunnelLocationProjector *v5;
  MNTunnelLocationProjector *tunnelLocationProjector;
  void *v7;
  void *v8;
  MNAlternateRoutesUpdater *v9;
  MNAlternateRoutesUpdater *alternateRoutesUpdater;
  MNAlternateRoutesUpdater *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSMutableArray *v18;
  NSMutableArray *etauPositions;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)MNCyclingTurnByTurnLocationTracker;
  -[MNTurnByTurnLocationTracker startTrackingWithInitialLocation:targetLegIndex:](&v20, sel_startTrackingWithInitialLocation_targetLegIndex_, a3, a4);
  v5 = objc_alloc_init(MNTunnelLocationProjector);
  tunnelLocationProjector = self->_tunnelLocationProjector;
  self->_tunnelLocationProjector = v5;

  -[MNTunnelLocationProjector setDelegate:](self->_tunnelLocationProjector, "setDelegate:", self);
  -[MNLocationTracker navigationSession](self, "navigationSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "routeManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MNAlternateRoutesUpdater);
  alternateRoutesUpdater = self->_alternateRoutesUpdater;
  self->_alternateRoutesUpdater = v9;

  v11 = self->_alternateRoutesUpdater;
  objc_msgSend(v8, "alternateRoutes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentRouteInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNAlternateRoutesUpdater setAlternateRoutes:forMainRoute:](v11, "setAlternateRoutes:forMainRoute:", v12, v13);

  -[MNLocationTracker safeDelegate](self, "safeDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNAlternateRoutesUpdater alternateRoutes](self->_alternateRoutesUpdater, "alternateRoutes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "locationTracker:didUpdateAlternateRoutes:", self, v15);

  objc_msgSend(v8, "currentRoute");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "etauPositions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (NSMutableArray *)objc_msgSend(v17, "mutableCopy");
  etauPositions = self->_etauPositions;
  self->_etauPositions = v18;

}

- (void)stopTracking
{
  MNAlternateRoutesUpdater *alternateRoutesUpdater;
  MNTunnelLocationProjector *tunnelLocationProjector;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MNCyclingTurnByTurnLocationTracker;
  -[MNTurnByTurnLocationTracker stopTracking](&v5, sel_stopTracking);
  alternateRoutesUpdater = self->_alternateRoutesUpdater;
  self->_alternateRoutesUpdater = 0;

  -[MNTunnelLocationProjector setDelegate:](self->_tunnelLocationProjector, "setDelegate:", 0);
  -[MNTunnelLocationProjector stop](self->_tunnelLocationProjector, "stop");
  tunnelLocationProjector = self->_tunnelLocationProjector;
  self->_tunnelLocationProjector = 0;

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
  NSObject *v25;
  objc_super v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MNGetPuckTrackingLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v29 = v6;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_INFO, "[MN] [%@] - Processing - in MNCyclingLocationTracker::_matchedLocationForLocation:", buf, 0xCu);

  }
  MNGetMNLocationTrackerLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);
  v9 = v7;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "MatchedCyclingTBTLocationForLocation", ", buf, 2u);
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
LABEL_20:

        goto LABEL_21;
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
  v27.receiver = self;
  v27.super_class = (Class)MNCyclingTurnByTurnLocationTracker;
  -[MNTurnByTurnLocationTracker _matchedLocationForLocation:](&v27, sel__matchedLocationForLocation_, v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v10;
  v25 = v24;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v25, OS_SIGNPOST_INTERVAL_END, v8, "MatchedCyclingTBTLocationForLocation", ", buf, 2u);
  }

  if (GEOConfigGetBOOL())
  {
    objc_msgSend(v4, "uuid");
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setUuid:", v14);
    goto LABEL_20;
  }
LABEL_21:

  return v16;
}

- (id)_newMapMatcherForRoute:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x1E0D27260];
  v5 = a3;
  v6 = [v4 alloc];
  -[MNLocationTracker _auditToken](self, "_auditToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithRoute:auditToken:", v5, v7);

  objc_msgSend(v8, "setUseMatchedCoordinateForMatching:", 1);
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
  MNAlternateRoutesUpdater *alternateRoutesUpdater;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSMutableArray *v16;
  NSMutableArray *etauPositions;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  alternateRoutesUpdater = self->_alternateRoutesUpdater;
  v11 = a6;
  v12 = a5;
  v13 = a3;
  -[MNAlternateRoutesUpdater updateForReroute:rerouteReason:](alternateRoutesUpdater, "updateForReroute:rerouteReason:", v13, a4);
  -[MNAlternateRoutesUpdater alternateRoutes](self->_alternateRoutesUpdater, "alternateRoutes");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "route");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "etauPositions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (NSMutableArray *)objc_msgSend(v15, "mutableCopy");
  etauPositions = self->_etauPositions;
  self->_etauPositions = v16;

  -[MNLocationTracker safeDelegate](self, "safeDelegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "locationTracker:didReroute:newAlternateRoutes:rerouteReason:request:response:", self, v13, v21, a4, v12, v11);

  objc_msgSend(v21, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[MNTrafficIncidentAlert validTrafficIncidentAlertsForMainRouteInfo:alternateRouteInfo:](MNTrafficIncidentAlert, "validTrafficIncidentAlertsForMainRouteInfo:alternateRouteInfo:", v13, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[MNTurnByTurnLocationTracker _updateForNewTrafficIncidentAlerts:](self, "_updateForNewTrafficIncidentAlerts:", v20);
}

- (void)_updateForArrivalAtLegIndex:(unint64_t)a3
{
  objc_super v5;

  -[MNTunnelLocationProjector setDelegate:](self->_tunnelLocationProjector, "setDelegate:", 0);
  -[MNTunnelLocationProjector stop](self->_tunnelLocationProjector, "stop");
  v5.receiver = self;
  v5.super_class = (Class)MNCyclingTurnByTurnLocationTracker;
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
  return 3;
}

- (BOOL)_allowSwitchToTransportType:(int)a3 forLocation:(id)a4
{
  return 0;
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

    if (v10 < 1000.0)
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_etauPositions, 0);
  objc_storeStrong((id *)&self->_alternateRoutesUpdater, 0);
  objc_storeStrong((id *)&self->_tunnelLocationProjector, 0);
}

@end
