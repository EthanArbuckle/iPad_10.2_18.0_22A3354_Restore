@implementation GEORouteBuilder

+ (id)outputForGeoWaypointRoute:(id)a3 initializerData:(id)a4 custodian:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  GEORouteBuilderOutput *v11;
  NSObject *v12;
  uint64_t v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  GEORouteBuilderOutput *v40;
  NSObject *v42;
  const char *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  uint8_t buf[4];
  __CFString *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (!v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v42 = MEMORY[0x1E0C81028];
      v43 = "Assertion failed: geoWaypointRoute != nullptr";
      goto LABEL_32;
    }
LABEL_30:
    v40 = 0;
    goto LABEL_24;
  }
  if (!v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v42 = MEMORY[0x1E0C81028];
      v43 = "Assertion failed: initializerData != nullptr";
      goto LABEL_32;
    }
    goto LABEL_30;
  }
  if (!v9)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_30;
    *(_WORD *)buf = 0;
    v42 = MEMORY[0x1E0C81028];
    v43 = "Assertion failed: custodian != nullptr";
LABEL_32:
    _os_log_fault_impl(&dword_1885A9000, v42, OS_LOG_TYPE_FAULT, v43, buf, 2u);
    goto LABEL_30;
  }
  v45 = v9;
  v11 = objc_alloc_init(GEORouteBuilderOutput);
  GEOGetGEORouteBuilderLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = objc_msgSend(v7, "transportType");
    if (v13 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v13);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_1E1C0F4A0[(int)v13];
    }
    *(_DWORD *)buf = 138412290;
    v50 = v14;
    _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_INFO, "Generating output for GEOWaypointRoute (%@)", buf, 0xCu);

  }
  +[GEORouteBuilder _coordinatesForGeoWaypointRoute:](GEORouteBuilder, "_coordinatesForGeoWaypointRoute:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "coordinateCount"))
  {
    GEOGetGEORouteBuilderLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v18, OS_LOG_TYPE_ERROR, "Coordinate array has 0 coordinates. Routes with no geometry aren't supported yet.", buf, 2u);
    }
    v40 = 0;
    goto LABEL_23;
  }
  -[GEORouteBuilderOutput setCoordinatesArray:](v11, "setCoordinatesArray:", v15);
  objc_msgSend(v8, "directionsResponse");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "responseAttributes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORouteBuilderOutput setElevationModel:](v11, "setElevationModel:", objc_msgSend(v17, "elevationModel"));

  v47 = 0;
  v48 = 0;
  v46 = 0;
  +[GEORouteBuilder _componentsForGeoWaypointRoute:initializerData:coordinates:custodian:outLegs:outSegments:outSteps:](GEORouteBuilder, "_componentsForGeoWaypointRoute:initializerData:coordinates:custodian:outLegs:outSegments:outSteps:", v7, v8, v15, v45, &v48, &v47, &v46);
  v18 = v48;
  v44 = v47;
  v19 = v46;
  -[GEORouteBuilderOutput setLegs:](v11, "setLegs:", v18);
  -[GEORouteBuilderOutput setSegments:](v11, "setSegments:", v44);
  -[GEORouteBuilderOutput setSteps:](v11, "setSteps:", v19);
  -[GEORouteBuilderOutput steps](v11, "steps");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORouteBuilderOutput segments](v11, "segments");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEORouteBuilder buildPointSectionsWithSteps:segments:coordinates:](GEORouteBuilder, "buildPointSectionsWithSteps:segments:coordinates:", v20, v21, v15);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORouteBuilderOutput setPointSections:](v11, "setPointSections:", v22);

  -[GEORouteBuilderOutput pointSections](v11, "pointSections");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEORouteBuilder buildMapRegionFromPointSections:](GEORouteBuilder, "buildMapRegionFromPointSections:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORouteBuilderOutput setBoundingMapRegion:](v11, "setBoundingMapRegion:", v24);

  -[GEORouteBuilderOutput setDistance:](v11, "setDistance:", (double)objc_msgSend(v7, "distanceMeters"));
  +[GEORouteBuilder _guidanceEventsForGeoWaypointRoute:legs:steps:coordinates:](GEORouteBuilder, "_guidanceEventsForGeoWaypointRoute:legs:steps:coordinates:", v7, v18, v19, v15);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORouteBuilderOutput setGuidanceEvents:](v11, "setGuidanceEvents:", v25);

  +[GEORouteBuilder _cellularCoverageForGeoWaypointRoute:coordinates:](GEORouteBuilder, "_cellularCoverageForGeoWaypointRoute:coordinates:", v7, v15);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORouteBuilderOutput setCellularCoverage:](v11, "setCellularCoverage:", v26);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORouteBuilderOutput guidanceEvents](v11, "guidanceEvents");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEORouteBuilder _visualInfosForGuidanceEvents:steps:coordinates:](GEORouteBuilder, "_visualInfosForGuidanceEvents:steps:coordinates:", v28, v19, v15);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObjectsFromArray:", v29);

  +[GEOComposedRouteVisualInfo visualInfosForGeoWaypointRoute:coordinates:updateable:](GEOComposedRouteVisualInfo, "visualInfosForGeoWaypointRoute:coordinates:updateable:", v7, v15, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObjectsFromArray:", v30);

  if (objc_msgSend(v27, "count"))
    v31 = v27;
  else
    v31 = 0;
  -[GEORouteBuilderOutput setVisualInfos:](v11, "setVisualInfos:", v31);
  +[GEOComposedRouteVisualInfo visualInfosForRouteLabelsForGeoWaypointRoute:coordinates:](GEOComposedRouteVisualInfo, "visualInfosForRouteLabelsForGeoWaypointRoute:coordinates:", v7, v15);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORouteBuilderOutput setVisualInfosForRouteNameLabels:](v11, "setVisualInfosForRouteNameLabels:", v32);

  +[GEOComposedRouteVisualInfo cameraInfosForGeoWaypointRoute:coordinates:updateable:](GEOComposedRouteVisualInfo, "cameraInfosForGeoWaypointRoute:coordinates:updateable:", v7, v15, 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORouteBuilderOutput setCameraInfos:](v11, "setCameraInfos:", v33);

  objc_msgSend(v7, "routeLegs");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "firstObject");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "elevationProfile");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORouteBuilderOutput setElevationProfile:](v11, "setElevationProfile:", v36);

  -[GEORouteBuilderOutput setSource:](v11, "setSource:", 1);
  objc_msgSend(v8, "directionsRequest");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "originalWaypointRoute");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[GEORouteBuilder _shouldPreserveRouteSourceForPurpose:](GEORouteBuilder, "_shouldPreserveRouteSourceForPurpose:", objc_msgSend(v38, "purpose")))
  {
    if (objc_msgSend(v38, "creationMethod") == 1)
    {
      v39 = 3;
LABEL_21:
      -[GEORouteBuilderOutput setSource:](v11, "setSource:", v39);
      goto LABEL_22;
    }
    if (objc_msgSend(v38, "creationMethod") == 2)
    {
      v39 = 2;
      goto LABEL_21;
    }
  }
LABEL_22:
  v40 = v11;

LABEL_23:
  v10 = v45;
LABEL_24:

  return v40;
}

+ (BOOL)_shouldPreserveRouteSourceForPurpose:(int)a3
{
  return (a3 < 0xE) & (0x3602u >> a3);
}

+ (id)_coordinatesForGeoWaypointRoute:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int BOOL;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
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
  void *v25;
  void *v26;
  unint64_t i;
  void *v28;
  BOOL v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  float v37;
  GEOComposedRouteLengthMarker *v38;
  float v39;
  GEOComposedRouteCoordinateArray *v40;
  NSObject *v41;
  int v42;
  const char *v43;
  GEOComposedRouteCoordinateArray *v44;
  void *v45;
  uint64_t v47;
  void *v49;
  void *v50;
  NSObject *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t v56[128];
  uint8_t buf[4];
  int v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v50 = v3;
    objc_msgSend(v3, "routeLegs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pathLeg");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      BOOL = GEOConfigGetBOOL(GeoServicesConfig_RequestRoutingPathPoints, (uint64_t)off_1EDF4D638);

      if (BOOL)
      {
        v9 = (void *)MEMORY[0x1E0C99DE8];
        objc_msgSend(v4, "routeLegs");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "arrayWithCapacity:", objc_msgSend(v10, "count"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = 0;
        v12 = 0;
        while (1)
        {
          objc_msgSend(v4, "routeLegs");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "count");

          if (v11 >= v14)
            break;
          objc_msgSend(v4, "routeLegs");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectAtIndexedSubscript:", v11);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "pathLeg");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "addObject:", v17);

          objc_msgSend(v16, "pathMapMatcherInstructions");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            if (!v12)
            {
              objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v16, "pathMapMatcherInstructions");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, v20);

          }
          ++v11;
        }
        v44 = [GEOComposedRouteCoordinateArray alloc];
        objc_msgSend(v4, "rawRouteGeometry");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = -[GEOComposedRouteCoordinateArray initWithRawRouteGeometry:](v44, "initWithRawRouteGeometry:", v45);

        GEOGetGEORouteBuilderLog();
        v41 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          goto LABEL_30;
        *(_DWORD *)buf = 67174657;
        v58 = -[GEOComposedRouteCoordinateArray coordinateCount](v40, "coordinateCount");
        v43 = "Generated coordinates using routing path points. Count: %{private}d";
LABEL_29:
        _os_log_impl(&dword_1885A9000, v41, OS_LOG_TYPE_INFO, v43, buf, 8u);
LABEL_30:

        v4 = v50;
        goto LABEL_31;
      }
    }
    else
    {

    }
    v21 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v4, "routeLegs");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "arrayWithCapacity:", objc_msgSend(v22, "count"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v50;
    objc_msgSend(v50, "routeLegs");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "firstObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "zilchPoints");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v26, "count");

    for (i = 0; ; ++i)
    {
      objc_msgSend(v23, "routeLegs");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = i < objc_msgSend(v28, "count");

      if (!v29)
        break;
      objc_msgSend(v50, "routeLegs");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectAtIndexedSubscript:", i);
      v51 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "_unpackedPointsDataForGeoRoute:", v51);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v31)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: legPointsData != nullptr", buf, 2u);
        }
        v40 = 0;
        v41 = v51;
        goto LABEL_30;
      }
      objc_msgSend(v49, "addObject:", v31);
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      -[NSObject steps](v51, "steps");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
      if (v33)
      {
        v34 = *(_QWORD *)v53;
        do
        {
          for (j = 0; j != v33; ++j)
          {
            if (*(_QWORD *)v53 != v34)
              objc_enumerationMutation(v32);
            v36 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * j);
            objc_msgSend(v36, "distanceMeters");
            if (fabsf(v37) >= 1.0e-12)
            {
              v38 = objc_alloc_init(GEOComposedRouteLengthMarker);
              -[GEOComposedRouteLengthMarker setPathIndex:](v38, "setPathIndex:", i);
              -[GEOComposedRouteLengthMarker setPointIndex:](v38, "setPointIndex:", objc_msgSend(v36, "maneuverEndIndex"));
              objc_msgSend(v36, "distanceMeters");
              -[GEOComposedRouteLengthMarker setLength:](v38, "setLength:", v39);
              objc_msgSend(v12, "addObject:", v38);

            }
          }
          v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
        }
        while (v33);
      }

      v23 = v50;
    }
    v40 = -[GEOComposedRouteCoordinateArray initWithPointData:lengthMarkers:usesZilch:]([GEOComposedRouteCoordinateArray alloc], "initWithPointData:lengthMarkers:usesZilch:", v49, v12, v47 != 0);
    GEOGetGEORouteBuilderLog();
    v41 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      goto LABEL_30;
    v42 = -[GEOComposedRouteCoordinateArray coordinateCount](v40, "coordinateCount");
    *(_DWORD *)buf = 67174657;
    v58 = v42;
    v43 = "Generated coordinates using zilch points. Count: %{private}d";
    goto LABEL_29;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: geoWaypointRoute != nullptr", buf, 2u);
  }
  v40 = 0;
LABEL_31:

  return v40;
}

+ (id)_unpackedPointsDataForGeoRoute:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint8_t v13[16];

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "zilchPoints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      objc_msgSend(v4, "zilchPoints");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[GEOPointUtility unpackPoints:usesZilch:](GEOPointUtility, "unpackPoints:usesZilch:", v8, 1);
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v11 = (void *)v9;

      goto LABEL_7;
    }
    objc_msgSend(v4, "basicPoints");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "basicPoints");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[GEOPointUtility unpackPoints:usesZilch:](GEOPointUtility, "unpackPoints:usesZilch:", v8, 0);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    objc_msgSend(v4, "unpackedLatLngVertices");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v4, "unpackedLatLngVertices");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: geoRoute != nullptr", v13, 2u);
    }
    v11 = 0;
  }
LABEL_7:

  return v11;
}

+ (void)_componentsForGeoWaypointRoute:(id)a3 initializerData:(id)a4 coordinates:(id)a5 custodian:(id)a6 outLegs:(id *)a7 outSegments:(id *)a8 outSteps:(id *)a9
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  BOOL v37;
  void *v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  double v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  _BOOL4 v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  id v63;
  void *v64;
  id v65;
  int v66;
  void *v67;
  unsigned int v68;
  void *v69;
  void *v70;
  _BOOL4 v71;
  void *v72;
  void *v73;
  NSObject *v74;
  uint64_t v75;
  __CFString *v76;
  void *v77;
  _BOOL4 v78;
  __CFString *v79;
  __CFString *v80;
  uint64_t v81;
  __CFString *v82;
  void *v83;
  BOOL v84;
  GEOComposedWaypointEVStop *v85;
  void *v86;
  uint64_t v87;
  NSObject *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  NSObject *v93;
  __CFString *v94;
  __CFString *v95;
  NSObject *v96;
  const char *v97;
  void *v100;
  id v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  unint64_t v106;
  id v107;
  uint64_t v108;
  id obj;
  void *v110;
  void *v111;
  id v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  id v118;
  id v119;
  void *v120;
  void *v121;
  id v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  uint8_t buf[4];
  __CFString *v132;
  __int16 v133;
  __CFString *v134;
  _BYTE v135[128];
  _BYTE v136[128];
  uint64_t v137;

  v137 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v122 = a5;
  v118 = a6;
  v111 = v12;
  v100 = v13;
  if (!v12)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_106;
    *(_WORD *)buf = 0;
    v96 = MEMORY[0x1E0C81028];
    v97 = "Assertion failed: geoWaypointRoute != nullptr";
LABEL_123:
    _os_log_fault_impl(&dword_1885A9000, v96, OS_LOG_TYPE_FAULT, v97, buf, 2u);
    goto LABEL_106;
  }
  if (!v13)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_106;
    *(_WORD *)buf = 0;
    v96 = MEMORY[0x1E0C81028];
    v97 = "Assertion failed: initializerData != nullptr";
    goto LABEL_123;
  }
  objc_msgSend(v13, "waypoints");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_106;
    *(_WORD *)buf = 0;
    v96 = MEMORY[0x1E0C81028];
    v97 = "Assertion failed: initializerData.waypoints != nullptr";
    goto LABEL_123;
  }
  objc_msgSend(v13, "waypoints");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16 <= 1)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_106;
    *(_WORD *)buf = 0;
    v96 = MEMORY[0x1E0C81028];
    v97 = "Assertion failed: initializerData.waypoints.count >= 2";
    goto LABEL_123;
  }
  if (!v122)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_106;
    *(_WORD *)buf = 0;
    v96 = MEMORY[0x1E0C81028];
    v97 = "Assertion failed: coordinates != nullptr";
    goto LABEL_123;
  }
  if (!v118)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_106;
    *(_WORD *)buf = 0;
    v96 = MEMORY[0x1E0C81028];
    v97 = "Assertion failed: custodian != nullptr";
    goto LABEL_123;
  }
  v17 = objc_msgSend(v122, "pathsCount");
  if (v17 != objc_msgSend(v12, "routeLegsCount"))
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_106;
    *(_WORD *)buf = 0;
    v96 = MEMORY[0x1E0C81028];
    v97 = "Assertion failed: coordinates.pathsCount == geoWaypointRoute.routeLegsCount";
    goto LABEL_123;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v101 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v107 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v113 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "waypoints");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "firstObject");
  v105 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "waypoints");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_geo_filtered:", &__block_literal_global_12_0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = (void *)objc_msgSend(v20, "mutableCopy");

  objc_msgSend(v13, "directionsRequest");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "originalWaypointRoute");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_msgSend(v13, "directionsRequest");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "originalWaypointRoute");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "hasPurpose"))
    {
      objc_msgSend(v100, "directionsRequest");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "originalWaypointRoute");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "purpose");

      if (v27 == 1)
      {
        v28 = (void *)objc_msgSend(v102, "copy");
        v129 = 0u;
        v130 = 0u;
        v127 = 0u;
        v128 = 0u;
        objc_msgSend(v111, "routeLegs");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 0;
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v127, v136, 16);
        if (v31)
        {
          v32 = *(_QWORD *)v128;
          do
          {
            for (i = 0; i != v31; ++i)
            {
              if (*(_QWORD *)v128 != v32)
                objc_enumerationMutation(v29);
              v34 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * i);
              objc_msgSend(v34, "destinationWaypointInfo");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              if (v35)
              {
                objc_msgSend(v34, "destinationWaypointInfo");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v37 = objc_msgSend(v36, "source") == 2;

                if (v37)
                  continue;
              }
              ++v30;
            }
            v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v127, v136, 16);
          }
          while (v31);
        }

        if (v30 >= objc_msgSend(v28, "count") - 1)
        {
          v38 = v102;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v105);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v28, "subarrayWithRange:", objc_msgSend(v28, "count") - v30, v30);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "addObjectsFromArray:", v39);

          GEOGetGEORouteBuilderLog();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            v41 = objc_msgSend(v28, "count");
            v42 = objc_msgSend(v38, "count");
            *(_DWORD *)buf = 134217984;
            v132 = (__CFString *)(v41 - v42);
            _os_log_impl(&dword_1885A9000, v40, OS_LOG_TYPE_INFO, "The next %lu waypoint(s) have been removed in the new waypoint route.", buf, 0xCu);
          }

        }
        v102 = v38;
      }
      goto LABEL_27;
    }

  }
LABEL_27:
  v106 = 0;
  v43 = 0;
  v104 = 1;
  while (v106 < objc_msgSend(v111, "routeLegsCount"))
  {
    objc_msgSend(v111, "routeLegs");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "objectAtIndexedSubscript:", v106);
    v121 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = objc_msgSend(v122, "routeIndexForLocalIndex:onPath:", 0, v106);
    v45 = objc_msgSend(v122, "coordinateCountForPathAtIndex:", v106);
    if (!v45)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: legCoordinateCount > 0", buf, 2u);
      }
      v119 = 0;
      v120 = 0;
      goto LABEL_90;
    }
    v125 = 0u;
    v126 = 0u;
    v123 = 0u;
    v124 = 0u;
    objc_msgSend(v121, "steps");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    obj = v46;
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v123, v135, 16);
    v103 = v45;
    if (!v47)
    {
      v48 = 0;
      v119 = 0;
      v120 = 0;
      goto LABEL_61;
    }
    v119 = 0;
    v120 = 0;
    v48 = 0;
    v49 = v108;
    v114 = (v108 + v45 - 1);
    v115 = *(_QWORD *)v124;
    v50 = 0.0;
    v51 = v108;
    do
    {
      v116 = v47;
      v117 = v43;
      v52 = 0;
      v53 = v51;
      v54 = v48;
      do
      {
        if (*(_QWORD *)v124 != v115)
          objc_enumerationMutation(obj);
        v55 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * v52);
        v50 = v50 + (float)objc_msgSend(v55, "distanceCm") * 0.01;
        v56 = objc_msgSend(v122, "routeCoordinateForDistance:afterRouteCoordinate:", v108, v50);
        objc_msgSend(v121, "steps");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "lastObject");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = v55 == v58;

        if (v59)
          v51 = v114;
        else
          v51 = v56;
        if (objc_msgSend(v55, "hasOverrideTransportType")
          && objc_msgSend(v55, "overrideTransportType") != 4)
        {
          v60 = objc_msgSend(v55, "overrideTransportType");
        }
        else
        {
          v60 = objc_msgSend(v111, "transportType");
        }
        v61 = v60;
        if (objc_msgSend(v122, "usesRoutingPathPoints"))
          objc_msgSend(a1, "_composedRouteStepWithTransportType:andCustodian:geoRouteLeg:forGeoStep:withStepIndex:startRouteCoordinate:endRouteCoordinate:maneuverStartRouteCoordinate:", v61, v118, v121, v55, v117 + v52, v53, v51, objc_msgSend(v122, "routeCoordinateForDistance:afterRouteCoordinate:", v108, (float)objc_msgSend(v55, "maneuverStartPointOffsetCm") * 0.01));
        else
          objc_msgSend(a1, "_composedRouteStepWithTransportType:andCustodian:geoRouteLeg:forGeoStep:withStepIndex:stepStartPointIndex:legStartPointIndex:", v61, v118, v121, v55, v117 + v52, v49, v108);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v113, "addObject:", v48);
        if (v120)
          v62 = v120;
        else
          v62 = v48;
        v63 = v62;

        if (v119)
          v64 = v119;
        else
          v64 = v48;
        v65 = v64;

        v120 = v63;
        if (v54 && (v66 = objc_msgSend(v48, "transportType"), v66 != objc_msgSend(v54, "transportType")))
        {
          +[GEORouteBuilder _composedRouteSegmentForStartStep:andEndStep:segmentIndex:andCustodian:](GEORouteBuilder, "_composedRouteSegmentForStartStep:andEndStep:segmentIndex:andCustodian:", v65, v54, objc_msgSend(v110, "count") + objc_msgSend(v107, "count"), v118);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v110, "addObject:", v67);
          v119 = v48;

        }
        else
        {
          v119 = v65;
        }
        v68 = objc_msgSend(v48, "endPointIndex");

        v49 = v68;
        ++v52;
        v53 = v51;
        v54 = v48;
      }
      while (v116 != v52);
      v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v123, v135, 16);
      v43 = v117 + v52;
    }
    while (v47);

    v43 = v117 + v52;
    if (v48 && v119)
    {
      +[GEORouteBuilder _composedRouteSegmentForStartStep:andEndStep:segmentIndex:andCustodian:](GEORouteBuilder, "_composedRouteSegmentForStartStep:andEndStep:segmentIndex:andCustodian:", v119, v48, objc_msgSend(v110, "count") + objc_msgSend(v107, "count"), v118);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "addObject:", v46);
LABEL_61:

    }
    objc_msgSend(v111, "routeLegs");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "lastObject");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v121 == v70;

    if (!v71)
    {
      objc_msgSend(v121, "destinationWaypointInfo");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v72, "source") == 1)
      {
        objc_msgSend(v102, "objectAtIndexedSubscript:", v104++);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_82:
        objc_msgSend(v72, "evChargingInfo");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = v83 == 0;

        if (!v84)
        {
          v85 = [GEOComposedWaypointEVStop alloc];
          objc_msgSend(v73, "geoMapItem");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = -[GEOComposedWaypointEVStop initWithGeoWaypointInfo:mapItem:](v85, "initWithGeoWaypointInfo:mapItem:", v72, v86);

          v73 = (void *)v87;
        }

        goto LABEL_85;
      }
      if (objc_msgSend(v72, "source") != 2
        && (GEOConfigGetBOOL(MapsFeaturesConfig_DrivingMultiWaypointRoutesEnabled, (uint64_t)off_1EDF4B0C8) & 1) != 0)
      {
        GEOGetGEORouteBuilderLog();
        v74 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_FAULT))
        {
          v75 = objc_msgSend(v111, "transportType");
          if (v75 >= 7)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v75);
            v76 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v76 = off_1E1C0F4A0[(int)v75];
          }
          v80 = v76;
          v81 = objc_msgSend(v72, "source");
          if (v81 >= 3)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v81);
            v82 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v82 = off_1E1C0F4D8[(int)v81];
          }
          *(_DWORD *)buf = 138412546;
          v132 = v80;
          v133 = 2112;
          v134 = v82;
          _os_log_impl(&dword_1885A9000, v74, OS_LOG_TYPE_FAULT, "Unknown waypoint source when building route of transport type %@: %@", buf, 0x16u);

        }
        goto LABEL_80;
      }
      objc_msgSend(v72, "evChargingInfo");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = v77 == 0;

      if (v78)
      {
        GEOGetGEORouteBuilderLog();
        v74 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v100, "directionsResponse");
          v79 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v132 = v79;
          _os_log_impl(&dword_1885A9000, v74, OS_LOG_TYPE_ERROR, "Only EV charging stations are supported for server provided waypoints. This is a server error: %@", buf, 0xCu);

        }
LABEL_80:

      }
      v73 = 0;
      goto LABEL_82;
    }
    objc_msgSend(v102, "lastObject");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_85:
    if (!v73)
    {
      GEOGetGEORouteBuilderLog();
      v88 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1885A9000, v88, OS_LOG_TYPE_ERROR, "No geoWaypointInfo provided. This is likely a server bug. Falling back to waypoints provided by the request.", buf, 2u);
      }

      objc_msgSend(v102, "objectAtIndexedSubscript:", v104++);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v107, "addObjectsFromArray:", v110);
    objc_msgSend(v111, "arrivalParametersAtIndex:", objc_msgSend(v121, "arrivalParameterIndex"));
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "firstObject");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "lastObject");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    +[GEORouteBuilder _composedRouteLegForStartStep:endStep:startSegment:endSegment:custodian:geoRouteLeg:legIndex:origin:destination:arrivalParameters:legLength:](GEORouteBuilder, "_composedRouteLegForStartStep:endStep:startSegment:endSegment:custodian:geoRouteLeg:legIndex:origin:destination:arrivalParameters:legLength:", v120, v48, v90, v91, v118, v121, (double)objc_msgSend(v121, "distance"), v106, v105, v73, v89);
    v92 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v101, "addObject:", v92);
    v105 = v73;
    v45 = v103;
LABEL_90:

    ++v106;
    if (!v45)
      goto LABEL_105;
  }
  if (objc_msgSend(v102, "count") != v104 + 1)
  {
    GEOGetGEORouteBuilderLog();
    v93 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v100, "directionsRequest");
      v94 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "directionsResponse");
      v95 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v132 = v94;
      v133 = 2112;
      v134 = v95;
      _os_log_impl(&dword_1885A9000, v93, OS_LOG_TYPE_ERROR, "Mismatch between waypoints sent in directions request and waypoints received in directions response. This is a server error: %@\n%@", buf, 0x16u);

    }
  }
  if (a7)
    *a7 = objc_retainAutorelease(v101);
  if (a8)
    *a8 = objc_retainAutorelease(v107);
  if (a9)
    *a9 = objc_retainAutorelease(v113);
LABEL_105:

LABEL_106:
}

uint64_t __117__GEORouteBuilder__componentsForGeoWaypointRoute_initializerData_coordinates_custodian_outLegs_outSegments_outSteps___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isServerProvidedWaypoint") ^ 1;
}

+ (id)_composedRouteStepWithTransportType:(int)a3 andCustodian:(id)a4 geoRouteLeg:(id)a5 forGeoStep:(id)a6 withStepIndex:(unint64_t)a7 startRouteCoordinate:(PolylineCoordinate)a8 endRouteCoordinate:(PolylineCoordinate)a9 maneuverStartRouteCoordinate:(PolylineCoordinate)a10
{
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v21;
  const char *v22;
  uint8_t *v23;
  uint8_t buf[2];
  __int16 v25;

  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = v17;
  if (!v15)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_5;
    v25 = 0;
    v21 = MEMORY[0x1E0C81028];
    v22 = "Assertion failed: custodian != nullptr";
    v23 = (uint8_t *)&v25;
LABEL_12:
    _os_log_fault_impl(&dword_1885A9000, v21, OS_LOG_TYPE_FAULT, v22, v23, 2u);
    goto LABEL_5;
  }
  if (!v17)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_5;
    *(_WORD *)buf = 0;
    v21 = MEMORY[0x1E0C81028];
    v22 = "Assertion failed: geoStep != nullptr";
    v23 = buf;
    goto LABEL_12;
  }
  if (a3 < 6 && ((0x2Du >> a3) & 1) != 0)
  {
    v19 = (void *)objc_msgSend(objc_alloc(*off_1E1C0F4F0[a3]), "initWithComposedRoute:geoRouteLeg:geoStep:stepIndex:startRouteCoordinate:endRouteCoordinate:maneuverStartRouteCoordinate:", v15, v16, v17, a7, a8, a9, a10);
    goto LABEL_7;
  }
LABEL_5:
  v19 = 0;
LABEL_7:

  return v19;
}

+ (id)_composedRouteStepWithTransportType:(int)a3 andCustodian:(id)a4 geoRouteLeg:(id)a5 forGeoStep:(id)a6 withStepIndex:(unint64_t)a7 stepStartPointIndex:(unint64_t)a8 legStartPointIndex:(unint64_t)a9
{
  id v13;
  id v14;
  id v15;
  void *v16;
  unsigned int v17;
  int v18;
  int v19;
  unsigned int v20;
  void *v21;
  NSObject *v23;
  const char *v24;
  uint8_t *v25;
  uint8_t buf[2];
  __int16 v28;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = v15;
  if (!v13)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_5;
    v28 = 0;
    v23 = MEMORY[0x1E0C81028];
    v24 = "Assertion failed: custodian != nullptr";
    v25 = (uint8_t *)&v28;
LABEL_12:
    _os_log_fault_impl(&dword_1885A9000, v23, OS_LOG_TYPE_FAULT, v24, v25, 2u);
    goto LABEL_5;
  }
  if (!v15)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_5;
    *(_WORD *)buf = 0;
    v23 = MEMORY[0x1E0C81028];
    v24 = "Assertion failed: geoStep != nullptr";
    v25 = buf;
    goto LABEL_12;
  }
  v17 = objc_msgSend(v15, "maneuverEndIndex");
  v18 = objc_msgSend(v16, "maneuverEndIndex");
  v19 = objc_msgSend(v16, "maneuverStartIndex");
  v20 = objc_msgSend(v16, "maneuverStartIndex");
  if (a3 < 6 && ((0x2Du >> a3) & 1) != 0)
  {
    v21 = (void *)objc_msgSend(objc_alloc(*off_1E1C0F4F0[a3]), "initWithComposedRoute:geoRouteLeg:geoStep:stepIndex:pointRange:maneuverPointRange:", v13, v14, v16, a7, a8, a9 - a8 + v17 + 1, a9 + v20, (v18 - v19 + 1));
    goto LABEL_7;
  }
LABEL_5:
  v21 = 0;
LABEL_7:

  return v21;
}

+ (id)_composedRouteSegmentForStartStep:(id)a3 andEndStep:(id)a4 segmentIndex:(unint64_t)a5 andCustodian:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSUInteger v17;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v20;
  NSRange v21;
  uint64_t v22;
  __objc2_class **v23;
  GEOComposedWalkingRouteSegment *v24;
  NSObject *v25;
  id v26;
  GEOComposedWalkingRouteSegment *v27;
  __CFString *v29;
  NSObject *v30;
  const char *v31;
  uint8_t buf[4];
  __CFString *v33;
  uint64_t v34;
  NSRange v35;
  NSRange v36;

  v34 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = v11;
  if (!v9)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_8;
    *(_WORD *)buf = 0;
    v30 = MEMORY[0x1E0C81028];
    v31 = "Assertion failed: startStep != nullptr";
LABEL_25:
    _os_log_fault_impl(&dword_1885A9000, v30, OS_LOG_TYPE_FAULT, v31, buf, 2u);
    goto LABEL_8;
  }
  if (!v10)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_8;
    *(_WORD *)buf = 0;
    v30 = MEMORY[0x1E0C81028];
    v31 = "Assertion failed: endStep != nullptr";
    goto LABEL_25;
  }
  if (!v11)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v30 = MEMORY[0x1E0C81028];
      v31 = "Assertion failed: custodian != nullptr";
      goto LABEL_25;
    }
LABEL_8:
    v27 = 0;
    goto LABEL_13;
  }
  v13 = objc_msgSend(v9, "transportType");
  v14 = objc_msgSend(v9, "stepIndex");
  v15 = objc_msgSend(v10, "stepIndex");
  v16 = objc_msgSend(v9, "stepIndex");
  v17 = objc_msgSend(v9, "pointRange");
  v19 = v18;
  v36.location = objc_msgSend(v10, "pointRange");
  v36.length = v20;
  v35.location = v17;
  v35.length = v19;
  v21 = NSUnionRange(v35, v36);
  v22 = v15 - v16 + 1;
  v23 = off_1E1BEBF98;
  switch((int)v13)
  {
    case 0:
      goto LABEL_11;
    case 2:
      v24 = -[GEOComposedWalkingRouteSegment initWithComposedRoute:stepRange:pointRange:segmentIndex:transitIncidentMessageStepIndex:]([GEOComposedWalkingRouteSegment alloc], "initWithComposedRoute:stepRange:pointRange:segmentIndex:transitIncidentMessageStepIndex:", v12, v14, v22, v21.location, v21.length, a5, 0x7FFFFFFFFFFFFFFFLL);
      goto LABEL_12;
    case 3:
      v23 = off_1E1BEBF88;
      goto LABEL_11;
    case 5:
      v23 = off_1E1BEBFC8;
LABEL_11:
      v24 = (GEOComposedWalkingRouteSegment *)objc_msgSend(objc_alloc(*v23), "initWithComposedRoute:stepRange:pointRange:segmentIndex:", v12, v14, v22, v21.location, v21.length, a5);
LABEL_12:
      v27 = v24;
      break;
    default:
      v25 = MEMORY[0x1E0C81028];
      v26 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      {
        if (v13 < 7 && ((0x77u >> v13) & 1) != 0)
        {
          v29 = off_1E1C0F520[(int)v13];
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v13);
          v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        *(_DWORD *)buf = 138412290;
        v33 = v29;
        _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: Unsupported transport type (%@) in -[GEORouteBuilder _composedRouteSegmentForStartStep:]", buf, 0xCu);

      }
      goto LABEL_8;
  }
LABEL_13:

  return v27;
}

+ (id)_composedRouteLegForStartStep:(id)a3 endStep:(id)a4 startSegment:(id)a5 endSegment:(id)a6 custodian:(id)a7 geoRouteLeg:(id)a8 legIndex:(unint64_t)a9 origin:(id)a10 destination:(id)a11 arrivalParameters:(id)a12 legLength:(double)a13
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  GEOComposedRouteLeg *v26;
  NSObject *v28;
  const char *v29;
  uint8_t *v30;
  id v31;
  id v32;
  uint8_t buf[2];
  __int16 v34;
  __int16 v35;

  v19 = a3;
  v20 = a4;
  v21 = a5;
  v31 = a6;
  v22 = a7;
  v32 = a8;
  v23 = a10;
  v24 = a11;
  v25 = a12;
  if (!v19)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      v35 = 0;
      v28 = MEMORY[0x1E0C81028];
      v29 = "Assertion failed: startStep != nullptr";
      v30 = (uint8_t *)&v35;
      goto LABEL_13;
    }
LABEL_11:
    v26 = 0;
    goto LABEL_5;
  }
  if (!v20)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      v34 = 0;
      v28 = MEMORY[0x1E0C81028];
      v29 = "Assertion failed: endStep != nullptr";
      v30 = (uint8_t *)&v34;
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (!v22)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_11;
    *(_WORD *)buf = 0;
    v28 = MEMORY[0x1E0C81028];
    v29 = "Assertion failed: custodian != nullptr";
    v30 = buf;
LABEL_13:
    _os_log_fault_impl(&dword_1885A9000, v28, OS_LOG_TYPE_FAULT, v29, v30, 2u);
    goto LABEL_11;
  }
  v26 = -[GEOComposedRouteLeg initWithComposedRoute:geoRouteLeg:legIndex:origin:destination:arrivalParameters:]([GEOComposedRouteLeg alloc], "initWithComposedRoute:geoRouteLeg:legIndex:origin:destination:arrivalParameters:", v22, v32, a9, v23, v24, v25);
  -[GEOComposedRouteLeg setPointRange:](v26, "setPointRange:", objc_msgSend(v19, "startPointIndex"), objc_msgSend(v20, "endPointIndex") - objc_msgSend(v19, "startPointIndex") + 1);
  -[GEOComposedRouteLeg setStepRange:](v26, "setStepRange:", objc_msgSend(v19, "stepIndex"), objc_msgSend(v20, "stepIndex") - objc_msgSend(v19, "stepIndex") + 1);
  -[GEOComposedRouteLeg setSegmentRange:](v26, "setSegmentRange:", objc_msgSend(v21, "segmentIndex"), objc_msgSend(v31, "segmentIndex") - objc_msgSend(v21, "segmentIndex") + 1);
  -[GEOComposedRouteLeg setDistance:](v26, "setDistance:", (double)a13);
LABEL_5:

  return v26;
}

+ (id)buildPointSectionsWithSteps:(id)a3 segments:(id)a4 coordinates:(id)a5
{
  id v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  unint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  unint64_t v29;
  double v30;
  void *v31;
  int v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  GEOComposedRouteSection *v45;
  void *v46;
  unint64_t v47;
  GEOComposedRouteSection *v48;
  uint64_t v50;
  id v51;
  id v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  int v56;
  void *v57;
  unint64_t v58;
  uint64_t v59;
  double v60;
  double v61;
  double v62;
  _OWORD v63[3];
  __int128 v64;
  __int128 v65;
  double v66[3];

  v7 = a3;
  v52 = a4;
  v8 = a5;
  v57 = v7;
  if (v7)
  {
    v51 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v9 = 0;
    v55 = 0;
    v10 = 0;
    while (1)
    {
      if (v9 >= objc_msgSend(v8, "pathsCount"))
        goto LABEL_30;
      v11 = objc_msgSend(v8, "coordinateCountForPathAtIndex:", v9);
      v12 = v11;
      if (v11 < 2)
        goto LABEL_28;
      v13 = 0;
      v58 = v11 - 1;
      v59 = v55 + 1;
      v53 = v11;
      v54 = v9;
      do
      {
        objc_msgSend(v57, "objectAtIndex:", v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = objc_msgSend(v14, "transportType");
        v15 = v13 + v55;
        objc_msgSend(v8, "coordinateOnRouteAt:", v13 + v55);
        v17 = v16;
        v21 = GEOTilePointForCoordinate(v18, v19, 20.0);
        v22 = v20;
        if (v13 + 1 >= v12)
        {
          v61 = 0.0;
          v62 = v20;
          v23 = v13;
          v28 = v21;
          v27 = v21;
          v26 = v20;
          v25 = v17;
          v31 = v14;
          goto LABEL_24;
        }
        v23 = v13;
        v24 = v10;
        v61 = 0.0;
        v62 = v20;
        v25 = v17;
        v26 = v20;
        v27 = v21;
        v28 = v21;
        while (1)
        {
          v60 = v21;
          v29 = v59 + v23;
          objc_msgSend(v8, "distanceBetweenIndex:andIndex:", v15, v59 + v23);
          if (v23 > v13 && v30 > 16000.0)
            break;
          if (!v14)
            goto LABEL_18;
          if (v29 <= objc_msgSend(v14, "endPointIndex"))
          {
            v31 = v14;
            goto LABEL_19;
          }
          v10 = v24 + 1;
          if (v24 + 1 >= (unint64_t)objc_msgSend(v57, "count"))
          {

LABEL_18:
            v31 = 0;
LABEL_19:
            v10 = v24;
            goto LABEL_20;
          }
          objc_msgSend(v57, "objectAtIndex:", v24 + 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "transportType");

          if (v23 > v13 && v56 != v32)
            goto LABEL_24;
LABEL_20:
          objc_msgSend(v8, "coordinateOnRouteAt:", v29);
          v34 = v33;
          v37 = GEOTilePointForCoordinate(v35, v36, 20.0);
          v38 = v22;
          v22 = v39;
          v28 = fmin(v28, v37);
          v27 = fmax(v27, v37);
          v26 = fmin(v26, v39);
          v61 = v61 + GEOMetersBetweenMapPoints(v60, v38, v37, v39);
          v62 = fmax(v62, v22);
          v25 = fmin(v25, v34);
          ++v23;
          v24 = v10;
          v14 = v31;
          v21 = v37;
          v17 = fmax(v17, v34);
          if (v58 == v23)
            goto LABEL_24;
        }
        v31 = v14;
        v10 = v24;
LABEL_24:
        *(double *)&v64 = v28;
        *((double *)&v64 + 1) = v26;
        *(double *)&v65 = v25;
        *((double *)&v65 + 1) = v27 - v28;
        v66[0] = v62 - v26;
        v66[1] = v17 - v25;
        objc_msgSend(v8, "distanceFromStartToIndex:", v15, (double)GEOComposedRouteSectionPadAndSquareBounds((double *)&v64));
        v41 = v40;
        objc_msgSend(v8, "distanceBetweenIndex:andIndex:", v15, v23 + v55);
        v43 = v42 / v61;
        if (v61 <= 0.0)
          v44 = 1.0;
        else
          v44 = v43;
        v45 = [GEOComposedRouteSection alloc];
        +[GEORouteBuilder segmentForPointIndex:withSegments:andSteps:](GEORouteBuilder, "segmentForPointIndex:withSegments:andSteps:", v15, v52, v57);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = +[GEORouteBuilder segmentIndexForPointIndex:withSegments:](GEORouteBuilder, "segmentIndexForPointIndex:withSegments:", v15, v52);
        v63[0] = v64;
        v63[1] = v65;
        v63[2] = *(_OWORD *)v66;
        LODWORD(v50) = v56;
        v48 = -[GEOComposedRouteSection initWithCoordinates:segment:segmentIndex:steps:startCoordinateIndex:coordinateCount:bounds:transportType:finalStepIndex:startDistance:lengthScaleFactor:](v45, "initWithCoordinates:segment:segmentIndex:steps:startCoordinateIndex:coordinateCount:bounds:transportType:finalStepIndex:startDistance:lengthScaleFactor:", v8, v46, v47, v57, v13 + v55, (v23 - v13 + 1), v41, v44, v63, v50, v10);

        objc_msgSend(v51, "addObject:", v48);
        v13 = v23;
        v12 = v53;
        v9 = v54;
      }
      while (v23 + 1 < v53);
LABEL_28:
      v55 += v12;
      ++v9;
    }
  }
  v51 = 0;
LABEL_30:

  return v51;
}

+ (id)segmentForPointIndex:(unint64_t)a3 withSegments:(id)a4 andSteps:(id)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a4;
  v8 = a5;
  +[GEORouteBuilder _segmentForStepIndex:withSegments:](GEORouteBuilder, "_segmentForStepIndex:withSegments:", +[GEORouteBuilder stepIndexForPointIndex:withSteps:](GEORouteBuilder, "stepIndexForPointIndex:withSteps:", a3, v8), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (unint64_t)stepIndexForPointIndex:(unint64_t)a3 withSteps:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = 0;
      v9 = *(_QWORD *)v15;
      while (2)
      {
        v10 = 0;
        v11 = v7 + v8;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "endPointIndex", (_QWORD)v14) > a3)
          {

            v12 = v8 + v10;
            goto LABEL_13;
          }
          ++v10;
        }
        while (v7 != v10);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        v8 = v11;
        if (v7)
          continue;
        break;
      }
    }

    v12 = objc_msgSend(v6, "count") - 1;
  }
  else
  {
    v12 = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_13:

  return v12;
}

+ (id)_segmentForStepIndex:(unint64_t)a3 withSegments:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = a4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "stepRange", (_QWORD)v15);
        if (a3 >= v10 && a3 - v10 < v11)
        {
          v13 = v9;
          goto LABEL_14;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }
  v13 = 0;
LABEL_14:

  return v13;
}

+ (unint64_t)segmentIndexForPointIndex:(unint64_t)a3 withSegments:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = 0;
      v9 = *(_QWORD *)v15;
      while (2)
      {
        v10 = 0;
        v11 = v7 + v8;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "endPointIndex", (_QWORD)v14) > a3)
          {

            v12 = v8 + v10;
            goto LABEL_13;
          }
          ++v10;
        }
        while (v7 != v10);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        v8 = v11;
        if (v7)
          continue;
        break;
      }
    }

    v12 = objc_msgSend(v6, "count") - 1;
  }
  else
  {
    v12 = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_13:

  return v12;
}

+ (id)buildMapRegionFromPointSections:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t i;
  void *v11;
  double v12;
  double v13;
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
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v25;
    v6 = 0.0;
    v7 = INFINITY;
    v8 = INFINITY;
    v9 = INFINITY;
    v18 = 0u;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v25 != v5)
          objc_enumerationMutation(v3);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        *(double *)v20 = v7;
        *(double *)&v20[1] = v8;
        *(double *)&v20[2] = v9;
        *(double *)&v20[3] = v6;
        v21 = v18;
        if (v11)
          objc_msgSend(v11, "bounds");
        else
          memset(v19, 0, sizeof(v19));
        GEOMapBoxUnion((uint64_t)v20, (uint64_t)v19, (uint64_t)v22);
        v7 = *(double *)v22;
        v8 = *(double *)&v22[1];
        v9 = *(double *)&v22[2];
        v6 = *(double *)&v22[3];
        v18 = v23;
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 0.0;
    v7 = INFINITY;
    v8 = INFINITY;
    v9 = INFINITY;
    *(_QWORD *)&v18 = 0;
  }

  v12 = fabs(v8);
  v13 = fabs(v9);
  if (fabs(v7) == INFINITY || v12 == INFINITY || v13 == INFINITY)
    v16 = 0;
  else
    v16 = -[GEOMapRegion initWithMapRect:]([GEOMapRegion alloc], "initWithMapRect:", v7, v8, v6, *(double *)&v18);

  return v16;
}

+ (id)_guidanceEventsForGeoWaypointRoute:(id)a3 legs:(id)a4 steps:(id)a5 coordinates:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  unint64_t i;
  unint64_t v18;
  void *v19;
  unint64_t j;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  GEOComposedGuidanceEvent *v27;
  uint64_t v28;
  void *v29;
  unint64_t k;
  void *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  id v37;
  GEOComposedGuidanceEvent *v38;
  GEOComposedGuidanceEvent *v39;
  void *v41;
  void *v42;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v45 = a5;
  v11 = a6;
  v41 = v9;
  v42 = v10;
  if (!v9)
    goto LABEL_29;
  if (!objc_msgSend(v10, "count") || !objc_msgSend(v45, "count"))
  {
LABEL_28:
    v9 = 0;
    goto LABEL_29;
  }
  v12 = objc_msgSend(v10, "count");
  objc_msgSend(v9, "routeLegs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v12 != v14)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: legs.count == geoWaypointRoute.routeLegs.count", buf, 2u);
    }
    goto LABEL_28;
  }
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0;
  v48 = 0;
  while (v15 < objc_msgSend(v42, "count", v41))
  {
    objc_msgSend(v42, "objectAtIndexedSubscript:", v15);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "routeLegs");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", v15);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    for (i = objc_msgSend(v46, "startStepIndex"); i <= objc_msgSend(v46, "endStepIndex"); i = v18 + 1)
    {
      v18 = i;
      objc_msgSend(v45, "objectAtIndexedSubscript:", i);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      for (j = 0; ; ++j)
      {
        objc_msgSend(v19, "geoStep");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "guidanceEvents");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "count");

        if (j >= v23)
          break;
        objc_msgSend(v19, "geoStep");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "guidanceEvents");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectAtIndexedSubscript:", j);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = -[GEOComposedGuidanceEvent initWithGeoGuidanceEvent:step:legIndex:coordinates:]([GEOComposedGuidanceEvent alloc], "initWithGeoGuidanceEvent:step:legIndex:coordinates:", v26, v19, v15, v11);
        if (v27)
        {
          if (objc_msgSend(v26, "hasEnrouteNoticeIndex"))
          {
            -[GEOComposedGuidanceEvent setEnrouteNoticeIndex:](v27, "setEnrouteNoticeIndex:", v48 + objc_msgSend(v26, "enrouteNoticeIndex"));
            v28 = 3;
          }
          else
          {
            v28 = 1;
          }
          -[GEOComposedGuidanceEvent setSource:](v27, "setSource:", v28);
          -[GEOComposedGuidanceEvent setSourceIndex:](v27, "setSourceIndex:", j);
          objc_msgSend(v9, "addObject:", v27);
        }

      }
    }
    objc_msgSend(v45, "objectAtIndexedSubscript:", objc_msgSend(v46, "startStepIndex"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "objectAtIndexedSubscript:", objc_msgSend(v46, "endStepIndex"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    for (k = 0; ; ++k)
    {
      objc_msgSend(v47, "guidanceEvents");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "count");

      if (k >= v32)
        break;
      objc_msgSend(v47, "guidanceEvents");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectAtIndexedSubscript:", k);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = objc_msgSend(a1, "_isGuidanceEventAtEndOfLeg:", objc_msgSend(v34, "eventType"));
      v36 = v44;
      if (v35)
        v36 = v29;
      v37 = v36;
      v38 = -[GEOComposedGuidanceEvent initWithGeoGuidanceEvent:step:legIndex:coordinates:]([GEOComposedGuidanceEvent alloc], "initWithGeoGuidanceEvent:step:legIndex:coordinates:", v34, v37, v15, v11);
      v39 = v38;
      if (v38)
      {
        -[GEOComposedGuidanceEvent setSource:](v38, "setSource:", 2);
        -[GEOComposedGuidanceEvent setSourceIndex:](v39, "setSourceIndex:", k);
        objc_msgSend(v9, "addObject:", v39);
      }

    }
    v48 += objc_msgSend(v47, "enrouteNoticesCount");

    ++v15;
  }
LABEL_29:

  return v9;
}

+ (BOOL)_isGuidanceEventAtEndOfLeg:(int)a3
{
  return (a3 - 11) < 4;
}

+ (id)_visualInfosForGuidanceEvents:(id)a3 steps:(id)a4 coordinates:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  GEOComposedRouteVisualInfo *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v10 = v7;
  v11 = 0;
  v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if ((objc_msgSend(v15, "hasSignGuidance", (_QWORD)v26) & 1) != 0)
        {
          objc_msgSend(v15, "shieldInfo");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "shield");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v17, "length"))
          {
            v18 = objc_msgSend(v15, "stepIndex");
            if (v18 < objc_msgSend(v8, "count"))
            {
              objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v15, "stepIndex"));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "endRouteCoordinate");
              objc_msgSend(v9, "coordinateForRouteCoordinate:", v20);
              v24 = -[GEOComposedRouteVisualInfo initWithType:title:detail:routeCoordinate:locationCoordinate:]([GEOComposedRouteVisualInfo alloc], "initWithType:title:detail:routeCoordinate:locationCoordinate:", 131073, v17, 0, v20, v21, v22, v23);
              if (v24)
              {
                if (!v11)
                {
                  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  v11 = (void *)objc_claimAutoreleasedReturnValue();
                }
                objc_msgSend(v11, "addObject:", v24);
              }

            }
          }

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v12);
  }

  return v11;
}

+ (id)_cellularCoverageForGeoWaypointRoute:(id)a3 coordinates:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t i;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  int v22;
  int v23;
  void *v24;
  GEOComposedRouteCellularCoverage *v25;
  NSObject *v27;
  const char *v28;
  uint8_t *v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint8_t v36[16];
  uint8_t buf[16];
  uint8_t v38[2];
  __int16 v39;

  v5 = a3;
  v6 = a4;
  v34 = v6;
  v35 = v5;
  if (!v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      v39 = 0;
      v27 = MEMORY[0x1E0C81028];
      v28 = "Assertion failed: geoWaypointRoute != nullptr";
      v29 = (uint8_t *)&v39;
LABEL_39:
      _os_log_fault_impl(&dword_1885A9000, v27, OS_LOG_TYPE_FAULT, v28, v29, 2u);
    }
LABEL_34:
    v25 = 0;
    goto LABEL_30;
  }
  if (!v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v38 = 0;
      v27 = MEMORY[0x1E0C81028];
      v28 = "Assertion failed: coordinates != nullptr";
      v29 = v38;
      goto LABEL_39;
    }
    goto LABEL_34;
  }
  v7 = 0;
  v8 = 0;
  while (v7 < objc_msgSend(v5, "routeLegsCount"))
  {
    objc_msgSend(v5, "routeLegs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v34, "coordinateCountForPathAtIndex:", v7))
    {
      v11 = objc_msgSend(v10, "cellularCoveragesCount");
      if (v11 != objc_msgSend(v10, "cellularCoverageOffsetsCount"))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: leg.cellularCoveragesCount == leg.cellularCoverageOffsetsCount", buf, 2u);
        }

        goto LABEL_34;
      }
      v8 += objc_msgSend(v10, "cellularCoveragesCount");
      if (objc_msgSend(v10, "cellularCoveragesCount")
        && objc_msgSend(v10, "cellularCoverageOffsetAtIndex:", 0)
        || !objc_msgSend(v10, "cellularCoveragesCount") && v8)
      {
        ++v8;
      }
    }

    ++v7;
  }
  if (!v8)
    goto LABEL_34;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 4 * v8);
  v32 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 4 * v8);
  v31 = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_retainAutorelease(v32);
  v33 = objc_msgSend(v12, "mutableBytes");
  v30 = objc_retainAutorelease(v31);
  v13 = objc_msgSend(v30, "mutableBytes");
  v14 = 0;
  for (i = 0; i < objc_msgSend(v35, "routeLegsCount"); ++i)
  {
    v16 = objc_msgSend(v34, "routeIndexForLocalIndex:onPath:", 0, i);
    if (objc_msgSend(v34, "coordinateCountForPathAtIndex:", i))
    {
      objc_msgSend(v35, "routeLegs");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndexedSubscript:", i);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v18, "cellularCoveragesCount")
        && objc_msgSend(v18, "cellularCoverageOffsetAtIndex:", 0)
        || !objc_msgSend(v18, "cellularCoveragesCount"))
      {
        v19 = v33;
        *(_DWORD *)(v33 + 4 * v14) = v16;
        *(_DWORD *)(v13 + 4 * v14++) = 0;
      }
      else
      {
        v19 = v33;
      }
      v20 = 0;
      v21 = v19 + 4 * v14;
      while (v20 < objc_msgSend(v18, "cellularCoverageOffsetsCount"))
      {
        v22 = objc_msgSend(v18, "cellularCoverageOffsetAtIndex:", v20);
        v23 = objc_msgSend(v18, "cellularCoverageAtIndex:", v20);
        *(_DWORD *)(v21 + 4 * v20) = v22 + v16;
        *(_DWORD *)(v13 + 4 * v14 + 4 * v20++) = v23;
      }

      v14 += v20;
    }
  }
  if (v14 == v8)
  {
    v24 = v30;
    v25 = -[GEOComposedRouteCellularCoverage initWithOffsets:coverage:routeLength:]([GEOComposedRouteCellularCoverage alloc], "initWithOffsets:coverage:routeLength:", v12, v30, (double)objc_msgSend(v35, "distanceMeters"));
  }
  else
  {
    v24 = v30;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v36 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: currentCoverageOffset == totalCoverageCount", v36, 2u);
    }
    v25 = 0;
  }

LABEL_30:
  return v25;
}

@end
