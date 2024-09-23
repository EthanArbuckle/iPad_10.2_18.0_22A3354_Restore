@implementation _GEORouteMatchUpdater_EnterBoard

- (_GEORouteMatchUpdater_EnterBoard)initWithTransitRouteMatcher:(id)a3 boardVehicleStep:(id)a4
{
  id v6;
  id v7;
  _GEORouteMatchUpdater_EnterBoard *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  double v15;
  unsigned int v16;
  float v17;
  unsigned int v18;
  float v19;
  double v20;
  double v21;
  uint64_t v22;
  GEOPBTransitStop *transitStop;
  uint64_t v24;
  GEOPBTransitStation *transitStation;
  void *v26;
  id v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  GEOPBTransitStation *v33;
  void *v34;
  double v35;
  _GEORouteMatchUpdater_EnterBoard *v36;
  void *v38;
  objc_super v39;

  v6 = a3;
  v7 = a4;
  v39.receiver = self;
  v39.super_class = (Class)_GEORouteMatchUpdater_EnterBoard;
  v8 = -[_GEORouteMatchUpdater initWithTransitRouteMatcher:](&v39, sel_initWithTransitRouteMatcher_, v6);
  if (v8)
  {
    objc_msgSend(v7, "getPreviousStep");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "getPreviousStep");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOComposedRoute segmentForStepIndex:](v8->super._route, "segmentForStepIndex:", objc_msgSend(v38, "stepIndex"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "endPointIndex");
      v13 = objc_msgSend(v11, "startPointIndex");
      v14 = -[GEOComposedRoute routeCoordinateAtDistance:beforeRouteCoordinate:](v8->super._route, "routeCoordinateAtDistance:beforeRouteCoordinate:", v12, 150.0);
      LODWORD(v15) = HIDWORD(v14);
      if (*((float *)&v14 + 1) > 0.0)
        v16 = v14;
      else
        v16 = v13;
      if (*((float *)&v14 + 1) > 0.0)
        v17 = *((float *)&v14 + 1);
      else
        v17 = 0.0;
      if (v13 != (_DWORD)v14)
      {
        v16 = v13;
        v17 = 0.0;
      }
      if (v13 >= v14)
        v18 = v16;
      else
        v18 = v14;
      if (v13 >= v14)
        v19 = v17;
      else
        v19 = *((float *)&v14 + 1);
      -[GEOComposedRoute pointAt:](v8->super._route, "pointAt:", objc_msgSend(v11, "endPointIndex", v15));
      v8->_entranceCoordinate.latitude = v20;
      v8->_entranceCoordinate.longitude = v21;
      v8->_routeCoordinateApproaching.index = v18;
      v8->_routeCoordinateApproaching.offset = v19;
      v8->_routeCoordinateAtStation.index = v12;
      v8->_routeCoordinateAtStation.offset = 0.0;
      objc_storeStrong((id *)&v8->_enterStationStep, v10);

    }
    else
    {
      v8->_hasEnteredStation = 1;
    }
    objc_msgSend(v7, "startingStop");
    v22 = objc_claimAutoreleasedReturnValue();
    transitStop = v8->_transitStop;
    v8->_transitStop = (GEOPBTransitStop *)v22;

    -[GEOComposedRoute getStationForStop:](v8->super._route, "getStationForStop:", v8->_transitStop);
    v24 = objc_claimAutoreleasedReturnValue();
    transitStation = v8->_transitStation;
    v8->_transitStation = (GEOPBTransitStation *)v24;

    objc_storeStrong((id *)&v8->_boardVehicleStep, a4);
    objc_msgSend(v7, "getNextStep");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v8->_rideStep, v26);
    if (v8->_transitStation)
    {
      v27 = v10;
      v28 = v27;
      if (v10)
      {
        objc_msgSend(v27, "startGeoCoordinate");
        v30 = v29;
        v32 = v31;
      }
      else
      {
        v30 = -180.0;
        v32 = -180.0;
      }
      v33 = v8->_transitStation;
      objc_msgSend(v28, "accessPoint");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[_GEORouteMatchUpdater _stationRadiusForStation:accessPoint:adjacentWalkingLegCoordinate:](v8, "_stationRadiusForStation:accessPoint:adjacentWalkingLegCoordinate:", v33, v34, v30, v32);
      v8->super._stationRadius = v35;

    }
    v36 = v8;

  }
  return v8;
}

- (BOOL)updateRouteMatch:(id)a3 previousRouteMatch:(id)a4 forLocation:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  BOOL v12;
  GEOComposedTransitTripRouteStep *rideStep;
  void *v14;
  GEOPBTransitStation *transitStation;
  uint64_t v16;
  uint64_t v17;
  unsigned int index;
  unsigned int v19;
  void *v20;
  GEOComposedRouteStep *enterStationStep;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    v11 = objc_msgSend(v9, "stepIndex");
    if (v11 > -[GEOComposedRouteStep stepIndex](self->_boardVehicleStep, "stepIndex"))
    {
LABEL_6:
      v12 = 0;
      goto LABEL_19;
    }
  }
  if (self->_hasEnteredStation)
  {
    if (-[_GEORouteMatchUpdater_EnterBoard _hasLocationExitedStation:](self, "_hasLocationExitedStation:", v10))
      goto LABEL_5;
  }
  else if (!-[_GEORouteMatchUpdater_EnterBoard _hasLocationEnteredStation:routeMatch:](self, "_hasLocationEnteredStation:routeMatch:", v10, v8))
  {
LABEL_5:
    if (!self->_hasEnteredStation)
    {
      v17 = objc_msgSend(v8, "routeCoordinate");
      index = self->_routeCoordinateApproaching.index;
      if (index < v17
        || index == (_DWORD)v17 && self->_routeCoordinateApproaching.offset < *((float *)&v17 + 1))
      {
        v19 = self->_routeCoordinateAtStation.index;
        if (v19 > v17
          || v19 == (_DWORD)v17 && self->_routeCoordinateAtStation.offset > *((float *)&v17 + 1))
        {
          objc_msgSend(v8, "setStepIndex:", -[GEOComposedRouteStep stepIndex](self->_enterStationStep, "stepIndex"));
          enterStationStep = self->_enterStationStep;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &enterStationStep, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setCandidateSteps:", v20);

          v12 = 1;
          goto LABEL_19;
        }
      }
    }
    goto LABEL_6;
  }
  objc_msgSend(v8, "setIsGoodMatch:", 1);
  objc_msgSend(v8, "setStepIndex:", -[GEOComposedRouteStep stepIndex](self->_boardVehicleStep, "stepIndex"));
  rideStep = self->_rideStep;
  v23[0] = self->_boardVehicleStep;
  v23[1] = rideStep;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCandidateSteps:", v14);

  transitStation = self->_transitStation;
  if (transitStation)
    v16 = -[GEOPBTransitStation muid](transitStation, "muid");
  else
    v16 = -[GEOPBTransitStop muid](self->_transitStop, "muid");
  objc_msgSend(v8, "setTransitID:", v16);
  if (objc_msgSend(v10, "hasTransitID"))
    objc_msgSend(v8, "setModifiedHorizontalAccuracy:", self->super._stationRadius);
  v12 = 1;
  self->_hasEnteredStation = 1;
LABEL_19:

  return v12;
}

- (BOOL)_hasLocationEnteredStation:(id)a3 routeMatch:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  double v11;
  GEOPBTransitStation *transitStation;
  _BOOL4 v13;
  int v14;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_hasEnteredStation
    || (objc_msgSend(v7, "distanceFromRoute"), v11 < 50.0)
    && (-[_GEORouteMatchUpdater_EnterBoard _isLocationNearEndOfWalkingSegment:](self, "_isLocationNearEndOfWalkingSegment:", v6)|| -[_GEORouteMatchUpdater_EnterBoard _isLocationNearAccessPoint:](self, "_isLocationNearAccessPoint:", v6)))
  {
    v9 = 1;
  }
  else
  {
    transitStation = self->_transitStation;
    if (transitStation)
      v13 = -[GEOPBTransitStation structureType](transitStation, "structureType") != 3;
    else
      v13 = 1;
    v9 = (!objc_msgSend(v6, "hasType")
       || (objc_msgSend(v6, "type") != 1 ? (v14 = 1) : (v14 = v13), v14 == 1))
      && -[_GEORouteMatchUpdater_EnterBoard _isLocationNearTransitNode:](self, "_isLocationNearTransitNode:", v6);
  }

  return v9;
}

- (BOOL)_hasLocationExitedStation:(id)a3
{
  id v4;
  _BOOL4 v5;

  v4 = a3;
  if (self->_hasEnteredStation)
    v5 = !-[_GEORouteMatchUpdater_EnterBoard _isLocationNearTransitNode:](self, "_isLocationNearTransitNode:", v4);
  else
    LOBYTE(v5) = 0;

  return v5;
}

- (BOOL)_isLocationNearEndOfWalkingSegment:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double latitude;
  double longitude;
  double v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;

  v4 = a3;
  objc_msgSend(v4, "coordinate");
  v6 = v5;
  v8 = v7;
  latitude = self->_entranceCoordinate.latitude;
  longitude = self->_entranceCoordinate.longitude;
  LODWORD(self) = -[GEOComposedTransitTripRouteStep isBus](self->_rideStep, "isBus");
  objc_msgSend(v4, "horizontalAccuracy");
  v12 = v11;
  v13 = GEOCalculateDistanceRadius(v6, v8, latitude, longitude, 6367000.0);
  v14 = 50.0;
  if ((_DWORD)self)
    v14 = 15.0;
  v15 = v13 < v14 + v12;

  return v15;
}

- (BOOL)_isLocationNearTransitNode:(id)a3
{
  id v4;
  GEOPBTransitStation *transitStation;
  double stationRadius;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  BOOL v12;
  BOOL v13;

  v4 = a3;
  transitStation = self->_transitStation;
  if (!transitStation)
    goto LABEL_11;
  stationRadius = self->super._stationRadius;
  if (stationRadius <= 0.0)
    stationRadius = 100.0;
  v7 = 200.0;
  if (stationRadius > 100.0)
    v7 = stationRadius + stationRadius;
  v8 = self->_hasEnteredStation ? v7 : stationRadius;
  -[GEOPBTransitStation location](transitStation, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "coordinate");
  v12 = -[_GEORouteMatchUpdater _isLocation:nearTransitPoint:transitID:featureSize:](self, "_isLocation:nearTransitPoint:transitID:featureSize:", v4, -[GEOPBTransitStation muid](self->_transitStation, "muid"), v10, v11, v8);

  if (v12)
    v13 = 1;
  else
LABEL_11:
    v13 = -[_GEORouteMatchUpdater _isLocation:nearStop:](self, "_isLocation:nearStop:", v4, self->_transitStop);

  return v13;
}

- (BOOL)_isLocationNearAccessPoint:(id)a3
{
  id v4;
  GEOPBTransitStation *transitStation;
  GEOMapFeatureAccess *mapFeatureAccess;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  BOOL v13;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v4 = a3;
  transitStation = self->_transitStation;
  if (transitStation && -[GEOPBTransitStation hasMuid](transitStation, "hasMuid"))
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0;
    mapFeatureAccess = self->super._mapFeatureAccess;
    v7 = -[GEOPBTransitStation muid](self->_transitStation, "muid");
    objc_msgSend(v4, "coordinate");
    v9 = v8;
    v11 = v10;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __63___GEORouteMatchUpdater_EnterBoard__isLocationNearAccessPoint___block_invoke;
    v15[3] = &unk_1E1C127D0;
    v15[4] = self;
    v17 = &v18;
    v16 = v4;
    v12 = -[GEOMapFeatureAccess findTransitPointWithID:near:pointHandler:completionHandler:](mapFeatureAccess, "findTransitPointWithID:near:pointHandler:completionHandler:", v7, v15, 0, v9, v11);
    v13 = *((_BYTE *)v19 + 24) != 0;

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rideStep, 0);
  objc_storeStrong((id *)&self->_boardVehicleStep, 0);
  objc_storeStrong((id *)&self->_enterStationStep, 0);
  objc_storeStrong((id *)&self->_transitStation, 0);
  objc_storeStrong((id *)&self->_transitStop, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 11) = 0xBF80000000000000;
  *((_QWORD *)self + 12) = 0xBF80000000000000;
  return self;
}

@end
