@implementation GEOComposedRouteStep

- (BOOL)shouldPreloadWithHighPriority
{
  if (-[GEOComposedRouteStep transportType](self, "transportType") == 1
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    return -[GEOComposedRouteStep canPreloadTilesForThisStep](self, "canPreloadTilesForThisStep");
  }
  else
  {
    return 0;
  }
}

- (int)maneuver
{
  void *v2;
  int v3;

  -[GEOComposedRouteStep transitStep](self, "transitStep");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "maneuverType");

  return v3;
}

- (BOOL)shouldCreateEnterBoardGroup
{
  if (-[GEOComposedRouteStep maneuver](self, "maneuver") == 3)
    return !-[GEOComposedRouteStep _belongsToTransferGroup](self, "_belongsToTransferGroup");
  else
    return 0;
}

- (BOOL)shouldCreateAlightExitGroup
{
  if (-[GEOComposedRouteStep maneuver](self, "maneuver") == 5)
    return !-[GEOComposedRouteStep _belongsToTransferGroup](self, "_belongsToTransferGroup");
  else
    return 0;
}

- (BOOL)shouldCreateTransferGroup
{
  return -[GEOComposedRouteStep maneuver](self, "maneuver") == 5
      && -[GEOComposedRouteStep _belongsToTransferGroup](self, "_belongsToTransferGroup");
}

- (BOOL)shouldCreateTripProgressionGroup
{
  if (-[GEOComposedRouteStep maneuver](self, "maneuver") == 5)
    return !-[GEOComposedRouteStep shouldCreateFerryProgressionGroup](self, "shouldCreateFerryProgressionGroup");
  else
    return 0;
}

- (BOOL)shouldCreateFerryProgressionGroup
{
  GEOComposedRouteStep *v3;
  int v4;

  if (-[GEOComposedRouteStep routeSegmentType](self, "routeSegmentType") == 6)
  {
    v3 = self;
    if (-[GEOComposedRouteStep maneuver](v3, "maneuver") == 5
      && (-[GEOComposedRouteStep isRail](v3, "isRail") & 1) == 0)
    {
      v4 = -[GEOComposedRouteStep isBus](v3, "isBus") ^ 1;
    }
    else
    {
      LOBYTE(v4) = 0;
    }

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)shouldCreateArrivalGroup
{
  void *v3;
  BOOL v4;

  if (-[GEOComposedRouteStep maneuver](self, "maneuver") != 10)
    return 0;
  -[GEOComposedRouteStep getPreviousStep](self, "getPreviousStep");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "routeSegmentType") == 2;

  return v4;
}

- (BOOL)_belongsToTransferGroup
{
  GEOComposedRouteStep *v3;
  void *v4;
  void *v5;
  BOOL v6;
  BOOL v7;
  void *v8;
  int v9;

  if (-[GEOComposedRouteStep routeSegmentType](self, "routeSegmentType") == 6)
  {
    v3 = self;
    if (-[GEOComposedRouteStep maneuver](v3, "maneuver") == 5)
    {
      -[GEOComposedRouteStep nextTransitStep](v3, "nextTransitStep");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "maneuver") != 3)
      {
        if (objc_msgSend(v4, "maneuver") == 6)
        {
          objc_msgSend(v4, "nextTransitStep");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(v5, "maneuver") == 3;
LABEL_16:
          v7 = v6;

          goto LABEL_21;
        }
LABEL_20:
        v7 = 0;
        goto LABEL_21;
      }
    }
    else
    {
      if (-[GEOComposedRouteStep maneuver](v3, "maneuver") != 3)
      {
        if (-[GEOComposedRouteStep maneuver](v3, "maneuver") != 6
          || (-[GEOComposedRouteStep previousTransitStep](v3, "previousTransitStep"),
              v8 = (void *)objc_claimAutoreleasedReturnValue(),
              v9 = objc_msgSend(v8, "maneuver"),
              v8,
              v9 != 5))
        {
          v7 = 0;
LABEL_22:

          return v7;
        }
        -[GEOComposedRouteStep nextTransitStep](v3, "nextTransitStep");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v4, "maneuver") == 3;
LABEL_21:

        goto LABEL_22;
      }
      -[GEOComposedRouteStep previousTransitStep](v3, "previousTransitStep");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "maneuver") != 5)
      {
        if (objc_msgSend(v4, "maneuver") == 6)
        {
          objc_msgSend(v4, "previousTransitStep");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(v5, "maneuver") == 5;
          goto LABEL_16;
        }
        goto LABEL_20;
      }
    }
    v7 = 1;
    goto LABEL_21;
  }
  return 0;
}

- (GEOComposedRouteStep)initWithComposedRoute:(id)a3 geoRouteLeg:(id)a4 geoStep:(id)a5 routeSegmentType:(int64_t)a6 stepIndex:(unint64_t)a7 startRouteCoordinate:(id)a8 endRouteCoordinate:(id)a9 maneuverStartRouteCoordinate:(id)a10
{
  id v16;
  id v17;
  id v18;
  GEOComposedRouteStep *v19;
  GEOComposedRouteStep *v20;
  double v21;
  float v22;
  int v23;
  GEOJunction *v24;
  GEOJunction *junction;
  GEOComposedRouteStep *v26;
  objc_super v28;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v28.receiver = self;
  v28.super_class = (Class)GEOComposedRouteStep;
  v19 = -[GEOComposedRouteStep init](&v28, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeWeak((id *)&v19->_composedRoute, v16);
    objc_storeStrong((id *)&v20->_geoStep, a5);
    v20->_routeSegmentType = a6;
    v20->_stepIndex = a7;
    if (objc_msgSend(v18, "hasDistanceCm"))
    {
      v21 = (double)objc_msgSend(v18, "distanceCm") * 0.01;
    }
    else if (objc_msgSend(v18, "hasDistanceMeters"))
    {
      objc_msgSend(v18, "distanceMeters");
      v21 = v22;
    }
    else
    {
      v21 = (double)objc_msgSend(v18, "distance");
    }
    v20->_distance = v21;
    v20->_startRouteCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)a8;
    v20->_endRouteCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)a9;
    v20->_maneuverStartRouteCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)a10;
    if (objc_msgSend(v18, "hasOverrideDrivingSide"))
      v23 = objc_msgSend(v18, "overrideDrivingSide");
    else
      v23 = objc_msgSend(v17, "drivingSide");
    v20->_drivingSide = v23;
    if (objc_msgSend(v18, "hasJunctionType"))
    {
      v24 = -[GEOJunction initWithStep:]([GEOJunction alloc], "initWithStep:", v20);
      junction = v20->_junction;
      v20->_junction = v24;

    }
    v26 = v20;
  }

  return v20;
}

- (GEOComposedRouteStep)initWithComposedRoute:(id)a3 routeSegmentType:(int64_t)a4 stepIndex:(unint64_t)a5 pointRange:(_NSRange)a6
{
  NSUInteger v6;

  v6 = a6.length - 1;
  if (!a6.length)
    v6 = 0;
  return -[GEOComposedRouteStep initWithComposedRoute:geoRouteLeg:geoStep:routeSegmentType:stepIndex:pointRange:maneuverPointRange:](self, "initWithComposedRoute:geoRouteLeg:geoStep:routeSegmentType:stepIndex:pointRange:maneuverPointRange:", a3, 0, 0, a4, a5, a6.location, a6.length, v6 + a6.location, 1);
}

- (GEOComposedRouteStep)initWithComposedRoute:(id)a3 geoRouteLeg:(id)a4 geoStep:(id)a5 routeSegmentType:(int64_t)a6 stepIndex:(unint64_t)a7 pointRange:(_NSRange)a8 maneuverPointRange:(_NSRange)a9
{
  id v14;
  id v15;
  id v16;
  GEOComposedRouteStep *v17;
  GEOComposedRouteStep *v18;
  double v19;
  float v20;
  int location;
  $604ECB7A8067A7300F159AE8ED6889F8 endRouteCoordinate;
  $604ECB7A8067A7300F159AE8ED6889F8 startRouteCoordinate;
  int v24;
  GEOJunction *v25;
  GEOJunction *junction;
  GEOComposedRouteStep *v27;
  objc_super v29;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v29.receiver = self;
  v29.super_class = (Class)GEOComposedRouteStep;
  v17 = -[GEOComposedRouteStep init](&v29, sel_init);
  v18 = v17;
  if (!v17)
    goto LABEL_21;
  objc_storeWeak((id *)&v17->_composedRoute, v14);
  objc_storeStrong((id *)&v18->_geoStep, a5);
  v18->_stepIndex = a7;
  if (objc_msgSend(v16, "hasDistanceCm"))
  {
    v19 = (double)objc_msgSend(v16, "distanceCm") * 0.01;
  }
  else if (objc_msgSend(v16, "hasDistanceMeters"))
  {
    objc_msgSend(v16, "distanceMeters");
    v19 = v20;
  }
  else
  {
    v19 = (double)objc_msgSend(v16, "distance");
  }
  v18->_distance = v19;
  v18->_routeSegmentType = a6;
  if (a8.location + a8.length)
    location = LODWORD(a8.location) + LODWORD(a8.length) - 1;
  else
    location = a8.location;
  v18->_startRouteCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)LODWORD(a8.location);
  v18->_endRouteCoordinate.index = location;
  v18->_endRouteCoordinate.offset = 0.0;
  startRouteCoordinate = v18->_startRouteCoordinate;
  endRouteCoordinate = v18->_endRouteCoordinate;
  if (endRouteCoordinate.index == startRouteCoordinate.index)
  {
    if (endRouteCoordinate.offset >= startRouteCoordinate.offset)
      goto LABEL_15;
    goto LABEL_14;
  }
  if (endRouteCoordinate.index < startRouteCoordinate.index)
LABEL_14:
    v18->_startRouteCoordinate = endRouteCoordinate;
LABEL_15:
  v18->_maneuverStartRouteCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)LODWORD(a9.location);
  if (objc_msgSend(v16, "hasOverrideDrivingSide"))
    v24 = objc_msgSend(v16, "overrideDrivingSide");
  else
    v24 = objc_msgSend(v15, "drivingSide");
  v18->_drivingSide = v24;
  if (objc_msgSend(v16, "hasJunctionType"))
  {
    v25 = -[GEOJunction initWithStep:]([GEOJunction alloc], "initWithStep:", v18);
    junction = v18->_junction;
    v18->_junction = v25;

  }
  v27 = v18;
LABEL_21:

  return v18;
}

- (GEOComposedRouteSegment)segment
{
  void *v3;
  void *v4;

  -[GEOComposedRouteStep composedRoute](self, "composedRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "segmentForStepIndex:", -[GEOComposedRouteStep stepIndex](self, "stepIndex"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOComposedRouteSegment *)v4;
}

- (int)transportType
{
  unint64_t v2;

  v2 = self->_routeSegmentType - 1;
  if (v2 > 5)
    return 4;
  else
    return dword_189CE3A78[v2];
}

- (int)maneuverType
{
  GEOStep *geoStep;

  geoStep = self->_geoStep;
  if (geoStep)
    LODWORD(geoStep) = -[GEOStep maneuverType](geoStep, "maneuverType");
  return (int)geoStep;
}

- (_NSRange)pointRange
{
  NSUInteger v2;
  NSUInteger index;
  _NSRange result;

  v2 = self->_endRouteCoordinate.index - self->_startRouteCoordinate.index + 1;
  index = self->_startRouteCoordinate.index;
  result.length = v2;
  result.location = index;
  return result;
}

- (unsigned)startPointIndex
{
  return self->_startRouteCoordinate.index;
}

- (unsigned)endPointIndex
{
  return self->_endRouteCoordinate.index;
}

- (unsigned)pointCount
{
  unsigned int v2;

  -[GEOComposedRouteStep pointRange](self, "pointRange");
  return v2;
}

- (_NSRange)maneuverPointRange
{
  NSUInteger v2;
  NSUInteger index;
  _NSRange result;

  v2 = self->_endRouteCoordinate.index - self->_maneuverStartRouteCoordinate.index + 1;
  index = self->_maneuverStartRouteCoordinate.index;
  result.length = v2;
  result.location = index;
  return result;
}

- (unsigned)maneuverStartPointIndex
{
  return self->_maneuverStartRouteCoordinate.index;
}

- (NSString)maneuverRoadOrExitName
{
  NSString *maneuverRoadOrExitName;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSString *v10;
  NSString *v11;
  NSString *v12;

  maneuverRoadOrExitName = self->_maneuverRoadOrExitName;
  if (!maneuverRoadOrExitName)
  {
    -[GEOComposedRouteStep geoStep](self, "geoStep");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "exitNumber");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "length");

      if (v8)
      {
        objc_msgSend(v5, "exitNumber");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "name");
        v10 = (NSString *)objc_claimAutoreleasedReturnValue();
        v11 = self->_maneuverRoadOrExitName;
        self->_maneuverRoadOrExitName = v10;

      }
      else
      {
        -[GEOComposedRouteStep maneuverRoadName](self, "maneuverRoadName");
        v12 = (NSString *)objc_claimAutoreleasedReturnValue();
        v9 = self->_maneuverRoadOrExitName;
        self->_maneuverRoadOrExitName = v12;
      }

    }
    maneuverRoadOrExitName = self->_maneuverRoadOrExitName;
  }
  return maneuverRoadOrExitName;
}

- (NSString)maneuverRoadName
{
  GEOComposedRouteStep *v2;
  NSString *maneuverRoadName;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  NSString *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSString *v25;
  void *v27;
  GEOComposedRouteStep *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v2 = self;
  v34 = *MEMORY[0x1E0C80C00];
  maneuverRoadName = self->_maneuverRoadName;
  if (!maneuverRoadName)
  {
    -[GEOComposedRouteStep geoStep](v2, "geoStep");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (!v4)
    {
LABEL_31:

      maneuverRoadName = v2->_maneuverRoadName;
      return maneuverRoadName;
    }
    v27 = v4;
    v28 = v2;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(v4, "signposts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      v12 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v30 != v12)
            objc_enumerationMutation(v6);
          v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v14, "name");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "length");

          if (v16)
          {
            v17 = objc_msgSend(v14, "signType");
            if (v17 == 3)
            {
              if (!v10)
              {
                objc_msgSend(v14, "name");
                v10 = (void *)objc_claimAutoreleasedReturnValue();
              }
            }
            else if (v17 == 2)
            {
              if (!v9)
              {
                objc_msgSend(v14, "name");
                v9 = (void *)objc_claimAutoreleasedReturnValue();
              }
            }
            else if (v17 == 1 && v11 == 0)
            {
              objc_msgSend(v14, "name");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
            }
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
      v10 = 0;
      v11 = 0;
    }

    if (objc_msgSend(v10, "length"))
    {
      v19 = v10;
      v5 = v27;
      v2 = v28;
    }
    else
    {
      v5 = v27;
      objc_msgSend(v27, "firstNameInfo");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "name");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "length");

      v2 = v28;
      if (v23)
      {
        objc_msgSend(v27, "firstNameInfo");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "name");
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = v28->_maneuverRoadName;
        v28->_maneuverRoadName = (NSString *)v24;

        goto LABEL_30;
      }
      if (objc_msgSend(v11, "length"))
      {
        v19 = v11;
      }
      else
      {
        if (!objc_msgSend(v9, "length"))
        {
          v20 = v28->_maneuverRoadName;
          v28->_maneuverRoadName = (NSString *)&stru_1E1C241D0;
          goto LABEL_30;
        }
        v19 = v9;
      }
    }
    v20 = v2->_maneuverRoadName;
    v2->_maneuverRoadName = v19;
LABEL_30:

    goto LABEL_31;
  }
  return maneuverRoadName;
}

- (unint64_t)pathIndex
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[GEOComposedRouteStep geoStep](self, "geoStep");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[GEOComposedRouteStep geoStep](self, "geoStep");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "zilchPathIndex");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isStartOrResumeStep
{
  void *v3;
  void *v4;
  int v5;

  -[GEOComposedRouteStep geoStep](self, "geoStep");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[GEOComposedRouteStep geoStep](self, "geoStep");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "maneuverType");

  return v5 == 17 || v5 == 85;
}

- (BOOL)isUncertainArrival
{
  return 0;
}

- (BOOL)isArrivalStep
{
  void *v3;
  void *v4;
  unsigned int v5;

  -[GEOComposedRouteStep geoStep](self, "geoStep");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[GEOComposedRouteStep geoStep](self, "geoStep");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "maneuverType");

  if (v5 <= 0x22)
    return (0x600040000uLL >> v5) & 1;
  else
    return 0;
}

- (BOOL)isChargingStop
{
  void *v3;
  void *v4;
  int v5;

  -[GEOComposedRouteStep geoStep](self, "geoStep");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[GEOComposedRouteStep geoStep](self, "geoStep");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "maneuverType");

  return (v5 - 82) < 3;
}

- ($1AB5FA073B851C12C2339EC22442E995)startGeoCoordinate
{
  id WeakRetained;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  $1AB5FA073B851C12C2339EC22442E995 result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_composedRoute);
  objc_msgSend(WeakRetained, "pointAtRouteCoordinate:", -[GEOComposedRouteStep startRouteCoordinate](self, "startRouteCoordinate"));
  v5 = v4;
  v7 = v6;
  v9 = v8;

  v10 = v5;
  v11 = v7;
  v12 = v9;
  result.var2 = v12;
  result.var1 = v11;
  result.var0 = v10;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)endGeoCoordinate
{
  id WeakRetained;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  $1AB5FA073B851C12C2339EC22442E995 result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_composedRoute);
  objc_msgSend(WeakRetained, "pointAtRouteCoordinate:", -[GEOComposedRouteStep endRouteCoordinate](self, "endRouteCoordinate"));
  v5 = v4;
  v7 = v6;
  v9 = v8;

  v10 = v5;
  v11 = v7;
  v12 = v9;
  result.var2 = v12;
  result.var1 = v11;
  result.var0 = v10;
  return result;
}

- (BOOL)hasDuration
{
  GEOStep *geoStep;

  geoStep = self->_geoStep;
  if (geoStep)
    LOBYTE(geoStep) = -[GEOStep hasExpectedTime](geoStep, "hasExpectedTime");
  return (char)geoStep;
}

- (unsigned)duration
{
  return -[GEOStep expectedTime](self->_geoStep, "expectedTime");
}

- (unsigned)stepID
{
  return -[GEOStep stepID](self->_geoStep, "stepID");
}

- (GEOComposedRouteStep)getPreviousStep
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  -[GEOComposedRouteStep composedRoute](self, "composedRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "steps");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 && -[GEOComposedRouteStep stepIndex](self, "stepIndex"))
  {
    -[GEOComposedRouteStep composedRoute](self, "composedRoute");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "steps");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", -[GEOComposedRouteStep stepIndex](self, "stepIndex") - 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return (GEOComposedRouteStep *)v8;
}

- (GEOComposedRouteStep)getNextStep
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  -[GEOComposedRouteStep composedRoute](self, "composedRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "steps");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5
    && (v6 = -[GEOComposedRouteStep stepIndex](self, "stepIndex") + 1,
        -[GEOComposedRouteStep composedRoute](self, "composedRoute"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "stepsCount"),
        v7,
        v6 < v8))
  {
    -[GEOComposedRouteStep composedRoute](self, "composedRoute");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "steps");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndex:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  return (GEOComposedRouteStep *)v11;
}

- (GEOPBTransitStop)startingStop
{
  return 0;
}

- (GEOPBTransitStop)endingStop
{
  return 0;
}

- (unsigned)startTime
{
  return 0;
}

- (GEOPBTransitStop)previousStop
{
  void *v2;
  void *v3;

  -[GEOComposedRouteStep getPreviousStep](self, "getPreviousStep");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "previousStop");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOPBTransitStop *)v3;
}

- (GEOPBTransitStop)nextStop
{
  void *v2;
  void *v3;

  -[GEOComposedRouteStep getNextStep](self, "getNextStep");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nextStop");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOPBTransitStop *)v3;
}

- (GEOComposedTransitTripRouteStep)nextBoardingStep
{
  void *v2;
  void *v3;

  -[GEOComposedRouteStep getNextStep](self, "getNextStep");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nextBoardingStep");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOComposedTransitTripRouteStep *)v3;
}

- (GEOComposedTransitTripRouteStep)previousBoardingStep
{
  void *v2;
  void *v3;

  -[GEOComposedRouteStep getPreviousStep](self, "getPreviousStep");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "previousBoardingStep");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOComposedTransitTripRouteStep *)v3;
}

- (GEOComposedTransitTripRouteStep)nextAlightingStep
{
  void *v2;
  void *v3;

  -[GEOComposedRouteStep getNextStep](self, "getNextStep");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nextAlightingStep");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOComposedTransitTripRouteStep *)v3;
}

- (GEOComposedTransitTripRouteStep)previousAlightingStep
{
  void *v2;
  void *v3;

  -[GEOComposedRouteStep getPreviousStep](self, "getPreviousStep");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "previousAlightingStep");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOComposedTransitTripRouteStep *)v3;
}

- (GEOComposedTransitTripRouteStep)closestLogicalBoardOrAlightStep
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  int64_t v19;
  id v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOComposedRouteStep nextBoardingStep](self, "nextBoardingStep");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "addObject:", v4);
  -[GEOComposedRouteStep previousBoardingStep](self, "previousBoardingStep");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v3, "addObject:", v5);
  -[GEOComposedRouteStep nextAlightingStep](self, "nextAlightingStep");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v3, "addObject:", v6);
  v25 = (void *)v4;
  -[GEOComposedRouteStep previousAlightingStep](self, "previousAlightingStep");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v3, "addObject:", v7);
  v22 = (void *)v7;
  v23 = (void *)v6;
  v24 = (void *)v5;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v3;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v28;
    v12 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v11)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v13);
      v15 = -[GEOComposedRouteStep stepIndex](self, "stepIndex");
      v16 = objc_msgSend(v14, "stepIndex");
      v17 = -[GEOComposedRouteStep stepIndex](self, "stepIndex");
      v18 = objc_msgSend(v14, "stepIndex");
      v19 = v15 >= v16 ? v17 - v18 : v18 - v17;
      if (v19 < v12)
      {
        v20 = v14;

        v12 = v19;
        v10 = v20;
        if (!v19)
          break;
      }
      if (v9 == ++v13)
      {
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        v20 = v10;
        if (v9)
          goto LABEL_11;
        break;
      }
    }
  }
  else
  {
    v20 = 0;
  }

  return (GEOComposedTransitTripRouteStep *)v20;
}

- (id)firstNameOrBranch
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[GEOComposedRouteStep geoStep](self, "geoStep");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstNameInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[GEOComposedRouteStep geoStep](self, "geoStep", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "signposts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v4)
    {
      v7 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v6);
          v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v9, "signType") == 1)
          {
            v4 = v9;
            goto LABEL_12;
          }
        }
        v4 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v4)
          continue;
        break;
      }
    }
LABEL_12:

  }
  return v4;
}

- (NSArray)advisories
{
  return 0;
}

- (NSArray)transitIncidents
{
  return 0;
}

- (GEOTransitStep)transitStep
{
  return 0;
}

- (GEOInstructionSet)instructions
{
  void *v2;
  void *v3;

  -[GEOComposedRouteStep geoStep](self, "geoStep");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "instructionSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOInstructionSet *)v3;
}

- (GEOComposedString)distanceStringForListView
{
  GEOComposedString *v3;
  void *v4;
  id *v5;
  void *v6;
  GEOComposedString *v7;

  v3 = [GEOComposedString alloc];
  -[GEOComposedRouteStep instructions](self, "instructions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "drivingWalkingListInstruction");
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEODrivingWalkingInstruction title](v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[GEOComposedString initWithGeoFormattedString:](v3, "initWithGeoFormattedString:", v6);

  return v7;
}

- (NSArray)instructionStringsForListView
{
  void *v2;
  id *v3;
  void *v4;
  void *v5;

  -[GEOComposedRouteStep instructions](self, "instructions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "drivingWalkingListInstruction");
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEODrivingWalkingInstruction normalCommands](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_geo_compactMap:", &__block_literal_global_198);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

GEOComposedString *__53__GEOComposedRouteStep_instructionStringsForListView__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  GEOComposedString *v3;

  v2 = a2;
  v3 = -[GEOComposedString initWithGeoFormattedString:]([GEOComposedString alloc], "initWithGeoFormattedString:", v2);

  return v3;
}

- (GEOComposedString)distanceStringForSignView
{
  GEOComposedString *v3;
  void *v4;
  id *v5;
  void *v6;
  GEOComposedString *v7;

  v3 = [GEOComposedString alloc];
  -[GEOComposedRouteStep instructions](self, "instructions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "drivingWalkingSignInstruction");
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEODrivingWalkingInstruction title](v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[GEOComposedString initWithGeoFormattedString:](v3, "initWithGeoFormattedString:", v6);

  return v7;
}

- (NSArray)normalInstructionStringsForSignView
{
  void *v2;
  id *v3;
  void *v4;
  void *v5;

  -[GEOComposedRouteStep instructions](self, "instructions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "drivingWalkingSignInstruction");
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEODrivingWalkingInstruction normalCommands](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_geo_compactMap:", &__block_literal_global_4_4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

GEOComposedString *__59__GEOComposedRouteStep_normalInstructionStringsForSignView__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  GEOComposedString *v3;

  v2 = a2;
  v3 = -[GEOComposedString initWithGeoFormattedString:]([GEOComposedString alloc], "initWithGeoFormattedString:", v2);

  return v3;
}

- (GEOTransitArtworkDataSource)artworkOverride
{
  void *v3;
  void *v4;
  void *v5;

  -[GEOComposedRouteStep geoStep](self, "geoStep");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasArtworkOverride"))
  {
    -[GEOComposedRouteStep geoStep](self, "geoStep");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "artworkOverride");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (GEOTransitArtworkDataSource *)v5;
}

- (NSArray)steppingArtwork
{
  return 0;
}

- (NSArray)routeDetailsPrimaryArtwork
{
  return 0;
}

- (GEOTransitArtworkDataSource)routeDetailsSecondaryArtwork
{
  return 0;
}

- (GEOComposedRouteEVStepInfo)evInfo
{
  return 0;
}

- (id)maneuverDescription
{
  __CFString *geoStep;
  uint64_t v3;
  id result;

  geoStep = (__CFString *)self->_geoStep;
  if (!geoStep)
    return geoStep;
  v3 = -[__CFString maneuverType](geoStep, "maneuverType");
  geoStep = CFSTR("NO_TURN");
  switch((int)v3)
  {
    case 0:
      return geoStep;
    case 1:
      result = CFSTR("LEFT_TURN");
      break;
    case 2:
      result = CFSTR("RIGHT_TURN");
      break;
    case 3:
      result = CFSTR("STRAIGHT_AHEAD");
      break;
    case 4:
      result = CFSTR("U_TURN");
      break;
    case 5:
      result = CFSTR("FOLLOW_ROAD");
      break;
    case 6:
      result = CFSTR("ENTER_ROUNDABOUT");
      break;
    case 7:
      result = CFSTR("EXIT_ROUNDABOUT");
      break;
    case 11:
      result = CFSTR("OFF_RAMP");
      break;
    case 12:
      result = CFSTR("ON_RAMP");
      break;
    case 16:
      result = CFSTR("ARRIVE_END_OF_NAVIGATION");
      break;
    case 17:
      result = CFSTR("START_ROUTE");
      break;
    case 18:
      result = CFSTR("ARRIVE_AT_DESTINATION");
      break;
    case 20:
      result = CFSTR("KEEP_LEFT");
      break;
    case 21:
      result = CFSTR("KEEP_RIGHT");
      break;
    case 22:
      result = CFSTR("ENTER_FERRY");
      break;
    case 23:
      result = CFSTR("EXIT_FERRY");
      break;
    case 24:
      result = CFSTR("CHANGE_FERRY");
      break;
    case 25:
      result = CFSTR("START_ROUTE_WITH_U_TURN");
      break;
    case 26:
      result = CFSTR("U_TURN_AT_ROUNDABOUT");
      break;
    case 27:
      result = CFSTR("LEFT_TURN_AT_END");
      break;
    case 28:
      result = CFSTR("RIGHT_TURN_AT_END");
      break;
    case 29:
      result = CFSTR("HIGHWAY_OFF_RAMP_LEFT");
      break;
    case 30:
      result = CFSTR("HIGHWAY_OFF_RAMP_RIGHT");
      break;
    case 33:
      result = CFSTR("ARRIVE_AT_DESTINATION_LEFT");
      break;
    case 34:
      result = CFSTR("ARRIVE_AT_DESTINATION_RIGHT");
      break;
    case 35:
      result = CFSTR("U_TURN_WHEN_POSSIBLE");
      break;
    case 39:
      result = CFSTR("ARRIVE_END_OF_DIRECTIONS");
      break;
    case 41:
      result = CFSTR("ROUNDABOUT_EXIT_1");
      break;
    case 42:
      result = CFSTR("ROUNDABOUT_EXIT_2");
      break;
    case 43:
      result = CFSTR("ROUNDABOUT_EXIT_3");
      break;
    case 44:
      result = CFSTR("ROUNDABOUT_EXIT_4");
      break;
    case 45:
      result = CFSTR("ROUNDABOUT_EXIT_5");
      break;
    case 46:
      result = CFSTR("ROUNDABOUT_EXIT_6");
      break;
    case 47:
      result = CFSTR("ROUNDABOUT_EXIT_7");
      break;
    case 48:
      result = CFSTR("ROUNDABOUT_EXIT_8");
      break;
    case 49:
      result = CFSTR("ROUNDABOUT_EXIT_9");
      break;
    case 50:
      result = CFSTR("ROUNDABOUT_EXIT_10");
      break;
    case 51:
      result = CFSTR("ROUNDABOUT_EXIT_11");
      break;
    case 52:
      result = CFSTR("ROUNDABOUT_EXIT_12");
      break;
    case 53:
      result = CFSTR("ROUNDABOUT_EXIT_13");
      break;
    case 54:
      result = CFSTR("ROUNDABOUT_EXIT_14");
      break;
    case 55:
      result = CFSTR("ROUNDABOUT_EXIT_15");
      break;
    case 56:
      result = CFSTR("ROUNDABOUT_EXIT_16");
      break;
    case 57:
      result = CFSTR("ROUNDABOUT_EXIT_17");
      break;
    case 58:
      result = CFSTR("ROUNDABOUT_EXIT_18");
      break;
    case 59:
      result = CFSTR("ROUNDABOUT_EXIT_19");
      break;
    case 60:
      result = CFSTR("SHARP_LEFT_TURN");
      break;
    case 61:
      result = CFSTR("SHARP_RIGHT_TURN");
      break;
    case 62:
      result = CFSTR("SLIGHT_LEFT_TURN");
      break;
    case 63:
      result = CFSTR("SLIGHT_RIGHT_TURN");
      break;
    case 64:
      result = CFSTR("CHANGE_HIGHWAY");
      break;
    case 65:
      result = CFSTR("CHANGE_HIGHWAY_LEFT");
      break;
    case 66:
      result = CFSTR("CHANGE_HIGHWAY_RIGHT");
      break;
    case 80:
      result = CFSTR("TOLL_STATION");
      break;
    case 81:
      result = CFSTR("ENTER_TUNNEL");
      break;
    case 82:
      result = CFSTR("WAYPOINT_STOP");
      break;
    case 83:
      result = CFSTR("WAYPOINT_STOP_LEFT");
      break;
    case 84:
      result = CFSTR("WAYPOINT_STOP_RIGHT");
      break;
    case 85:
      result = CFSTR("RESUME_ROUTE");
      break;
    case 86:
      result = CFSTR("RESUME_ROUTE_WITH_U_TURN");
      break;
    case 87:
      result = CFSTR("CUSTOM");
      break;
    case 88:
      geoStep = CFSTR("TURN_AROUND");
      return geoStep;
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v3);
      geoStep = (__CFString *)objc_claimAutoreleasedReturnValue();
      return geoStep;
  }
  return result;
}

- (id)maneuverAndInstructionDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v8;

  -[GEOComposedRouteStep maneuverDescription](self, "maneuverDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOComposedRouteStep instructionDescription](self, "instructionDescription");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3 && v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@] (%@)"), v3, v4);
  }
  else if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@]"), v3, v8);
  }
  else
  {
    if (!v4)
    {
      v6 = 0;
      goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@)"), v4, v8);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v6;
}

- (NSString)description
{
  double v2;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t stepIndex;
  uint64_t v13;
  unint64_t v14;
  const __CFString *v15;
  void *v16;

  v4 = (void *)MEMORY[0x1E0CB3940];
  GEOPolylineCoordinateAsString(*(_QWORD *)&self->_startRouteCoordinate, 1, 0, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  GEOPolylineCoordinateAsString(*(_QWORD *)&self->_endRouteCoordinate, 1, 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  GEOPolylineCoordinateAsString(*(_QWORD *)&self->_maneuverStartRouteCoordinate, 1, 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("[%@ - %@] (%@)"), v5, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CB3940];
  stepIndex = self->_stepIndex;
  v13 = -[GEOComposedRouteStep stepID](self, "stepID");
  v14 = self->_routeSegmentType - 1;
  if (v14 > 5)
    v15 = CFSTR("unknown");
  else
    v15 = off_1E1C207A8[v14];
  objc_msgSend(v11, "stringWithFormat:", CFSTR("Step %d (%u) | %@, %gm, %@"), stepIndex, v13, v15, *(_QWORD *)&self->_distance, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v16;
}

- (GEOPolylineCoordinateRange)routeCoordinateRange
{
  $604ECB7A8067A7300F159AE8ED6889F8 endRouteCoordinate;
  float v3;
  unint64_t v4;
  float v5;
  uint64_t v6;
  BOOL v7;
  unint64_t v8;
  PolylineCoordinate v9;
  PolylineCoordinate v10;
  GEOPolylineCoordinateRange result;

  endRouteCoordinate = self->_endRouteCoordinate;
  LODWORD(v3) = HIDWORD(*(_QWORD *)&self->_startRouteCoordinate);
  v4 = 0xBF80000000000000;
  v5 = floorf(v3);
  v6 = vcvtms_u32_f32(v3) + *(_QWORD *)&self->_startRouteCoordinate;
  if (v3 >= 0.0)
    v4 = (unint64_t)COERCE_UNSIGNED_INT(v3 - v5) << 32;
  else
    v6 = 0;
  v7 = endRouteCoordinate.offset < 0.0;
  v8 = (vcvtms_u32_f32(endRouteCoordinate.offset) + endRouteCoordinate.index) | ((unint64_t)COERCE_UNSIGNED_INT(endRouteCoordinate.offset - floorf(endRouteCoordinate.offset)) << 32);
  if (v7)
    v9 = (PolylineCoordinate)0xBF80000000000000;
  else
    v9 = (PolylineCoordinate)v8;
  v10 = (PolylineCoordinate)(v4 | v6);
  result.end = v9;
  result.start = v10;
  return result;
}

- (double)travelTime
{
  return (double)-[GEOComposedRouteStep duration](self, "duration");
}

- (id)timeCheckpoints
{
  return -[GEOStep timeCheckpoints](self->_geoStep, "timeCheckpoints");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedRouteStep)initWithCoder:(id)a3
{
  id v4;
  GEOComposedRouteStep *v5;
  uint64_t v6;
  GEOStep *geoStep;
  uint64_t v8;
  GEOJunction *junction;
  double v10;
  id v11;
  const void *v12;
  size_t v13;
  id v14;
  const void *v15;
  size_t v16;
  id v17;
  const void *v18;
  size_t v19;
  uint64_t v20;
  NSString *maneuverRoadOrExitName;
  uint64_t v22;
  NSString *maneuverRoadName;
  GEOComposedRouteStep *v24;
  unint64_t v26;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)GEOComposedRouteStep;
  v5 = -[GEOComposedRouteStep init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_geoStep"));
    v6 = objc_claimAutoreleasedReturnValue();
    geoStep = v5->_geoStep;
    v5->_geoStep = (GEOStep *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_junction"));
    v8 = objc_claimAutoreleasedReturnValue();
    junction = v5->_junction;
    v5->_junction = (GEOJunction *)v8;

    v5->_drivingSide = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_drivingSide"));
    v5->_stepIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_stepIndex"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_distance"));
    v5->_distance = v10;
    v26 = 0;
    v11 = objc_retainAutorelease(v4);
    v12 = (const void *)objc_msgSend(v11, "decodeBytesForKey:returnedLength:", CFSTR("_startRouteCoordinate"), &v26);
    if (v26 && v12)
    {
      if (v26 >= 8)
        v13 = 8;
      else
        v13 = v26;
      memcpy(&v5->_startRouteCoordinate, v12, v13);
    }
    v26 = 0;
    v14 = objc_retainAutorelease(v11);
    v15 = (const void *)objc_msgSend(v14, "decodeBytesForKey:returnedLength:", CFSTR("_endRouteCoordinate"), &v26);
    if (v26 && v15)
    {
      if (v26 >= 8)
        v16 = 8;
      else
        v16 = v26;
      memcpy(&v5->_endRouteCoordinate, v15, v16);
    }
    v26 = 0;
    v17 = objc_retainAutorelease(v14);
    v18 = (const void *)objc_msgSend(v17, "decodeBytesForKey:returnedLength:", CFSTR("_maneuverStartRouteCoordinate"), &v26);
    if (v26 && v18)
    {
      if (v26 >= 8)
        v19 = 8;
      else
        v19 = v26;
      memcpy(&v5->_maneuverStartRouteCoordinate, v18, v19);
    }
    objc_msgSend(v17, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_maneuverRoadOrExitName"));
    v20 = objc_claimAutoreleasedReturnValue();
    maneuverRoadOrExitName = v5->_maneuverRoadOrExitName;
    v5->_maneuverRoadOrExitName = (NSString *)v20;

    objc_msgSend(v17, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_maneuverRoadName"));
    v22 = objc_claimAutoreleasedReturnValue();
    maneuverRoadName = v5->_maneuverRoadName;
    v5->_maneuverRoadName = (NSString *)v22;

    v5->_routeSegmentType = objc_msgSend(v17, "decodeIntegerForKey:", CFSTR("_routeSegmentType"));
    v24 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  GEOStep *geoStep;
  id v5;

  geoStep = self->_geoStep;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", geoStep, CFSTR("_geoStep"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_junction, CFSTR("_junction"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_drivingSide, CFSTR("_drivingSide"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_stepIndex, CFSTR("_stepIndex"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_distance"), self->_distance);
  objc_msgSend(v5, "encodeBytes:length:forKey:", &self->_startRouteCoordinate, 8, CFSTR("_startRouteCoordinate"));
  objc_msgSend(v5, "encodeBytes:length:forKey:", &self->_endRouteCoordinate, 8, CFSTR("_endRouteCoordinate"));
  objc_msgSend(v5, "encodeBytes:length:forKey:", &self->_maneuverStartRouteCoordinate, 8, CFSTR("_maneuverStartRouteCoordinate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_maneuverRoadOrExitName, CFSTR("_maneuverRoadOrExitName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_maneuverRoadName, CFSTR("_maneuverRoadName"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_routeSegmentType, CFSTR("_routeSegmentType"));

}

- (GEOComposedRoute)composedRoute
{
  return (GEOComposedRoute *)objc_loadWeakRetained((id *)&self->_composedRoute);
}

- (void)setComposedRoute:(id)a3
{
  objc_storeWeak((id *)&self->_composedRoute, a3);
}

- (GEOStep)geoStep
{
  return self->_geoStep;
}

- (GEOJunction)junction
{
  return self->_junction;
}

- (int)drivingSide
{
  return self->_drivingSide;
}

- (unint64_t)stepIndex
{
  return self->_stepIndex;
}

- (double)distance
{
  return self->_distance;
}

- ($212C09783140BCCD23384160D545CE0D)startRouteCoordinate
{
  return ($212C09783140BCCD23384160D545CE0D)self->_startRouteCoordinate;
}

- ($212C09783140BCCD23384160D545CE0D)endRouteCoordinate
{
  return ($212C09783140BCCD23384160D545CE0D)self->_endRouteCoordinate;
}

- ($212C09783140BCCD23384160D545CE0D)maneuverStartRouteCoordinate
{
  return ($212C09783140BCCD23384160D545CE0D)self->_maneuverStartRouteCoordinate;
}

- (int64_t)routeSegmentType
{
  return self->_routeSegmentType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maneuverRoadName, 0);
  objc_storeStrong((id *)&self->_maneuverRoadOrExitName, 0);
  objc_storeStrong((id *)&self->_junction, 0);
  objc_storeStrong((id *)&self->_geoStep, 0);
  objc_destroyWeak((id *)&self->_composedRoute);
}

@end
