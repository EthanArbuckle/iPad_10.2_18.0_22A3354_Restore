@implementation _GEORouteMatchUpdater_AlightExit

- (_GEORouteMatchUpdater_AlightExit)initWithTransitRouteMatcher:(id)a3 alightStep:(id)a4
{
  id v6;
  id v7;
  _GEORouteMatchUpdater_AlightExit *v8;
  void *v9;
  uint64_t v10;
  GEOPBTransitStop *alightStop;
  uint64_t v12;
  GEOPBTransitStation *alightStation;
  GEOPBTransitStation *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  uint64_t v21;
  GEOComposedRouteStep *postAlightWalkingStep;
  double v23;
  double v24;
  double v25;
  double v26;
  GEOPBTransitStation *v27;
  void *v28;
  double v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  int v34;
  objc_class *v35;
  _GEORouteMatchUpdater_AlightExit *v36;
  objc_super v38;

  v6 = a3;
  v7 = a4;
  v38.receiver = self;
  v38.super_class = (Class)_GEORouteMatchUpdater_AlightExit;
  v8 = -[_GEORouteMatchUpdater initWithTransitRouteMatcher:](&v38, sel_initWithTransitRouteMatcher_, v6);
  if (v8)
  {
    objc_msgSend(v7, "getNextStep");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v8->_alightStep, a4);
    objc_msgSend(v7, "endingStop");
    v10 = objc_claimAutoreleasedReturnValue();
    alightStop = v8->_alightStop;
    v8->_alightStop = (GEOPBTransitStop *)v10;

    -[GEOComposedRoute getStationForStop:](v8->super._route, "getStationForStop:", v8->_alightStop);
    v12 = objc_claimAutoreleasedReturnValue();
    alightStation = v8->_alightStation;
    v8->_alightStation = (GEOPBTransitStation *)v12;

    v8->_routeCoordinateAlightStation.index = objc_msgSend(v7, "endPointIndex");
    v8->_routeCoordinateAlightStation.offset = 0.0;
    v14 = v8->_alightStation;
    objc_msgSend(v9, "transitStep");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "maneuverType");

    if (v16 == 6)
    {
      objc_msgSend(v9, "nextTransitStep");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = v9;
    }
    objc_msgSend(v17, "transitStep");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "maneuverType");

    if (v19 == 8)
    {
      v20 = v17;
      objc_storeStrong((id *)&v8->_postAlightStep, v17);
      objc_msgSend(v20, "getNextStep");
      v21 = objc_claimAutoreleasedReturnValue();
      postAlightWalkingStep = v8->_postAlightWalkingStep;
      v8->_postAlightWalkingStep = (GEOComposedRouteStep *)v21;

      if (!v14 || !v20)
        goto LABEL_15;
      objc_msgSend(v20, "endGeoCoordinate");
      v24 = v23;
      v26 = v25;
      v27 = v8->_alightStation;
      objc_msgSend(v20, "accessPoint");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[_GEORouteMatchUpdater _stationRadiusForStation:accessPoint:adjacentWalkingLegCoordinate:](v8, "_stationRadiusForStation:accessPoint:adjacentWalkingLegCoordinate:", v27, v28, v24, v26);
      v8->super._stationRadius = v29;
    }
    else
    {
      objc_msgSend(v17, "transitStep");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "maneuverType");

      if (v31 == 2)
      {
        objc_storeStrong((id *)&v8->_postAlightStep, v17);
        v32 = 96;
      }
      else
      {
        objc_msgSend(v17, "transitStep");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "maneuverType");

        if (v34 != 10)
        {
          v20 = 0;
          goto LABEL_15;
        }
        v32 = 88;
      }
      v35 = v17;
      v20 = 0;
      v28 = *(Class *)((char *)&v8->super.super.isa + v32);
      *(Class *)((char *)&v8->super.super.isa + v32) = v35;
    }

LABEL_15:
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
  GEOPBTransitStation *alightStation;
  uint64_t v13;
  unint64_t v14;
  char v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  GEOLocation *v19;
  double v20;
  double v21;
  GEOLocation *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v9
    || !self->_postAlightWalkingStep
    || (v11 = objc_msgSend(v9, "stepIndex"),
        v11 < -[GEOComposedRouteStep stepIndex](self->_postAlightWalkingStep, "stepIndex")))
  {
    if (-[_GEORouteMatchUpdater_AlightExit _isLocationNearAlightNode:](self, "_isLocationNearAlightNode:", v10))
    {
      objc_msgSend(v8, "setIsGoodMatch:", 1);
      objc_msgSend(v8, "setStepIndex:", -[GEOComposedRouteStep stepIndex](self->_postAlightStep, "stepIndex"));
      alightStation = self->_alightStation;
      if (alightStation)
        v13 = -[GEOPBTransitStation muid](alightStation, "muid");
      else
        v13 = -[GEOPBTransitStop muid](self->_alightStop, "muid");
      objc_msgSend(v8, "setTransitID:", v13);
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", self->_postAlightStep, self->_alightStep, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->_postAlightWalkingStep)
      {
        if (-[GEOMotionContext isWalking](self->super._motionContext, "isWalking"))
          v18 = -[GEOMotionContext confidence](self->super._motionContext, "confidence") == 2;
        else
          v18 = 0;
        v19 = [GEOLocation alloc];
        -[GEOComposedRouteStep endGeoCoordinate](self->_postAlightWalkingStep, "endGeoCoordinate");
        v21 = v20;
        -[GEOComposedRouteStep endGeoCoordinate](self->_postAlightWalkingStep, "endGeoCoordinate");
        v22 = -[GEOLocation initWithLatitude:longitude:](v19, "initWithLatitude:longitude:", v21);
        if (v18)
        {
          v23 = objc_msgSend(v9, "stepIndex");
          if (v23 == -[GEOComposedRouteStep stepIndex](self->_postAlightStep, "stepIndex"))
          {
            if (-[_GEORouteMatchUpdater_AlightExit _isLocationNearAlightNode:](self, "_isLocationNearAlightNode:", v22))
              objc_msgSend(v8, "setStepIndex:", -[GEOComposedRouteStep stepIndex](self->_postAlightWalkingStep, "stepIndex"));
          }
        }
        objc_msgSend(v16, "addObject:", self->_postAlightWalkingStep);

      }
      objc_msgSend(v8, "setCandidateSteps:", v16);
      if (objc_msgSend(v10, "hasTransitID"))
        objc_msgSend(v8, "setModifiedHorizontalAccuracy:", self->super._stationRadius);
      v15 = 1;
LABEL_33:

      goto LABEL_34;
    }
    if (!v9
      || (v14 = objc_msgSend(v9, "stepIndex"), v14 <= -[GEOComposedRouteStep stepIndex](self->_alightStep, "stepIndex")))
    {
      -[GEOComposedRoute segmentForStepIndex:](self->super._route, "segmentForStepIndex:", objc_msgSend(v8, "stepIndex"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOComposedRouteStep segment](self->_alightStep, "segment");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16 == v17)
      {
        v24 = objc_msgSend(v8, "stepIndex");
        if (v24 + 1 == -[GEOComposedRouteStep stepIndex](self->_alightStep, "stepIndex"))
        {
          objc_msgSend(v8, "setStepIndex:", -[GEOComposedRouteStep stepIndex](self->_alightStep, "stepIndex"));
          v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v26 = v25;
          if (self->_alightStep)
            objc_msgSend(v25, "addObject:");
          if (self->_postAlightStep)
            objc_msgSend(v26, "addObject:");
          v27 = (void *)objc_msgSend(v26, "copy");
          objc_msgSend(v8, "setCandidateSteps:", v27);

        }
        v15 = objc_msgSend(v8, "isGoodMatch");
      }
      else
      {
        v15 = 0;
      }

      goto LABEL_33;
    }
  }
  v15 = 0;
LABEL_34:

  return v15;
}

- (BOOL)_isLocationNearAlightNode:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = -[_GEORouteMatchUpdater _isLocation:nearStation:](self, "_isLocation:nearStation:", v4, self->_alightStation)
    || -[_GEORouteMatchUpdater _isLocation:nearStop:](self, "_isLocation:nearStop:", v4, self->_alightStop);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postAlightWalkingStep, 0);
  objc_storeStrong((id *)&self->_postAlightStep, 0);
  objc_storeStrong((id *)&self->_alightStep, 0);
  objc_storeStrong((id *)&self->_alightStation, 0);
  objc_storeStrong((id *)&self->_alightStop, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 9) = 0xBF80000000000000;
  return self;
}

@end
