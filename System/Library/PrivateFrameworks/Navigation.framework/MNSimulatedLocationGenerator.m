@implementation MNSimulatedLocationGenerator

- (MNSimulatedLocationGenerator)initWithSimulationParameters:(id)a3
{
  id v4;
  MNSimulatedLocationGenerator *v5;
  _MNLocationSimulationData *v6;
  _MNLocationSimulationData *data;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MNSimulatedLocationGenerator;
  v5 = -[MNSimulatedLocationGenerator init](&v19, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(_MNLocationSimulationData);
    data = v5->_data;
    v5->_data = v6;

    -[_MNLocationSimulationData setSimulationType:](v5->_data, "setSimulationType:", objc_msgSend(v4, "simulationType"));
    objc_msgSend(v4, "initialRoute");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MNLocationSimulationData setRouteInfo:](v5->_data, "setRouteInfo:", v8);

    objc_msgSend(v4, "initialRoute");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MNLocationSimulationData setInitialRouteInfo:](v5->_data, "setInitialRouteInfo:", v9);

    objc_msgSend(v4, "startingLocation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MNLocationSimulationData setLastLocation:](v5->_data, "setLastLocation:", v10);

    -[_MNLocationSimulationData setCurrentTime:](v5->_data, "setCurrentTime:", 0.0);
    -[_MNLocationSimulationData setCurrentLegIndex:](v5->_data, "setCurrentLegIndex:", 0);
    -[_MNLocationSimulationData setEndAtFinalDestination:](v5->_data, "setEndAtFinalDestination:", 1);
    objc_msgSend(v4, "auditToken");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MNLocationSimulationData setAuditToken:](v5->_data, "setAuditToken:", v11);

    objc_msgSend(v4, "requestingAppIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MNLocationSimulationData setRequestingAppIdentifier:](v5->_data, "setRequestingAppIdentifier:", v12);

    GEOConfigGetDouble();
    -[_MNLocationSimulationData setSpeedOverride:](v5->_data, "setSpeedOverride:");
    -[_MNLocationSimulationData speedOverride](v5->_data, "speedOverride");
    if (v13 == 0.0)
      -[_MNLocationSimulationData setSpeedOverride:](v5->_data, "setSpeedOverride:", -1.0);
    GEOConfigGetDouble();
    -[_MNLocationSimulationData setSpeedMultiplier:](v5->_data, "setSpeedMultiplier:");
    GEOConfigGetDouble();
    -[_MNLocationSimulationData setMinimumSpeed:](v5->_data, "setMinimumSpeed:");
    -[MNSimulatedLocationGenerator _updateStartState](v5, "_updateStartState");
    -[_MNLocationSimulationData routeInfo](v5->_data, "routeInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "route");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "pointCount"))
    {
      v16 = (void *)MEMORY[0x1E0D27178];
      objc_msgSend(v15, "pointAt:", 0);
      v17 = objc_msgSend(v16, "isLocationShiftRequiredForCoordinate:");
    }
    else
    {
      v17 = 0;
    }
    -[_MNLocationSimulationData setIsChinaShifted:](v5->_data, "setIsChinaShifted:", v17);

  }
  return v5;
}

- (void)updateWithRouteInfo:(id)a3 rerouteReason:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  NSObject *v15;
  unint64_t v16;
  const __CFString *v17;
  int v18;
  void *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[_MNLocationSimulationData setRouteInfo:](self->_data, "setRouteInfo:", v6);
  objc_msgSend(v6, "route");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "pointCount"))
  {
    v8 = (void *)MEMORY[0x1E0D27178];
    objc_msgSend(v7, "pointAt:", 0);
    v9 = objc_msgSend(v8, "isLocationShiftRequiredForCoordinate:");
  }
  else
  {
    v9 = 0;
  }
  -[_MNLocationSimulationData setIsChinaShifted:](self->_data, "setIsChinaShifted:", v9);
  -[_MNLocationSimulationData lastLocation](self->_data, "lastLocation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    MNGetMNNavigationSimulationLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "route");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (a4 - 1 > 0xE)
        v14 = CFSTR("Unknown");
      else
        v14 = off_1E61D3CD8[a4 - 1];
      v16 = -[_MNLocationSimulationState type](self->_currentState, "type");
      if (v16 > 0xA)
        v17 = CFSTR("Unknown");
      else
        v17 = off_1E61D3D50[v16];
      v18 = 138412802;
      v19 = v13;
      v20 = 2112;
      v21 = v14;
      v22 = 2112;
      v23 = v17;
      _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_DEFAULT, "Route changed to %@. Reason: %@. Current state: %@", (uint8_t *)&v18, 0x20u);

    }
    -[_MNLocationSimulationState updateWithRouteInfo:rerouteReason:](self->_currentState, "updateWithRouteInfo:rerouteReason:", v6, a4);
  }
  else
  {
    -[MNSimulatedLocationGenerator _updateStartState](self, "_updateStartState");
    MNGetMNNavigationSimulationLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1B0AD7000, v15, OS_LOG_TYPE_DEFAULT, "Route changed but no previous location.", (uint8_t *)&v18, 2u);
    }

  }
}

- (void)updatePosition:(double)a3
{
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  _MNLocationSimulationState_ProceedingToStartOfLeg *v13;
  void *v14;
  _DWORD v15[2];
  __int16 v16;
  void *v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = fmin(fmax(a3, 0.0), 1.0);
  -[_MNLocationSimulationData routeToFollow](self->_data, "routeToFollow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "distance");
  v7 = v6;

  v8 = v4 * v7;
  -[_MNLocationSimulationData routeToFollow](self->_data, "routeToFollow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "routeCoordinateForDistanceAfterStart:", v8);

  MNGetMNNavigationSimulationLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    GEOPolylineCoordinateAsShortString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = 67109634;
    v15[1] = (int)(v4 * 100.0);
    v16 = 2112;
    v17 = v12;
    v18 = 2048;
    v19 = v8;
    _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_DEFAULT, "Setting simulation position to %d%% / [%@] / %0.1f meters.", (uint8_t *)v15, 0x1Cu);

  }
  if (-[_MNLocationSimulationState type](self->_currentState, "type") == 2)
  {
    v13 = objc_alloc_init(_MNLocationSimulationState_ProceedingToStartOfLeg);
    -[MNSimulatedLocationGenerator changeState:](self, "changeState:", v13);

  }
  -[_MNLocationSimulationState _followRouteStateWithStartRouteCoordinate:](self->_currentState, "_followRouteStateWithStartRouteCoordinate:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNSimulatedLocationGenerator changeState:](self, "changeState:", v14);

}

- (id)nextSimulatedLocationWithElapsedTime:(double)a3
{
  void *v5;
  void *v6;
  _MNLocationSimulationData *data;
  double v8;
  _MNLocationSimulationState *v9;
  void *v10;
  uint8_t v12[16];
  uint8_t buf[16];

  -[_MNLocationSimulationData routeToFollow](self->_data, "routeToFollow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_MNLocationSimulationData routeToFollow](self->_data, "routeToFollow");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "pointCount"))
    {
      data = self->_data;
      -[_MNLocationSimulationData currentTime](data, "currentTime");
      -[_MNLocationSimulationData setCurrentTime:](data, "setCurrentTime:", v8 + a3);
      v9 = self->_currentState;
      -[_MNLocationSimulationState nextSimulatedLocationWithElapsedTime:](v9, "nextSimulatedLocationWithElapsedTime:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MNLocationSimulationData setLastLocation:](self->_data, "setLastLocation:", v10);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0AD7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "MNSimulatedLocationGenerator cannot simulate with no route.", buf, 2u);
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_fault_impl(&dword_1B0AD7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: NO", v12, 2u);
    }
    v10 = 0;
  }
  return v10;
}

- (int64_t)currentStateType
{
  return -[_MNLocationSimulationState type](self->_currentState, "type");
}

- (double)speedOverride
{
  double result;

  -[_MNLocationSimulationData speedOverride](self->_data, "speedOverride");
  return result;
}

- (void)setSpeedOverride:(double)a3
{
  double v5;
  _MNLocationSimulationData *data;
  double v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  int v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a3 >= 0.0)
  {
    -[_MNLocationSimulationData setSpeedOverride:](self->_data, "setSpeedOverride:", a3);
    MNGetMNNavigationSimulationLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134217984;
      v13 = a3;
      v9 = "Setting speed override to %0.1f m/s.";
      goto LABEL_7;
    }
  }
  else
  {
    GEOConfigGetDouble();
    data = self->_data;
    if (v5 <= 0.0)
    {
      -[_MNLocationSimulationData setSpeedOverride:](data, "setSpeedOverride:", a3);
      MNGetMNNavigationSimulationLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        v9 = "Removing speed override.";
        v10 = v8;
        v11 = 2;
        goto LABEL_10;
      }
    }
    else
    {
      v7 = v5;
      -[_MNLocationSimulationData setSpeedOverride:](data, "setSpeedOverride:");
      MNGetMNNavigationSimulationLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 134217984;
        v13 = v7;
LABEL_7:
        v10 = v8;
        v11 = 12;
LABEL_10:
        _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v12, v11);
      }
    }
  }

}

- (BOOL)endAtFinalDestination
{
  return -[_MNLocationSimulationData endAtFinalDestination](self->_data, "endAtFinalDestination");
}

- (void)setEndAtFinalDestination:(BOOL)a3
{
  -[_MNLocationSimulationData setEndAtFinalDestination:](self->_data, "setEndAtFinalDestination:", a3);
}

- (MNLocation)lastLocation
{
  return -[_MNLocationSimulationData lastLocation](self->_data, "lastLocation");
}

- ($212C09783140BCCD23384160D545CE0D)lastRouteCoordinate
{
  return ($212C09783140BCCD23384160D545CE0D)-[_MNLocationSimulationData lastRouteCoordinate](self->_data, "lastRouteCoordinate");
}

- (void)changeState:(id)a3
{
  id v5;
  _MNLocationSimulationState **p_currentState;
  int64_t v7;
  NSObject *v8;
  unint64_t v9;
  const __CFString *v10;
  unint64_t v11;
  const __CFString *v12;
  int v13;
  const __CFString *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_currentState = &self->_currentState;
  v7 = -[_MNLocationSimulationState type](self->_currentState, "type");
  if (v7 != objc_msgSend(v5, "type"))
  {
    -[_MNLocationSimulationState setDelegate:](self->_currentState, "setDelegate:", 0);
    objc_msgSend(v5, "setDelegate:", self);
    objc_msgSend(v5, "setData:", self->_data);
    MNGetMNNavigationSimulationLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = -[_MNLocationSimulationState type](*p_currentState, "type");
      if (v9 > 0xA)
        v10 = CFSTR("Unknown");
      else
        v10 = off_1E61D3D50[v9];
      v11 = objc_msgSend(v5, "type");
      if (v11 > 0xA)
        v12 = CFSTR("Unknown");
      else
        v12 = off_1E61D3D50[v11];
      v13 = 138412546;
      v14 = v10;
      v15 = 2112;
      v16 = v12;
    }

    -[_MNLocationSimulationState onLeaveState](*p_currentState, "onLeaveState");
    objc_storeStrong((id *)p_currentState, a3);
    objc_msgSend(v5, "onEnterState");
  }

}

- (void)_updateStartState
{
  void *v3;
  $212C09783140BCCD23384160D545CE0D v4;
  void *v5;
  NSObject *v6;
  __objc2_class *v7;
  void *v8;
  int v9;
  int IsValid;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  NSObject *v14;
  id v15;
  __objc2_class *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[_MNLocationSimulationData routeToFollow](self->_data, "routeToFollow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    MNGetMNNavigationSimulationLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1B0AD7000, v14, OS_LOG_TYPE_DEFAULT, "Location simulation starting at end state because no route was provided.", (uint8_t *)&v18, 2u);
    }

    -[_MNLocationSimulationData setLastRouteCoordinate:](self->_data, "setLastRouteCoordinate:", *MEMORY[0x1E0D26A38]);
    v7 = _MNLocationSimulationState_End;
    goto LABEL_13;
  }
  v4 = -[MNSimulatedLocationGenerator _simulationStartRouteCoordinate](self, "_simulationStartRouteCoordinate");
  if ((GEOPolylineCoordinateIsValid() & 1) == 0)
  {
    -[_MNLocationSimulationData lastLocation](self->_data, "lastLocation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      MNGetMNNavigationSimulationLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v18) = 0;
      }

      -[_MNLocationSimulationData setLastRouteCoordinate:](self->_data, "setLastRouteCoordinate:", *MEMORY[0x1E0D26A38]);
      v7 = _MNLocationSimulationState_ProceedingToStartOfLeg;
LABEL_13:
      v15 = objc_alloc_init(v7);
      goto LABEL_20;
    }
  }
  -[_MNLocationSimulationData routeToFollow](self->_data, "routeToFollow");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "legIndexForRouteCoordinate:", v4);

  IsValid = GEOPolylineCoordinateIsValid();
  MNGetMNNavigationSimulationLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (IsValid)
  {
    if (v12)
    {
      GEOPolylineCoordinateAsFullString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v13;
      v20 = 1024;
      v21 = v9;
      _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_DEFAULT, "Location simulation starting on route due to debug settings. Route coordinate: [%@] | Leg: %d", (uint8_t *)&v18, 0x12u);

    }
  }
  else if (v12)
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_DEFAULT, "Location simulation starting on route because there is no initial location.", (uint8_t *)&v18, 2u);
  }

  if (-[_MNLocationSimulationData simulationType](self->_data, "simulationType") == 4)
    v16 = _MNLocationSimulationState_SearchingForOffRoute;
  else
    v16 = _MNLocationSimulationState_FollowingRoute;
  v15 = (id)objc_msgSend([v16 alloc], "initWithStartRouteCoordinate:", v4);
LABEL_20:
  v17 = v15;
  -[MNSimulatedLocationGenerator changeState:](self, "changeState:", v15);

}

- ($212C09783140BCCD23384160D545CE0D)_simulationStartRouteCoordinate
{
  void *v2;
  uint64_t Integer;
  uint64_t v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;

  -[_MNLocationSimulationData routeToFollow](self->_data, "routeToFollow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  Integer = GEOConfigGetInteger();
  if (Integer < 0 || (v4 = Integer) == 0)
  {
    LODWORD(v13) = *MEMORY[0x1E0D26A38];
    v14 = *(unsigned int *)(MEMORY[0x1E0D26A38] + 4);
  }
  else
  {
    GEOConfigGetDouble();
    v6 = v5;
    objc_msgSend(v2, "legs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
    if (v6 <= 0.0)
    {

      objc_msgSend(v2, "legs");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v4 >= v8)
      {
        objc_msgSend(v15, "lastObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "endPointIndex");
      }
      else
      {
        objc_msgSend(v15, "objectAtIndexedSubscript:", v4);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "startPointIndex");
      }
      LODWORD(v13) = v18;

      v14 = 0;
    }
    else
    {

      if (v4 >= (unint64_t)v8)
        v9 = v8;
      else
        v9 = v4;
      v10 = v9 - 1;
      objc_msgSend(v2, "legs");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = objc_msgSend(v2, "routeCoordinateAtDistance:beforeRouteCoordinate:", objc_msgSend(v12, "endRouteCoordinate"), v6);
      if (objc_msgSend(v12, "startPointIndex") > v13)
        v13 = objc_msgSend(v12, "startRouteCoordinate");

      v14 = HIDWORD(v13);
    }
  }

  return ($212C09783140BCCD23384160D545CE0D)(v13 | (v14 << 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
