@implementation _GEORouteMatchUpdater_LineProgression

- (_GEORouteMatchUpdater_LineProgression)initWithTransitRouteMatcher:(id)a3 tripSegment:(id)a4
{
  id v6;
  _GEORouteMatchUpdater_LineProgression *v7;
  void *v8;
  GEOComposedTransitTripRouteStep *v9;
  void *v10;
  uint64_t v11;
  GEOComposedTransitTripRouteStep *boardStep;
  GEOComposedTransitTripRouteStep *v13;
  GEOComposedTransitTripRouteStep *alightStep;
  _GEORouteMatchUpdater_LineProgression *v15;
  objc_super v17;

  v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_GEORouteMatchUpdater_LineProgression;
  v7 = -[_GEORouteMatchUpdater initWithTransitRouteMatcher:](&v17, sel_initWithTransitRouteMatcher_, a3);
  if (v7)
  {
    objc_msgSend(v6, "steps");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (GEOComposedTransitTripRouteStep *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "steps");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastObject");
    v11 = objc_claimAutoreleasedReturnValue();

    boardStep = v7->_boardStep;
    v7->_boardStep = v9;
    v13 = v9;

    alightStep = v7->_alightStep;
    v7->_alightStep = (GEOComposedTransitTripRouteStep *)v11;

    v15 = v7;
  }

  return v7;
}

- (BOOL)updateRouteMatch:(id)a3 previousRouteMatch:(id)a4 forLocation:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id WeakRetained;
  double v22;
  double v23;
  double v24;
  double v25;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  double v30;
  PolylineCoordinate *p_startRouteCoordinate;
  BOOL v32;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "horizontalAccuracy");
  v12 = v11;
  objc_msgSend(v10, "coordinate");
  v14 = v13;
  v16 = v15;
  -[GEOComposedTransitRouteStep startGeoCoordinate](self->_boardStep, "startGeoCoordinate");
  v18 = v17;
  v20 = v19;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._routeMatcher);
  objc_msgSend(WeakRetained, "distanceToClosestWalkingSegment");
  v23 = v22;
  v24 = v12 + 400.0;
  v25 = GEOCalculateDistanceRadius(v14, v16, v18, v20, 6367000.0);

  if (v23 <= v24 || v25 <= v24)
  {
    v27 = objc_msgSend(v8, "stepIndex");
    if (v27 > -[GEOComposedRouteStep stepIndex](self->_boardStep, "stepIndex"))
    {
      v28 = -[GEOComposedRouteStep stepIndex](self->_alightStep, "stepIndex");
      if (v28 >= objc_msgSend(v8, "stepIndex"))
      {
        v29 = objc_msgSend(v9, "stepIndex");
        if (v29 < -[GEOComposedRouteStep stepIndex](self->_boardStep, "stepIndex"))
        {
          if (objc_msgSend(v8, "isGoodMatch"))
          {
            if (objc_msgSend(v10, "hasHorizontalAccuracy"))
            {
              objc_msgSend(v10, "horizontalAccuracy");
              if (v30 <= 65.0)
              {
                p_startRouteCoordinate = &self->_startRouteCoordinate;
                if (self->_startRouteCoordinate.index
                  || fabsf(self->_startRouteCoordinate.offset + 1.0) >= 0.00000011921)
                {
                  -[GEOComposedRoute distanceFromPoint:toPoint:](self->super._route, "distanceFromPoint:toPoint:", *p_startRouteCoordinate, objc_msgSend(v8, "routeCoordinate"));
                  if (v34 > 100.0
                    && (-[GEOMotionContext confidence](self->super._motionContext, "confidence") != 2
                     || !-[GEOComposedTransitTripRouteStep isBus](self->_boardStep, "isBus")
                     && !-[GEOComposedTransitTripRouteStep isRail](self->_boardStep, "isRail")
                     || -[GEOMotionContext isDriving](self->super._motionContext, "isDriving")))
                  {
                    goto LABEL_19;
                  }
                }
                else
                {
                  *p_startRouteCoordinate = (PolylineCoordinate)objc_msgSend(v8, "routeCoordinate");
                }
              }
            }
          }
          -[GEOComposedRoute stepAtIndex:](self->super._route, "stepAtIndex:", objc_msgSend(v8, "stepIndex"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[GEOComposedRoute stepAtIndex:](self->super._route, "stepAtIndex:", objc_msgSend(v9, "stepIndex"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setStepIndex:", objc_msgSend(v9, "stepIndex"));
          v38[0] = v36;
          v38[1] = v35;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setCandidateSteps:", v37);

LABEL_19:
          v32 = 1;
          goto LABEL_16;
        }
      }
    }
  }
  v32 = 0;
LABEL_16:

  return v32;
}

- (unint64_t)priority
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alightStep, 0);
  objc_storeStrong((id *)&self->_boardStep, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 9) = 0xBF80000000000000;
  return self;
}

@end
