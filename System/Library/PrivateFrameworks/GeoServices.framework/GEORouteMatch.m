@implementation GEORouteMatch

- (GEORouteMatch)initWithComposedRoute:(id)a3 routeStatus:(id)a4
{
  id v6;
  id v7;
  void *v8;
  GEORouteMatch *v9;
  unsigned int v10;
  unsigned int v11;
  unint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    if (!objc_msgSend(v7, "hasRouteLocationIndex"))
      goto LABEL_9;
    if (!objc_msgSend(v8, "hasRouteLocationOffset"))
      goto LABEL_9;
    v10 = objc_msgSend(v8, "routeLocationIndex");
    objc_msgSend(v8, "routeLocationOffset");
    v12 = v10 | ((unint64_t)v11 << 32);
    objc_msgSend(v6, "pointAtRouteCoordinate:", v12);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v19 = objc_msgSend(v8, "stepID");
    objc_msgSend(v8, "location");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "course");
    v22 = v21;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[GEORouteMatch initWithRoute:routeCoordinate:locationCoordinate:stepIndex:matchedCourse:timestamp:](self, "initWithRoute:routeCoordinate:locationCoordinate:stepIndex:matchedCourse:timestamp:", v6, v12, v19, v23, v14, v16, v18, v22);

    if (self)
    {
      if (objc_msgSend(v8, "hasDistanceToRoute"))
      {
        -[GEORouteMatch setDistanceFromRoute:](self, "setDistanceFromRoute:", (double)objc_msgSend(v8, "distanceToRoute"));
        -[GEORouteMatch distanceFromRoute](self, "distanceFromRoute");
        v25 = v24;
        objc_msgSend(v8, "location");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "horizontalAccuracy");
        -[GEORouteMatch setIsGoodMatch:](self, "setIsGoodMatch:", v25 < v27 + 50.0);

      }
      self = self;
      v9 = self;
    }
    else
    {
LABEL_9:
      v9 = 0;
    }
  }

  return v9;
}

- (GEORouteMatch)initWithRoute:(id)a3 routeCoordinate:(PolylineCoordinate)a4 locationCoordinate:(id)a5 stepIndex:(unint64_t)a6 matchedCourse:(double)a7 timestamp:(id)a8
{
  double var2;
  double var1;
  double var0;
  id v17;
  id v18;
  GEORouteMatch *v19;
  GEORouteMatch *v20;
  void *v21;
  uint64_t v22;
  NSArray *candidateSteps;
  objc_super v25;

  var2 = a5.var2;
  var1 = a5.var1;
  var0 = a5.var0;
  v17 = a3;
  v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)GEORouteMatch;
  v19 = -[GEORouteMatch init](&v25, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_route, a3);
    v20->_locationCoordinate.latitude = var0;
    v20->_locationCoordinate.longitude = var1;
    v20->_locationCoordinate.altitude = var2;
    v20->_routeCoordinate = a4;
    v20->_stepIndex = a6;
    v20->_matchedCourse = a7;
    objc_storeStrong((id *)&v20->_timestamp, a8);
    v20->_consecutiveProgressionsOffRoute = 0;
    objc_msgSend(v17, "stepAtIndex:", a6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v21, 0);
    candidateSteps = v20->_candidateSteps;
    v20->_candidateSteps = (NSArray *)v22;

  }
  return v20;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)locationCoordinate
{
  double latitude;
  double longitude;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  latitude = self->_locationCoordinate.latitude;
  longitude = self->_locationCoordinate.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (void)updateOffRouteProgress:(id)a3 minDistanceToGetOnRoute:(double)a4
{
  double v6;
  double v7;
  uint64_t v8;
  PolylineCoordinate v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;

  v18 = a3;
  if (v18)
  {
    if (!-[GEORouteMatch isGoodMatch](self, "isGoodMatch"))
    {
      -[GEORouteMatch distanceFromRoute](self, "distanceFromRoute");
      if (v6 <= a4)
      {
        objc_msgSend(v18, "distanceFromRoute");
        if (v7 <= a4)
        {
          v8 = objc_msgSend(v18, "routeCoordinate");
          v9 = -[GEORouteMatch routeCoordinate](self, "routeCoordinate");
          if (v8 < v9.index || (_DWORD)v8 == v9.index && *((float *)&v8 + 1) < v9.offset)
          {
            -[GEORouteMatch setConsecutiveProgressionsOffRoute:](self, "setConsecutiveProgressionsOffRoute:", objc_msgSend(v18, "consecutiveProgressionsOffRoute") + 1);
            objc_msgSend(v18, "distanceTraveledOffRoute");
            v11 = v10;
            objc_msgSend(v18, "locationCoordinate");
            v13 = v12;
            v15 = v14;
            -[GEORouteMatch locationCoordinate](self, "locationCoordinate");
            -[GEORouteMatch setDistanceTraveledOffRoute:](self, "setDistanceTraveledOffRoute:", (double)(v11 + GEOCalculateDistanceRadius(v13, v15, v16, v17, 6367000.0)));
          }
        }
      }
    }
  }

}

- (void)setRouteCoordinate:(PolylineCoordinate)a3
{
  PolylineCoordinate v3;
  unint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v3 = a3;
  if (-[GEOComposedRoute pointCount](self->_route, "pointCount") - 1 <= a3.index)
  {
    v5 = 0;
    v3 = (PolylineCoordinate)(-[GEOComposedRoute pointCount](self->_route, "pointCount") - 1);
  }
  else
  {
    v5 = HIDWORD(*(unint64_t *)&v3);
  }
  self->_stepIndex = -[GEOComposedRoute stepIndexForRouteCoordinate:](self->_route, "stepIndexForRouteCoordinate:", v3.index | (v5 << 32));
  self->_routeCoordinate.index = v3.index;
  LODWORD(self->_routeCoordinate.offset) = v5;
  -[GEOComposedRoute pointAtRouteCoordinate:](self->_route, "pointAtRouteCoordinate:", *(_QWORD *)&self->_routeCoordinate);
  self->_locationCoordinate.latitude = v6;
  self->_locationCoordinate.longitude = v7;
  self->_locationCoordinate.altitude = v8;
  -[GEOComposedRoute courseAtRouteCoordinateIndex:](self->_route, "courseAtRouteCoordinateIndex:", v3);
  self->_matchedCourse = v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  double distanceFromRoute;
  double v6;
  BOOL v7;

  v4 = a3;
  if (-[GEORouteMatch isEqualIgnoringScore:](self, "isEqualIgnoringScore:", v4))
  {
    distanceFromRoute = self->_distanceFromRoute;
    objc_msgSend(v4, "distanceFromRoute");
    v7 = distanceFromRoute == v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isEqualIgnoringScore:(id)a3
{
  GEORouteMatch *v4;
  uint64_t v5;
  BOOL v6;
  GEORouteMatch *v7;
  GEOComposedRoute *route;
  GEOComposedRoute *v9;
  uint64_t v10;
  double longitude;
  double latitude;
  double altitude;
  double v14;
  double v15;
  double v16;

  v4 = (GEORouteMatch *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = v4;
      route = self->_route;
      -[GEORouteMatch route](v7, "route");
      v9 = (GEOComposedRoute *)objc_claimAutoreleasedReturnValue();
      v6 = route == v9
        && (v10 = -[GEORouteMatch routeCoordinate](v7, "routeCoordinate"), self->_routeCoordinate.index == (_DWORD)v10)
        && vabds_f32(self->_routeCoordinate.offset, *((float *)&v10 + 1)) < 0.00000011921
        && (latitude = self->_locationCoordinate.latitude,
            longitude = self->_locationCoordinate.longitude,
            altitude = self->_locationCoordinate.altitude,
            -[GEORouteMatch locationCoordinate3D](v7, "locationCoordinate3D"),
            vabdd_f64(latitude, v16) < 0.00000000999999994)
        && vabdd_f64(longitude, v14) < 0.00000000999999994
        && vabdd_f64(altitude, v15) < 0.00000000999999994;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (BOOL)routeMatchBehind:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  PolylineCoordinate v7;
  uint64_t v8;
  BOOL v10;

  v4 = a3;
  v5 = v4;
  if (v4 && self->_route == (GEOComposedRoute *)*((_QWORD *)v4 + 1))
  {
    v7 = -[GEORouteMatch routeCoordinate](self, "routeCoordinate");
    v8 = objc_msgSend(v5, "routeCoordinate");
    v10 = v7.offset < *((float *)&v8 + 1) && v7.index == (_DWORD)v8;
    v6 = v7.index < v8 || v10;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)routeMatchedToEnd
{
  return self->_routeCoordinate.index == -[GEOComposedRoute pointCount](self->_route, "pointCount") - 1
      && fabsf(self->_routeCoordinate.offset) < 0.00000011921;
}

- (GEOMapFeatureRoad)road
{
  return -[GEOMatchedPathSegment road](self->_pathSegment, "road");
}

- (BOOL)isOnParkingLotRoad
{
  void *v3;
  void *v4;
  unsigned int v5;

  -[GEORouteMatch road](self, "road");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[GEORouteMatch road](self, "road");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "formOfWay");

  if (v5 >= 0xD)
    return 0;
  else
    return (0x10C0u >> v5) & 1;
}

- (GEOComposedRouteStep)step
{
  if (self->_stepIndex == 0x7FFFFFFFFFFFFFFFLL)
    return (GEOComposedRouteStep *)0;
  -[GEOComposedRoute stepAtIndex:](self->_route, "stepAtIndex:");
  return (GEOComposedRouteStep *)(id)objc_claimAutoreleasedReturnValue();
}

- (GEOComposedTransitTripRouteStep)transitTripStep
{
  void *v2;
  void *v3;
  GEOComposedTransitTripRouteStep *v4;

  -[GEORouteMatch step](self, "step");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "routeSegmentType") == 6)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (GEOComposedTransitStationRouteStep)transitStationStep
{
  void *v2;
  void *v3;
  GEOComposedTransitStationRouteStep *v4;

  -[GEORouteMatch step](self, "step");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "routeSegmentType") == 5)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (unint64_t)segmentIndex
{
  if (self->_stepIndex == 0x7FFFFFFFFFFFFFFFLL)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return -[GEOComposedRoute segmentIndexForStepIndex:](self->_route, "segmentIndexForStepIndex:");
}

- (GEOComposedRouteSegment)segment
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[GEORouteMatch segmentIndex](self, "segmentIndex");
  -[GEOComposedRoute segments](self->_route, "segments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 >= objc_msgSend(v4, "count"))
  {
    v6 = 0;
  }
  else
  {
    -[GEOComposedRoute segments](self->_route, "segments");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (GEOComposedRouteSegment *)v6;
}

- (unint64_t)legIndex
{
  if (self->_stepIndex == 0x7FFFFFFFFFFFFFFFLL)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return -[GEOComposedRoute legIndexForStepIndex:](self->_route, "legIndexForStepIndex:");
}

- (GEOComposedRouteLeg)leg
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[GEORouteMatch legIndex](self, "legIndex");
  -[GEOComposedRoute legs](self->_route, "legs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 >= objc_msgSend(v4, "count"))
  {
    v6 = 0;
  }
  else
  {
    -[GEOComposedRoute legs](self->_route, "legs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (GEOComposedRouteLeg *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEORouteMatch)initWithCoder:(id)a3
{
  id v4;
  GEORouteMatch *v5;
  id v6;
  const void *v7;
  size_t v8;
  id v9;
  const void *v10;
  size_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  NSDate *timestamp;
  GEORouteMatch *v18;
  unint64_t v20;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)GEORouteMatch;
  v5 = -[GEORouteMatch init](&v21, sel_init);
  if (v5)
  {
    v20 = 0;
    v6 = objc_retainAutorelease(v4);
    v7 = (const void *)objc_msgSend(v6, "decodeBytesForKey:returnedLength:", CFSTR("_routeCoordinate"), &v20);
    if (v20 && v7)
    {
      if (v20 >= 8)
        v8 = 8;
      else
        v8 = v20;
      memcpy(&v5->_routeCoordinate, v7, v8);
    }
    v20 = 0;
    v9 = objc_retainAutorelease(v6);
    v10 = (const void *)objc_msgSend(v9, "decodeBytesForKey:returnedLength:", CFSTR("_locationCoordinate"), &v20);
    if (v20 && v10)
    {
      if (v20 >= 0x18)
        v11 = 24;
      else
        v11 = v20;
      memcpy(&v5->_locationCoordinate, v10, v11);
    }
    v5->_stepIndex = objc_msgSend(v9, "decodeIntegerForKey:", CFSTR("_stepIndex"));
    objc_msgSend(v9, "decodeDoubleForKey:", CFSTR("_matchedCourse"));
    v5->_matchedCourse = v12;
    objc_msgSend(v9, "decodeDoubleForKey:", CFSTR("_distanceFromRoute"));
    v5->_distanceFromRoute = v13;
    objc_msgSend(v9, "decodeDoubleForKey:", CFSTR("_modifiedHorizontalAccuracy"));
    v5->_modifiedHorizontalAccuracy = v14;
    objc_msgSend(v9, "decodeDoubleForKey:", CFSTR("_modifiedCourseAccuracy"));
    v5->_modifiedCourseAccuracy = v15;
    v5->_isGoodMatch = objc_msgSend(v9, "decodeBoolForKey:", CFSTR("_isGoodMatch"));
    v5->_shouldProjectLocationAlongRoute = objc_msgSend(v9, "decodeBoolForKey:", CFSTR("_shouldProjectLocationAlongRoute"));
    objc_msgSend(v9, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_timestamp"));
    v16 = objc_claimAutoreleasedReturnValue();
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v16;

    v5->_transitID = objc_msgSend(v9, "decodeIntegerForKey:", CFSTR("_transitID"));
    v5->_isTunnelProjection = objc_msgSend(v9, "decodeBoolForKey:", CFSTR("_isTunnelProjection"));
    v18 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBytes:length:forKey:", &self->_routeCoordinate, 8, CFSTR("_routeCoordinate"));
  objc_msgSend(v4, "encodeBytes:length:forKey:", &self->_locationCoordinate, 24, CFSTR("_locationCoordinate"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_stepIndex, CFSTR("_stepIndex"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_matchedCourse"), self->_matchedCourse);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_distanceFromRoute"), self->_distanceFromRoute);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_modifiedHorizontalAccuracy"), self->_modifiedHorizontalAccuracy);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_modifiedCourseAccuracy"), self->_modifiedCourseAccuracy);
  objc_msgSend(v4, "encodeBool:forKey:", self->_isGoodMatch, CFSTR("_isGoodMatch"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_shouldProjectLocationAlongRoute, CFSTR("_shouldProjectLocationAlongRoute"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_timestamp, CFSTR("_timestamp"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_transitID, CFSTR("_transitID"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isTunnelProjection, CFSTR("_isTunnelProjection"));

}

- (id)description
{
  uint64_t v2;
  unint64_t consecutiveProgressionsOffRoute;
  __CFString *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  float v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  void *v18;

  v2 = (uint64_t)self;
  consecutiveProgressionsOffRoute = self->_consecutiveProgressionsOffRoute;
  if (consecutiveProgressionsOffRoute)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ORP:%lu/%f "), consecutiveProgressionsOffRoute, *(_QWORD *)&self->_distanceTraveledOffRoute);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_1E1C241D0;
  }
  v5 = (void *)MEMORY[0x1E0CB3940];
  if (*(_BYTE *)(v2 + 112))
    v6 = "Good";
  else
    v6 = "Poor";
  v7 = *(_QWORD *)(v2 + 16);
  v8 = *(_QWORD *)(v2 + 24);
  v9 = *(_QWORD *)(v2 + 48);
  v10 = *(_DWORD *)(v2 + 40);
  v11 = *(float *)(v2 + 44);
  v12 = *(_QWORD *)(v2 + 80);
  v13 = *(_QWORD *)(v2 + 88);
  v14 = *(_QWORD *)(v2 + 64);
  v15 = *(_QWORD *)(v2 + 72);
  objc_msgSend((id)v2, "road");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend((id)v2, "road");
    v2 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v2, "internalRoadName");
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = CFSTR("unknown");
  }
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%s RM: %f,%f SI:%lu PT:%f C:%f HA:%f CA:%f DR:%lf %@RD:%@"), v6, v7, v8, v9, (float)(v11 + (float)v10), v14, v12, v13, v15, v4, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {

  }
  return v18;
}

- (PolylineCoordinate)routeCoordinate
{
  return self->_routeCoordinate;
}

- ($1AB5FA073B851C12C2339EC22442E995)locationCoordinate3D
{
  double latitude;
  double longitude;
  double altitude;
  $1AB5FA073B851C12C2339EC22442E995 result;

  latitude = self->_locationCoordinate.latitude;
  longitude = self->_locationCoordinate.longitude;
  altitude = self->_locationCoordinate.altitude;
  result.var2 = altitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (void)setLocationCoordinate3D:(id)a3
{
  self->_locationCoordinate = ($5B2A0FEE2A1717E36A90D599307F83D1)a3;
}

- (unint64_t)stepIndex
{
  return self->_stepIndex;
}

- (void)setStepIndex:(unint64_t)a3
{
  self->_stepIndex = a3;
}

- (NSArray)candidateSteps
{
  return self->_candidateSteps;
}

- (void)setCandidateSteps:(id)a3
{
  objc_storeStrong((id *)&self->_candidateSteps, a3);
}

- (double)matchedCourse
{
  return self->_matchedCourse;
}

- (void)setMatchedCourse:(double)a3
{
  self->_matchedCourse = a3;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void)setRoute:(id)a3
{
  objc_storeStrong((id *)&self->_route, a3);
}

- (GEOMatchedPathSegment)pathSegment
{
  return self->_pathSegment;
}

- (void)setPathSegment:(id)a3
{
  objc_storeStrong((id *)&self->_pathSegment, a3);
}

- (double)roadWidth
{
  return self->_roadWidth;
}

- (void)setRoadWidth:(double)a3
{
  self->_roadWidth = a3;
}

- (double)distanceFromRoute
{
  return self->_distanceFromRoute;
}

- (void)setDistanceFromRoute:(double)a3
{
  self->_distanceFromRoute = a3;
}

- (double)modifiedHorizontalAccuracy
{
  return self->_modifiedHorizontalAccuracy;
}

- (void)setModifiedHorizontalAccuracy:(double)a3
{
  self->_modifiedHorizontalAccuracy = a3;
}

- (double)modifiedCourseAccuracy
{
  return self->_modifiedCourseAccuracy;
}

- (void)setModifiedCourseAccuracy:(double)a3
{
  self->_modifiedCourseAccuracy = a3;
}

- (GEORouteMatch)projectedFrom
{
  return self->_projectedFrom;
}

- (void)setProjectedFrom:(id)a3
{
  objc_storeStrong((id *)&self->_projectedFrom, a3);
}

- (BOOL)isGoodMatch
{
  return self->_isGoodMatch;
}

- (void)setIsGoodMatch:(BOOL)a3
{
  self->_isGoodMatch = a3;
}

- (BOOL)shouldProjectLocationAlongRoute
{
  return self->_shouldProjectLocationAlongRoute;
}

- (void)setShouldProjectLocationAlongRoute:(BOOL)a3
{
  self->_shouldProjectLocationAlongRoute = a3;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (unint64_t)consecutiveProgressionsOffRoute
{
  return self->_consecutiveProgressionsOffRoute;
}

- (void)setConsecutiveProgressionsOffRoute:(unint64_t)a3
{
  self->_consecutiveProgressionsOffRoute = a3;
}

- (double)distanceTraveledOffRoute
{
  return self->_distanceTraveledOffRoute;
}

- (void)setDistanceTraveledOffRoute:(double)a3
{
  self->_distanceTraveledOffRoute = a3;
}

- (unint64_t)transitID
{
  return self->_transitID;
}

- (void)setTransitID:(unint64_t)a3
{
  self->_transitID = a3;
}

- (BOOL)isTunnelProjection
{
  return self->_isTunnelProjection;
}

- (void)setIsTunnelProjection:(BOOL)a3
{
  self->_isTunnelProjection = a3;
}

- (GEONavigationMatchInfo)detailedMatchInfo
{
  return self->_detailedMatchInfo;
}

- (void)setDetailedMatchInfo:(id)a3
{
  objc_storeStrong((id *)&self->_detailedMatchInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailedMatchInfo, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_projectedFrom, 0);
  objc_storeStrong((id *)&self->_pathSegment, 0);
  objc_storeStrong((id *)&self->_candidateSteps, 0);
  objc_storeStrong((id *)&self->_route, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0xBF80000000000000;
  return self;
}

@end
