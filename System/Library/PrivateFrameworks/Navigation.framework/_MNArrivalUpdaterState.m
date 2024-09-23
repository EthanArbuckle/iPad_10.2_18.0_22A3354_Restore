@implementation _MNArrivalUpdaterState

- (int64_t)state
{
  uint8_t v3[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1B0AD7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: Must be implemented by subclasses.", v3, 2u);
  }
  return -1;
}

- (MNLocation)location
{
  void *v2;
  void *v3;
  void *v4;

  -[_MNArrivalUpdaterState details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationSessionState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (MNLocation *)v4;
}

- (GEOComposedRoute)route
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[_MNArrivalUpdaterState details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationSessionState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentRouteInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "route");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOComposedRoute *)v5;
}

- (GEOComposedRouteLeg)targetLeg
{
  void *v2;
  void *v3;
  void *v4;

  -[_MNArrivalUpdaterState details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationSessionState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "targetLeg");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOComposedRouteLeg *)v4;
}

- (void)forceDepartureWithReason:(unint64_t)a3
{
  _MNArrivalUpdaterState_None *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_arrivalUpdater);
  v4 = -[_MNArrivalUpdaterState_None initWithDepartureReason:]([_MNArrivalUpdaterState_None alloc], "initWithDepartureReason:", a3);
  objc_msgSend(WeakRetained, "changeState:", v4);

}

- (void)updateForEVChargingState:(BOOL)a3
{
  _MNArrivalUpdaterState_Arrived *v3;
  id v4;

  if (a3)
  {
    -[_MNArrivalUpdaterState arrivalUpdater](self, "arrivalUpdater");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_alloc_init(_MNArrivalUpdaterState_Arrived);
    objc_msgSend(v4, "changeState:", v3);

  }
}

- (double)parkingDetectionExcludeRadius
{
  return 0.0;
}

- (void)sendArrivalInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_opt_new();
  objc_msgSend(v8, "setArrivalState:", -[_MNArrivalUpdaterState state](self, "state"));
  -[_MNArrivalUpdaterState targetLeg](self, "targetLeg");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLegIndex:", objc_msgSend(v3, "legIndex"));
  objc_msgSend(v3, "destination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDestination:", v4);

  -[_MNArrivalUpdaterState arrivalUpdater](self, "arrivalUpdater");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MNArrivalUpdaterState arrivalUpdater](self, "arrivalUpdater");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrivalUpdater:didUpdateArrivalInfo:", v7, v8);

}

- (BOOL)_updateForArrival
{
  _BOOL4 v3;
  id WeakRetained;
  _MNArrivalUpdaterState_Arrived *v5;

  v3 = -[_MNArrivalUpdaterState _checkForArrival](self, "_checkForArrival");
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_arrivalUpdater);
    v5 = objc_alloc_init(_MNArrivalUpdaterState_Arrived);
    objc_msgSend(WeakRetained, "changeState:", v5);

  }
  return v3;
}

- (BOOL)_updateForPreArrival
{
  _BOOL4 v3;
  id WeakRetained;
  _MNArrivalUpdaterState_PreArrival *v5;

  v3 = -[_MNArrivalUpdaterState _checkForPreArrival](self, "_checkForPreArrival");
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_arrivalUpdater);
    v5 = objc_alloc_init(_MNArrivalUpdaterState_PreArrival);
    objc_msgSend(WeakRetained, "changeState:", v5);

  }
  return v3;
}

- (BOOL)_updateForApproachingWaypoint
{
  _BOOL4 v3;
  id WeakRetained;
  _MNArrivalUpdaterState_ApproachingWaypoint *v5;

  v3 = -[_MNArrivalUpdaterState _checkForApproachingWaypoint](self, "_checkForApproachingWaypoint");
  if (-[_MNArrivalUpdaterState state](self, "state") != 2 && v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_arrivalUpdater);
    v5 = objc_alloc_init(_MNArrivalUpdaterState_ApproachingWaypoint);
    objc_msgSend(WeakRetained, "changeState:", v5);

  }
  return v3;
}

- (void)_updateForEVMonitoring
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  id v12;

  -[_MNArrivalUpdaterState details](self, "details");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "evChargingStateMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[_MNArrivalUpdaterState route](self, "route");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEVRoute");

    if (v6)
    {
      -[_MNArrivalUpdaterState location](self, "location");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "state");

      if (v8 == 1)
      {
        -[_MNArrivalUpdaterState _distanceToEndOfLeg](self, "_distanceToEndOfLeg");
        v10 = v9;
        GEOConfigGetDouble();
        if (v10 <= v11)
        {
          -[_MNArrivalUpdaterState arrivalUpdater](self, "arrivalUpdater");
          v12 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "startMonitoringForEV");

        }
      }
    }
  }
}

- (BOOL)_updateForEndOfDrivingSegment
{
  _BOOL4 v3;
  NSObject *v4;
  id WeakRetained;
  _MNArrivalUpdaterState_EndOfDrivingSegment *v6;
  uint8_t v8[16];

  v3 = -[_MNArrivalUpdaterState _checkForEndOfDrivingSegment](self, "_checkForEndOfDrivingSegment");
  if (v3)
  {
    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_DEFAULT, "Reached end of driving segment with upcoming walking segment. Triggering parked vehicle state.", v8, 2u);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_arrivalUpdater);
    v6 = objc_alloc_init(_MNArrivalUpdaterState_EndOfDrivingSegment);
    objc_msgSend(WeakRetained, "changeState:", v6);

  }
  return v3;
}

- (BOOL)_updateForSearchingForParking
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  int v26;
  BOOL result;
  void *v28;
  _MNArrivalUpdaterState_SearchingForParkingAfterArrival *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  -[_MNArrivalUpdaterState route](self, "route");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "transportType");

  if (v4)
    return 0;
  -[_MNArrivalUpdaterState details](self, "details");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationSessionState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isOnLastLeg");

  if (!v7)
    return 0;
  -[_MNArrivalUpdaterState details](self, "details");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isInParkingDetectionRegion");

  if ((v9 & 1) != 0)
  {
LABEL_20:
    -[_MNArrivalUpdaterState arrivalUpdater](self, "arrivalUpdater");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_alloc_init(_MNArrivalUpdaterState_SearchingForParkingAfterArrival);
    objc_msgSend(v28, "changeState:", v29);

    return 1;
  }
  -[_MNArrivalUpdaterState location](self, "location");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "state") != 1)
  {
LABEL_23:

    return 0;
  }
  -[_MNArrivalUpdaterState targetLeg](self, "targetLeg");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "routeMatch");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "legIndex");
  v14 = objc_msgSend(v11, "legIndex");

  if (v13 != v14)
  {

    goto LABEL_23;
  }
  -[_MNArrivalUpdaterState details](self, "details");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "navigationSessionState");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "targetLeg");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "arrivalParameters");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)objc_opt_new();
  -[_MNArrivalUpdaterState parkingDetectionExcludeRadius](self, "parkingDetectionExcludeRadius");
  objc_msgSend(v19, "setIncludeDistancePadding:");
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v20 = objc_msgSend(&unk_1E620F9C0, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v20)
  {
    v21 = v20;
    v22 = 0;
    v23 = *(_QWORD *)v31;
    while (2)
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v31 != v23)
          objc_enumerationMutation(&unk_1E620F9C0);
        v25 = objc_msgSend(v18, "regionContainmentTypeForLocation:arrivalRegionType:parameters:", v10, objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "integerValue"), v19);
        v22 |= v25 != 2;
        if (!v25)
        {
          v26 = 0;
          goto LABEL_18;
        }
      }
      v21 = objc_msgSend(&unk_1E620F9C0, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v21)
        continue;
      break;
    }
  }
  else
  {
    v22 = 0;
  }
  v26 = 1;
LABEL_18:

  result = 0;
  if ((v22 & 1) != 0 && v26)
    goto LABEL_20;
  return result;
}

- (BOOL)_checkForArrival
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  double v7;
  double v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  int v14;
  BOOL v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  int v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  int v46;
  NSObject *v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t j;
  void *v53;
  void *v54;
  double v55;
  double v56;
  NSObject *v57;
  int v58;
  int v59;
  int v60;
  NSObject *v61;
  int v62;
  NSObject *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  uint8_t v77[128];
  uint8_t buf[4];
  _BYTE v79[14];
  __int16 v80;
  int v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  -[_MNArrivalUpdaterState location](self, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v15 = 0;
    goto LABEL_70;
  }
  -[_MNArrivalUpdaterState targetLeg](self, "targetLeg");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_ERROR, "Target leg is nil.", buf, 2u);
    }
LABEL_17:
    v15 = 0;
    goto LABEL_69;
  }
  objc_msgSend(v4, "arrivalParameters");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_ERROR, "No arrival parameters on leg.", buf, 2u);
    }
    v15 = 0;
    goto LABEL_68;
  }
  -[_MNArrivalUpdaterState _distanceToEndOfLeg](self, "_distanceToEndOfLeg");
  if (v7 < 0.0)
    goto LABEL_17;
  v8 = v7;
  if (-[NSObject hasArrivalParametersEndOfRouteDistanceThreshold](v6, "hasArrivalParametersEndOfRouteDistanceThreshold"))
  {
    if (v8 > (double)-[NSObject arrivalParametersEndOfRouteDistanceThreshold](v6, "arrivalParametersEndOfRouteDistanceThreshold"))goto LABEL_17;
  }
  objc_msgSend(v3, "routeMatch");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v3, "state");
  if (v10 == 1 && -[NSObject endOfRouteDistanceThreshold](v6, "endOfRouteDistanceThreshold"))
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)v79 = objc_msgSend(v5, "legIndex");
      *(_WORD *)&v79[4] = 2048;
      *(double *)&v79[6] = v8;
      v80 = 1024;
      v81 = -[NSObject endOfRouteDistanceThreshold](v6, "endOfRouteDistanceThreshold");
      _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_INFO, "Checking arrival via distance to end of leg[%d] (%0.1fm). Threshold: %um", buf, 0x18u);
    }

    if (v8 < (double)-[NSObject endOfRouteDistanceThreshold](v6, "endOfRouteDistanceThreshold"))
    {
      GEOFindOrCreateLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = objc_msgSend(v5, "legIndex");
        v14 = -[NSObject endOfRouteDistanceThreshold](v6, "endOfRouteDistanceThreshold");
        *(_DWORD *)buf = 134218496;
        *(double *)v79 = v8;
        *(_WORD *)&v79[8] = 1024;
        *(_DWORD *)&v79[10] = v13;
        v80 = 1024;
        v81 = v14;
        _os_log_impl(&dword_1B0AD7000, v12, OS_LOG_TYPE_DEFAULT, "Arrival triggered by distance (%0.1fm) to end of leg[%d]. Threshold: %um", buf, 0x18u);
      }
LABEL_66:
      v15 = 1;
      goto LABEL_67;
    }
  }
  v65 = v9;
  v66 = v5;
  objc_msgSend(v3, "coordinate");
  v17 = v16;
  v19 = v18;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v64 = v6;
  -[NSObject arrivalMapRegions](v6, "arrivalMapRegions");
  v12 = objc_claimAutoreleasedReturnValue();
  v20 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
  if (!v20)
  {
    v22 = 0;
    goto LABEL_40;
  }
  v21 = v20;
  v22 = 0;
  v23 = *(_QWORD *)v73;
  v67 = v3;
  while (2)
  {
    for (i = 0; i != v21; ++i)
    {
      if (*(_QWORD *)v73 != v23)
        objc_enumerationMutation(v12);
      v25 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
      v26 = objc_msgSend(v25, "arrivalRegionAction");
      if (v10 != 1)
      {
        if (v26 != 3)
          continue;
LABEL_30:
        objc_msgSend(v25, "arrivalRegion");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "containsCoordinate:", v17, v19);

        if (v28)
        {
          objc_msgSend(v3, "roadMatch");
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v25, "arrivalRegion");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v29)
          {
            v31 = v3;
            v32 = v12;
            objc_msgSend(v31, "roadMatch");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "coordinateOnRoad");
            v35 = v34;
            v37 = v36;
            objc_msgSend(v31, "roadMatch");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "roadWidth");
            LODWORD(v31) = objc_msgSend(v30, "containsCoordinate:radius:", v35, v37, v39);

            if (!(_DWORD)v31)
            {
              v22 = 1;
              v12 = v32;
              v3 = v67;
              continue;
            }
            GEOFindOrCreateLog();
            v47 = objc_claimAutoreleasedReturnValue();
            v12 = v32;
            v5 = v66;
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              v48 = objc_msgSend(v66, "legIndex");
              *(_DWORD *)buf = 67109379;
              *(_DWORD *)v79 = v48;
              *(_WORD *)&v79[4] = 2113;
              *(_QWORD *)&v79[6] = v25;
              _os_log_impl(&dword_1B0AD7000, v47, OS_LOG_TYPE_DEFAULT, "Arrival triggered by user's current road entering arrival region of leg[%d]: %{private}@", buf, 0x12u);
            }
            v6 = v64;
            v9 = v65;
            v3 = v67;
LABEL_65:

            goto LABEL_66;
          }
          objc_msgSend(v3, "rawLocation");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "coordinate");
          v42 = v41;
          v44 = v43;
          objc_msgSend(v3, "horizontalAccuracy");
          v46 = objc_msgSend(v30, "containsCoordinate:radius:", v42, v44, v45);

          if (v46)
          {
            GEOFindOrCreateLog();
            v47 = objc_claimAutoreleasedReturnValue();
            v5 = v66;
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              v60 = objc_msgSend(v66, "legIndex");
              *(_DWORD *)buf = 67109379;
              *(_DWORD *)v79 = v60;
              *(_WORD *)&v79[4] = 2113;
              *(_QWORD *)&v79[6] = v25;
              _os_log_impl(&dword_1B0AD7000, v47, OS_LOG_TYPE_DEFAULT, "Arrival triggered by user location entering arrival region of leg[%d]: %{private}@", buf, 0x12u);
            }
            v6 = v64;
            v9 = v65;
            goto LABEL_65;
          }
        }
        v22 = 1;
        continue;
      }
      if (v26 == 2)
        goto LABEL_30;
    }
    v21 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
    if (v21)
      continue;
    break;
  }
LABEL_40:

  v9 = v65;
  if (v10 == 1 && v22 & 1 | ((-[NSObject isOnParkingLotRoad](v65, "isOnParkingLotRoad") & 1) == 0))
  {
    v15 = 0;
    v5 = v66;
    v6 = v64;
    goto LABEL_68;
  }
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v6 = v64;
  -[NSObject arrivalPoints](v64, "arrivalPoints");
  v12 = objc_claimAutoreleasedReturnValue();
  v49 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
  if (v49)
  {
    v50 = v49;
    v51 = *(_QWORD *)v69;
    while (2)
    {
      for (j = 0; j != v50; ++j)
      {
        if (*(_QWORD *)v69 != v51)
          objc_enumerationMutation(v12);
        v53 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
        objc_msgSend(v53, "point");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "coordinate");

        GEOCalculateDistance();
        v56 = v55;
        GEOFindOrCreateLog();
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
        {
          v58 = objc_msgSend(v66, "legIndex");
          v59 = objc_msgSend(v53, "radius");
          *(_DWORD *)buf = 67109632;
          *(_DWORD *)v79 = v58;
          *(_WORD *)&v79[4] = 2048;
          *(double *)&v79[6] = v56;
          v80 = 1024;
          v81 = v59;
          _os_log_impl(&dword_1B0AD7000, v57, OS_LOG_TYPE_INFO, "Checking arrival via arrival point of leg[%d]. Distance: %0.1fm, Radius: %um", buf, 0x18u);
        }

        if (v56 <= (double)objc_msgSend(v53, "radius"))
        {
          GEOFindOrCreateLog();
          v61 = objc_claimAutoreleasedReturnValue();
          v5 = v66;
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
          {
            v62 = objc_msgSend(v66, "legIndex");
            *(_DWORD *)buf = 67109379;
            *(_DWORD *)v79 = v62;
            *(_WORD *)&v79[4] = 2113;
            *(_QWORD *)&v79[6] = v53;
            _os_log_impl(&dword_1B0AD7000, v61, OS_LOG_TYPE_DEFAULT, "Arrival triggered by user location within arrival point of leg[%d]: %{private}@", buf, 0x12u);
          }

          v15 = 1;
          goto LABEL_61;
        }
      }
      v50 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
      if (v50)
        continue;
      break;
    }
    v15 = 0;
    v5 = v66;
LABEL_61:
    v6 = v64;
    v9 = v65;
  }
  else
  {
    v15 = 0;
    v5 = v66;
  }
LABEL_67:

LABEL_68:
LABEL_69:

LABEL_70:
  return v15;
}

- (BOOL)_checkForPreArrival
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[_MNArrivalUpdaterState details](self, "details");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationSessionState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "targetLeg");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrivalParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_MNArrivalUpdaterState location](self, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v6, "containsLocation:arrivalRegionType:", v7, 5);

  return (char)v3;
}

- (BOOL)_checkForApproachingWaypoint
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[_MNArrivalUpdaterState details](self, "details");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationSessionState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "targetLeg");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrivalParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_MNArrivalUpdaterState location](self, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v6, "containsLocation:arrivalRegionType:", v7, 7);

  return (char)v3;
}

- (BOOL)_checkForEndOfDrivingSegment
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[_MNArrivalUpdaterState route](self, "route");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "transportType");

  if (v4)
    return 0;
  -[_MNArrivalUpdaterState details](self, "details");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationSessionState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "targetLeg");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrivalParameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[_MNArrivalUpdaterState location](self, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v8, "containsLocation:arrivalRegionType:", v9, 8);

  return (char)v5;
}

- (double)_distanceToEndOfLeg
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;

  -[_MNArrivalUpdaterState location](self, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MNArrivalUpdaterState targetLeg](self, "targetLeg");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "endPointIndex");
  objc_msgSend(v3, "routeMatch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "routeCoordinate");
  v7 = GEOPolylineCoordinateCompare();

  if (v7 == -1)
  {
    v12 = -1.0;
  }
  else
  {
    -[_MNArrivalUpdaterState route](self, "route");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "routeMatch");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "distanceBetweenRouteCoordinate:andRouteCoordinate:", objc_msgSend(v9, "routeCoordinate"), v5);
    v11 = v10;

    v12 = fabs(v11);
  }

  return v12;
}

- (MNArrivalUpdater)arrivalUpdater
{
  return (MNArrivalUpdater *)objc_loadWeakRetained((id *)&self->_arrivalUpdater);
}

- (void)setArrivalUpdater:(id)a3
{
  objc_storeWeak((id *)&self->_arrivalUpdater, a3);
}

- (_MNArrivalUpdaterDetails)details
{
  return self->_details;
}

- (void)setDetails:(id)a3
{
  objc_storeStrong((id *)&self->_details, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_details, 0);
  objc_destroyWeak((id *)&self->_arrivalUpdater);
}

@end
