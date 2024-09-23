@implementation GEORouteHypothesisMonitorWalkingDriving

- (void)_recalculateETAWithRouteMatch:(id)a3
{
  id v4;
  void *liveETARoute;
  id v6;
  GEOComposedETARoute *v7;
  int v8;
  NSObject *v9;
  GEOComposedRoute *route;
  uint64_t v11;
  GEOComposedETARoute *v12;
  double v13;
  double v14;
  NSObject *v15;
  uint64_t v16;
  double v17;
  void *v18;
  GEOComposedETARoute *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  NSObject *v27;
  _BOOL4 v28;
  void *v29;
  NSObject *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  int v35;
  double v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  GEOComposedETARoute *v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  liveETARoute = self->super._liveETARoute;
  if (!liveETARoute)
    liveETARoute = self->super._route;
  v6 = liveETARoute;
  if (-[GEORouteHypothesisMonitor supportsLiveTraffic](self, "supportsLiveTraffic"))
  {
    v7 = self->super._liveETARoute;
    if (!v7 || -[GEOComposedETARoute hasValidTravelDurations](v7, "hasValidTravelDurations"))
    {
      v8 = 1;
      goto LABEL_11;
    }
    GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v35) = 0;
      _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_ERROR, "Live ETA route doesn't have valid travel durations. Falling back to static travel durations.", (uint8_t *)&v35, 2u);
    }

  }
  v8 = 0;
LABEL_11:
  route = self->super._route;
  v11 = objc_msgSend(v4, "routeCoordinate");
  if (v8)
    v12 = self->super._liveETARoute;
  else
    v12 = 0;
  -[GEOComposedRoute remainingTimeToEndOfRouteFrom:etaRoute:](route, "remainingTimeToEndOfRouteFrom:etaRoute:", v11, v12);
  v14 = v13;
  GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = objc_msgSend(v4, "routeCoordinate");
    GEOPolylineCoordinateAsString(v16, 1, 0, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = self->super._liveETARoute;
    v35 = 134218755;
    v36 = v14;
    v37 = 2113;
    v38 = v18;
    v39 = 2048;
    v40 = v19;
    v41 = 1024;
    v42 = v8;
    _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_INFO, "Remaining time: %0.1fs | routeCoordinate: %{private}@ | etaRoute: %p | usingLiveTravelDurations: %d", (uint8_t *)&v35, 0x26u);

  }
  objc_msgSend(v6, "_hypothesis_travelDurationAggressiveEstimate");
  v20 = 0.0;
  if (v21 <= 0.0 || (objc_msgSend(v6, "_hypothesis_travelDurationConservativeEstimate"), v22 <= 0.0))
  {
    v23 = 0.0;
  }
  else
  {
    objc_msgSend(v6, "_hypothesis_travelDuration");
    v23 = 0.0;
    if (v24 > 0.0)
    {
      if (v4)
      {
        objc_msgSend(v6, "_hypothesis_travelDuration");
        if (v25 != 0.0)
        {
          objc_msgSend(v6, "_hypothesis_travelDuration");
          v23 = v14 / v26;
        }
      }
      else
      {
        v23 = 1.0;
      }
      objc_msgSend(v6, "_hypothesis_travelDurationConservativeEstimate");
      v33 = v32;
      objc_msgSend(v6, "_hypothesis_travelDurationAggressiveEstimate");
      v20 = v23 * v33;
      v23 = v23 * v34;
    }
  }
  GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = os_log_type_enabled(v27, OS_LOG_TYPE_INFO);

  if (v28)
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeInterval:sinceDate:", self->super._arrivalDate, -v20);
    GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
    v30 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      _navd_debugDurationAsString(v14);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 138478083;
      v36 = *(double *)&v31;
      v37 = 2113;
      v38 = v29;
      _os_log_impl(&dword_1885A9000, v30, OS_LOG_TYPE_INFO, "Updating ETA along route | ETA with traffic: %{private}@ | Conservative Start Date: %{private}@", (uint8_t *)&v35, 0x16u);

    }
  }
  -[GEORouteHypothesis _setError:](self->super._hypothesis, "_setError:", 0);
  -[GEORouteHypothesis _updateDepartureAndArrivalSuggestionsForArrivalDate:travelTimeWithTraffic:conservativeTravelTime:aggressiveTravelTime:transportType:](self->super._hypothesis, "_updateDepartureAndArrivalSuggestionsForArrivalDate:travelTimeWithTraffic:conservativeTravelTime:aggressiveTravelTime:transportType:", self->super._arrivalDate, -[GEOComposedRoute transportType](self->super._route, "transportType"), v14, v20, v23);

}

- (void)_fetchETAWithRouteMatch:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (-[GEORouteHypothesisMonitor supportsLiveTraffic](self, "supportsLiveTraffic"))
  {
    if (v4)
      -[GEORouteHypothesisMonitorWalkingDriving _sendETARequestWithRouteMatch:updater:](self, "_sendETARequestWithRouteMatch:updater:", v4, self->super._liveETAUpdater);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)GEORouteHypothesisMonitorWalkingDriving;
    -[GEORouteHypothesisMonitor _fetchETAWithRouteMatch:](&v5, sel__fetchETAWithRouteMatch_, v4);
  }

}

- (void)_sendETARequestWithRouteMatch:(id)a3 updater:(id)a4
{
  id v6;
  id v7;
  void *v8;
  GEOComposedWaypoint *destination;
  void *v10;
  void *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "setRoute:", self->super._route);
    destination = self->super._destination;
    v12[0] = self->super._source;
    v12[1] = destination;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWaypoints:", v10);

    objc_msgSend(v8, "setUserLocation:", self->super._lastLocation);
    objc_msgSend(v8, "setRouteMatch:", v6);
    v11 = (void *)-[GEORouteAttributes copy](self->super._routeAttributes, "copy");
    objc_msgSend(v8, "setRouteAttributes:", v11);

    objc_msgSend(v8, "requestUpdate");
  }

}

- (void)checkRouteForLocation:(id)a3
{
  id v5;
  GEORouteMatch *routeMatch;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  NSObject *v16;
  GEOLocation *lastMatchedLocation;
  GEOLocation **p_lastMatchedLocation;
  double v19;
  double v20;
  double v21;
  NSObject *v22;
  void *v23;
  double v24;
  _BOOL4 v25;
  GEOLocation *v26;
  void *v27;
  double v28;
  _BOOL4 v29;
  GEORouteMatch *v30;
  GEORouteMatch *v31;
  GEORouteMatch *v32;
  NSObject *v33;
  _BOOL4 hasArrived;
  _BOOL4 needReroute;
  int v36;
  _BYTE v37[10];
  __int16 v38;
  _BOOL4 v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  routeMatch = self->super._routeMatch;
  self->super._routeMatch = 0;

  if (self->super._route)
  {
    -[GEOLocation coordinate](self->super._originLocation, "coordinate");
    v8 = v7;
    v10 = v9;
    objc_msgSend(v5, "coordinate");
    v12 = v11;
    v14 = v13;
    v15 = GEOCalculateDistanceRadius(v8, v10, v11, v13, 6367000.0);
    GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v36 = 134217984;
      *(double *)v37 = v15;
      _os_log_impl(&dword_1885A9000, v16, OS_LOG_TYPE_DEBUG, "Distance between origin and location is: %.2f", (uint8_t *)&v36, 0xCu);
    }

    p_lastMatchedLocation = &self->super._lastMatchedLocation;
    lastMatchedLocation = self->super._lastMatchedLocation;
    if (lastMatchedLocation)
    {
      -[GEOLocation coordinate](lastMatchedLocation, "coordinate");
      v21 = GEOCalculateDistanceRadius(v19, v20, v12, v14, 6367000.0);
      GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        v36 = 134217984;
        *(double *)v37 = v21;
        _os_log_impl(&dword_1885A9000, v22, OS_LOG_TYPE_DEBUG, "Distance between location and last matched location is: %.2f", (uint8_t *)&v36, 0xCu);
      }

      +[GEONavdDefaults sharedInstance](GEONavdDefaults, "sharedInstance");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "exitRegionSize");
      v25 = v21 > v24;

      v26 = *p_lastMatchedLocation;
    }
    else
    {
      v26 = 0;
      v25 = 1;
    }
    *p_lastMatchedLocation = 0;

    +[GEONavdDefaults sharedInstance](GEONavdDefaults, "sharedInstance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "exitRegionSize");
    v29 = v15 > v28 && v25;

    if (self->super._isTraveling != v29)
    {
      self->super._isTraveling = v29;
      -[GEORouteHypothesisMonitor travelStateChanged](self, "travelStateChanged");
    }
    -[GEORouteHypothesisMonitor routeMatchForLocation:](self, "routeMatchForLocation:", v5);
    v30 = (GEORouteMatch *)objc_claimAutoreleasedReturnValue();
    v31 = self->super._routeMatch;
    self->super._routeMatch = v30;

    if (self->super._routeMatch)
    {
      objc_storeStrong((id *)&self->super._lastMatchedLocation, a3);
      v32 = self->super._routeMatch;
      if (v32)
      {
        if (-[GEORouteMatch isGoodMatch](v32, "isGoodMatch"))
        {
          -[GEORouteHypothesisMonitor cancelCurrentRequest](self, "cancelCurrentRequest");
          -[GEORouteHypothesisMonitor _updateScoreForLocation:](self, "_updateScoreForLocation:", v5);
          self->super._needReroute = 0;
        }
      }
    }
    if (-[GEORouteHypothesisMonitorWalkingDriving _checkForArrival:routeMatch:](self, "_checkForArrival:routeMatch:", v5, self->super._routeMatch))
    {
      if (!self->super._hasArrived)
      {
        -[GEORouteHypothesizerAnalyticsStore didArriveWithExpectedArrivalTime:](self->super._analyticsStore, "didArriveWithExpectedArrivalTime:", self->super._arrivalDate);
        self->super._hasArrived = 1;
      }
    }
    else if (-[GEORouteMatch isGoodMatch](self->super._routeMatch, "isGoodMatch"))
    {
      self->super._hasArrived = 0;
    }
    else
    {
      self->super._needReroute = 1;
    }
    GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      hasArrived = self->super._hasArrived;
      needReroute = self->super._needReroute;
      v36 = 67109632;
      *(_DWORD *)v37 = v29;
      *(_WORD *)&v37[4] = 1024;
      *(_DWORD *)&v37[6] = hasArrived;
      v38 = 1024;
      v39 = needReroute;
      _os_log_impl(&dword_1885A9000, v33, OS_LOG_TYPE_DEBUG, "User traveling? %d. User arrived? %d. Need reroute? %d", (uint8_t *)&v36, 0x14u);
    }

  }
}

- (BOOL)_checkForArrival:(id)a3 routeMatch:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  GEOMapRegion *v13;
  GEOMapRegion *arrivalMapRegion;
  GEOComposedRoute *route;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  double v25;
  BOOL v26;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "step");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      v11 = objc_msgSend(v9, "maneuverType") == 18
         || objc_msgSend(v10, "maneuverType") == 33
         || objc_msgSend(v10, "maneuverType") == 34;
    else
      v11 = 0;

  }
  else
  {
    v11 = 0;
  }
  if (!self->super._arrivalMapRegion)
  {
    -[GEOComposedWaypoint geoMapItem](self->super._destination, "geoMapItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_arrivalMapRegionForTransportType:", -[GEORouteHypothesisMonitor transportType](self, "transportType"));
    v13 = (GEOMapRegion *)objc_claimAutoreleasedReturnValue();
    arrivalMapRegion = self->super._arrivalMapRegion;
    self->super._arrivalMapRegion = v13;

  }
  route = self->super._route;
  objc_msgSend(v6, "coordinate");
  v17 = v16;
  v19 = v18;
  objc_msgSend(v8, "locationCoordinate");
  v21 = v20;
  v23 = v22;
  v24 = objc_msgSend(v8, "routeCoordinate");
  objc_msgSend(v8, "distanceFromRoute");
  v26 = -[GEOComposedRoute checkDrivingArrivalForCoordinate:coordinateOnRoute:routePointIndex:distanceFromRoute:arrivalMapRegion:checkArrivalRadius:checkDistanceAlongRoute:checkRoadAccessPoints:isOnRoute:](route, "checkDrivingArrivalForCoordinate:coordinateOnRoute:routePointIndex:distanceFromRoute:arrivalMapRegion:checkArrivalRadius:checkDistanceAlongRoute:checkRoadAccessPoints:isOnRoute:", v24, self->super._arrivalMapRegion, 1, v11, 0, objc_msgSend(v8, "isGoodMatch"), v17, v19, v21, v23, v25);

  return v26;
}

@end
