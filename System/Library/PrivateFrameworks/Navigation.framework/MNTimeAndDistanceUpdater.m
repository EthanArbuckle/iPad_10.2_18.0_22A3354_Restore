@implementation MNTimeAndDistanceUpdater

- (MNTimeAndDistanceUpdater)initWithNavigationSessionState:(id)a3
{
  id v5;
  MNTimeAndDistanceUpdater *v6;
  MNTimeAndDistanceUpdater *v7;
  MNTimeAndDistanceUpdater *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MNTimeAndDistanceUpdater;
  v6 = -[MNTimeAndDistanceUpdater init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_navigationSessionState, a3);
    v8 = v7;
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[MNTimeAndDistanceUpdater stopUpdating](self, "stopUpdating");
  v3.receiver = self;
  v3.super_class = (Class)MNTimeAndDistanceUpdater;
  -[MNTimeAndDistanceUpdater dealloc](&v3, sel_dealloc);
}

- (void)stopUpdating
{
  -[NSTimer invalidate](self->_minuteTimer, "invalidate");
}

- (void)setLocation:(id)a3 notificationType:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_storeStrong((id *)&self->_location, a3);
  objc_msgSend(v7, "routeMatch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "route");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNActiveRouteInfo route](self->_mainRoute, "route");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 != v10)
  {
    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "routeMatch");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "route");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "uniqueRouteID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNActiveRouteInfo routeID](self->_mainRoute, "routeID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("Location matched to a route that is not the main route. Location route: %@ | Main route: %@"), v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    GEOFindOrCreateLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v29 = "-[MNTimeAndDistanceUpdater setLocation:notificationType:]";
      v30 = 2080;
      v31 = "/Library/Caches/com.apple.xbs/Sources/Navigation/TrafficETA/MNTimeAndDistanceUpdater.m";
      v32 = 1024;
      v33 = 80;
      v34 = 2080;
      v35 = "location.routeMatch.route == _mainRoute.route";
      v36 = 2112;
      v37 = v21;
      _os_log_impl(&dword_1B0AD7000, v22, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
    }

  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v11 = self->_routes;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v24;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v11);
        -[MNTimeAndDistanceUpdater updateDisplayETAForRoute:notificationType:](self, "updateDisplayETAForRoute:notificationType:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v15++), a4);
      }
      while (v13 != v15);
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v13);
  }

}

- (void)setRoutes:(id)a3 mainRoute:(id)a4 location:(id)a5 notificationType:(unint64_t)a6
{
  id v11;
  MNActiveRouteInfo *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = (MNActiveRouteInfo *)a4;
  v13 = a5;
  v21 = v11;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", self->_routes);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "minusSet:");
  if (self->_mainRoute != v12)
    self->_currentLogType = 0;
  objc_storeStrong((id *)&self->_routes, a3);
  objc_storeStrong((id *)&self->_location, a5);
  objc_storeStrong((id *)&self->_mainRoute, a4);
  if (v13)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v15 = v14;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v23 != v18)
            objc_enumerationMutation(v15);
          -[MNTimeAndDistanceUpdater updateDisplayETAForRoute:notificationType:](self, "updateDisplayETAForRoute:notificationType:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i), a6);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v17);
    }

  }
}

- (void)updateDisplayETAForRoute:(id)a3 notificationType:(unint64_t)a4
{
  MNActiveRouteInfo *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  void *v20;
  NSObject *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  int IsInvalid;
  int *v32;
  unsigned int v33;
  float v34;
  unint64_t v35;
  unsigned int v36;
  float v37;
  unint64_t v38;
  int IsABeforeB;
  unint64_t v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  id WeakRetained;
  void *v52;
  int v53;
  void *v54;
  char v55;
  int v56;
  void *v57;
  unint64_t v58;
  unint64_t v59;
  char v60;
  int v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  int v66;
  const char *v67;
  __int16 v68;
  const char *v69;
  __int16 v70;
  int v71;
  __int16 v72;
  const char *v73;
  __int16 v74;
  void *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v6 = (MNActiveRouteInfo *)a3;
  if (!-[NSArray containsObject:](self->_routes, "containsObject:", v6))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Did not find route in set of routes."));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v66 = 136316162;
      v67 = "-[MNTimeAndDistanceUpdater updateDisplayETAForRoute:notificationType:]";
      v68 = 2080;
      v69 = "/Library/Caches/com.apple.xbs/Sources/Navigation/TrafficETA/MNTimeAndDistanceUpdater.m";
      v70 = 1024;
      v71 = 111;
      v72 = 2080;
      v73 = "NO";
      v74 = 2112;
      v75 = v20;
      _os_log_impl(&dword_1B0AD7000, v21, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v66, 0x30u);
    }
    goto LABEL_61;
  }
  -[MNLocation routeMatch](self->_location, "routeMatch");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "routeCoordinate");

  -[MNLocation routeMatch](self->_location, "routeMatch");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "route");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNActiveRouteInfo route](v6, "route");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 != v11)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27168]), "initWithCLLocation:", self->_location);
    objc_msgSend(v12, "setCourse:", -1.0);
    v13 = objc_alloc(MEMORY[0x1E0D274E8]);
    -[MNActiveRouteInfo route](v6, "route");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithRoute:auditToken:", v14, 0);

    objc_msgSend(v15, "matchToRouteWithLocation:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      if ((objc_msgSend(v16, "isGoodMatch") & 1) == 0)
      {
        MNGetMNTimeAndDistanceUpdaterLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v17, "distanceFromRoute");
          v66 = 134217984;
          v67 = v19;
          _os_log_impl(&dword_1B0AD7000, v18, OS_LOG_TYPE_INFO, "Unexpected poor route match when computing ETA along route. Attempting to compute ETA anyway but result may be inaccurate. Distance from route: %0.1f meters", (uint8_t *)&v66, 0xCu);
        }

      }
      v8 = objc_msgSend(v17, "routeCoordinate");
    }
    else
    {
      v8 = *MEMORY[0x1E0D26AA8];
    }

  }
  if (self->_mainRoute == v6 && self->_location)
  {
    v22 = -[MNNavigationSessionState targetLegIndex](self->_navigationSessionState, "targetLegIndex");
    -[MNActiveRouteInfo route](v6, "route");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "legs");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count");

    if (v22 >= v25)
    {
      -[MNLocation routeMatch](self->_location, "routeMatch");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "leg");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[MNActiveRouteInfo route](v6, "route");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "legs");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectAtIndexedSubscript:", v22);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v29 = objc_msgSend(v28, "startRouteCoordinate");
    v30 = objc_msgSend(v28, "endRouteCoordinate");
    IsInvalid = GEOPolylineCoordinateIsInvalid();
    v32 = (int *)MEMORY[0x1E0D26A38];
    if (IsInvalid)
    {
      v33 = *MEMORY[0x1E0D26A38];
      v34 = *(float *)(MEMORY[0x1E0D26A38] + 4);
    }
    else
    {
      v34 = *((float *)&v29 + 1) - floorf(*((float *)&v29 + 1));
      v33 = vcvtms_u32_f32(*((float *)&v29 + 1)) + v29;
    }
    v35 = v33 | ((unint64_t)LODWORD(v34) << 32);
    if (GEOPolylineCoordinateIsInvalid())
    {
      v36 = *v32;
      v37 = *((float *)v32 + 1);
    }
    else
    {
      v37 = *((float *)&v30 + 1) - floorf(*((float *)&v30 + 1));
      v36 = vcvtms_u32_f32(*((float *)&v30 + 1)) + v30;
    }
    v38 = v36 | ((unint64_t)LODWORD(v37) << 32);
    IsABeforeB = GEOPolylineCoordinateIsABeforeB();
    if (IsABeforeB)
      v40 = v38;
    else
      v40 = v35;
    if (IsABeforeB)
      v38 = v35;
    if (!GEOPolylineCoordinateIsABeforeB())
      v8 = v40;
    if (!GEOPolylineCoordinateIsABeforeB())
      v8 = v38;
    -[MNLocation routeMatch](self->_location, "routeMatch");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "step");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    -[MNLocation speed](self->_location, "speed");
    v44 = v43;
    if (-[MNLocation state](self->_location, "state") == 1)
    {
      -[MNActiveRouteInfo route](v6, "route");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "distanceBetweenRouteCoordinate:andRouteCoordinate:", v8, objc_msgSend(v42, "maneuverStartRouteCoordinate"));
      v47 = v46;

      if (v47 < 0.0)
        v47 = 0.0;
    }
    else
    {
      -[MNLocation routeMatch](self->_location, "routeMatch");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "distanceFromRoute");
      v47 = v49;

    }
    if (v44 <= 0.0)
      v50 = 0.0;
    else
      v50 = v47 / v44;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "timeAndDistanceUpdater:currentStepIndex:didUpdateDistanceUntilManeuver:timeUntilManeuver:", self, objc_msgSend(v42, "stepIndex"), v47, v50);

  }
  +[MNDisplayETAInfo displayETAInfoForRouteInfo:routeCoordinate:](MNDisplayETAInfo, "displayETAInfoForRouteInfo:routeCoordinate:", v6, v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    if (self->_mainRoute == v6)
      -[MNTimeAndDistanceUpdater _logDisplayETAInfo:](self, "_logDisplayETAInfo:", v20);
    -[MNActiveRouteInfo displayETAInfo](v6, "displayETAInfo");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "isEqual:", v20);

    if ((v53 & 1) == 0)
      -[MNActiveRouteInfo setDisplayETAInfo:](v6, "setDisplayETAInfo:", v20);
    -[MNTimeAndDistanceUpdater _routeDistanceInfoForRoute:routeCoordinate:](self, "_routeDistanceInfoForRoute:routeCoordinate:", v6, v8);
    v21 = objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      -[MNActiveRouteInfo remainingDistanceInfo](v6, "remainingDistanceInfo");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v54, "isEqual:", v21);

      if ((v55 & 1) != 0)
      {
        v56 = v53 ^ 1;
      }
      else
      {
        -[MNActiveRouteInfo setRemainingDistanceInfo:](v6, "setRemainingDistanceInfo:", v21);
        v56 = 1;
      }
      -[MNTimeAndDistanceUpdater _batteryChargeInfoForRoute:routeCoordinate:](self, "_batteryChargeInfoForRoute:routeCoordinate:", v6, v8);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNActiveRouteInfo batteryChargeInfo](v6, "batteryChargeInfo");
      v58 = (unint64_t)(id)objc_claimAutoreleasedReturnValue();
      v59 = v57;
      if (v59 | v58)
      {
        v60 = objc_msgSend((id)v58, "isEqual:", v59);

        if ((v60 & 1) == 0)
        {
          -[MNActiveRouteInfo setBatteryChargeInfo:](v6, "setBatteryChargeInfo:", v59);
          v56 = 1;
        }
      }
      if (a4 == 1)
        v61 = v56;
      else
        v61 = 0;
      if (a4 == 2 || v61)
      {
        v62 = objc_loadWeakRetained((id *)&self->_delegate);
        -[MNActiveRouteInfo displayETAInfo](v6, "displayETAInfo");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        -[MNActiveRouteInfo remainingDistanceInfo](v6, "remainingDistanceInfo");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        -[MNActiveRouteInfo batteryChargeInfo](v6, "batteryChargeInfo");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "timeAndDistanceUpdater:didUpdateDisplayETA:remainingDistance:batteryChargeInfo:", self, v63, v64, v65);

      }
    }
LABEL_61:

  }
}

- (id)_routeDistanceInfoForRoute:(id)a3 routeCoordinate:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  MNRouteDistanceInfo *v18;
  void *v19;
  MNRouteDistanceInfo *v20;

  v5 = a3;
  objc_msgSend(v5, "route");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "legIndexForRouteCoordinate:", a4);

  objc_msgSend(v5, "route");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "legs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "route");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "distanceBetweenRouteCoordinate:andRouteCoordinate:", a4, objc_msgSend(v10, "endRouteCoordinate"));
  v13 = v12;

  objc_msgSend(v5, "route");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "route");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "distanceBetweenRouteCoordinate:andRouteCoordinate:", a4, objc_msgSend(v15, "endRouteCoordinate"));
  v17 = v16;

  v18 = [MNRouteDistanceInfo alloc];
  objc_msgSend(v5, "routeID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = -[MNRouteDistanceInfo initWithDistanceRemainingToEndOfLeg:distanceRemainingToEndOfRoute:forLegIndex:forRouteID:](v18, "initWithDistanceRemainingToEndOfLeg:distanceRemainingToEndOfRoute:forLegIndex:forRouteID:", v7, v19, v13, v17);
  return v20;
}

- (id)_batteryChargeInfoForRoute:(id)a3 routeCoordinate:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  MNBatteryChargeInfo *v16;
  double v17;
  double v18;
  void *v19;
  MNBatteryChargeInfo *v20;
  void *v21;
  NSObject *v22;
  int v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "route");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEVRoute");

  if (v7)
  {
    objc_msgSend(v5, "route");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "legIndexForRouteCoordinate:", a4);

    objc_msgSend(v5, "route");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastEVStepInLegWithIndex:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "evInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "route");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastEVStep");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "evInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 && v15)
    {
      v16 = [MNBatteryChargeInfo alloc];
      v17 = (double)objc_msgSend(v12, "remainingBatteryPercentage");
      v18 = (double)objc_msgSend(v15, "remainingBatteryPercentage");
      objc_msgSend(v5, "routeID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[MNBatteryChargeInfo initWithBatteryChargeRemainingAtEndOfLeg:batteryChargeRemainingAtEndOfRoute:forLegIndex:forRouteID:](v16, "initWithBatteryChargeRemainingAtEndOfLeg:batteryChargeRemainingAtEndOfRoute:forLegIndex:forRouteID:", v9, v19, v17, v18);

    }
    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      GEOFindOrCreateLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v24 = 136316162;
        v25 = "-[MNTimeAndDistanceUpdater _batteryChargeInfoForRoute:routeCoordinate:]";
        v26 = 2080;
        v27 = "/Library/Caches/com.apple.xbs/Sources/Navigation/TrafficETA/MNTimeAndDistanceUpdater.m";
        v28 = 1024;
        v29 = 231;
        v30 = 2080;
        v31 = "endOfLegEvInfo && endOfRouteEvInfo";
        v32 = 2112;
        v33 = v21;
        _os_log_impl(&dword_1B0AD7000, v22, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v24, 0x30u);
      }

      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)_startTimerToNextMinute
{
  double v3;
  double v4;
  void *v6;
  NSTimer *v7;
  NSTimer *minuteTimer;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  _BYTE location[12];
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[NSTimer invalidate](self->_minuteTimer, "invalidate");
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v4 = 60.0 - (double)((unint64_t)v3 % 0x3C);
  if (v4 < 0.0 || v4 > 60.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid update time interval"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136316162;
      *(_QWORD *)&location[4] = "-[MNTimeAndDistanceUpdater _startTimerToNextMinute]";
      v14 = 2080;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Navigation/TrafficETA/MNTimeAndDistanceUpdater.m";
      v16 = 1024;
      v17 = 249;
      v18 = 2080;
      v19 = "remainingSecondsToNextMinute >= 0 && remainingSecondsToNextMinute <= 60";
      v20 = 2112;
      v21 = v9;
      _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", location, 0x30u);
    }

  }
  objc_initWeak((id *)location, self);
  v6 = (void *)MEMORY[0x1E0C99E88];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__MNTimeAndDistanceUpdater__startTimerToNextMinute__block_invoke;
  v11[3] = &unk_1E61D2330;
  objc_copyWeak(&v12, (id *)location);
  objc_msgSend(v6, "scheduledTimerWithTimeInterval:repeats:block:", 0, v11, v4);
  v7 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  minuteTimer = self->_minuteTimer;
  self->_minuteTimer = v7;

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)location);
}

void __51__MNTimeAndDistanceUpdater__startTimerToNextMinute__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = WeakRetained[3];
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(v2, "updateDisplayETAForRoute:notificationType:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), 1, (_QWORD)v8);
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

    objc_msgSend(v2, "_startTimerToNextMinute");
  }

}

- (void)_logDisplayETAInfo:(id)a3
{
  id v4;
  MNActiveRouteInfo *mainRoute;
  void *v6;
  void *v7;
  int v8;
  int v9;
  unint64_t v10;
  int v11;
  NSObject *v12;
  const __CFString *v13;
  void *v14;
  int v15;
  const __CFString *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  mainRoute = self->_mainRoute;
  if (mainRoute)
  {
    -[MNActiveRouteInfo routeID](mainRoute, "routeID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "routeID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

    if (v8)
    {
      v9 = objc_msgSend(v4, "isUsingServerDisplayETA");
      v10 = 1;
      if (v9)
        v10 = 2;
      if (v10 != self->_currentLogType)
      {
        v11 = v9;
        self->_currentLogType = v10;
        MNGetMNTimeAndDistanceUpdaterLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          if (v11)
            v13 = CFSTR("server");
          else
            v13 = CFSTR("client");
          objc_msgSend(v4, "routeID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = 138412802;
          v16 = v13;
          v17 = 2112;
          v18 = v14;
          v19 = 2112;
          v20 = v4;
          _os_log_impl(&dword_1B0AD7000, v12, OS_LOG_TYPE_INFO, "Calculating %@ display ETA for route %@: %@", (uint8_t *)&v15, 0x20u);

        }
      }
    }
  }

}

- (MNTimeAndDistanceUpdaterDelegate)delegate
{
  return (MNTimeAndDistanceUpdaterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MNNavigationSessionState)navigationSessionState
{
  return self->_navigationSessionState;
}

- (void)setNavigationSessionState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationSessionState, 0);
  objc_storeStrong((id *)&self->_mainRoute, 0);
  objc_storeStrong((id *)&self->_minuteTimer, 0);
  objc_storeStrong((id *)&self->_routes, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
