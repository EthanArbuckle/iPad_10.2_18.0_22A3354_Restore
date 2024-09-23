@implementation _MNLocationSimulationState_SearchingForParkingBeforeArrival

- (_MNLocationSimulationState_SearchingForParkingBeforeArrival)init
{
  return -[_MNLocationSimulationState_FollowingRoute initWithStartRouteCoordinate:](self, "initWithStartRouteCoordinate:", *MEMORY[0x1E0D26AA8]);
}

- (int64_t)type
{
  return 6;
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
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v32;

  if (self->_routeToParkingDestination)
  {
    v32 = 0.0;
    -[_MNLocationSimulationState data](self, "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[_MNLocationSimulationState_FollowingRoute _projectedCoordinateOnRouteFrom:overTimeDelta:outSpeed:](self, "_projectedCoordinateOnRouteFrom:overTimeDelta:outSpeed:", objc_msgSend(v5, "lastRouteCoordinate"), &v32, a3);

    if (!GEOPolylineCoordinateIsValid())
    {
      v20 = 0;
      return v20;
    }
    -[_MNLocationSimulationState_SearchingForParkingBeforeArrival _routeToFollow](self, "_routeToFollow");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pointAtRouteCoordinate:", v6);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    objc_msgSend(v7, "courseAtRouteCoordinateIndex:", v6);
    v15 = v14;
    -[_MNLocationSimulationState data](self, "data");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setLastRouteCoordinate:", v6);

    objc_msgSend(v7, "legs");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MNLocationSimulationState data](self, "data");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndexedSubscript:", objc_msgSend(v18, "currentLegIndex"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[_MNLocationSimulationState_FollowingRoute _isCoordinate:atEndOfLeg:](self, "_isCoordinate:atEndOfLeg:", v6, v19))
    {
      -[_MNLocationSimulationState_SearchingForParkingBeforeArrival _handleReachedParkingLocation](self, "_handleReachedParkingLocation");
    }
    -[_MNLocationSimulationState _locationWithCoordinate:course:speed:](self, "_locationWithCoordinate:course:speed:", v9, v11, v13, v15, v32);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[_MNLocationSimulationState data](self, "data", a3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "lastLocation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_navigation_geoCoordinate3D");
    v24 = v23;
    v26 = v25;
    v28 = v27;

    -[_MNLocationSimulationState data](self, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastLocation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "course");
    -[_MNLocationSimulationState _locationWithCoordinate:course:speed:](self, "_locationWithCoordinate:course:speed:", v24, v26, v28, v30, 0.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v20;
}

- (void)_findRouteToParkingDestination
{
  MNSequence *v3;
  dispatch_queue_t v4;
  MNSequence *v5;
  uint64_t v6;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];

  v3 = [MNSequence alloc];
  v4 = dispatch_queue_create("MNNavigationSimulation_SearchingForParking", 0);
  v5 = -[MNSequence initWithQueue:](v3, "initWithQueue:", v4);

  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __93___MNLocationSimulationState_SearchingForParkingBeforeArrival__findRouteToParkingDestination__block_invoke;
  v9[3] = &unk_1E61D3B50;
  v9[4] = self;
  -[MNSequence addStep:](v5, "addStep:", v9);
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __93___MNLocationSimulationState_SearchingForParkingBeforeArrival__findRouteToParkingDestination__block_invoke_2;
  v8[3] = &unk_1E61D3BA0;
  v8[4] = self;
  -[MNSequence addStep:](v5, "addStep:", v8);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __93___MNLocationSimulationState_SearchingForParkingBeforeArrival__findRouteToParkingDestination__block_invoke_3;
  v7[3] = &unk_1E61D3C68;
  v7[4] = self;
  -[MNSequence addStep:](v5, "addStep:", v7);
  -[MNSequence start](v5, "start");

}

- (void)_findParkingLocation:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD *v29;
  _QWORD v30[9];
  _QWORD v31[4];
  _QWORD v32[5];
  id v33;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0D27198]);
  v6 = (void *)objc_msgSend(v5, "initWithQueue:", MEMORY[0x1E0C80D38]);
  -[_MNLocationSimulationState data](self, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "auditToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAuditToken:", v8);

  objc_msgSend(v6, "setAllowNetworkTileLoad:", 1);
  objc_msgSend(v6, "setFlipNegativeTravelDirectionRoads:", 1);
  objc_msgSend(v6, "setVisitDoubleTravelDirectionRoadsTwice:", 0);
  -[_MNLocationSimulationState data](self, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastLocation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_navigation_geoCoordinate");
  v12 = v11;
  v14 = v13;

  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__9;
  v32[4] = __Block_byref_object_dispose__9;
  v33 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v31[3] = 0;
  -[_MNLocationSimulationState data](self, "data");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "routeInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "route");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MNLocationSimulationState data](self, "data");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "routeInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "route");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "pointAt:", objc_msgSend(v20, "pointCount") - 1);
  v22 = v21;
  v24 = v23;

  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __84___MNLocationSimulationState_SearchingForParkingBeforeArrival__findParkingLocation___block_invoke;
  v30[3] = &unk_1E61D3C90;
  v30[7] = v12;
  v30[8] = v14;
  v30[4] = self;
  v30[5] = v31;
  v30[6] = v32;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __84___MNLocationSimulationState_SearchingForParkingBeforeArrival__findParkingLocation___block_invoke_2;
  v27[3] = &unk_1E61D3CB8;
  v29 = v32;
  v25 = v4;
  v28 = v25;
  v26 = (id)objc_msgSend(v6, "findRoadsNear:radius:handler:completionHandler:", v30, v27, v22, v24, 200.0);

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v32, 8);

}

- (double)_scoreForRoad:(id)a3 coordinate:(id)a4
{
  id v5;
  void *v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;

  v5 = a3;
  objc_msgSend(v5, "internalRoadName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0.0;
  if (v6)
  {
    if (objc_msgSend(v5, "roadClass") != 9)
    {
      v8 = objc_msgSend(v5, "coordinates3d");
      v9 = v8 + 24 * objc_msgSend(v5, "coordinateCount");
      v10 = *(double *)(v9 - 24);
      v11 = *(double *)(v9 - 16);
      if (objc_msgSend(v5, "travelDirection") != 1
        || (GEOCalculateDistance(), v13 = v12, objc_msgSend(v5, "coordinates3d"), GEOCalculateDistance(), v14 < v13))
      {
        v15 = objc_alloc(MEMORY[0x1E0D274E8]);
        -[_MNLocationSimulationState data](self, "data");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "routeInfo");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "route");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MNLocationSimulationState data](self, "data");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "auditToken");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(v15, "initWithRoute:auditToken:", v18, v20);

        objc_msgSend(v21, "distanceToRouteFrom:", v10, v11);
        if (v22 >= 50.0 && v22 <= 75.0)
        {
          -[_MNLocationSimulationState data](self, "data");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "routeInfo");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "route");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v25, "pointAt:", objc_msgSend(v25, "pointCount") - 1);
          GEOCalculateDistance();
          v7 = v26;

        }
      }
    }
  }

  return v7;
}

- (void)_findRouteToParkingLocation:(id)a3 finishedHandler:(id)a4
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
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
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
  objc_msgSend(v15, "setCurrentLocation:", v8);

  v30[0] = v13;
  v30[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWaypoints:", v16);

  objc_msgSend(v15, "setTransportType:", 0);
  -[_MNLocationSimulationState data](self, "data");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "routeInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "route");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "routeAttributes");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setRouteAttributes:", v20);

  objc_msgSend(v15, "setMaxRouteCount:", 1);
  -[_MNLocationSimulationState data](self, "data");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "auditToken");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAuditToken:", v22);

  -[_MNLocationSimulationState data](self, "data");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "requestingAppIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setRequestingAppIdentifier:", v24);

  objc_msgSend(MEMORY[0x1E0D27048], "sharedService");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __107___MNLocationSimulationState_SearchingForParkingBeforeArrival__findRouteToParkingLocation_finishedHandler___block_invoke;
  v28[3] = &unk_1E61D1A78;
  v29 = v6;
  v26 = v6;
  v27 = (id)objc_msgSend(v25, "requestRoutes:handler:", v15, v28);

}

- (id)_routeToFollow
{
  return self->_routeToParkingDestination;
}

- (void)_handleReachedParkingLocation
{
  _MNLocationSimulationState_WaitingForParkingSignal *v2;
  id v3;

  -[_MNLocationSimulationState delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc_init(_MNLocationSimulationState_WaitingForParkingSignal);
  objc_msgSend(v3, "changeState:", v2);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeToParkingDestination, 0);
}

@end
