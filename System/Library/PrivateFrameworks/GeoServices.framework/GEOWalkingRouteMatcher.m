@implementation GEOWalkingRouteMatcher

- (GEOWalkingRouteMatcher)initWithRoute:(id)a3 auditToken:(id)a4
{
  id v6;
  id v7;
  GEOWalkingRouteMatcher *v8;
  GEOWalkingRouteMatcher *v9;
  void *v10;
  uint64_t v11;
  NSArray *turnAroundManeuverInfos;
  GEOWalkingRouteMatcher *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)GEOWalkingRouteMatcher;
  v8 = -[GEORouteMatcher initWithRoute:auditToken:](&v15, sel_initWithRoute_auditToken_, v6, v7);
  v9 = v8;
  if (v8)
  {
    -[GEORouteMatcher setShouldSnapRouteMatchToRoute:](v8, "setShouldSnapRouteMatchToRoute:", 1);
    objc_msgSend(v6, "steps");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_geo_compactMap:", &__block_literal_global_40);
    v11 = objc_claimAutoreleasedReturnValue();
    turnAroundManeuverInfos = v9->_turnAroundManeuverInfos;
    v9->_turnAroundManeuverInfos = (NSArray *)v11;

    v9->_lastReferenceCoordinate = (PolylineCoordinate)0xBF80000000000000;
    v13 = v9;
  }

  return v9;
}

_GEOWalkingRouteMatcherTurnAroundManeuverInfo *__51__GEOWalkingRouteMatcher_initWithRoute_auditToken___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _GEOWalkingRouteMatcherTurnAroundManeuverInfo *v3;

  v2 = a2;
  v3 = -[_GEOWalkingRouteMatcherTurnAroundManeuverInfo initWithStep:]([_GEOWalkingRouteMatcherTurnAroundManeuverInfo alloc], "initWithStep:", v2);

  return v3;
}

- (double)_maxMatchDistance:(double)a3 routeCoordinate:(PolylineCoordinate)a4 previousMatchGood:(BOOL)a5
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double result;

  if (a5)
    v6 = 30.0;
  else
    v6 = 15.0;
  if (a5)
    v7 = 3.0;
  else
    v7 = 2.0;
  -[GEORouteMatcher roadWidthForRouteCoordinate:](self, "roadWidthForRouteCoordinate:", a4);
  v9 = v8 * 0.5;
  v10 = v7 * a3;
  if (a3 < 0.0)
    v10 = v6;
  result = v10 + 10.0 + v9;
  if (result > 100.0)
    return 100.0;
  return result;
}

- (id)_distanceScoreInfoForSegment:(id)a3 location:(id)a4 distanceFromSegment:(double)a5
{
  unsigned int *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  _BOOL4 v16;
  double v17;
  uint64_t v18;
  float v19;
  double v20;
  float v21;
  double v22;
  void *v23;

  v8 = (unsigned int *)a3;
  v9 = a4;
  objc_msgSend(v9, "horizontalAccuracy");
  v10 = 20.0;
  if (v11 > 20.0)
  {
    objc_msgSend(v9, "horizontalAccuracy");
    v10 = v12;
  }
  if (v8)
    v13 = v8[2];
  else
    v13 = 0;
  -[GEORouteMatcher roadWidthForRouteCoordinate:](self, "roadWidthForRouteCoordinate:", v13);
  v15 = v10 + v14 * 0.5;
  if (v15 >= a5)
  {
    v19 = a5 / v15;
    v20 = v19;
    if (v20 < 0.0)
      v20 = 0.0;
    if (v20 > 1.0)
      v20 = 1.0;
    +[_GEORouteMatcherScoreInfo infoWithScore:weight:](v20 * -0.25 + 1.0, 1.0);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = -[GEORouteMatcher hasBeenOnRouteOnce](self, "hasBeenOnRouteOnce");
    v17 = v15 + 35.0;
    if (!v16)
      v17 = v15;
    if (v17 >= a5)
    {
      v21 = (a5 - v15) / (v17 - v15);
      v22 = v21;
      if (v22 < 0.0)
        v22 = 0.0;
      if (v22 > 1.0)
        v22 = 1.0;
      +[_GEORouteMatcherScoreInfo infoWithScore:weight:](v22 * -0.75 + 0.75, 1.0);
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[_GEORouteMatcherScoreInfo doNotMatchToThisSegment]();
      v18 = objc_claimAutoreleasedReturnValue();
    }
  }
  v23 = (void *)v18;

  return v23;
}

- (id)_distanceTraveledScoreInfoForSegment:(id)a3 location:(id)a4 currentRouteCoordinate:(PolylineCoordinate)a5
{
  void *v7;
  double v8;
  double v9;
  unsigned int index;
  unsigned int v11;
  float offset;
  double v13;
  double v14;
  PolylineCoordinate end;
  PolylineCoordinate start;
  _BOOL4 v17;
  unsigned int v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  unsigned int v25;
  void *v26;
  double v27;
  double v28;
  float v29;
  double v30;
  uint8_t v32[16];

  if (!-[GEORouteMatcher hasBeenOnRouteOnce](self, "hasBeenOnRouteOnce", a3, a4))
  {
    +[_GEORouteMatcherScoreInfo ignored]();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    return v24;
  }
  -[GEORouteMatcher route](self, "route");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "distanceFromStartToRouteCoordinate:", a5);
  v9 = v8;

  index = self->_expectedCoordinateRange.start.index;
  v11 = self->_expectedCoordinateRange.end.index;
  offset = self->_expectedCoordinateRange.start.offset;
  *(float *)&v13 = self->_expectedCoordinateRange.end.offset;
  if (index != a5.index)
  {
    if (index >= a5.index)
      goto LABEL_10;
LABEL_6:
    if (a5.index == v11)
    {
      if (a5.offset > *(float *)&v13)
        goto LABEL_10;
    }
    else if (a5.index >= v11)
    {
      goto LABEL_10;
    }
    v14 = 1.0;
    goto LABEL_41;
  }
  if (offset <= a5.offset)
    goto LABEL_6;
LABEL_10:
  start = self->_tolerableCoordinateRange.start;
  end = self->_tolerableCoordinateRange.end;
  if (start.index == a5.index)
  {
    if (start.offset > a5.offset)
      goto LABEL_28;
  }
  else if (start.index >= a5.index)
  {
    goto LABEL_28;
  }
  if (a5.index == end.index)
  {
    if (a5.offset <= end.offset)
    {
LABEL_16:
      v17 = index == a5.index;
      if (offset <= a5.offset)
        v17 = 0;
      if (index > a5.index || v17)
      {
        v25 = self->_possibleCoordinateRange.start.index;
        if (v25 <= a5.index)
        {
          if (v25 != a5.index
            || (*(float *)&v13 = self->_possibleCoordinateRange.start.offset, *(float *)&v13 <= a5.offset))
          {
            -[GEORouteMatcher route](self, "route", v13);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "distanceFromStartToRouteCoordinate:", *(_QWORD *)&self->_expectedCoordinateRange.start);
            v21 = v27;

            -[GEORouteMatcher route](self, "route");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "distanceFromStartToRouteCoordinate:", *(_QWORD *)&self->_possibleCoordinateRange.start);
            goto LABEL_33;
          }
        }
      }
      else if (v11 < a5.index || v11 == a5.index && *(float *)&v13 < a5.offset)
      {
        v18 = self->_possibleCoordinateRange.end.index;
        if (v18 >= a5.index && (v18 != a5.index || self->_possibleCoordinateRange.end.offset >= a5.offset))
        {
          -[GEORouteMatcher route](self, "route");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "distanceFromStartToRouteCoordinate:", *(_QWORD *)&self->_expectedCoordinateRange.end);
          v21 = v20;

          -[GEORouteMatcher route](self, "route");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "distanceFromStartToRouteCoordinate:", *(_QWORD *)&self->_possibleCoordinateRange.end);
LABEL_33:
          v28 = v23;

          v29 = (v9 - v21) / (v28 - v21);
          v30 = v29;
          if (v30 < 0.0)
            v30 = 0.0;
          if (v30 > 1.0)
            v30 = 1.0;
          v14 = 1.0 - v30;
          goto LABEL_41;
        }
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v32 = 0;
        _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: Should not reach here.", v32, 2u);
      }
      v14 = -1.0;
LABEL_41:
      +[_GEORouteMatcherScoreInfo infoWithScore:weight:](v14, 1.5);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      return v24;
    }
  }
  else if (a5.index < end.index)
  {
    goto LABEL_16;
  }
LABEL_28:
  +[_GEORouteMatcherScoreInfo doNotMatchToThisSegment]();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  return v24;
}

- (id)_courseScoreInfoForSegment:(id)a3 location:(id)a4 currentRouteCoordinate:(PolylineCoordinate)a5
{
  id v7;
  double v8;
  double v9;
  _BOOL4 v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  long double v16;
  float v17;
  double v18;
  uint64_t v19;
  void *v20;

  v7 = a4;
  objc_msgSend(v7, "course");
  if (v8 >= 0.0 && (objc_msgSend(v7, "hasAccurateCourse") & 1) != 0)
  {
    objc_msgSend(v7, "courseAccuracy");
    v10 = v9 < 70.0;
    -[GEORouteMatcher route](self, "route");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "courseAtRouteCoordinateIndex:", a5);
    v13 = v12;

    objc_msgSend(v7, "course");
    v14 = dbl_189CCC5B0[v10];
    v16 = fmod(v13 - v15 + 180.0, 360.0);
    v17 = (fabs(fmod(v16 + 360.0, 360.0) + -180.0) + -15.0) / 60.0;
    v18 = v17;
    if (v18 < 0.0)
      v18 = 0.0;
    if (v18 > 1.0)
      v18 = 1.0;
    +[_GEORouteMatcherScoreInfo infoWithScore:weight:](1.0 - v18, v14);
    v19 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[_GEORouteMatcherScoreInfo ignored]();
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v19;

  return v20;
}

- (id)_nearStartOfStepScoreInfoForSegment:(id)a3 location:(id)a4 currentRouteCoordinate:(PolylineCoordinate)a5
{
  _QWORD *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v22;
  void *v23;
  double v24;
  double v25;

  v7 = a3;
  -[GEORouteMatcher previousRouteMatch](self, "previousRouteMatch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isGoodMatch");

  if ((v9 & 1) != 0)
  {
    -[GEORouteMatcher previousRouteMatch](self, "previousRouteMatch");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "step");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "getNextStep");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_9;
    -[GEORouteMatcher route](self, "route");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "legIndexForStepIndex:", objc_msgSend(v11, "stepIndex"));
    -[GEORouteMatcher route](self, "route");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "legIndexForStepIndex:", objc_msgSend(v12, "stepIndex"));

    if (v14 != v16)
      goto LABEL_9;
    v17 = v7 ? (void *)v7[7] : 0;
    v18 = v17;

    if (v18 != v12)
      goto LABEL_9;
    v22 = objc_msgSend(v12, "startRouteCoordinate");
    -[GEORouteMatcher route](self, "route");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "distanceBetweenRouteCoordinate:andRouteCoordinate:", v22, a5);
    v25 = v24;

    if (v25 >= 0.0 && v25 <= 20.0)
    {
      +[_GEORouteMatcherScoreInfo infoWithScore:weight:](1.0, 1.3);
      v20 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_9:
      +[_GEORouteMatcherScoreInfo ignored]();
      v20 = objc_claimAutoreleasedReturnValue();
    }
    v19 = (void *)v20;

  }
  else
  {
    +[_GEORouteMatcherScoreInfo ignored]();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

- (id)_nearTurnAroundManeuverScoreInfoForSegment:(id)a3 location:(id)a4 currentRouteCoordinate:(PolylineCoordinate)a5
{
  _QWORD *v7;
  id v8;
  void *v9;
  id v10;
  unint64_t v11;
  _GEOWalkingRouteMatcherTurnAroundManeuverInfo *nearbyTurnAroundManeuverInfo;
  GEOComposedRouteStep *step;
  unint64_t v14;
  double v15;
  uint64_t v16;
  void *v17;

  v7 = a3;
  v8 = a4;
  if (self->_nearbyTurnAroundManeuverInfo)
  {
    if (v7)
      v9 = (void *)v7[7];
    else
      v9 = 0;
    v10 = v9;
    v11 = objc_msgSend(v10, "stepIndex");

    nearbyTurnAroundManeuverInfo = self->_nearbyTurnAroundManeuverInfo;
    if (nearbyTurnAroundManeuverInfo)
      step = nearbyTurnAroundManeuverInfo->_step;
    else
      step = 0;
    v14 = -[GEOComposedRouteStep stepIndex](step, "stepIndex");
    if (v11 == v14 + 1)
    {
      v15 = 1.0;
LABEL_10:
      +[_GEORouteMatcherScoreInfo infoWithScore:weight:](v15, 1.5);
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    v15 = -1.0;
    if (v11 <= v14)
      goto LABEL_10;
  }
  +[_GEORouteMatcherScoreInfo ignored]();
  v16 = objc_claimAutoreleasedReturnValue();
LABEL_11:
  v17 = (void *)v16;

  return v17;
}

- (id)_firstTimeOnRouteScoreInfoForSegment:(id)a3 location:(id)a4 currentRouteCoordinate:(PolylineCoordinate)a5
{
  double v7;
  double v8;
  PolylineCoordinate end;
  PolylineCoordinate start;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  float v21;
  double v22;

  if (-[GEORouteMatcher hasBeenOnRouteOnce](self, "hasBeenOnRouteOnce", a3, a4))
  {
    +[_GEORouteMatcherScoreInfo ignored]();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    return v20;
  }
  start = self->_tolerableCoordinateRange.start;
  end = self->_tolerableCoordinateRange.end;
  *(float *)&v7 = a5.offset;
  if (start.index != a5.index)
  {
    if (start.index >= a5.index)
      goto LABEL_10;
LABEL_6:
    if (a5.index == end.index)
    {
      LODWORD(v8) = HIDWORD(*(_QWORD *)&self->_tolerableCoordinateRange.end);
      if (a5.offset > end.offset)
        goto LABEL_10;
    }
    else if (a5.index >= end.index)
    {
      goto LABEL_10;
    }
    v11 = 1.7;
    v12 = 0.0;
LABEL_23:
    +[_GEORouteMatcherScoreInfo infoWithScore:weight:](v12, v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    return v20;
  }
  LODWORD(v8) = HIDWORD(*(_QWORD *)&self->_tolerableCoordinateRange.start);
  if (start.offset <= a5.offset)
    goto LABEL_6;
LABEL_10:
  -[GEORouteMatcher route](self, "route", v7, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "distanceFromStartToRouteCoordinate:", a5);
  v15 = v14;

  -[GEORouteMatcher route](self, "route");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "distance");
  v18 = v17;

  v19 = v18 + -804.672;
  if (v18 <= 1609.344)
    v19 = v18 * 0.5;
  if (v19 < 804.672)
    v19 = 804.672;
  if (v19 > v18)
    v19 = v18;
  if (v15 <= v19)
  {
    v21 = v15 / v19;
    v22 = v21;
    if (v22 < 0.0)
      v22 = 0.0;
    if (v22 > 1.0)
      v22 = 1.0;
    v12 = 0.0 - v22;
    v11 = 0.9;
    goto LABEL_23;
  }
  +[_GEORouteMatcherScoreInfo doNotMatchToThisSegment]();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  return v20;
}

- (double)_scoreForCandidateWithScoreInfos:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  double v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v17;
    v6 = 0.0;
    v7 = 0.0;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v8);
        if (v9)
        {
          v10 = *(double *)(v9 + 16);
          v11 = *(double *)(v9 + 8) * v10;
        }
        else
        {
          v11 = 0.0;
          v10 = 0.0;
        }
        v7 = v7 + v11;
        v6 = v6 + v10;
        ++v8;
      }
      while (v4 != v8);
      v12 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v4 = v12;
    }
    while (v12);
  }
  else
  {
    v6 = 0.0;
    v7 = 0.0;
  }

  v13 = -1.0;
  if (fabs(v6) >= 0.00000001)
  {
    v14 = v7 / v6;
    if (v7 / v6 < -1.0)
      v14 = -1.0;
    if (v14 <= 1.0)
      v13 = v14;
    else
      v13 = 1.0;
  }

  return v13;
}

- (void)_updateNearbyTurnAroundManeuver
{
  _GEOWalkingRouteMatcherTurnAroundManeuverInfo **p_nearbyTurnAroundManeuverInfo;
  _GEOWalkingRouteMatcherTurnAroundManeuverInfo *nearbyTurnAroundManeuverInfo;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  void *v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  p_nearbyTurnAroundManeuverInfo = &self->_nearbyTurnAroundManeuverInfo;
  nearbyTurnAroundManeuverInfo = self->_nearbyTurnAroundManeuverInfo;
  self->_nearbyTurnAroundManeuverInfo = 0;

  -[GEORouteMatcher currentLocation](self, "currentLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "horizontalAccuracy");
  v7 = v6;

  if (v7 < 20.0)
  {
    -[GEORouteMatcher lastGoodRouteMatch](self, "lastGoodRouteMatch");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[GEORouteMatcher lastGoodRouteMatch](self, "lastGoodRouteMatch");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "stepIndex");

      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[GEORouteMatcher currentLocation](self, "currentLocation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "coordinate");
        v13 = v12;
        v15 = v14;

        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        v16 = self->_turnAroundManeuverInfos;
        v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v17)
        {
          v18 = *(_QWORD *)v29;
          do
          {
            v19 = 0;
            do
            {
              if (*(_QWORD *)v29 != v18)
                objc_enumerationMutation(v16);
              v20 = *(_QWORD **)(*((_QWORD *)&v28 + 1) + 8 * v19);
              if (v20)
                v21 = (void *)v20[1];
              else
                v21 = 0;
              v22 = v21;
              objc_msgSend(v22, "endGeoCoordinate", (_QWORD)v28);
              v24 = v23;
              v26 = v25;

              if (GEOCalculateDistanceRadius(v13, v15, v24, v26, 6367000.0) < 20.0)
              {
                objc_storeStrong((id *)p_nearbyTurnAroundManeuverInfo, v20);
                goto LABEL_18;
              }
              ++v19;
            }
            while (v17 != v19);
            v27 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
            v17 = v27;
          }
          while (v27);
        }
LABEL_18:

      }
    }
  }
}

- (void)_resetExpectedCoordinateRangeIfNecessary
{
  uint64_t v3;
  unsigned __int8 *v4;
  int v5;
  _QWORD *v6;
  uint64_t v7;
  double v8;

  if ((unint64_t)-[NSMutableArray count](self->_recentLocations, "count") >= 0xF)
  {
    v3 = -1;
    while (1)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_recentLocations, "objectAtIndexedSubscript:", -[NSMutableArray count](self->_recentLocations, "count") + v3);
      v4 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v5 = v4[8];

        if (v5)
          break;
      }
      if (--v3 == -16)
      {
        -[GEORouteMatcher closestCandidateRouteMatch](self, "closestCandidateRouteMatch");
        v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        if (v6)
          v7 = v6[3];
        else
          v7 = 0;

        -[GEOWalkingRouteMatcher _followingRouteScoreForRouteCoordinate:](self, "_followingRouteScoreForRouteCoordinate:", v7);
        if (v8 > 0.75)
          -[GEOWalkingRouteMatcher _resetExpectedCoordinateRange](self, "_resetExpectedCoordinateRange");
        return;
      }
    }
  }
}

- (void)_resetExpectedCoordinateRange
{
  void *v3;
  _QWORD *v4;
  PolylineCoordinate v5;
  uint64_t *p_expectedCoordinateRange;
  NSObject *v7;
  double v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[GEORouteMatcher route](self, "route");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORouteMatcher closestCandidateRouteMatch](self, "closestCandidateRouteMatch");
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = (PolylineCoordinate)v4[3];
  else
    v5 = 0;

  self->_lastReferenceCoordinate = v5;
  p_expectedCoordinateRange = (uint64_t *)&self->_expectedCoordinateRange;
  self->_expectedCoordinateRange.start = (PolylineCoordinate)objc_msgSend(v3, "routeCoordinateForDistance:beforeRouteCoordinate:", v5, 50.0);
  self->_expectedCoordinateRange.end = (PolylineCoordinate)objc_msgSend(v3, "routeCoordinateForDistance:afterRouteCoordinate:", v5, 50.0);
  self->_possibleCoordinateRange = self->_expectedCoordinateRange;
  self->_tolerableCoordinateRange = self->_expectedCoordinateRange;
  if (qword_1EDF510F8 != -1)
    dispatch_once(&qword_1EDF510F8, &__block_literal_global_73);
  v7 = (id)_MergedGlobals_65;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    GEOPolylineCoordinateRangeAsString(*p_expectedCoordinateRange, p_expectedCoordinateRange[1], v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v9;
    _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_ERROR, "Resetting the expected coordinate range to [%@] because we think the user is following the route.", (uint8_t *)&v10, 0xCu);

  }
}

- (void)_startRouteMatch
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  PolylineCoordinate v9;
  _GEOWalkingRouteMatcherTurnAroundManeuverInfo *nearbyTurnAroundManeuverInfo;
  GEOComposedRouteStep *v11;
  uint64_t v12;
  BOOL v13;
  PolylineCoordinate v14;
  PolylineCoordinate lastReferenceCoordinate;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  id v28;

  -[GEORouteMatcher lastGoodRouteMatch](self, "lastGoodRouteMatch");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  -[GEORouteMatcher route](self, "route");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueRouteID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "route");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueRouteID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqual:", v6);

  if ((v7 & 1) == 0)
  {

    v28 = 0;
  }
  -[GEOWalkingRouteMatcher _updateNearbyTurnAroundManeuver](self, "_updateNearbyTurnAroundManeuver");
  if (!v28)
  {
    self->_expectedCoordinateRange = (GEOPolylineCoordinateRange)GEOPolylineCoordinateRangeInvalid;
    self->_possibleCoordinateRange = (GEOPolylineCoordinateRange)GEOPolylineCoordinateRangeInvalid;
    self->_tolerableCoordinateRange = (GEOPolylineCoordinateRange)GEOPolylineCoordinateRangeInvalid;
    self->_lastReferenceCoordinate = (PolylineCoordinate)0xBF80000000000000;
    goto LABEL_21;
  }
  v8 = objc_msgSend(v28, "routeCoordinate");
  v9 = (PolylineCoordinate)v8;
  nearbyTurnAroundManeuverInfo = self->_nearbyTurnAroundManeuverInfo;
  if (nearbyTurnAroundManeuverInfo)
  {
    v11 = nearbyTurnAroundManeuverInfo->_step;
    v12 = -[GEOComposedRouteStep endRouteCoordinate](v11, "endRouteCoordinate");
    if ((_DWORD)v12)
      v13 = 0;
    else
      v13 = *((float *)&v12 + 1) <= -1.0;
    if (v13)
      v14 = (PolylineCoordinate)0xBF80000000000000;
    else
      v14 = (PolylineCoordinate)v12;

    goto LABEL_20;
  }
  lastReferenceCoordinate = self->_lastReferenceCoordinate;
  v14 = (PolylineCoordinate)v8;
  if (lastReferenceCoordinate.offset >= 0.0)
  {
    if ((_DWORD)v8 == lastReferenceCoordinate.index)
    {
      v14 = (PolylineCoordinate)v8;
      if (*((float *)&v8 + 1) == lastReferenceCoordinate.offset)
        goto LABEL_20;
      v14 = (PolylineCoordinate)v8;
      if (*((float *)&v8 + 1) >= lastReferenceCoordinate.offset)
        goto LABEL_20;
      goto LABEL_19;
    }
    v14 = (PolylineCoordinate)v8;
    if (v8 < lastReferenceCoordinate.index)
LABEL_19:
      v14 = self->_lastReferenceCoordinate;
  }
LABEL_20:
  -[GEORouteMatcher currentLocation](self, "currentLocation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "timestamp");
  v18 = v17;
  objc_msgSend(v28, "timestamp");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "timeIntervalSinceReferenceDate");
  v21 = v20;

  objc_msgSend(v16, "speed");
  v23 = v22;
  objc_msgSend(v16, "horizontalAccuracy");
  v25 = v24 + v23 * (v18 - v21);
  self->_expectedCoordinateRange.end = (PolylineCoordinate)objc_msgSend(v3, "routeCoordinateForDistance:afterRouteCoordinate:", v14, v25 + 25.0);
  self->_possibleCoordinateRange.end = (PolylineCoordinate)objc_msgSend(v3, "routeCoordinateForDistance:afterRouteCoordinate:", v14, v25 + 50.0);
  self->_tolerableCoordinateRange.end = (PolylineCoordinate)objc_msgSend(v3, "routeCoordinateForDistance:afterRouteCoordinate:", v14, v25 + 250.0);
  self->_expectedCoordinateRange.start = (PolylineCoordinate)objc_msgSend(v3, "routeCoordinateForDistance:beforeRouteCoordinate:", v9, v25 + 0.0);
  self->_possibleCoordinateRange.start = (PolylineCoordinate)objc_msgSend(v3, "routeCoordinateForDistance:beforeRouteCoordinate:", v9, v25 + 10.0);
  self->_tolerableCoordinateRange.start = (PolylineCoordinate)objc_msgSend(v3, "routeCoordinateForDistance:beforeRouteCoordinate:", v9, v25 + 100.0);
  self->_lastReferenceCoordinate = v9;

LABEL_21:
  -[GEOWalkingRouteMatcher _resetExpectedCoordinateRangeIfNecessary](self, "_resetExpectedCoordinateRangeIfNecessary");
  -[GEORouteMatcher previousRouteMatch](self, "previousRouteMatch");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v26, "isGoodMatch"))
    v27 = 1000.0;
  else
    v27 = 1.79769313e308;

  -[GEORouteMatcher setMaxMatchDistanceFromPreviousRouteMatch:](self, "setMaxMatchDistanceFromPreviousRouteMatch:", v27);
}

- (id)_candidateForSegment:(id)a3 location:(id)a4 previousRouteMatch:(id)a5
{
  _QWORD *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  long double v17;
  double *v18;
  double *v19;
  double *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  _GEOCandidateRouteMatch *v26;
  _GEOCandidateRouteMatch *v27;
  void *v28;
  id v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v38;
  $AB5116BA7E623E054F959CECB034F4E7 v39;
  unint64_t v40;
  _QWORD v41[7];

  v41[6] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v40 = 0xBF80000000000000;
  objc_msgSend(v8, "coordinate");
  v17 = -[_GEORouteMatchingSegment distanceFromCoordinate:outCoordinateOnSegment:outRouteCoordinate:]((uint64_t)v7, &v39.latitude, (uint64_t)&v40, v9, v10, v11, v12, v13, v14, v15, v16);
  -[GEOWalkingRouteMatcher _distanceScoreInfoForSegment:location:distanceFromSegment:](self, "_distanceScoreInfoForSegment:location:distanceFromSegment:", v7, v8);
  v18 = (double *)objc_claimAutoreleasedReturnValue();
  -[GEOWalkingRouteMatcher _distanceTraveledScoreInfoForSegment:location:currentRouteCoordinate:](self, "_distanceTraveledScoreInfoForSegment:location:currentRouteCoordinate:", v7, v8, v40);
  v19 = (double *)objc_claimAutoreleasedReturnValue();
  -[GEOWalkingRouteMatcher _courseScoreInfoForSegment:location:currentRouteCoordinate:](self, "_courseScoreInfoForSegment:location:currentRouteCoordinate:", v7, v8, v40);
  v20 = (double *)objc_claimAutoreleasedReturnValue();
  -[GEOWalkingRouteMatcher _nearStartOfStepScoreInfoForSegment:location:currentRouteCoordinate:](self, "_nearStartOfStepScoreInfoForSegment:location:currentRouteCoordinate:", v7, v8, v40);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOWalkingRouteMatcher _nearTurnAroundManeuverScoreInfoForSegment:location:currentRouteCoordinate:](self, "_nearTurnAroundManeuverScoreInfoForSegment:location:currentRouteCoordinate:", v7, v8, v40);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOWalkingRouteMatcher _firstTimeOnRouteScoreInfoForSegment:location:currentRouteCoordinate:](self, "_firstTimeOnRouteScoreInfoForSegment:location:currentRouteCoordinate:", v7, v8, v40);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v18;
  v41[1] = v19;
  v41[2] = v20;
  v41[3] = v38;
  v41[4] = v21;
  v41[5] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOWalkingRouteMatcher _scoreForCandidateWithScoreInfos:](self, "_scoreForCandidateWithScoreInfos:", v23);
  v25 = v24;
  v26 = objc_alloc_init(_GEOCandidateRouteMatch);
  v27 = v26;
  if (v26)
  {
    v26->_isGoodMatch = v25 > 0.0;
    v26->_score = v25;
    v26->_distanceFromRoute = v17;
    v26->_routeCoordinate = (PolylineCoordinate)v40;
    v26->_locationCoordinate = v39;
  }
  if (v7)
    v28 = (void *)v7[7];
  else
    v28 = 0;
  v29 = v28;
  v30 = objc_msgSend(v29, "stepIndex");
  if (v27)
    v27->_stepIndex = v30;

  if (v18)
  {
    v31 = v18[1];
    if (!v27)
      goto LABEL_10;
    goto LABEL_9;
  }
  v31 = 0.0;
  if (v27)
LABEL_9:
    v27->_distanceMatchScore = v31;
LABEL_10:
  if (v18)
  {
    v32 = v18[2];
    if (!v27)
      goto LABEL_13;
    goto LABEL_12;
  }
  v32 = 0.0;
  if (v27)
LABEL_12:
    v27->_distanceWeight = v32;
LABEL_13:
  if (v19)
  {
    v33 = v19[1];
    if (!v27)
      goto LABEL_16;
    goto LABEL_15;
  }
  v33 = 0.0;
  if (v27)
LABEL_15:
    v27->_distanceTraveledMatchScore = v33;
LABEL_16:
  if (v19)
  {
    v34 = v19[2];
    if (!v27)
      goto LABEL_19;
    goto LABEL_18;
  }
  v34 = 0.0;
  if (v27)
LABEL_18:
    v27->_distanceTraveledWeight = v34;
LABEL_19:
  if (v20)
  {
    v35 = v20[1];
    if (!v27)
      goto LABEL_22;
    goto LABEL_21;
  }
  v35 = 0.0;
  if (v27)
LABEL_21:
    v27->_courseMatchScore = v35;
LABEL_22:
  if (!v20)
  {
    v36 = 0.0;
    if (!v27)
      goto LABEL_25;
    goto LABEL_24;
  }
  v36 = v20[2];
  if (v27)
LABEL_24:
    v27->_courseWeight = v36;
LABEL_25:

  return v27;
}

- (void)_finishRouteMatch:(id)a3 previousRouteMatch:(id)a4 forLocation:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  objc_super v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[GEOWalkingRouteMatcher _addRecentLocation:isOnRoute:](self, "_addRecentLocation:isOnRoute:", v10, objc_msgSend(v8, "isGoodMatch"));
  v11 = objc_msgSend(v8, "routeCoordinate");
  -[GEORouteMatcher roadWidthForRouteCoordinate:](self, "roadWidthForRouteCoordinate:", v11);
  v13 = v12;
  objc_msgSend(v10, "horizontalAccuracy");
  v15 = v14;
  v16 = -1.0;
  if (v15 >= 0.0)
  {
    objc_msgSend(v10, "horizontalAccuracy", -1.0);
    v16 = v17 + v13 * 0.5;
  }
  objc_msgSend(v8, "setModifiedHorizontalAccuracy:", v16);
  objc_msgSend(v8, "setModifiedCourseAccuracy:", -1.0);
  if ((objc_msgSend(v8, "isGoodMatch") & 1) == 0)
  {
    objc_msgSend(v10, "horizontalAccuracy");
    -[GEOWalkingRouteMatcher _maxMatchDistance:routeCoordinate:previousMatchGood:](self, "_maxMatchDistance:routeCoordinate:previousMatchGood:", v11, 0);
    objc_msgSend(v8, "updateOffRouteProgress:minDistanceToGetOnRoute:", v9);
    -[GEORouteMatcher route](self, "route");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v18, "source") & 0xFFFFFFFFFFFFFFFELL) != 2)
    {
LABEL_9:

      goto LABEL_10;
    }
    -[GEORouteMatcher closestCandidateRouteMatch](self, "closestCandidateRouteMatch");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      -[GEORouteMatcher closestCandidateRouteMatch](self, "closestCandidateRouteMatch");
      v20 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v20;
      if (v20)
        v21 = *(double *)(v20 + 56);
      else
        v21 = 0.0;
      objc_msgSend(v8, "setDistanceFromRoute:", v21);
      goto LABEL_9;
    }
  }
LABEL_10:
  if (objc_msgSend(v9, "isGoodMatch"))
  {
    if (objc_msgSend(v8, "isGoodMatch"))
    {
      v22 = objc_msgSend(v8, "stepIndex");
      if (v22 != objc_msgSend(v9, "stepIndex"))
      {
        v23 = self->_newStepProgressions + 1;
        self->_newStepProgressions = v23;
        if (v23 < 5)
          goto LABEL_17;
        -[GEORouteMatcher route](self, "route");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "step");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v24, "coordinateAtOffset:fromRoutePoint:", objc_msgSend(v25, "startPointIndex"), 12.0);

        v27 = objc_msgSend(v8, "routeCoordinate");
        if (v27 < v26
          || (_DWORD)v27 == (_DWORD)v26 && *((float *)&v27 + 1) < *((float *)&v26 + 1))
        {
LABEL_17:
          objc_msgSend(v8, "setStepIndex:", objc_msgSend(v9, "stepIndex"));
        }
        else
        {
          self->_newStepProgressions = 0;
        }
      }
    }
  }
  v28.receiver = self;
  v28.super_class = (Class)GEOWalkingRouteMatcher;
  -[GEORouteMatcher _finishRouteMatch:previousRouteMatch:forLocation:](&v28, sel__finishRouteMatch_previousRouteMatch_forLocation_, v8, v9, v10);

}

- (BOOL)_supportsSnapping
{
  void *v3;
  char v4;
  void *v5;

  -[GEORouteMatcher route](self, "route");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "usesZilch") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[GEORouteMatcher route](self, "route");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "usesRoutingPathPoints");

  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentLocations, 0);
  objc_storeStrong((id *)&self->_nearbyTurnAroundManeuverInfo, 0);
  objc_storeStrong((id *)&self->_turnAroundManeuverInfos, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 15) = 0xBF80000000000000;
  *((_QWORD *)self + 16) = 0xBF80000000000000;
  *((_DWORD *)self + 34) = 0;
  *(_QWORD *)((char *)self + 140) = 3212836864;
  *((_DWORD *)self + 37) = -1082130432;
  *((_DWORD *)self + 38) = 0;
  *(_QWORD *)((char *)self + 156) = 3212836864;
  *((_DWORD *)self + 41) = -1082130432;
  *((_DWORD *)self + 42) = 0;
  *((_DWORD *)self + 43) = -1082130432;
  return self;
}

- (void)_addRecentLocation:(id)a3 isOnRoute:(BOOL)a4
{
  NSMutableArray *v7;
  NSMutableArray *recentLocations;
  uint64_t v9;
  _BYTE *v10;
  id v11;

  v11 = a3;
  if (!self->_recentLocations)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    recentLocations = self->_recentLocations;
    self->_recentLocations = v7;

  }
  v9 = objc_opt_new();
  v10 = (_BYTE *)v9;
  if (v9)
  {
    objc_storeStrong((id *)(v9 + 16), a3);
    v10[8] = a4;
  }
  -[NSMutableArray addObject:](self->_recentLocations, "addObject:", v10);
  while ((unint64_t)-[NSMutableArray count](self->_recentLocations, "count") >= 0x3D)
    -[NSMutableArray removeObjectsInRange:](self->_recentLocations, "removeObjectsInRange:", 0, -[NSMutableArray count](self->_recentLocations, "count") - 60);

}

- (double)_followingRouteScoreForRouteCoordinate:(PolylineCoordinate)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  id v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  PolylineCoordinate v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (!-[NSMutableArray count](self->_recentLocations, "count"))
    return 0.0;
  -[GEORouteMatcher route](self, "route");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORouteMatcher currentLocation](self, "currentLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "coordinate");
  v8 = v7;
  v10 = v9;

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[NSMutableArray reverseObjectEnumerator](self->_recentLocations, "reverseObjectEnumerator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v36;
    v14 = 0.0;
    do
    {
      v15 = 0;
      do
      {
        v16 = v8;
        v17 = v10;
        if (*(_QWORD *)v36 != v13)
          objc_enumerationMutation(v11);
        v18 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v15);
        if (v18)
          v19 = *(void **)(v18 + 16);
        else
          v19 = 0;
        v20 = v19;
        objc_msgSend(v20, "coordinate");
        v8 = v21;
        v10 = v22;

        v23 = GEOCalculateDistanceRadius(v8, v10, v16, v17, 6367000.0);
        v24 = objc_msgSend(v5, "routeCoordinateForDistance:beforeRouteCoordinate:", a3, v23 + 30.0);
        v25 = objc_msgSend(v5, "routeCoordinateForDistance:beforeRouteCoordinate:", a3, v23 + -10.0);
        v34 = (PolylineCoordinate)0xBF80000000000000;
        if (v18)
          v26 = *(void **)(v18 + 16);
        else
          v26 = 0;
        v27 = v26;
        -[GEOWalkingRouteMatcher _distanceFromRouteForLocation:withinRange:outRouteCoordinate:](self, "_distanceFromRouteForLocation:withinRange:outRouteCoordinate:", v27, v24, v25, &v34);
        v29 = v28;

        v30 = -1.0;
        if (v29 <= 15.0)
        {
          objc_msgSend(v5, "distanceBetweenRouteCoordinate:andRouteCoordinate:", v34, a3);
          if (v31 < 13.8)
          {
            v30 = 1.0;
            if (v31 < 0.414)
            {
              if (v31 >= -0.207)
                v30 = 0.0;
              else
                v30 = -1.0;
            }
          }
        }
        v14 = v14 + v30;
        a3 = v34;
        ++v15;
      }
      while (v12 != v15);
      v32 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      v12 = v32;
    }
    while (v32);
  }
  else
  {
    v14 = 0.0;
  }

  return v14 / 60.0;
}

- (double)_distanceFromRouteForLocation:(id)a3 withinRange:(GEOPolylineCoordinateRange)a4 outRouteCoordinate:(PolylineCoordinate *)a5
{
  PolylineCoordinate end;
  PolylineCoordinate start;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  PolylineCoordinate v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  _GEORouteMatchingSegment *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  _GEORouteMatchingSegment *v35;
  float v36;
  double v37;
  unint64_t v38;
  unint64_t v40;

  end = a4.end;
  start = a4.start;
  v9 = a3;
  -[GEORouteMatcher route](self, "route");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "coordinate");
  v12 = v11;
  v14 = v13;
  +[GEOPolylineCoordinateIterator iteratorWithRange:](GEOPolylineCoordinateIterator, "iteratorWithRange:", start, end);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "advance");
  v16 = 1.79769313e308;
  v17 = (PolylineCoordinate)0xBF80000000000000;
  while (objc_msgSend(v15, "isCurrentValid"))
  {
    v18 = objc_msgSend(v15, "previous");
    v19 = objc_msgSend(v15, "current");
    objc_msgSend(v10, "pointAtRouteCoordinate:", v18);
    v21 = v20;
    v23 = v22;
    objc_msgSend(v10, "pointAtRouteCoordinate:", v19);
    v25 = v24;
    v27 = v26;
    v28 = objc_alloc_init(_GEORouteMatchingSegment);
    v35 = v28;
    if (v28)
    {
      v36 = *((float *)&v19 + 1);
      *(_QWORD *)&v28->_startPointIndex = v18;
      if (v19 > v18)
        v36 = 1.0;
      v28->_endRouteCoordinateOffset = v36;
      v28->_startCoordinate.latitude = v21;
      v28->_startCoordinate.longitude = v23;
      v28->_endCoordinate.latitude = v25;
      v28->_endCoordinate.longitude = v27;
    }
    v40 = 0xBF80000000000000;
    v37 = -[_GEORouteMatchingSegment distanceFromCoordinate:outCoordinateOnSegment:outRouteCoordinate:]((uint64_t)v28, 0, (uint64_t)&v40, v12, v14, v29, v30, v31, v32, v33, v34);
    v38 = v40;
    objc_msgSend(v15, "advance");
    if (v37 < v16)
    {
      v16 = v37;
      v17 = (PolylineCoordinate)v38;
    }

  }
  if (a5)
    *a5 = v17;

  return v16;
}

@end
