@implementation MSPNavigationListener

- (MSPNavigationListener)init
{
  MSPNavigationListener *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  GEONavigationListener *navigationListener;
  objc_super v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)MSPNavigationListener;
  v2 = -[MSPNavigationListener init](&v8, sel_init);
  if (v2)
  {
    MSPGetSharedTripLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136380675;
      v10 = "-[MSPNavigationListener init]";
      _os_log_impl(&dword_1B39C0000, v3, OS_LOG_TYPE_DEBUG, "[NavListener] %{private}s", buf, 0xCu);
    }

    v4 = objc_alloc(MEMORY[0x1E0D27278]);
    v5 = objc_msgSend(v4, "initWithQueue:wantsRoutes:", MEMORY[0x1E0C80D38], 1);
    navigationListener = v2->_navigationListener;
    v2->_navigationListener = (GEONavigationListener *)v5;

    -[GEONavigationListener setDelegate:](v2->_navigationListener, "setDelegate:", v2);
  }
  return v2;
}

- (void)_initPendingStateIfNeeded
{
  -[MSPNavigationListener _initPendingStateIfNeededWithTransportType:isResumingMultipointRoute:](self, "_initPendingStateIfNeededWithTransportType:isResumingMultipointRoute:", -[MSPNavigationListener _currentTransportType](self, "_currentTransportType"), -[GEONavigationListener isResumingMultipointRoute](self->_navigationListener, "isResumingMultipointRoute"));
}

- (void)_initPendingStateIfNeededWithTransportType:(int)a3 isResumingMultipointRoute:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  id WeakRetained;
  NSObject *v8;
  const char *v9;
  GEOSharedNavState *v10;
  GEOSharedNavState *state;
  void *v12;
  NSObject *v13;
  __CFString *v14;
  __CFString *v15;
  NSObject *v16;
  uint8_t buf[4];
  __CFString *v18;
  __int16 v19;
  _BOOL4 v20;
  uint64_t v21;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v21 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!WeakRetained)
  {
    MSPGetSharedTripLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v9 = "MSPNavigationListener not creating state, no delegate";
      goto LABEL_16;
    }
LABEL_17:

    goto LABEL_18;
  }
  if (self->_state)
  {
    MSPGetSharedTripLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v9 = "MSPNavigationListener not creating state, we already have one";
LABEL_16:
      _os_log_impl(&dword_1B39C0000, v8, OS_LOG_TYPE_INFO, v9, buf, 2u);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  if (!-[MSPNavigationListener isInNavigatingState](self, "isInNavigatingState"))
  {
    MSPGetSharedTripLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v9 = "MSPNavigationListener not creating state, not navigating";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if ((_DWORD)v5 == 4 || !-[MSPNavigationListener _isCompatibleTransportType:](self, "_isCompatibleTransportType:", v5))
  {
    MSPGetSharedTripLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      if (v5 >= 7)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v5);
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = off_1E6654488[(int)v5];
      }
      *(_DWORD *)buf = 138412290;
      v18 = v15;
      _os_log_impl(&dword_1B39C0000, v8, OS_LOG_TYPE_INFO, "MSPNavigationListener not creating state, unknown or incompatible transport type: %@", buf, 0xCu);

    }
    goto LABEL_17;
  }
  v10 = (GEOSharedNavState *)objc_alloc_init(MEMORY[0x1E0D27540]);
  state = self->_state;
  self->_state = v10;

  -[MSPNavigationListener navigationSessionIdentifier](self, "navigationSessionIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOSharedNavState setGroupIdentifier:](self->_state, "setGroupIdentifier:", v12);

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  -[GEOSharedNavState setUpdatedTimestamp:](self->_state, "setUpdatedTimestamp:");
  MSPGetSharedTripLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    if (v5 < 7 && ((0x6Fu >> v5) & 1) != 0)
    {
      v14 = off_1E6654450[(int)v5];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v5);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    *(_DWORD *)buf = 138412546;
    v18 = v14;
    v19 = 1024;
    v20 = v4;
    _os_log_impl(&dword_1B39C0000, v13, OS_LOG_TYPE_DEFAULT, "MSPNavigationListener create state for transport type: %@ isResumingMultipointRoute: %d", buf, 0x12u);

  }
  -[GEOSharedNavState setTransportType:](self->_state, "setTransportType:", v5);
  -[GEOSharedNavState setProtocolVersion:](self->_state, "setProtocolVersion:", 1);
  -[GEOSharedNavState setClosed:](self->_state, "setClosed:", 0);
  -[GEOSharedNavState setArrived:](self->_state, "setArrived:", -[MSPNavigationListener _currentlyArrivedAtWaypoint](self, "_currentlyArrivedAtWaypoint"));
  -[GEOSharedNavState setResumed:](self->_state, "setResumed:", v4);
  self->_postedStateIsReady = 0;
  MSPGetSharedTripLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B39C0000, v16, OS_LOG_TYPE_INFO, "MSPNavigationListener requesting current guidance, route, ETA and current step...", buf, 2u);
  }

  -[GEONavigationListener requestGuidanceState](self->_navigationListener, "requestGuidanceState");
  -[GEONavigationListener requestRoute](self->_navigationListener, "requestRoute");
  -[GEONavigationListener requestETAUpdate](self->_navigationListener, "requestETAUpdate");
  -[GEONavigationListener requestStepIndex](self->_navigationListener, "requestStepIndex");
LABEL_18:

}

- (void)_checkStateIsReady
{
  id WeakRetained;
  void *v4;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  uint64_t v11;
  __CFString *v12;
  GEOSharedNavState *state;
  __CFString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint8_t buf[4];
  __CFString *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = WeakRetained;
  if (self->_state)
  {
    if (!self->_postedStateIsReady && WeakRetained != 0)
    {
      MSPGetSharedTripLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_DEFAULT, "MSPNavigationListener checking state...", buf, 2u);
      }

      -[GEOSharedNavState destinationInfo](self->_state, "destinationInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7 || !-[GEOSharedNavState waypointInfosCount](self->_state, "waypointInfosCount"))
        goto LABEL_17;
      -[GEOSharedNavState etaInfo](self->_state, "etaInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v8, "hasEtaTimestamp")
        || (-[GEOSharedNavState hasTransportType](self->_state, "hasTransportType") & 1) == 0)
      {

LABEL_17:
        goto LABEL_18;
      }
      v9 = -[GEOSharedNavState hasCurrentWaypointIndex](self->_state, "hasCurrentWaypointIndex");

      if (v9)
      {
        -[GEONavigationListener lastLocation](self->_navigationListener, "lastLocation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[MSPNavigationListener _updateLocation:withRouteMatchedCoordinate:](self, "_updateLocation:withRouteMatchedCoordinate:", v7, *MEMORY[0x1E0D26A38]);
        MSPGetSharedTripLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = -[GEOSharedNavState transportType](self->_state, "transportType");
          if (v11 >= 7)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v11);
            v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v12 = off_1E6654488[(int)v11];
          }
          state = self->_state;
          v14 = v12;
          -[GEOSharedNavState etaInfos](state, "etaInfos");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[GEOSharedNavState destinationName](self->_state, "destinationName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = -[GEOSharedNavState waypointInfosCount](self->_state, "waypointInfosCount");

          *(_DWORD *)buf = 138413314;
          v19 = v12;
          v20 = 2112;
          v21 = v15;
          v22 = 2112;
          v23 = v16;
          v24 = 2048;
          v25 = v17;
          v26 = 2112;
          v27 = v7;
          _os_log_impl(&dword_1B39C0000, v10, OS_LOG_TYPE_DEFAULT, "MSPNavigationListener has required info (transportType: %@, ETAs: %@, destination: %@, %lu waypoints), optional (location: %@)", buf, 0x34u);

        }
        self->_postedStateIsReady = 1;
        objc_msgSend(v4, "navigationListenerIsReady:", self);
        goto LABEL_17;
      }
    }
  }
LABEL_18:

}

- (NSString)navigationSessionIdentifier
{
  NSString *navigationSessionIdentifier;
  void *v4;
  NSString *v5;
  NSString *v6;

  navigationSessionIdentifier = self->_navigationSessionIdentifier;
  if (!navigationSessionIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_navigationSessionIdentifier;
    self->_navigationSessionIdentifier = v5;

    navigationSessionIdentifier = self->_navigationSessionIdentifier;
  }
  return navigationSessionIdentifier;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  GEOSharedNavState *state;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    state = self->_state;
    self->_state = 0;

    self->_postedStateIsReady = 0;
  }
  objc_storeWeak((id *)&self->_delegate, obj);
  -[MSPNavigationListener _updateTransaction](self, "_updateTransaction");
  -[MSPNavigationListener _initPendingStateIfNeeded](self, "_initPendingStateIfNeeded");

}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  MSPGetSharedTripLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136380675;
    v6 = "-[MSPNavigationListener dealloc]";
    _os_log_impl(&dword_1B39C0000, v3, OS_LOG_TYPE_DEBUG, "[NavListener] %{private}s", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)MSPNavigationListener;
  -[MSPNavigationListener dealloc](&v4, sel_dealloc);
}

- (GEOSharedNavState)currentState
{
  return self->_state;
}

- (BOOL)isInNavigatingState
{
  return -[GEONavigationListener navigationState](self->_navigationListener, "navigationState") == 2;
}

- (BOOL)isCompatibleNavigationType
{
  int v3;

  if (-[GEONavigationListener navigationState](self->_navigationListener, "navigationState") == 2)
  {
    v3 = -[GEONavigationGuidanceState hasNavigationType](self->_guidanceState, "hasNavigationType");
    if (v3)
      LOBYTE(v3) = -[GEONavigationGuidanceState navigationType](self->_guidanceState, "navigationType") == 1;
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)isCompatibleTransportType
{
  return -[MSPNavigationListener _isCompatibleTransportType:](self, "_isCompatibleTransportType:", -[MSPNavigationListener _currentTransportType](self, "_currentTransportType"));
}

- (BOOL)_isCompatibleTransportType:(int)a3
{
  uint64_t v4;

  if (-[GEONavigationListener navigationState](self->_navigationListener, "navigationState") != 2)
    return 0;
  if ((a3 - 1) > 5)
    v4 = 1;
  else
    v4 = qword_1B3A369B0[a3 - 1];
  return MSPSharedTripSharingSupportedForTransportType(v4);
}

- (int)_currentTransportType
{
  if (-[GEONavigationGuidanceState hasTrackedTransportType](self->_guidanceState, "hasTrackedTransportType"))return -[GEONavigationGuidanceState trackedTransportType](self->_guidanceState, "trackedTransportType");
  else
    return 4;
}

- (BOOL)_currentlyArrivedAtWaypoint
{
  int v3;

  v3 = -[GEONavigationGuidanceState hasNavigationState](self->_guidanceState, "hasNavigationState");
  if (v3)
    LOBYTE(v3) = (-[GEONavigationGuidanceState navigationState](self->_guidanceState, "navigationState") & 0xFFFFFFFE) == 6;
  return v3;
}

- (void)_updateRoute:(id)a3
{
  id v4;
  GEOSharedNavState *state;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  state = self->_state;
  if (state)
  {
    if ((-[GEOSharedNavState hasReferenceFrame](state, "hasReferenceFrame") & 1) == 0)
    {
      objc_msgSend(v4, "destination");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOSharedNavState setReferenceFrame:](self->_state, "setReferenceFrame:", -[MSPNavigationListener _referenceFrameForDestination:](self, "_referenceFrameForDestination:", v6));

    }
    -[GEOSharedNavState updateRouteInfoFromComposedRoute:](self->_state, "updateRouteInfoFromComposedRoute:", v4);
    MSPGetSharedTripNavEventsLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      -[GEOSharedNavState mspDescription](self->_state, "mspDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_1B39C0000, v7, OS_LOG_TYPE_DEBUG, "_updateRoute %@", (uint8_t *)&v9, 0xCu);

    }
    -[MSPNavigationListener _checkStateIsReady](self, "_checkStateIsReady");
  }

}

- (BOOL)_updateTraffic:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  BOOL v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!self->_state)
    return 0;
  v4 = a3;
  MSPGetSharedTripNavEventsLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    -[GEOSharedNavState mspDescription](self->_state, "mspDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_DEBUG, "_updateTraffic %@", (uint8_t *)&v9, 0xCu);

  }
  v7 = -[GEOSharedNavState updateFromTraffic:](self->_state, "updateFromTraffic:", v4);

  return v7;
}

- (BOOL)_updateLocation:(id)a3 withRouteMatchedCoordinate:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  BOOL v14;
  id v15;
  void *v16;
  double v17;
  NSObject *v18;
  void *v19;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (self->_state)
  {
    objc_msgSend(v6, "latLng");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[GEOSharedNavState lastLocation](self->_state, "lastLocation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOSharedNavState lastLocation](self->_state, "lastLocation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "coordinate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "latLng");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "isEqual:", v12))
      {
        objc_msgSend(v9, "matchedCoordinate");
        v13 = GEOPolylineCoordinateEqual();

        if ((v13 & 1) != 0)
        {
          v14 = 0;
LABEL_13:

          goto LABEL_14;
        }
      }
      else
      {

      }
      v15 = objc_alloc_init(MEMORY[0x1E0D27528]);
      objc_msgSend(v7, "latLng");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setCoordinate:", v16);

      if (GEOPolylineCoordinateIsValid())
      {
        objc_msgSend(v15, "setMatchedCoordinateIndex:", a4);
        *(float *)&v17 = a4.var1;
        objc_msgSend(v15, "setMatchedCoordinateOffset:", v17);
      }
      -[GEOSharedNavState setLastLocation:](self->_state, "setLastLocation:", v15);
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      -[GEOSharedNavState setUpdatedTimestamp:](self->_state, "setUpdatedTimestamp:");
      MSPGetSharedTripNavEventsLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        -[GEOSharedNavState mspDescription](self->_state, "mspDescription");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138412290;
        v22 = v19;
        _os_log_impl(&dword_1B39C0000, v18, OS_LOG_TYPE_DEBUG, "_updateLocation %@", (uint8_t *)&v21, 0xCu);

      }
      v14 = 1;
      goto LABEL_13;
    }
  }
  v14 = 0;
LABEL_14:

  return v14;
}

- (BOOL)_updateWaypointsIfNeeded:(id)a3
{
  id v4;
  BOOL v5;
  GEOSharedNavState *state;
  NSObject *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = 0;
  if (v4)
  {
    state = self->_state;
    if (state)
    {
      if (-[GEOSharedNavState updateWaypointsFromComposedRoute:](state, "updateWaypointsFromComposedRoute:", v4))
      {
        MSPGetSharedTripNavEventsLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v4, "waypoints");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "valueForKey:", CFSTR("name"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = 138477827;
          v12 = v9;
          _os_log_impl(&dword_1B39C0000, v7, OS_LOG_TYPE_DEFAULT, "MSPNavigationListener waypoints updated %{private}@", (uint8_t *)&v11, 0xCu);

        }
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        -[GEOSharedNavState setUpdatedTimestamp:](self->_state, "setUpdatedTimestamp:");
        v5 = 1;
      }
      else
      {
        v5 = 0;
      }
    }
  }

  return v5;
}

- (void)_updateCurrentWaypointIndexFromArrivalTimeInfo:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  unsigned int v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a3 && self->_state)
  {
    v4 = objc_msgSend(a3, "legIndex");
    if ((-[GEOSharedNavState hasCurrentWaypointIndex](self->_state, "hasCurrentWaypointIndex") & 1) != 0)
    {
      if (-[GEOSharedNavState currentWaypointIndex](self->_state, "currentWaypointIndex") != (_DWORD)v4)
      {
        MSPGetSharedTripNavEventsLog();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v6 = -[GEOSharedNavState currentWaypointIndex](self->_state, "currentWaypointIndex");
          v8 = 134218240;
          v9 = v6;
          v10 = 2048;
          v11 = v4;
          _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_DEFAULT, "_updateETA: update current waypoint %lu -> %lu", (uint8_t *)&v8, 0x16u);
        }

        -[GEOSharedNavState setCurrentWaypointIndex:](self->_state, "setCurrentWaypointIndex:", v4);
        -[GEOSharedNavState setArrived:](self->_state, "setArrived:", 0);
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        -[GEOSharedNavState setUpdatedTimestamp:](self->_state, "setUpdatedTimestamp:");
        -[MSPNavigationListener _performDelegateNotificationBlockIfReady:](self, "_performDelegateNotificationBlockIfReady:", &__block_literal_global_14);
      }
    }
    else
    {
      MSPGetSharedTripNavEventsLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 134217984;
        v9 = v4;
        _os_log_impl(&dword_1B39C0000, v7, OS_LOG_TYPE_DEFAULT, "_updateETA: setting initial waypoint index: %lu", (uint8_t *)&v8, 0xCu);
      }

      -[GEOSharedNavState setCurrentWaypointIndex:](self->_state, "setCurrentWaypointIndex:", v4);
      -[MSPNavigationListener _checkStateIsReady](self, "_checkStateIsReady");
    }
  }
}

uint64_t __72__MSPNavigationListener__updateCurrentWaypointIndexFromArrivalTimeInfo___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "navigationListenerResumed:", a2);
}

- (BOOL)_updateArrivalTimeAndDistance:(id)a3
{
  id v4;
  GEOSharedNavState *state;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  void *v17;
  void *v18;
  BOOL v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, uint64_t);
  void *v24;
  NSObject *v25;
  MSPNavigationListener *v26;
  id v27;
  uint8_t *v28;
  uint8_t v29[8];
  uint8_t *v30;
  uint64_t v31;
  char v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  state = self->_state;
  if (state)
  {
    if (-[GEOSharedNavState etaInfosCount](state, "etaInfosCount"))
    {
      v6 = objc_alloc(MEMORY[0x1E0C99D80]);
      objc_msgSend(v4, "arrivalTimeInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "arrivalTimeInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      MapsMap(v8, &__block_literal_global_14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v6, "initWithObjects:forKeys:", v7, v9);

      *(_QWORD *)v29 = 0;
      v30 = v29;
      v31 = 0x2020000000;
      v32 = 0;
      -[GEOSharedNavState etaInfos](self->_state, "etaInfos");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v11, "copy");

      v21 = MEMORY[0x1E0C809B0];
      v22 = 3221225472;
      v23 = __55__MSPNavigationListener__updateArrivalTimeAndDistance___block_invoke_2;
      v24 = &unk_1E66542F0;
      v13 = v10;
      v28 = v29;
      v25 = v13;
      v26 = self;
      v27 = v4;
      objc_msgSend(v12, "enumerateObjectsUsingBlock:", &v21);
      if (v30[24])
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate", v21, v22, v23, v24, v25, v26);
        -[GEOSharedNavState setUpdatedTimestamp:](self->_state, "setUpdatedTimestamp:");
        MSPGetSharedTripNavEventsLog();
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);

        if (v15)
        {
          MSPGetSharedTripNavEventsLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            -[GEOSharedNavState etaInfos](self->_state, "etaInfos");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            MapsMap(v17, &__block_literal_global_20);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v34 = v18;
            _os_log_impl(&dword_1B39C0000, v16, OS_LOG_TYPE_DEBUG, "_updateETA complete: %@", buf, 0xCu);

          }
        }
      }
      v19 = v30[24] != 0;

      _Block_object_dispose(v29, 8);
    }
    else
    {
      MSPGetSharedTripNavEventsLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v29 = 0;
        _os_log_impl(&dword_1B39C0000, v13, OS_LOG_TYPE_DEBUG, "_updateETA: we don't have ETAs to fill out, waiting for route update", v29, 2u);
      }
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

uint64_t __55__MSPNavigationListener__updateArrivalTimeAndDistance___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "legIndex"));
}

void __55__MSPNavigationListener__updateArrivalTimeAndDistance___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 || !objc_msgSend(v5, "hasEtaTimestamp"))
  {
    objc_msgSend(v5, "remainingTime");
    v13 = v12;
    objc_msgSend(v8, "remainingTime");
    if (vabdd_f64(v13, v14) >= 0.00999999978)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      objc_msgSend(v8, "remainingTime");
      MNDisplayETAAndRemainingMinutes();
      v10 = 0;
      -[NSObject timeIntervalSinceReferenceDate](v10, "timeIntervalSinceReferenceDate");
      objc_msgSend(v5, "setEtaTimestamp:");
      MSPGetSharedTripNavEventsLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v5, "remainingTime");
        v17 = v16;
        objc_msgSend(v8, "remainingTime");
        *(_DWORD *)buf = 134218496;
        v20 = a3;
        v21 = 2048;
        v22 = v17;
        v23 = 2048;
        v24 = v18;
        _os_log_impl(&dword_1B39C0000, v15, OS_LOG_TYPE_INFO, "_updateETA: updating waypoint %lu remaining time: %#.1lfs -> %#.1lfs", buf, 0x20u);
      }

      objc_msgSend(v8, "remainingTime");
      objc_msgSend(v5, "setRemainingTime:");
      if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "hasCurrentWaypointIndex")
        && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "currentWaypointIndex") == a3)
      {
        objc_msgSend(*(id *)(a1 + 48), "distanceRemainingToEndOfLeg");
        objc_msgSend(v5, "setRemainingDistance:");
      }
      else
      {
        objc_msgSend(v5, "setRemainingDistance:", 0.0);
        objc_msgSend(v5, "setHasRemainingDistance:", 0);
      }
    }
    else
    {
      MSPGetSharedTripNavEventsLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v20 = a3;
        _os_log_impl(&dword_1B39C0000, v10, OS_LOG_TYPE_DEBUG, "_updateETA: skipping unchanged waypoint %lu eta", buf, 0xCu);
      }
    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    MSPGetSharedTripNavEventsLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v20 = a3;
      _os_log_impl(&dword_1B39C0000, v9, OS_LOG_TYPE_DEBUG, "_updateETA: clearing passed waypoint %lu etaInfo", buf, 0xCu);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "etaInfos");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc_init(MEMORY[0x1E0D27520]);
    -[NSObject replaceObjectAtIndex:withObject:](v10, "replaceObjectAtIndex:withObject:", a3, v11);

  }
}

uint64_t __55__MSPNavigationListener__updateArrivalTimeAndDistance___block_invoke_18(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "mspDescription");
}

- (void)_updateTransportTypeFromCurrentState
{
  GEONavigationGuidanceState *guidanceState;
  int v4;
  NSObject *v5;
  uint64_t v6;
  __CFString *v7;
  __CFString *v8;
  uint64_t v9;
  __CFString *v10;
  uint8_t buf[4];
  __CFString *v12;
  __int16 v13;
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  guidanceState = self->_guidanceState;
  if (guidanceState)
  {
    if (-[GEONavigationGuidanceState hasTrackedTransportType](guidanceState, "hasTrackedTransportType"))
    {
      if (!-[GEOSharedNavState hasTransportType](self->_state, "hasTransportType")
        || (v4 = -[GEOSharedNavState transportType](self->_state, "transportType"),
            v4 != -[GEONavigationGuidanceState trackedTransportType](self->_guidanceState, "trackedTransportType")))
      {
        MSPGetSharedTripNavEventsLog();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        {
          v6 = -[GEOSharedNavState transportType](self->_state, "transportType");
          if (v6 >= 7)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
            v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v7 = off_1E6654488[(int)v6];
          }
          v8 = v7;
          v9 = -[GEONavigationGuidanceState trackedTransportType](self->_guidanceState, "trackedTransportType");
          if (v9 >= 7)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v9);
            v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v10 = off_1E6654488[(int)v9];
          }
          *(_DWORD *)buf = 138412546;
          v12 = v8;
          v13 = 2112;
          v14 = v10;
          _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_DEBUG, "_updateTransportType %@ -> %@", buf, 0x16u);

        }
        -[GEOSharedNavState setTransportType:](self->_state, "setTransportType:", -[GEONavigationGuidanceState trackedTransportType](self->_guidanceState, "trackedTransportType"));
      }
    }
  }
}

- (int)_referenceFrameForDestination:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;

  v3 = a3;
  if (objc_msgSend(v3, "hasMapItemStorage"))
  {
    objc_msgSend(v3, "mapItemStorage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "referenceFrame"))
    {
      v5 = objc_msgSend(v4, "referenceFrame");
    }
    else
    {
      v11 = (void *)MEMORY[0x1E0D27178];
      objc_msgSend(v4, "coordinate");
      if (objc_msgSend(v11, "isLocationShiftRequiredForCoordinate:"))
        v5 = 2;
      else
        v5 = 1;
    }
    goto LABEL_10;
  }
  if (objc_msgSend(v3, "hasWaypoint"))
  {
    objc_msgSend(v3, "waypoint");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "waypointLocation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "location");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasReferenceFrame");

    if (v8)
    {
      objc_msgSend(v4, "waypointLocation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "location");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v10, "referenceFrame");

LABEL_10:
      goto LABEL_17;
    }

  }
  if (objc_msgSend(v3, "hasLatLng"))
  {
    objc_msgSend(v3, "latLng");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lat");
    v14 = v13;
    objc_msgSend(v3, "latLng");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lng");
    v17 = v16;

    if (objc_msgSend(MEMORY[0x1E0D27178], "isLocationShiftRequiredForCoordinate:", v14, v17))
      v5 = 2;
    else
      v5 = 1;
  }
  else
  {
    v5 = 0;
  }
LABEL_17:

  return v5;
}

- (void)_updateTransaction
{
  id WeakRetained;
  void *v4;
  OS_os_transaction *transaction;
  BOOL v6;
  BOOL v7;
  NSObject *v8;
  OS_os_transaction *v9;
  NSObject *v10;
  OS_os_transaction *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = WeakRetained;
  transaction = self->_transaction;
  if (transaction)
    v6 = 1;
  else
    v6 = WeakRetained == 0;
  if (v6)
  {
    if (transaction)
      v7 = WeakRetained == 0;
    else
      v7 = 0;
    if (v7 && !-[MSPNavigationListener isInNavigatingState](self, "isInNavigatingState"))
    {
      MSPGetSharedTripLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_1B39C0000, v8, OS_LOG_TYPE_INFO, "MSPNavigationListener not navigating or no delegate, stopping transaction", v12, 2u);
      }

      v9 = 0;
      goto LABEL_19;
    }
  }
  else if (-[MSPNavigationListener isInNavigatingState](self, "isInNavigatingState"))
  {
    MSPGetSharedTripLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B39C0000, v10, OS_LOG_TYPE_INFO, "MSPNavigationListener now navigating with delegate, starting transaction", buf, 2u);
    }

    v9 = (OS_os_transaction *)os_transaction_create();
LABEL_19:
    v11 = self->_transaction;
    self->_transaction = v9;

  }
}

- (void)navigationListener:(id)a3 didChangeNavigationState:(unint64_t)a4 transportType:(int)a5
{
  uint64_t v5;
  id v8;
  NSObject *v9;
  id v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  NSString *navigationSessionIdentifier;
  GEOSharedNavState *state;
  double v16;
  double v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  __CFString *v23;
  uint64_t v24;

  v5 = *(_QWORD *)&a5;
  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  MSPGetSharedTripNavEventsLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    GEONavigationListenerStateAsString();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v5 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v5);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E6654488[(int)v5];
    }
    *(_DWORD *)buf = 138412546;
    v21 = v10;
    v22 = 2112;
    v23 = v11;
    _os_log_impl(&dword_1B39C0000, v9, OS_LOG_TYPE_DEFAULT, "MSPNavigationListener state change (navigation: %@, transport type: %@)", buf, 0x16u);

  }
  if (a4 == 2)
  {
    -[MSPNavigationListener _updateTransaction](self, "_updateTransaction");
    -[GEONavigationListener requestGuidanceState](self->_navigationListener, "requestGuidanceState");
    -[MSPNavigationListener _initPendingStateIfNeededWithTransportType:isResumingMultipointRoute:](self, "_initPendingStateIfNeededWithTransportType:isResumingMultipointRoute:", v5, objc_msgSend(v8, "isResumingMultipointRoute"));
    v12 = -[MSPNavigationListener _analyticsPipelineTransportModeForGEOTransportType:](self, "_analyticsPipelineTransportModeForGEOTransportType:", v5);
    objc_msgSend(MEMORY[0x1E0D263F0], "sharedData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setMapUiShownActiveNavMode:", v12);

  }
  else
  {
    navigationSessionIdentifier = self->_navigationSessionIdentifier;
    self->_navigationSessionIdentifier = 0;

    state = self->_state;
    if (state)
    {
      -[GEOSharedNavState setClosed:](state, "setClosed:", 1);
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v17 = v16;
      -[GEOSharedNavState setClosedTimestamp:](self->_state, "setClosedTimestamp:");
      -[GEOSharedNavState setUpdatedTimestamp:](self->_state, "setUpdatedTimestamp:", v17);
      -[MSPNavigationListener _performDelegateNotificationBlockIfReady:](self, "_performDelegateNotificationBlockIfReady:", &__block_literal_global_24);
    }
    objc_msgSend(MEMORY[0x1E0D263F0], "sharedData");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setMapUiShownActiveNavMode:", 0);

    objc_msgSend(MEMORY[0x1E0D263F0], "sharedData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setHasMapUiShownActiveNavMode:", 0);

    -[MSPNavigationListener _updateTransaction](self, "_updateTransaction");
  }

}

uint64_t __83__MSPNavigationListener_navigationListener_didChangeNavigationState_transportType___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "navigationListenerStopped:", a2);
}

- (void)navigationListener:(id)a3 didUpdateGuidanceState:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  MSPGetSharedTripNavEventsLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_DEFAULT, "MSPNavigationListener guidance state change: %@", (uint8_t *)&v8, 0xCu);
  }

  if (-[GEONavigationListener navigationState](self->_navigationListener, "navigationState") == 2)
    v7 = v5;
  else
    v7 = 0;
  objc_storeStrong((id *)&self->_guidanceState, v7);
  if (self->_state)
  {
    -[MSPNavigationListener _updateTransportTypeFromCurrentState](self, "_updateTransportTypeFromCurrentState");
    -[GEOSharedNavState setArrived:](self->_state, "setArrived:", -[MSPNavigationListener _currentlyArrivedAtWaypoint](self, "_currentlyArrivedAtWaypoint"));
    -[MSPNavigationListener _checkStateIsReady](self, "_checkStateIsReady");
  }
  else
  {
    -[MSPNavigationListener _initPendingStateIfNeeded](self, "_initPendingStateIfNeeded");
  }

}

- (void)navigationListener:(id)a3 didUpdateETA:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  MSPGetSharedTripNavEventsLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = v5;
    _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_DEFAULT, "MSPNavigationListener ETA update: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(v5, "arrivalTimeInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPNavigationListener _updateCurrentWaypointIndexFromArrivalTimeInfo:](self, "_updateCurrentWaypointIndexFromArrivalTimeInfo:", v8);

  if (-[MSPNavigationListener _updateArrivalTimeAndDistance:](self, "_updateArrivalTimeAndDistance:", v5))
    -[MSPNavigationListener _performDelegateNotificationBlockIfReady:](self, "_performDelegateNotificationBlockIfReady:", &__block_literal_global_25);

}

uint64_t __57__MSPNavigationListener_navigationListener_didUpdateETA___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "navigationListenerETAUpdated:", a2);
}

- (void)navigationListener:(id)a3 didUpdateLocation:(id)a4 routeMatchedCoordinate:(id)a5
{
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  MSPGetSharedTripNavEventsLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = 138412290;
    v10 = v7;
    _os_log_impl(&dword_1B39C0000, v8, OS_LOG_TYPE_DEBUG, "MSPNavigationListener location update: %@", (uint8_t *)&v9, 0xCu);
  }

  if (-[MSPNavigationListener _updateLocation:withRouteMatchedCoordinate:](self, "_updateLocation:withRouteMatchedCoordinate:", v7, a5))
  {
    -[MSPNavigationListener _performDelegateNotificationBlockIfReady:](self, "_performDelegateNotificationBlockIfReady:", &__block_literal_global_26_1);
  }

}

uint64_t __85__MSPNavigationListener_navigationListener_didUpdateLocation_routeMatchedCoordinate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "navigationListenerLocationUpdated:", a2);
}

- (void)navigationListener:(id)a3 didUpdateRoute:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  MSPGetSharedTripNavEventsLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "uniqueRouteID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v7;
    _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_DEFAULT, "MSPNavigationListener route update: %{public}@", (uint8_t *)&v9, 0xCu);

  }
  if (-[MSPNavigationListener _updateWaypointsIfNeeded:](self, "_updateWaypointsIfNeeded:", v5))
  {
    -[MSPNavigationListener _clearArrivedState](self, "_clearArrivedState");
    -[GEOSharedNavState setResumed:](self->_state, "setResumed:", 0);
    -[MSPNavigationListener _performDelegateNotificationBlockIfReady:](self, "_performDelegateNotificationBlockIfReady:", &__block_literal_global_27);
  }
  -[MSPNavigationListener _updateRoute:](self, "_updateRoute:", v5);
  objc_msgSend(v5, "traffic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPNavigationListener _updateTraffic:](self, "_updateTraffic:", v8);

  -[MSPNavigationListener _performDelegateNotificationBlockIfReady:](self, "_performDelegateNotificationBlockIfReady:", &__block_literal_global_28);
}

uint64_t __59__MSPNavigationListener_navigationListener_didUpdateRoute___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "navigationListenerWaypointsUpdated:", a2);
}

uint64_t __59__MSPNavigationListener_navigationListener_didUpdateRoute___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "navigationListenerRouteUpdated:", a2);
}

- (void)navigationListener:(id)a3 didUpdateTrafficForCurrentRoute:(id)a4
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  uint8_t v8[16];

  v5 = a4;
  MSPGetSharedTripNavEventsLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_DEFAULT, "MSPNavigationListener traffic update", v8, 2u);
  }

  v7 = -[MSPNavigationListener _updateTraffic:](self, "_updateTraffic:", v5);
  if (v7)
    -[MSPNavigationListener _performDelegateNotificationBlockIfReady:](self, "_performDelegateNotificationBlockIfReady:", &__block_literal_global_29_0);
}

uint64_t __76__MSPNavigationListener_navigationListener_didUpdateTrafficForCurrentRoute___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "navigationListenerTrafficUpdated:", a2);
}

- (void)navigationListener:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  double v10;
  double v11;
  int v12;
  void *v13;
  __int16 v14;
  unint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  MSPGetSharedTripNavEventsLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "shortDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v9;
    v14 = 2048;
    v15 = a5;
    _os_log_impl(&dword_1B39C0000, v8, OS_LOG_TYPE_DEFAULT, "MSPNavigationListener did arrive at waypoint: %@ legIndex: %lu", (uint8_t *)&v12, 0x16u);

  }
  -[GEOSharedNavState setArrived:](self->_state, "setArrived:", 1);
  -[GEOSharedNavState setResumed:](self->_state, "setResumed:", 0);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v11 = v10;
  -[GEOSharedNavState setArrivedTimestamp:](self->_state, "setArrivedTimestamp:");
  -[GEOSharedNavState setUpdatedTimestamp:](self->_state, "setUpdatedTimestamp:", v11);
  -[MSPNavigationListener _performDelegateNotificationBlockIfReady:](self, "_performDelegateNotificationBlockIfReady:", &__block_literal_global_30);

}

uint64_t __78__MSPNavigationListener_navigationListener_didArriveAtWaypoint_endOfLegIndex___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "navigationListenerArrived:", a2);
}

- (void)navigationListener:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  MSPGetSharedTripNavEventsLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v7;
    v11 = 2048;
    v12 = a5;
    _os_log_impl(&dword_1B39C0000, v8, OS_LOG_TYPE_DEFAULT, "MSPNavigationListener did resume navigating from waypoint: %@ legIndex: %lu", (uint8_t *)&v9, 0x16u);
  }

  -[MSPNavigationListener _clearArrivedState](self, "_clearArrivedState");
  -[GEOSharedNavState setResumed:](self->_state, "setResumed:", 1);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  -[GEOSharedNavState setUpdatedTimestamp:](self->_state, "setUpdatedTimestamp:");
  -[MSPNavigationListener _performDelegateNotificationBlockIfReady:](self, "_performDelegateNotificationBlockIfReady:", &__block_literal_global_31);

}

uint64_t __90__MSPNavigationListener_navigationListener_didResumeNavigatingFromWaypoint_endOfLegIndex___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "navigationListenerResumed:", a2);
}

- (void)_clearArrivedState
{
  -[GEOSharedNavState setArrived:](self->_state, "setArrived:", 0);
  -[GEOSharedNavState setArrivedTimestamp:](self->_state, "setArrivedTimestamp:", 0.0);
  -[GEOSharedNavState setHasArrivedTimestamp:](self->_state, "setHasArrivedTimestamp:", 0);
}

- (int)_analyticsPipelineTransportModeForGEOTransportType:(int)a3
{
  if (a3 > 6)
    return 0;
  else
    return dword_1B3A369E0[a3];
}

- (void)_performDelegateNotificationBlockIfReady:(id)a3
{
  id WeakRetained;
  void (**v5)(id, MSPNavigationListener *, id);

  v5 = (void (**)(id, MSPNavigationListener *, id))a3;
  if (self->_postedStateIsReady
    || (-[MSPNavigationListener _checkStateIsReady](self, "_checkStateIsReady"), self->_postedStateIsReady))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5[2](v5, self, WeakRetained);

  }
}

- (MSPNavigationListenerDelegate)delegate
{
  return (MSPNavigationListenerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setCurrentState:(id)a3
{
  objc_storeStrong((id *)&self->_currentState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_navigationSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_guidanceState, 0);
  objc_storeStrong((id *)&self->_navigationListener, 0);
}

@end
