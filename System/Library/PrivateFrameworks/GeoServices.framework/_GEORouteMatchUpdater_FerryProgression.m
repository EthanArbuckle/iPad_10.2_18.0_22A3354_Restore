@implementation _GEORouteMatchUpdater_FerryProgression

- (_GEORouteMatchUpdater_FerryProgression)initWithRoute:(id)a3 tripSegment:(id)a4
{
  id v5;
  _GEORouteMatchUpdater_FerryProgression *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  GEOComposedRouteStep *boardStep;
  void *v14;
  uint64_t v15;
  GEOComposedRouteStep *alightStep;
  _GEORouteMatchUpdater_FerryProgression *v17;
  objc_super v19;

  v5 = a4;
  v19.receiver = self;
  v19.super_class = (Class)_GEORouteMatchUpdater_FerryProgression;
  v6 = -[_GEORouteMatchUpdater_FerryProgression init](&v19, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "endingTransitStop");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "latLng");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "coordinate");
    v6->_alightLocationCoordinate.latitude = v9;
    v6->_alightLocationCoordinate.longitude = v10;

    objc_msgSend(v5, "steps");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = objc_claimAutoreleasedReturnValue();
    boardStep = v6->_boardStep;
    v6->_boardStep = (GEOComposedRouteStep *)v12;

    objc_msgSend(v5, "steps");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lastObject");
    v15 = objc_claimAutoreleasedReturnValue();
    alightStep = v6->_alightStep;
    v6->_alightStep = (GEOComposedRouteStep *)v15;

    v17 = v6;
  }

  return v6;
}

- (BOOL)updateRouteMatch:(id)a3 previousRouteMatch:(id)a4 forLocation:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  double v12;
  double v13;
  long double v14;
  double startProgressionDistanceToDestination;
  double v16;
  unint64_t progressionCount;
  void *v18;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v9, "stepIndex");
  if (v11 == -[GEOComposedRouteStep stepIndex](self->_boardStep, "stepIndex"))
  {
    objc_msgSend(v10, "coordinate");
    v14 = GEOCalculateDistanceRadius(v12, v13, self->_alightLocationCoordinate.latitude, self->_alightLocationCoordinate.longitude, 6367000.0);
    startProgressionDistanceToDestination = self->_startProgressionDistanceToDestination;
    v16 = startProgressionDistanceToDestination - v14;
    progressionCount = self->_progressionCount;
    if (progressionCount < 0x10 || v16 <= 150.0)
    {
      if (startProgressionDistanceToDestination <= 0.0 || v16 < -100.0)
      {
        progressionCount = 0;
        self->_startProgressionDistanceToDestination = v14;
        self->_progressionCount = 0;
      }
      self->_progressionCount = progressionCount + 1;
    }
    else
    {
      objc_msgSend(v8, "setStepIndex:", -[GEOComposedRouteStep stepIndex](self->_alightStep, "stepIndex"));
      v21[0] = self->_alightStep;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setCandidateSteps:", v18);

    }
  }

  return 0;
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

@end
