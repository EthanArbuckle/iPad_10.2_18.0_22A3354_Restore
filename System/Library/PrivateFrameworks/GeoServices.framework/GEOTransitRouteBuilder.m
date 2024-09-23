@implementation GEOTransitRouteBuilder

+ (id)outputForSuggestedRoute:(id)a3 withDecoderData:(id)a4 andWaypoints:(id)a5 andArrivalParameters:(id)a6 andCustodian:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t buf[16];

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (v15)
  {
    if (objc_msgSend(v11, "sectionOptionsCount"))
    {
      +[GEOTransitRouteBuilder selectionsForSuggestedRoute:](GEOTransitRouteBuilder, "selectionsForSuggestedRoute:", v11);
      v16 = objc_claimAutoreleasedReturnValue();
      +[GEOTransitRouteBuilder optionsForRideSelections:forSuggestionRoute:](GEOTransitRouteBuilder, "optionsForRideSelections:forSuggestionRoute:", v16, v11);
      v17 = (void *)v16;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[GEOTransitRouteBuilder preprocessClusteredSuggestedRoute:withSectionOptions:andRideSelections:andDecoderData:](GEOTransitRouteBuilder, "preprocessClusteredSuggestedRoute:withSectionOptions:andRideSelections:andDecoderData:", v11);
    }
    else
    {
      v17 = 0;
      v18 = 0;
    }
    +[GEOTransitRouteBuilder outputForSuggestedRoute:withDecoderData:andWaypoints:andArrivalParameters:andCustodian:andRideSelections:andSectionOptions:](GEOTransitRouteBuilder, "outputForSuggestedRoute:withDecoderData:andWaypoints:andArrivalParameters:andCustodian:andRideSelections:andSectionOptions:", v11, v12, v13, v14, v15, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: custodian != nullptr", buf, 2u);
    }
    v19 = 0;
  }

  return v19;
}

+ (id)outputForSuggestedRoute:(id)a3 withDecoderData:(id)a4 andWaypoints:(id)a5 andArrivalParameters:(id)a6 andCustodian:(id)a7 andRideSelections:(id)a8 andSectionOptions:(id)a9
{
  id v14;
  id v15;
  GEOTransitRouteBuilderOutput *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  uint8_t v50[8];
  uint64_t v51;
  uint8_t buf[16];

  v49 = a3;
  v48 = a4;
  v47 = a5;
  v44 = a6;
  v46 = a7;
  v14 = a8;
  v15 = a9;
  v41 = v15;
  v42 = v14;
  v16 = objc_alloc_init(GEOTransitRouteBuilderOutput);
  GEOGetGEORouteBuilderLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v17, OS_LOG_TYPE_INFO, "generating output for suggestedroute", buf, 2u);
  }

  -[GEOTransitRouteBuilderOutput setRideSelections:](v16, "setRideSelections:", v14);
  -[GEOTransitRouteBuilderOutput setSectionOptions:](v16, "setSectionOptions:", v15);
  v51 = 0;
  -[GEOTransitRouteBuilderOutput setIsWalkingOnlyRoute:](v16, "setIsWalkingOnlyRoute:", objc_msgSend(v49, "isWalkingOnlyRoute"));
  v43 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  objc_msgSend(v49, "steps");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOTransitRouteBuilder _buildStepInfosFromSteps:withDecoderData:andIsWalkingOnlyRoute:andBuildPointData:](GEOTransitRouteBuilder, "_buildStepInfosFromSteps:withDecoderData:andIsWalkingOnlyRoute:andBuildPointData:", v18, v48, -[GEOTransitRouteBuilderOutput isWalkingOnlyRoute](v16, "isWalkingOnlyRoute"), v43);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = v19;
  if (!objc_msgSend(v19, "count") && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v50 = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: stepInfos.count > 0", v50, 2u);
  }
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v47, "count") - 1);
  +[GEOTransitRouteBuilder _buildCoordinatesForData:andStepInfos:andCustodian:withWaypoints:andArrivalParameters:andCreateLegs:](GEOTransitRouteBuilder, "_buildCoordinatesForData:andStepInfos:andCustodian:withWaypoints:andArrivalParameters:andCreateLegs:", v43, v19, v46, v47, v44, v20);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORouteBuilderOutput setCoordinatesArray:](v16, "setCoordinatesArray:", v40);
  -[GEORouteBuilderOutput setLegs:](v16, "setLegs:", v20);
  v21 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v49, "steps");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v21, "initWithCapacity:", objc_msgSend(v22, "count"));

  -[GEORouteBuilderOutput legs](v16, "legs");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORouteBuilderOutput coordinatesArray](v16, "coordinatesArray");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "coordinateCount");
  -[GEOTransitRouteBuilderOutput rideSelections](v16, "rideSelections");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTransitRouteBuilderOutput sectionOptions](v16, "sectionOptions");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOTransitRouteBuilder _buildStepsForStepInfos:andCustodian:andDecoderData:andSuggestedRoute:andLegs:andPointCount:andRideSelections:andSectionOptions:andCreateSegments:andUpdateTripCount:](GEOTransitRouteBuilder, "_buildStepsForStepInfos:andCustodian:andDecoderData:andSuggestedRoute:andLegs:andPointCount:andRideSelections:andSectionOptions:andCreateSegments:andUpdateTripCount:", v45, v46, v48, v49, v24, v26, v27, v28, v23, &v51);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORouteBuilderOutput setSteps:](v16, "setSteps:", v29);

  -[GEORouteBuilderOutput setSegments:](v16, "setSegments:", v23);
  v30 = objc_msgSend(v23, "count");
  objc_msgSend(v20, "firstObject");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setSegmentRange:", 0, v30);

  -[GEORouteBuilderOutput steps](v16, "steps");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORouteBuilderOutput segments](v16, "segments");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORouteBuilderOutput coordinatesArray](v16, "coordinatesArray");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOTransitRouteBuilder buildRouteSectionsForSuggestedRoute:fromSteps:andSegments:andCoordinates:andDecoderData:](GEOTransitRouteBuilder, "buildRouteSectionsForSuggestedRoute:fromSteps:andSegments:andCoordinates:andDecoderData:", v49, v32, v33, v34, v48);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORouteBuilderOutput setPointSections:](v16, "setPointSections:", v35);

  -[GEORouteBuilderOutput legs](v16, "legs");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOTransitRouteBuilder _totalDistanceForLegs:](GEOTransitRouteBuilder, "_totalDistanceForLegs:", v36);
  -[GEORouteBuilderOutput setDistance:](v16, "setDistance:");

  -[GEORouteBuilderOutput pointSections](v16, "pointSections");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEORouteBuilder buildMapRegionFromPointSections:](GEORouteBuilder, "buildMapRegionFromPointSections:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORouteBuilderOutput setBoundingMapRegion:](v16, "setBoundingMapRegion:", v38);

  return v16;
}

+ (id)selectionsForSuggestedRoute:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint8_t v11[16];

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v3, "sectionOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      do
      {
        v7 = objc_msgSend(v6, "defaultSectionIndex");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v8);

        objc_msgSend(v3, "nextOptionForOption:withRideIndex:", v6, v7);
        v9 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v9;
      }
      while (v9);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: route != nullptr", v11, 2u);
    }
    v4 = 0;
  }

  return v4;
}

+ (id)optionsForRideSelections:(id)a3 forSuggestionRoute:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v16;
  const char *v17;
  uint8_t *v18;
  __int16 v19;
  __int16 v20;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
LABEL_10:
      v8 = 0;
      goto LABEL_6;
    }
    v20 = 0;
    v16 = MEMORY[0x1E0C81028];
    v17 = "Assertion failed: rideSelections != nullptr";
    v18 = (uint8_t *)&v20;
LABEL_12:
    _os_log_fault_impl(&dword_1885A9000, v16, OS_LOG_TYPE_FAULT, v17, v18, 2u);
    goto LABEL_10;
  }
  if (!v6)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_10;
    v19 = 0;
    v16 = MEMORY[0x1E0C81028];
    v17 = "Assertion failed: route != nullptr";
    v18 = (uint8_t *)&v19;
    goto LABEL_12;
  }
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v7, "sectionOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = 0;
    do
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "unsignedIntegerValue");

      objc_msgSend(v8, "addObject:", v10);
      objc_msgSend(v7, "nextOptionForOption:withRideIndex:", v10, v13);
      v14 = objc_claimAutoreleasedReturnValue();

      ++v11;
      v10 = (void *)v14;
    }
    while (v14);
  }
LABEL_6:

  return v8;
}

+ (id)_sectionOptionForTripIndex:(unint64_t)a3 andSectionOptions:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  if (objc_msgSend(v5, "count") <= a3)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (void)preprocessClusteredSuggestedRoute:(id)a3 withSectionOptions:(id)a4 andRideSelections:(id)a5 andDecoderData:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  unsigned int v18;
  void *v19;
  unint64_t i;
  unsigned int v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  __CFString *v26;
  uint64_t v27;
  __CFString *v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  uint8_t *v32;
  id v33;
  id v34;
  void *v35;
  uint8_t buf[2];
  __int16 v37;
  __int16 v38;
  __int16 v39;

  v9 = a3;
  v10 = a4;
  v34 = a5;
  v11 = a6;
  v12 = v11;
  v35 = v9;
  if (!v9)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_39;
    v39 = 0;
    v30 = MEMORY[0x1E0C81028];
    v31 = "Assertion failed: route != nullptr";
    v32 = (uint8_t *)&v39;
LABEL_48:
    _os_log_fault_impl(&dword_1885A9000, v30, OS_LOG_TYPE_FAULT, v31, v32, 2u);
    goto LABEL_39;
  }
  if (!v10)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_39;
    v38 = 0;
    v30 = MEMORY[0x1E0C81028];
    v31 = "Assertion failed: options != nullptr";
    v32 = (uint8_t *)&v38;
    goto LABEL_48;
  }
  if (!v34)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_39;
    v37 = 0;
    v30 = MEMORY[0x1E0C81028];
    v31 = "Assertion failed: rideSelections != nullptr";
    v32 = (uint8_t *)&v37;
    goto LABEL_48;
  }
  if (!v11)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_39;
    *(_WORD *)buf = 0;
    v30 = MEMORY[0x1E0C81028];
    v31 = "Assertion failed: decoderData != nullptr";
    v32 = buf;
    goto LABEL_48;
  }
  v33 = v10;
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[GEOTransitRouteBuilder _sectionOptionForTripIndex:andSectionOptions:](GEOTransitRouteBuilder, "_sectionOptionForTripIndex:andSectionOptions:", 0, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
    goto LABEL_38;
  v15 = 0;
  do
  {
    objc_msgSend(v34, "objectAtIndexedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "unsignedIntegerValue");

    if (v17 >= objc_msgSend(v14, "sectionsCount"))
      v18 = objc_msgSend(v14, "defaultSectionIndex");
    else
      v18 = objc_msgSend(v14, "sectionAtIndex:", v17);
    if (objc_msgSend(v35, "sectionsCount") <= (unint64_t)v18)
    {
      v19 = 0;
    }
    else
    {
      objc_msgSend(v35, "sectionAtIndex:");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    for (i = 0; i < objc_msgSend(v19, "stepIndexsCount"); ++i)
    {
      v21 = objc_msgSend(v19, "stepIndexAtIndex:", i);
      objc_msgSend(v12, "steps");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "count") <= (unint64_t)v21)
      {

        v24 = 0;
        if (i)
          goto LABEL_29;
LABEL_21:
        if (objc_msgSend(v24, "maneuverType") == 3
          || objc_msgSend(v24, "maneuverType") == 4
          || objc_msgSend(v24, "maneuverType") == 9
          || objc_msgSend(v24, "maneuverType") == 5)
        {
          v25 = objc_msgSend(v24, "maneuverType");
          if (v25 >= 0xB)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v25);
            v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v26 = off_1E1C20960[(int)v25];
          }
          NSLog(CFSTR("DirectionsResponse.SuggestedRoute.Section has an unexpected step (%@) at the beginning of a section"), v26);

        }
        goto LABEL_29;
      }
      objc_msgSend(v12, "steps");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectAtIndex:", v21);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
        objc_msgSend(v13, "addObject:", v24);
      if (!i)
        goto LABEL_21;
LABEL_29:
      if (i == objc_msgSend(v19, "stepIndexsCount") - 1
        && objc_msgSend(v24, "maneuverType") != 5
        && objc_msgSend(v24, "maneuverType") != 10)
      {
        v27 = objc_msgSend(v24, "maneuverType");
        if (v27 >= 0xB)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v27);
          v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v28 = off_1E1C20960[(int)v27];
        }
        NSLog(CFSTR("DirectionsResponse.SuggestedRoute.Section has an unexpected step (%@) at the end of a section"), v28);

      }
    }
    +[GEOTransitRouteBuilder _sectionOptionForTripIndex:andSectionOptions:](GEOTransitRouteBuilder, "_sectionOptionForTripIndex:andSectionOptions:", ++v15, v33);
    v29 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v29;
  }
  while (v29);
LABEL_38:
  objc_msgSend(v35, "setSteps:", v13);

  v10 = v33;
LABEL_39:

}

+ (id)_buildStepInfosFromSteps:(id)a3 withDecoderData:(id)a4 andIsWalkingOnlyRoute:(BOOL)a5 andBuildPointData:(id)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  int v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  _GEOTransitRouteStepInfo *v27;
  NSObject *v28;
  const char *v29;
  void *v31;
  id v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[16];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v7 = a5;
  v46 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v32 = a4;
  v34 = a6;
  v31 = v9;
  if (!objc_msgSend(v9, "count"))
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_41;
    *(_WORD *)buf = 0;
    v28 = MEMORY[0x1E0C81028];
    v29 = "Assertion failed: steps.count > 0";
LABEL_44:
    _os_log_fault_impl(&dword_1885A9000, v28, OS_LOG_TYPE_FAULT, v29, buf, 2u);
    goto LABEL_41;
  }
  if (!v34)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_41;
    *(_WORD *)buf = 0;
    v28 = MEMORY[0x1E0C81028];
    v29 = "Assertion failed: mutablePointData != nullptr";
    goto LABEL_44;
  }
  if (!objc_msgSend(v9, "count"))
  {
LABEL_41:
    v33 = 0;
    goto LABEL_42;
  }
  v33 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v11)
  {
    v12 = 0;
    v13 = 0;
    v14 = *(_QWORD *)v40;
    while (1)
    {
      v15 = 0;
      v16 = v13;
      do
      {
        if (*(_QWORD *)v40 != v14)
          objc_enumerationMutation(v10);
        v17 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v15);
        if (v12 + v15 >= (unint64_t)(objc_msgSend(v10, "count") - 1))
        {
          v18 = 0;
        }
        else
        {
          objc_msgSend(v10, "objectAtIndexedSubscript:", v12 + v15 + 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v19 = +[GEOPointUtility pointCount:usesZilch:](GEOPointUtility, "pointCount:usesZilch:", v34, 1);
        v20 = objc_msgSend(v17, "maneuverType");
        if ((v20 - 3) < 7)
        {
          if (v7)
            goto LABEL_23;
          +[GEOTransitRouteBuilder _buildTransitStepInfoFromStep:withPreviousStep:andNextStep:andDecoderData:andPointData:](GEOTransitRouteBuilder, "_buildTransitStepInfoFromStep:withPreviousStep:andNextStep:andDecoderData:andPointData:", v17, v16, v18, v32, v34);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
LABEL_15:
            objc_msgSend(v33, "addObject:", v21);
LABEL_22:

          goto LABEL_23;
        }
        if (v20 == 2)
        {
          +[GEOTransitRouteBuilder _buildExpandedWalkingStepInfosFromStep:andDecoderData:andPointData:](GEOTransitRouteBuilder, "_buildExpandedWalkingStepInfosFromStep:andDecoderData:andPointData:", v17, v32, v34);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "addObjectsFromArray:", v21);
          goto LABEL_22;
        }
        if (v20 == 10 && !v7)
        {
          +[GEOTransitRouteBuilder _buildArrivalStepInfoFromStep:withPointCount:](GEOTransitRouteBuilder, "_buildArrivalStepInfoFromStep:withPointCount:", v17, v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
            goto LABEL_15;
          goto LABEL_22;
        }
LABEL_23:
        v13 = v17;

        ++v15;
        v16 = v13;
      }
      while (v11 != v15);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      v12 += v15;
      if (!v11)
        goto LABEL_27;
    }
  }
  v13 = 0;
LABEL_27:

  if (!objc_msgSend(v33, "count") && v7)
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v22 = v10;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v36 != v24)
            objc_enumerationMutation(v22);
          v26 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
          v27 = objc_alloc_init(_GEOTransitRouteStepInfo);
          -[_GEOTransitRouteStepInfo setRouteSegmentType:](v27, "setRouteSegmentType:", 2);
          -[_GEOTransitRouteStepInfo setTransitStep:](v27, "setTransitStep:", v26);
          objc_msgSend(v33, "addObject:", v27);

        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
      }
      while (v23);
    }

  }
LABEL_42:

  return v33;
}

+ (id)_buildTransitStepInfoFromStep:(id)a3 withPreviousStep:(id)a4 andNextStep:(id)a5 andDecoderData:(id)a6 andPointData:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _BOOL8 v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  _GEOTransitRouteStepInfo *v29;
  NSObject *v31;
  const char *v32;
  uint8_t *v33;
  __int16 v34;
  __int16 v35;
  __int16 v36;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = v15;
  if (!v11)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      v36 = 0;
      v31 = MEMORY[0x1E0C81028];
      v32 = "Assertion failed: step != nullptr";
      v33 = (uint8_t *)&v36;
      goto LABEL_34;
    }
LABEL_32:
    v29 = 0;
    goto LABEL_26;
  }
  if (!v14)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      v35 = 0;
      v31 = MEMORY[0x1E0C81028];
      v32 = "Assertion failed: decoderData != nullptr";
      v33 = (uint8_t *)&v35;
      goto LABEL_34;
    }
    goto LABEL_32;
  }
  if (!v15)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_32;
    v34 = 0;
    v31 = MEMORY[0x1E0C81028];
    v32 = "Assertion failed: mutablePointData != nullptr";
    v33 = (uint8_t *)&v34;
LABEL_34:
    _os_log_fault_impl(&dword_1885A9000, v31, OS_LOG_TYPE_FAULT, v32, v33, 2u);
    goto LABEL_32;
  }
  v17 = v13
     && objc_msgSend(v12, "maneuverType") == 4
     && objc_msgSend(v11, "maneuverType") == 4;
  if (objc_msgSend(v11, "hasZilchIndex"))
  {
    v18 = objc_msgSend(v11, "zilchIndex");
    if (objc_msgSend(v14, "zilchPointsCount") <= (unint64_t)v18)
    {
LABEL_18:
      v22 = 0;
      goto LABEL_19;
    }
    v19 = objc_msgSend(v11, "zilchIndex");
  }
  else
  {
    if (!objc_msgSend(v11, "hasAccessPointZilchIndex"))
      goto LABEL_18;
    v20 = objc_msgSend(v11, "accessPointZilchIndex");
    if (objc_msgSend(v14, "zilchPointsCount") <= (unint64_t)v20)
      goto LABEL_18;
    v19 = objc_msgSend(v11, "accessPointZilchIndex");
  }
  objc_msgSend(v14, "zilchPointsAtIndex:", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
    goto LABEL_18;
  +[GEOPointUtility unpackPoints:usesZilch:](GEOPointUtility, "unpackPoints:usesZilch:", v21, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[GEOPointUtility pointCount:usesZilch:](GEOPointUtility, "pointCount:usesZilch:", v22, 1) == 1
    && objc_msgSend(v11, "maneuverType") == 6)
  {

    goto LABEL_18;
  }
LABEL_19:
  v23 = +[GEOTransitRouteBuilder _appendPointData:toPointData:withContinuity:](GEOTransitRouteBuilder, "_appendPointData:toPointData:withContinuity:", v22, v16, v17);
  v25 = v24;
  if (v24)
    v26 = v23;
  else
    v26 = 0x7FFFFFFFFFFFFFFFLL;
  if (v13)
  {
    v27 = objc_msgSend(v13, "startingTime");
    v28 = v27 - objc_msgSend(v11, "startingTime");
  }
  else
  {
    v28 = 0;
  }
  v29 = objc_alloc_init(_GEOTransitRouteStepInfo);
  -[_GEOTransitRouteStepInfo setRouteSegmentType:](v29, "setRouteSegmentType:", objc_msgSend(v11, "segmentTypeForManeuver"));
  -[_GEOTransitRouteStepInfo setPointRange:](v29, "setPointRange:", v26, v25);
  -[_GEOTransitRouteStepInfo setTransitStep:](v29, "setTransitStep:", v11);
  -[_GEOTransitRouteStepInfo setDuration:](v29, "setDuration:", v28);

LABEL_26:
  return v29;
}

+ (id)_buildExpandedWalkingStepInfosFromStep:(id)a3 andDecoderData:(id)a4 andPointData:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  _GEOTransitRouteStepInfo *v20;
  _GEOTransitRouteStepInfo *v21;
  NSObject *v22;
  const char *v23;
  id v25;
  void *v26;
  id v27;
  id obj;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[16];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v27 = a4;
  v8 = a5;
  v29 = v7;
  if (!v7)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_30;
    *(_WORD *)buf = 0;
    v22 = MEMORY[0x1E0C81028];
    v23 = "Assertion failed: step != nullptr";
LABEL_29:
    _os_log_fault_impl(&dword_1885A9000, v22, OS_LOG_TYPE_FAULT, v23, buf, 2u);
    goto LABEL_30;
  }
  if (objc_msgSend(v7, "maneuverType") != 2)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_30;
    *(_WORD *)buf = 0;
    v22 = MEMORY[0x1E0C81028];
    v23 = "Assertion failed: step.maneuverType == GEOPBTransitManeuver_WALK";
    goto LABEL_29;
  }
  if (!v27)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_30;
    *(_WORD *)buf = 0;
    v22 = MEMORY[0x1E0C81028];
    v23 = "Assertion failed: decoderData != nullptr";
    goto LABEL_29;
  }
  if (!v8)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_30;
    *(_WORD *)buf = 0;
    v22 = MEMORY[0x1E0C81028];
    v23 = "Assertion failed: mutablePointData != nullptr";
    goto LABEL_29;
  }
  if (objc_msgSend(v7, "maneuverType") != 2)
  {
LABEL_30:
    v30 = 0;
    goto LABEL_31;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "hasWalkingIndex"))
  {
    v25 = v8;
    objc_msgSend(v27, "walkingAtIndex:", objc_msgSend(v7, "walkingIndex"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v26, "hasUnpackedLatLngVertices") & 1) == 0)
      objc_msgSend(v26, "unpackLatLngVertices");
    objc_msgSend(v26, "unpackedLatLngVertices");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = +[GEOTransitRouteBuilder _appendPointData:toPointData:withContinuity:](GEOTransitRouteBuilder, "_appendPointData:toPointData:withContinuity:", v9, v8, 0);

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    objc_msgSend(v26, "steps");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v11)
    {
      v12 = 0;
      v13 = *(_QWORD *)v32;
      do
      {
        v14 = 0;
        v15 = v12;
        do
        {
          if (*(_QWORD *)v32 != v13)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v14);
          v17 = objc_msgSend(v16, "maneuverEndIndex");
          v18 = objc_msgSend(v16, "maneuverStartIndex");
          v19 = objc_msgSend(v16, "maneuverEndIndex");
          v20 = objc_alloc_init(_GEOTransitRouteStepInfo);
          -[_GEOTransitRouteStepInfo setRouteSegmentType:](v20, "setRouteSegmentType:", 2);
          -[_GEOTransitRouteStepInfo setWalkingStep:](v20, "setWalkingStep:", v16);
          -[_GEOTransitRouteStepInfo setTransitStep:](v20, "setTransitStep:", v29);
          v12 = v17;
          -[_GEOTransitRouteStepInfo setPointRange:](v20, "setPointRange:", v15 + v10, v17 - v15 + 1);
          -[_GEOTransitRouteStepInfo setManeuverPointRange:](v20, "setManeuverPointRange:", v10 + v18, v19 - (unint64_t)v18 + 1);
          objc_msgSend(v30, "addObject:", v20);

          ++v14;
          v15 = v17;
        }
        while (v11 != v14);
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v11);
    }

    v8 = v25;
  }
  else
  {
    v21 = objc_alloc_init(_GEOTransitRouteStepInfo);
    -[_GEOTransitRouteStepInfo setRouteSegmentType:](v21, "setRouteSegmentType:", 2);
    -[_GEOTransitRouteStepInfo setTransitStep:](v21, "setTransitStep:", v7);
    -[_GEOTransitRouteStepInfo setPointRange:](v21, "setPointRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
    objc_msgSend(v30, "addObject:", v21);

  }
  if (!objc_msgSend(v30, "count") && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: stepInfos.count > 0", buf, 2u);
  }
LABEL_31:

  return v30;
}

+ (id)_buildArrivalStepInfoFromStep:(id)a3 withPointCount:(unint64_t)a4
{
  id v5;
  void *v6;
  _GEOTransitRouteStepInfo *v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  __int16 v12;
  __int16 v13;
  __int16 v14;

  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_11;
    v14 = 0;
    v8 = MEMORY[0x1E0C81028];
    v9 = "Assertion failed: step != nullptr";
    v10 = (uint8_t *)&v14;
LABEL_14:
    _os_log_fault_impl(&dword_1885A9000, v8, OS_LOG_TYPE_FAULT, v9, v10, 2u);
    goto LABEL_11;
  }
  if (objc_msgSend(v5, "maneuverType") != 10)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_11;
    v13 = 0;
    v8 = MEMORY[0x1E0C81028];
    v9 = "Assertion failed: step.maneuverType == GEOPBTransitManeuver_ARRIVE_AT_DESTINATION";
    v10 = (uint8_t *)&v13;
    goto LABEL_14;
  }
  if (!a4)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_11;
    v12 = 0;
    v8 = MEMORY[0x1E0C81028];
    v9 = "Assertion failed: pointCount > 0";
    v10 = (uint8_t *)&v12;
    goto LABEL_14;
  }
  if (objc_msgSend(v6, "maneuverType") != 10)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  v7 = objc_alloc_init(_GEOTransitRouteStepInfo);
  -[_GEOTransitRouteStepInfo setRouteSegmentType:](v7, "setRouteSegmentType:", 2);
  -[_GEOTransitRouteStepInfo setTransitStep:](v7, "setTransitStep:", v6);
  -[_GEOTransitRouteStepInfo setPointRange:](v7, "setPointRange:", a4 - 1, 1);
LABEL_12:

  return v7;
}

+ (_NSRange)_appendPointData:(id)a3 toPointData:(id)a4 withContinuity:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v19;
  NSUInteger v20;
  NSUInteger v21;
  uint8_t v22[16];
  _NSRange result;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v9 = +[GEOPointUtility pointCount:usesZilch:](GEOPointUtility, "pointCount:usesZilch:", v8, 1);
    v10 = +[GEOPointUtility pointCount:usesZilch:](GEOPointUtility, "pointCount:usesZilch:", v7, 1);
    if (v7)
    {
      if (v9)
      {
        v11 = v9 - 1;
        +[GEOPointUtility pointAt:pointData:usesZilch:](GEOPointUtility, "pointAt:pointData:usesZilch:", v9 - 1, v8, 1);
        v13 = v12;
        v15 = v14;
        +[GEOPointUtility pointAt:pointData:usesZilch:](GEOPointUtility, "pointAt:pointData:usesZilch:", 0, v7, 1);
        if (v13 == v17 && v15 == v16)
        {
          +[GEOPointUtility subdataFromPointData:fromPointIndex:usesZilch:](GEOPointUtility, "subdataFromPointData:fromPointIndex:usesZilch:", v7, 1, 1);
          v19 = objc_claimAutoreleasedReturnValue();

          v7 = (id)v19;
          v9 = v11;
        }
        else
        {
          v10 += v5;
          if (v5)
            --v9;
        }
      }
      objc_msgSend(v8, "appendData:", v7);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: mutablePointData != nullptr", v22, 2u);
    }
    v10 = 0;
    v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  v20 = v9;
  v21 = v10;
  result.length = v21;
  result.location = v20;
  return result;
}

+ (id)_buildCoordinatesForData:(id)a3 andStepInfos:(id)a4 andCustodian:(id)a5 withWaypoints:(id)a6 andArrivalParameters:(id)a7 andCreateLegs:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  GEOComposedRouteCoordinateArray *v17;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  double v25;
  unint64_t v26;
  GEOComposedRouteLengthMarker *v27;
  uint64_t v28;
  uint64_t v29;
  GEOComposedRouteCoordinateArray *v30;
  void *v31;
  void *v32;
  void *v33;
  GEOComposedRouteLeg *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  uint64_t j;
  double v40;
  double v41;
  NSObject *v42;
  const char *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[8];
  _BYTE v58[128];
  id v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v46 = a5;
  v15 = a6;
  v48 = a7;
  v16 = a8;
  v45 = v13;
  v47 = v15;
  if (!v13)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v42 = MEMORY[0x1E0C81028];
    v43 = "Assertion failed: pointData != nullptr";
LABEL_41:
    _os_log_fault_impl(&dword_1885A9000, v42, OS_LOG_TYPE_FAULT, v43, buf, 2u);
    goto LABEL_9;
  }
  if (!objc_msgSend(v14, "count"))
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v42 = MEMORY[0x1E0C81028];
    v43 = "Assertion failed: stepInfos.count > 0";
    goto LABEL_41;
  }
  if ((unint64_t)objc_msgSend(v15, "count") <= 1)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v42 = MEMORY[0x1E0C81028];
    v43 = "Assertion failed: waypoints.count >= 2";
    goto LABEL_41;
  }
  if (!v16)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v42 = MEMORY[0x1E0C81028];
    v43 = "Assertion failed: legs != nullptr";
    goto LABEL_41;
  }
  if (objc_msgSend(v16, "count"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v42 = MEMORY[0x1E0C81028];
      v43 = "Assertion failed: legs.count == 0";
      goto LABEL_41;
    }
LABEL_9:
    v17 = 0;
    goto LABEL_10;
  }
  if (!objc_msgSend(v14, "count") || (unint64_t)objc_msgSend(v15, "count") < 2 || objc_msgSend(v16, "count"))
    goto LABEL_9;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v20 = v14;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v54 != v22)
          objc_enumerationMutation(v20);
        v24 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        objc_msgSend(v24, "distance");
        if (v25 != 0.0)
        {
          objc_msgSend(v24, "pointRange");
          if (v26 >= 2)
          {
            v27 = objc_alloc_init(GEOComposedRouteLengthMarker);
            -[GEOComposedRouteLengthMarker setPathIndex:](v27, "setPathIndex:", 0);
            v28 = objc_msgSend(v24, "pointRange");
            -[GEOComposedRouteLengthMarker setPointIndex:](v27, "setPointIndex:", v29 + v28 - 1);
            objc_msgSend(v24, "distance");
            -[GEOComposedRouteLengthMarker setLength:](v27, "setLength:");
            objc_msgSend(v19, "addObject:", v27);

          }
        }
      }
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
    }
    while (v21);
  }

  v30 = [GEOComposedRouteCoordinateArray alloc];
  v59 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[GEOComposedRouteCoordinateArray initWithPointData:lengthMarkers:usesZilch:](v30, "initWithPointData:lengthMarkers:usesZilch:", v31, v19, 1);

  objc_msgSend(v47, "firstObject");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "lastObject");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[GEOComposedRouteLeg initWithComposedRoute:legIndex:origin:destination:arrivalParameters:]([GEOComposedRouteLeg alloc], "initWithComposedRoute:legIndex:origin:destination:arrivalParameters:", v46, 0, v32, v33, v48);
  -[GEOComposedRouteLeg setPointRange:](v34, "setPointRange:", 0, -[GEOComposedRouteCoordinateArray coordinateCount](v17, "coordinateCount"));
  -[GEOComposedRouteLeg setStepRange:](v34, "setStepRange:", 0, objc_msgSend(v20, "count"));
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v35 = v20;
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
  if (v36)
  {
    v44 = v32;
    v37 = *(_QWORD *)v50;
    v38 = 0.0;
    do
    {
      for (j = 0; j != v36; ++j)
      {
        if (*(_QWORD *)v50 != v37)
          objc_enumerationMutation(v35);
        objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * j), "distance");
        v38 = v38 + v40;
      }
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    }
    while (v36);
    v41 = (double)v38;
    v32 = v44;
  }
  else
  {
    v41 = 0.0;
  }

  -[GEOComposedRouteLeg setDistance:](v34, "setDistance:", v41);
  objc_msgSend(v16, "addObject:", v34);

LABEL_10:
  return v17;
}

+ (double)_totalDistanceForLegs:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t i;
  double v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    v6 = 0.0;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "distance", (_QWORD)v10);
        v6 = v6 + v8;
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

+ (id)_buildStepsForStepInfos:(id)a3 andCustodian:(id)a4 andDecoderData:(id)a5 andSuggestedRoute:(id)a6 andLegs:(id)a7 andPointCount:(unint64_t)a8 andRideSelections:(id)a9 andSectionOptions:(id)a10 andCreateSegments:(id)a11 andUpdateTripCount:(unint64_t *)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  const char *v30;
  uint8_t *v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  uint8_t buf[2];
  __int16 v38;
  __int16 v39;
  __int16 v40;

  v17 = a3;
  v36 = a4;
  v35 = a5;
  v18 = a6;
  v19 = a7;
  v33 = a9;
  v32 = a10;
  v20 = a11;
  if (!objc_msgSend(v17, "count"))
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_8;
    v40 = 0;
    v29 = MEMORY[0x1E0C81028];
    v30 = "Assertion failed: stepInfos.count > 0";
    v31 = (uint8_t *)&v40;
LABEL_28:
    _os_log_fault_impl(&dword_1885A9000, v29, OS_LOG_TYPE_FAULT, v30, v31, 2u);
    goto LABEL_8;
  }
  if (!v36)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_8;
    v39 = 0;
    v29 = MEMORY[0x1E0C81028];
    v30 = "Assertion failed: custodian != nullptr";
    v31 = (uint8_t *)&v39;
    goto LABEL_28;
  }
  if (!v20)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_8;
    v38 = 0;
    v29 = MEMORY[0x1E0C81028];
    v30 = "Assertion failed: segments != nullptr";
    v31 = (uint8_t *)&v38;
    goto LABEL_28;
  }
  if (objc_msgSend(v20, "count"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v29 = MEMORY[0x1E0C81028];
      v30 = "Assertion failed: segments.count == 0";
      v31 = buf;
      goto LABEL_28;
    }
LABEL_8:
    v21 = 0;
    goto LABEL_9;
  }
  if (!objc_msgSend(v17, "count") || !objc_msgSend(v19, "count") || objc_msgSend(v20, "count"))
    goto LABEL_8;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v17, "count"));
  v23 = 0;
  v34 = v20;
  while (v23 < objc_msgSend(v17, "count"))
  {
    v24 = +[GEOTransitRouteBuilder _stepCountForSegmentWithStartingStepIndex:andStepInfos:](GEOTransitRouteBuilder, "_stepCountForSegmentWithStartingStepIndex:andStepInfos:", v23, v17);
    v25 = v24;
    v26 = v23;
    if (v23 < v24 + v23)
    {
      do
      {
        +[GEOTransitRouteBuilder _stepForStepInfoAtIndex:andStepInfos:andSteps:andCustodian:withDecoderData:andSuggestedRoute:andPointCount:](GEOTransitRouteBuilder, "_stepForStepInfoAtIndex:andStepInfos:andSteps:andCustodian:withDecoderData:andSuggestedRoute:andPointCount:", v26, v17, v21, v36, v35, v18, a8);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
          objc_msgSend(v21, "addObject:", v27);

        ++v26;
        --v25;
      }
      while (v25);
    }
    +[GEOTransitRouteBuilder _segmentForSteps:withRange:segmentIndex:andCustodian:andDecoderData:andSuggestedRoute:andRideSelections:andSectionOptions:andUpdateTripCount:](GEOTransitRouteBuilder, "_segmentForSteps:withRange:segmentIndex:andCustodian:andDecoderData:andSuggestedRoute:andRideSelections:andSectionOptions:andUpdateTripCount:", v21, v23, v24, objc_msgSend(v34, "count"), v36, v35, v18, v33, v32, a12);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
      objc_msgSend(v34, "addObject:", v28);

    v23 += v24;
  }
  v20 = v34;
LABEL_9:

  return v21;
}

+ (unint64_t)_stepCountForSegmentWithStartingStepIndex:(unint64_t)a3 andStepInfos:(id)a4
{
  id v5;
  void *v6;
  unint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;

  v5 = a4;
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = a3 + 2; i - 1 < objc_msgSend(v5, "count"); ++i)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", i - 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "routeSegmentType");
    if (v9 != objc_msgSend(v8, "routeSegmentType"))
      goto LABEL_8;
    objc_msgSend(v8, "transitStep");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "maneuverType");

    switch(v11)
    {
      case 3:
        goto LABEL_8;
      case 5:
        goto LABEL_9;
      case 9:
LABEL_8:
        --i;
LABEL_9:

        goto LABEL_11;
    }

  }
  --i;
LABEL_11:

  return i - a3;
}

+ (id)_stepForStepInfoAtIndex:(unint64_t)a3 andStepInfos:(id)a4 andSteps:(id)a5 andCustodian:(id)a6 withDecoderData:(id)a7 andSuggestedRoute:(id)a8 andPointCount:(unint64_t)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  GEOComposedTransitTripRouteStep *v24;
  void *v25;
  uint64_t v26;
  GEOComposedTransitStationRouteStep *v27;
  void *v28;
  id v30;

  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v30 = a8;
  objc_msgSend(v14, "objectAtIndexedSubscript:", a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = +[GEOTransitRouteBuilder _validPointRangeForStepInfoIndex:andStepInfos:withPointCount:](GEOTransitRouteBuilder, "_validPointRangeForStepInfoIndex:andStepInfos:withPointCount:", a3, v14, a9);
  v21 = v20;
  v22 = objc_msgSend(v15, "count");
  v23 = objc_msgSend(v18, "routeSegmentType");
  switch(v23)
  {
    case 2:
      objc_msgSend(v14, "objectAtIndexedSubscript:", a3);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[GEOTransitRouteBuilder _walkingStepForStepInfo:withValidPointRange:andStepCount:andCustodian:andDecoderData:andSuggestedRoute:](GEOTransitRouteBuilder, "_walkingStepForStepInfo:withValidPointRange:andStepCount:andCustodian:andDecoderData:andSuggestedRoute:", v25, v19, v21, objc_msgSend(v15, "count"), v16, v17, v30);
      v26 = objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      v27 = [GEOComposedTransitStationRouteStep alloc];
      objc_msgSend(v18, "transitStep");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[GEOComposedTransitStationRouteStep initWithComposedRoute:decoderData:step:stepIndex:duration:pointRange:](v27, "initWithComposedRoute:decoderData:step:stepIndex:duration:pointRange:", v16, v17, v25, v22, objc_msgSend(v18, "duration"), v19, v21);
      break;
    case 6:
      v24 = [GEOComposedTransitTripRouteStep alloc];
      objc_msgSend(v18, "transitStep");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[GEOComposedTransitTripRouteStep initWithComposedRoute:decoderData:step:stepIndex:duration:pointRange:](v24, "initWithComposedRoute:decoderData:step:stepIndex:duration:pointRange:", v16, v17, v25, v22, objc_msgSend(v18, "duration"), v19, v21);
      break;
    default:
      v28 = 0;
      goto LABEL_9;
  }
  v28 = (void *)v26;

LABEL_9:
  return v28;
}

+ (_NSRange)_validPointRangeForStepInfoIndex:(unint64_t)a3 andStepInfos:(id)a4 withPointCount:(unint64_t)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  id v21;
  NSUInteger v22;
  NSUInteger v23;
  _NSRange result;

  v7 = a4;
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "pointRange");
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v8, "transitStep");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "maneuverType");

    if (v12 <= 7 && ((1 << v12) & 0xE4) != 0)
    {
      v13 = 0;
      do
      {
        if ((uint64_t)a3 <= 0)
        {
          v10 = 0;
          goto LABEL_19;
        }
        objc_msgSend(v7, "objectAtIndexedSubscript:", --a3);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = v14;
      }
      while (objc_msgSend(v14, "pointRange") == 0x7FFFFFFFFFFFFFFFLL);
      v15 = v14;
      if (v15)
      {
        v13 = v15;
        v16 = objc_msgSend(v15, "pointRange");
        v10 = v17 + v16 - 1;
        goto LABEL_9;
      }
      v10 = 0;
    }
    else
    {
      v13 = 0;
      v19 = a3 + 1;
      do
      {
        if (v19 >= objc_msgSend(v7, "count"))
          goto LABEL_18;
        objc_msgSend(v7, "objectAtIndexedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        ++v19;
        v13 = v20;
      }
      while (objc_msgSend(v20, "pointRange") == 0x7FFFFFFFFFFFFFFFLL);
      v21 = v20;
      v13 = v21;
      if (!v21)
      {
LABEL_18:
        v10 = a5 - 1;
        goto LABEL_19;
      }
      v10 = objc_msgSend(v21, "pointRange");
LABEL_9:

LABEL_19:
    }
    v18 = 1;
  }
  else
  {
    v18 = v9;
  }

  v22 = v10;
  v23 = v18;
  result.length = v23;
  result.location = v22;
  return result;
}

+ (id)_walkingStepForStepInfo:(id)a3 withValidPointRange:(_NSRange)a4 andStepCount:(unint64_t)a5 andCustodian:(id)a6 andDecoderData:(id)a7 andSuggestedRoute:(id)a8
{
  NSUInteger location;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  GEOComposedTransitWalkingRouteStep *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  GEOComposedTransitWalkingRouteStep *v28;
  GEOComposedTransitWalkingRouteStep *v29;
  void *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  GEOComposedTransitWalkingRouteStep *v50;
  void *v51;
  NSUInteger length;
  id v54;

  length = a4.length;
  location = a4.location;
  v12 = a3;
  v13 = a6;
  v14 = a7;
  v54 = a8;
  objc_msgSend(v12, "transitStep");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "maneuverType") != 2)
  {
    objc_msgSend(v15, "location");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "coordinate");
    v25 = v24;
    v27 = v26;

    v28 = [GEOComposedTransitWalkingRouteStep alloc];
    objc_msgSend(v12, "transitStep");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[GEOComposedTransitWalkingRouteStep initWithComposedRoute:decoderData:transitStep:stepIndex:startCoordinate:endCoordinate:pointRange:](v28, "initWithComposedRoute:decoderData:transitStep:stepIndex:startCoordinate:endCoordinate:pointRange:", v13, v14, v19, a5, location, length, v25, v27, v25, v27);
    goto LABEL_5;
  }
  objc_msgSend(v12, "transitStep");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hasWalkingIndex");

  if (!v17)
  {
    objc_msgSend(v54, "steps");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "indexOfObject:", v15);

    if ((v31 & 0x7FFFFFFFFFFFFFFFLL) != 0)
    {
      objc_msgSend(v54, "stepsAtIndex:", v31 - 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = 0;
    }
    if (objc_msgSend(v19, "maneuverType") == 8 || objc_msgSend(v19, "maneuverType") == 5)
    {
      if (objc_msgSend(v19, "hasStartingStopIndex"))
      {
        objc_msgSend(v14, "stopAtIndex:", objc_msgSend(v19, "startingStopIndex"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "latLng");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "coordinate");
        v35 = v34;
        v37 = v36;

LABEL_15:
LABEL_17:
        v40 = objc_msgSend(v54, "stepsCount");
        v41 = 0;
        if (v31 != 0x7FFFFFFFFFFFFFFELL && v31 < v40 - 1)
        {
          objc_msgSend(v54, "stepsAtIndex:");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
        }
        if (objc_msgSend(v41, "maneuverType") == 7
          || objc_msgSend(v41, "maneuverType") == 3)
        {
          if (objc_msgSend(v41, "hasEndingStopIndex"))
          {
            objc_msgSend(v14, "stopAtIndex:", objc_msgSend(v41, "endingStopIndex"));
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "latLng");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "coordinate");
            v45 = v44;
            v47 = v46;

LABEL_26:
LABEL_28:
            v50 = [GEOComposedTransitWalkingRouteStep alloc];
            objc_msgSend(v12, "transitStep");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = -[GEOComposedTransitWalkingRouteStep initWithComposedRoute:decoderData:transitStep:stepIndex:startCoordinate:endCoordinate:pointRange:](v50, "initWithComposedRoute:decoderData:transitStep:stepIndex:startCoordinate:endCoordinate:pointRange:", v13, v14, v51, a5, location, length, v35, v37, v45, v47);

            goto LABEL_29;
          }
        }
        else if (objc_msgSend(v41, "maneuverType") == 10)
        {
          objc_msgSend(v41, "location");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "coordinate");
          v45 = v48;
          v47 = v49;
          goto LABEL_26;
        }
        v45 = -180.0;
        v47 = -180.0;
        goto LABEL_28;
      }
    }
    else if (objc_msgSend(v19, "maneuverType") == 1)
    {
      objc_msgSend(v19, "location");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "coordinate");
      v35 = v38;
      v37 = v39;
      goto LABEL_15;
    }
    v35 = -180.0;
    v37 = -180.0;
    goto LABEL_17;
  }
  v18 = [GEOComposedTransitWalkingRouteStep alloc];
  objc_msgSend(v12, "walkingStep");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v12, "maneuverPointRange");
  v22 = -[GEOComposedTransitWalkingRouteStep initWithComposedRoute:decoderData:transitStep:stepIndex:geoStep:pointRange:maneuverPointRange:](v18, "initWithComposedRoute:decoderData:transitStep:stepIndex:geoStep:pointRange:maneuverPointRange:", v13, v14, v15, a5, v19, location, length, v20, v21);
LABEL_5:
  v29 = (GEOComposedTransitWalkingRouteStep *)v22;
LABEL_29:

  return v29;
}

+ (id)_segmentForSteps:(id)a3 withRange:(_NSRange)a4 segmentIndex:(unint64_t)a5 andCustodian:(id)a6 andDecoderData:(id)a7 andSuggestedRoute:(id)a8 andRideSelections:(id)a9 andSectionOptions:(id)a10 andUpdateTripCount:(unint64_t *)a11
{
  NSUInteger length;
  NSUInteger location;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  NSUInteger v20;
  NSUInteger v21;
  NSUInteger v22;
  NSUInteger v23;
  NSRange v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  GEOComposedTransitStationRouteSegment *v36;
  id v37;
  void *v38;
  uint64_t v39;
  GEOComposedWalkingRouteSegment *v40;
  id v42;
  id v43;
  void *v45;
  id v46;
  id v47;
  id v48;
  NSRange v49;
  NSRange v50;

  length = a4.length;
  location = a4.location;
  v15 = a3;
  v47 = a6;
  v46 = a7;
  v48 = a8;
  v16 = a9;
  v17 = a10;
  v45 = v15;
  objc_msgSend(v15, "objectAtIndex:", location);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndex:", length + location - 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "pointRange");
  v22 = v21;
  v50.location = objc_msgSend(v19, "pointRange");
  v50.length = v23;
  v49.location = v20;
  v49.length = v22;
  v24 = NSUnionRange(v49, v50);
  if (objc_msgSend(v18, "transportType") == 1)
  {
    v42 = v17;
    v43 = v16;
    v25 = v18;
    v26 = v19;
    objc_msgSend(v48, "steps");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "transitStep");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "indexOfObject:", v28);

    objc_msgSend(v48, "steps");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "transitStep");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "indexOfObject:", v31);

    v33 = v32 - v29 + 1;
    v17 = v42;
    v16 = v43;
  }
  else
  {
    v33 = 0;
    v29 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v34 = objc_msgSend(v18, "routeSegmentType");
  switch(v34)
  {
    case 2:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v37 = v18;
        v38 = v37;
        if (v37)
        {
          v39 = objc_msgSend(v37, "stepIndex");
LABEL_16:
          v40 = -[GEOComposedWalkingRouteSegment initWithComposedRoute:stepRange:pointRange:segmentIndex:transitIncidentMessageStepIndex:]([GEOComposedWalkingRouteSegment alloc], "initWithComposedRoute:stepRange:pointRange:segmentIndex:transitIncidentMessageStepIndex:", v47, location, length, v24.location, v24.length, a5, v39);

          goto LABEL_17;
        }
      }
      else
      {
        v38 = 0;
      }
      v39 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_16;
    case 5:
      v36 = -[GEOComposedTransitStationRouteSegment initWithComposedRoute:decoderData:stepRange:transitStepRange:pointRange:segmentIndex:]([GEOComposedTransitStationRouteSegment alloc], "initWithComposedRoute:decoderData:stepRange:transitStepRange:pointRange:segmentIndex:", v47, v46, location, length, v29, v33, v24.location, v24.length, a5);
      break;
    case 6:
      v35 = (*a11)++;
      v36 = -[GEOComposedTransitTripRouteSegment initWithComposedRoute:rideSelections:sectionOptions:decoderData:tripIndex:stepRange:transitStepRange:pointRange:segmentIndex:]([GEOComposedTransitTripRouteSegment alloc], "initWithComposedRoute:rideSelections:sectionOptions:decoderData:tripIndex:stepRange:transitStepRange:pointRange:segmentIndex:", v47, v16, v17, v46, v35, location, length, v29, v33, v24.location, v24.length, a5);
      break;
    default:
      v40 = 0;
      goto LABEL_17;
  }
  v40 = (GEOComposedWalkingRouteSegment *)v36;
LABEL_17:

  return v40;
}

+ (id)buildRouteSectionsForSuggestedRoute:(id)a3 fromSteps:(id)a4 andSegments:(id)a5 andCoordinates:(id)a6 andDecoderData:(id)a7
{
  id v11;
  id v12;
  id v13;
  unsigned int v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  double v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  double v27;
  double v28;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;

  v11 = a3;
  v34 = a4;
  v33 = a5;
  v12 = a6;
  v32 = a7;
  if ((unint64_t)objc_msgSend(v12, "coordinateCount") >= 2)
  {
    v30 = v11;
    v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0.0;
    while (1)
    {
      if (v19 >= objc_msgSend(v34, "count"))
      {
        +[GEOTransitRouteBuilder _buildPointSectionsInCollection:pointRange:stepIndex:transitLineColor:startDistance:coordinates:fromSteps:andSegments:andDecoderData:](GEOTransitRouteBuilder, "_buildPointSectionsInCollection:pointRange:stepIndex:transitLineColor:startDistance:coordinates:fromSteps:andSegments:andDecoderData:", v31, v14, v15 - v14 + 1, v19 - 1, v17, v12, v20, v34, v33, v32);
        v13 = v31;

        v11 = v30;
        goto LABEL_23;
      }
      if (v18)

      else
        v18 = v17;
      objc_msgSend(v34, "objectAtIndex:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        break;
      v22 = objc_msgSend(v21, "maneuver");
      if (v22 == 3)
      {
        objc_msgSend(v21, "transitLine");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "lineColorString");
        v25 = objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
      if (v22 == 9)
      {
        objc_msgSend(v21, "transitLine");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "lineColorString");
        v24 = objc_claimAutoreleasedReturnValue();
LABEL_17:

        goto LABEL_18;
      }
      v24 = 0;
LABEL_18:
      if (+[GEOTransitRouteBuilder _shouldBreakPointSectionAtStep:previousStep:](GEOTransitRouteBuilder, "_shouldBreakPointSectionAtStep:previousStep:", v21, v16))
      {
        +[GEOTransitRouteBuilder _buildPointSectionsInCollection:pointRange:stepIndex:transitLineColor:startDistance:coordinates:fromSteps:andSegments:andDecoderData:](GEOTransitRouteBuilder, "_buildPointSectionsInCollection:pointRange:stepIndex:transitLineColor:startDistance:coordinates:fromSteps:andSegments:andDecoderData:", v31, v14, v15 - v14 + 1, v19 - (v19 != 0), v18, v12, v20, v34, v33, v32);
        v28 = v27;
        v14 = objc_msgSend(v21, "startPointIndex");
        v20 = v20 + v28;
      }
      v15 = objc_msgSend(v21, "endPointIndex");

      ++v19;
      v16 = v21;
      v17 = v18;
      v18 = (void *)v24;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & (v18 == 0)) != 1)
    {
      v24 = 0;
      v23 = v18;
      v18 = 0;
      goto LABEL_17;
    }
    objc_msgSend(v21, "nextBoardingStep");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "transitLine");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "lineColorString");
    v25 = objc_claimAutoreleasedReturnValue();
LABEL_16:
    v26 = (void *)v25;

    v24 = 0;
    v18 = v26;
    goto LABEL_17;
  }
  v13 = 0;
LABEL_23:

  return v13;
}

+ (BOOL)_shouldBreakPointSectionAtStep:(id)a3 previousStep:(id)a4
{
  id v5;
  id v6;
  int v7;
  unsigned int v8;
  BOOL v9;

  v5 = a3;
  v6 = a4;
  v9 = 1;
  if (objc_msgSend(v5, "transportType") != 1)
  {
    if (!v6
      || (v7 = objc_msgSend(v6, "transportType"), v7 == objc_msgSend(v5, "transportType"))
      && (v8 = objc_msgSend(v5, "startPointIndex"), v8 <= objc_msgSend(v6, "endPointIndex")))
    {
      v9 = 0;
    }
  }

  return v9;
}

+ (double)_buildPointSectionsInCollection:(id)a3 pointRange:(_NSRange)a4 stepIndex:(unint64_t)a5 transitLineColor:(id)a6 startDistance:(double)a7 coordinates:(id)a8 fromSteps:(id)a9 andSegments:(id)a10 andDecoderData:(id)a11
{
  NSUInteger length;
  NSUInteger location;
  id v16;
  id v17;
  double v18;
  double v19;
  NSUInteger v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  unint64_t v26;
  uint64_t v27;
  NSUInteger v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  unint64_t v34;
  double v35;
  double v36;
  NSUInteger v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  NSUInteger v46;
  NSUInteger v47;
  void *v48;
  unint64_t v49;
  void *v50;
  void *v51;
  id v52;
  unint64_t v53;
  void *v54;
  id v56;
  NSUInteger v57;
  id v59;
  id v60;
  double v61;
  id v62;
  id v63;
  double v64;
  double v65;
  double v66;
  double v67;
  _OWORD v68[3];
  _OWORD v69[3];
  __int128 v70;
  __int128 v71;
  __int128 v72;

  length = a4.length;
  location = a4.location;
  v56 = a3;
  v60 = a6;
  v16 = a8;
  v63 = a9;
  v17 = a10;
  v59 = a11;
  if (length >= 2)
  {
    v61 = a7;
    v62 = v16;
    objc_msgSend(v16, "coordinateOnRouteAt:", location);
    v19 = v18;
    v20 = location;
    v23 = GEOTilePointForCoordinate(v21, v22, 20.0);
    v25 = v24;
    v26 = length - 1;
    v67 = 0.0;
    v27 = 1;
    v28 = location;
    v29 = v23;
    v30 = v23;
    v31 = v24;
    v32 = v24;
    v33 = v19;
    v34 = 1;
    v35 = v19;
    v57 = length - 1;
    do
    {
      v64 = v32;
      v65 = v35;
      v36 = v25;
      v66 = v33;
      v37 = v20 + v34;
      objc_msgSend(v16, "coordinateOnRouteAt:", v20 + v34);
      v39 = v38;
      v42 = GEOTilePointForCoordinate(v40, v41, 20.0);
      v25 = v43;
      v44 = v67 + GEOMetersBetweenMapPoints(v23, v36, v42, v43);
      if (v29 >= v42)
        v29 = v42;
      if (v30 <= v42)
        v30 = v42;
      if (v31 >= v25)
        v31 = v25;
      v32 = v64;
      v35 = v65;
      if (v64 <= v25)
        v32 = v25;
      if (v65 >= v39)
        v35 = v39;
      v33 = v66;
      if (v66 <= v39)
        v33 = v39;
      ++v27;
      if (v44 <= 16000.0 || v34 >= v26)
      {
        v67 = v44;
      }
      else
      {
        v46 = length;
        v47 = v20;
        *(double *)&v70 = v29;
        *((double *)&v70 + 1) = v31;
        *(double *)&v71 = v35;
        *((double *)&v71 + 1) = v30 - v29;
        *(double *)&v72 = v32 - v31;
        *((double *)&v72 + 1) = v33 - v35;
        +[GEORouteBuilder segmentForPointIndex:withSegments:andSteps:](GEORouteBuilder, "segmentForPointIndex:withSegments:andSteps:", v28, v17, v63, (double)GEOComposedRouteSectionPadAndSquareBounds((double *)&v70));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = +[GEORouteBuilder segmentIndexForPointIndex:withSegments:](GEORouteBuilder, "segmentIndexForPointIndex:withSegments:", v28, v17);
        v69[0] = v70;
        v69[1] = v71;
        v69[2] = v72;
        +[GEOTransitRouteBuilder _sectionForSteps:withIndex:andSegment:withIndex:andCoordinates:andPointRange:andBounds:andTransitLineColor:andStartDistance:andDecoderData:](GEOTransitRouteBuilder, "_sectionForSteps:withIndex:andSegment:withIndex:andCoordinates:andPointRange:andBounds:andTransitLineColor:andStartDistance:andDecoderData:", v63, a5, v48, v49, v62, v61, v28, v27, v69, v60, v59);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        if (v50)
          objc_msgSend(v56, "addObject:", v50);
        v61 = v61 + v44;

        v67 = 0.0;
        v33 = v39;
        v35 = v39;
        v32 = v25;
        v31 = v25;
        v30 = v42;
        v29 = v42;
        v28 = v37;
        v27 = 1;
        v16 = v62;
        v20 = v47;
        length = v46;
        v26 = v57;
      }
      ++v34;
      v23 = v42;
    }
    while (length != v34);
    *(double *)&v70 = v29;
    *((double *)&v70 + 1) = v31;
    *(double *)&v71 = v35;
    *((double *)&v71 + 1) = v30 - v29;
    *(double *)&v72 = v32 - v31;
    *((double *)&v72 + 1) = v33 - v35;
    +[GEORouteBuilder segmentForPointIndex:withSegments:andSteps:](GEORouteBuilder, "segmentForPointIndex:withSegments:andSteps:", v28, v17, v63, (double)GEOComposedRouteSectionPadAndSquareBounds((double *)&v70));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v17;
    v53 = +[GEORouteBuilder segmentIndexForPointIndex:withSegments:](GEORouteBuilder, "segmentIndexForPointIndex:withSegments:", v28, v17);
    v68[0] = v70;
    v68[1] = v71;
    v68[2] = v72;
    +[GEOTransitRouteBuilder _sectionForSteps:withIndex:andSegment:withIndex:andCoordinates:andPointRange:andBounds:andTransitLineColor:andStartDistance:andDecoderData:](GEOTransitRouteBuilder, "_sectionForSteps:withIndex:andSegment:withIndex:andCoordinates:andPointRange:andBounds:andTransitLineColor:andStartDistance:andDecoderData:", v63, a5, v51, v53, v62, v61, v28, v27, v68, v60, v59);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (v54)
      objc_msgSend(v56, "addObject:", v54);
    a7 = v67 + v61;

    v17 = v52;
    v16 = v62;
  }

  return a7;
}

+ (id)_sectionForSteps:(id)a3 withIndex:(unint64_t)a4 andSegment:(id)a5 withIndex:(unint64_t)a6 andCoordinates:(id)a7 andPointRange:(_NSRange)a8 andBounds:(id *)a9 andTransitLineColor:(id)a10 andStartDistance:(double)a11 andDecoderData:(id)a12
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  GEOComposedRouteTransitTripSection *v23;
  GEOComposedRouteSection *v24;
  __int128 v25;
  uint64_t v27;
  GEOComposedRouteTransitTripSection *v28;
  id v29;
  id v31;
  _OWORD v32[4];

  v16 = a3;
  v17 = a5;
  v18 = a7;
  v31 = a10;
  v19 = a12;
  objc_msgSend(v16, "objectAtIndex:", a4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "routeSegmentType");
  if (v21 == 2 || v21 == 5)
  {
    v24 = [GEOComposedRouteSection alloc];
    v25 = *(_OWORD *)&a9->var0.var2;
    v32[0] = *(_OWORD *)&a9->var0.var0;
    v32[1] = v25;
    v32[2] = *(_OWORD *)&a9->var1.var1;
    LODWORD(v27) = 2;
    v23 = -[GEOComposedRouteSection initWithCoordinates:segment:segmentIndex:steps:startCoordinateIndex:coordinateCount:bounds:transportType:finalStepIndex:startDistance:lengthScaleFactor:](v24, "initWithCoordinates:segment:segmentIndex:steps:startCoordinateIndex:coordinateCount:bounds:transportType:finalStepIndex:startDistance:lengthScaleFactor:", v18, v17, a6, v16, a8.location, a8.length, a11, 1.0, v32, v27, a4);
  }
  else if (v21 == 6)
  {
    v29 = v20;
    v28 = [GEOComposedRouteTransitTripSection alloc];
    objc_msgSend(v29, "transitStep");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v27) = objc_msgSend(v22, "significanceForEndNode");
    v23 = -[GEOComposedRouteTransitTripSection initWithCoordinates:segment:segmentIndex:steps:startCoordinateIndex:coordinateCount:stepIndex:toNodeSignificance:transitLineColor:startDistance:lengthScaleFactor:decoderData:](v28, "initWithCoordinates:segment:segmentIndex:steps:startCoordinateIndex:coordinateCount:stepIndex:toNodeSignificance:transitLineColor:startDistance:lengthScaleFactor:decoderData:", v18, v17, a6, v16, a8.location, a8.length, a11, 1.0, a4, v27, v31, v19);

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

+ (id)outputForGeometry:(id)a3 andLine:(id)a4 andStops:(id)a5 andCustodian:(id)a6
{
  id *v9;
  id v10;
  id v11;
  id v12;
  GEOTransitRouteBuilderOutput *v13;
  NSObject *v14;
  id v15;
  GEOComposedRouteCoordinateArray *v16;
  void *v17;
  GEOComposedRouteCoordinateArray *v18;
  void *v19;
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
  NSObject *v32;
  const char *v33;
  void *v35;
  void *v36;
  uint8_t buf[16];
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v9 = (id *)a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (!v9)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v32 = MEMORY[0x1E0C81028];
    v33 = "Assertion failed: geometry != nullptr";
LABEL_17:
    _os_log_fault_impl(&dword_1885A9000, v32, OS_LOG_TYPE_FAULT, v33, buf, 2u);
    goto LABEL_18;
  }
  if (!v10)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v32 = MEMORY[0x1E0C81028];
    v33 = "Assertion failed: line != nullptr";
    goto LABEL_17;
  }
  if (!objc_msgSend(v11, "count"))
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v32 = MEMORY[0x1E0C81028];
    v33 = "Assertion failed: stops.count != 0";
    goto LABEL_17;
  }
  if (!v12)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v32 = MEMORY[0x1E0C81028];
    v33 = "Assertion failed: custodian != nullptr";
    goto LABEL_17;
  }
  if (!objc_msgSend(v11, "count"))
  {
LABEL_18:
    v13 = 0;
    goto LABEL_19;
  }
  v13 = objc_alloc_init(GEOTransitRouteBuilderOutput);
  GEOGetGEORouteBuilderLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_INFO, "generating output for geometry-only route", buf, 2u);
  }

  v15 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[GEOPDTransitTripGeometry _readTripLinks]((uint64_t)v9);
  v35 = (void *)objc_msgSend(v15, "initWithCapacity:", objc_msgSend(v9[6], "count") + 1);
  +[GEOTransitRouteBuilder _buildPointDataForGeometry:andCreatePointStarts:](GEOTransitRouteBuilder, "_buildPointDataForGeometry:andCreatePointStarts:", v9);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = [GEOComposedRouteCoordinateArray alloc];
  v38[0] = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[GEOComposedRouteCoordinateArray initWithPointData:lengthMarkers:usesZilch:](v16, "initWithPointData:lengthMarkers:usesZilch:", v17, 0, 1);

  -[GEORouteBuilderOutput setCoordinatesArray:](v13, "setCoordinatesArray:", v18);
  +[GEOTransitRouteBuilder _buildStepsForGeometry:andPointStarts:andStopCount:andLine:andCustodian:](GEOTransitRouteBuilder, "_buildStepsForGeometry:andPointStarts:andStopCount:andLine:andCustodian:", v9, v35, objc_msgSend(v11, "count"), v10, v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORouteBuilderOutput setSteps:](v13, "setSteps:", v19);

  -[GEORouteBuilderOutput steps](v13, "steps");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOTransitRouteBuilder _buildSegmentsForGeometry:andStepCount:andPointCount:andCustodian:](GEOTransitRouteBuilder, "_buildSegmentsForGeometry:andStepCount:andPointCount:andCustodian:", v9, objc_msgSend(v20, "count"), -[GEOComposedRouteCoordinateArray coordinateCount](v18, "coordinateCount"), v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORouteBuilderOutput setSegments:](v13, "setSegments:", v21);

  -[GEORouteBuilderOutput steps](v13, "steps");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORouteBuilderOutput segments](v13, "segments");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lineColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOTransitRouteBuilder _buildPointSectionsFromSteps:andSegments:coordinates:andTransitLineColor:](GEOTransitRouteBuilder, "_buildPointSectionsFromSteps:andSegments:coordinates:andTransitLineColor:", v22, v23, v18, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORouteBuilderOutput setPointSections:](v13, "setPointSections:", v25);

  -[GEORouteBuilderOutput steps](v13, "steps");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORouteBuilderOutput segments](v13, "segments");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOTransitRouteBuilder _buildLegsFromSteps:segments:andCoordinates:andCustodian:](GEOTransitRouteBuilder, "_buildLegsFromSteps:segments:andCoordinates:andCustodian:", v26, v27, v18, v12);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORouteBuilderOutput setLegs:](v13, "setLegs:", v28);

  -[GEORouteBuilderOutput legs](v13, "legs");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOTransitRouteBuilder _totalDistanceForLegs:](GEOTransitRouteBuilder, "_totalDistanceForLegs:", v29);
  -[GEORouteBuilderOutput setDistance:](v13, "setDistance:");

  -[GEORouteBuilderOutput pointSections](v13, "pointSections");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEORouteBuilder buildMapRegionFromPointSections:](GEORouteBuilder, "buildMapRegionFromPointSections:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORouteBuilderOutput setBoundingMapRegion:](v13, "setBoundingMapRegion:", v31);

LABEL_19:
  return v13;
}

+ (id)_buildPointDataForGeometry:(id)a3 andCreatePointStarts:(id)a4
{
  id *v5;
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  NSObject *v18;
  const char *v19;
  uint8_t *v20;
  id v21;
  uint8_t buf[2];
  __int16 v23;

  v5 = (id *)a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
LABEL_17:
      v21 = 0;
      goto LABEL_13;
    }
    v23 = 0;
    v18 = MEMORY[0x1E0C81028];
    v19 = "Assertion failed: geometry != nullptr";
    v20 = (uint8_t *)&v23;
LABEL_19:
    _os_log_fault_impl(&dword_1885A9000, v18, OS_LOG_TYPE_FAULT, v19, v20, 2u);
    goto LABEL_17;
  }
  if (!v6)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v18 = MEMORY[0x1E0C81028];
    v19 = "Assertion failed: pointStarts != nullptr";
    v20 = buf;
    goto LABEL_19;
  }
  v21 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v8 = 0;
  for (i = 0; ; ++i)
  {
    -[GEOPDTransitTripGeometry _readTripLinks]((uint64_t)v5);
    if (i >= objc_msgSend(v5[6], "count"))
      break;
    -[GEOPDTransitTripGeometry tripLinks](v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", i);
    v11 = objc_claimAutoreleasedReturnValue();

    if (v11 && *(_QWORD *)(v11 + 16))
    {
      -[GEOPDTripLink linkGeometry]((id *)v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[GEOPointUtility unpackPoints:usesZilch:](GEOPointUtility, "unpackPoints:usesZilch:", v12, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = +[GEOPointUtility pointCount:usesZilch:](GEOPointUtility, "pointCount:usesZilch:", v13, 1);
      if (v14)
        objc_msgSend(v21, "appendData:", v13);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:atIndexedSubscript:", v15, i);

      v8 += v14;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:atIndexedSubscript:", v13, i);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDTransitTripGeometry _readTripLinks]((uint64_t)v5);
  objc_msgSend(v7, "setObject:atIndexedSubscript:", v16, objc_msgSend(v5[6], "count"));

LABEL_13:
  return v21;
}

+ (id)_buildStepsForGeometry:(id)a3 andPointStarts:(id)a4 andStopCount:(unint64_t)a5 andLine:(id)a6 andCustodian:(id)a7
{
  id *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  unint64_t v16;
  void *v17;
  unsigned int v18;
  unsigned int v19;
  int v20;
  int v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  GEOComposedTransitTripRouteStep *v26;
  GEOComposedTransitTripRouteStep *v27;
  GEOComposedTransitTripRouteStep *v28;
  NSObject *v29;
  const char *v30;
  uint8_t *v31;
  uint64_t v33;
  id v35;
  id v36;
  void *v37;
  uint8_t buf[2];
  __int16 v39;

  v10 = (id *)a3;
  v11 = a4;
  v36 = a6;
  v35 = a7;
  v37 = v11;
  if (!v10)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
LABEL_25:
      v15 = 0;
      goto LABEL_26;
    }
    v39 = 0;
    v29 = MEMORY[0x1E0C81028];
    v30 = "Assertion failed: geometry != nullptr";
    v31 = (uint8_t *)&v39;
LABEL_28:
    _os_log_fault_impl(&dword_1885A9000, v29, OS_LOG_TYPE_FAULT, v30, v31, 2u);
    goto LABEL_25;
  }
  if (!objc_msgSend(v11, "count"))
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_25;
    *(_WORD *)buf = 0;
    v29 = MEMORY[0x1E0C81028];
    v30 = "Assertion failed: pointStarts.count > 0";
    v31 = buf;
    goto LABEL_28;
  }
  if (!objc_msgSend(v11, "count"))
    goto LABEL_25;
  objc_msgSend(v11, "lastObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unsignedLongValue");

  if (!v13)
    goto LABEL_25;
  v33 = v13;
  v14 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[GEOPDTransitTripGeometry _readTripLinks]((uint64_t)v10);
  v15 = (void *)objc_msgSend(v14, "initWithCapacity:", objc_msgSend(v10[6], "count"));
  v16 = 0;
  v17 = v15;
  while (1)
  {
    -[GEOPDTransitTripGeometry _readTripStepIndexs]((uint64_t)v10);
    if (v16 >= (unint64_t)v10[4])
      break;
    v18 = -[GEOPDTransitTripGeometry tripStepIndexAtIndex:]((uint64_t)v10, v16);
    -[GEOPDTransitTripGeometry _readTripStepIndexs]((uint64_t)v10);
    if ((_BYTE *)v16 == (char *)v10[4] - 1)
    {
      -[GEOPDTransitTripGeometry _readTripLinks]((uint64_t)v10);
      v19 = objc_msgSend(v10[6], "count");
    }
    else
    {
      v19 = -[GEOPDTransitTripGeometry tripStepIndexAtIndex:]((uint64_t)v10, v16 + 1);
    }
    if (v16)
      v20 = 4;
    else
      v20 = 3;
    if (v16)
      v21 = 1;
    else
      v21 = 5;
    objc_msgSend(v37, "objectAtIndexedSubscript:", v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "unsignedIntegerValue");

    objc_msgSend(v37, "objectAtIndexedSubscript:", v19);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "unsignedIntegerValue");

    v26 = -[GEOComposedTransitTripRouteStep initWithComposedRoute:routeSegmentType:stepIndex:pointRange:line:maneuverType:significance:]([GEOComposedTransitTripRouteStep alloc], "initWithComposedRoute:routeSegmentType:stepIndex:pointRange:line:maneuverType:significance:", v35, 6, v16, v23, v25 - v23, v36, __PAIR64__(v21, v20));
    v15 = v17;
    if (v26)
      objc_msgSend(v17, "addObject:", v26);

    ++v16;
  }
  if (!objc_msgSend(v15, "count"))
  {
    v27 = -[GEOComposedTransitTripRouteStep initWithComposedRoute:routeSegmentType:stepIndex:pointRange:line:maneuverType:significance:]([GEOComposedTransitTripRouteStep alloc], "initWithComposedRoute:routeSegmentType:stepIndex:pointRange:line:maneuverType:significance:", v35, 6, 0, 0, v33 - 1, v36, 0x500000003);
    objc_msgSend(v15, "addObject:", v27);

  }
  v28 = -[GEOComposedTransitTripRouteStep initWithComposedRoute:routeSegmentType:stepIndex:pointRange:line:maneuverType:significance:]([GEOComposedTransitTripRouteStep alloc], "initWithComposedRoute:routeSegmentType:stepIndex:pointRange:line:maneuverType:significance:", v35, 6, a5 - 1, v33 - 1, 1, v36, 0x500000005);
  objc_msgSend(v15, "addObject:", v28);

LABEL_26:
  return v15;
}

+ (id)_buildSegmentsForGeometry:(id)a3 andStepCount:(unint64_t)a4 andPointCount:(unint64_t)a5 andCustodian:(id)a6
{
  id *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  GEOComposedTransitTripRouteSegment *v14;
  NSObject *v16;
  const char *v17;
  uint8_t *v18;
  uint8_t buf[2];
  __int16 v20;
  __int16 v21;
  __int16 v22;

  v9 = (id *)a3;
  v10 = a6;
  v11 = v10;
  if (!v9)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_16;
    v22 = 0;
    v16 = MEMORY[0x1E0C81028];
    v17 = "Assertion failed: geometry != nullptr";
    v18 = (uint8_t *)&v22;
LABEL_15:
    _os_log_fault_impl(&dword_1885A9000, v16, OS_LOG_TYPE_FAULT, v17, v18, 2u);
    goto LABEL_16;
  }
  if (!a4)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_16;
    v21 = 0;
    v16 = MEMORY[0x1E0C81028];
    v17 = "Assertion failed: stepCount > 0";
    v18 = (uint8_t *)&v21;
    goto LABEL_15;
  }
  if (!a5)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_16;
    v20 = 0;
    v16 = MEMORY[0x1E0C81028];
    v17 = "Assertion failed: pointCount > 0";
    v18 = (uint8_t *)&v20;
    goto LABEL_15;
  }
  if (!v10)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v16 = MEMORY[0x1E0C81028];
      v17 = "Assertion failed: custodian != nullptr";
      v18 = buf;
      goto LABEL_15;
    }
LABEL_16:
    v13 = 0;
    goto LABEL_6;
  }
  v12 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[GEOPDTransitTripGeometry _readTripLinks]((uint64_t)v9);
  v13 = (void *)objc_msgSend(v12, "initWithCapacity:", objc_msgSend(v9[6], "count"));
  v14 = -[GEOComposedTransitBaseRouteSegment initWithComposedRoute:stepRange:transitStepRange:pointRange:segmentIndex:]([GEOComposedTransitTripRouteSegment alloc], "initWithComposedRoute:stepRange:transitStepRange:pointRange:segmentIndex:", v11, 0, a4, 0, a4, 0, a5, 0);
  objc_msgSend(v13, "addObject:", v14);

LABEL_6:
  return v13;
}

+ (id)_buildPointSectionsFromSteps:(id)a3 andSegments:(id)a4 coordinates:(id)a5 andTransitLineColor:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  unint64_t v15;
  double v16;
  void *v17;
  double v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if ((unint64_t)objc_msgSend(v11, "coordinateCount") >= 2)
  {
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15 = 0;
    v16 = 0.0;
    while (v15 < objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "objectAtIndex:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[GEOTransitRouteBuilder _buildPointSectionsInCollection:pointRange:stepIndex:transitLineColor:startDistance:andCoordinates:fromSteps:andSegments:](GEOTransitRouteBuilder, "_buildPointSectionsInCollection:pointRange:stepIndex:transitLineColor:startDistance:andCoordinates:fromSteps:andSegments:", v13, objc_msgSend(v17, "startPointIndex"), objc_msgSend(v17, "endPointIndex") - objc_msgSend(v17, "startPointIndex") + 1, v15, v12, v11, v16, v9, v10);
      v16 = v16 + v18;

      ++v15;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (double)_buildPointSectionsInCollection:(id)a3 pointRange:(_NSRange)a4 stepIndex:(unint64_t)a5 transitLineColor:(id)a6 startDistance:(double)a7 andCoordinates:(id)a8 fromSteps:(id)a9 andSegments:(id)a10
{
  NSUInteger length;
  NSUInteger location;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t i;
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
  double v39;
  double v40;
  GEOComposedRouteTransitTripSection *v41;
  void *v42;
  GEOComposedRouteTransitTripSection *v43;
  uint64_t v45;

  length = a4.length;
  location = a4.location;
  v16 = a3;
  v17 = a6;
  v18 = a8;
  v19 = a9;
  v20 = a10;
  if (length >= 2)
  {
    objc_msgSend(v18, "coordinateOnRouteAt:", location);
    v23 = GEOTilePointForCoordinate(v21, v22, 20.0);
    v25 = v24;
    v26 = 0.0;
    for (i = 1; i != length; ++i)
    {
      objc_msgSend(v18, "coordinateOnRouteAt:", location + i);
      v30 = GEOTilePointForCoordinate(v28, v29, 20.0);
      v32 = v31;
      v26 = v26 + GEOMetersBetweenMapPoints(v23, v25, v30, v31);
      v23 = v30;
      v25 = v32;
    }
    objc_msgSend(v18, "coordinateOnRouteAt:", location);
    v34 = v33;
    v36 = v35;
    objc_msgSend(v18, "coordinateOnRouteAt:", length - 1);
    v38 = v37;
    v40 = v39;
    v41 = [GEOComposedRouteTransitTripSection alloc];
    +[GEORouteBuilder segmentForPointIndex:withSegments:andSteps:](GEORouteBuilder, "segmentForPointIndex:withSegments:andSteps:", location, v20, v19);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v45) = 1;
    v43 = -[GEOComposedRouteTransitTripSection initWithCoordinates:segment:segmentIndex:steps:startCoordinateIndex:coordinateCount:stepIndex:toNodeSignificance:transitLineColor:startDistance:lengthScaleFactor:fallbackStartCoordinate:fallbackEndCoordinate:](v41, "initWithCoordinates:segment:segmentIndex:steps:startCoordinateIndex:coordinateCount:stepIndex:toNodeSignificance:transitLineColor:startDistance:lengthScaleFactor:fallbackStartCoordinate:fallbackEndCoordinate:", v18, v42, +[GEORouteBuilder segmentIndexForPointIndex:withSegments:](GEORouteBuilder, "segmentIndexForPointIndex:withSegments:", location, v20), v19, location, length, a7, 1.0, v34, v36, v38, v40,
            a5,
            v45,
            v17);

    objc_msgSend(v16, "addObject:", v43);
    a7 = v26 + a7;

  }
  return a7;
}

+ (id)_buildLegsFromSteps:(id)a3 segments:(id)a4 andCoordinates:(id)a5 andCustodian:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t i;
  double v19;
  double v20;
  double v21;
  GEOLocation *v22;
  GEOComposedWaypoint *v23;
  double v24;
  double v25;
  GEOLocation *v26;
  GEOComposedWaypoint *v27;
  GEOComposedRouteLeg *v28;
  NSObject *v29;
  const char *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[16];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (!objc_msgSend(v9, "count"))
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_26;
    *(_WORD *)buf = 0;
    v29 = MEMORY[0x1E0C81028];
    v30 = "Assertion failed: steps.count != 0";
LABEL_25:
    _os_log_fault_impl(&dword_1885A9000, v29, OS_LOG_TYPE_FAULT, v30, buf, 2u);
    goto LABEL_26;
  }
  if (!v11)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_26;
    *(_WORD *)buf = 0;
    v29 = MEMORY[0x1E0C81028];
    v30 = "Assertion failed: coordinates != nullptr";
    goto LABEL_25;
  }
  if (!objc_msgSend(v11, "coordinateCount"))
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_26;
    *(_WORD *)buf = 0;
    v29 = MEMORY[0x1E0C81028];
    v30 = "Assertion failed: coordinates.coordinateCount != 0";
    goto LABEL_25;
  }
  if (!v12)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v29 = MEMORY[0x1E0C81028];
      v30 = "Assertion failed: custodian != nullptr";
      goto LABEL_25;
    }
LABEL_26:
    v13 = 0;
    goto LABEL_27;
  }
  if (!objc_msgSend(v9, "count") || !objc_msgSend(v11, "coordinateCount"))
    goto LABEL_26;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v14 = v9;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v33;
    v17 = 0.0;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v33 != v16)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "distance", (_QWORD)v32);
        v17 = v17 + v19;
      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v15);
  }
  else
  {
    v17 = 0.0;
  }

  objc_msgSend(v11, "coordinateOnRouteAt:", 0);
  v22 = -[GEOLocation initWithLatitude:longitude:]([GEOLocation alloc], "initWithLatitude:longitude:", v20, v21);
  v23 = -[GEOComposedWaypoint initWithLocation:isCurrentLocation:]([GEOComposedWaypoint alloc], "initWithLocation:isCurrentLocation:", v22, 0);
  objc_msgSend(v11, "coordinateOnRouteAt:", objc_msgSend(v11, "coordinateCount") - 1);
  v26 = -[GEOLocation initWithLatitude:longitude:]([GEOLocation alloc], "initWithLatitude:longitude:", v24, v25);

  v27 = -[GEOComposedWaypoint initWithLocation:isCurrentLocation:]([GEOComposedWaypoint alloc], "initWithLocation:isCurrentLocation:", v26, 0);
  v28 = -[GEOComposedRouteLeg initWithComposedRoute:legIndex:origin:destination:arrivalParameters:]([GEOComposedRouteLeg alloc], "initWithComposedRoute:legIndex:origin:destination:arrivalParameters:", v12, 0, v23, v27, 0);
  -[GEOComposedRouteLeg setPointRange:](v28, "setPointRange:", 0, objc_msgSend(v11, "coordinateCount"));
  -[GEOComposedRouteLeg setStepRange:](v28, "setStepRange:", 0, objc_msgSend(v14, "count"));
  -[GEOComposedRouteLeg setSegmentRange:](v28, "setSegmentRange:", 0, objc_msgSend(v10, "count"));
  -[GEOComposedRouteLeg setDistance:](v28, "setDistance:", v17);
  objc_msgSend(v13, "addObject:", v28);

LABEL_27:
  return v13;
}

@end
