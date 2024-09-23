@implementation GEONavigationWalkingMapMatcher

- (id)matchLocation:(id)a3 transportType:(int)a4
{
  id v6;
  void *v7;
  GEOWalkingRouteMatcher *v8;
  void *v9;
  void *v10;
  GEOWalkingRouteMatcher *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  GEOWalkingRouteMatcher *v18;
  void *v19;
  void *v20;
  GEOWalkingRouteMatcher *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  int v26;
  BOOL v27;
  void *v28;
  uint64_t v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  char v36;
  void *v37;
  void *v38;
  BOOL v39;
  double v40;
  double v41;
  double v42;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  _BOOL4 v62;
  double v63;
  double v64;
  double v65;
  long double v66;
  double v67;
  unint64_t numProgressionsOffRoute;
  void *v69;

  v6 = a3;
  -[GEONavigationMapMatcher routeMatcher](self, "routeMatcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = [GEOWalkingRouteMatcher alloc];
    -[GEONavigationMapMatcher route](self, "route");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEONavigationMapMatcher auditToken](self, "auditToken");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[GEOWalkingRouteMatcher initWithRoute:auditToken:](v8, "initWithRoute:auditToken:", v9, v10);
    -[GEONavigationMapMatcher setRouteMatcher:](self, "setRouteMatcher:", v11);

  }
  -[GEONavigationMapMatcher route](self, "route");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "transportType");

  if (v13 == 1 || v13 == -[GEONavigationWalkingMapMatcher transportType](self, "transportType"))
  {
    -[GEONavigationMapMatcher previousMatchResult](self, "previousMatchResult");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "routeMatch");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[GEONavigationMapMatcher route](self, "route");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[GEONavigationMapMatcher routeMatcher](self, "routeMatcher");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "matchToRouteWithLocation:previousRouteMatch:", v6, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        v18 = [GEOWalkingRouteMatcher alloc];
        -[GEONavigationMapMatcher route](self, "route");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEONavigationMapMatcher auditToken](self, "auditToken");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[GEOWalkingRouteMatcher initWithRoute:auditToken:](v18, "initWithRoute:auditToken:", v19, v20);

        -[GEORouteMatcher maxMatchDistanceFromPreviousRouteMatch](v21, "maxMatchDistanceFromPreviousRouteMatch");
        v23 = v22;
        -[GEONavigationMapMatcher route](self, "route");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "distance");
        -[GEORouteMatcher setMaxMatchDistanceFromPreviousRouteMatch:](v21, "setMaxMatchDistanceFromPreviousRouteMatch:");

        -[GEORouteMatcher matchToRouteWithLocation:](v21, "matchToRouteWithLocation:", v6);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEORouteMatcher setMaxMatchDistanceFromPreviousRouteMatch:](v21, "setMaxMatchDistanceFromPreviousRouteMatch:", v23);
        if (!v16)
        {
          -[GEORouteMatcher matchToClosestPointOnRouteWithLocation:](v21, "matchToClosestPointOnRouteWithLocation:", v6);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }

      }
    }
    -[GEONavigationMapMatcher route](self, "route");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "transportType");
    v27 = 1;
    if (a4 != 4 && v26 != 1)
      v27 = -[GEONavigationWalkingMapMatcher transportType](self, "transportType") == a4;

    if (v15 && objc_msgSend(v15, "isGoodMatch"))
    {
      -[GEONavigationMapMatcher previousMatchResult](self, "previousMatchResult");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "type");

      if (!v27 && (v29 || (objc_msgSend(v16, "isGoodMatch") & 1) == 0))
        goto LABEL_18;
    }
    else if (!v27)
    {
LABEL_18:
      +[GEONavigationMatchResult matchResultWithRawLocation:](GEONavigationMatchResult, "matchResultWithRawLocation:", v6);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setRouteMatch:", v16);
      -[GEONavigationMapMatcher setPreviousMatchResult:](self, "setPreviousMatchResult:", v30);
LABEL_56:

      goto LABEL_57;
    }
    if (v16)
      v31 = objc_msgSend(v16, "isGoodMatch");
    else
      v31 = 0;
    -[GEONavigationMapMatcher route](self, "route");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "source");

    if ((v35 & 0xFFFFFFFFFFFFFFFELL) == 2)
      v36 = v31;
    else
      v36 = 0;
    if ((v36 & 1) != 0)
    {
      v37 = 0;
      goto LABEL_52;
    }
    -[GEONavigationMapMatcher roadMatcher](self, "roadMatcher");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "matchLocation:forTransportType:", v6, -[GEONavigationWalkingMapMatcher transportType](self, "transportType"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
      v39 = v27;
    else
      v39 = 0;
    if (v37)
    {
      objc_msgSend(v37, "distanceFromRoad");
      v41 = v40;
      objc_msgSend(v6, "horizontalAccuracy");
      if (v41 <= v42 + 20.0 && v39)
      {
        objc_msgSend(v16, "locationCoordinate3D");
        v45 = v44;
        v47 = v46;
        objc_msgSend(v37, "coordinateOnRoad");
        if (GEOCalculateDistanceRadius(v45, v47, v48, v49, 6367000.0) > 10.0)
        {
          objc_msgSend(v37, "distanceFromJunction");
          v51 = v50;
          objc_msgSend(v37, "junctionRadius");
          v53 = v52;
          objc_msgSend(v6, "horizontalAccuracy");
          v55 = v54;
          objc_msgSend(v6, "horizontalAccuracy");
          if (v56 >= 0.0 && v51 - v53 - v55 < 12.0)
          {
            self->_numProgressionsOffRoute = 0;
            if ((v31 & 1) == 0)
            {
LABEL_51:
              +[GEONavigationMatchResult matchResultWithRoadMatch:location:](GEONavigationMatchResult, "matchResultWithRoadMatch:location:", v37, v6);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_55:
              v30 = v69;
              objc_msgSend(v69, "setRouteMatch:", v16);
              -[GEONavigationMapMatcher setPreviousMatchResult:](self, "setPreviousMatchResult:", v30);

              goto LABEL_56;
            }
LABEL_53:
            +[GEONavigationMatchResult matchResultWithRouteMatch:location:](GEONavigationMatchResult, "matchResultWithRouteMatch:location:", v16, v6);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_55;
          }
          objc_msgSend(v16, "distanceFromRoute");
          v58 = v57;
          objc_msgSend(v16, "modifiedHorizontalAccuracy");
          v60 = v59;
          objc_msgSend(v6, "course");
          if (v61 >= 0.0)
          {
            objc_msgSend(v6, "course");
            v64 = v63;
            objc_msgSend(v37, "courseOnRoad");
            v66 = fmod(v65 - v64 + 180.0, 360.0);
            v67 = fmod(v66 + 360.0, 360.0) + -180.0;
            if (v67 >= 180.0 - v67)
              v67 = 180.0 - v67;
            v62 = v67 <= 35.0;
          }
          else
          {
            v62 = 1;
          }
          if (v58 - v60 + -10.0 > v41 && v62)
          {
            numProgressionsOffRoute = self->_numProgressionsOffRoute;
            if (numProgressionsOffRoute > 2)
              goto LABEL_51;
            self->_numProgressionsOffRoute = numProgressionsOffRoute + 1;
            if (!v31)
              goto LABEL_51;
            goto LABEL_53;
          }
        }
      }
    }
LABEL_52:
    self->_numProgressionsOffRoute = 0;
    if ((v31 & 1) == 0)
    {
      +[GEONavigationMatchResult matchResultWithRawLocation:](GEONavigationMatchResult, "matchResultWithRawLocation:", v6);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_55;
    }
    goto LABEL_53;
  }
  +[GEONavigationMatchResult matchResultWithRawLocation:](GEONavigationMatchResult, "matchResultWithRawLocation:", v6);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEONavigationMapMatcher previousMatchResult](self, "previousMatchResult");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "routeMatch");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setRouteMatch:", v33);

  -[GEONavigationMapMatcher setPreviousMatchResult:](self, "setPreviousMatchResult:", v30);
LABEL_57:

  return v30;
}

- (id)updateForReroute:(id)a3 location:(id)a4 routeStartsFromLocation:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;
  void *v11;
  objc_super v13;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[GEONavigationMapMatcher route](self, "route");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 != v8)
    self->_numProgressionsOffRoute = 0;
  v13.receiver = self;
  v13.super_class = (Class)GEONavigationWalkingMapMatcher;
  -[GEONavigationMapMatcher updateForReroute:location:routeStartsFromLocation:](&v13, sel_updateForReroute_location_routeStartsFromLocation_, v8, v9, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (int)transportType
{
  return 2;
}

- (id)_routeMatcherForRoute:(id)a3
{
  id v4;
  GEOWalkingRouteMatcher *v5;
  void *v6;
  GEOWalkingRouteMatcher *v7;

  v4 = a3;
  v5 = [GEOWalkingRouteMatcher alloc];
  -[GEONavigationMapMatcher auditToken](self, "auditToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[GEOWalkingRouteMatcher initWithRoute:auditToken:](v5, "initWithRoute:auditToken:", v4, v6);

  return v7;
}

@end
