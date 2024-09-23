@implementation MNArrivalUpdater

- (MNArrivalUpdater)init
{
  MNArrivalUpdater *v2;
  void *v3;
  MNArrivalUpdater *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MNArrivalUpdater;
  v2 = -[MNArrivalUpdater init](&v6, sel_init);
  if (v2)
  {
    dispatch_get_global_queue(21, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    GEORegisterPListStateCaptureLegacy();

    v4 = v2;
  }

  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[MNArrivalUpdater stop](self, "stop");
  GEOUnregisterStateCaptureLegacy();
  v3.receiver = self;
  v3.super_class = (Class)MNArrivalUpdater;
  -[MNArrivalUpdater dealloc](&v3, sel_dealloc);
}

- (MNNavigationSessionState)navigationSessionState
{
  return -[_MNArrivalUpdaterDetails navigationSessionState](self->_details, "navigationSessionState");
}

- (void)setNavigationSessionState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _MNArrivalUpdaterDetails *v12;
  _MNArrivalUpdaterDetails *details;
  void *v14;
  char v15;
  void *v16;
  int v17;
  MNParkedVehicleDetector *parkedVehicleDetector;
  MNParkedVehicleDetector *v19;
  MNParkedVehicleDetector *v20;
  MNParkedVehicleDetector *v21;
  MNParkedVehicleDetector *v22;
  void *v23;
  id v24;

  v24 = a3;
  objc_msgSend(v24, "currentRouteInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "routeID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNArrivalUpdater route](self, "route");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueRouteID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqual:", v7);

  v9 = objc_msgSend(v24, "targetLegIndex");
  -[MNArrivalUpdater navigationSessionState](self, "navigationSessionState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "targetLegIndex");

  if (!self->_details)
  {
    v12 = objc_alloc_init(_MNArrivalUpdaterDetails);
    details = self->_details;
    self->_details = v12;

    -[_MNArrivalUpdaterState setDetails:](self->_currentState, "setDetails:", self->_details);
  }
  v14 = (void *)objc_msgSend(v24, "copy");
  -[_MNArrivalUpdaterDetails setNavigationSessionState:](self->_details, "setNavigationSessionState:", v14);

  if (v9 == v11)
    v15 = v8;
  else
    v15 = 0;
  if ((v15 & 1) == 0)
  {
    -[MNArrivalUpdater _updateTimeoutRegions](self, "_updateTimeoutRegions");
    -[MNArrivalUpdater route](self, "route");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "transportType");

    parkedVehicleDetector = self->_parkedVehicleDetector;
    if (v17)
    {
      if (parkedVehicleDetector)
      {
        -[MNParkedVehicleDetector stopMonitoring](parkedVehicleDetector, "stopMonitoring");
        -[MNParkedVehicleDetector setDelegate:](self->_parkedVehicleDetector, "setDelegate:", 0);
        v19 = self->_parkedVehicleDetector;
        self->_parkedVehicleDetector = 0;

      }
    }
    else if (!parkedVehicleDetector)
    {
      v20 = objc_alloc_init(MNParkedVehicleDetector);
      v21 = self->_parkedVehicleDetector;
      self->_parkedVehicleDetector = v20;

      -[MNParkedVehicleDetector setDelegate:](self->_parkedVehicleDetector, "setDelegate:", self);
      -[MNParkedVehicleDetector startMonitoring](self->_parkedVehicleDetector, "startMonitoring");
    }
  }
  v22 = self->_parkedVehicleDetector;
  objc_msgSend(v24, "location");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNParkedVehicleDetector updateForLocation:](v22, "updateForLocation:", v23);

}

- (void)setDelegate:(id)a3
{
  MNObserverHashTable *v4;
  MNObserverHashTable *safeDelegate;
  MNObserverHashTable *v6;
  id v7;

  v7 = a3;
  if (v7)
  {
    v4 = -[MNObserverHashTable initWithProtocol:]([MNObserverHashTable alloc], "initWithProtocol:", &unk_1EEED2958);
    safeDelegate = self->_safeDelegate;
    self->_safeDelegate = v4;

    -[MNObserverHashTable registerObserver:](self->_safeDelegate, "registerObserver:", v7);
  }
  else
  {
    v6 = self->_safeDelegate;
    self->_safeDelegate = 0;

  }
}

- (void)start
{
  _MNArrivalUpdaterState_None *v3;

  if (!self->_currentState)
  {
    v3 = objc_alloc_init(_MNArrivalUpdaterState_None);
    -[MNArrivalUpdater changeState:](self, "changeState:", v3);

  }
}

- (void)stop
{
  _MNArrivalUpdaterState *currentState;

  currentState = self->_currentState;
  self->_currentState = 0;

  -[MNParkedVehicleDetector stopMonitoring](self->_parkedVehicleDetector, "stopMonitoring");
  -[MNParkedVehicleDetector setDelegate:](self->_parkedVehicleDetector, "setDelegate:", 0);
}

- (void)updateForLocation:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MNArrivalUpdater _updateForParkingDetectionRegion](self, "_updateForParkingDetectionRegion");
  -[_MNArrivalUpdaterState updateForLocation](self->_currentState, "updateForLocation");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_timeoutRegions;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "updateForLocation:", v4, (_QWORD)v11);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  -[_MNArrivalUpdaterDetails evChargingStateMonitor](self->_details, "evChargingStateMonitor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateForLocation:", v4);

}

- (void)forceDepartureForCurrentLeg:(unint64_t)a3
{
  _MNArrivalUpdaterState_None *v4;

  v4 = -[_MNArrivalUpdaterState_None initWithDepartureReason:]([_MNArrivalUpdaterState_None alloc], "initWithDepartureReason:", a3);
  -[MNArrivalUpdater changeState:](self, "changeState:", v4);

}

- (void)_updateForParkingDetectionRegion
{
  _BOOL8 v3;
  NSObject *v4;
  _BOOL4 v5;
  uint8_t v6[16];
  uint8_t buf[16];

  v3 = -[MNArrivalUpdater _checkForParkingDetectionRegion](self, "_checkForParkingDetectionRegion");
  if (v3 != -[_MNArrivalUpdaterDetails isInParkingDetectionRegion](self->_details, "isInParkingDetectionRegion"))
  {
    -[_MNArrivalUpdaterDetails setIsInParkingDetectionRegion:](self->_details, "setIsInParkingDetectionRegion:", v3);
    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_DEFAULT, "Entered parking detection region.", buf, 2u);
      }

      -[MNObserverHashTable arrivalUpdaterDidEnterParkingDetectionRegion:](self->_safeDelegate, "arrivalUpdaterDidEnterParkingDetectionRegion:", self);
    }
    else
    {
      if (v5)
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_DEFAULT, "Left parking detection region.", v6, 2u);
      }

      -[MNObserverHashTable arrivalUpdaterDidLeaveParkingDetectionRegion:](self->_safeDelegate, "arrivalUpdaterDidLeaveParkingDetectionRegion:", self);
    }
  }
}

- (BOOL)_checkForParkingDetectionRegion
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  -[MNArrivalUpdater route](self, "route");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "transportType");

  if (v4)
    return 0;
  -[_MNArrivalUpdaterDetails navigationSessionState](self->_details, "navigationSessionState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isOnLastLeg");

  if (!v6)
    return 0;
  -[_MNArrivalUpdaterDetails navigationSessionState](self->_details, "navigationSessionState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[_MNArrivalUpdaterDetails navigationSessionState](self->_details, "navigationSessionState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "targetLeg");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrivalParameters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_opt_new();
  -[_MNArrivalUpdaterState parkingDetectionExcludeRadius](self->_currentState, "parkingDetectionExcludeRadius");
  objc_msgSend(v12, "setExcludeDistancePadding:");
  if ((objc_msgSend(v11, "containsLocation:arrivalRegionType:parameters:", v8, 6, v12) & 1) != 0)
    v13 = 1;
  else
    v13 = objc_msgSend(v11, "containsLocation:arrivalRegionType:parameters:", v8, 8, v12);

  return v13;
}

- (BOOL)isInPreArrivalRegion
{
  return -[_MNArrivalUpdaterState state](self->_currentState, "state") == 3;
}

- (BOOL)isApproachingWaypoint
{
  return -[_MNArrivalUpdaterState state](self->_currentState, "state") == 2;
}

- (void)_updateTimeoutRegions
{
  NSMutableArray *timeoutRegions;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  MNArrivalRegionTimer *v16;
  MNArrivalRegionTimer *v17;
  NSMutableArray *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  timeoutRegions = self->_timeoutRegions;
  self->_timeoutRegions = 0;

  -[MNArrivalUpdater route](self, "route");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[MNArrivalUpdater targetLeg](self, "targetLeg");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrivalParameters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[_MNArrivalUpdaterDetails navigationSessionState](self->_details, "navigationSessionState");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "location");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v19 = v6;
      objc_msgSend(v6, "arrivalMapRegions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v21 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
            if (objc_msgSend(v15, "arrivalRegionAction") == 4)
            {
              v16 = -[MNArrivalRegionTimer initWithArrivalRegion:]([MNArrivalRegionTimer alloc], "initWithArrivalRegion:", v15);
              v17 = v16;
              if (v16)
              {
                -[MNArrivalRegionTimer setDelegate:](v16, "setDelegate:", self);
                -[NSMutableArray addObject:](v9, "addObject:", v17);
                if (v8)
                  -[MNArrivalRegionTimer updateForLocation:](v17, "updateForLocation:", v8);
              }

            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v12);
      }

      v18 = self->_timeoutRegions;
      self->_timeoutRegions = v9;

      v6 = v19;
    }

  }
}

- (void)changeState:(id)a3
{
  id v5;
  _MNArrivalUpdaterState *currentState;
  _MNArrivalUpdaterState **p_currentState;
  uint64_t v8;
  _MNArrivalUpdaterState *v9;
  NSObject *v10;
  unint64_t v11;
  const __CFString *v12;
  unint64_t v13;
  const __CFString *v14;
  int v15;
  const __CFString *v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_currentState = &self->_currentState;
  currentState = self->_currentState;
  if (currentState && (v8 = -[_MNArrivalUpdaterState state](currentState, "state"), v8 == objc_msgSend(v5, "state")))
  {
    GEOFindOrCreateLog();
    v9 = (_MNArrivalUpdaterState *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 67109120;
      LODWORD(v16) = objc_msgSend(v5, "state");
      _os_log_impl(&dword_1B0AD7000, &v9->super, OS_LOG_TYPE_DEFAULT, "Arrival updater trying to change state to (%d), but is already in that state. This is allowed for now to support server auto advance.", (uint8_t *)&v15, 8u);
    }
  }
  else
  {
    objc_msgSend(v5, "setArrivalUpdater:", self);
    objc_msgSend(v5, "setDetails:", self->_details);
    v9 = self->_currentState;
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = -[_MNArrivalUpdaterState state](v9, "state");
      if (v11 > 6)
        v12 = CFSTR("MNArrivalState_Unknown");
      else
        v12 = off_1E61D8170[v11];
      v13 = objc_msgSend(v5, "state");
      if (v13 > 6)
        v14 = CFSTR("MNArrivalState_Unknown");
      else
        v14 = off_1E61D8170[v13];
      v15 = 138412546;
      v16 = v12;
      v17 = 2112;
      v18 = v14;
      _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_DEFAULT, "Arrival updater change state: '%@' => '%@'", (uint8_t *)&v15, 0x16u);
    }

    objc_storeStrong((id *)p_currentState, a3);
    -[_MNArrivalUpdaterState onLeaveState:](v9, "onLeaveState:", v5);
    objc_msgSend(v5, "onEnterState:", v9);
  }

}

- (void)startMonitoringForEV
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  void *v11;
  MNEVChargingStateMonitor *v12;
  void *v13;
  id v14;

  -[_MNArrivalUpdaterDetails evChargingStateMonitor](self->_details, "evChargingStateMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[MNArrivalUpdater route](self, "route");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEVRoute");

    if (v5)
    {
      -[MNArrivalUpdater targetLeg](self, "targetLeg");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "chargingStationInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "batteryChargeAfterCharging");
      v8 = v7 / 1000.0;
      if (v7 / 1000.0 > 0.0)
      {
        v9 = objc_alloc(MEMORY[0x1E0CB3758]);
        objc_msgSend(MEMORY[0x1E0CB3AB0], "kilowattHours");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v9, "initWithDoubleValue:unit:", v10, v8);

        v12 = -[MNEVChargingStateMonitor initWithTargetBatteryCharge:]([MNEVChargingStateMonitor alloc], "initWithTargetBatteryCharge:", v11);
        -[_MNArrivalUpdaterDetails setEvChargingStateMonitor:](self->_details, "setEvChargingStateMonitor:", v12);

        -[_MNArrivalUpdaterDetails evChargingStateMonitor](self->_details, "evChargingStateMonitor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setDelegate:", self);

      }
    }
  }
}

- (void)stopMonitoringForEV
{
  void *v3;

  -[_MNArrivalUpdaterDetails evChargingStateMonitor](self->_details, "evChargingStateMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  -[_MNArrivalUpdaterDetails setEvChargingStateMonitor:](self->_details, "setEvChargingStateMonitor:", 0);
}

- (GEOComposedRoute)route
{
  void *v2;
  void *v3;
  void *v4;

  -[_MNArrivalUpdaterDetails navigationSessionState](self->_details, "navigationSessionState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentRouteInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "route");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOComposedRoute *)v4;
}

- (GEOComposedRouteLeg)targetLeg
{
  void *v2;
  void *v3;

  -[_MNArrivalUpdaterDetails navigationSessionState](self->_details, "navigationSessionState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "targetLeg");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOComposedRouteLeg *)v3;
}

- (void)arrivalRegionTimerDidFire:(id)a3
{
  NSObject *v4;
  MNObserverHashTable *safeDelegate;
  void *v6;
  uint8_t v7[16];

  GEOFindOrCreateLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_INFO, "Arrival region timeout fired.", v7, 2u);
  }

  safeDelegate = self->_safeDelegate;
  -[MNArrivalUpdater targetLeg](self, "targetLeg");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNObserverHashTable arrivalUpdater:didTimeoutAtLegIndex:withReason:](safeDelegate, "arrivalUpdater:didTimeoutAtLegIndex:withReason:", self, objc_msgSend(v6, "legIndex"), 0);

}

- (void)evChargingStateMonitorShouldShowChargingInfo:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  GEOFindOrCreateLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_DEFAULT, "Should show EV charging info", v7, 2u);
  }

  -[_MNArrivalUpdaterDetails navigationSessionState](self->_details, "navigationSessionState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentWaypoint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MNObserverHashTable arrivalUpdater:shouldShowChargingInfoForWaypoint:](self->_safeDelegate, "arrivalUpdater:shouldShowChargingInfoForWaypoint:", self, v6);
}

- (void)evChargingStateMonitor:(id)a3 didReachTargetBatteryCharge:(id)a4
{
  -[_MNArrivalUpdaterState updateForEVReachedTargetBatteryCharge](self->_currentState, "updateForEVReachedTargetBatteryCharge", a3, a4);
}

- (void)evChargingStateMonitor:(id)a3 didChangeChargingState:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  if (-[_MNArrivalUpdaterDetails isEVCharging](self->_details, "isEVCharging", a3) != a4)
  {
    -[_MNArrivalUpdaterDetails setIsEVCharging:](self->_details, "setIsEVCharging:", v4);
    -[_MNArrivalUpdaterState updateForEVChargingState:](self->_currentState, "updateForEVChargingState:", v4);
  }
}

- (void)parkedVehicleDetectorDidDetectParkedVehicle:(id)a3
{
  void *v4;
  int v5;
  _MNArrivalUpdaterState_Parked *v6;

  -[_MNArrivalUpdaterDetails navigationSessionState](self->_details, "navigationSessionState", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isOnLastLeg");

  if (v5)
  {
    if (-[_MNArrivalUpdaterDetails isInParkingDetectionRegion](self->_details, "isInParkingDetectionRegion"))
    {
      v6 = objc_alloc_init(_MNArrivalUpdaterState_Parked);
      -[MNArrivalUpdater changeState:](self, "changeState:", v6);

    }
  }
}

- (void)parkedVehicleDetectorDidDetectResumeDriving:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  GEOFindOrCreateLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_DEFAULT, "Detected resume driving.", v5, 2u);
  }

  -[_MNArrivalUpdaterState updateForResumeDriving](self->_currentState, "updateForResumeDriving");
}

- (id)captureStatePlistWithHints:(os_state_hints_s *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("state");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[_MNArrivalUpdaterState state](self->_currentState, "state", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v4;
  v14[1] = CFSTR("targetLegIndex");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[MNArrivalUpdater targetLeg](self, "targetLeg");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "legIndex"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v7;
  v14[2] = CFSTR("isMonitoringWaypoint");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[_MNArrivalUpdaterDetails evChargingStateMonitor](self->_details, "evChargingStateMonitor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithInt:", v9 != 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v10;
  v14[3] = CFSTR("isCharging");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_MNArrivalUpdaterDetails isEVCharging](self->_details, "isEVCharging"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (MNObserverHashTable)safeDelegate
{
  return self->_safeDelegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parkedVehicleDetector, 0);
  objc_storeStrong((id *)&self->_evChargingStateMonitor, 0);
  objc_storeStrong((id *)&self->_timeoutRegions, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_safeDelegate, 0);
}

@end
