@implementation GEONavigationMapMatcher

- (GEONavigationMapMatcher)initWithRoute:(id)a3 auditToken:(id)a4
{
  id v7;
  id v8;
  GEONavigationMapMatcher *v9;
  GEONavigationMapMatcher *v10;
  uint64_t v11;
  GEORouteMatcher *routeMatcher;
  GEORoadMatcher *v13;
  GEORoadMatcher *roadMatcher;
  GEOLocationShifter *v15;
  GEOLocationShifter *locationShifter;
  GEONavigationMapMatcher *v17;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)GEONavigationMapMatcher;
  v9 = -[GEONavigationMapMatcher init](&v19, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_route, a3);
    objc_storeStrong((id *)&v10->_auditToken, a4);
    v10->_targetLegIndex = 0x7FFFFFFFFFFFFFFFLL;
    -[GEONavigationMapMatcher _routeMatcherForRoute:](v10, "_routeMatcherForRoute:", v7);
    v11 = objc_claimAutoreleasedReturnValue();
    routeMatcher = v10->_routeMatcher;
    v10->_routeMatcher = (GEORouteMatcher *)v11;

    v13 = -[GEORoadMatcher initWithAuditToken:]([GEORoadMatcher alloc], "initWithAuditToken:", v8);
    roadMatcher = v10->_roadMatcher;
    v10->_roadMatcher = v13;

    v15 = objc_alloc_init(GEOLocationShifter);
    locationShifter = v10->_locationShifter;
    v10->_locationShifter = v15;

    -[GEORoadMatcher setUseRawLocations:](v10->_roadMatcher, "setUseRawLocations:", objc_msgSend(v7, "transportType") == 0);
    v17 = v10;
  }

  return v10;
}

- (id)matchLocation:(id)a3 transportType:(int)a4
{
  return 0;
}

- (id)updateForReroute:(id)a3 location:(id)a4 routeStartsFromLocation:(BOOL)a5
{
  _BOOL4 v5;
  GEOComposedRoute *v9;
  id v10;
  GEORouteMatcher *v11;
  GEORouteMatcher *routeMatcher;
  GEONavigationMatchResult *v13;
  GEORouteMatch *v14;
  void *v15;

  v5 = a5;
  v9 = (GEOComposedRoute *)a3;
  if (self->_route == v9)
  {
    v15 = 0;
  }
  else
  {
    objc_storeStrong((id *)&self->_route, a3);
    v10 = a4;
    -[GEONavigationMapMatcher setPreviousMatchResult:](self, "setPreviousMatchResult:", 0);
    -[GEONavigationMapMatcher _routeMatcherForRoute:](self, "_routeMatcherForRoute:", v9);
    v11 = (GEORouteMatcher *)objc_claimAutoreleasedReturnValue();
    routeMatcher = self->_routeMatcher;
    self->_routeMatcher = v11;

    -[GEORouteMatcher setRequiresRoadNetworkData:](self->_routeMatcher, "setRequiresRoadNetworkData:", self->_requiresRoadNetworkData);
    -[GEORouteMatcher setShouldSnapRouteMatchToRoute:](self->_routeMatcher, "setShouldSnapRouteMatchToRoute:", self->_shouldSnapRouteMatchToRoute);
    -[GEORouteMatcher setShouldWaitForSnappedSegments:](self->_routeMatcher, "setShouldWaitForSnappedSegments:", self->_shouldWaitForSnappedSegments);
    -[GEONavigationMapMatcher setTargetLegIndex:](self, "setTargetLegIndex:", 0);
    -[GEORouteMatcher setUseStrictInitialOnRouteCriteria:](self->_routeMatcher, "setUseStrictInitialOnRouteCriteria:", 0);
    if (v5)
    {
      v13 = objc_alloc_init(GEONavigationMatchResult);
      v14 = -[GEORouteMatch initWithRoute:routeCoordinate:locationCoordinate:stepIndex:matchedCourse:timestamp:]([GEORouteMatch alloc], "initWithRoute:routeCoordinate:locationCoordinate:stepIndex:matchedCourse:timestamp:", v9, 0, 0, 0, -180.0, -180.0, 1.79769313e308, -1.0);
      -[GEORouteMatch setIsGoodMatch:](v14, "setIsGoodMatch:", 1);
      -[GEONavigationMatchResult setRouteMatch:](v13, "setRouteMatch:", v14);
      -[GEONavigationMapMatcher setPreviousMatchResult:](self, "setPreviousMatchResult:", v13);

    }
    -[GEONavigationMapMatcher matchLocation:transportType:](self, "matchLocation:transportType:", v10, -[GEOComposedRoute transportType](v9, "transportType"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[GEORouteMatcher setUseStrictInitialOnRouteCriteria:](self->_routeMatcher, "setUseStrictInitialOnRouteCriteria:", 1);
  }

  return v15;
}

- (void)setTargetLegIndex:(unint64_t)a3
{
  NSObject *v5;
  unint64_t targetLegIndex;
  _DWORD v7[2];
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  GEOGetMapMatchingLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    targetLegIndex = self->_targetLegIndex;
    v7[0] = 67109376;
    v7[1] = targetLegIndex;
    v8 = 1024;
    v9 = a3;
    _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_DEFAULT, "Changing target leg index from %d to %d", (uint8_t *)v7, 0xEu);
  }

  self->_targetLegIndex = a3;
  -[GEORouteMatcher setTargetLegIndex:](self->_routeMatcher, "setTargetLegIndex:", a3);
}

- (void)setRequiresRoadNetworkData:(BOOL)a3
{
  self->_requiresRoadNetworkData = a3;
  -[GEORouteMatcher setRequiresRoadNetworkData:](self->_routeMatcher, "setRequiresRoadNetworkData:");
}

- (void)setShouldSnapRouteMatchToRoute:(BOOL)a3
{
  self->_shouldSnapRouteMatchToRoute = a3;
  -[GEORouteMatcher setShouldSnapRouteMatchToRoute:](self->_routeMatcher, "setShouldSnapRouteMatchToRoute:");
}

- (int)transportType
{
  return 4;
}

- (void)resetToLocation:(id)a3
{
  GEORouteMatcher *routeMatcher;
  id v5;
  void *v6;
  id v7;

  routeMatcher = self->_routeMatcher;
  v5 = a3;
  -[GEORouteMatcher matchToRouteWithLocation:](routeMatcher, "matchToRouteWithLocation:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIsGoodMatch:", 1);
  +[GEONavigationMatchResult matchResultWithRouteMatch:location:](GEONavigationMatchResult, "matchResultWithRouteMatch:location:", v7, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[GEONavigationMapMatcher setPreviousMatchResult:](self, "setPreviousMatchResult:", v6);
}

- (void)setShouldWaitForSnappedSegments:(BOOL)a3
{
  self->_shouldWaitForSnappedSegments = a3;
  -[GEORouteMatcher setShouldWaitForSnappedSegments:](self->_routeMatcher, "setShouldWaitForSnappedSegments:");
}

- (void)setRoute:(id)a3
{
  GEORouteMatcher *v5;
  GEORouteMatcher *routeMatcher;
  GEOComposedRoute *v7;

  v7 = (GEOComposedRoute *)a3;
  if (self->_route != v7)
  {
    objc_storeStrong((id *)&self->_route, a3);
    -[GEONavigationMapMatcher setPreviousMatchResult:](self, "setPreviousMatchResult:", 0);
    -[GEONavigationMapMatcher _routeMatcherForRoute:](self, "_routeMatcherForRoute:", v7);
    v5 = (GEORouteMatcher *)objc_claimAutoreleasedReturnValue();
    routeMatcher = self->_routeMatcher;
    self->_routeMatcher = v5;

    -[GEORouteMatcher setRequiresRoadNetworkData:](self->_routeMatcher, "setRequiresRoadNetworkData:", self->_requiresRoadNetworkData);
    -[GEORouteMatcher setShouldSnapRouteMatchToRoute:](self->_routeMatcher, "setShouldSnapRouteMatchToRoute:", self->_shouldSnapRouteMatchToRoute);
    -[GEORouteMatcher setShouldWaitForSnappedSegments:](self->_routeMatcher, "setShouldWaitForSnappedSegments:", self->_shouldWaitForSnappedSegments);
  }

}

- (void)setPreviousMatchResult:(id)a3
{
  objc_storeStrong((id *)&self->_previousMatchResult, a3);
}

- (id)_routeMatcherForRoute:(id)a3
{
  return 0;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (GEONavigationMatchResult)previousMatchResult
{
  return self->_previousMatchResult;
}

- (GEOApplicationAuditToken)auditToken
{
  return self->_auditToken;
}

- (unint64_t)targetLegIndex
{
  return self->_targetLegIndex;
}

- (BOOL)isSimulation
{
  return self->_isSimulation;
}

- (void)setIsSimulation:(BOOL)a3
{
  self->_isSimulation = a3;
}

- (GEORouteMatcher)routeMatcher
{
  return self->_routeMatcher;
}

- (void)setRouteMatcher:(id)a3
{
  objc_storeStrong((id *)&self->_routeMatcher, a3);
}

- (GEORoadMatcher)roadMatcher
{
  return self->_roadMatcher;
}

- (void)setRoadMatcher:(id)a3
{
  objc_storeStrong((id *)&self->_roadMatcher, a3);
}

- (GEOLocationShifter)locationShifter
{
  return self->_locationShifter;
}

- (void)setLocationShifter:(id)a3
{
  objc_storeStrong((id *)&self->_locationShifter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationShifter, 0);
  objc_storeStrong((id *)&self->_roadMatcher, 0);
  objc_storeStrong((id *)&self->_routeMatcher, 0);
  objc_storeStrong((id *)&self->_previousMatchResult, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
}

@end
