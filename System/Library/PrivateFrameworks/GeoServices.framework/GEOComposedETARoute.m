@implementation GEOComposedETARoute

- (double)_hypothesis_travelDurationFromStep:(id)a3 stepRemainingDistance:(double)a4
{
  id v6;
  double v7;
  double v8;

  v6 = a3;
  -[GEOComposedETARoute travelDurationToEndOfRouteFromStepID:currentStepRemainingDistance:](self, "travelDurationToEndOfRouteFromStepID:currentStepRemainingDistance:", objc_msgSend(v6, "stepID"), a4);
  v8 = v7;

  return v8;
}

- (BOOL)prepareForRequest:(id)a3 route:(id)a4 routeMatch:(id)a5 targetLegIndex:(unint64_t)a6 state:(int)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  NSObject *v19;
  void *v20;
  $604ECB7A8067A7300F159AE8ED6889F8 v21;
  uint64_t v22;
  double v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  const char *v28;
  void *v29;
  BOOL v30;
  NSObject *v31;
  uint64_t v32;
  double v33;
  $604ECB7A8067A7300F159AE8ED6889F8 startRouteCoordinate;
  uint64_t v35;
  unsigned int index;
  NSUUID *v37;
  NSUUID *uniqueRouteID;
  unint64_t v39;
  void *v40;
  uint64_t v41;
  _BOOL8 v42;
  id v43;
  unsigned int v44;
  double offset;
  void *v46;
  char v47;
  void *v48;
  NSObject *v49;
  int v50;
  void *v51;
  GEOETATrafficUpdateWaypointRoute *v52;
  GEOETATrafficUpdateWaypointRoute *geoETAWaypointRoute;
  unint64_t startingStepIndex;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  NSObject *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t i;
  void *v68;
  int v69;
  id v71;
  id v72;
  NSObject *v73;
  void *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint8_t v79[128];
  uint8_t buf[4];
  _BYTE v81[14];
  __int16 v82;
  void *v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if ((objc_msgSend(v13, "usesRoutingPathPoints") & 1) != 0 || (objc_msgSend(v13, "usesZilch") & 1) != 0)
  {
    objc_msgSend(v13, "geoWaypointRoute");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v13, "legs");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (a6 == 0x7FFFFFFFFFFFFFFFLL)
        v18 = 0;
      else
        v18 = a6;
      objc_msgSend(v16, "objectAtIndexedSubscript:", v18);
      v19 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "step");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v20 || objc_msgSend(v14, "legIndex") != a6)
      {
        if (objc_msgSend(v14, "legIndex") < a6)
        {
          self->_startingStepIndex = -[NSObject startStepIndex](v19, "startStepIndex");
          objc_msgSend(v13, "steps");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectAtIndexedSubscript:", self->_startingStepIndex);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          self->_startRouteCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)objc_msgSend(v25, "startRouteCoordinate");
          v26 = objc_msgSend(v14, "routeCoordinate");
          if (vabds_f32((float)self->_startRouteCoordinate.index + self->_startRouteCoordinate.offset, (float)v26 + *((float *)&v26 + 1)) < 0.001)
          {
LABEL_38:
            v20 = v25;
            goto LABEL_39;
          }
          GEOGetGEOComposedETARouteLog();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v28 = "Pinning route coordinate to target leg.";
LABEL_36:
            _os_log_impl(&dword_1885A9000, v27, OS_LOG_TYPE_DEFAULT, v28, buf, 2u);
          }
LABEL_37:

          goto LABEL_38;
        }
        if (objc_msgSend(v14, "legIndex") > a6)
        {
          GEOGetGEOComposedETARouteLog();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v81 = objc_msgSend(v14, "legIndex");
            *(_WORD *)&v81[4] = 1024;
            *(_DWORD *)&v81[6] = a6;
            _os_log_impl(&dword_1885A9000, v31, OS_LOG_TYPE_INFO, "Location has reached leg (%d) but the waypoint from leg (%d) was never passed.  Skipping update.", buf, 0xEu);
          }
          goto LABEL_45;
        }
LABEL_39:
        index = self->_startRouteCoordinate.index;
        if (index < objc_msgSend(v13, "pointCount"))
        {
          v73 = v19;
          v74 = v20;
          objc_msgSend(v13, "uniqueRouteID");
          v37 = (NSUUID *)objc_claimAutoreleasedReturnValue();
          uniqueRouteID = self->_uniqueRouteID;
          self->_uniqueRouteID = v37;

          v39 = objc_msgSend(v13, "legIndexForStepIndex:", self->_startingStepIndex);
          objc_msgSend(v13, "legs");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v40, "count");
          v42 = v39 < v41 - 1;
          if (v39 < v41 - 1)
          {
            if ((a7 & 0xFFFFFFFE) == 6)
            {

            }
            else
            {
              v47 = objc_msgSend(v74, "isChargingStop");

              if ((v47 & 1) == 0)
              {
                v42 = 0;
                v19 = v73;
                goto LABEL_51;
              }
            }
            objc_msgSend(v13, "legs");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "objectAtIndexedSubscript:", v39 + 1);
            v40 = (void *)objc_claimAutoreleasedReturnValue();

            self->_startingStepIndex = objc_msgSend(v40, "startStepIndex");
            self->_startRouteCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)objc_msgSend(v40, "startRouteCoordinate");
            GEOGetGEOComposedETARouteLog();
            v49 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
            {
              v50 = objc_msgSend(v40, "legIndex");
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)v81 = v39;
              *(_WORD *)&v81[4] = 1024;
              *(_DWORD *)&v81[6] = v50;
              _os_log_impl(&dword_1885A9000, v49, OS_LOG_TYPE_INFO, "Location is at end of leg (%d), creating ETAU request from leg (%d)", buf, 0xEu);
            }

          }
          v19 = v73;

LABEL_51:
          objc_msgSend(v14, "pathSegment");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "geoETAWaypointRouteFromRouteCoordinate:includeOriginWaypointInfo:startPathSegment:", *(_QWORD *)&self->_startRouteCoordinate, v42, v51);
          v52 = (GEOETATrafficUpdateWaypointRoute *)objc_claimAutoreleasedReturnValue();
          geoETAWaypointRoute = self->_geoETAWaypointRoute;
          self->_geoETAWaypointRoute = v52;

          v20 = v74;
          if (!self->_geoETAWaypointRoute)
          {
            v30 = 0;
LABEL_73:

            goto LABEL_74;
          }
          startingStepIndex = self->_startingStepIndex;
          objc_msgSend(v13, "steps");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          if (startingStepIndex >= objc_msgSend(v55, "count"))
          {
            v31 = 0;
          }
          else
          {
            objc_msgSend(v13, "steps");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "objectAtIndexedSubscript:", self->_startingStepIndex);
            v31 = objc_claimAutoreleasedReturnValue();

          }
          -[GEOETATrafficUpdateWaypointRoute routeLegs](self->_geoETAWaypointRoute, "routeLegs");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "firstObject");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "steps");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "firstObject");
          v60 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v31 || (v61 = -[NSObject stepID](v31, "stepID"), v61 != objc_msgSend(v60, "stepID")))
          {
            v71 = v14;
            v72 = v12;
            GEOGetGEOComposedETARouteLog();
            v62 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1885A9000, v62, OS_LOG_TYPE_DEFAULT, "Starting step index doesn't match start step on GEOETAWaypointRoute. Searching again for the correct step index.", buf, 2u);
            }

            v77 = 0u;
            v78 = 0u;
            v75 = 0u;
            v76 = 0u;
            objc_msgSend(v13, "steps");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v75, v79, 16);
            if (v64)
            {
              v65 = v64;
              v66 = *(_QWORD *)v76;
              while (2)
              {
                for (i = 0; i != v65; ++i)
                {
                  if (*(_QWORD *)v76 != v66)
                    objc_enumerationMutation(v63);
                  v68 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
                  v69 = objc_msgSend(v68, "stepID", v71, v72);
                  if (v69 == objc_msgSend(v60, "stepID"))
                  {
                    self->_startingStepIndex = objc_msgSend(v68, "stepIndex");
                    goto LABEL_70;
                  }
                }
                v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v75, v79, 16);
                if (v65)
                  continue;
                break;
              }
            }
LABEL_70:

            v14 = v71;
            v12 = v72;
          }
          objc_msgSend(v12, "setWaypointRoute:", self->_geoETAWaypointRoute, v71, v72);

          v30 = 1;
          v19 = v73;
          v20 = v74;
LABEL_72:

          goto LABEL_73;
        }
        GEOGetGEOComposedETARouteLog();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          v43 = v14;
          v44 = self->_startRouteCoordinate.index;
          offset = self->_startRouteCoordinate.offset;
          objc_msgSend(v13, "uniqueRouteID");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v81 = v44;
          v14 = v43;
          *(_WORD *)&v81[4] = 2048;
          *(double *)&v81[6] = offset;
          v82 = 2112;
          v83 = v46;
          _os_log_impl(&dword_1885A9000, v31, OS_LOG_TYPE_ERROR, "Input route coordinate [%u, %0.2f] is beyond the bounds of route (%@). Skipping update.", buf, 0x1Cu);

        }
LABEL_45:
        v30 = 0;
        goto LABEL_72;
      }
      v21 = ($604ECB7A8067A7300F159AE8ED6889F8)objc_msgSend(v14, "routeCoordinate");
      v22 = objc_msgSend(v20, "startRouteCoordinate");
      if (v21.index == (_DWORD)v22)
      {
        *(float *)&v23 = v21.offset;
        if (v21.offset == *((float *)&v22 + 1) || v21.offset >= *((float *)&v22 + 1))
        {
LABEL_27:
          self->_startRouteCoordinate = v21;
          v32 = objc_msgSend(v20, "endRouteCoordinate", v23);
          startRouteCoordinate = self->_startRouteCoordinate;
          if (startRouteCoordinate.index == (_DWORD)v32)
          {
            LODWORD(v33) = HIDWORD(*(_QWORD *)&self->_startRouteCoordinate);
            if (startRouteCoordinate.offset == *((float *)&v32 + 1)
              || startRouteCoordinate.offset >= *((float *)&v32 + 1))
            {
LABEL_33:
              self->_startRouteCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)v32;
              self->_startingStepIndex = objc_msgSend(v20, "stepIndex", v33);
              v35 = objc_msgSend(v14, "routeCoordinate");
              if (vabds_f32((float)self->_startRouteCoordinate.index + self->_startRouteCoordinate.offset, (float)v35 + *((float *)&v35 + 1)) >= 0.001)
              {
                v25 = v20;
                GEOGetGEOComposedETARouteLog();
                v27 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  v28 = "Pinning route coordinate to current step.";
                  goto LABEL_36;
                }
                goto LABEL_37;
              }
              goto LABEL_39;
            }
          }
          else if (startRouteCoordinate.index >= v32)
          {
            goto LABEL_33;
          }
          v32 = (uint64_t)self->_startRouteCoordinate;
          goto LABEL_33;
        }
      }
      else if (v21.index >= v22)
      {
        goto LABEL_27;
      }
      v21 = ($604ECB7A8067A7300F159AE8ED6889F8)v22;
      goto LABEL_27;
    }
    GEOGetGEOComposedETARouteLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v19, OS_LOG_TYPE_ERROR, "Attempted to prepare an eta request without a GEOETATrafficUpdateWaypointRoute or with a deprecated GEOETARoute.", buf, 2u);
    }
  }
  else
  {
    GEOGetGEOComposedETARouteLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v13, "uniqueRouteID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v81 = v29;
      _os_log_impl(&dword_1885A9000, v19, OS_LOG_TYPE_ERROR, "Route (%@) has no routing path points or zilch points. Unable to generate ETAU request so skipping update.", buf, 0xCu);

    }
  }
  v30 = 0;
LABEL_74:

  return v30;
}

- (BOOL)updateForResponse:(id)a3 route:(id)a4
{
  id v6;
  id v7;
  NSDate *v8;
  NSDate *responseDate;
  NSUUID *uniqueRouteID;
  void *v11;
  char v12;
  GEOETATrafficUpdateWaypointRoute **p_geoETAWaypointRoute;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  NSObject *v20;
  void *v21;
  const char *v22;
  NSUUID *v23;
  void *v24;
  BOOL v25;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  unint64_t v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  unint64_t v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  unsigned int v63;
  unsigned int v64;
  GEOComposedETARouteStep *v65;
  void *v66;
  void *v67;
  void *v68;
  int v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t startRouteCoordinate;
  NSObject *v73;
  void *v74;
  void *v75;
  unint64_t v76;
  GEOComposedETARouteLeg *v77;
  unint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  GEOComposedRouteEVChargingStationInfo *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  GEOComposedRouteEVChargingStationInfo *v88;
  void *v89;
  void *v90;
  GEOComposedETARouteLeg *v91;
  NSObject *v92;
  int v93;
  void *v94;
  void *v95;
  GEOComposedRouteEVChargingStationInfo *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  GEOComposedRouteEVChargingStationInfo *v100;
  void *v101;
  unint64_t v102;
  GEOETATrafficUpdateWaypointRoute *v103;
  void *v104;
  void *v105;
  void *v106;
  uint64_t v107;
  NSDate *serverDisplayETA;
  void *v109;
  NSUUID *v110;
  uint64_t v111;
  NSUUID *etauResponseID;
  NSObject *v113;
  GEOETATrafficUpdateWaypointRoute *v114;
  uint64_t v115;
  void *v116;
  uint64_t v117;
  NSObject *v118;
  uint64_t v119;
  uint64_t v120;
  GEOETATrafficUpdateWaypointRoute **location;
  GEOComposedETARoute *v122;
  unint64_t v123;
  NSObject *v124;
  id v125;
  unint64_t startingStepIndex;
  void *v127;
  void *v128;
  void *v129;
  uint8_t buf[4];
  _BYTE v131[18];
  uint64_t v132;

  v132 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
  responseDate = self->_responseDate;
  self->_responseDate = v8;

  uniqueRouteID = self->_uniqueRouteID;
  if (uniqueRouteID)
  {
    objc_msgSend(v7, "uniqueRouteID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[NSUUID isEqual:](uniqueRouteID, "isEqual:", v11);

    if ((v12 & 1) == 0)
    {
      GEOGetGEOComposedETARouteLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v23 = self->_uniqueRouteID;
        objc_msgSend(v7, "uniqueRouteID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v131 = v23;
        *(_WORD *)&v131[8] = 2112;
        *(_QWORD *)&v131[10] = v24;
        _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_ERROR, "Error updating GEOComposedETARoute from response because _uniqueRouteID (%@) does not much new route ID (%@). This probably means the route changed during an ETA update.", buf, 0x16u);

      }
      goto LABEL_15;
    }
    p_geoETAWaypointRoute = &self->_geoETAWaypointRoute;
    if (self->_geoETAWaypointRoute)
    {
      objc_msgSend(v6, "waypointRoute");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        -[NSObject routeLegs](v14, "routeLegs");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");
        objc_msgSend(v7, "legs");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "count");

        if (v17 > v19)
        {
          GEOGetGEOComposedETARouteLog();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v7, "legs");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)v131 = v6;
            *(_WORD *)&v131[8] = 1024;
            *(_DWORD *)&v131[10] = objc_msgSend(v21, "count");
            _os_log_impl(&dword_1885A9000, v20, OS_LOG_TYPE_ERROR, "Number of legs in ETAU response waypointRoute %@ is greater than the original route's leg count (%d)", buf, 0x12u);

          }
          goto LABEL_60;
        }
        -[GEOETATrafficUpdateWaypointRoute routeLegs](*p_geoETAWaypointRoute, "routeLegs");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "count");
        -[NSObject routeLegs](v15, "routeLegs");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "count");

        if (v31 == v33)
        {
          v116 = v6;
          v34 = (void *)MEMORY[0x1E0C99DE8];
          -[NSObject routeLegs](v15, "routeLegs");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "arrayWithCapacity:", objc_msgSend(v35, "count"));
          v20 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "legs");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "count");
          -[NSObject routeLegs](v15, "routeLegs");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "count");

          v122 = self;
          startingStepIndex = self->_startingStepIndex;
          -[NSObject routeLegs](v15, "routeLegs");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v40, "count");

          if (v41)
          {
            v129 = 0;
            v117 = v37;
            v119 = v37 - v39;
            v120 = v39;
            v42 = 0;
            v43 = 0.0;
            v44 = 0.0;
            v124 = v15;
            v125 = v7;
            v118 = v20;
            location = &self->_geoETAWaypointRoute;
            while (1)
            {
              -[GEOETATrafficUpdateWaypointRoute routeLegs](*p_geoETAWaypointRoute, "routeLegs");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "objectAtIndexedSubscript:", v42);
              v46 = (void *)objc_claimAutoreleasedReturnValue();

              -[NSObject routeLegs](v15, "routeLegs");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v123 = v42;
              objc_msgSend(v47, "objectAtIndexedSubscript:", v42);
              v48 = (void *)objc_claimAutoreleasedReturnValue();

              v127 = v46;
              objc_msgSend(v46, "steps");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v50 = objc_msgSend(v49, "count");
              objc_msgSend(v48, "steps");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = objc_msgSend(v51, "count");

              if (v50 != v52)
                break;
              v53 = (void *)MEMORY[0x1E0C99DE8];
              objc_msgSend(v48, "steps");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "arrayWithCapacity:", objc_msgSend(v54, "count"));
              v128 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v48, "steps");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              v56 = objc_msgSend(v55, "count");

              if (v56)
              {
                v57 = 0;
                v58 = 0.0;
                while (1)
                {
                  objc_msgSend(v127, "steps");
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v59, "objectAtIndexedSubscript:", v57);
                  v60 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v48, "steps");
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v61, "objectAtIndexedSubscript:", v57);
                  v62 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v62, "setDistanceCm:", objc_msgSend(v60, "distanceCm"));
                  v63 = objc_msgSend(v62, "expectedTime");
                  v64 = objc_msgSend(v60, "distanceCm");
                  v65 = objc_alloc_init(GEOComposedETARouteStep);
                  -[GEOComposedETARouteStep setStepID:](v65, "setStepID:", objc_msgSend(v62, "stepID"));
                  -[GEOComposedETARouteStep setTravelDuration:](v65, "setTravelDuration:", (double)objc_msgSend(v62, "expectedTime"));
                  -[GEOComposedETARouteStep setLength:](v65, "setLength:", (float)objc_msgSend(v60, "distanceCm") * 0.01);
                  objc_msgSend(v128, "addObject:", v65);
                  objc_msgSend(v7, "steps");
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  if (startingStepIndex + v57 >= objc_msgSend(v66, "count"))
                  {

                    v129 = 0;
                    goto LABEL_34;
                  }
                  objc_msgSend(v7, "steps");
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v67, "objectAtIndexedSubscript:", startingStepIndex + v57);
                  v68 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v68)
                  {
                    v129 = 0;
LABEL_33:
                    v7 = v125;
LABEL_34:
                    GEOGetGEOComposedETARouteLog();
                    v73 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
                    {
                      objc_msgSend(v7, "steps");
                      v74 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412546;
                      *(_QWORD *)v131 = v124;
                      *(_WORD *)&v131[8] = 2112;
                      *(_QWORD *)&v131[10] = v74;
                      _os_log_impl(&dword_1885A9000, v73, OS_LOG_TYPE_ERROR, "Error finding associated GEOComposedRouteStep %@ | Route steps: %@", buf, 0x16u);

                    }
                    goto LABEL_37;
                  }
                  v69 = objc_msgSend(v68, "stepID");
                  v129 = v68;
                  if (-[GEOComposedETARouteStep stepID](v65, "stepID") != v69)
                    goto LABEL_33;
                  v70 = objc_msgSend(v68, "routeCoordinateRange");
                  if (v57)
                  {
                    startRouteCoordinate = v70;
                    v7 = v125;
                  }
                  else
                  {
                    startRouteCoordinate = (uint64_t)v122->_startRouteCoordinate;
                    if ((_DWORD)startRouteCoordinate == (_DWORD)v70)
                    {
                      v7 = v125;
                      if (*((float *)&startRouteCoordinate + 1) == *((float *)&v70 + 1)
                        || *((float *)&startRouteCoordinate + 1) >= *((float *)&v70 + 1))
                      {
                        goto LABEL_30;
                      }
LABEL_44:
                      startRouteCoordinate = v70;
                      goto LABEL_30;
                    }
                    v7 = v125;
                    if (startRouteCoordinate < v70)
                      goto LABEL_44;
                  }
LABEL_30:
                  -[GEOComposedETARouteStep setRouteCoordinateRange:](v65, "setRouteCoordinateRange:", startRouteCoordinate, v71);
LABEL_37:
                  v43 = v43 + (double)v63;
                  v58 = v58 + (float)v64 * 0.01;

                  ++v57;
                  objc_msgSend(v48, "steps");
                  v75 = (void *)objc_claimAutoreleasedReturnValue();
                  v76 = objc_msgSend(v75, "count");

                  if (v57 >= v76)
                  {
                    startingStepIndex += v57;
                    v15 = v124;
                    v20 = v118;
                    goto LABEL_46;
                  }
                }
              }
              v58 = 0.0;
LABEL_46:
              v77 = objc_alloc_init(GEOComposedETARouteLeg);
              v78 = v123;
              -[GEOComposedETARouteLeg setOriginalLegIndex:](v77, "setOriginalLegIndex:", v123 + v119);
              -[GEOComposedETARouteLeg setLength:](v77, "setLength:", v58);
              -[GEOComposedETARouteLeg setSteps:](v77, "setSteps:", v128);
              objc_msgSend(v48, "originWaypointInfo");
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              -[GEOComposedETARouteLeg setOriginWaypointInfo:](v77, "setOriginWaypointInfo:", v79);

              objc_msgSend(v48, "destinationWaypointInfo");
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              -[GEOComposedETARouteLeg setDestinationWaypointInfo:](v77, "setDestinationWaypointInfo:", v80);

              objc_msgSend(v48, "destinationWaypointInfo");
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v81, "evChargingInfo");
              v82 = (void *)objc_claimAutoreleasedReturnValue();

              if (v82)
              {
                v83 = [GEOComposedRouteEVChargingStationInfo alloc];
                objc_msgSend(v81, "evChargingInfo");
                v84 = (void *)objc_claimAutoreleasedReturnValue();
                v85 = objc_msgSend(v81, "muid");
                objc_msgSend(v81, "name");
                v86 = (void *)objc_claimAutoreleasedReturnValue();
                v87 = v85;
                v78 = v123;
                v88 = -[GEOComposedRouteEVChargingStationInfo initWithGeoEVChargingInfo:muid:name:](v83, "initWithGeoEVChargingInfo:muid:name:", v84, v87, v86);
                -[GEOComposedETARouteLeg setChargingStationInfo:](v77, "setChargingStationInfo:", v88);

                v7 = v125;
              }
              if (!v78 && v117 != v120)
              {
                objc_msgSend(v48, "originWaypointInfo");
                v89 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v89, "evChargingInfo");
                v90 = (void *)objc_claimAutoreleasedReturnValue();

                if (v90)
                {
                  v91 = objc_alloc_init(GEOComposedETARouteLeg);
                  -[GEOComposedETARouteLeg setOriginalLegIndex:](v91, "setOriginalLegIndex:", v123 + v119 - 1);
                  GEOGetGEOComposedETARouteLog();
                  v92 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
                  {
                    v93 = -[GEOComposedETARouteLeg originalLegIndex](v91, "originalLegIndex");
                    objc_msgSend(v89, "evChargingInfo");
                    v94 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v94, "formattedText");
                    v95 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 67109378;
                    *(_DWORD *)v131 = v93;
                    *(_WORD *)&v131[4] = 2112;
                    *(_QWORD *)&v131[6] = v95;
                    _os_log_impl(&dword_1885A9000, v92, OS_LOG_TYPE_INFO, "Inserting synthetic leg (%d) with next leg's origin waypoint info:\n%@", buf, 0x12u);

                  }
                  v96 = [GEOComposedRouteEVChargingStationInfo alloc];
                  objc_msgSend(v89, "evChargingInfo");
                  v97 = (void *)objc_claimAutoreleasedReturnValue();
                  v98 = objc_msgSend(v89, "muid");
                  objc_msgSend(v89, "name");
                  v99 = (void *)objc_claimAutoreleasedReturnValue();
                  v100 = -[GEOComposedRouteEVChargingStationInfo initWithGeoEVChargingInfo:muid:name:](v96, "initWithGeoEVChargingInfo:muid:name:", v97, v98, v99);
                  -[GEOComposedETARouteLeg setChargingStationInfo:](v91, "setChargingStationInfo:", v100);

                  v20 = v118;
                  -[NSObject addObject:](v118, "addObject:", v91);

                  v7 = v125;
                }

                v78 = v123;
              }
              -[NSObject addObject:](v20, "addObject:", v77);

              v44 = v44 + v58;
              v42 = v78 + 1;
              -[NSObject routeLegs](v15, "routeLegs");
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              v102 = objc_msgSend(v101, "count");

              p_geoETAWaypointRoute = location;
              if (v42 >= v102)
                goto LABEL_63;
            }
            GEOGetGEOComposedETARouteLog();
            v113 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
            {
              v114 = *p_geoETAWaypointRoute;
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)v131 = v15;
              *(_WORD *)&v131[8] = 2112;
              *(_QWORD *)&v131[10] = v114;
              _os_log_impl(&dword_1885A9000, v113, OS_LOG_TYPE_ERROR, "Number of steps in ETAU response waypointRoute %@ does not match request %@", buf, 0x16u);
            }

            v25 = 0;
            v6 = v116;
            v109 = v127;
          }
          else
          {
            v129 = 0;
            v44 = 0.0;
            v43 = 0.0;
LABEL_63:
            objc_storeStrong((id *)p_geoETAWaypointRoute, v15);
            v122->_travelDuration = v43;
            -[GEOETATrafficUpdateWaypointRoute traversalTimes](v122->_geoETAWaypointRoute, "traversalTimes");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            v122->_historicTravelDuration = (double)objc_msgSend(v104, "historicalEstimatedSeconds");

            -[GEOETATrafficUpdateWaypointRoute traversalTimes](v122->_geoETAWaypointRoute, "traversalTimes");
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            v122->_travelDurationAggressiveEstimate = (double)objc_msgSend(v105, "aggressiveEstimatedSeconds");

            -[GEOETATrafficUpdateWaypointRoute traversalTimes](v122->_geoETAWaypointRoute, "traversalTimes");
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            v122->_travelDurationConservativeEstimate = (double)objc_msgSend(v106, "conservativeEstimatedSeconds");

            v122->_length = v44;
            objc_storeStrong((id *)&v122->_legs, v20);
            v6 = v116;
            if (objc_msgSend(v116, "displayedEta"))
            {
              objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v116, "displayedEta"));
              v107 = objc_claimAutoreleasedReturnValue();
              serverDisplayETA = v122->_serverDisplayETA;
              v122->_serverDisplayETA = (NSDate *)v107;

            }
            objc_msgSend(v116, "responseId");
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            if (v109)
            {
              v110 = (NSUUID *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v109, 4);
              v111 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v110);
              etauResponseID = v122->_etauResponseID;
              v122->_etauResponseID = (NSUUID *)v111;

            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
              v115 = objc_claimAutoreleasedReturnValue();
              v110 = v122->_etauResponseID;
              v122->_etauResponseID = (NSUUID *)v115;
            }

            v25 = 1;
            v122->_hasValidTravelDurations = 1;
          }

          goto LABEL_61;
        }
        GEOGetGEOComposedETARouteLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v103 = *p_geoETAWaypointRoute;
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v131 = v15;
          *(_WORD *)&v131[8] = 2112;
          *(_QWORD *)&v131[10] = v103;
          v27 = "Number of legs in ETAU response waypointRoute %@ does not match request %@";
          v28 = v20;
          v29 = 22;
          goto LABEL_59;
        }
      }
      else
      {
        GEOGetGEOComposedETARouteLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v131 = v6;
          v27 = "No waypointRoute found in ETAU response: %@";
          v28 = v20;
          v29 = 12;
LABEL_59:
          _os_log_impl(&dword_1885A9000, v28, OS_LOG_TYPE_ERROR, v27, buf, v29);
        }
      }
LABEL_60:
      v25 = 0;
LABEL_61:

      goto LABEL_16;
    }
    GEOGetGEOComposedETARouteLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v22 = "Missing GEOETATrafficUpdateWaypointRoute when updating GEOETATrafficUpdateResponse for given route.";
      goto LABEL_14;
    }
  }
  else
  {
    GEOGetGEOComposedETARouteLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v22 = "Error updating GEOComposedETARoute from response because _uniqueRouteID is nil. This probably means -prepare"
            "ForRequest: wasn't called.";
LABEL_14:
      _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_ERROR, v22, buf, 2u);
    }
  }
LABEL_15:
  v25 = 0;
LABEL_16:

  return v25;
}

- (void)invalidateServerDisplayETA
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSDate *serverDisplayETA;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_serverDisplayETA)
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(v3, "setDateFormat:", CFSTR("h:mm:ss a"));
    GEOGetGEOComposedETARouteLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "stringFromDate:", self->_serverDisplayETA);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_DEFAULT, "Invalidating server display ETA of %@", (uint8_t *)&v7, 0xCu);

    }
    serverDisplayETA = self->_serverDisplayETA;
    self->_serverDisplayETA = 0;

  }
}

- (double)travelDurationToEndOfRouteFromStepID:(unint64_t)a3 currentStepRemainingDistance:(double)a4
{
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  NSObject *v12;
  int v14;
  GEOComposedETARoute *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[NSArray lastObject](self->_legs, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "steps");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[GEOComposedETARoute _travelDurationFromStepID:toStepID:currentStepRemainingDistance:](self, "_travelDurationFromStepID:toStepID:currentStepRemainingDistance:", a3, objc_msgSend(v9, "stepID"), a4);
    v11 = v10;
  }
  else
  {
    GEOGetGEOComposedETARouteLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = 138412290;
      v15 = self;
      _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_ERROR, "Error computing travelDuration because last step on route was not found: %@", (uint8_t *)&v14, 0xCu);
    }

    v11 = 978307200.0;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      LOWORD(v14) = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: lastStepOnRoute != ((void *)0)", (uint8_t *)&v14, 2u);
    }
  }

  return v11;
}

- (double)travelDurationToEndOfLegFromStepID:(unint64_t)a3 currentStepRemainingDistance:(double)a4
{
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  NSObject *v15;
  double v16;
  double v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  GEOComposedETARoute *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = self->_legs;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v10)
        objc_enumerationMutation(v7);
      objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v11), "steps", (_QWORD)v19);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "stepID");

      if (v14 >= a3)
        break;
      if (v9 == ++v11)
      {
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_9;
      }
    }

    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_11;
    -[GEOComposedETARoute _travelDurationFromStepID:toStepID:currentStepRemainingDistance:](self, "_travelDurationFromStepID:toStepID:currentStepRemainingDistance:", a3, v14, a4);
    return v17;
  }
  else
  {
LABEL_9:

LABEL_11:
    GEOGetGEOComposedETARouteLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      v24 = -1;
      v25 = 2112;
      v26 = self;
      _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_ERROR, "Error computing travelDuration because endStepID (%d) is not on the route: %@", buf, 0x12u);
    }

    v16 = 978307200.0;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: endStepID != NSNotFound", buf, 2u);
    }
  }
  return v16;
}

- (id)geoTrafficBannerTexts
{
  void *geoETAWaypointRoute;

  geoETAWaypointRoute = self->_geoETAWaypointRoute;
  if (geoETAWaypointRoute)
  {
    objc_msgSend(geoETAWaypointRoute, "trafficBannerTexts");
    geoETAWaypointRoute = (void *)objc_claimAutoreleasedReturnValue();
  }
  return geoETAWaypointRoute;
}

- (id)navigabilityInfo
{
  void *geoETAWaypointRoute;

  geoETAWaypointRoute = self->_geoETAWaypointRoute;
  if (geoETAWaypointRoute)
  {
    objc_msgSend(geoETAWaypointRoute, "navigabilityInfo");
    geoETAWaypointRoute = (void *)objc_claimAutoreleasedReturnValue();
  }
  return geoETAWaypointRoute;
}

- (id)evStepInfos
{
  GEOETATrafficUpdateWaypointRoute *geoETAWaypointRoute;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  GEOComposedRouteEVStepInfo *v13;
  void *v14;
  GEOComposedRouteEVStepInfo *v15;
  void *v16;
  id obj;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  geoETAWaypointRoute = self->_geoETAWaypointRoute;
  if (geoETAWaypointRoute)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[GEOETATrafficUpdateWaypointRoute routeLegs](geoETAWaypointRoute, "routeLegs");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    v3 = 0;
    if (v20)
    {
      v19 = *(_QWORD *)v27;
      do
      {
        v4 = 0;
        do
        {
          if (*(_QWORD *)v27 != v19)
            objc_enumerationMutation(obj);
          v21 = v4;
          v5 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v4);
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          objc_msgSend(v5, "steps");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          if (v7)
          {
            v8 = v7;
            v9 = *(_QWORD *)v23;
            do
            {
              for (i = 0; i != v8; ++i)
              {
                if (*(_QWORD *)v23 != v9)
                  objc_enumerationMutation(v6);
                v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
                objc_msgSend(v11, "evStateInfo");
                v12 = (void *)objc_claimAutoreleasedReturnValue();

                if (v12)
                {
                  v13 = [GEOComposedRouteEVStepInfo alloc];
                  objc_msgSend(v11, "evStateInfo");
                  v14 = (void *)objc_claimAutoreleasedReturnValue();
                  v15 = -[GEOComposedRouteEVStepInfo initWithEVStateInfo:](v13, "initWithEVStateInfo:", v14);

                  if (!v3)
                  {
                    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                    v3 = (void *)objc_claimAutoreleasedReturnValue();
                  }
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v11, "stepID"));
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, v16);

                }
              }
              v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            }
            while (v8);
          }

          v4 = v21 + 1;
        }
        while (v21 + 1 != v20);
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v20);
    }

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)evChargingStationInfos
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!self->_geoETAWaypointRoute)
    return 0;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = self->_legs;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v8, "chargingStationInfo", (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          if (!v5)
          {
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
            v5 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v8, "chargingStationInfo");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "originalLegIndex"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, v11);

        }
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (double)_travelDurationFromStepID:(unint64_t)a3 toStepID:(unint64_t)a4 currentStepRemainingDistance:(double)a5
{
  NSArray *v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v8 = self->_legs;
  v27 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v27)
  {
    v9 = *(_QWORD *)v33;
    v10 = 0.0;
    v26 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        objc_msgSend(v12, "steps", v26);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v29;
          while (2)
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v29 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
              if (objc_msgSend(v18, "stepID") >= a3)
              {
                v19 = objc_msgSend(v18, "stepID");
                objc_msgSend(v18, "travelDuration");
                v21 = v20;
                if (v19 == a3)
                {
                  objc_msgSend(v18, "length");
                  v23 = v22;
                  objc_msgSend(v18, "timeCheckpoints");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  v21 = GEORemainingTimeForRemainingDistanceAlongStep(v24, a5, v21, v23);

                }
                v10 = v10 + v21;
                if (objc_msgSend(v18, "stepID") == a4)
                {

                  goto LABEL_22;
                }
              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
            if (v15)
              continue;
            break;
          }
        }

        v9 = v26;
      }
      v27 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v27);
  }
  else
  {
    v10 = 0.0;
  }
LABEL_22:

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedETARoute)initWithCoder:(id)a3
{
  id v4;
  GEOComposedETARoute *v5;
  uint64_t v6;
  NSUUID *uniqueRouteID;
  uint64_t v8;
  NSUUID *etauResponseID;
  uint64_t v10;
  NSDate *responseDate;
  uint64_t v12;
  NSArray *legs;
  uint64_t v14;
  NSDate *serverDisplayETA;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  const void *v22;
  size_t v23;
  uint64_t v24;
  GEOETATrafficUpdateWaypointRoute *geoETAWaypointRoute;
  GEOComposedETARoute *v26;
  unint64_t v28;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)GEOComposedETARoute;
  v5 = -[GEOComposedETARoute init](&v29, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_uniqueRouteID"));
    v6 = objc_claimAutoreleasedReturnValue();
    uniqueRouteID = v5->_uniqueRouteID;
    v5->_uniqueRouteID = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_etauResponseID"));
    v8 = objc_claimAutoreleasedReturnValue();
    etauResponseID = v5->_etauResponseID;
    v5->_etauResponseID = (NSUUID *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_responseDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    responseDate = v5->_responseDate;
    v5->_responseDate = (NSDate *)v10;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_legs"));
    v12 = objc_claimAutoreleasedReturnValue();
    legs = v5->_legs;
    v5->_legs = (NSArray *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_serverDisplayETA"));
    v14 = objc_claimAutoreleasedReturnValue();
    serverDisplayETA = v5->_serverDisplayETA;
    v5->_serverDisplayETA = (NSDate *)v14;

    v5->_hasValidTravelDurations = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_hasValidTravelDurations"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_travelDuration"));
    v5->_travelDuration = v16;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_historicTravelDuration"));
    v5->_historicTravelDuration = v17;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_travelDurationAggressiveEstimate"));
    v5->_travelDurationAggressiveEstimate = v18;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_travelDurationConservativeEstimate"));
    v5->_travelDurationConservativeEstimate = v19;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_length"));
    v5->_length = v20;
    v28 = 0;
    v21 = objc_retainAutorelease(v4);
    v22 = (const void *)objc_msgSend(v21, "decodeBytesForKey:returnedLength:", CFSTR("_startRouteCoordinate"), &v28);
    if (v28 && v22)
    {
      if (v28 >= 8)
        v23 = 8;
      else
        v23 = v28;
      memcpy(&v5->_startRouteCoordinate, v22, v23);
    }
    objc_msgSend(v21, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_geoETAWaypointRoute"));
    v24 = objc_claimAutoreleasedReturnValue();
    geoETAWaypointRoute = v5->_geoETAWaypointRoute;
    v5->_geoETAWaypointRoute = (GEOETATrafficUpdateWaypointRoute *)v24;

    v26 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *uniqueRouteID;
  id v5;

  uniqueRouteID = self->_uniqueRouteID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", uniqueRouteID, CFSTR("_uniqueRouteID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_etauResponseID, CFSTR("_etauResponseID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_responseDate, CFSTR("_responseDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_legs, CFSTR("_legs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serverDisplayETA, CFSTR("_serverDisplayETA"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasValidTravelDurations, CFSTR("_hasValidTravelDurations"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_travelDuration"), self->_travelDuration);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_historicTravelDuration"), self->_historicTravelDuration);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_travelDurationAggressiveEstimate"), self->_travelDurationAggressiveEstimate);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_travelDurationConservativeEstimate"), self->_travelDurationConservativeEstimate);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_length"), self->_length);
  objc_msgSend(v5, "encodeBytes:length:forKey:", &self->_startRouteCoordinate, 8, CFSTR("_startRouteCoordinate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_geoETAWaypointRoute, CFSTR("_geoETAWaypointRoute"));

}

- (id)description
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Response date: %@"), self->_responseDate);
  -[NSDate timeIntervalSinceReferenceDate](self->_serverDisplayETA, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "appendFormat:", CFSTR("Server display ETA: %u"), v4);
  -[NSArray lastObject](self->_legs, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "steps");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "stepID");

  if (v8)
    v9 = (unint64_t)log10((double)v8) + 1;
  else
    v9 = 1;
  if (-[NSArray count](self->_legs, "count"))
  {
    v10 = 0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_legs, "objectAtIndexedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "descriptionWithPrecision:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("\nLeg %d\n%@"), v10, v12);

      ++v10;
    }
    while (v10 < -[NSArray count](self->_legs, "count"));
  }
  return v3;
}

- (NSUUID)uniqueRouteID
{
  return self->_uniqueRouteID;
}

- (NSUUID)etauResponseID
{
  return self->_etauResponseID;
}

- (NSDate)responseDate
{
  return self->_responseDate;
}

- (NSArray)legs
{
  return self->_legs;
}

- (NSDate)serverDisplayETA
{
  return self->_serverDisplayETA;
}

- (BOOL)hasValidTravelDurations
{
  return self->_hasValidTravelDurations;
}

- (double)travelDuration
{
  return self->_travelDuration;
}

- (double)historicTravelDuration
{
  return self->_historicTravelDuration;
}

- (double)travelDurationAggressiveEstimate
{
  return self->_travelDurationAggressiveEstimate;
}

- (double)travelDurationConservativeEstimate
{
  return self->_travelDurationConservativeEstimate;
}

- (double)length
{
  return self->_length;
}

- ($212C09783140BCCD23384160D545CE0D)startRouteCoordinate
{
  return ($212C09783140BCCD23384160D545CE0D)self->_startRouteCoordinate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoETAWaypointRoute, 0);
  objc_storeStrong((id *)&self->_serverDisplayETA, 0);
  objc_storeStrong((id *)&self->_legs, 0);
  objc_storeStrong((id *)&self->_responseDate, 0);
  objc_storeStrong((id *)&self->_etauResponseID, 0);
  objc_storeStrong((id *)&self->_uniqueRouteID, 0);
}

- (GEOComposedETARoute)initWithRouteForTesting:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GEOComposedETARoute;
  return -[GEOComposedETARoute init](&v4, sel_init, a3);
}

- (id)geoETAWaypointRoute
{
  return self->_geoETAWaypointRoute;
}

@end
