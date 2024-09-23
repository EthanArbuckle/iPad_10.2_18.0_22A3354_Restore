@implementation GEORouteBuilderBase

- (id)buildRoute
{
  NSObject *v3;
  GEOComposedRoute *v4;
  GEOComposedRoute *route;
  GEOComposedRoute *v6;
  GEOComposedRoute *v7;
  NSObject *v8;
  unsigned int v9;
  int v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  const char *v17;
  void *v19;
  void *v20;
  uint8_t buf[4];
  _BYTE v22[10];
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  GEOGetGEORouteBuilderLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v22 = objc_opt_class();
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEFAULT, "Building route using %@.", buf, 0xCu);
  }

  v4 = -[GEORouteBuilderBase _newRouteInstance](self, "_newRouteInstance");
  route = self->_route;
  self->_route = v4;

  -[GEOComposedRoute setTransportType:](self->_route, "setTransportType:", -[GEORouteBuilderBase _transportType](self, "_transportType"));
  if (!-[GEORouteBuilderBase _buildCoordinates](self, "_buildCoordinates"))
  {
    GEOGetGEORouteBuilderLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    *(_WORD *)buf = 0;
    v17 = "Error building coordinates.";
LABEL_20:
    _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_ERROR, v17, buf, 2u);
    goto LABEL_21;
  }
  if (!-[GEORouteBuilderBase _buildComponents](self, "_buildComponents"))
  {
    GEOGetGEORouteBuilderLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    *(_WORD *)buf = 0;
    v17 = "Error building components.";
    goto LABEL_20;
  }
  if (!-[GEORouteBuilderBase _buildSections](self, "_buildSections"))
  {
    GEOGetGEORouteBuilderLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    *(_WORD *)buf = 0;
    v17 = "Error building sections.";
    goto LABEL_20;
  }
  if (!-[GEORouteBuilderBase _buildBoundingMapRegion](self, "_buildBoundingMapRegion"))
  {
    GEOGetGEORouteBuilderLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    *(_WORD *)buf = 0;
    v17 = "Error building bounding map region.";
    goto LABEL_20;
  }
  if (!-[GEORouteBuilderBase _setMiscInfo](self, "_setMiscInfo"))
  {
    GEOGetGEORouteBuilderLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v17 = "Error setting misc info.";
      goto LABEL_20;
    }
LABEL_21:
    v6 = 0;
    goto LABEL_22;
  }
  v6 = self->_route;
  v7 = self->_route;
  self->_route = 0;

  GEOGetGEORouteBuilderLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = -[GEOComposedRoute pointCount](v6, "pointCount");
    -[GEOComposedRoute legs](v6, "legs");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v20, "count");
    -[GEOComposedRoute segments](v6, "segments");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v19, "count");
    -[GEOComposedRoute steps](v6, "steps");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");
    -[GEOComposedRoute anchorPoints](v6, "anchorPoints");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");
    -[GEOComposedRoute uniqueRouteID](v6, "uniqueRouteID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67110402;
    *(_DWORD *)v22 = v9;
    *(_WORD *)&v22[4] = 1024;
    *(_DWORD *)&v22[6] = v10;
    v23 = 1024;
    v24 = v11;
    v25 = 1024;
    v26 = v13;
    v27 = 1024;
    v28 = v15;
    v29 = 2112;
    v30 = v16;
    _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_DEFAULT, "Successfully built route. Coordinates: %d | Legs: %d | Segments: %d | Steps: %d | Anchors: %d | ID: %@", buf, 0x2Au);

  }
LABEL_22:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_route, 0);
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (int)_transportType
{
  uint8_t v3[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: Must be implemented by subclasses.", v3, 2u);
  }
  return 4;
}

- (id)_newRouteInstance
{
  return (id)objc_opt_new();
}

- (BOOL)_buildCoordinates
{
  return 1;
}

- (BOOL)_buildComponents
{
  return 1;
}

- (BOOL)_buildSections
{
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  float v8;
  unint64_t v9;
  uint64_t v10;
  float v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  unsigned int v17;
  float v18;
  uint64_t v19;
  int v20;
  int v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  uint64_t v26;
  GEOComposedRoute *route;
  GEOComposedRouteSection *v28;
  uint64_t v29;
  GEOComposedRouteSection *v30;
  uint64_t v31;
  id v32;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  unsigned int v38;
  void *v39;
  GEORouteBuilderBase *v40;
  void *v41;
  void *v42;
  _OWORD v43[3];
  __int128 v44;
  __int128 v45;
  __int128 v46;

  -[GEOComposedRoute coordinates](self->_route, "coordinates");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v42, "coordinateCount");
  if (v3)
  {
    -[GEOComposedRoute steps](self->_route, "steps");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOComposedRoute segments](self->_route, "segments");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v4;
    v5 = objc_msgSend(v42, "coordinateCount");
    objc_msgSend(v4, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "firstObject");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = self;
    v35 = v3;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    v38 = v5 - 1;
    v8 = 0.0;
    while (1)
    {
      if (v7 >= v38 && ((_DWORD)v7 != v38 || v8 >= 0.0))
      {
        -[GEOComposedRoute setSections:](v40->_route, "setSections:", v39);

        v3 = v35;
        goto LABEL_35;
      }
      v9 = v7 | ((unint64_t)LODWORD(v8) << 32);
      v10 = objc_msgSend(v42, "routeCoordinateForDistance:afterRouteCoordinate:", v9, 16000.0);
      v11 = *((float *)&v10 + 1);
      v12 = v41;
      v13 = v12;
      if (!v12)
        break;
      v14 = objc_msgSend(v12, "endRouteCoordinate");
      if (v14 < v10)
        goto LABEL_10;
      if ((_DWORD)v14 == (_DWORD)v10)
      {
        v15 = v13;
        if (*((float *)&v14 + 1) < *((float *)&v10 + 1))
        {
LABEL_10:
          v10 = objc_msgSend(v13, "endRouteCoordinate");
          objc_msgSend(v13, "nextSegment");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = *((float *)&v10 + 1);

          if (v6)
            goto LABEL_14;
          goto LABEL_23;
        }
        goto LABEL_13;
      }
      v15 = v13;
      if (v6)
      {
        do
        {
LABEL_14:
          v16 = objc_msgSend(v6, "routeCoordinateRange");
          if ((_DWORD)v7 == v17)
          {
            if (v8 >= v18)
              break;
          }
          else if (v7 > v17)
          {
            break;
          }
          if ((_DWORD)v10 == (_DWORD)v16)
          {
            if (v11 <= *((float *)&v16 + 1))
              break;
          }
          else if (v10 < v16)
          {
            break;
          }
          objc_msgSend(0, "addObject:", v6);
          objc_msgSend(v6, "getNextStep");
          v19 = objc_claimAutoreleasedReturnValue();

          v6 = (void *)v19;
        }
        while (v19);
      }
LABEL_23:
      if (v13)
        v20 = objc_msgSend(v13, "transportType");
      else
        v20 = -[GEOComposedRoute transportType](v40->_route, "transportType");
      v21 = v20;
      objc_msgSend(v42, "distanceFromStartToRouteCoordinate:", v7 | ((unint64_t)LODWORD(v8) << 32));
      v23 = v22;
      objc_msgSend(0, "lastObject");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        objc_msgSend(0, "lastObject");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "stepIndex");

      }
      else
      {
        v26 = 0x7FFFFFFFFFFFFFFFLL;
      }

      v45 = 0u;
      v46 = 0u;
      v44 = 0u;
      route = v40->_route;
      if (route)
        -[GEOComposedRoute coarseBoundsForRange:sampleLength:](route, "coarseBoundsForRange:sampleLength:", v9, v10 | ((unint64_t)LODWORD(v11) << 32), 25.0);
      v28 = [GEOComposedRouteSection alloc];
      v29 = objc_msgSend(v13, "segmentIndex");
      v43[0] = v44;
      v43[1] = v45;
      v43[2] = v46;
      LODWORD(v34) = v21;
      v30 = -[GEOComposedRouteSection initWithCoordinates:segment:segmentIndex:steps:startCoordinateIndex:coordinateCount:bounds:transportType:finalStepIndex:startDistance:lengthScaleFactor:](v28, "initWithCoordinates:segment:segmentIndex:steps:startCoordinateIndex:coordinateCount:bounds:transportType:finalStepIndex:startDistance:lengthScaleFactor:", v42, v13, v29, 0, v7, (v10 - v7 + 1), v23, 1.0, v43, v34, v26);
      objc_msgSend(v39, "addObject:", v30);
      objc_msgSend(0, "lastObject");
      v31 = objc_claimAutoreleasedReturnValue();

      v32 = v15;
      v41 = v32;

      v7 = v10;
      v8 = v11;
      v6 = (void *)v31;
    }
    v15 = 0;
LABEL_13:
    if (v6)
      goto LABEL_14;
    goto LABEL_23;
  }
LABEL_35:

  return v3 != 0;
}

- (BOOL)_buildBoundingMapRegion
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t i;
  void *v13;
  BOOL v14;
  char v15;
  GEOMapRegion *v16;
  __int128 v18;
  _OWORD v19[3];
  _QWORD v20[4];
  __int128 v21;
  _QWORD v22[4];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[GEOComposedRoute sections](self->_route, "sections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[GEOComposedRoute sections](self->_route, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v25;
    v8 = 0.0;
    v9 = INFINITY;
    v10 = INFINITY;
    v11 = INFINITY;
    v18 = 0u;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v5);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        *(double *)v20 = v9;
        *(double *)&v20[1] = v10;
        *(double *)&v20[2] = v11;
        *(double *)&v20[3] = v8;
        v21 = v18;
        if (v13)
          objc_msgSend(v13, "bounds");
        else
          memset(v19, 0, sizeof(v19));
        GEOMapBoxUnion((uint64_t)v20, (uint64_t)v19, (uint64_t)v22);
        v9 = *(double *)v22;
        v10 = *(double *)&v22[1];
        v11 = *(double *)&v22[2];
        v8 = *(double *)&v22[3];
        v18 = v23;
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v6);
  }
  else
  {
    v8 = 0.0;
    v9 = INFINITY;
    v10 = INFINITY;
    v11 = INFINITY;
    *(_QWORD *)&v18 = 0;
  }

  v14 = fabs(v9) == INFINITY;
  if (fabs(v10) == INFINITY)
    v14 = 1;
  v15 = fabs(v11) == INFINITY || v14;
  if ((v15 & 1) == 0)
  {
    v16 = -[GEOMapRegion initWithMapRect:]([GEOMapRegion alloc], "initWithMapRect:", v9, v10, v8, *(double *)&v18);
    -[GEOComposedRoute setBoundingMapRegion:](self->_route, "setBoundingMapRegion:", v16);

  }
  return v15 ^ 1;
}

- (BOOL)_setMiscInfo
{
  return 1;
}

- (id)_singleLegWithLocationTypeWaypoints
{
  void *v2;
  GEOComposedRouteLeg *v3;
  double v4;
  double v5;
  GEOLocation *v6;
  GEOComposedWaypoint *v7;
  double v8;
  double v9;
  GEOLocation *v10;
  GEOComposedWaypoint *v11;

  -[GEORouteBuilderBase route](self, "route");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "pointCount") >= 2)
  {
    objc_msgSend(v2, "pointAt:", 0);
    v6 = -[GEOLocation initWithGEOCoordinate:]([GEOLocation alloc], "initWithGEOCoordinate:", v4, v5);
    v7 = -[GEOComposedWaypoint initWithLocation:isCurrentLocation:]([GEOComposedWaypoint alloc], "initWithLocation:isCurrentLocation:", v6, 0);
    objc_msgSend(v2, "pointAt:", objc_msgSend(v2, "pointCount") - 1);
    v10 = -[GEOLocation initWithGEOCoordinate:]([GEOLocation alloc], "initWithGEOCoordinate:", v8, v9);
    v11 = -[GEOComposedWaypoint initWithLocation:isCurrentLocation:]([GEOComposedWaypoint alloc], "initWithLocation:isCurrentLocation:", v10, 0);
    v3 = -[GEOComposedRouteLeg initWithComposedRoute:geoRouteLeg:legIndex:origin:destination:arrivalParameters:]([GEOComposedRouteLeg alloc], "initWithComposedRoute:geoRouteLeg:legIndex:origin:destination:arrivalParameters:", v2, 0, 0, v7, v11, 0);
    -[GEOComposedRouteLeg setPointRange:](v3, "setPointRange:", 0, objc_msgSend(v2, "pointCount"));
    -[GEOComposedRouteLeg setStepRange:](v3, "setStepRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
    -[GEOComposedRouteLeg setSegmentRange:](v3, "setSegmentRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
    objc_msgSend(v2, "distance");
    -[GEOComposedRouteLeg setDistance:](v3, "setDistance:");

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_newSegmentWithRange:(GEOPolylineCoordinateRange)a3 stepRange:(_NSRange)a4 index:(unint64_t)a5
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  GEOComposedDrivingRouteSegment *v14;
  void *v15;
  unint64_t v16;
  NSObject *v17;
  const char *v18;
  uint8_t *v19;
  GEOComposedWalkingRouteSegment *v20;
  GEOComposedBicycleRouteSegment *v21;
  GEOComposedFerryRouteSegment *v22;
  __int16 v24;
  uint8_t buf[2];
  __int16 v26;

  length = a4.length;
  location = a4.location;
  v9 = vcvtas_u32_f32((float)a3.start.index + a3.start.offset);
  if (a3.start.offset >= 0.0)
    v10 = v9;
  else
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  v11 = vcvtas_u32_f32((float)a3.end.index + a3.end.offset);
  if (a3.end.offset >= 0.0)
    v12 = v11;
  else
    v12 = 0x7FFFFFFFFFFFFFFFLL;
  v13 = v12 - v10 + 1;
  switch(-[GEORouteBuilderBase _transportType](self, "_transportType"))
  {
    case 0:
      v14 = [GEOComposedDrivingRouteSegment alloc];
      -[GEORouteBuilderBase route](self, "route");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[GEOComposedRouteSegment initWithComposedRoute:stepRange:pointRange:segmentIndex:](v14, "initWithComposedRoute:stepRange:pointRange:segmentIndex:", v15, location, length, v10, v13, a5);
      goto LABEL_16;
    case 1:
      GEOGetGEORouteBuilderLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        goto LABEL_20;
      v26 = 0;
      v18 = "_newSegmentWithRange: does not support transit segments yet.";
      v19 = (uint8_t *)&v26;
      goto LABEL_19;
    case 2:
      v20 = [GEOComposedWalkingRouteSegment alloc];
      -[GEORouteBuilderBase route](self, "route");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[GEOComposedRouteSegment initWithComposedRoute:stepRange:pointRange:segmentIndex:](v20, "initWithComposedRoute:stepRange:pointRange:segmentIndex:", v15, location, length, v10, v13, a5);
      goto LABEL_16;
    case 3:
      v21 = [GEOComposedBicycleRouteSegment alloc];
      -[GEORouteBuilderBase route](self, "route");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[GEOComposedRouteSegment initWithComposedRoute:stepRange:pointRange:segmentIndex:](v21, "initWithComposedRoute:stepRange:pointRange:segmentIndex:", v15, location, length, v10, v13, a5);
      goto LABEL_16;
    case 4:
      GEOGetGEORouteBuilderLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        goto LABEL_20;
      v24 = 0;
      v18 = "Cannot create segment for an unknown transport type.";
      v19 = (uint8_t *)&v24;
      goto LABEL_19;
    case 5:
      v22 = [GEOComposedFerryRouteSegment alloc];
      -[GEORouteBuilderBase route](self, "route");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[GEOComposedRouteSegment initWithComposedRoute:stepRange:pointRange:segmentIndex:](v22, "initWithComposedRoute:stepRange:pointRange:segmentIndex:", v15, location, length, v10, v13, a5);
LABEL_16:
      a5 = v16;

      return (id)a5;
    case 6:
      GEOGetGEORouteBuilderLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        goto LABEL_20;
      *(_WORD *)buf = 0;
      v18 = "Route builder not supported for RideShare transport type.";
      v19 = buf;
LABEL_19:
      _os_log_impl(&dword_1885A9000, v17, OS_LOG_TYPE_ERROR, v18, v19, 2u);
LABEL_20:

      return 0;
    default:
      return (id)a5;
  }
}

- (id)_newStepWithRange:(GEOPolylineCoordinateRange)a3 maneuverStart:(PolylineCoordinate)a4 index:(unint64_t)a5
{
  void *end;
  PolylineCoordinate start;
  GEOComposedDrivingRouteStep *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint8_t *v15;
  GEOComposedWalkingRouteStep *v16;
  GEOComposedBicycleRouteStep *v17;
  GEOComposedFerryRouteStep *v18;
  __int16 v20;
  uint8_t buf[2];
  __int16 v22;

  end = (void *)a3.end;
  start = a3.start;
  switch(-[GEORouteBuilderBase _transportType](self, "_transportType"))
  {
    case 0:
      v10 = [GEOComposedDrivingRouteStep alloc];
      -[GEORouteBuilderBase route](self, "route");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[GEOComposedDrivingRouteStep initWithComposedRoute:geoRouteLeg:geoStep:stepIndex:startRouteCoordinate:endRouteCoordinate:maneuverStartRouteCoordinate:](v10, "initWithComposedRoute:geoRouteLeg:geoStep:stepIndex:startRouteCoordinate:endRouteCoordinate:maneuverStartRouteCoordinate:", v11, 0, 0, a5, start, end, a4);
      goto LABEL_10;
    case 1:
      GEOGetGEORouteBuilderLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        goto LABEL_14;
      v22 = 0;
      v14 = "_newStepWithRange: does not support transit segments yet.";
      v15 = (uint8_t *)&v22;
      goto LABEL_13;
    case 2:
      v16 = [GEOComposedWalkingRouteStep alloc];
      -[GEORouteBuilderBase route](self, "route");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[GEOComposedWalkingRouteStep initWithComposedRoute:geoRouteLeg:geoStep:stepIndex:startRouteCoordinate:endRouteCoordinate:maneuverStartRouteCoordinate:](v16, "initWithComposedRoute:geoRouteLeg:geoStep:stepIndex:startRouteCoordinate:endRouteCoordinate:maneuverStartRouteCoordinate:", v11, 0, 0, a5, start, end, a4);
      goto LABEL_10;
    case 3:
      v17 = [GEOComposedBicycleRouteStep alloc];
      -[GEORouteBuilderBase route](self, "route");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[GEOComposedBicycleRouteStep initWithComposedRoute:geoRouteLeg:geoStep:stepIndex:startRouteCoordinate:endRouteCoordinate:maneuverStartRouteCoordinate:](v17, "initWithComposedRoute:geoRouteLeg:geoStep:stepIndex:startRouteCoordinate:endRouteCoordinate:maneuverStartRouteCoordinate:", v11, 0, 0, a5, start, end, a4);
      goto LABEL_10;
    case 4:
      GEOGetGEORouteBuilderLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        goto LABEL_14;
      v20 = 0;
      v14 = "Cannot create step for an unknown transport type.";
      v15 = (uint8_t *)&v20;
      goto LABEL_13;
    case 5:
      v18 = [GEOComposedFerryRouteStep alloc];
      -[GEORouteBuilderBase route](self, "route");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[GEOComposedFerryRouteStep initWithComposedRoute:geoRouteLeg:geoStep:stepIndex:startRouteCoordinate:endRouteCoordinate:maneuverStartRouteCoordinate:](v18, "initWithComposedRoute:geoRouteLeg:geoStep:stepIndex:startRouteCoordinate:endRouteCoordinate:maneuverStartRouteCoordinate:", v11, 0, 0, a5, start, end, a4);
LABEL_10:
      end = (void *)v12;

      return end;
    case 6:
      GEOGetGEORouteBuilderLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        goto LABEL_14;
      *(_WORD *)buf = 0;
      v14 = "Route builder not supported for RideShare transport type.";
      v15 = buf;
LABEL_13:
      _os_log_impl(&dword_1885A9000, v13, OS_LOG_TYPE_ERROR, v14, v15, 2u);
LABEL_14:

      return 0;
    default:
      return end;
  }
}

@end
