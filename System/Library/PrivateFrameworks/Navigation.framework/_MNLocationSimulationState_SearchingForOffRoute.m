@implementation _MNLocationSimulationState_SearchingForOffRoute

- (int64_t)type
{
  return 5;
}

- (void)onEnterState
{
  void *v3;
  void *v4;

  -[_MNLocationSimulationState data](self, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[_MNLocationSimulationState_SearchingForOffRoute _findRouteToOffRouteLocation](self, "_findRouteToOffRouteLocation");
  else
    self->_shouldStartSearchOnNextLocation = 1;
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
  void *v20;
  void *v21;
  double v23;

  v23 = 0.0;
  -[_MNLocationSimulationState data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_MNLocationSimulationState_FollowingRoute _projectedCoordinateOnRouteFrom:overTimeDelta:outSpeed:](self, "_projectedCoordinateOnRouteFrom:overTimeDelta:outSpeed:", objc_msgSend(v5, "lastRouteCoordinate"), &v23, a3);

  if ((GEOPolylineCoordinateIsValid() & 1) != 0)
  {
    -[_MNLocationSimulationState_SearchingForOffRoute _routeToFollow](self, "_routeToFollow");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pointAtRouteCoordinate:", v6);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    objc_msgSend(v7, "courseAtRouteCoordinateIndex:", v6);
    -[_MNLocationSimulationState _locationWithCoordinate:course:speed:](self, "_locationWithCoordinate:course:speed:", v9, v11, v13, v14, v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MNLocationSimulationState data](self, "data");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setLastRouteCoordinate:", v6);

    if (self->_routeToOffRouteLocation)
    {
      objc_msgSend(v7, "legs");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MNLocationSimulationState data](self, "data");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndexedSubscript:", objc_msgSend(v18, "currentLegIndex"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[_MNLocationSimulationState_FollowingRoute _isCoordinate:atEndOfLeg:](self, "_isCoordinate:atEndOfLeg:", v6, v19))
      {
        -[_MNLocationSimulationState delegate](self, "delegate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_opt_new();
        objc_msgSend(v20, "changeState:", v21);

      }
    }
    else if (self->_shouldStartSearchOnNextLocation)
    {
      self->_shouldStartSearchOnNextLocation = 0;
      -[_MNLocationSimulationState_SearchingForOffRoute _findRouteToOffRouteLocation](self, "_findRouteToOffRouteLocation");
    }
  }
  else
  {
    -[_MNLocationSimulationState data](self, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastLocation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (void)updateWithRouteInfo:(id)a3 rerouteReason:(unint64_t)a4
{
  objc_super v4;

  if (!self->_routeToOffRouteLocation)
  {
    v4.receiver = self;
    v4.super_class = (Class)_MNLocationSimulationState_SearchingForOffRoute;
    -[_MNLocationSimulationState_FollowingRoute updateWithRouteInfo:rerouteReason:](&v4, sel_updateWithRouteInfo_rerouteReason_, a3, a4);
  }
}

- (id)_routeToFollow
{
  GEOComposedRoute *routeToOffRouteLocation;
  GEOComposedRoute *v3;
  void *v4;

  routeToOffRouteLocation = self->_routeToOffRouteLocation;
  if (routeToOffRouteLocation)
  {
    v3 = routeToOffRouteLocation;
  }
  else
  {
    -[_MNLocationSimulationState data](self, "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "routeToFollow");
    v3 = (GEOComposedRoute *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)_findRouteToOffRouteLocation
{
  MNSequence *v3;
  void *v4;
  MNSequence *v5;
  uint64_t v6;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];

  v3 = [MNSequence alloc];
  v4 = (void *)geo_dispatch_queue_create();
  v5 = -[MNSequence initWithQueue:](v3, "initWithQueue:", v4);

  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79___MNLocationSimulationState_SearchingForOffRoute__findRouteToOffRouteLocation__block_invoke;
  v10[3] = &unk_1E61D3B50;
  v10[4] = self;
  -[MNSequence addStep:](v5, "addStep:", v10);
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __79___MNLocationSimulationState_SearchingForOffRoute__findRouteToOffRouteLocation__block_invoke_2;
  v9[3] = &unk_1E61D3B78;
  v9[4] = self;
  -[MNSequence addStep:](v5, "addStep:", v9);
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __79___MNLocationSimulationState_SearchingForOffRoute__findRouteToOffRouteLocation__block_invoke_3;
  v8[3] = &unk_1E61D3BA0;
  v8[4] = self;
  -[MNSequence addStep:](v5, "addStep:", v8);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __79___MNLocationSimulationState_SearchingForOffRoute__findRouteToOffRouteLocation__block_invoke_242;
  v7[3] = &unk_1E61D3BC8;
  v7[4] = self;
  -[MNSequence setSequenceFinalizeHandler:](v5, "setSequenceFinalizeHandler:", v7);
  -[MNSequence start](v5, "start");

}

- (void)_findFirstJunction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  -[_MNLocationSimulationState data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "routeInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "route");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(MEMORY[0x1E0D27320]);
  -[_MNLocationSimulationState data](self, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "auditToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithRoute:auditToken:loggingIdentifier:", v7, v10, CFSTR("MNNavigationSimulation"));

  v12 = objc_msgSend(v7, "endRouteCoordinate");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __70___MNLocationSimulationState_SearchingForOffRoute__findFirstJunction___block_invoke;
  v15[3] = &unk_1E61D3BF0;
  v16 = v4;
  v13 = *MEMORY[0x1E0D26AA8];
  v14 = v4;
  objc_msgSend(v11, "matchRouteFromStart:toEnd:finishedHandler:", v13, v12, v15);

}

- (void)_findOffRouteLocationWithMatchedSegments:(id)a3 stepFinishedHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, BOOL);
  NSObject *v8;
  id v9;
  void *v10;
  GEOMapFeatureAccess *v11;
  GEOMapFeatureAccess *mapFeatureAccess;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  NSMutableArray *candidateRoads;
  NSMutableSet *v17;
  NSMutableSet *checkedRoads;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  NSMutableArray *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  GEOMapFeatureAccess *v30;
  NSMutableArray *v31;
  NSMutableSet *v32;
  void (**v33)(id, void *, BOOL);
  void *v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, BOOL))a4;
  MNGetMNNavigationSimulationLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_DEFAULT, "Starting search for off route target.", buf, 2u);
  }

  v9 = objc_alloc(MEMORY[0x1E0D27198]);
  v10 = (void *)geo_dispatch_queue_create();
  v11 = (GEOMapFeatureAccess *)objc_msgSend(v9, "initWithQueue:", v10);
  mapFeatureAccess = self->_mapFeatureAccess;
  self->_mapFeatureAccess = v11;

  -[_MNLocationSimulationState data](self, "data");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "auditToken");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOMapFeatureAccess setAuditToken:](self->_mapFeatureAccess, "setAuditToken:", v14);

  -[GEOMapFeatureAccess setAllowNetworkTileLoad:](self->_mapFeatureAccess, "setAllowNetworkTileLoad:", 1);
  -[GEOMapFeatureAccess setFlipNegativeTravelDirectionRoads:](self->_mapFeatureAccess, "setFlipNegativeTravelDirectionRoads:", 1);
  -[GEOMapFeatureAccess setVisitDoubleTravelDirectionRoadsTwice:](self->_mapFeatureAccess, "setVisitDoubleTravelDirectionRoadsTwice:", 0);
  v15 = (NSMutableArray *)objc_opt_new();
  candidateRoads = self->_candidateRoads;
  self->_candidateRoads = v15;

  v17 = (NSMutableSet *)objc_opt_new();
  checkedRoads = self->_checkedRoads;
  self->_checkedRoads = v17;

  -[_MNLocationSimulationState data](self, "data");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "routeInfo");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "route");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  GEOConfigGetDouble();
  v34 = v21;
  objc_msgSend(v21, "routeCoordinateForDistanceAfterStart:");
  if (objc_msgSend(v6, "count"))
  {
    v33 = v7;
    v22 = 0;
    while (1)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v22, v33);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "endRouteCoordinate");
      if ((GEOPolylineCoordinateIsABeforeB() & 1) == 0)
      {
        MNGetMNNavigationSimulationLog();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v36 = v23;
          _os_log_impl(&dword_1B0AD7000, v24, OS_LOG_TYPE_DEBUG, "Checking divergence from matched segment: %@", buf, 0xCu);
        }

        v25 = self->_candidateRoads;
        objc_msgSend(v23, "road");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](v25, "addObject:", v26);

        -[_MNLocationSimulationState_SearchingForOffRoute _nextOffRouteTarget](self, "_nextOffRouteTarget");
        if (v28 >= -180.0 && v28 <= 180.0 && v27 >= -90.0 && v27 <= 90.0)
          break;
      }

      if (++v22 >= (unint64_t)objc_msgSend(v6, "count"))
      {
        v29 = 0;
        goto LABEL_16;
      }
    }
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27168]), "initWithGEOCoordinate:", v27, v28);

LABEL_16:
    v7 = v33;
  }
  else
  {
    v29 = 0;
  }
  v30 = self->_mapFeatureAccess;
  self->_mapFeatureAccess = 0;

  v31 = self->_candidateRoads;
  self->_candidateRoads = 0;

  v32 = self->_checkedRoads;
  self->_checkedRoads = 0;

  v7[2](v7, v29, v29 != 0);
}

- ($1AB5FA073B851C12C2339EC22442E995)_nextOffRouteTarget
{
  void *v3;
  NSMutableSet *checkedRoads;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[5];
  int v37;
  uint8_t buf[4];
  void *v39;
  uint64_t v40;
  $1AB5FA073B851C12C2339EC22442E995 result;

  v40 = *MEMORY[0x1E0C80C00];
  -[NSMutableArray lastObject](self->_candidateRoads, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeLastObject](self->_candidateRoads, "removeLastObject");
  checkedRoads = self->_checkedRoads;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v3, "roadID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](checkedRoads, "addObject:", v5);

  if (v3)
  {
    MNGetMNNavigationSimulationLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v3;
      _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEBUG, "    Considering candidate road: %@", buf, 0xCu);
    }

    -[_MNLocationSimulationState data](self, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "routeInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "route");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D274E8]), "initWithRoute:auditToken:", v9, 0);
    objc_msgSend(v3, "lastCoordinate2D");
    objc_msgSend(v10, "distanceToRouteFrom:");
    v12 = v11;
    GEOConfigGetDouble();
    if (v12 <= v13)
    {
      -[GEOMapFeatureAccess synchronousFindRoadsFromNextIntersectionOf:](self->_mapFeatureAccess, "synchronousFindRoadsFromNextIntersectionOf:", v3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MNLocationSimulationState data](self, "data");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "routeInfo");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "route");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "transportType");

      v25 = MEMORY[0x1E0C809B0];
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __70___MNLocationSimulationState_SearchingForOffRoute__nextOffRouteTarget__block_invoke;
      v36[3] = &unk_1E61D3C18;
      v36[4] = self;
      v37 = v24;
      objc_msgSend(v20, "_geo_filtered:", v36);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v34[0] = v25;
      v34[1] = 3221225472;
      v34[2] = __70___MNLocationSimulationState_SearchingForOffRoute__nextOffRouteTarget__block_invoke_2;
      v34[3] = &unk_1E61D3C40;
      v35 = v10;
      objc_msgSend(v26, "sortedArrayUsingComparator:", v34);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMutableArray addObjectsFromArray:](self->_candidateRoads, "addObjectsFromArray:", v27);
      *(double *)&v17 = -180.0;
      while (-[NSMutableArray count](self->_candidateRoads, "count"))
      {
        -[_MNLocationSimulationState_SearchingForOffRoute _nextOffRouteTarget](self, "_nextOffRouteTarget");
        if (v29 >= -180.0 && v29 <= 180.0)
        {
          *(double *)&v15 = v28;
          if (v28 >= -90.0 && v28 <= 90.0)
          {
            v19 = v30;
            *(double *)&v17 = v29;
            goto LABEL_14;
          }
        }
      }
      *(double *)&v19 = 1.79769313e308;
      *(double *)&v15 = -180.0;
LABEL_14:

    }
    else
    {
      objc_msgSend(v3, "lastCoordinate");
      v15 = v14;
      v17 = v16;
      v19 = v18;
    }

  }
  else
  {
    *(double *)&v17 = -180.0;
    *(double *)&v19 = 1.79769313e308;
    *(double *)&v15 = -180.0;
  }

  v31 = *(double *)&v15;
  v32 = *(double *)&v17;
  v33 = *(double *)&v19;
  result.var2 = v33;
  result.var1 = v32;
  result.var0 = v31;
  return result;
}

- (void)_findRouteToOffRouteLocation:(id)a3 stepFinishedHandler:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E0D27168];
  v8 = a3;
  v9 = [v7 alloc];
  -[_MNLocationSimulationState data](self, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastLocation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithCLLocation:", v11);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D26FF8]), "initWithLocation:isCurrentLocation:", v12, 1);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D26FF8]), "initWithLocation:isCurrentLocation:", v8, 0);

  v15 = objc_alloc_init(MEMORY[0x1E0D27050]);
  objc_msgSend(v15, "setRequestType:", 1);
  objc_msgSend(v15, "setCurrentLocation:", v12);
  v34[0] = v13;
  v34[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWaypoints:", v16);

  -[_MNLocationSimulationState data](self, "data");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "routeInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "route");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTransportType:", objc_msgSend(v19, "transportType"));

  -[_MNLocationSimulationState data](self, "data");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "routeInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "route");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "routeAttributes");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setRouteAttributes:", v23);

  objc_msgSend(v15, "setMaxRouteCount:", 1);
  -[_MNLocationSimulationState data](self, "data");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "auditToken");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAuditToken:", v25);

  -[_MNLocationSimulationState data](self, "data");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "requestingAppIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setRequestingAppIdentifier:", v27);

  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27030]), "initWithPurpose:", 1);
  objc_msgSend(v15, "setFeedback:", v28);

  objc_msgSend(MEMORY[0x1E0D27048], "sharedService");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __100___MNLocationSimulationState_SearchingForOffRoute__findRouteToOffRouteLocation_stepFinishedHandler___block_invoke;
  v32[3] = &unk_1E61D1A78;
  v33 = v6;
  v30 = v6;
  v31 = (id)objc_msgSend(v29, "requestRoutes:handler:", v15, v32);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkedRoads, 0);
  objc_storeStrong((id *)&self->_candidateRoads, 0);
  objc_storeStrong((id *)&self->_mapFeatureAccess, 0);
  objc_storeStrong((id *)&self->_routeToOffRouteLocation, 0);
}

@end
