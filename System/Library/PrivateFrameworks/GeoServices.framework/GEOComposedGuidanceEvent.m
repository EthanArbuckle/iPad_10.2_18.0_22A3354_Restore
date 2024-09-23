@implementation GEOComposedGuidanceEvent

- (GEOComposedGuidanceEvent)initWithGeoGuidanceEvent:(id)a3 step:(id)a4 legIndex:(unint64_t)a5 coordinates:(id)a6
{
  id v11;
  id v12;
  id v13;
  GEOComposedGuidanceEvent *v14;
  NSUUID *v15;
  NSUUID *uniqueID;
  id *p_guidanceEvent;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSData *serverRouteID;
  void *v23;
  uint64_t v24;
  NSString *roadName;
  double v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int v29;
  uint64_t v30;
  double v31;
  double v32;
  $604ECB7A8067A7300F159AE8ED6889F8 startValidRouteCoordinate;
  uint64_t v34;
  $604ECB7A8067A7300F159AE8ED6889F8 endValidRouteCoordinate;
  $604ECB7A8067A7300F159AE8ED6889F8 v36;
  $604ECB7A8067A7300F159AE8ED6889F8 v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  GEOJunction *v45;
  int v46;
  GEOJunction *v47;
  GEOJunction *v48;
  void *maneuverJunction;
  uint64_t v50;
  GEOJunction *v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  uint64_t v56;
  GEOTransitArtworkDataSource *artworkOverride;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  NSArray *primarySignStrings;
  void *v63;
  void *v64;
  uint64_t v65;
  NSArray *secondarySignStrings;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  NSArray *spokenStrings;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  NSArray *primaryLaneStrings;
  void *v77;
  void *v78;
  uint64_t v79;
  NSArray *secondaryLaneStrings;
  void *v81;
  GEOComposedString *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  GEOComposedString *navTrayTitleString;
  GEOComposedString *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  GEOComposedString *navTrayDetailString;
  void *v92;
  GEOComposedString *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  GEOComposedString *arInstructionString;
  GEOComposedGuidanceEvent *v98;
  objc_super v100;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v100.receiver = self;
  v100.super_class = (Class)GEOComposedGuidanceEvent;
  v14 = -[GEOComposedGuidanceEvent init](&v100, sel_init);
  if (!v14)
    goto LABEL_58;
  v15 = (NSUUID *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
  uniqueID = v14->_uniqueID;
  v14->_uniqueID = v15;

  v14->_creationOrder = ++initWithGeoGuidanceEvent_step_legIndex_coordinates__count;
  p_guidanceEvent = (id *)&v14->_guidanceEvent;
  objc_storeStrong((id *)&v14->_guidanceEvent, a3);
  if (v12)
    v18 = objc_msgSend(v12, "stepIndex");
  else
    v18 = 0x7FFFFFFFFFFFFFFFLL;
  v14->_stepIndex = v18;
  v14->_legIndex = a5;
  objc_msgSend(v12, "composedRoute");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "serverRouteID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "copy");
  serverRouteID = v14->_serverRouteID;
  v14->_serverRouteID = (NSData *)v21;

  v14->_stepID = objc_msgSend(v12, "stepID");
  v14->_transportType = objc_msgSend(v12, "transportType");
  objc_msgSend(v12, "maneuverRoadName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "copy");
  roadName = v14->_roadName;
  v14->_roadName = (NSString *)v24;

  objc_msgSend(v12, "distance");
  v14->_distance = v26;
  *(int64x2_t *)&v14->_sourceIndex = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  if (-[GEOGuidanceEvent hasStartValidDistanceOffsetCm](v14->_guidanceEvent, "hasStartValidDistanceOffsetCm"))
  {
    v27 = objc_msgSend(v13, "routeIndexForLocalIndex:onPath:", 0, v14->_legIndex);
    v14->_startValidRouteCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)objc_msgSend(v13, "routeCoordinateForDistance:afterRouteCoordinate:", v27, (float)-[GEOGuidanceEvent startValidDistanceOffsetCm](v14->_guidanceEvent, "startValidDistanceOffsetCm")* 0.01);
    v14->_endValidRouteCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)objc_msgSend(v13, "routeCoordinateForDistance:afterRouteCoordinate:", v27, (float)-[GEOGuidanceEvent endValidDistanceOffsetCm](v14->_guidanceEvent, "endValidDistanceOffsetCm")* 0.01);
    if (-[GEOGuidanceEvent distanceReferenceEndpointOffsetCm](v14->_guidanceEvent, "distanceReferenceEndpointOffsetCm"))
      v28 = objc_msgSend(v13, "routeCoordinateForDistance:afterRouteCoordinate:", v27, (float)-[GEOGuidanceEvent distanceReferenceEndpointOffsetCm](v14->_guidanceEvent, "distanceReferenceEndpointOffsetCm")* 0.01);
    else
      v28 = objc_msgSend(v12, "endRouteCoordinate");
    v14->_coordinateForDistanceStrings = ($604ECB7A8067A7300F159AE8ED6889F8)v28;
    if (!v12)
      goto LABEL_30;
LABEL_18:
    if ((objc_msgSend(*p_guidanceEvent, "hasJunctionView") & 1) != 0
      || -[GEOComposedGuidanceEvent isSpecial](v14, "isSpecial"))
    {
      goto LABEL_30;
    }
    v30 = objc_msgSend(v12, "startRouteCoordinate");
    startValidRouteCoordinate = v14->_startValidRouteCoordinate;
    if (startValidRouteCoordinate.index == (_DWORD)v30)
    {
      LODWORD(v31) = HIDWORD(v30);
      LODWORD(v32) = HIDWORD(*(_QWORD *)&v14->_startValidRouteCoordinate);
      if (startValidRouteCoordinate.offset >= *((float *)&v30 + 1))
      {
LABEL_25:
        v34 = objc_msgSend(v12, "endRouteCoordinate", v31, v32);
        endValidRouteCoordinate = v14->_endValidRouteCoordinate;
        if ((_DWORD)v34 == endValidRouteCoordinate.index)
        {
          if (*((float *)&v34 + 1) >= endValidRouteCoordinate.offset)
            goto LABEL_30;
        }
        else if (v34 >= endValidRouteCoordinate.index)
        {
          goto LABEL_30;
        }
        v14->_endValidRouteCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)objc_msgSend(v12, "endRouteCoordinate");
        goto LABEL_30;
      }
    }
    else if (startValidRouteCoordinate.index >= v30)
    {
      goto LABEL_25;
    }
    v14->_startValidRouteCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)objc_msgSend(v12, "startRouteCoordinate", v31, v32);
    goto LABEL_25;
  }
  if (objc_msgSend(*p_guidanceEvent, "hasDistanceZilchIndex") && v14->_legIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    v29 = objc_msgSend(v13, "routeIndexForLocalIndex:onPath:", -[GEOGuidanceEvent distanceZilchIndex](v14->_guidanceEvent, "distanceZilchIndex"), v14->_legIndex);
  }
  else if (v12)
  {
    v29 = objc_msgSend(v12, "maneuverStartPointIndex");
  }
  else
  {
    v29 = 0;
  }
  v14->_coordinateForDistanceStrings = ($604ECB7A8067A7300F159AE8ED6889F8)objc_msgSend(v13, "routeCoordinateForDistance:beforeRouteCoordinate:", v29, (double)-[GEOGuidanceEvent offsetForDistanceString](v14->_guidanceEvent, "offsetForDistanceString"));
  v14->_startValidRouteCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)objc_msgSend(v13, "routeCoordinateForDistance:beforeRouteCoordinate:", v29, (double)-[GEOGuidanceEvent startValidDistance](v14->_guidanceEvent, "startValidDistance"));
  v14->_endValidRouteCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)objc_msgSend(v13, "routeCoordinateForDistance:beforeRouteCoordinate:", v29, (double)-[GEOGuidanceEvent endValidDistance](v14->_guidanceEvent, "endValidDistance"));
  if (v12)
    goto LABEL_18;
LABEL_30:
  v37 = v14->_startValidRouteCoordinate;
  v36 = v14->_endValidRouteCoordinate;
  if (v36.index != v37.index)
  {
    if (v36.index >= v37.index)
      goto LABEL_35;
    goto LABEL_34;
  }
  if (v36.offset < v37.offset)
LABEL_34:
    v14->_startValidRouteCoordinate = v36;
LABEL_35:
  objc_msgSend(v13, "distanceToEndFromRouteCoordinate:", *(_QWORD *)&v14->_coordinateForDistanceStrings);
  v14->_distanceForStrings = v38;
  objc_msgSend(v13, "distanceToEndFromRouteCoordinate:", *(_QWORD *)&v14->_startValidRouteCoordinate);
  v14->_startValidDistance = v39;
  objc_msgSend(v13, "distanceToEndFromRouteCoordinate:", *(_QWORD *)&v14->_endValidRouteCoordinate);
  v14->_endValidDistance = v40;
  -[GEOGuidanceEvent signGuidance](v14->_guidanceEvent, "signGuidance");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v41, "secondarySignsCount"))
  {
    objc_msgSend(v12, "getNextStep");
    v42 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v42 = v12;
  }
  v43 = v42;

  objc_msgSend(*p_guidanceEvent, "signGuidance");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v44, "hasManeuverArrowOverride"))
  {
    v45 = -[GEOJunction initWithManeuverType:drivingSide:]([GEOJunction alloc], "initWithManeuverType:drivingSide:", objc_msgSend(v44, "maneuverArrowOverride"), objc_msgSend(v43, "drivingSide"));
LABEL_43:
    maneuverJunction = v14->_maneuverJunction;
    v14->_maneuverJunction = v45;
    goto LABEL_44;
  }
  v46 = objc_msgSend(v44, "hasJunctionInfo");
  v47 = [GEOJunction alloc];
  v48 = v47;
  if (!v46)
  {
    v45 = -[GEOJunction initWithStep:](v47, "initWithStep:", v43);
    goto LABEL_43;
  }
  objc_msgSend(v44, "junctionInfo");
  maneuverJunction = (void *)objc_claimAutoreleasedReturnValue();
  v50 = -[GEOJunction initWithJunctionInfo:](v48, "initWithJunctionInfo:", maneuverJunction);
  v51 = v14->_maneuverJunction;
  v14->_maneuverJunction = (GEOJunction *)v50;

LABEL_44:
  objc_msgSend(*p_guidanceEvent, "signGuidance");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "hasManeuverArrowOverride");

  if (v53)
  {
    -[GEOGuidanceEvent signGuidance](v14->_guidanceEvent, "signGuidance");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v14->_maneuverType = objc_msgSend(v54, "maneuverArrowOverride");

  }
  else
  {
    v14->_maneuverType = objc_msgSend(v43, "maneuverType");
  }
  objc_msgSend(v11, "signGuidance");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "artworkOverride");
  v56 = objc_claimAutoreleasedReturnValue();
  artworkOverride = v14->_artworkOverride;
  v14->_artworkOverride = (GEOTransitArtworkDataSource *)v56;

  objc_msgSend(v11, "signGuidance");
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (v58)
  {
    objc_msgSend(v11, "signGuidance");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "signTitles");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "_geo_map:", &__block_literal_global_72);
    v61 = objc_claimAutoreleasedReturnValue();
    primarySignStrings = v14->_primarySignStrings;
    v14->_primarySignStrings = (NSArray *)v61;

    objc_msgSend(v11, "signGuidance");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "signDetails");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "_geo_map:", &__block_literal_global_3_0);
    v65 = objc_claimAutoreleasedReturnValue();
    secondarySignStrings = v14->_secondarySignStrings;
    v14->_secondarySignStrings = (NSArray *)v65;

  }
  objc_msgSend(v11, "spokenGuidance");
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  if (v67)
  {
    objc_msgSend(v11, "spokenGuidance");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "announcements");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "_geo_map:", &__block_literal_global_4_0);
    v70 = objc_claimAutoreleasedReturnValue();
    spokenStrings = v14->_spokenStrings;
    v14->_spokenStrings = (NSArray *)v70;

  }
  objc_msgSend(v11, "laneGuidance");
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  if (v72)
  {
    objc_msgSend(v11, "laneGuidance");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "titles");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "_geo_map:", &__block_literal_global_5);
    v75 = objc_claimAutoreleasedReturnValue();
    primaryLaneStrings = v14->_primaryLaneStrings;
    v14->_primaryLaneStrings = (NSArray *)v75;

    objc_msgSend(v11, "laneGuidance");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "instructions");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "_geo_map:", &__block_literal_global_6_1);
    v79 = objc_claimAutoreleasedReturnValue();
    secondaryLaneStrings = v14->_secondaryLaneStrings;
    v14->_secondaryLaneStrings = (NSArray *)v79;

  }
  objc_msgSend(v11, "navTrayGuidance");
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  if (v81)
  {
    v82 = [GEOComposedString alloc];
    objc_msgSend(v11, "navTrayGuidance");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "title");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = -[GEOComposedString initWithGeoFormattedString:](v82, "initWithGeoFormattedString:", v84);
    navTrayTitleString = v14->_navTrayTitleString;
    v14->_navTrayTitleString = (GEOComposedString *)v85;

    v87 = [GEOComposedString alloc];
    objc_msgSend(v11, "navTrayGuidance");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "detail");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = -[GEOComposedString initWithGeoFormattedString:](v87, "initWithGeoFormattedString:", v89);
    navTrayDetailString = v14->_navTrayDetailString;
    v14->_navTrayDetailString = (GEOComposedString *)v90;

  }
  objc_msgSend(v11, "arGuidance");
  v92 = (void *)objc_claimAutoreleasedReturnValue();

  if (v92)
  {
    v93 = [GEOComposedString alloc];
    objc_msgSend(v11, "arGuidance");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "instruction");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = -[GEOComposedString initWithGeoFormattedString:](v93, "initWithGeoFormattedString:", v95);
    arInstructionString = v14->_arInstructionString;
    v14->_arInstructionString = (GEOComposedString *)v96;

  }
  v14->_drivingSide = objc_msgSend(v43, "drivingSide");
  v98 = v14;

LABEL_58:
  return v14;
}

GEOComposedString *__79__GEOComposedGuidanceEvent_initWithGeoGuidanceEvent_step_legIndex_coordinates___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  GEOComposedString *v3;

  v2 = a2;
  v3 = -[GEOComposedString initWithGeoFormattedString:]([GEOComposedString alloc], "initWithGeoFormattedString:", v2);

  return v3;
}

GEOComposedString *__79__GEOComposedGuidanceEvent_initWithGeoGuidanceEvent_step_legIndex_coordinates___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  GEOComposedString *v3;

  v2 = a2;
  v3 = -[GEOComposedString initWithGeoFormattedString:]([GEOComposedString alloc], "initWithGeoFormattedString:", v2);

  return v3;
}

GEOComposedString *__79__GEOComposedGuidanceEvent_initWithGeoGuidanceEvent_step_legIndex_coordinates___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  GEOComposedString *v3;

  v2 = a2;
  v3 = -[GEOComposedString initWithGeoFormattedString:]([GEOComposedString alloc], "initWithGeoFormattedString:", v2);

  return v3;
}

GEOComposedString *__79__GEOComposedGuidanceEvent_initWithGeoGuidanceEvent_step_legIndex_coordinates___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  GEOComposedString *v3;

  v2 = a2;
  v3 = -[GEOComposedString initWithGeoFormattedString:]([GEOComposedString alloc], "initWithGeoFormattedString:", v2);

  return v3;
}

GEOComposedString *__79__GEOComposedGuidanceEvent_initWithGeoGuidanceEvent_step_legIndex_coordinates___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  GEOComposedString *v3;

  v2 = a2;
  v3 = -[GEOComposedString initWithGeoFormattedString:]([GEOComposedString alloc], "initWithGeoFormattedString:", v2);

  return v3;
}

- (unint64_t)_junctionViewIDForData:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v7;

  v3 = a3;
  v7 = 0;
  if ((unint64_t)objc_msgSend(v3, "length") <= 8)
    v4 = objc_msgSend(v3, "length");
  else
    v4 = 8;
  objc_msgSend(v3, "getBytes:length:", &v7, v4);
  v5 = v7;

  return v5;
}

- (BOOL)hasSignGuidance
{
  return -[GEOGuidanceEvent hasSignGuidance](self->_guidanceEvent, "hasSignGuidance");
}

- (BOOL)hasSpokenGuidance
{
  return -[GEOGuidanceEvent hasSpokenGuidance](self->_guidanceEvent, "hasSpokenGuidance");
}

- (BOOL)hasJunctionView
{
  return -[GEOGuidanceEvent hasJunctionView](self->_guidanceEvent, "hasJunctionView");
}

- (BOOL)hasArGuidance
{
  return -[GEOGuidanceEvent hasArGuidance](self->_guidanceEvent, "hasArGuidance");
}

- (unint64_t)stackRanking
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;

  -[GEOGuidanceEvent signGuidance](self->_guidanceEvent, "signGuidance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasStackRanking");

  -[GEOGuidanceEvent signGuidance](self->_guidanceEvent, "signGuidance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    v7 = objc_msgSend(v5, "stackRanking");

  }
  else
  {
    v8 = objc_msgSend(v5, "secondarySignsCount");

    if (v8)
      return 3;
    else
      return 2;
  }
  return v7;
}

- (NSArray)signTitles
{
  void *v2;
  void *v3;

  -[GEOGuidanceEvent signGuidance](self->_guidanceEvent, "signGuidance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "signTitles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)signDetails
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  -[GEOGuidanceEvent signGuidance](self->_guidanceEvent, "signGuidance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "signDetails");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[GEOGuidanceEvent signGuidance](self->_guidanceEvent, "signGuidance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "signDetails");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = objc_msgSend(v5, "secondarySignsCount");

    if (!v8)
    {
      v9 = 0;
      return (NSArray *)v9;
    }
    -[GEOGuidanceEvent signGuidance](self->_guidanceEvent, "signGuidance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "secondarySigns");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v7;

  return (NSArray *)v9;
}

- (GEONameInfo)shieldInfo
{
  void *v2;
  void *v3;

  -[GEOGuidanceEvent signGuidance](self->_guidanceEvent, "signGuidance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shieldName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEONameInfo *)v3;
}

- (GEOJunctionView)junctionView
{
  return -[GEOGuidanceEvent junctionView](self->_guidanceEvent, "junctionView");
}

- (NSString)exclusiveSetIdentifier
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[GEOGuidanceEvent hasSpokenGuidance](self->_guidanceEvent, "hasSpokenGuidance")
    && (-[GEOGuidanceEvent spokenGuidance](self->_guidanceEvent, "spokenGuidance"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "hasExclusiveSetIdentifier"),
        v3,
        v4))
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    -[GEOGuidanceEvent spokenGuidance](self->_guidanceEvent, "spokenGuidance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v6, "exclusiveSetIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return (NSString *)v7;
}

- (NSArray)announcements
{
  void *v2;
  void *v3;

  -[GEOGuidanceEvent spokenGuidance](self->_guidanceEvent, "spokenGuidance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "announcements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (double)repetitionInterval
{
  void *v2;
  double v3;

  -[GEOGuidanceEvent spokenGuidance](self->_guidanceEvent, "spokenGuidance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (double)objc_msgSend(v2, "repetitionInterval");

  return v3;
}

- (BOOL)hasHaptics
{
  void *v2;
  char v3;

  -[GEOGuidanceEvent spokenGuidance](self->_guidanceEvent, "spokenGuidance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "tapBeforeAnnouncement");

  return v3;
}

- (BOOL)isSticky
{
  return -[GEOGuidanceEvent sticky](self->_guidanceEvent, "sticky");
}

- (BOOL)isImportant
{
  void *v3;
  unint64_t v4;
  int v5;
  BOOL v6;

  if (!-[GEOGuidanceEvent hasImportanceInfo](self->_guidanceEvent, "hasImportanceInfo"))
    return 0;
  -[GEOGuidanceEvent importanceInfo](self->_guidanceEvent, "importanceInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "guidancePreferenceTypesCount"))
  {
    v4 = 0;
    do
    {
      v5 = objc_msgSend(v3, "guidancePreferenceTypeAtIndex:", v4);
      v6 = v5 == 1;
      if (v5 == 1)
        break;
      ++v4;
    }
    while (v4 < objc_msgSend(v3, "guidancePreferenceTypesCount"));
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isSpecial
{
  unsigned int v2;

  v2 = -[GEOGuidanceEvent eventType](self->_guidanceEvent, "eventType");
  return (v2 < 0xF) & (0x780Eu >> v2);
}

- (NSArray)lanes
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *lanes;

  if (-[GEOGuidanceEvent hasLaneGuidance](self->_guidanceEvent, "hasLaneGuidance") && !self->_lanes)
  {
    -[GEOGuidanceEvent laneGuidance](self->_guidanceEvent, "laneGuidance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "laneInfos");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_geo_map:", &__block_literal_global_10_0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSArray *)objc_msgSend(v5, "copy");
    lanes = self->_lanes;
    self->_lanes = v6;

  }
  return self->_lanes;
}

GEOComposedRouteLaneInfo *__33__GEOComposedGuidanceEvent_lanes__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  GEOComposedRouteLaneInfo *v3;

  v2 = a2;
  v3 = -[GEOComposedRouteLaneInfo initWithLaneInfo:]([GEOComposedRouteLaneInfo alloc], "initWithLaneInfo:", v2);

  return v3;
}

- (NSArray)laneTitles
{
  void *v2;
  void *v3;

  -[GEOGuidanceEvent laneGuidance](self->_guidanceEvent, "laneGuidance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)laneInstructions
{
  void *v2;
  void *v3;

  -[GEOGuidanceEvent laneGuidance](self->_guidanceEvent, "laneGuidance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "instructions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (int)composedGuidanceEventType
{
  return -[GEOGuidanceEvent eventType](self->_guidanceEvent, "eventType");
}

- (BOOL)isLaneGuidanceForManeuver
{
  return -[GEOGuidanceEvent eventType](self->_guidanceEvent, "eventType") == 10;
}

- (unint64_t)numChainedAnnouncements
{
  void *v2;
  unint64_t v3;

  -[GEOGuidanceEvent spokenGuidance](self->_guidanceEvent, "spokenGuidance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numChainedVariants");

  return v3;
}

- (GEOServerFormattedString)arInstruction
{
  void *v2;
  void *v3;

  -[GEOGuidanceEvent arGuidance](self->_guidanceEvent, "arGuidance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "instruction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOServerFormattedString *)v3;
}

- (NSString)arArrowLabel
{
  void *v2;
  void *v3;

  -[GEOGuidanceEvent arGuidance](self->_guidanceEvent, "arGuidance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrowLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int)arType
{
  void *v2;
  int v3;

  -[GEOGuidanceEvent arGuidance](self->_guidanceEvent, "arGuidance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type");

  return v3;
}

- (NSArray)gapRanges
{
  void *v2;
  void *v3;

  -[GEOGuidanceEvent arGuidance](self->_guidanceEvent, "arGuidance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "gapRanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)isValidForSpeed:(double)a3
{
  double v5;
  double v6;
  BOOL result;

  result = 0;
  if (!-[GEOGuidanceEvent hasMinSpeed](self->_guidanceEvent, "hasMinSpeed")
    || (-[GEOGuidanceEvent minSpeed](self->_guidanceEvent, "minSpeed"), v5 < a3))
  {
    if (!-[GEOGuidanceEvent hasMaxSpeed](self->_guidanceEvent, "hasMaxSpeed"))
      return 1;
    -[GEOGuidanceEvent maxSpeed](self->_guidanceEvent, "maxSpeed");
    if (v6 >= a3)
      return 1;
  }
  return result;
}

- (double)startDistanceForSpeed:(double)a3
{
  double startValidDistance;
  void *v6;
  int v7;
  void *v8;
  double v9;

  startValidDistance = self->_startValidDistance;
  -[GEOGuidanceEvent spokenGuidance](self->_guidanceEvent, "spokenGuidance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasStartDesiredTime");

  if (v7)
  {
    -[GEOGuidanceEvent spokenGuidance](self->_guidanceEvent, "spokenGuidance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = self->_endValidDistance + a3 * (double)objc_msgSend(v8, "startDesiredTime");

    if (startValidDistance >= v9)
      return v9;
  }
  return startValidDistance;
}

- (double)endDistanceForSpeed:(double)a3
{
  double endValidDistance;
  void *v6;
  int v7;
  void *v8;
  double v9;

  endValidDistance = self->_endValidDistance;
  -[GEOGuidanceEvent spokenGuidance](self->_guidanceEvent, "spokenGuidance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasEndDesiredTime");

  if (v7)
  {
    -[GEOGuidanceEvent spokenGuidance](self->_guidanceEvent, "spokenGuidance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = self->_endValidDistance + a3 * (double)objc_msgSend(v8, "endDesiredTime");

    if (self->_startValidDistance >= v9)
      return v9;
    else
      return self->_startValidDistance;
  }
  return endValidDistance;
}

- (double)triggerDistanceForSpeed:(double)a3 andDuration:(id)a4
{
  double (**v6)(_QWORD);
  void *v7;
  int v8;
  double v9;
  void *v10;
  int v11;
  double startValidDistance;
  double v13;
  double v14;
  double v15;

  v6 = (double (**)(_QWORD))a4;
  if (!-[GEOComposedGuidanceEvent hasSpokenGuidance](self, "hasSpokenGuidance"))
    goto LABEL_7;
  -[GEOGuidanceEvent spokenGuidance](self->_guidanceEvent, "spokenGuidance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "alignment");

  if (v8 != 3)
  {
    -[GEOGuidanceEvent spokenGuidance](self->_guidanceEvent, "spokenGuidance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "alignment");

    if (v11 == 4)
    {
      startValidDistance = -1.79769313e308;
      goto LABEL_12;
    }
LABEL_7:
    -[GEOComposedGuidanceEvent startDistanceForSpeed:](self, "startDistanceForSpeed:", a3);
    startValidDistance = v13;
    goto LABEL_12;
  }
  if (v6)
    v9 = v6[2](v6) + 1.0;
  else
    v9 = 1.0;
  -[GEOComposedGuidanceEvent endDistanceForSpeed:](self, "endDistanceForSpeed:", a3);
  v15 = v14 + a3 * v9;
  if (self->_startValidDistance >= v15)
    startValidDistance = v15;
  else
    startValidDistance = self->_startValidDistance;
LABEL_12:

  return startValidDistance;
}

- (double)desiredTimeGapToEvent:(id)a3 chained:(BOOL)a4
{
  id *v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  int v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = (id *)a3;
  v7 = 0.0;
  if (-[GEOComposedGuidanceEvent hasSpokenGuidance](self, "hasSpokenGuidance")
    && objc_msgSend(v6, "hasSpokenGuidance"))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[GEOGuidanceEvent spokenGuidance](self->_guidanceEvent, "spokenGuidance", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeGaps");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          v15 = objc_msgSend(v14, "subsequentEventId");
          if (v15 == objc_msgSend(v6[3], "identifier")
            && (a4 || !objc_msgSend(v14, "ifChained")))
          {
            v7 = (double)objc_msgSend(v14, "seconds");
            goto LABEL_15;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_15:

  }
  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[GEOComposedGuidanceEvent uniqueID](self, "uniqueID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[GEOComposedGuidanceEvent uniqueID](self, "uniqueID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)compare:(id)a3
{
  id v4;
  unsigned int index;
  unsigned int v6;
  BOOL v7;
  float offset;
  float v9;
  BOOL v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  float v14;
  float v15;
  int64_t v16;

  v4 = a3;
  index = self->_startValidRouteCoordinate.index;
  v6 = *((_DWORD *)v4 + 38);
  v7 = index >= v6;
  if (index != v6)
    goto LABEL_10;
  offset = self->_startValidRouteCoordinate.offset;
  v9 = *((float *)v4 + 39);
  v10 = offset < v9;
  if (offset != v9)
    goto LABEL_12;
  v11 = *((_QWORD *)v4 + 4);
  if (self->_stepIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_11;
  }
  else if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    goto LABEL_13;
  }
  v12 = self->_endValidRouteCoordinate.index;
  v13 = *((_DWORD *)v4 + 40);
  v7 = v12 >= v13;
  if (v12 != v13)
  {
LABEL_10:
    if (!v7)
      goto LABEL_11;
LABEL_13:
    v16 = 1;
    goto LABEL_14;
  }
  v14 = self->_endValidRouteCoordinate.offset;
  v15 = *((float *)v4 + 41);
  v10 = v14 < v15;
  if (v14 != v15)
  {
LABEL_12:
    if (!v10)
      goto LABEL_13;
LABEL_11:
    v16 = -1;
    goto LABEL_14;
  }
  v16 = 0;
LABEL_14:

  return v16;
}

- (int64_t)compareFactoringInSpeed:(id)a3 speed:(double)a4
{
  id *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  int64_t v22;
  void *v24;
  int v25;
  void *v26;
  int v27;

  v6 = (id *)a3;
  -[GEOComposedGuidanceEvent startDistanceForSpeed:](self, "startDistanceForSpeed:", a4);
  v8 = v7;
  -[GEOComposedGuidanceEvent endDistanceForSpeed:](self, "endDistanceForSpeed:", a4);
  v10 = v9;
  objc_msgSend(v6, "startDistanceForSpeed:", a4);
  v12 = v11;
  objc_msgSend(v6, "endDistanceForSpeed:", a4);
  v14 = v8 <= v12;
  if (v8 == v12 && (v14 = v10 <= v13, v10 == v13))
  {
    -[GEOGuidanceEvent spokenGuidance](self->_guidanceEvent, "spokenGuidance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "hasAlignment") & 1) != 0)
    {
      objc_msgSend(v6[3], "spokenGuidance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "hasAlignment");

      if (v17)
      {
        -[GEOGuidanceEvent spokenGuidance](self->_guidanceEvent, "spokenGuidance");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "alignment");
        objc_msgSend(v6[3], "spokenGuidance");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "alignment");

        if (v19 < v21)
        {
          v22 = -1;
          goto LABEL_14;
        }
        -[GEOGuidanceEvent spokenGuidance](self->_guidanceEvent, "spokenGuidance");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "alignment");
        objc_msgSend(v6[3], "spokenGuidance");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "alignment");

        if (v25 > v27)
        {
          v22 = 1;
          goto LABEL_14;
        }
      }
    }
    else
    {

    }
    if (self->_creationOrder < (unint64_t)v6[2])
      v22 = -1;
    else
      v22 = 1;
  }
  else if (v14)
  {
    v22 = 1;
  }
  else
  {
    v22 = -1;
  }
LABEL_14:

  return v22;
}

- (int64_t)comparePriority:(id)a3
{
  id *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  unsigned int v13;
  void *v14;
  unsigned int v15;
  int64_t v16;

  v4 = (id *)a3;
  -[GEOGuidanceEvent spokenGuidance](self->_guidanceEvent, "spokenGuidance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "hasPriority") & 1) == 0)
  {

LABEL_8:
    v16 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v4[3], "spokenGuidance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasPriority");

  if (!v7)
    goto LABEL_8;
  -[GEOGuidanceEvent spokenGuidance](self->_guidanceEvent, "spokenGuidance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "priority");
  objc_msgSend(v4[3], "spokenGuidance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "priority");

  if (v9 == v11)
    goto LABEL_8;
  -[GEOGuidanceEvent spokenGuidance](self->_guidanceEvent, "spokenGuidance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "priority");
  objc_msgSend(v4[3], "spokenGuidance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "priority");

  if (v13 > v15)
    v16 = -1;
  else
    v16 = 1;
LABEL_9:

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedGuidanceEvent)initWithCoder:(id)a3
{
  id v4;
  GEOComposedGuidanceEvent *v5;
  uint64_t v6;
  NSUUID *uniqueID;
  uint64_t v8;
  GEOGuidanceEvent *guidanceEvent;
  uint64_t v10;
  NSArray *lanes;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  GEOJunction *maneuverJunction;
  uint64_t v17;
  NSData *serverRouteID;
  uint64_t v19;
  NSString *roadName;
  double v21;
  uint64_t v22;
  NSArray *primarySignStrings;
  uint64_t v24;
  NSArray *secondarySignStrings;
  uint64_t v26;
  NSArray *spokenStrings;
  uint64_t v28;
  NSArray *primaryLaneStrings;
  uint64_t v30;
  NSArray *secondaryLaneStrings;
  uint64_t v32;
  GEOComposedString *navTrayTitleString;
  uint64_t v34;
  GEOComposedString *navTrayDetailString;
  uint64_t v36;
  GEOComposedString *arInstructionString;
  uint64_t v38;
  GEOTransitArtworkDataSource *artworkOverride;
  id v40;
  const void *v41;
  size_t v42;
  id v43;
  const void *v44;
  size_t v45;
  id v46;
  const void *v47;
  size_t v48;
  GEOComposedGuidanceEvent *v49;
  unint64_t v51;
  objc_super v52;

  v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)GEOComposedGuidanceEvent;
  v5 = -[GEOComposedGuidanceEvent init](&v52, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_uniqueID"));
    v6 = objc_claimAutoreleasedReturnValue();
    uniqueID = v5->_uniqueID;
    v5->_uniqueID = (NSUUID *)v6;

    v5->_creationOrder = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_creationOrder"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_guidanceEvent"));
    v8 = objc_claimAutoreleasedReturnValue();
    guidanceEvent = v5->_guidanceEvent;
    v5->_guidanceEvent = (GEOGuidanceEvent *)v8;

    v5->_stepIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_stepIndex"));
    v5->_legIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_legIndex"));
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_lanes"));
    v10 = objc_claimAutoreleasedReturnValue();
    lanes = v5->_lanes;
    v5->_lanes = (NSArray *)v10;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_startValidDistance"));
    v5->_startValidDistance = v12;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_endValidDistance"));
    v5->_endValidDistance = v13;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_distanceForStrings"));
    v5->_distanceForStrings = v14;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_maneuverJunction"));
    v15 = objc_claimAutoreleasedReturnValue();
    maneuverJunction = v5->_maneuverJunction;
    v5->_maneuverJunction = (GEOJunction *)v15;

    v5->_maneuverType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_maneuverType"));
    v5->_drivingSide = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_drivingSide"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_serverRouteID"));
    v17 = objc_claimAutoreleasedReturnValue();
    serverRouteID = v5->_serverRouteID;
    v5->_serverRouteID = (NSData *)v17;

    v5->_stepID = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_stepID"));
    v5->_transportType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_transportType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_roadName"));
    v19 = objc_claimAutoreleasedReturnValue();
    roadName = v5->_roadName;
    v5->_roadName = (NSString *)v19;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_distance"));
    v5->_distance = v21;
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_primarySignStrings"));
    v22 = objc_claimAutoreleasedReturnValue();
    primarySignStrings = v5->_primarySignStrings;
    v5->_primarySignStrings = (NSArray *)v22;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_secondarySignStrings"));
    v24 = objc_claimAutoreleasedReturnValue();
    secondarySignStrings = v5->_secondarySignStrings;
    v5->_secondarySignStrings = (NSArray *)v24;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_spokenStrings"));
    v26 = objc_claimAutoreleasedReturnValue();
    spokenStrings = v5->_spokenStrings;
    v5->_spokenStrings = (NSArray *)v26;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_primaryLaneStrings"));
    v28 = objc_claimAutoreleasedReturnValue();
    primaryLaneStrings = v5->_primaryLaneStrings;
    v5->_primaryLaneStrings = (NSArray *)v28;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_secondaryLaneStrings"));
    v30 = objc_claimAutoreleasedReturnValue();
    secondaryLaneStrings = v5->_secondaryLaneStrings;
    v5->_secondaryLaneStrings = (NSArray *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_navTrayTitleString"));
    v32 = objc_claimAutoreleasedReturnValue();
    navTrayTitleString = v5->_navTrayTitleString;
    v5->_navTrayTitleString = (GEOComposedString *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_navTrayDetailString"));
    v34 = objc_claimAutoreleasedReturnValue();
    navTrayDetailString = v5->_navTrayDetailString;
    v5->_navTrayDetailString = (GEOComposedString *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_arInstructionString"));
    v36 = objc_claimAutoreleasedReturnValue();
    arInstructionString = v5->_arInstructionString;
    v5->_arInstructionString = (GEOComposedString *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_artworkOverride"));
    v38 = objc_claimAutoreleasedReturnValue();
    artworkOverride = v5->_artworkOverride;
    v5->_artworkOverride = (GEOTransitArtworkDataSource *)v38;

    v51 = 0;
    v40 = objc_retainAutorelease(v4);
    v41 = (const void *)objc_msgSend(v40, "decodeBytesForKey:returnedLength:", CFSTR("_startValidRouteCoordinate"), &v51);
    if (v51 && v41)
    {
      if (v51 >= 8)
        v42 = 8;
      else
        v42 = v51;
      memcpy(&v5->_startValidRouteCoordinate, v41, v42);
    }
    v51 = 0;
    v43 = objc_retainAutorelease(v40);
    v44 = (const void *)objc_msgSend(v43, "decodeBytesForKey:returnedLength:", CFSTR("_endValidRouteCoordinate"), &v51);
    if (v51 && v44)
    {
      if (v51 >= 8)
        v45 = 8;
      else
        v45 = v51;
      memcpy(&v5->_endValidRouteCoordinate, v44, v45);
    }
    v51 = 0;
    v46 = objc_retainAutorelease(v43);
    v47 = (const void *)objc_msgSend(v46, "decodeBytesForKey:returnedLength:", CFSTR("_coordinateForDistanceStrings"), &v51);
    if (v51 && v47)
    {
      if (v51 >= 8)
        v48 = 8;
      else
        v48 = v51;
      memcpy(&v5->_coordinateForDistanceStrings, v47, v48);
    }
    v5->_source = objc_msgSend(v46, "decodeIntegerForKey:", CFSTR("_source"));
    v5->_sourceIndex = objc_msgSend(v46, "decodeIntegerForKey:", CFSTR("_sourceIndex"));
    v5->_enrouteNoticeIndex = objc_msgSend(v46, "decodeIntegerForKey:", CFSTR("_enrouteNoticeIndex"));
    v49 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *uniqueID;
  id v5;

  uniqueID = self->_uniqueID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", uniqueID, CFSTR("_uniqueID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_creationOrder, CFSTR("_creationOrder"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_guidanceEvent, CFSTR("_guidanceEvent"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_stepIndex, CFSTR("_stepIndex"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_legIndex, CFSTR("_legIndex"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lanes, CFSTR("_lanes"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_startValidDistance"), self->_startValidDistance);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_endValidDistance"), self->_endValidDistance);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_distanceForStrings"), self->_distanceForStrings);
  objc_msgSend(v5, "encodeObject:forKey:", self->_maneuverJunction, CFSTR("_maneuverJunction"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_maneuverType, CFSTR("_maneuverType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_drivingSide, CFSTR("_drivingSide"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serverRouteID, CFSTR("_serverRouteID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_stepID, CFSTR("_stepID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_transportType, CFSTR("_transportType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_roadName, CFSTR("_roadName"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_distance"), self->_distance);
  objc_msgSend(v5, "encodeObject:forKey:", self->_primarySignStrings, CFSTR("_primarySignStrings"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_secondarySignStrings, CFSTR("_secondarySignStrings"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_spokenStrings, CFSTR("_spokenStrings"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_primaryLaneStrings, CFSTR("_primaryLaneStrings"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_secondaryLaneStrings, CFSTR("_secondaryLaneStrings"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_navTrayTitleString, CFSTR("_navTrayTitleString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_navTrayDetailString, CFSTR("_navTrayDetailString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_arInstructionString, CFSTR("_arInstructionString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_artworkOverride, CFSTR("_artworkOverride"));
  objc_msgSend(v5, "encodeBytes:length:forKey:", &self->_startValidRouteCoordinate, 8, CFSTR("_startValidRouteCoordinate"));
  objc_msgSend(v5, "encodeBytes:length:forKey:", &self->_endValidRouteCoordinate, 8, CFSTR("_endValidRouteCoordinate"));
  objc_msgSend(v5, "encodeBytes:length:forKey:", &self->_coordinateForDistanceStrings, 8, CFSTR("_coordinateForDistanceStrings"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_source, CFSTR("_source"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sourceIndex, CFSTR("_sourceIndex"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_enrouteNoticeIndex, CFSTR("_enrouteNoticeIndex"));

}

- (id)description
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  __CFString *v38;
  void *v39;
  double v40;
  void *v41;
  unint64_t stepIndex;
  void *v43;
  double v44;
  void *v45;
  void *v46;
  void *v48;
  void *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[GEOGuidanceEvent eventType](self->_guidanceEvent, "eventType"))
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = -[GEOGuidanceEvent eventType](self->_guidanceEvent, "eventType");
    if (v6 >= 0xF)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E1C094D0[(int)v6];
    }
    objc_msgSend(v5, "stringWithFormat:", CFSTR("[%@]"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v8);

  }
  if (-[GEOGuidanceEvent hasSpokenGuidance](self->_guidanceEvent, "hasSpokenGuidance"))
  {
    objc_msgSend(v3, "addObject:", CFSTR("Spoken"));
    -[NSArray firstObject](self->_spokenStrings, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithOptions:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[GEOComposedGuidanceEvent hasHaptics](self, "hasHaptics"))
      objc_msgSend(v4, "addObject:", CFSTR("[TAP]"));
  }
  else
  {
    v10 = 0;
  }
  if (-[GEOGuidanceEvent hasSignGuidance](self->_guidanceEvent, "hasSignGuidance"))
  {
    objc_msgSend(v3, "addObject:", CFSTR("Sign"));
    -[NSArray firstObject](self->_secondarySignStrings, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithOptions:", 0);
    v12 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v12;
  }
  if (-[GEOGuidanceEvent hasLaneGuidance](self->_guidanceEvent, "hasLaneGuidance"))
  {
    objc_msgSend(v3, "addObject:", CFSTR("Lane"));
    -[GEOComposedGuidanceEvent lanes](self, "lanes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    descriptionForLaneInfos(v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v14;
  }
  -[GEOGuidanceEvent navTrayGuidance](self->_guidanceEvent, "navTrayGuidance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v3, "addObject:", CFSTR("NavTray"));
    v16 = (void *)MEMORY[0x1E0CB3940];
    -[GEOComposedString stringWithDefaultOptions](self->_navTrayTitleString, "stringWithDefaultOptions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOComposedString stringWithDefaultOptions](self->_navTrayDetailString, "stringWithDefaultOptions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("%@ | %@"), v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v19;
  }
  v48 = v4;
  v49 = v3;
  if (-[GEOGuidanceEvent hasJunctionView](self->_guidanceEvent, "hasJunctionView"))
  {
    objc_msgSend(v3, "addObject:", CFSTR("Junction view"));
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    -[GEOGuidanceEvent junctionView](self->_guidanceEvent, "junctionView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "imageIds");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v52 != v25)
            objc_enumerationMutation(v22);
          v27 = -[GEOComposedGuidanceEvent _junctionViewIDForData:](self, "_junctionViewIDForData:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i));
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "description");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v29);

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
      }
      while (v24);
    }

    v30 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v20, "componentsJoinedByString:", CFSTR(", "));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringWithFormat:", CFSTR("IDs: %@"), v31);
    v32 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v32;
    v3 = v49;
  }
  if (!-[GEOGuidanceEvent hasArGuidance](self->_guidanceEvent, "hasArGuidance"))
  {
    v50 = v10;
    goto LABEL_32;
  }
  objc_msgSend(v3, "addObject:", CFSTR("AR guidance"));
  -[GEOComposedString stringWithOptions:](self->_arInstructionString, "stringWithOptions:", 0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[GEOComposedGuidanceEvent arType](self, "arType") == 1)
  {
    v33 = CFSTR("[CONTINUE]");
  }
  else
  {
    if (-[GEOComposedGuidanceEvent arType](self, "arType") != 2)
      goto LABEL_32;
    v33 = CFSTR("[MANEUVER]");
  }
  objc_msgSend(v4, "addObject:", v33);
LABEL_32:
  -[GEOComposedGuidanceEvent artworkOverride](self, "artworkOverride");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
    objc_msgSend(v4, "addObject:", CFSTR("[ARTWORK]"));
  if (-[GEOComposedGuidanceEvent isSticky](self, "isSticky"))
    objc_msgSend(v4, "addObject:", CFSTR("[STICKY]"));
  -[GEOComposedGuidanceEvent exclusiveSetIdentifier](self, "exclusiveSetIdentifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[group: %@]"), v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v36);

  }
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" & "));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = &stru_1E1C241D0;
  objc_msgSend(v4, "componentsJoinedByString:", &stru_1E1C241D0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)MEMORY[0x1E0CB3940];
  stepIndex = self->_stepIndex;
  if (stepIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%d) "), self->_stepIndex);
    v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  GEOPolylineCoordinateAsString(*(_QWORD *)&self->_startValidRouteCoordinate, 1, 0, v40);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  GEOPolylineCoordinateAsString(*(_QWORD *)&self->_endValidRouteCoordinate, 1, 0, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "stringWithFormat:", CFSTR("%@ event %@[%@] to [%@], %@ %@"), v37, v38, v43, v45, v39, v50);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (stepIndex != 0x7FFFFFFFFFFFFFFFLL)
  return v46;
}

- (NSUUID)uniqueID
{
  return self->_uniqueID;
}

- (unint64_t)stepIndex
{
  return self->_stepIndex;
}

- (unint64_t)legIndex
{
  return self->_legIndex;
}

- (int)maneuverType
{
  return self->_maneuverType;
}

- (int)drivingSide
{
  return self->_drivingSide;
}

- (GEOJunction)maneuverJunction
{
  return self->_maneuverJunction;
}

- (GEOTransitArtworkDataSource)artworkOverride
{
  return self->_artworkOverride;
}

- (NSData)serverRouteID
{
  return self->_serverRouteID;
}

- (unsigned)stepID
{
  return self->_stepID;
}

- (int)transportType
{
  return self->_transportType;
}

- (NSString)roadName
{
  return self->_roadName;
}

- (double)distance
{
  return self->_distance;
}

- (NSArray)primarySignStrings
{
  return self->_primarySignStrings;
}

- (NSArray)secondarySignStrings
{
  return self->_secondarySignStrings;
}

- (NSArray)spokenStrings
{
  return self->_spokenStrings;
}

- (NSArray)primaryLaneStrings
{
  return self->_primaryLaneStrings;
}

- (NSArray)secondaryLaneStrings
{
  return self->_secondaryLaneStrings;
}

- (GEOComposedString)navTrayTitleString
{
  return self->_navTrayTitleString;
}

- (GEOComposedString)navTrayDetailString
{
  return self->_navTrayDetailString;
}

- (GEOComposedString)arInstructionString
{
  return self->_arInstructionString;
}

- ($212C09783140BCCD23384160D545CE0D)startValidRouteCoordinate
{
  return ($212C09783140BCCD23384160D545CE0D)self->_startValidRouteCoordinate;
}

- ($212C09783140BCCD23384160D545CE0D)endValidRouteCoordinate
{
  return ($212C09783140BCCD23384160D545CE0D)self->_endValidRouteCoordinate;
}

- ($212C09783140BCCD23384160D545CE0D)coordinateForDistanceStrings
{
  return ($212C09783140BCCD23384160D545CE0D)self->_coordinateForDistanceStrings;
}

- (double)startValidDistance
{
  return self->_startValidDistance;
}

- (double)endValidDistance
{
  return self->_endValidDistance;
}

- (double)distanceForStrings
{
  return self->_distanceForStrings;
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (unint64_t)sourceIndex
{
  return self->_sourceIndex;
}

- (void)setSourceIndex:(unint64_t)a3
{
  self->_sourceIndex = a3;
}

- (unint64_t)enrouteNoticeIndex
{
  return self->_enrouteNoticeIndex;
}

- (void)setEnrouteNoticeIndex:(unint64_t)a3
{
  self->_enrouteNoticeIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navTrayDetailString, 0);
  objc_storeStrong((id *)&self->_navTrayTitleString, 0);
  objc_storeStrong((id *)&self->_artworkOverride, 0);
  objc_storeStrong((id *)&self->_maneuverJunction, 0);
  objc_storeStrong((id *)&self->_arInstructionString, 0);
  objc_storeStrong((id *)&self->_secondaryLaneStrings, 0);
  objc_storeStrong((id *)&self->_primaryLaneStrings, 0);
  objc_storeStrong((id *)&self->_spokenStrings, 0);
  objc_storeStrong((id *)&self->_secondarySignStrings, 0);
  objc_storeStrong((id *)&self->_primarySignStrings, 0);
  objc_storeStrong((id *)&self->_roadName, 0);
  objc_storeStrong((id *)&self->_serverRouteID, 0);
  objc_storeStrong((id *)&self->_lanes, 0);
  objc_storeStrong((id *)&self->_guidanceEvent, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
}

@end
