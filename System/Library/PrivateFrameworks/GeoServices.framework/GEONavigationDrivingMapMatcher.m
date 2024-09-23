@implementation GEONavigationDrivingMapMatcher

- (id)matchLocation:(id)a3 transportType:(int)a4
{
  id v6;
  void *v7;
  int v8;
  int v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  GEORouteMatcher *v25;
  void *v26;
  void *v27;
  GEORouteMatcher *v28;
  void *v29;
  _BOOL4 v30;
  void *v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  BOOL v44;
  void *v45;
  int v46;
  double v47;
  int v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  long double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  void *v71;
  void *v73;
  double v74;
  double v75;
  _BOOL4 v76;
  double v77;
  double v78;
  double v79;
  double v80;
  long double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  long double v92;
  _BOOL4 v93;

  v6 = a3;
  -[GEONavigationMapMatcher route](self, "route");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "transportType");
  v9 = -[GEONavigationDrivingMapMatcher transportType](self, "transportType");

  if (v8 == v9)
  {
    objc_msgSend(v6, "horizontalAccuracy");
    if (v10 > 200.0)
    {
      -[GEONavigationMapMatcher previousMatchResult](self, "previousMatchResult");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        -[GEONavigationMapMatcher previousMatchResult](self, "previousMatchResult");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "type");

        if (v13)
        {
          if (v13 == 1)
          {
            -[GEONavigationMapMatcher previousMatchResult](self, "previousMatchResult");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "roadMatch");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            +[GEONavigationMatchResult matchResultWithRoadMatch:location:](GEONavigationMatchResult, "matchResultWithRoadMatch:location:", v53, v6);
            v54 = (void *)objc_claimAutoreleasedReturnValue();

            -[GEONavigationMapMatcher previousMatchResult](self, "previousMatchResult");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "routeMatch");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "setRouteMatch:", v16);
            v14 = v54;
          }
          else
          {
            if (v13 != 2)
            {
              v17 = 0;
              goto LABEL_44;
            }
            +[GEONavigationMatchResult matchResultWithRawLocation:](GEONavigationMatchResult, "matchResultWithRawLocation:", v6);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[GEONavigationMapMatcher previousMatchResult](self, "previousMatchResult");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "routeMatch");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setRouteMatch:", v16);
          }
        }
        else
        {
          -[GEONavigationMapMatcher previousMatchResult](self, "previousMatchResult");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "routeMatch");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          +[GEONavigationMatchResult matchResultWithRouteMatch:location:](GEONavigationMatchResult, "matchResultWithRouteMatch:location:", v16, v6);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
        }

        v17 = v14;
LABEL_44:
        objc_msgSend(v17, "setLocationUnreliable:", 1);
        -[GEONavigationMapMatcher setPreviousMatchResult:](self, "setPreviousMatchResult:", v17);
        goto LABEL_72;
      }
    }
    -[GEONavigationDrivingMapMatcher _effectiveLocationForLocation:](self, "_effectiveLocationForLocation:", v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEONavigationMapMatcher previousMatchResult](self, "previousMatchResult");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "routeMatch");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[GEONavigationMapMatcher route](self, "route");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      -[GEONavigationMapMatcher routeMatcher](self, "routeMatcher");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "matchToRouteWithLocation:previousRouteMatch:", v20, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
      {
        v25 = [GEORouteMatcher alloc];
        -[GEONavigationMapMatcher route](self, "route");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEONavigationMapMatcher auditToken](self, "auditToken");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = -[GEORouteMatcher initWithRoute:auditToken:](v25, "initWithRoute:auditToken:", v26, v27);

        -[GEORouteMatcher matchToClosestPointOnRouteWithLocation:](v28, "matchToClosestPointOnRouteWithLocation:", v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    objc_msgSend(v23, "detailedMatchInfo");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4 == 4)
    {
      v30 = 1;
      if (!v22)
        goto LABEL_21;
    }
    else
    {
      v30 = -[GEONavigationDrivingMapMatcher transportType](self, "transportType") == a4;
      if (!v22)
        goto LABEL_21;
    }
    if (objc_msgSend(v22, "isGoodMatch"))
    {
      -[GEONavigationMapMatcher previousMatchResult](self, "previousMatchResult");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "type");

      if (v30 || !v32 && (objc_msgSend(v23, "isGoodMatch") & 1) != 0)
      {
LABEL_22:
        objc_msgSend(v20, "horizontalAccuracy");
        v34 = v33;
        objc_msgSend(v20, "courseAccuracy");
        v35 = -1.0;
        v36 = -1.0;
        if (v37 >= 0.0)
        {
          objc_msgSend(v20, "courseAccuracy");
          v36 = v38 + 10.0;
        }
        if (v30)
        {
          -[GEONavigationMapMatcher roadMatcher](self, "roadMatcher");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = v39;
          if (v39 && v34 >= 0.0 && v34 <= 65.0)
          {
            objc_msgSend(v20, "course");
            v42 = v41;

            if (v42 >= 0.0)
            {
              -[GEONavigationMapMatcher previousMatchResult](self, "previousMatchResult");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v43, "type") != 2)
              {

                goto LABEL_74;
              }
              objc_msgSend(v23, "distanceFromRoute");
              v44 = -[GEONavigationDrivingMapMatcher _locationMeetsSpeedThresholdForRoadMatch:distanceFromRoute:](self, "_locationMeetsSpeedThresholdForRoadMatch:distanceFromRoute:", v20);

              if (v44)
              {
LABEL_74:
                -[GEONavigationMapMatcher roadMatcher](self, "roadMatcher");
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v73, "matchLocation:forTransportType:", v20, -[GEONavigationDrivingMapMatcher transportType](self, "transportType"));
                v45 = (void *)objc_claimAutoreleasedReturnValue();

                if (v45)
                {
                  if (v36 >= 0.0)
                    v74 = v36 + 10.0;
                  else
                    v74 = 10.0;
                  objc_msgSend(v45, "distanceFromRoad");
                  v35 = v75;
                  v76 = v75 < v34 + 20.0;
                  -[GEONavigationDrivingMapMatcher _courseFromLocation:](self, "_courseFromLocation:", v20);
                  v78 = v77;
                  if (v77 >= 0.0)
                  {
                    objc_msgSend(v45, "courseOnRoad");
                    v76 = v35 < v34 + 20.0;
                    v81 = fmod(v80 - v78 + 180.0, 360.0);
                    v47 = fabs(fmod(v81 + 360.0, 360.0) + -180.0);
                    if (v47 >= v74)
                      v76 = 0;
                    v79 = 10.0;
                  }
                  else
                  {
                    v79 = 30.0;
                    v47 = -1.0;
                  }
                  objc_msgSend(v23, "locationCoordinate3D");
                  v83 = v82;
                  v85 = v84;
                  objc_msgSend(v45, "coordinateOnRoad");
                  v88 = GEOCalculateDistanceRadius(v83, v85, v86, v87, 6367000.0);
                  objc_msgSend(v23, "matchedCourse");
                  v90 = v89;
                  objc_msgSend(v45, "courseOnRoad");
                  v92 = fmod(v91 - v90 + 180.0, 360.0);
                  v93 = fabs(fmod(v92 + 360.0, 360.0) + -180.0) > 30.0 || v88 > v79;
                  objc_msgSend(v29, "setDistanceFromRoad:", v35);
                  objc_msgSend(v29, "setRoadCourseDelta:", v47);
                  objc_msgSend(v45, "distanceFromJunction");
                  objc_msgSend(v29, "setDistanceFromNearestJunction:");
                  v46 = v76 && v93;
                  if (!v23)
                    goto LABEL_66;
LABEL_35:
                  v48 = objc_msgSend(v23, "isGoodMatch");
                  objc_msgSend(v23, "distanceFromRoute");
                  if (v48)
                  {
                    v50 = v49;
                    if (objc_msgSend(v23, "routeMatchedToEnd"))
                    {
                      objc_msgSend(v20, "speed");
                      v48 = v50 <= 5.0 && v51 <= 3.5;
                    }
                    else
                    {
                      v48 = 1;
                    }
                    if ((v48 & v46) == 1)
                    {
                      if (!-[GEONavigationDrivingMapMatcher _shouldConsiderRoadMatch:overRouteMatch:forLocation:](self, "_shouldConsiderRoadMatch:overRouteMatch:forLocation:", v45, v23, v20))
                      {
LABEL_64:
                        +[GEONavigationMatchResult matchResultWithRouteMatch:location:](GEONavigationMatchResult, "matchResultWithRouteMatch:location:", v23, v20);
                        v17 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v17, "setDetailedMatchInfo:", v29);
                        -[GEONavigationMapMatcher setPreviousMatchResult:](self, "setPreviousMatchResult:", v17);
LABEL_70:

                        goto LABEL_71;
                      }
                      objc_msgSend(v23, "modifiedHorizontalAccuracy");
                      v56 = 0.0;
                      if (v50 - v55 >= 0.0)
                      {
                        objc_msgSend(v23, "modifiedHorizontalAccuracy");
                        v56 = v50 - v57;
                      }
                      objc_msgSend(v20, "speed");
                      if (v58 > 16.0)
                      {
                        objc_msgSend(v20, "speed");
                        v56 = v56 + v59 * -0.125;
                      }
                      objc_msgSend(v20, "course");
                      v61 = v60;
                      objc_msgSend(v23, "matchedCourse");
                      v63 = fmod(v62 - v61 + 180.0, 360.0);
                      v64 = fmod(v63 + 360.0, 360.0);
                      objc_msgSend(v23, "modifiedCourseAccuracy");
                      v65 = v64 + -180.0;
                      v67 = v65 - v66 + -20.0;
                      v68 = 0.0;
                      if (v67 >= 0.0)
                      {
                        objc_msgSend(v23, "modifiedCourseAccuracy", 0.0);
                        v68 = v65 - v69 + -20.0;
                      }
                      v48 = v68 <= v36 + v47 && v56 <= v34 + v35;
                    }
                  }
                  if ((v48 & 1) != 0 || !v30 || !objc_msgSend(v20, "isMatchedLocation"))
                  {
                    if (v48)
                      goto LABEL_64;
                  }
                  else
                  {
                    -[GEONavigationMapMatcher routeMatcher](self, "routeMatcher");
                    v70 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v70, "matchToRouteWithLocation:previousRouteMatch:", v20, v22);
                    v71 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v71 && objc_msgSend(v71, "isGoodMatch"))
                    {

                      v23 = v71;
                      goto LABEL_64;
                    }

                  }
LABEL_66:
                  if (v46)
                    +[GEONavigationMatchResult matchResultWithRoadMatch:location:](GEONavigationMatchResult, "matchResultWithRoadMatch:location:", v45, v20);
                  else
                    +[GEONavigationMatchResult matchResultWithRawLocation:](GEONavigationMatchResult, "matchResultWithRawLocation:", v20);
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "setRouteMatch:", v23);
                  objc_msgSend(v17, "setDetailedMatchInfo:", v29);
                  -[GEONavigationMapMatcher setPreviousMatchResult:](self, "setPreviousMatchResult:", v17);
                  goto LABEL_70;
                }
LABEL_34:
                v46 = 0;
                v47 = -1.0;
                if (!v23)
                  goto LABEL_66;
                goto LABEL_35;
              }
            }
          }
          else
          {

          }
        }
        v45 = 0;
        goto LABEL_34;
      }
LABEL_20:
      +[GEONavigationMatchResult matchResultWithRawLocation:](GEONavigationMatchResult, "matchResultWithRawLocation:", v20);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setRouteMatch:", v23);
      -[GEONavigationMapMatcher setPreviousMatchResult:](self, "setPreviousMatchResult:", v17);
LABEL_71:

      goto LABEL_72;
    }
LABEL_21:
    if (v30)
      goto LABEL_22;
    goto LABEL_20;
  }
  +[GEONavigationMatchResult matchResultWithRawLocation:](GEONavigationMatchResult, "matchResultWithRawLocation:", v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEONavigationMapMatcher previousMatchResult](self, "previousMatchResult");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "routeMatch");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setRouteMatch:", v19);

  -[GEONavigationMapMatcher setPreviousMatchResult:](self, "setPreviousMatchResult:", v17);
LABEL_72:

  return v17;
}

- (int)transportType
{
  return 0;
}

- (void)setUseMatchedCoordinateForMatching:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  id v6;

  v3 = a3;
  self->_useMatchedCoordinateForMatching = a3;
  -[GEONavigationMapMatcher routeMatcher](self, "routeMatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUseMatchedCoordinateForMatching:", v3);

  -[GEONavigationMapMatcher roadMatcher](self, "roadMatcher");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUseRawLocations:", v3 ^ 1);

}

- (BOOL)_locationMeetsSpeedThresholdForRoadMatch:(id)a3 distanceFromRoute:(double)a4
{
  double v5;
  double v6;
  float v7;

  objc_msgSend(a3, "speed");
  v6 = (a4 + -10.0) / 90.0;
  if (v6 < 0.0)
    v6 = 0.0;
  if (v6 > 1.0)
    v6 = 1.0;
  v7 = v6;
  return v5 >= v7 * -6.0 + 6.0;
}

- (BOOL)_shouldConsiderRoadMatch:(id)a3 overRouteMatch:(id)a4 forLocation:(id)a5
{
  id v7;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  BOOL v22;
  BOOL v23;
  BOOL v24;
  double v26;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "horizontalAccuracy");
  if (v10 < 0.0
    || (objc_msgSend(v9, "courseAccuracy"), v11 < 0.0)
    || (objc_msgSend(v9, "courseAccuracy"), v12 >= 180.0))
  {
    v24 = 0;
  }
  else
  {
    objc_msgSend(v7, "distanceFromJunction");
    v14 = v13;
    objc_msgSend(v9, "horizontalAccuracy");
    v16 = v15;
    objc_msgSend(v8, "distanceFromRoute");
    v18 = v17;
    objc_msgSend(v8, "modifiedHorizontalAccuracy");
    v20 = v19;
    objc_msgSend(v7, "junctionRadius");
    v22 = v18 - v20 > v21 + 8.0 || v14 - v16 > 8.0;
    if ((objc_msgSend(v9, "isMatchedLocation") & 1) != 0)
    {
      v23 = 1;
    }
    else
    {
      objc_msgSend(v9, "horizontalAccuracy");
      v23 = v26 < 25.0;
    }
    v24 = v22 && v23;
  }

  return v24;
}

- (double)_approximateMaxSpeedForRoad:(id)a3
{
  id v3;
  void *v4;
  double v5;
  unsigned int v6;

  v3 = a3;
  v4 = v3;
  v5 = 8.5;
  if (v3)
  {
    v6 = objc_msgSend(v3, "roadClass");
    if (v6 < 7)
      v5 = dbl_189CCD5C0[v6];
  }

  return v5;
}

- (id)_effectiveLocationForLocation:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  GEOLocation **p_lastAccurateCourseLocation;
  double v12;
  long double v13;
  double v14;
  long double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  uint64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[GEONavigationMapMatcher previousMatchResult](self, "previousMatchResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6
    || (-[GEONavigationMapMatcher previousMatchResult](self, "previousMatchResult"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "type"),
        v7,
        v6,
        v8))
  {
LABEL_3:
    v9 = v5;
    goto LABEL_4;
  }
  p_lastAccurateCourseLocation = &self->_lastAccurateCourseLocation;
  if (!self->_lastAccurateCourseLocation)
  {
    if (objc_msgSend(v5, "hasAccurateCourse"))
      objc_storeStrong((id *)&self->_lastAccurateCourseLocation, a3);
    goto LABEL_3;
  }
  v9 = v5;
  -[GEONavigationDrivingMapMatcher _courseFromLocation:](self, "_courseFromLocation:", *p_lastAccurateCourseLocation);
  v13 = v12;
  -[GEONavigationDrivingMapMatcher _courseFromLocation:](self, "_courseFromLocation:", v9);
  v15 = v14;
  v16 = fmod(v13, 360.0);
  if (v16 >= 0.0)
    v17 = v16;
  else
    v17 = v16 + 360.0;
  v18 = fmod(v15, 360.0);
  if (v18 < 0.0)
    v18 = v18 + 360.0;
  v19 = v17 - v18;
  if (v19 >= -180.0)
  {
    if (v19 > 180.0)
      v19 = v19 + -360.0;
  }
  else
  {
    v19 = v19 + 360.0;
  }
  objc_msgSend(v9, "courseAccuracy");
  if (v20 >= 0.0
    && (objc_msgSend(v9, "courseAccuracy"), fabs(v19) >= 160.0)
    && v21 < 180.0
    && ((objc_msgSend(v9, "timestamp"),
         v23 = v22,
         -[GEOLocation timestamp](*p_lastAccurateCourseLocation, "timestamp"),
         self->_isCorrectingCourseSwing)
     || v23 - v24 <= 3.0))
  {
    v25 = (void *)objc_msgSend(v9, "copy");

    objc_msgSend(v25, "setCourseAccuracy:", 180.0);
    if (self->_isCorrectingCourseSwing)
    {
      GEOGetMapMatchingLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "timestamp");
        v28 = v27;
        -[GEONavigationDrivingMapMatcher _courseFromLocation:](self, "_courseFromLocation:", v9);
        v30 = v29;
        objc_msgSend(v9, "courseAccuracy");
        v45 = 134218496;
        v46 = v28;
        v47 = 2048;
        v48 = v30;
        v49 = 2048;
        v50 = v31;
        _os_log_impl(&dword_1885A9000, v26, OS_LOG_TYPE_DEFAULT, "Continuing to correct for 180° course swing by modifying course accuracy. Current location timestamp: %0.1f, course: %0.1f°, accuracy: ±%0.1f°", (uint8_t *)&v45, 0x20u);
      }
    }
    else
    {
      -[GEONavigationMapMatcher previousMatchResult](self, "previousMatchResult");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "rawLocation");
      v26 = objc_claimAutoreleasedReturnValue();

      GEOGetMapMatchingLog();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject timestamp](v26, "timestamp");
        v35 = v34;
        -[GEONavigationDrivingMapMatcher _courseFromLocation:](self, "_courseFromLocation:", v26);
        v37 = v36;
        -[NSObject courseAccuracy](v26, "courseAccuracy");
        v39 = v38;
        objc_msgSend(v9, "timestamp");
        v41 = v40;
        -[GEONavigationDrivingMapMatcher _courseFromLocation:](self, "_courseFromLocation:", v9);
        v43 = v42;
        objc_msgSend(v9, "courseAccuracy");
        v45 = 134219264;
        v46 = v35;
        v47 = 2048;
        v48 = v37;
        v49 = 2048;
        v50 = v39;
        v51 = 2048;
        v52 = v41;
        v53 = 2048;
        v54 = v43;
        v55 = 2048;
        v56 = v44;
        _os_log_impl(&dword_1885A9000, v33, OS_LOG_TYPE_DEFAULT, "Attempting to correct for 180° course swing by modifying course accuracy. Last good location timestamp: %0.1f, course: %0.1f°, accuracy: ±%0.1f°. Current location timestamp: %0.1f, course: %0.1f°, accuracy: ±%0.1f°", (uint8_t *)&v45, 0x3Eu);
      }

    }
    self->_isCorrectingCourseSwing = 1;
    v9 = v25;
  }
  else
  {
    if (objc_msgSend(v9, "hasAccurateCourse"))
      objc_storeStrong((id *)&self->_lastAccurateCourseLocation, a3);
    self->_isCorrectingCourseSwing = 0;
  }
LABEL_4:

  return v9;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_coordinateFromLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  v4 = a3;
  v5 = v4;
  if (self->_useMatchedCoordinateForMatching)
    objc_msgSend(v4, "latLng");
  else
    objc_msgSend(v4, "rawCoordinate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "coordinate");
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

- (double)_courseFromLocation:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;

  v4 = a3;
  v5 = v4;
  if (self->_useMatchedCoordinateForMatching)
    objc_msgSend(v4, "course");
  else
    objc_msgSend(v4, "rawCourse");
  v7 = v6;

  return v7;
}

- (id)_routeMatcherForRoute:(id)a3
{
  id v4;
  GEODrivingRouteMatcher *v5;
  void *v6;
  GEODrivingRouteMatcher *v7;

  v4 = a3;
  v5 = [GEODrivingRouteMatcher alloc];
  -[GEONavigationMapMatcher auditToken](self, "auditToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[GEODrivingRouteMatcher initWithRoute:auditToken:](v5, "initWithRoute:auditToken:", v4, v6);

  -[GEORouteMatcher setUseMatchedCoordinateForMatching:](v7, "setUseMatchedCoordinateForMatching:", self->_useMatchedCoordinateForMatching);
  return v7;
}

- (BOOL)useMatchedCoordinateForMatching
{
  return self->_useMatchedCoordinateForMatching;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAccurateCourseLocation, 0);
}

@end
