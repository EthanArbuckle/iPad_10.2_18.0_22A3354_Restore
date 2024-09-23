@implementation MNRouteProximitySensor

- (MNRouteProximitySensor)init
{
  MNRouteProximitySensor *result;

  result = (MNRouteProximitySensor *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (MNRouteProximitySensor)initWithRoute:(id)a3
{
  id v4;
  MNRouteProximitySensor *v5;
  MNRouteProximitySensor *v6;
  uint64_t v7;
  GEORouteMatcher *routeMatcher;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MNRouteProximitySensor;
  v5 = -[MNRouteProximitySensor init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_proximity = 0;
    v5->_proximityThreshold = 20.0;
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D274E8]), "initWithRoute:auditToken:", v4, 0);
    routeMatcher = v6->_routeMatcher;
    v6->_routeMatcher = (GEORouteMatcher *)v7;

  }
  return v6;
}

- (void)updateForLocation:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)&self->_location, a3);
    -[MNRouteProximitySensor _updateRouteMatch](self, "_updateRouteMatch");
    -[MNRouteProximitySensor _updateProximity](self, "_updateProximity");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Location is nil"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136316162;
      v9 = "-[MNRouteProximitySensor updateForLocation:]";
      v10 = 2080;
      v11 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Misc/MNRouteProximitySensor.m";
      v12 = 1024;
      v13 = 62;
      v14 = 2080;
      v15 = "location";
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v8, 0x30u);
    }

  }
}

- (GEOComposedRoute)route
{
  return (GEOComposedRoute *)-[GEORouteMatch route](self->_routeMatch, "route");
}

- (GEOLocation)location
{
  return self->_location;
}

- (GEOLocation)closestPointOnRoute
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;

  if (self->_location && self->_routeMatch)
  {
    -[MNRouteProximitySensor route](self, "route");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOLocation coordinate](self->_location, "coordinate");
    v4 = objc_msgSend(v3, "closestPointOnRoute:");

    -[MNRouteProximitySensor route](self, "route");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pointAtRouteCoordinate:", v4);
    v7 = v6;
    v9 = v8;

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27168]), "initWithLatitude:longitude:", v7, v9);
  }
  else
  {
    v10 = 0;
  }
  return (GEOLocation *)v10;
}

- (GEOComposedRouteStep)closestStepOnRoute
{
  return (GEOComposedRouteStep *)-[GEORouteMatch step](self->_routeMatch, "step");
}

- (double)courseOnRoute
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;

  if (!self->_routeMatch)
    return -1.79769313e308;
  -[MNRouteProximitySensor route](self, "route");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLocation coordinate](self->_location, "coordinate");
  v4 = objc_msgSend(v3, "closestPointOnRoute:");

  -[MNRouteProximitySensor route](self, "route");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "courseAtRouteCoordinateIndex:", v4);
  v7 = v6;

  return v7;
}

- (double)distanceFromOrigin
{
  GEOLocation *location;
  void *v3;
  void *v4;
  GEOLocation *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  if (!self->_routeMatch)
    return -1.79769313e308;
  location = self->_location;
  -[MNRouteProximitySensor route](self, "route");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "origin");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = location;
  objc_msgSend(v4, "bestLatLng");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "coordinate");
    -[GEOLocation coordinate](v5, "coordinate");
    GEOCalculateDistance();
    v9 = v8;
  }
  else
  {
    v9 = -1.79769313e308;
  }

  return v9;
}

- (double)distanceFromRoute
{
  GEORouteMatch *routeMatch;
  double result;

  routeMatch = self->_routeMatch;
  if (!routeMatch)
    return -1.79769313e308;
  -[GEORouteMatch distanceFromRoute](routeMatch, "distanceFromRoute");
  return result;
}

- (double)distanceFromDestination
{
  GEOLocation *location;
  void *v3;
  void *v4;
  GEOLocation *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  if (!self->_routeMatch)
    return -1.79769313e308;
  location = self->_location;
  -[MNRouteProximitySensor route](self, "route");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "destination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = location;
  objc_msgSend(v4, "bestLatLng");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "coordinate");
    -[GEOLocation coordinate](v5, "coordinate");
    GEOCalculateDistance();
    v9 = v8;
  }
  else
  {
    v9 = -1.79769313e308;
  }

  return v9;
}

- (double)proximityThreshold
{
  return self->_proximityThreshold;
}

- (void)setProximityThreshold:(double)a3
{
  self->_proximityThreshold = a3;
  -[MNRouteProximitySensor _updateProximity](self, "_updateProximity");
}

- (void)_updateProximity
{
  unint64_t location;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  location = (unint64_t)self->_location;
  if (location)
  {
    location = (unint64_t)self->_routeMatch;
    if (location)
    {
      -[MNRouteProximitySensor distanceFromOrigin](self, "distanceFromOrigin");
      if (v4 >= 0.0
        && (-[MNRouteProximitySensor distanceFromOrigin](self, "distanceFromOrigin"), v5 <= self->_proximityThreshold))
      {
        location = 2;
      }
      else
      {
        -[MNRouteProximitySensor distanceFromDestination](self, "distanceFromDestination");
        if (v6 >= 0.0
          && (-[MNRouteProximitySensor distanceFromDestination](self, "distanceFromDestination"),
              v7 <= self->_proximityThreshold))
        {
          location = 4;
        }
        else
        {
          -[MNRouteProximitySensor distanceFromRoute](self, "distanceFromRoute");
          if (v8 >= 0.0
            && (-[MNRouteProximitySensor distanceFromRoute](self, "distanceFromRoute"), v9 <= self->_proximityThreshold))
          {
            location = 3;
          }
          else
          {
            location = 1;
          }
        }
      }
    }
  }
  self->_proximity = location;
}

- (void)_updateRouteMatch
{
  GEORouteMatch *v3;
  GEORouteMatch *routeMatch;
  id v5;

  v5 = (id)-[GEOLocation copy](self->_location, "copy");
  objc_msgSend(v5, "setCourse:", -1.0);
  -[GEORouteMatcher matchToRouteWithLocation:](self->_routeMatcher, "matchToRouteWithLocation:", v5);
  v3 = (GEORouteMatch *)objc_claimAutoreleasedReturnValue();
  routeMatch = self->_routeMatch;
  self->_routeMatch = v3;

}

- (unint64_t)proximity
{
  return self->_proximity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeMatcher, 0);
  objc_storeStrong((id *)&self->_routeMatch, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end
