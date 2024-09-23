@implementation GEORouteBuilder_GeometryRoute

- (void)setTrafficColors:(unsigned int *)a3 offsets:(unsigned int *)a4 count:(unint64_t)a5
{
  unint64_t v5;
  NSArray *v9;
  void *v10;
  unsigned int v11;
  unsigned int v12;
  NSArray *trafficColorInfos;

  if (a5)
  {
    v5 = a5;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a5);
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    do
    {
      v10 = (void *)objc_opt_new();
      v11 = *a3++;
      objc_msgSend(v10, "setColor:", v11);
      v12 = *a4++;
      objc_msgSend(v10, "setOffsetMeters:", (double)v12);
      -[NSArray addObject:](v9, "addObject:", v10);

      --v5;
    }
    while (v5);
    trafficColorInfos = self->_trafficColorInfos;
    self->_trafficColorInfos = v9;

  }
}

- (int)_transportType
{
  return self->_transportType;
}

- (id)_newRouteInstance
{
  return (id)objc_opt_new();
}

- (BOOL)_buildCoordinates
{
  GEOComposedRouteCoordinateArray *v3;
  unint64_t v4;
  BOOL v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  int v9;
  NSObject *v10;
  int v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_rawRouteGeometry)
  {
    v3 = -[GEOComposedRouteCoordinateArray initWithRawRouteGeometry:]([GEOComposedRouteCoordinateArray alloc], "initWithRawRouteGeometry:", self->_rawRouteGeometry);
    v4 = -[GEOComposedRouteCoordinateArray coordinateCount](v3, "coordinateCount");
    v5 = v4 > 1;
    if (v4 > 1)
    {
      if (-[NSArray count](self->_destinations, "count"))
      {
        v6 = -[GEOComposedRouteCoordinateArray pathsCount](v3, "pathsCount");
        if (v6 != -[NSArray count](self->_destinations, "count"))
        {
          GEOGetGEORouteBuilder_GeometryRouteLog();
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          {
            v8 = -[GEOComposedRouteCoordinateArray pathsCount](v3, "pathsCount");
            v9 = -[NSArray count](self->_destinations, "count");
            v13 = 67109376;
            v14 = v8;
            v15 = 1024;
            v16 = v9;
          }

        }
      }
      -[GEORouteBuilderBase route](self, "route");
      v10 = objc_claimAutoreleasedReturnValue();
      -[NSObject setCoordinates:](v10, "setCoordinates:", v3);
    }
    else
    {
      GEOGetGEORouteBuilder_GeometryRouteLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v13 = 67109120;
        v14 = -[GEOComposedRouteCoordinateArray coordinateCount](v3, "coordinateCount");
        _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_ERROR, "Error building route coordinates. Total point count is less than 2. Actual: %d", (uint8_t *)&v13, 8u);
      }
    }

  }
  else
  {
    GEOGetGEORouteBuilder_GeometryRouteLog();
    v3 = (GEOComposedRouteCoordinateArray *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v3->super, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1885A9000, &v3->super, OS_LOG_TYPE_ERROR, "Cannot build coordinates because raw route geometry is empty.", (uint8_t *)&v13, 2u);
    }
    v5 = 0;
  }

  return v5;
}

- (BOOL)_buildComponents
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  GEOComposedWaypoint *v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  GEOComposedWaypoint *v19;
  double v20;
  double v21;
  GEOLocation *v22;
  GEOComposedRouteLeg *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  NSObject *v28;
  GEOLocation *v30;
  unint64_t v31;
  NSUInteger v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint8_t buf[16];

  -[GEORouteBuilderBase route](self, "route");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "coordinates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "coordinateCount");
  v6 = v5;
  if (v5 <= 1)
  {
    GEOGetGEORouteBuilder_GeometryRouteLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v28, OS_LOG_TYPE_ERROR, "Require at least 2 points to build a route.", buf, 2u);
    }

  }
  else
  {
    v31 = v5;
    v36 = v3;
    v7 = objc_msgSend(v4, "pathsCount");
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v7);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v7);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v7);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEORouteBuilderBase route](self, "route");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "coordinates");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "coordinateOnRouteAt:", 0);
    v11 = v10;
    v13 = v12;

    v30 = -[GEOLocation initWithGEOCoordinate:isUserLocation:]([GEOLocation alloc], "initWithGEOCoordinate:isUserLocation:", self->_isOriginCurrentLocation, v11, v13);
    v14 = -[GEOComposedWaypoint initWithLocation:isCurrentLocation:]([GEOComposedWaypoint alloc], "initWithLocation:isCurrentLocation:", v30, self->_isOriginCurrentLocation);
    v32 = -[NSArray count](self->_destinations, "count");
    if (v7)
    {
      for (i = 0; i != v7; ++i)
      {
        v17 = objc_msgSend(v4, "routeCoordinateRangeForPathIndex:", i);
        v18 = v16;
        if (v32 == v7)
        {
          -[NSArray objectAtIndexedSubscript:](self->_destinations, "objectAtIndexedSubscript:", i);
          v19 = (GEOComposedWaypoint *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v4, "coordinateForRouteCoordinate:", v16);
          v22 = -[GEOLocation initWithGEOCoordinate:]([GEOLocation alloc], "initWithGEOCoordinate:", v20, v21);
          v19 = -[GEOComposedWaypoint initWithLocation:isCurrentLocation:]([GEOComposedWaypoint alloc], "initWithLocation:isCurrentLocation:", v22, 0);

        }
        v23 = -[GEOComposedRouteLeg initWithComposedRoute:geoRouteLeg:legIndex:origin:destination:arrivalParameters:]([GEOComposedRouteLeg alloc], "initWithComposedRoute:geoRouteLeg:legIndex:origin:destination:arrivalParameters:", v36, 0, i, v14, v19, 0);
        -[GEOComposedRouteLeg setPointRange:](v23, "setPointRange:", v17, (v18 - v17 + 1));
        -[GEOComposedRouteLeg setStepRange:](v23, "setStepRange:", i, 1);
        -[GEOComposedRouteLeg setSegmentRange:](v23, "setSegmentRange:", i, 1);
        objc_msgSend(v4, "distanceBetweenRouteCoordinate:andRouteCoordinate:", v17, v18);
        -[GEOComposedRouteLeg setDistance:](v23, "setDistance:");
        objc_msgSend(v35, "addObject:", v23);
        v24 = -[GEOComposedRouteLeg stepRange](v23, "stepRange");
        v26 = -[GEORouteBuilderBase _newSegmentWithRange:stepRange:index:](self, "_newSegmentWithRange:stepRange:index:", v17, v18, v24, v25, i);
        objc_msgSend(v34, "addObject:", v26);
        v27 = -[GEORouteBuilderBase _newStepWithRange:maneuverStart:index:](self, "_newStepWithRange:maneuverStart:index:", v17, v18, v18, i);
        objc_msgSend(v33, "addObject:", v27);

        v14 = v19;
      }
    }
    else
    {
      v19 = v14;
    }
    v3 = v36;
    objc_msgSend(v36, "setLegs:", v35);
    objc_msgSend(v36, "setSegments:", v34);
    objc_msgSend(v36, "setSteps:", v33);

    v6 = v31;
  }

  return v6 > 1;
}

- (BOOL)_setMiscInfo
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  GEOComposedRouteTraffic *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[GEORouteBuilderBase route](self, "route");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSource:", self->_source);
  objc_msgSend(v3, "coordinates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "distanceBetweenRouteCoordinate:andRouteCoordinate:", objc_msgSend(v3, "startRouteCoordinate"), objc_msgSend(v3, "endRouteCoordinate"));
  objc_msgSend(v3, "setDistance:");

  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "initializeForRoute:", v3);
  if (-[NSArray count](self->_trafficColorInfos, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = self->_trafficColorInfos;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v3, "coordinates");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "offsetMeters");
          v13 = objc_msgSend(v12, "routeCoordinateForDistanceAfterStart:");

          objc_msgSend(v11, "setRouteCoordinate:", v13);
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

    v14 = -[GEOComposedRouteTraffic initWithColorInfos:incidentInfos:]([GEOComposedRouteTraffic alloc], "initWithColorInfos:incidentInfos:", self->_trafficColorInfos, 0);
  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(v5, "setTraffic:", v14);
  objc_msgSend(v3, "setMutableData:", v5);

  return 1;
}

- (int)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int)a3
{
  self->_transportType = a3;
}

- (GEORawRouteGeometry)rawRouteGeometry
{
  return self->_rawRouteGeometry;
}

- (void)setRawRouteGeometry:(id)a3
{
  objc_storeStrong((id *)&self->_rawRouteGeometry, a3);
}

- (NSArray)destinations
{
  return self->_destinations;
}

- (void)setDestinations:(id)a3
{
  objc_storeStrong((id *)&self->_destinations, a3);
}

- (BOOL)isOriginCurrentLocation
{
  return self->_isOriginCurrentLocation;
}

- (void)setIsOriginCurrentLocation:(BOOL)a3
{
  self->_isOriginCurrentLocation = a3;
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinations, 0);
  objc_storeStrong((id *)&self->_rawRouteGeometry, 0);
  objc_storeStrong((id *)&self->_trafficColorInfos, 0);
}

@end
