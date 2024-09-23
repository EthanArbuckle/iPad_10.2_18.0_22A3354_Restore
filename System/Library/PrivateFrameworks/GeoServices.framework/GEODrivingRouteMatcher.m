@implementation GEODrivingRouteMatcher

- (GEODrivingRouteMatcher)initWithRoute:(id)a3 auditToken:(id)a4
{
  id v6;
  id v7;
  GEODrivingRouteMatcher *v8;
  GEODrivingRouteMatcher *v9;
  GEODrivingRouteMatcher *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GEODrivingRouteMatcher;
  v8 = -[GEORouteMatcher initWithRoute:auditToken:](&v12, sel_initWithRoute_auditToken_, v6, v7);
  v9 = v8;
  if (v8)
  {
    -[GEORouteMatcher setShouldSnapRouteMatchToRoute:](v8, "setShouldSnapRouteMatchToRoute:", 1);
    v9->_differentLegScorePenalty = GEOConfigGetDouble(GeoServicesConfig_NavdRouteMatchDifferentLegScorePenalty, (uint64_t)off_1EDF4DA48);
    v10 = v9;
  }

  return v9;
}

- (id)_candidateForSegment:(id)a3 location:(id)a4 previousRouteMatch:(id)a5
{
  _QWORD *v8;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  int v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  id v30;
  id v31;
  double v32;
  double v33;
  double v34;
  double v35;
  char v36;
  uint64_t v37;
  double v38;
  double v39;
  void *v40;
  id v41;
  uint64_t v42;
  double v43;
  double v44;
  double v45;
  long double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  uint64_t v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  float v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  void *v78;
  void *v79;
  uint64_t v80;
  BOOL v81;
  double v82;
  char v83;
  uint64_t v84;
  BOOL v85;
  uint64_t v86;
  double v87;
  char v88;
  _GEOCandidateRouteMatch *v89;
  BOOL v90;
  void *v91;
  void *v92;
  id v93;
  uint64_t v94;
  double v96;
  double v97;
  double v98;
  double v99;
  $AB5116BA7E623E054F959CECB034F4E7 v100;
  unint64_t v101;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v101 = 0xBF80000000000000;
  -[GEODrivingRouteMatcher _coordinateFromLocation:](self, "_coordinateFromLocation:", v9);
  v19 = -[_GEORouteMatchingSegment distanceFromCoordinate:outCoordinateOnSegment:outRouteCoordinate:]((uint64_t)v8, &v100.latitude, (uint64_t)&v101, v11, v12, v13, v14, v15, v16, v17, v18);
  objc_msgSend(v10, "road");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 978307200.0;
  if (v20)
  {
    objc_msgSend(v10, "road");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isTunnel");

    if (v23)
    {
      objc_msgSend(v9, "timestamp");
      v25 = v24;
      objc_msgSend(v10, "timestamp");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "timeIntervalSinceReferenceDate");
      v21 = v25 - v27;

    }
  }
  objc_msgSend(v9, "horizontalAccuracy");
  -[GEODrivingRouteMatcher _maxMatchDistance:routeCoordinate:previousRouteMatch:timeSinceTunnel:](self, "_maxMatchDistance:routeCoordinate:previousRouteMatch:timeSinceTunnel:", v101, v10);
  v99 = v28;
  -[GEODrivingRouteMatcher _maxCourseDelta:previousRouteMatch:timeSinceTunnel:](self, "_maxCourseDelta:previousRouteMatch:timeSinceTunnel:", v9, v10, v21);
  v98 = v29;
  v30 = v9;
  v31 = v10;
  objc_msgSend(v30, "course");
  if (v32 < 0.0
    || (objc_msgSend(v30, "courseAccuracy"), v33 < 0.0)
    || (objc_msgSend(v30, "courseAccuracy"), v34 >= 180.0))
  {
    v37 = 0;
    v36 = 1;
  }
  else
  {
    if (objc_msgSend(v31, "isGoodMatch"))
    {
      objc_msgSend(v30, "speedAccuracy");
      if (v35 < 0.0)
      {
        v36 = 0;
        v37 = 1;
        goto LABEL_11;
      }
      objc_msgSend(v30, "speed");
      v36 = 0;
      v37 = 1;
      if (v21 < 30.0 || v96 < 3.0)
        goto LABEL_11;
    }
    v36 = 0;
    v37 = 2;
  }
LABEL_11:

  -[GEODrivingRouteMatcher _courseFromLocation:](self, "_courseFromLocation:", v30);
  v39 = v38;
  -[GEORouteMatcher route](self, "route");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v40;
  if (v8)
    v42 = *((unsigned int *)v8 + 2);
  else
    v42 = 0;
  objc_msgSend(v40, "courseAtRouteCoordinateIndex:", v42);
  v44 = v43;

  v45 = -1.0;
  if (v39 >= 0.0)
  {
    v46 = fmod(v39 - v44 + 180.0, 360.0);
    v45 = fabs(fmod(v46 + 360.0, 360.0) + -180.0);
  }
  v47 = (v99 - v19) / v99;
  if (v47 <= 0.0)
    v48 = -100.0;
  else
    v48 = 1.0;
  if (v19 >= v99)
  {
    v50 = -18000.0;
  }
  else
  {
    objc_msgSend(v30, "courseAccuracy");
    v50 = -0.5;
    if ((v36 & 1) == 0)
    {
      v50 = 1.0;
      if (v45 > v49)
      {
        v51 = (v98 - v45) / v98;
        v52 = 0.5;
        if (v45 < 30.0)
          v52 = 1.0;
        if (v51 <= 0.0)
          v52 = -100.0;
        v50 = v51 * v51 * v52;
      }
    }
  }
  if (objc_msgSend(v31, "isGoodMatch"))
  {
    -[GEORouteMatcher route](self, "route");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = v48;
    v54 = objc_msgSend(v31, "routeCoordinate");
    objc_msgSend(v53, "stepDistanceFromPoint:toPoint:", v54, v101);
    v56 = v55;

    objc_msgSend(v30, "timestamp");
    v58 = v57;
    objc_msgSend(v31, "timestamp");
    v41 = (id)objc_claimAutoreleasedReturnValue();
    v59 = v19;
    objc_msgSend(v41, "timeIntervalSinceReferenceDate");
    v61 = v60;

    objc_msgSend(v30, "speed");
    v63 = v62;
    objc_msgSend(v30, "speedAccuracy");
    v64 = fabs(v56);
    v66 = fmax((v58 - v61) * (v63 + v65), 4.4704);
    v67 = v66 * 3.0;
    v68 = v66 * 5.0;
    v69 = 0.0;
    if (v67 != v68)
    {
      if (v67 <= v64)
        v70 = v64;
      else
        v70 = v67;
      if (v70 > v68)
        v70 = v68;
      v71 = (v70 - v67) / (v68 - v67);
      v69 = v71;
    }
    v72 = 1.0 - v69;
    v19 = v59;
    v73 = v64;
    v48 = v97;
  }
  else
  {
    v72 = 1.0;
    v73 = 0.0;
  }
  -[GEODrivingRouteMatcher _courseWeightForLocation:accuracyType:](self, "_courseWeightForLocation:accuracyType:", v30, v37);
  v75 = v74;
  v76 = fabs(v47) * v48;
  v77 = (v50 * v75 + v76 * 0.65 + v72 * 0.1) / (v75 + 0.65 + 0.1);
  if (-[GEORouteMatcher targetLegIndex](self, "targetLegIndex") != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[GEORouteMatcher route](self, "route");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = v8 ? (void *)v8[7] : 0;
    v41 = v79;
    v80 = objc_msgSend(v78, "legIndexForStepIndex:", objc_msgSend(v41, "stepIndex"));

    if (v80 != -[GEORouteMatcher targetLegIndex](self, "targetLegIndex"))
      v77 = v77 - self->_differentLegScorePenalty;
  }
  v81 = v77 >= 0.0;
  if (-[GEORouteMatcher useStrictInitialOnRouteCriteria](self, "useStrictInitialOnRouteCriteria")
    && (!v31 || (objc_msgSend(v31, "isGoodMatch") & 1) == 0))
  {
    objc_msgSend(v30, "speed");
    if (v82 >= 9.0)
    {
      v83 = 1;
      if (v31)
      {
LABEL_47:
        v84 = objc_msgSend(v31, "routeCoordinate");
        if (v101 > v84
          || (v85 = 0, (_DWORD)v101 == (_DWORD)v84) && *((float *)&v101 + 1) > *((float *)&v84 + 1))
        {
          v86 = objc_msgSend(v31, "consecutiveProgressionsOffRoute");
          v85 = 0;
          if ((unint64_t)(v86 - 3) <= 0xFFFFFFFFFFFFFFFBLL && v19 <= 30.0)
          {
            objc_msgSend(v31, "distanceTraveledOffRoute");
            v85 = v87 >= 13.0;
          }
        }
        goto LABEL_55;
      }
    }
    else
    {
      v83 = objc_msgSend(v30, "isMatchedLocation");
      if (v31)
        goto LABEL_47;
    }
    v85 = 0;
LABEL_55:
    v88 = v83 | v85;
    if (v77 >= 0.0)
      v81 = v88;
    else
      v81 = 0;
  }
  v89 = objc_alloc_init(_GEOCandidateRouteMatch);
  if (v81)
  {
    v90 = 1;
  }
  else
  {
    if (v8)
      v91 = (void *)v8[7];
    else
      v91 = 0;
    v41 = v91;
    v90 = objc_msgSend(v41, "routeSegmentType") == 3;
  }
  if (v89)
    v89->_isGoodMatch = v90;
  if (!v81)

  if (v89)
  {
    v89->_score = v77;
    v89->_routeCoordinate = (PolylineCoordinate)v101;
    v89->_locationCoordinate = v100;
  }
  if (v8)
    v92 = (void *)v8[7];
  else
    v92 = 0;
  v93 = v92;
  v94 = objc_msgSend(v93, "stepIndex");
  if (v89)
  {
    v89->_stepIndex = v94;

    v89->_distanceFromRoute = v19;
    v89->_maxDistance = v99;
    v89->_distanceMatchScore = v76;
    v89->_distanceWeight = 0.65;
    v89->_courseDelta = v45;
    v89->_maxCourseDelta = v98;
    v89->_courseMatchScore = v50;
    v89->_courseWeight = v75;
    v89->_distanceAlongRouteFromPreviousMatch = v73;
  }
  else
  {

  }
  return v89;
}

- (double)_maxMatchDistance:(double)a3 routeCoordinate:(PolylineCoordinate)a4 previousRouteMatch:(id)a5 timeSinceTunnel:(double)a6
{
  id v10;
  double v11;
  double v12;
  double v13;
  int v14;
  double v15;
  double v16;

  v10 = a5;
  -[GEODrivingRouteMatcher _modifiedHorizontalAccuracy:routeCoordinate:](self, "_modifiedHorizontalAccuracy:routeCoordinate:", a4, a3);
  v12 = v11;
  if (v10)
  {
    if (v11 >= 0.0)
    {
      v14 = objc_msgSend(v10, "isGoodMatch");
      v15 = 30.0;
      if (a6 > 30.0)
        v15 = 0.0;
      v16 = v15 + v12 * 1.6;
      if (v14)
        v16 = v16 + 15.0;
      v12 = fmin(v16, 1000.0);
    }
    else
    {
      v12 = 1000.0;
    }
  }
  else if (v11 < 0.0)
  {
    -[GEORouteMatcher roadWidthForRouteCoordinate:](self, "roadWidthForRouteCoordinate:", a4);
    v12 = v13;
  }

  return v12;
}

- (double)_courseWeightForLocation:(id)a3 accuracyType:(int64_t)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  float v11;

  v5 = a3;
  v6 = v5;
  v7 = 0.15;
  if (a4 == 2)
  {
    objc_msgSend(v5, "speed");
    if (v8 >= 3.0)
    {
      objc_msgSend(v6, "speed");
      v10 = (v9 + -3.0) / 8.176;
      if (v10 < 0.0)
        v10 = 0.0;
      if (v10 > 1.0)
        v10 = 1.0;
      v11 = v10;
      v7 = v11 * 0.2 + 0.15;
    }
  }

  return v7;
}

- (double)_modifiedHorizontalAccuracy:(double)a3 routeCoordinate:(PolylineCoordinate)a4
{
  double result;
  double v6;

  result = -1.0;
  if (a3 >= 0.0)
  {
    -[GEORouteMatcher roadWidthForRouteCoordinate:](self, "roadWidthForRouteCoordinate:", a4, -1.0);
    return v6 + a3;
  }
  return result;
}

- (double)_modifiedCourseAccuracyForLocation:(id)a3 previousRouteMatch:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  long double v18;
  double v19;
  long double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  BOOL v27;
  double v28;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "courseAccuracy");
  v8 = -1.0;
  if (v9 >= 0.0)
  {
    objc_msgSend(v6, "courseAccuracy");
    v8 = v10 + 10.0;
    if (v10 + 10.0 > 0.0)
    {
      if (objc_msgSend(v7, "isGoodMatch"))
      {
        objc_msgSend(v6, "speed");
        if (v11 < 1.0)
        {
          objc_msgSend(v6, "timestamp");
          v13 = v12;
          objc_msgSend(v7, "timestamp");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "timeIntervalSinceReferenceDate");
          v16 = v15;

          -[GEODrivingRouteMatcher _courseFromLocation:](self, "_courseFromLocation:", v6);
          v18 = v17;
          objc_msgSend(v7, "matchedCourse");
          v20 = v19;
          v21 = v13 - v16;
          v22 = fmod(v18, 360.0);
          if (v22 >= 0.0)
            v23 = v22;
          else
            v23 = v22 + 360.0;
          v24 = fmod(v20, 360.0);
          if (v24 < 0.0)
            v24 = v24 + 360.0;
          v25 = v23 - v24;
          if (v25 >= -180.0)
          {
            if (v25 > 180.0)
              v25 = v25 + -360.0;
          }
          else
          {
            v25 = v25 + 360.0;
          }
          v26 = fabs(v25);
          v27 = v26 > 90.0 && v21 < 2.0;
          v28 = fmin(v8 + v26, 180.0);
          if (v27)
            v8 = v28;
        }
      }
    }
  }

  return v8;
}

- (double)_maxCourseDelta:(id)a3 previousRouteMatch:(id)a4 timeSinceTunnel:(double)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v15;
  double v16;
  double v17;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "courseAccuracy");
  v11 = v10;
  -[GEODrivingRouteMatcher _modifiedCourseAccuracyForLocation:previousRouteMatch:](self, "_modifiedCourseAccuracyForLocation:previousRouteMatch:", v8, v9);
  v13 = v12;
  if (objc_msgSend(v8, "isMatchedLocation"))
  {
    if (v11 > 20.0 || v11 < 0.0)
      v13 = 10.0;
  }
  else if (v13 >= 0.0)
  {
    if (a5 <= 30.0)
      v15 = 85.0;
    else
      v15 = 40.0;
    if (v9)
    {
      if (objc_msgSend(v9, "isGoodMatch"))
      {
        objc_msgSend(v8, "speedAccuracy");
        if (v16 < 0.0 || (objc_msgSend(v8, "speed"), v17 < 3.0))
          v15 = 90.0;
      }
    }
    v13 = fmin(v13 + v15, 180.0);
  }
  else
  {
    v13 = 180.0;
  }

  return v13;
}

- (id)_startStepForPreviousRouteMatch:(id)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = -[GEORouteMatcher targetLegIndex](self, "targetLegIndex", a3);
  -[GEORouteMatcher route](self, "route");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "legs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 >= objc_msgSend(v6, "count"))
    v7 = 0;
  else
    v7 = -[GEORouteMatcher targetLegIndex](self, "targetLegIndex");

  -[GEORouteMatcher route](self, "route");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "legs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[GEORouteMatcher route](self, "route");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "steps");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v10, "startStepIndex"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)_finishRouteMatch:(id)a3 previousRouteMatch:(id)a4 forLocation:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  int v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  objc_super v39;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "horizontalAccuracy");
  -[GEODrivingRouteMatcher _modifiedHorizontalAccuracy:routeCoordinate:](self, "_modifiedHorizontalAccuracy:routeCoordinate:", objc_msgSend(v8, "routeCoordinate"), v11);
  objc_msgSend(v8, "setModifiedHorizontalAccuracy:");
  -[GEODrivingRouteMatcher _modifiedCourseAccuracyForLocation:previousRouteMatch:](self, "_modifiedCourseAccuracyForLocation:previousRouteMatch:", v10, v9);
  objc_msgSend(v8, "setModifiedCourseAccuracy:");
  objc_msgSend(v8, "updateOffRouteProgress:minDistanceToGetOnRoute:", v9, 30.0);
  v12 = objc_msgSend(v8, "isGoodMatch") ^ 1;
  if (!v9)
    LOBYTE(v12) = 1;
  if ((v12 & 1) == 0)
  {
    objc_msgSend(v10, "speedAccuracy");
    if (v13 >= 0.0)
    {
      objc_msgSend(v10, "speed");
      if (v14 > 0.0)
      {
        objc_msgSend(v8, "distanceFromRoute");
        v16 = v15;
        objc_msgSend(v9, "distanceFromRoute");
        if (v16 > v17)
        {
          objc_msgSend(v10, "horizontalAccuracy");
          if (v18 < 50.0)
          {
            v19 = objc_msgSend(v9, "routeCoordinate");
            v20 = objc_msgSend(v8, "routeCoordinate");
            if ((_DWORD)v19 == (_DWORD)v20 && vabds_f32(*((float *)&v19 + 1), *((float *)&v20 + 1)) < 0.00000011921)
            {
              objc_msgSend(v9, "distanceTraveledOffRoute");
              objc_msgSend(v8, "setDistanceTraveledOffRoute:");
              objc_msgSend(v8, "setConsecutiveProgressionsOffRoute:", objc_msgSend(v9, "consecutiveProgressionsOffRoute") + 1);
              v21 = (void *)MEMORY[0x1E0C99D68];
              objc_msgSend(v10, "timestamp");
              objc_msgSend(v21, "dateWithTimeIntervalSinceReferenceDate:");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "timestamp");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "timeIntervalSinceDate:", v23);
              v25 = v24;

              if (v25 > 0.0)
              {
                objc_msgSend(v10, "speed");
                v27 = v26;
                objc_msgSend(v8, "distanceFromRoute");
                v29 = v28;
                objc_msgSend(v9, "distanceFromRoute");
                if (v25 * v27 >= v29 - v30)
                {
                  objc_msgSend(v8, "distanceFromRoute");
                  v34 = v33;
                  objc_msgSend(v9, "distanceFromRoute");
                  v32 = v34 - v35;
                }
                else
                {
                  objc_msgSend(v10, "speed");
                  v32 = v25 * v31;
                }
                objc_msgSend(v8, "distanceTraveledOffRoute");
                objc_msgSend(v8, "setDistanceTraveledOffRoute:", v32 + v36);
              }
              objc_msgSend(v8, "distanceTraveledOffRoute");
              if (v37 >= 13.0)
              {
                objc_msgSend(v8, "distanceFromRoute");
                if (v38 >= 13.0 && (unint64_t)objc_msgSend(v8, "consecutiveProgressionsOffRoute") >= 3)
                  objc_msgSend(v8, "setIsGoodMatch:", 0);
              }

            }
          }
        }
      }
    }
  }
  v39.receiver = self;
  v39.super_class = (Class)GEODrivingRouteMatcher;
  -[GEORouteMatcher _finishRouteMatch:previousRouteMatch:forLocation:](&v39, sel__finishRouteMatch_previousRouteMatch_forLocation_, v8, v9, v10);

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

- ($F24F406B2B787EFB06265DBA3D28CBD5)_coordinateFromLocation:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  v4 = a3;
  if (-[GEORouteMatcher useMatchedCoordinateForMatching](self, "useMatchedCoordinateForMatching"))
    objc_msgSend(v4, "latLng");
  else
    objc_msgSend(v4, "rawCoordinate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "coordinate");
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.var1 = v11;
  result.var0 = v10;
  return result;
}

- (double)_courseFromLocation:(id)a3
{
  id v4;
  double v5;
  double v6;

  v4 = a3;
  if (-[GEORouteMatcher useMatchedCoordinateForMatching](self, "useMatchedCoordinateForMatching"))
    objc_msgSend(v4, "course");
  else
    objc_msgSend(v4, "rawCourse");
  v6 = v5;

  return v6;
}

@end
