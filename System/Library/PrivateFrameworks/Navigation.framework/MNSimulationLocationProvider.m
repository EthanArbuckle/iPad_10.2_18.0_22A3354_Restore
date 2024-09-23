@implementation MNSimulationLocationProvider

- (MNSimulationLocationProvider)initWithSimulationParameters:(id)a3 alternateRouteInfos:(id)a4
{
  id v6;
  id v7;
  MNSimulationLocationProvider *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  MNSimulatedLocationGenerator *v24;
  MNSimulatedLocationGenerator *locationGenerator;
  uint64_t v26;
  NSMutableArray *monitoredGeoFences;
  uint64_t v28;
  NSMutableArray *currentGeoFences;
  MNSimulationLocationProvider *v30;
  id v32;
  MNSimulationLocationProvider *v33;
  id v34;
  id obj;
  uint64_t v36;
  MNRouteDivergenceFinder *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  objc_super v42;
  uint8_t buf[4];
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v42.receiver = self;
  v42.super_class = (Class)MNSimulationLocationProvider;
  v8 = -[MNSimulationLocationProvider init](&v42, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "simulationType");
    v8->_simulationType = v9;
    if (v9 == 3 && objc_msgSend(v7, "count"))
    {
      objc_msgSend(v7, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v7, "count") >= 2)
      {
        v33 = v8;
        v34 = v6;
        v37 = objc_alloc_init(MNRouteDivergenceFinder);
        objc_msgSend(v10, "route");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "endRouteCoordinate");

        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v32 = v7;
        obj = v7;
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
        if (v12)
        {
          v13 = v12;
          v36 = *(_QWORD *)v39;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v39 != v36)
                objc_enumerationMutation(obj);
              v15 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v14);
              objc_msgSend(v10, "route", v32);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "route");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              -[MNRouteDivergenceFinder findFirstDivergenceBetweenRoute:andRoute:](v37, "findFirstDivergenceBetweenRoute:andRoute:", v16, v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "firstObject");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "routeCoordinate");

              if (GEOPolylineCoordinateIsABeforeB())
              {
                v20 = v15;

                v10 = v20;
              }
              ++v14;
            }
            while (v13 != v14);
            v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
          }
          while (v13);
        }

        v8 = v33;
        v6 = v34;
        v7 = v32;
      }
      MNGetMNNavigationSimulationLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v10, "route");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "name");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v44 = v23;

      }
      objc_msgSend(v6, "setInitialRoute:", v10);

    }
    v24 = -[MNSimulatedLocationGenerator initWithSimulationParameters:]([MNSimulatedLocationGenerator alloc], "initWithSimulationParameters:", v6);
    locationGenerator = v8->_locationGenerator;
    v8->_locationGenerator = v24;

    -[MNSimulatedLocationGenerator setEndAtFinalDestination:](v8->_locationGenerator, "setEndAtFinalDestination:", 0);
    v8->_simulateGeoFences = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v26 = objc_claimAutoreleasedReturnValue();
    monitoredGeoFences = v8->_monitoredGeoFences;
    v8->_monitoredGeoFences = (NSMutableArray *)v26;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v28 = objc_claimAutoreleasedReturnValue();
    currentGeoFences = v8->_currentGeoFences;
    v8->_currentGeoFences = (NSMutableArray *)v28;

    v8->_updateIntervalSpeedMultiplier = 1.0;
    v30 = v8;
  }

  return v8;
}

- (MNSimulationLocationProvider)initWithStartNavigationDetails:(id)a3
{
  id v4;
  void *v5;
  MNSimulationLocationProvider *v6;
  void *v7;
  void *v8;
  MNActiveRouteInfo *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  MNActiveRouteInfo *v14;
  MNActiveRouteInfo *v15;
  MNActiveRouteInfo *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  _BOOL8 v21;
  MNSuggestedNavigationModeFinder *v22;
  void *v23;
  MNSuggestedNavigationModeFinder *v24;
  void *v25;
  uint64_t v26;
  void *v27;

  v4 = a3;
  objc_msgSend(v4, "tracePlaybackPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 || (unint64_t)(objc_msgSend(v4, "simulationType") + 1) < 2)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v4, "routes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "count");

    v9 = 0;
    if (v8)
    {
      v8 = 0;
      v10 = 0;
      do
      {
        objc_msgSend(v4, "routes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = objc_msgSend(v4, "selectedRouteIndex");
        v14 = -[MNActiveRouteInfo initWithRoute:]([MNActiveRouteInfo alloc], "initWithRoute:", v12);
        v15 = v14;
        if (v10 == v13)
        {
          v16 = v14;

          v9 = v16;
        }
        else
        {
          if (!v8)
            v8 = (void *)objc_opt_new();
          objc_msgSend(v8, "addObject:", v15);
        }

        ++v10;
        objc_msgSend(v4, "routes");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "count");

      }
      while (v10 < v18);
    }
    v19 = (void *)objc_opt_new();
    objc_msgSend(v19, "setSimulationType:", objc_msgSend(v4, "simulationType"));
    objc_msgSend(v19, "setInitialRoute:", v9);
    -[MNActiveRouteInfo route](v9, "route");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "source") != 1;

    v22 = [MNSuggestedNavigationModeFinder alloc];
    -[MNActiveRouteInfo route](v9, "route");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[MNSuggestedNavigationModeFinder initWithRoute:context:](v22, "initWithRoute:context:", v23, v21);

    objc_msgSend(v4, "initialUserLocation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[MNSuggestedNavigationModeFinder suggestedNavigationModeForLocation:](v24, "suggestedNavigationModeForLocation:", v25);

    if (v26 == 1)
    {
      objc_msgSend(v4, "initialUserLocation");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setStartingLocation:", v27);

    }
    self = -[MNSimulationLocationProvider initWithSimulationParameters:alternateRouteInfos:](self, "initWithSimulationParameters:alternateRouteInfos:", v19, v8);

    v6 = self;
  }

  return v6;
}

- (void)dealloc
{
  NSTimer *locationUpdateTimer;
  objc_super v4;

  -[NSTimer invalidate](self->_locationUpdateTimer, "invalidate");
  locationUpdateTimer = self->_locationUpdateTimer;
  self->_locationUpdateTimer = 0;

  v4.receiver = self;
  v4.super_class = (Class)MNSimulationLocationProvider;
  -[MNSimulationLocationProvider dealloc](&v4, sel_dealloc);
}

- (void)updateWithRouteInfo:(id)a3 rerouteReason:(unint64_t)a4
{
  -[MNSimulatedLocationGenerator updateWithRouteInfo:rerouteReason:](self->_locationGenerator, "updateWithRouteInfo:rerouteReason:", a3, a4);
}

- (void)updatePosition:(double)a3
{
  -[MNSimulatedLocationGenerator updatePosition:](self->_locationGenerator, "updatePosition:", a3);
}

- (double)speedOverride
{
  double result;

  -[MNSimulatedLocationGenerator speedOverride](self->_locationGenerator, "speedOverride");
  return result;
}

- (void)setSpeedOverride:(double)a3
{
  -[MNSimulatedLocationGenerator setSpeedOverride:](self->_locationGenerator, "setSpeedOverride:", a3);
}

- (void)setUpdateIntervalSpeedMultiplier:(double)a3
{
  NSObject *v5;
  double v6;
  int v7;
  double v8;
  __int16 v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (vabdd_f64(self->_updateIntervalSpeedMultiplier, a3) >= 0.01)
  {
    MNGetMNNavigationSimulationLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 1.0 / self->_updateIntervalSpeedMultiplier;
      v7 = 134218240;
      v8 = v6;
      v9 = 2048;
      v10 = 1.0 / a3;
      _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEFAULT, "Setting simulation update interval from %0.2fs to %0.2fs.", (uint8_t *)&v7, 0x16u);
    }

    self->_updateIntervalSpeedMultiplier = a3;
    -[MNSimulationLocationProvider _resetLocationUpdateInterval](self, "_resetLocationUpdateInterval");
  }
}

- (void)_sendLocationUpdate:(id)a3
{
  NSObject *v4;
  _BOOL4 v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id WeakRetained;
  char v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  uint64_t v29;
  void *v30;
  int v31;
  int v32;
  id v33;
  char v34;
  void *v35;
  char v36;
  id v37;
  char v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  uint64_t v44;
  id v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t k;
  uint64_t v50;
  id v51;
  NSMutableArray *v52;
  id v53;
  void *v54;
  NSMutableArray *obj;
  id *location;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint8_t v72[128];
  uint8_t buf[4];
  void *v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v53 = a3;
  -[MNSimulatedLocationGenerator nextSimulatedLocationWithElapsedTime:](self->_locationGenerator, "nextSimulatedLocationWithElapsedTime:", 1.0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  MNGetMNNavigationSimulationLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

  if (v5)
  {
    v6 = -[MNSimulatedLocationGenerator currentStateType](self->_locationGenerator, "currentStateType");
    v7 = v6;
    v8 = (void *)MEMORY[0x1E0CB37A0];
    if (v57)
    {
      objc_msgSend(v57, "coordinate");
      v10 = v9;
      objc_msgSend(v57, "coordinate");
      v12 = v11;
      objc_msgSend(v57, "course");
      v14 = v13;
      objc_msgSend(v57, "speed");
      if (v7 > 0xA)
        v16 = CFSTR("Unknown");
      else
        v16 = off_1E61D6E58[v7];
      objc_msgSend(v8, "stringWithFormat:", CFSTR("Sending simulated location: %f, %f | %0.1f | %0.1f m/s | %@"), v10, v12, v14, v15, v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 == 2)
      {
        -[MNSimulatedLocationGenerator lastRouteCoordinate](self->_locationGenerator, "lastRouteCoordinate");
        GEOPolylineCoordinateAsShortString();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "appendFormat:", CFSTR(" [%@]"), v19);

      }
    }
    else
    {
      if (v6 > 0xA)
        v17 = CFSTR("Unknown");
      else
        v17 = off_1E61D6E58[v6];
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("Location is nil. State: %@"), v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    MNGetMNNavigationSimulationLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v74 = v18;
      _os_log_impl(&dword_1B0AD7000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

  }
  if (v57)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v22 = objc_opt_respondsToSelector();

    if ((v22 & 1) != 0)
    {
      v23 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v23, "locationProvider:didUpdateLocation:", self, v57);

    }
  }
  if (self->_simulateGeoFences)
  {
    v52 = self->_monitoredGeoFences;
    objc_sync_enter(v52);
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    obj = self->_monitoredGeoFences;
    v24 = 0;
    v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
    if (v25)
    {
      v54 = 0;
      location = (id *)&self->_delegate;
      v26 = *(_QWORD *)v67;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v67 != v26)
            objc_enumerationMutation(obj);
          v28 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
          v29 = -[NSMutableArray indexOfObject:](self->_currentGeoFences, "indexOfObject:", v28);
          objc_msgSend(v57, "rawLocation");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "coordinate");
          v31 = objc_msgSend(v28, "containsCoordinate:");

          if (v29 == 0x7FFFFFFFFFFFFFFFLL)
            v32 = v31;
          else
            v32 = 0;
          if (v32 == 1)
          {
            v33 = objc_loadWeakRetained(location);
            v34 = objc_opt_respondsToSelector();

            if ((v34 & 1) != 0)
            {
              -[NSMutableArray addObject:](self->_currentGeoFences, "addObject:", v28);
              v35 = v24;
              if (!v24)
              {
                objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
              }
              v24 = v35;
              objc_msgSend(v35, "addObject:", v28);
            }
          }
          else
          {
            if (v29 == 0x7FFFFFFFFFFFFFFFLL)
              v36 = 1;
            else
              v36 = v31;
            if ((v36 & 1) == 0)
            {
              v37 = objc_loadWeakRetained(location);
              v38 = objc_opt_respondsToSelector();

              if ((v38 & 1) != 0)
              {
                -[NSMutableArray removeObjectAtIndex:](self->_currentGeoFences, "removeObjectAtIndex:", v29);
                v39 = v54;
                if (!v54)
                {
                  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                }
                v54 = v39;
                objc_msgSend(v39, "addObject:", v28);
              }
            }
          }
        }
        v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
      }
      while (v25);
    }
    else
    {
      v54 = 0;
    }

    objc_sync_exit(v52);
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v40 = v24;
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
    if (v41)
    {
      v42 = *(_QWORD *)v63;
      do
      {
        for (j = 0; j != v41; ++j)
        {
          if (*(_QWORD *)v63 != v42)
            objc_enumerationMutation(v40);
          v44 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * j);
          v45 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v45, "locationProvider:didEnterRegion:", self, v44);

        }
        v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
      }
      while (v41);
    }

    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v46 = v54;
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
    if (v47)
    {
      v48 = *(_QWORD *)v59;
      do
      {
        for (k = 0; k != v47; ++k)
        {
          if (*(_QWORD *)v59 != v48)
            objc_enumerationMutation(v46);
          v50 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * k);
          v51 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v51, "locationProvider:didExitRegion:", self, v50);

        }
        v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
      }
      while (v47);
    }

  }
}

- (void)_resetLocationUpdateInterval
{
  NSTimer *locationUpdateTimer;
  NSTimer *v4;
  double updateIntervalSpeedMultiplier;
  double v6;
  NSObject *v7;
  id v8;
  void *v9;
  NSTimer *v10;
  NSTimer *v11;
  NSObject *v12;
  int v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  locationUpdateTimer = self->_locationUpdateTimer;
  if (locationUpdateTimer)
  {
    -[NSTimer invalidate](locationUpdateTimer, "invalidate");
    v4 = self->_locationUpdateTimer;
    self->_locationUpdateTimer = 0;

  }
  updateIntervalSpeedMultiplier = self->_updateIntervalSpeedMultiplier;
  if (updateIntervalSpeedMultiplier <= 0.0)
  {
    MNGetMNNavigationSimulationLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1B0AD7000, v12, OS_LOG_TYPE_DEFAULT, "Pausing navigation simulation because update interval speed multiplier is 0.", (uint8_t *)&v13, 2u);
    }
  }
  else
  {
    v6 = 1.0 / updateIntervalSpeedMultiplier;
    MNGetMNNavigationSimulationLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 134217984;
      v14 = v6;
      _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_DEFAULT, "Running navigation simulation with update interval of %0.2f seconds", (uint8_t *)&v13, 0xCu);
    }

    v8 = objc_alloc(MEMORY[0x1E0C99E88]);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (NSTimer *)objc_msgSend(v8, "initWithFireDate:interval:target:selector:userInfo:repeats:", v9, self, sel__sendLocationUpdate_, 0, 1, v6);
    v11 = self->_locationUpdateTimer;
    self->_locationUpdateTimer = v10;

    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject addTimer:forMode:](v12, "addTimer:forMode:", self->_locationUpdateTimer, *MEMORY[0x1E0C99748]);
  }

}

- (void)startUpdatingLocation
{
  NSObject *v3;
  NSMutableArray *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  MNGetMNNavigationSimulationLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_DEFAULT, "Starting navigation simulation location updates.", buf, 2u);
  }

  self->_simulateGeoFences = GEOConfigGetBOOL();
  v4 = self->_monitoredGeoFences;
  objc_sync_enter(v4);
  -[NSMutableArray removeAllObjects](self->_monitoredGeoFences, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_currentGeoFences, "removeAllObjects");
  objc_sync_exit(v4);

  if (self->_locationUpdateTimer)
  {
    MNGetMNNavigationSimulationLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_ERROR, "-startUpdatingLocation called after location updates have already been started.", v6, 2u);
    }

  }
  else
  {
    -[MNSimulationLocationProvider _resetLocationUpdateInterval](self, "_resetLocationUpdateInterval");
  }
}

- (void)stopUpdatingLocation
{
  NSObject *v3;
  NSTimer *locationUpdateTimer;
  NSTimer *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  _OWORD v15[8];
  _OWORD v16[2];
  uint8_t buf[64];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _OWORD v22[2];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationSimulationLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_DEFAULT, "Stopping navigation simulation location updates.", buf, 2u);
  }

  locationUpdateTimer = self->_locationUpdateTimer;
  if (locationUpdateTimer)
  {
    -[NSTimer invalidate](locationUpdateTimer, "invalidate");
    v5 = self->_locationUpdateTimer;
    self->_locationUpdateTimer = 0;

    -[MNSimulatedLocationGenerator lastLocation](self->_locationGenerator, "lastLocation");
    v6 = objc_claimAutoreleasedReturnValue();
    if (GEOConfigGetBOOL())
    {
      MNGetMNNavigationSimulationLog();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v6)
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          -[NSObject coordinate](v6, "coordinate");
          v10 = v9;
          -[NSObject coordinate](v6, "coordinate");
          *(_DWORD *)buf = 134283777;
          *(_QWORD *)&buf[4] = v10;
          *(_WORD *)&buf[12] = 2049;
          *(_QWORD *)&buf[14] = v11;
          _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_DEFAULT, "Setting simulated location to %{private}f, %{private}f", buf, 0x16u);
        }

        v21 = 0u;
        memset(v22, 0, 28);
        v19 = 0u;
        v20 = 0u;
        v18 = 0u;
        memset(buf, 0, sizeof(buf));
        -[NSObject clientLocation](v6, "clientLocation");
        *(_QWORD *)&buf[44] = 0;
        if (*(double *)&buf[28] == 1.79769313e308)
          *(_QWORD *)&buf[28] = 0;
        v12 = objc_alloc(MEMORY[0x1E0C9E3B8]);
        v15[6] = v20;
        v15[7] = v21;
        v16[0] = v22[0];
        *(_OWORD *)((char *)v16 + 12) = *(_OWORD *)((char *)v22 + 12);
        v15[2] = *(_OWORD *)&buf[32];
        v15[3] = *(_OWORD *)&buf[48];
        v15[4] = v18;
        v15[5] = v19;
        v15[0] = *(_OWORD *)buf;
        v15[1] = *(_OWORD *)&buf[16];
        v13 = (void *)objc_msgSend(v12, "initWithClientLocation:", v15);
        v14 = objc_alloc_init(MEMORY[0x1E0C9E418]);
        objc_msgSend(v14, "setLocationRepeatBehavior:", 1);
        objc_msgSend(v14, "clearSimulatedLocations");
        objc_msgSend(v14, "appendSimulatedLocation:", v13);
        objc_msgSend(v14, "startLocationSimulation");

      }
      else
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_ERROR, "Set simulated location after ending navigation was set, but no simulation location was set. Ignoring.", buf, 2u);
        }

        v6 = 0;
      }
    }
  }
  else
  {
    MNGetMNNavigationSimulationLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_ERROR, "-stopUpdatingLocation called after location updates have already been stopped.", buf, 2u);
    }
  }

}

- (void)startMonitoringForRegion:(id)a3
{
  NSMutableArray *v4;
  id v5;

  v5 = a3;
  v4 = self->_monitoredGeoFences;
  objc_sync_enter(v4);
  if (self->_simulateGeoFences)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NSMutableArray addObject:](self->_monitoredGeoFences, "addObject:", v5);
  }
  objc_sync_exit(v4);

}

- (void)stopMonitoringForRegion:(id)a3
{
  NSMutableArray *v4;
  id v5;

  v5 = a3;
  v4 = self->_monitoredGeoFences;
  objc_sync_enter(v4);
  if (self->_simulateGeoFences)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NSMutableArray removeObject:](self->_monitoredGeoFences, "removeObject:", v5);
      -[NSMutableArray removeObject:](self->_currentGeoFences, "removeObject:", v5);
    }
  }
  objc_sync_exit(v4);

}

- (NSBundle)effectiveBundle
{
  return 0;
}

- (NSString)effectiveBundleIdentifier
{
  return 0;
}

- (BOOL)isAuthorized
{
  return 1;
}

- (int)headingOrientation
{
  return 0;
}

- (double)expectedGpsUpdateInterval
{
  return 1.0;
}

- (BOOL)coarseModeEnabled
{
  return 0;
}

- (BOOL)isTracePlayer
{
  return 0;
}

- (unint64_t)traceVersion
{
  return 0;
}

- (double)timeScale
{
  return 1.0;
}

- (MNLocationProviderDelegate)delegate
{
  return (MNLocationProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)updateIntervalSpeedMultiplier
{
  return self->_updateIntervalSpeedMultiplier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentGeoFences, 0);
  objc_storeStrong((id *)&self->_monitoredGeoFences, 0);
  objc_storeStrong((id *)&self->_locationGenerator, 0);
  objc_storeStrong((id *)&self->_locationUpdateTimer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
