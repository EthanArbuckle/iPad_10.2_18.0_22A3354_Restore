@implementation GEONavigationBicycleMapMatcher

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
  GEORouteMatcher *v24;
  void *v25;
  void *v26;
  GEORouteMatcher *v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  BOOL v43;
  int v44;
  double v45;
  int v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  long double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  void *v69;
  NSObject *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  void *v149;
  void *v150;
  double v151;
  double v152;
  _BOOL4 v153;
  double v154;
  double v155;
  double v156;
  double v157;
  long double v158;
  double v159;
  double v160;
  double v161;
  double v162;
  double v163;
  double v164;
  double v165;
  double v166;
  double v167;
  double v168;
  long double v169;
  _BOOL4 v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  void *v174;
  uint64_t v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  uint8_t buf[4];
  uint64_t v186;
  __int16 v187;
  uint64_t v188;
  __int16 v189;
  uint64_t v190;
  __int16 v191;
  uint64_t v192;
  __int16 v193;
  uint64_t v194;
  __int16 v195;
  uint64_t v196;
  __int16 v197;
  uint64_t v198;
  __int16 v199;
  uint64_t v200;
  __int16 v201;
  uint64_t v202;
  __int16 v203;
  uint64_t v204;
  __int16 v205;
  uint64_t v206;
  uint64_t v207;

  v207 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[GEONavigationMapMatcher route](self, "route");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "transportType");
  v9 = -[GEONavigationBicycleMapMatcher transportType](self, "transportType");

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
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "roadMatch");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            +[GEONavigationMatchResult matchResultWithRoadMatch:location:](GEONavigationMatchResult, "matchResultWithRoadMatch:location:", v51, v6);
            v52 = (void *)objc_claimAutoreleasedReturnValue();

            -[GEONavigationMapMatcher previousMatchResult](self, "previousMatchResult");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "routeMatch");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "setRouteMatch:", v16);
            v14 = v52;
          }
          else
          {
            if (v13 != 2)
            {
              v17 = 0;
              goto LABEL_43;
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
LABEL_43:
        objc_msgSend(v17, "setLocationUnreliable:", 1);
        -[GEONavigationMapMatcher setPreviousMatchResult:](self, "setPreviousMatchResult:", v17);
        goto LABEL_73;
      }
    }
    -[GEONavigationMapMatcher previousMatchResult](self, "previousMatchResult");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "routeMatch");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[GEONavigationMapMatcher route](self, "route");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      -[GEONavigationMapMatcher routeMatcher](self, "routeMatcher");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "matchToRouteWithLocation:previousRouteMatch:", v6, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
      {
        v24 = [GEORouteMatcher alloc];
        -[GEONavigationMapMatcher route](self, "route");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEONavigationMapMatcher auditToken](self, "auditToken");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = -[GEORouteMatcher initWithRoute:auditToken:](v24, "initWithRoute:auditToken:", v25, v26);

        -[GEORouteMatcher matchToClosestPointOnRouteWithLocation:](v27, "matchToClosestPointOnRouteWithLocation:", v6);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    objc_msgSend(v22, "detailedMatchInfo");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4 == 4)
    {
      v29 = 1;
      if (!v21)
        goto LABEL_21;
    }
    else
    {
      v29 = -[GEONavigationBicycleMapMatcher transportType](self, "transportType") == a4;
      if (!v21)
        goto LABEL_21;
    }
    if (objc_msgSend(v21, "isGoodMatch"))
    {
      -[GEONavigationMapMatcher previousMatchResult](self, "previousMatchResult");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "type");

      if (v29 || !v31 && (objc_msgSend(v22, "isGoodMatch") & 1) != 0)
      {
LABEL_22:
        objc_msgSend(v6, "horizontalAccuracy");
        v33 = v32;
        objc_msgSend(v6, "courseAccuracy");
        v34 = -1.0;
        v35 = -1.0;
        if (v36 >= 0.0)
        {
          objc_msgSend(v6, "courseAccuracy");
          v35 = v37 + 10.0;
        }
        if (v29)
        {
          -[GEONavigationMapMatcher roadMatcher](self, "roadMatcher");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v38;
          if (v38 && v33 >= 0.0 && v33 <= 65.0)
          {
            objc_msgSend(v6, "course");
            v41 = v40;

            if (v41 < 0.0)
              goto LABEL_33;
            -[GEONavigationMapMatcher previousMatchResult](self, "previousMatchResult");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v42, "type") == 2)
            {
              objc_msgSend(v22, "distanceFromRoute");
              v43 = -[GEONavigationBicycleMapMatcher _locationMeetsSpeedThresholdForRoadMatch:distanceFromRoute:](self, "_locationMeetsSpeedThresholdForRoadMatch:distanceFromRoute:", v6);

              if (!v43)
                goto LABEL_33;
            }
            else
            {

            }
            -[GEONavigationMapMatcher roadMatcher](self, "roadMatcher");
            v149 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v149, "matchLocation:forTransportType:", v6, -[GEONavigationBicycleMapMatcher transportType](self, "transportType"));
            v150 = (void *)objc_claimAutoreleasedReturnValue();

            if (v150)
            {
              if (v35 >= 0.0)
                v151 = v35 + 10.0;
              else
                v151 = 10.0;
              v184 = v150;
              objc_msgSend(v150, "distanceFromRoad");
              v45 = v152;
              v153 = v152 < v33 + 20.0;
              -[GEONavigationBicycleMapMatcher _courseFromLocation:](self, "_courseFromLocation:", v6);
              v155 = v154;
              if (v154 >= 0.0)
              {
                objc_msgSend(v150, "courseOnRoad");
                v153 = v45 < v33 + 20.0;
                v158 = fmod(v157 - v155 + 180.0, 360.0);
                v34 = fabs(fmod(v158 + 360.0, 360.0) + -180.0);
                if (v34 >= v151)
                  v153 = 0;
                v156 = 10.0;
              }
              else
              {
                v34 = -1.0;
                v156 = 30.0;
              }
              objc_msgSend(v22, "locationCoordinate3D");
              v160 = v159;
              v162 = v161;
              objc_msgSend(v150, "coordinateOnRoad");
              v165 = GEOCalculateDistanceRadius(v160, v162, v163, v164, 6367000.0);
              objc_msgSend(v22, "matchedCourse");
              v167 = v166;
              objc_msgSend(v150, "courseOnRoad");
              v169 = fmod(v168 - v167 + 180.0, 360.0);
              v170 = fabs(fmod(v169 + 360.0, 360.0) + -180.0) > 30.0 || v165 > v156;
              objc_msgSend(v28, "setDistanceFromRoad:", v45);
              objc_msgSend(v28, "setRoadCourseDelta:", v34);
              objc_msgSend(v184, "distanceFromJunction");
              objc_msgSend(v28, "setDistanceFromNearestJunction:");
              v44 = v153 && v170;
              if (!v22)
                goto LABEL_66;
LABEL_34:
              v46 = objc_msgSend(v22, "isGoodMatch");
              objc_msgSend(v22, "distanceFromRoute");
              if (v46)
              {
                v48 = v47;
                if (objc_msgSend(v22, "routeMatchedToEnd"))
                {
                  objc_msgSend(v6, "speed");
                  v46 = v48 <= 5.0 && v49 <= 3.5;
                }
                else
                {
                  v46 = 1;
                }
                if ((v46 & v44) == 1)
                {
                  if (!-[GEONavigationBicycleMapMatcher _shouldConsiderRoadMatch:overRouteMatch:forLocation:](self, "_shouldConsiderRoadMatch:overRouteMatch:forLocation:", v184, v22, v6))goto LABEL_63;
                  objc_msgSend(v22, "modifiedHorizontalAccuracy");
                  v54 = 0.0;
                  if (v48 - v53 >= 0.0)
                  {
                    objc_msgSend(v22, "modifiedHorizontalAccuracy");
                    v54 = v48 - v55;
                  }
                  objc_msgSend(v6, "speed");
                  if (v56 > 16.0)
                  {
                    objc_msgSend(v6, "speed");
                    v54 = v54 + v57 * -0.125;
                  }
                  objc_msgSend(v6, "course");
                  v59 = v58;
                  objc_msgSend(v22, "matchedCourse");
                  v61 = fmod(v60 - v59 + 180.0, 360.0);
                  v62 = fmod(v61 + 360.0, 360.0);
                  objc_msgSend(v22, "modifiedCourseAccuracy");
                  v63 = v62 + -180.0;
                  v65 = v63 - v64 + -20.0;
                  v66 = 0.0;
                  if (v65 >= 0.0)
                  {
                    objc_msgSend(v22, "modifiedCourseAccuracy", 0.0);
                    v66 = v63 - v67 + -20.0;
                  }
                  v46 = v66 <= v35 + v34 && v54 <= v33 + v45;
                }
              }
              if ((v46 & 1) != 0 || !v29 || !objc_msgSend(v6, "isMatchedLocation"))
              {
                if (v46)
                {
LABEL_63:
                  +[GEONavigationMatchResult matchResultWithRouteMatch:location:](GEONavigationMatchResult, "matchResultWithRouteMatch:location:", v22, v6);
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "setDetailedMatchInfo:", v28);
                  -[GEONavigationMapMatcher setPreviousMatchResult:](self, "setPreviousMatchResult:", v17);
                  GEOGetCyclingMapMatcherLog();
                  v70 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
                  {
                    objc_msgSend(v17, "routeMatch");
                    v181 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v181, "locationCoordinate");
                    v72 = v71;
                    objc_msgSend(v17, "routeMatch");
                    v179 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v179, "locationCoordinate");
                    v74 = v73;
                    objc_msgSend(v17, "routeMatch");
                    v177 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v177, "matchedCourse");
                    v76 = v75;
                    objc_msgSend(v17, "routeMatch");
                    v77 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v77, "modifiedHorizontalAccuracy");
                    v79 = v78;
                    objc_msgSend(v17, "routeMatch");
                    v80 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v80, "modifiedCourseAccuracy");
                    v82 = v81;
                    objc_msgSend(v6, "latLng");
                    v83 = (void *)objc_claimAutoreleasedReturnValue();
                    v173 = v82;
                    v175 = v79;
                    v84 = v76;
                    v85 = v74;
                    v86 = v72;
                    objc_msgSend(v83, "lat");
                    v88 = v87;
                    objc_msgSend(v6, "latLng");
                    v89 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v89, "lng");
                    v91 = v90;
                    objc_msgSend(v6, "course");
                    v93 = v92;
                    objc_msgSend(v6, "horizontalAccuracy");
                    v95 = v94;
                    objc_msgSend(v6, "courseAccuracy");
                    v97 = v96;
                    objc_msgSend(v6, "timestamp");
                    *(_DWORD *)buf = 134220544;
                    v186 = v86;
                    v187 = 2048;
                    v188 = v85;
                    v189 = 2048;
                    v190 = v84;
                    v191 = 2048;
                    v192 = v175;
                    v193 = 2048;
                    v194 = v173;
                    v195 = 2048;
                    v196 = v88;
                    v197 = 2048;
                    v198 = v91;
                    v199 = 2048;
                    v200 = v93;
                    v201 = 2048;
                    v202 = v95;
                    v203 = 2048;
                    v204 = v97;
                    v205 = 2048;
                    v206 = v98;
                    _os_log_impl(&dword_1885A9000, v70, OS_LOG_TYPE_INFO, "MapsSnapToRouteRoute,LatLng,%.8lf,%.8lf,Course,%.3lf,HorUnc,%.3lf,CourseUnc,%.3lf,InputLatLng,%.8lf,%.8lf,InputCourse,%.3lf,InputHorUnc,%.3lf,InputCourseUnc,%.3lf,Timestamp,%f", buf, 0x70u);

                  }
                  goto LABEL_71;
                }
              }
              else
              {
                -[GEONavigationMapMatcher routeMatcher](self, "routeMatcher");
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v68, "matchToRouteWithLocation:previousRouteMatch:", v6, v21);
                v69 = (void *)objc_claimAutoreleasedReturnValue();

                if (v69 && objc_msgSend(v69, "isGoodMatch"))
                {

                  v22 = v69;
                  goto LABEL_63;
                }

              }
LABEL_66:
              if (v44)
              {
                +[GEONavigationMatchResult matchResultWithRoadMatch:location:](GEONavigationMatchResult, "matchResultWithRoadMatch:location:", v184, v6);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "setRouteMatch:", v22);
                objc_msgSend(v17, "setDetailedMatchInfo:", v28);
                -[GEONavigationMapMatcher setPreviousMatchResult:](self, "setPreviousMatchResult:", v17);
                GEOGetCyclingMapMatcherLog();
                v70 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(v17, "roadMatch");
                  v182 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v182, "coordinateOnRoad");
                  v100 = v99;
                  objc_msgSend(v17, "roadMatch");
                  v101 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v101, "coordinateOnRoad");
                  v103 = v102;
                  objc_msgSend(v17, "roadMatch");
                  v104 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v104, "courseOnRoad");
                  v106 = v105;
                  objc_msgSend(v6, "latLng");
                  v107 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v107, "lat");
                  v109 = v108;
                  objc_msgSend(v6, "latLng");
                  v110 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v110, "lng");
                  v112 = v111;
                  objc_msgSend(v6, "course");
                  v114 = v113;
                  objc_msgSend(v6, "horizontalAccuracy");
                  v116 = v115;
                  objc_msgSend(v6, "courseAccuracy");
                  v118 = v117;
                  objc_msgSend(v6, "timestamp");
                  *(_DWORD *)buf = 134220544;
                  v186 = v100;
                  v187 = 2048;
                  v188 = v103;
                  v189 = 2048;
                  v190 = v106;
                  v191 = 2048;
                  v192 = 0;
                  v193 = 2048;
                  v194 = 0;
                  v195 = 2048;
                  v196 = v109;
                  v197 = 2048;
                  v198 = v112;
                  v199 = 2048;
                  v200 = v114;
                  v201 = 2048;
                  v202 = v116;
                  v203 = 2048;
                  v204 = v118;
                  v205 = 2048;
                  v206 = v119;
                  _os_log_impl(&dword_1885A9000, v70, OS_LOG_TYPE_INFO, "MapsSnapToRouteRoad,LatLng,%.8lf,%.8lf,Course,%.3lf,HorUnc,%.3lf,CourseUnc,%.3lf,InputLatLng,%.8lf,%.8lf,InputCourse,%.3lf,InputHorUnc,%.3lf,InputCourseUnc,%.3lf,Timestamp,%f", buf, 0x70u);

                }
              }
              else
              {
                +[GEONavigationMatchResult matchResultWithRawLocation:](GEONavigationMatchResult, "matchResultWithRawLocation:", v6);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "setRouteMatch:", v22);
                objc_msgSend(v17, "setDetailedMatchInfo:", v28);
                -[GEONavigationMapMatcher setPreviousMatchResult:](self, "setPreviousMatchResult:", v17);
                GEOGetCyclingMapMatcherLog();
                v70 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(v17, "rawLocation");
                  v183 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v183, "latLng");
                  v180 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v180, "lat");
                  v121 = v120;
                  objc_msgSend(v17, "rawLocation");
                  v178 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v178, "latLng");
                  v176 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v176, "lng");
                  v123 = v122;
                  objc_msgSend(v17, "rawLocation");
                  v174 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v174, "course");
                  v125 = v124;
                  objc_msgSend(v17, "rawLocation");
                  v126 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v126, "horizontalAccuracy");
                  v128 = v127;
                  objc_msgSend(v17, "rawLocation");
                  v129 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v129, "courseAccuracy");
                  v131 = v130;
                  objc_msgSend(v6, "latLng");
                  v132 = (void *)objc_claimAutoreleasedReturnValue();
                  v171 = v131;
                  v172 = v128;
                  v133 = v125;
                  v134 = v123;
                  v135 = v121;
                  objc_msgSend(v132, "lat");
                  v137 = v136;
                  objc_msgSend(v6, "latLng");
                  v138 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v138, "lng");
                  v140 = v139;
                  objc_msgSend(v6, "course");
                  v142 = v141;
                  objc_msgSend(v6, "horizontalAccuracy");
                  v144 = v143;
                  objc_msgSend(v6, "courseAccuracy");
                  v146 = v145;
                  objc_msgSend(v6, "timestamp");
                  *(_DWORD *)buf = 134220544;
                  v186 = v135;
                  v187 = 2048;
                  v188 = v134;
                  v189 = 2048;
                  v190 = v133;
                  v191 = 2048;
                  v192 = v172;
                  v193 = 2048;
                  v194 = v171;
                  v195 = 2048;
                  v196 = v137;
                  v197 = 2048;
                  v198 = v140;
                  v199 = 2048;
                  v200 = v142;
                  v201 = 2048;
                  v202 = v144;
                  v203 = 2048;
                  v204 = v146;
                  v205 = 2048;
                  v206 = v147;
                  _os_log_impl(&dword_1885A9000, v70, OS_LOG_TYPE_INFO, "MapsSnapToRouteRaw,LatLng,%.8lf,%.8lf,Course,%.3lf,HorUnc,%.3lf,CourseUnc,%.3lf,InputLatLng,%.8lf,%.8lf,InputCourse,%.3lf,InputHorUnc,%.3lf,InputCourseUnc,%.3lf,Timestamp,%f", buf, 0x70u);

                }
              }
LABEL_71:

              goto LABEL_72;
            }
          }
          else
          {

          }
        }
LABEL_33:
        v44 = 0;
        v184 = 0;
        v45 = -1.0;
        if (!v22)
          goto LABEL_66;
        goto LABEL_34;
      }
LABEL_20:
      +[GEONavigationMatchResult matchResultWithRawLocation:](GEONavigationMatchResult, "matchResultWithRawLocation:", v6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setRouteMatch:", v22);
      -[GEONavigationMapMatcher setPreviousMatchResult:](self, "setPreviousMatchResult:", v17);
LABEL_72:

      goto LABEL_73;
    }
LABEL_21:
    if (v29)
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
LABEL_73:

  return v17;
}

- (int)transportType
{
  return 3;
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
  v6 = (a4 + -10.0) / 40.0;
  if (v6 < 0.0)
    v6 = 0.0;
  if (v6 > 1.0)
    v6 = 1.0;
  v7 = v6;
  return v5 >= v7 * -3.0 + 3.0;
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
      v5 = dbl_189CD8AC0[v6];
  }

  return v5;
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
  GEOCyclingRouteMatcher *v5;
  void *v6;
  GEOCyclingRouteMatcher *v7;

  v4 = a3;
  v5 = [GEOCyclingRouteMatcher alloc];
  -[GEONavigationMapMatcher auditToken](self, "auditToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[GEOCyclingRouteMatcher initWithRoute:auditToken:](v5, "initWithRoute:auditToken:", v4, v6);

  -[GEORouteMatcher setUseMatchedCoordinateForMatching:](v7, "setUseMatchedCoordinateForMatching:", self->_useMatchedCoordinateForMatching);
  return v7;
}

- (BOOL)useMatchedCoordinateForMatching
{
  return self->_useMatchedCoordinateForMatching;
}

@end
