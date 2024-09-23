@implementation _MNLocationSimulationState_FollowingRoute

- (_MNLocationSimulationState_FollowingRoute)initWithStartRouteCoordinate:(id)a3
{
  _MNLocationSimulationState_FollowingRoute *v4;
  _MNLocationSimulationState_FollowingRoute *v5;
  _MNLocationSimulationState_FollowingRoute *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_MNLocationSimulationState_FollowingRoute;
  v4 = -[_MNLocationSimulationState_FollowingRoute init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_startRouteCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)a3;
    v6 = v4;
  }

  return v5;
}

- (int64_t)type
{
  return 2;
}

- (void)onEnterState
{
  $604ECB7A8067A7300F159AE8ED6889F8 startRouteCoordinate;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (GEOPolylineCoordinateIsValid())
  {
    startRouteCoordinate = self->_startRouteCoordinate;
    -[_MNLocationSimulationState data](self, "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLastRouteCoordinate:", startRouteCoordinate);

    -[_MNLocationSimulationState_FollowingRoute _routeToFollow](self, "_routeToFollow");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "legIndexForRouteCoordinate:", *(_QWORD *)&self->_startRouteCoordinate);
    -[_MNLocationSimulationState data](self, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCurrentLegIndex:", v5);

  }
}

- (id)nextSimulatedLocationWithElapsedTime:(double)a3
{
  void *v5;
  $212C09783140BCCD23384160D545CE0D v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  unint64_t v22;
  int v23;
  void *v24;
  uint64_t v25;
  _BOOL4 v28;
  uint64_t Integer;
  uint64_t v30;
  void *v31;
  int v32;
  void *v33;
  __objc2_class *v34;
  double v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  _MNLocationSimulationState_WaitingAtWaypoint *v42;
  _MNLocationSimulationState_WaitingAtWaypoint *v43;
  double v44;

  v44 = 0.0;
  -[_MNLocationSimulationState data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_MNLocationSimulationState_FollowingRoute _projectedCoordinateOnRouteFrom:overTimeDelta:outSpeed:](self, "_projectedCoordinateOnRouteFrom:overTimeDelta:outSpeed:", objc_msgSend(v5, "lastRouteCoordinate"), &v44, a3);

  if (!GEOPolylineCoordinateIsValid())
  {
    v15 = 0;
    return v15;
  }
  -[_MNLocationSimulationState_FollowingRoute _routeToFollow](self, "_routeToFollow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pointAtRouteCoordinate:", v6);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v7, "courseAtRouteCoordinateIndex:", v6);
  -[_MNLocationSimulationState _locationWithCoordinate:course:speed:](self, "_locationWithCoordinate:course:speed:", v9, v11, v13, v14, v44);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MNLocationSimulationState data](self, "data");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setLastRouteCoordinate:", v6);

  objc_msgSend(v7, "legs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MNLocationSimulationState data](self, "data");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", objc_msgSend(v18, "currentLegIndex"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(v19, "legIndex");
  objc_msgSend(v7, "legs");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count") - 1;

  v23 = objc_msgSend(v7, "transportType");
  -[_MNLocationSimulationState data](self, "data");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "simulationType");

  v28 = v20 >= v22 && v23 == 0 && v25 == 2;
  Integer = GEOConfigGetInteger();
  v30 = Integer;
  if (v28 && Integer == 1)
  {
    objc_msgSend(v19, "arrivalParameters");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "containsCoordinate:arrivalRegionType:", 6, v9, v11, v13);

    if (v32)
    {
      -[_MNLocationSimulationState delegate](self, "delegate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = _MNLocationSimulationState_SearchingForParkingBeforeArrival;
      goto LABEL_25;
    }
  }
  if (-[_MNLocationSimulationState_FollowingRoute _isCoordinate:atEndOfLeg:](self, "_isCoordinate:atEndOfLeg:", v6, v19))
  {
    if ((v30 & 0xFFFFFFFFFFFFFFFELL) == 2 && v28)
    {
      -[_MNLocationSimulationState delegate](self, "delegate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = _MNLocationSimulationState_SearchingForParkingAfterArrival;
    }
    else if (-[_MNLocationSimulationState_FollowingRoute _shouldProceedToWaypointForLeg:](self, "_shouldProceedToWaypointForLeg:", v19))
    {
      -[_MNLocationSimulationState delegate](self, "delegate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = _MNLocationSimulationState_ProceedingToWaypoint;
    }
    else
    {
      GEOConfigGetDouble();
      if (v36 >= 0.0)
      {
        -[_MNLocationSimulationState delegate](self, "delegate");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = [_MNLocationSimulationState_WaitingAtWaypoint alloc];
        -[_MNLocationSimulationState data](self, "data");
        v40 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "currentTime");
        v43 = -[_MNLocationSimulationState_WaitingAtWaypoint initWithStartTime:waitDuration:](v42, "initWithStartTime:waitDuration:");
        objc_msgSend(v33, "changeState:", v43);

        goto LABEL_26;
      }
      -[_MNLocationSimulationState data](self, "data");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "currentLegIndex") + 1;
      -[_MNLocationSimulationState data](self, "data");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setCurrentLegIndex:", v38);

      -[_MNLocationSimulationState delegate](self, "delegate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = _MNLocationSimulationState_ProceedingToStartOfLeg;
    }
LABEL_25:
    v40 = objc_alloc_init(v34);
    objc_msgSend(v33, "changeState:", v40);
LABEL_26:

  }
  return v15;
}

- (void)updateWithRouteInfo:(id)a3 rerouteReason:(unint64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _MNLocationSimulationState_ProceedingToStartOfLeg *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  int v25;
  void *v26;
  double v27;
  void *v28;
  int v29;
  uint64_t v30;
  _DWORD v31[2];
  __int16 v32;
  double v33;
  __int16 v34;
  int v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[_MNLocationSimulationState data](self, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "simulationType");

  if (v8 == 2)
  {
    if (a4 == 12)
    {
      -[_MNLocationSimulationState data](self, "data");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setCurrentLegIndex:", 0);

      v10 = objc_alloc_init(_MNLocationSimulationState_ProceedingToStartOfLeg);
      -[_MNLocationSimulationState delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "changeState:", v10);

    }
    else
    {
      v12 = objc_alloc(MEMORY[0x1E0D274E8]);
      objc_msgSend(v6, "route");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (_MNLocationSimulationState_ProceedingToStartOfLeg *)objc_msgSend(v12, "initWithRoute:auditToken:", v13, 0);

      v14 = objc_alloc(MEMORY[0x1E0D27168]);
      -[_MNLocationSimulationState data](self, "data");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "lastLocation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v14, "initWithCLLocation:", v16);

      -[_MNLocationSimulationState_ProceedingToStartOfLeg matchToRouteWithLocation:](v10, "matchToRouteWithLocation:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "routeCoordinate");
      -[_MNLocationSimulationState data](self, "data");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setLastRouteCoordinate:", v19);

      v21 = objc_msgSend(v18, "legIndex");
      -[_MNLocationSimulationState data](self, "data");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setCurrentLegIndex:", v21);

      MNGetMNNavigationSimulationLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        -[_MNLocationSimulationState data](self, "data");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "lastRouteCoordinate");
        -[_MNLocationSimulationState data](self, "data");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = COERCE_FLOAT((unint64_t)objc_msgSend(v26, "lastRouteCoordinate") >> 32);
        -[_MNLocationSimulationState data](self, "data");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "currentLegIndex");
        objc_msgSend(v18, "distanceFromRoute");
        v31[0] = 67109888;
        v31[1] = v25;
        v32 = 2048;
        v33 = v27;
        v34 = 1024;
        v35 = v29;
        v36 = 2048;
        v37 = v30;
        _os_log_impl(&dword_1B0AD7000, v23, OS_LOG_TYPE_DEFAULT, "Putting location at [%u, %0.2f] and leg %d on new route. Was %0.1f meters away", (uint8_t *)v31, 0x22u);

      }
    }

  }
}

- ($212C09783140BCCD23384160D545CE0D)_projectedCoordinateOnRouteFrom:(id)a3 overTimeDelta:(double)a4 outSpeed:(double *)a5
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  $212C09783140BCCD23384160D545CE0D v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  uint64_t v30;

  if ((GEOPolylineCoordinateIsValid() & 1) != 0)
  {
    -[_MNLocationSimulationState_FollowingRoute _routeToFollow](self, "_routeToFollow");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "legs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MNLocationSimulationState data](self, "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v11, "currentLegIndex"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[_MNLocationSimulationState_FollowingRoute _isCoordinate:atEndOfLeg:](self, "_isCoordinate:atEndOfLeg:", a3, v12))
    {
      if (a5)
        *a5 = 0.0;
      v13 = ($212C09783140BCCD23384160D545CE0D)(objc_msgSend(v9, "pointCount") - 1);
    }
    else
    {
      objc_msgSend(v9, "stepForPointIndex:", a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MNLocationSimulationState data](self, "data");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "speedOverride");
      v17 = v16;

      if (v17 >= 0.0)
      {
        -[_MNLocationSimulationState data](self, "data");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "speedOverride");
        v19 = v28;

        -[_MNLocationSimulationState data](self, "data");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "speedOverride");
        v26 = v29;
      }
      else
      {
        objc_msgSend(v14, "distance");
        v19 = v18 / (double)objc_msgSend(v14, "duration");
        -[_MNLocationSimulationState data](self, "data");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "minimumSpeed");
        v22 = v21;

        v23 = fmin(v19, 50.0);
        if (v22 < v23)
          v22 = v23;
        -[_MNLocationSimulationState data](self, "data");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "speedMultiplier");
        v26 = v22 * v25;
      }

      if (a5)
        *a5 = v19;
      v13 = ($212C09783140BCCD23384160D545CE0D)objc_msgSend(v9, "routeCoordinateForDistance:afterRouteCoordinate:", a3, v26 * a4);
      v30 = objc_msgSend(v14, "endRouteCoordinate");
      if (GEOPolylineCoordinateIsABeforeB())
        v13 = ($212C09783140BCCD23384160D545CE0D)v30;

    }
  }
  else
  {
    return ($212C09783140BCCD23384160D545CE0D)*MEMORY[0x1E0D26A38];
  }
  return v13;
}

- (BOOL)_shouldProceedToWaypointForLeg:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  BOOL v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[_MNLocationSimulationState_FollowingRoute _routeToFollow](self, "_routeToFollow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "legs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v4 || (GEOConfigGetBOOL() & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(v4, "destination");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "chargingInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v10 != 0;

  }
  return v8;
}

- (BOOL)_isCoordinate:(id)a3 atEndOfLeg:(id)a4
{
  return objc_msgSend(a4, "endPointIndex") <= a3.var0;
}

- (id)_routeToFollow
{
  void *v2;
  void *v3;

  -[_MNLocationSimulationState data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "routeToFollow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
