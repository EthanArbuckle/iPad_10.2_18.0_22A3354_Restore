@implementation MNSteppingLocationTracker

- (MNSteppingLocationTracker)initWithNavigationSession:(id)a3
{
  id v4;
  MNSteppingLocationTracker *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  GEORouteMatcher *routeMatcher;
  MNSteppingLocationTracker *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MNSteppingLocationTracker;
  v5 = -[MNLocationTracker initWithNavigationSession:](&v14, sel_initWithNavigationSession_, v4);
  if (v5)
  {
    objc_msgSend(v4, "routeManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentRoute");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_alloc(MEMORY[0x1E0D274E8]);
    objc_msgSend(v4, "auditToken");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithRoute:auditToken:", v7, v9);
    routeMatcher = v5->_routeMatcher;
    v5->_routeMatcher = (GEORouteMatcher *)v10;

    v12 = v5;
  }

  return v5;
}

- (int)transportType
{
  void *v2;
  void *v3;
  void *v4;
  int v5;

  -[MNLocationTracker navigationSession](self, "navigationSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "routeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentRoute");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "transportType");

  return v5;
}

- (id)matchedLocationForLocation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MNSteppingLocationTracker;
  -[MNLocationTracker matchedLocationForLocation:](&v9, sel_matchedLocationForLocation_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "routeMatch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "step");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isArrivalStep");

  if (v7)
    -[MNArrivalUpdater updateForLocation:](self->_arrivalUpdater, "updateForLocation:", v4);
  return v4;
}

- (void)startTrackingWithInitialLocation:(id)a3 targetLegIndex:(unint64_t)a4
{
  id v6;
  MNArrivalUpdater *v7;
  MNArrivalUpdater *arrivalUpdater;
  void *v9;
  objc_super v10;

  v6 = a3;
  -[MNLocationTracker _setState:](self, "_setState:", 1);
  v7 = objc_alloc_init(MNArrivalUpdater);
  arrivalUpdater = self->_arrivalUpdater;
  self->_arrivalUpdater = v7;

  -[MNArrivalUpdater setDelegate:](self->_arrivalUpdater, "setDelegate:", self);
  -[MNLocationTracker navigationSessionState](self, "navigationSessionState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNArrivalUpdater setNavigationSessionState:](self->_arrivalUpdater, "setNavigationSessionState:", v9);

  -[MNArrivalUpdater start](self->_arrivalUpdater, "start");
  v10.receiver = self;
  v10.super_class = (Class)MNSteppingLocationTracker;
  -[MNLocationTracker startTrackingWithInitialLocation:targetLegIndex:](&v10, sel_startTrackingWithInitialLocation_targetLegIndex_, v6, a4);

}

- (void)stopTracking
{
  MNArrivalUpdater *arrivalUpdater;
  objc_super v4;

  -[MNLocationTracker _setState:](self, "_setState:", 0);
  -[MNArrivalUpdater setDelegate:](self->_arrivalUpdater, "setDelegate:", 0);
  arrivalUpdater = self->_arrivalUpdater;
  self->_arrivalUpdater = 0;

  v4.receiver = self;
  v4.super_class = (Class)MNSteppingLocationTracker;
  -[MNLocationTracker stopTracking](&v4, sel_stopTracking);
}

- (id)_matchedLocationForLocation:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  MNLocation *v10;
  MNLocation *v11;
  void *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MNGetPuckTrackingLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = v6;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_INFO, "[MN] [%@] - Processing - in MNSteppingLocationTracker::_matchedLocationForLocation:", (uint8_t *)&v14, 0xCu);

  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27168]), "initWithCLLocation:", v4);
  -[GEORouteMatcher matchToRouteWithLocation:](self->_routeMatcher, "matchToRouteWithLocation:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isGoodMatch");
  v10 = [MNLocation alloc];
  if (v9)
  {
    v11 = -[MNLocation initWithRouteMatch:rawLocation:locationMatchType:](v10, "initWithRouteMatch:rawLocation:locationMatchType:", v8, v4, 0);
  }
  else
  {
    v11 = -[MNLocation initWithRawLocation:](v10, "initWithRawLocation:", v4);
    -[MNLocation setRouteMatch:](v11, "setRouteMatch:", v8);
  }
  if (GEOConfigGetBOOL())
  {
    objc_msgSend(v4, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNLocation setUuid:](v11, "setUuid:", v12);

  }
  return v11;
}

- (void)updateLocation:(id)a3
{
  id v4;

  v4 = a3;
  if (-[MNLocationTracker state](self, "state") == 1 && objc_msgSend(v4, "stepIndex") != 0x7FFFFFFFFFFFFFFFLL)
    -[MNLocationTracker _setState:](self, "_setState:", 2);

}

- (void)arrivalUpdater:(id)a3 didUpdateArrivalInfo:(id)a4
{
  id v5;

  v5 = a4;
  if (objc_msgSend(v5, "arrivalState") == 4)
    -[MNLocationTracker _updateArrivalInfo:](self, "_updateArrivalInfo:", v5);

}

- (void)arrivalUpdaterDidArrive:(id)a3 atEndOfLegAtIndex:(unint64_t)a4
{
  id v5;

  -[MNLocationTracker safeDelegate](self, "safeDelegate", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationTrackerDidArrive:", self);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrivalUpdater, 0);
  objc_storeStrong((id *)&self->_routeMatcher, 0);
}

@end
