@implementation _GEORouteMatchUpdater_Transfer

- (_GEORouteMatchUpdater_Transfer)initWithTransitRouteMatcher:(id)a3 alightStep:(id)a4 transferStep:(id)a5 boardStep:(id)a6
{
  id v10;
  id v11;
  id v12;
  _GEORouteMatchUpdater_Transfer *v13;
  uint64_t v14;
  GEOPBTransitStop *alightStop;
  uint64_t v16;
  GEOPBTransitStop *boardStop;
  uint64_t v18;
  GEOPBTransitStation *alightStation;
  uint64_t v20;
  GEOPBTransitStation *boardStation;
  _GEORouteMatchUpdater_Transfer *v22;
  id v24;
  objc_super v25;

  v10 = a3;
  v11 = a4;
  v24 = a5;
  v12 = a6;
  v25.receiver = self;
  v25.super_class = (Class)_GEORouteMatchUpdater_Transfer;
  v13 = -[_GEORouteMatchUpdater initWithTransitRouteMatcher:](&v25, sel_initWithTransitRouteMatcher_, v10);
  if (v13)
  {
    objc_msgSend(v11, "endingStop");
    v14 = objc_claimAutoreleasedReturnValue();
    alightStop = v13->_alightStop;
    v13->_alightStop = (GEOPBTransitStop *)v14;

    objc_msgSend(v12, "startingStop");
    v16 = objc_claimAutoreleasedReturnValue();
    boardStop = v13->_boardStop;
    v13->_boardStop = (GEOPBTransitStop *)v16;

    -[GEOComposedRoute getStationForStop:](v13->super._route, "getStationForStop:", v13->_alightStop);
    v18 = objc_claimAutoreleasedReturnValue();
    alightStation = v13->_alightStation;
    v13->_alightStation = (GEOPBTransitStation *)v18;

    -[GEOComposedRoute getStationForStop:](v13->super._route, "getStationForStop:", v13->_boardStop);
    v20 = objc_claimAutoreleasedReturnValue();
    boardStation = v13->_boardStation;
    v13->_boardStation = (GEOPBTransitStation *)v20;

    objc_storeStrong((id *)&v13->_alightStep, a4);
    objc_storeStrong((id *)&v13->_transferStep, a5);
    objc_storeStrong((id *)&v13->_boardStep, a6);
    v22 = v13;
  }

  return v13;
}

- (BOOL)updateRouteMatch:(id)a3 previousRouteMatch:(id)a4 forLocation:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  _BOOL4 v12;
  _BOOL4 v13;
  _BOOL4 v14;
  _BOOL4 v15;
  _BOOL4 v16;
  int *v17;
  uint64_t v18;
  uint64_t v19;
  GEOComposedRouteStep *boardStep;
  void *v21;
  BOOL v22;
  GEOComposedRouteStep *alightStep;
  void *v24;
  id *p_boardStop;
  _BOOL4 v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    v11 = objc_msgSend(v9, "stepIndex");
    if (v11 > -[GEOComposedRouteStep stepIndex](self->_boardStep, "stepIndex"))
    {
LABEL_13:
      v22 = 0;
      goto LABEL_24;
    }
  }
  v12 = -[_GEORouteMatchUpdater_Transfer _isLocation:nearStation:](self, "_isLocation:nearStation:", v10, self->_alightStation);
  v13 = v12;
  if (self->_alightStation == self->_boardStation)
    v27 = v12;
  else
    v27 = -[_GEORouteMatchUpdater_Transfer _isLocation:nearStation:](self, "_isLocation:nearStation:", v10);
  v14 = -[_GEORouteMatchUpdater_Transfer _isLocation:nearStop:](self, "_isLocation:nearStop:", v10, self->_alightStop);
  v15 = -[_GEORouteMatchUpdater_Transfer _isLocation:nearStop:](self, "_isLocation:nearStop:", v10, self->_boardStop);
  v16 = v15;
  if (v13 || v14)
  {
    v17 = &OBJC_IVAR____GEORouteMatchUpdater_Transfer__transferStep;
  }
  else
  {
    if (!v27 && !v15)
      goto LABEL_11;
    v17 = &OBJC_IVAR____GEORouteMatchUpdater_Transfer__boardStep;
  }
  v18 = objc_msgSend(*(id *)((char *)&self->super.super.isa + *v17), "stepIndex");
  if (v18 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_11:
    v19 = objc_msgSend(v8, "stepIndex");
    if (v19 + 1 == -[GEOComposedRouteStep stepIndex](self->_alightStep, "stepIndex"))
    {
      objc_msgSend(v8, "setStepIndex:", -[GEOComposedRouteStep stepIndex](self->_alightStep, "stepIndex"));
      boardStep = self->_boardStep;
      v28[0] = self->_alightStep;
      v28[1] = boardStep;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setCandidateSteps:", v21);

    }
    goto LABEL_13;
  }
  objc_msgSend(v8, "setIsGoodMatch:", 1);
  objc_msgSend(v8, "setStepIndex:", v18);
  alightStep = self->_alightStep;
  v29[0] = self->_boardStep;
  v29[1] = alightStep;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCandidateSteps:", v24);

  if (v16)
    p_boardStop = (id *)&self->_boardStop;
  else
    p_boardStop = (id *)&self->_alightStop;
  if (v27)
    p_boardStop = (id *)&self->_boardStation;
  if (v13)
    p_boardStop = (id *)&self->_alightStation;
  objc_msgSend(v8, "setTransitID:", objc_msgSend(*p_boardStop, "muid"));
  if (objc_msgSend(v10, "hasTransitID"))
    objc_msgSend(v8, "setModifiedHorizontalAccuracy:", self->super._stationRadius);
  v22 = 1;
LABEL_24:

  return v22;
}

- (BOOL)_isLocation:(id)a3 nearStation:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  BOOL v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "horizontalAccuracy");
  v8 = 200.0;
  if (v9 < 200.0)
  {
    objc_msgSend(v6, "horizontalAccuracy");
    v8 = v10;
  }
  objc_msgSend(v7, "location");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "coordinate");
  v14 = -[_GEORouteMatchUpdater _isLocation:nearTransitPoint:transitID:featureSize:](self, "_isLocation:nearTransitPoint:transitID:featureSize:", v6, objc_msgSend(v7, "muid"), v12, v13, v8 + 100.0);

  return v14;
}

- (BOOL)_isLocation:(id)a3 nearStop:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  BOOL v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "horizontalAccuracy");
  v8 = 200.0;
  if (v9 < 200.0)
  {
    objc_msgSend(v6, "horizontalAccuracy");
    v8 = v10;
  }
  objc_msgSend(v7, "latLng");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "coordinate");
  v14 = -[_GEORouteMatchUpdater _isLocation:nearTransitPoint:transitID:featureSize:](self, "_isLocation:nearTransitPoint:transitID:featureSize:", v6, objc_msgSend(v7, "muid"), v12, v13, v8 + 50.0);

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boardStep, 0);
  objc_storeStrong((id *)&self->_transferStep, 0);
  objc_storeStrong((id *)&self->_alightStep, 0);
  objc_storeStrong((id *)&self->_boardStop, 0);
  objc_storeStrong((id *)&self->_alightStop, 0);
  objc_storeStrong((id *)&self->_boardStation, 0);
  objc_storeStrong((id *)&self->_alightStation, 0);
}

@end
