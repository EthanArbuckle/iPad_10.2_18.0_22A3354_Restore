@implementation GEOComposedRoute

- (GEOComposedRoute)init
{
  GEOComposedRoute *v2;
  uint64_t v3;
  geo_reentrant_isolater *snappedRoutesIsolater;
  uint64_t v5;
  geo_isolater *mutableDataLock;
  uint64_t v7;
  geo_isolater *encodeIsolater;
  uint64_t v9;
  NSUUID *uniqueRouteID;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)GEOComposedRoute;
  v2 = -[GEOComposedRoute init](&v12, sel_init);
  if (v2)
  {
    v3 = geo_reentrant_isolater_create();
    snappedRoutesIsolater = v2->_snappedRoutesIsolater;
    v2->_snappedRoutesIsolater = (geo_reentrant_isolater *)v3;

    v5 = geo_isolater_create();
    mutableDataLock = v2->_mutableDataLock;
    v2->_mutableDataLock = (geo_isolater *)v5;

    v7 = geo_isolater_create();
    encodeIsolater = v2->_encodeIsolater;
    v2->_encodeIsolater = (geo_isolater *)v7;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = objc_claimAutoreleasedReturnValue();
    uniqueRouteID = v2->_uniqueRouteID;
    v2->_uniqueRouteID = (NSUUID *)v9;

    v2->_indexInResponse = 0x7FFFFFFFFFFFFFFFLL;
  }
  return v2;
}

- (GEOComposedRoute)initWithGeoWaypointRoute:(id)a3 initializerData:(id)a4
{
  id v7;
  id v8;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  void *v12;
  GEOComposedRoute *v13;
  void *v14;
  GEORouteAttributes *v15;
  GEORouteAttributes *routeAttributes;
  NSData *v17;
  NSData *directionsResponseID;
  NSData *v19;
  NSData *etauResponseID;
  NSUUID *v21;
  NSUUID *uniqueRouteID;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSString *v31;
  NSString *name;
  void *v33;
  void *v34;
  NSString *v35;
  NSString *trafficDescription;
  GEOPBTransitArtwork *v37;
  GEOPBTransitArtwork *trafficDescriptionArtwork;
  GEOComposedString *v39;
  void *v40;
  GEOComposedString *v41;
  GEOComposedString *routeLabelDescriptionString;
  GEOLabelAction *v43;
  GEOLabelAction *routeLabelAction;
  GEOServerFormattedString *v45;
  GEOServerFormattedString *routeLabelDescription;
  GEOTransitArtworkDataSource *v47;
  GEOTransitArtworkDataSource *routeLabelArtwork;
  GEOComposedString *v49;
  void *v50;
  GEOComposedString *v51;
  GEOComposedString *infrastructureDescriptionString;
  GEOServerFormattedString *v53;
  GEOServerFormattedString *infrastructureDescription;
  GEOComposedString *v55;
  id *v56;
  void *v57;
  GEOComposedString *v58;
  GEOComposedString *previewDurationString;
  GEOComposedString *v60;
  id *v61;
  void *v62;
  GEOComposedString *v63;
  GEOComposedString *planningDescriptionString;
  GEOComposedString *v65;
  id *v66;
  void *v67;
  GEOComposedString *v68;
  GEOComposedString *planningDistanceString;
  id *v70;
  GEOServerFormattedString *v71;
  GEOServerFormattedString *previewDurationFormatString;
  id *v73;
  GEOServerFormattedString *v74;
  GEOServerFormattedString *planningDescriptionFormatString;
  id *v76;
  GEOServerFormattedString *v77;
  GEOServerFormattedString *planningDistanceFormatString;
  id *v79;
  NSString *v80;
  NSString *planningSeparatorString;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  GEOStyleAttributes *v90;
  GEOStyleAttributes *styleAttributes;
  GEOAddressObject *v92;
  GEOAddressObject *address;
  void *v94;
  NSArray *v95;
  NSArray *enrouteNotices;
  GEOComposedRouteMutableData *v97;
  GEOComposedRouteMutableData *mutableData;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  unint64_t i;
  NSObject *v104;
  NSObject *v105;
  void *v106;
  void *v107;
  void *v109;
  void *v110;
  void *v111;
  uint8_t buf[4];
  int v113;
  __int16 v114;
  _BOOL4 v115;
  uint64_t v116;

  v116 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "waypoints");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10 <= 1)
  {
    GEOGetGEOComposedRouteLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "waypoints");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109120;
      v113 = objc_msgSend(v12, "count");
      _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_ERROR, "Attempting to initialize GEOComposedRoute with insufficient waypoints. This is no longer allowed. Waypoint count: %d", buf, 8u);

    }
    v13 = 0;
    goto LABEL_28;
  }
  self = -[GEOComposedRoute init](self, "init");
  if (self)
  {
    objc_msgSend(v8, "directionsResponse");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "etaTrafficUpdateResponse");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "routePlanningInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_geoWaypointRoute, a3);
    objc_storeStrong((id *)&self->_routeInitializerData, a4);
    objc_msgSend(v8, "routeAttributes");
    v15 = (GEORouteAttributes *)objc_claimAutoreleasedReturnValue();
    routeAttributes = self->_routeAttributes;
    self->_routeAttributes = v15;

    self->_serverIdentifier = objc_msgSend(v7, "identifier");
    -[NSObject directionsResponseID](v11, "directionsResponseID");
    v17 = (NSData *)objc_claimAutoreleasedReturnValue();
    directionsResponseID = self->_directionsResponseID;
    self->_directionsResponseID = v17;

    objc_msgSend(v111, "responseId");
    v19 = (NSData *)objc_claimAutoreleasedReturnValue();
    etauResponseID = self->_etauResponseID;
    self->_etauResponseID = v19;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v21 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    uniqueRouteID = self->_uniqueRouteID;
    self->_uniqueRouteID = v21;

    objc_storeStrong((id *)&self->_revisionIdentifier, self->_uniqueRouteID);
    self->_source = 1;
    self->_offlineRoute = -[NSObject isOfflineResponse](v11, "isOfflineResponse");
    if (v11)
    {
      -[NSObject waypointRoutes](v11, "waypointRoutes");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      self->_indexInResponse = objc_msgSend(v23, "indexOfObject:", v7);

      -[NSObject responseAttributes](v11, "responseAttributes");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "elevationModel");
    }
    else
    {
      if (!v111)
        goto LABEL_12;
      objc_msgSend(v111, "waypointRoute");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(v26, "newWaypointRoutes");
      self->_indexInResponse = objc_msgSend(v27, "indexOfObject:", v7);

      objc_msgSend(v111, "responseAttributes");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "elevationModel");
    }
    self->_elevationModel = v25;

LABEL_12:
    objc_msgSend(v7, "names");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "firstObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "name");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (NSString *)objc_msgSend(v30, "copy");
    name = self->_name;
    self->_name = v31;

    objc_msgSend(v14, "trafficDescriptionText");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "formatStrings");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "firstObject");
    v35 = (NSString *)objc_claimAutoreleasedReturnValue();
    trafficDescription = self->_trafficDescription;
    self->_trafficDescription = v35;

    objc_msgSend(v14, "trafficDescriptionArtwork");
    v37 = (GEOPBTransitArtwork *)objc_claimAutoreleasedReturnValue();
    trafficDescriptionArtwork = self->_trafficDescriptionArtwork;
    self->_trafficDescriptionArtwork = v37;

    v39 = [GEOComposedString alloc];
    objc_msgSend(v14, "labelDetailText");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = -[GEOComposedString initWithGeoFormattedString:](v39, "initWithGeoFormattedString:", v40);
    routeLabelDescriptionString = self->_routeLabelDescriptionString;
    self->_routeLabelDescriptionString = v41;

    objc_msgSend(v14, "labelAction");
    v43 = (GEOLabelAction *)objc_claimAutoreleasedReturnValue();
    routeLabelAction = self->_routeLabelAction;
    self->_routeLabelAction = v43;

    objc_msgSend(v14, "labelDetailText");
    v45 = (GEOServerFormattedString *)objc_claimAutoreleasedReturnValue();
    routeLabelDescription = self->_routeLabelDescription;
    self->_routeLabelDescription = v45;

    objc_msgSend(v14, "labelArtwork");
    v47 = (GEOTransitArtworkDataSource *)objc_claimAutoreleasedReturnValue();
    routeLabelArtwork = self->_routeLabelArtwork;
    self->_routeLabelArtwork = v47;

    v49 = [GEOComposedString alloc];
    objc_msgSend(v14, "infrastructureDescription");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = -[GEOComposedString initWithGeoFormattedString:](v49, "initWithGeoFormattedString:", v50);
    infrastructureDescriptionString = self->_infrastructureDescriptionString;
    self->_infrastructureDescriptionString = v51;

    objc_msgSend(v14, "infrastructureDescription");
    v53 = (GEOServerFormattedString *)objc_claimAutoreleasedReturnValue();
    infrastructureDescription = self->_infrastructureDescription;
    self->_infrastructureDescription = v53;

    v55 = [GEOComposedString alloc];
    objc_msgSend(v14, "routePlanningDescription");
    v56 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEORouteInformation duration](v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = -[GEOComposedString initWithGeoFormattedString:](v55, "initWithGeoFormattedString:", v57);
    previewDurationString = self->_previewDurationString;
    self->_previewDurationString = v58;

    v60 = [GEOComposedString alloc];
    objc_msgSend(v14, "routePlanningDescription");
    v61 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEORouteInformation routeDescription](v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = -[GEOComposedString initWithGeoFormattedString:](v60, "initWithGeoFormattedString:", v62);
    planningDescriptionString = self->_planningDescriptionString;
    self->_planningDescriptionString = v63;

    v65 = [GEOComposedString alloc];
    objc_msgSend(v14, "routePlanningDescription");
    v66 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEORouteInformation distance](v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = -[GEOComposedString initWithGeoFormattedString:](v65, "initWithGeoFormattedString:", v67);
    planningDistanceString = self->_planningDistanceString;
    self->_planningDistanceString = v68;

    objc_msgSend(v14, "routePlanningDescription");
    v70 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEORouteInformation duration](v70);
    v71 = (GEOServerFormattedString *)objc_claimAutoreleasedReturnValue();
    previewDurationFormatString = self->_previewDurationFormatString;
    self->_previewDurationFormatString = v71;

    objc_msgSend(v14, "routePlanningDescription");
    v73 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEORouteInformation routeDescription](v73);
    v74 = (GEOServerFormattedString *)objc_claimAutoreleasedReturnValue();
    planningDescriptionFormatString = self->_planningDescriptionFormatString;
    self->_planningDescriptionFormatString = v74;

    objc_msgSend(v14, "routePlanningDescription");
    v76 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEORouteInformation distance](v76);
    v77 = (GEOServerFormattedString *)objc_claimAutoreleasedReturnValue();
    planningDistanceFormatString = self->_planningDistanceFormatString;
    self->_planningDistanceFormatString = v77;

    objc_msgSend(v14, "routePlanningDescription");
    v79 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEORouteInformation separator](v79);
    v80 = (NSString *)objc_claimAutoreleasedReturnValue();
    planningSeparatorString = self->_planningSeparatorString;
    self->_planningSeparatorString = v80;

    self->_isNavigable = -[NSObject isNavigable](v11, "isNavigable");
    self->_transportType = objc_msgSend(v7, "transportType");
    objc_msgSend(v7, "traversalTimes");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    self->_expectedTime = objc_msgSend(v82, "estimatedSeconds");

    objc_msgSend(v7, "traversalTimes");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    self->_historicTravelTime = objc_msgSend(v83, "historicalEstimatedSeconds");

    objc_msgSend(v7, "traversalTimes");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    self->_freeflowTravelTime = (double)objc_msgSend(v84, "freeflowEstimatedSeconds");

    objc_msgSend(v7, "traversalTimes");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    self->_travelTimeAggressiveEstimate = (double)objc_msgSend(v85, "aggressiveEstimatedSeconds");

    objc_msgSend(v7, "traversalTimes");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    self->_travelTimeConservativeEstimate = (double)objc_msgSend(v86, "conservativeEstimatedSeconds");

    objc_msgSend(v7, "feature");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    self->_avoidsTolls = objc_msgSend(v87, "avoidsTolls");

    objc_msgSend(v7, "feature");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    self->_avoidsHighways = objc_msgSend(v88, "avoidsHighways");

    objc_msgSend(v7, "feature");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    self->_avoidsTraffic = objc_msgSend(v89, "avoidsTraffic");

    objc_msgSend(v8, "styleAttributes");
    v90 = (GEOStyleAttributes *)objc_claimAutoreleasedReturnValue();
    styleAttributes = self->_styleAttributes;
    self->_styleAttributes = v90;

    objc_msgSend(v8, "address");
    v92 = (GEOAddressObject *)objc_claimAutoreleasedReturnValue();
    address = self->_address;
    self->_address = v92;

    +[GEORouteBuilder outputForGeoWaypointRoute:initializerData:custodian:](GEORouteBuilder, "outputForGeoWaypointRoute:initializerData:custodian:", v7, v8, self);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    if (v94)
    {
      -[GEOComposedRoute _ingestRouteBuilderOutput:](self, "_ingestRouteBuilderOutput:", v94);
      -[GEOComposedRoute _initOtherRouteFeatures:initializerData:](self, "_initOtherRouteFeatures:initializerData:", v7, v8);
      +[GEOEnrouteNoticesUtil createEnrouteNoticesForComposedRoute:routeInitializerData:](GEOEnrouteNoticesUtil, "createEnrouteNoticesForComposedRoute:routeInitializerData:", self, v8);
      v95 = (NSArray *)objc_claimAutoreleasedReturnValue();
      enrouteNotices = self->_enrouteNotices;
      self->_enrouteNotices = v95;

      -[GEOComposedRoute _initializeManeuverDisplaySteps](self, "_initializeManeuverDisplaySteps");
      v97 = objc_alloc_init(GEOComposedRouteMutableData);
      mutableData = self->_mutableData;
      self->_mutableData = v97;

      -[GEOComposedRouteMutableData initializeForRoute:](self->_mutableData, "initializeForRoute:", self);
      -[NSArray firstObject](self->_legs, "firstObject");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "origin");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      if (v100)
      {
        -[NSArray lastObject](self->_legs, "lastObject");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "destination");
        v102 = (void *)objc_claimAutoreleasedReturnValue();

        if (v102)
        {
          for (i = 0; i < objc_msgSend(v7, "initialPromptTypesCount"); ++i)
            self->_initialPromptTypes |= 1 << *(_DWORD *)(objc_msgSend(v7, "initialPromptTypes") + 4 * i);
          v13 = self;
          goto LABEL_27;
        }
      }
      else
      {

      }
      GEOGetGEOComposedRouteLog();
      v105 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
      {
        -[NSArray firstObject](self->_legs, "firstObject");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v110, "origin");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray lastObject](self->_legs, "lastObject");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "destination");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109376;
        v113 = v109 != 0;
        v114 = 1024;
        v115 = v107 != 0;
        _os_log_impl(&dword_1885A9000, v105, OS_LOG_TYPE_ERROR, "GEOComposedRoute was built without a proper origin and destination. This is an error with the route builder. Origin: %d, Destination: %d", buf, 0xEu);

      }
    }
    else
    {
      GEOGetGEOComposedRouteLog();
      v104 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1885A9000, v104, OS_LOG_TYPE_ERROR, "Error getting builder output for GEOComposedRoute. This could be either due to a bad server response or error with the route builder", buf, 2u);
      }

    }
    v13 = 0;
LABEL_27:

LABEL_28:
    goto LABEL_29;
  }
  v13 = 0;
LABEL_29:

  return v13;
}

- (GEOComposedRoute)initWithTransitGeometry:(id)a3 andLine:(id)a4 andStops:(id)a5
{
  GEOComposedRoute *v8;
  void *v9;
  uint64_t v10;
  NSData *serverRouteID;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  GEOPBTransitStop *v17;
  void *v18;
  void *v19;
  GEOPBTransitZoomRangeString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSArray *stops;
  void *v27;
  GEORouteAttributes *v28;
  GEORouteAttributes *routeAttributes;
  GEOComposedRouteMutableData *v30;
  GEOComposedRouteMutableData *mutableData;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _BOOL4 v36;
  GEOComposedRoute *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id obj;
  id v45;
  id v46;
  id v47;
  GEOComposedRoute *v48;
  id v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  _BOOL4 v56;
  __int16 v57;
  _BOOL4 v58;
  GEOPBTransitZoomRangeString *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v45 = a3;
  v46 = a4;
  v47 = a5;
  v8 = -[GEOComposedRoute init](self, "init");
  v48 = v8;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    obj = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dataUsingEncoding:", 4);
    v10 = objc_claimAutoreleasedReturnValue();
    serverRouteID = v8->_serverRouteID;
    v8->_serverRouteID = (NSData *)v10;

    objc_storeStrong((id *)&v8->_uniqueRouteID, obj);
    objc_storeStrong((id *)&v8->_revisionIdentifier, obj);
    v8->_source = 5;
    v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v47, "count"));
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v49 = v47;
    v12 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
    if (v12)
    {
      v13 = 0;
      v14 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v52 != v14)
            objc_enumerationMutation(v49);
          v16 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
          v17 = objc_alloc_init(GEOPBTransitStop);
          -[GEOPBTransitStop setStopIndex:](v17, "setStopIndex:", v13 + i);
          -[GEOPBTransitStop setMuid:](v17, "setMuid:", objc_msgSend(v16, "stationIdentifier"));
          objc_msgSend(v16, "location");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[GEOPBTransitStop setLatLng:](v17, "setLatLng:", v18);

          objc_msgSend(v16, "displayName");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[GEOPBTransitStop setNameDisplayString:](v17, "setNameDisplayString:", v19);

          v20 = objc_alloc_init(GEOPBTransitZoomRangeString);
          -[GEOPBTransitZoomRangeString setMinZoom:](v20, "setMinZoom:", 0);
          objc_msgSend(v16, "displayName");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[GEOPBTransitZoomRangeString setLabelText:](v20, "setLabelText:", v21);

          v59 = v20;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (void *)objc_msgSend(v22, "mutableCopy");
          -[GEOPBTransitStop setZoomNames:](v17, "setZoomNames:", v23);

          objc_msgSend(v16, "styleAttributes");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[GEOPBTransitStop setStyleAttributes:](v17, "setStyleAttributes:", v24);

          objc_msgSend(v50, "addObject:", v17);
        }
        v12 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
        v13 = (v13 + i);
      }
      while (v12);
    }

    v25 = objc_msgSend(v50, "copy");
    stops = v48->_stops;
    v48->_stops = (NSArray *)v25;

    +[GEOTransitRouteBuilder outputForGeometry:andLine:andStops:andCustodian:](GEOTransitRouteBuilder, "outputForGeometry:andLine:andStops:andCustodian:", v45, v46, v49, v48);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOComposedRoute _ingestRouteBuilderOutput:](v48, "_ingestRouteBuilderOutput:", v27);
    v28 = objc_alloc_init(GEORouteAttributes);
    routeAttributes = v48->_routeAttributes;
    v48->_routeAttributes = v28;

    -[GEORouteAttributes setMainTransportType:](v48->_routeAttributes, "setMainTransportType:", 1);
    v48->_transportType = 1;
    v48->_selectedSegmentIndex = 0x7FFFFFFFFFFFFFFFLL;
    -[GEOComposedRoute _initializeManeuverDisplaySteps](v48, "_initializeManeuverDisplaySteps");
    v30 = objc_alloc_init(GEOComposedRouteMutableData);
    mutableData = v48->_mutableData;
    v48->_mutableData = v30;

    -[GEOComposedRouteMutableData initializeForRoute:](v48->_mutableData, "initializeForRoute:");
    -[NSArray firstObject](v48->_legs, "firstObject");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "origin");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      -[NSArray lastObject](v48->_legs, "lastObject");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "destination");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v35 == 0;

      if (!v36)
      {
        v37 = v48;
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {

    }
    GEOGetGEOComposedRouteLog();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      -[NSArray firstObject](v48->_legs, "firstObject");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "origin");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray lastObject](v48->_legs, "lastObject");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "destination");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109376;
      v56 = v40 != 0;
      v57 = 1024;
      v58 = v42 != 0;
      _os_log_impl(&dword_1885A9000, v38, OS_LOG_TYPE_ERROR, "GEOComposedRoute was built without a proper origin and destination. This is an error with the route builder. Origin: %d, Destination: %d", buf, 0xEu);

    }
    v37 = 0;
    goto LABEL_17;
  }
  v37 = 0;
LABEL_18:

  return v37;
}

- (GEOComposedRoute)initWithSuggestedRoute:(id)a3 initializerData:(id)a4
{
  void *v7;
  unint64_t v8;
  NSObject *v9;
  void *v10;
  GEOComposedRoute *v11;
  GEOComposedRoute *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  NSObject *v18;
  const char *v19;
  void *v20;
  uint64_t v21;
  NSData *serverRouteID;
  void *v23;
  void *v24;
  uint64_t v25;
  GEOStyleAttributes *styleAttributes;
  uint64_t v27;
  GEORouteAttributes *routeAttributes;
  uint64_t v29;
  GEOAddressObject *address;
  void *v31;
  uint64_t v32;
  GEOTransitDecoderData *decoderData;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSArray *stations;
  void *v39;
  uint64_t v40;
  NSArray *stops;
  void *v42;
  uint64_t v43;
  NSArray *halls;
  void *v45;
  uint64_t v46;
  NSData *directionsResponseID;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  NSArray *initialRideSelections;
  void *v54;
  uint64_t v55;
  NSArray *currentSectionOptions;
  int v57;
  void *v58;
  uint64_t v59;
  GEORouteDisplayHints *displayHints;
  _GEOTransitRoutingIncidentMessage *v61;
  void *v62;
  uint64_t v63;
  GEOTransitRoutingIncidentMessage *transitRoutingIncidentMessage;
  void *v65;
  void *v66;
  BOOL v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t i;
  uint64_t v74;
  GEOComposedRouteAdvisory *v75;
  void *v76;
  GEOComposedRouteAdvisory *v77;
  uint64_t v78;
  NSArray *advisories;
  void *v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t j;
  void *v85;
  unsigned int v86;
  void *v87;
  _BOOL4 v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  NSString *name;
  uint64_t v94;
  NSDate *startDate;
  int v96;
  GEOComposedRouteMutableData *v97;
  GEOComposedRouteMutableData *mutableData;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  _BOOL4 v103;
  NSObject *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  NSObject *obj;
  id *p_suggestedRoute;
  void *v112;
  id v113;
  id v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  uint8_t buf[4];
  int v124;
  __int16 v125;
  _BOOL4 v126;
  _BYTE v127[128];
  _BYTE v128[128];
  uint64_t v129;

  v129 = *MEMORY[0x1E0C80C00];
  v113 = a3;
  v114 = a4;
  objc_msgSend(v114, "waypoints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 <= 1)
  {
    GEOGetGEOComposedRouteLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v114, "waypoints");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109120;
      v124 = objc_msgSend(v10, "count");
      _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_ERROR, "Attempting to initialize GEOComposedRoute with insufficient waypoints. This is no longer allowed. Waypoint count: %d", buf, 8u);

    }
    v11 = 0;
    goto LABEL_60;
  }
  v12 = -[GEOComposedRoute init](self, "init");
  if (v12)
  {
    if (!v113 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "GEOComposedRoute initWithSuggestedRoute:initializerData: suggestedRoute is nil", buf, 2u);
    }
    if (v114)
    {
      objc_msgSend(v114, "directionsResponse");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13 == 0;

      if (v14)
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
          goto LABEL_19;
        *(_WORD *)buf = 0;
        v18 = MEMORY[0x1E0C81028];
        v19 = "GEOComposedRoute initWithSuggestedRoute:initializerData: directionsResponse is nil";
      }
      else
      {
        objc_msgSend(v114, "directionsResponse");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "decoderData");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16 == 0;

        if (!v17 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
          goto LABEL_19;
        *(_WORD *)buf = 0;
        v18 = MEMORY[0x1E0C81028];
        v19 = "GEOComposedRoute initWithSuggestedRoute:initializerData: decoderData is nil";
      }
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        goto LABEL_19;
      *(_WORD *)buf = 0;
      v18 = MEMORY[0x1E0C81028];
      v19 = "GEOComposedRoute initWithSuggestedRoute:initializerData: initializerData is nil";
    }
    _os_log_fault_impl(&dword_1885A9000, v18, OS_LOG_TYPE_FAULT, v19, buf, 2u);
LABEL_19:
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    obj = objc_claimAutoreleasedReturnValue();
    -[NSObject UUIDString](obj, "UUIDString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dataUsingEncoding:", 4);
    v21 = objc_claimAutoreleasedReturnValue();
    serverRouteID = v12->_serverRouteID;
    v12->_serverRouteID = (NSData *)v21;

    objc_storeStrong((id *)&v12->_uniqueRouteID, obj);
    objc_storeStrong((id *)&v12->_revisionIdentifier, obj);
    v12->_source = 1;
    objc_storeStrong((id *)&v12->_routeInitializerData, a4);
    objc_msgSend(v114, "directionsResponse");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v12->_isNavigable = objc_msgSend(v23, "isNavigable");

    objc_msgSend(v114, "directionsResponse");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "styleAttributes");
    v25 = objc_claimAutoreleasedReturnValue();
    styleAttributes = v12->_styleAttributes;
    v12->_styleAttributes = (GEOStyleAttributes *)v25;

    objc_msgSend(v114, "routeAttributes");
    v27 = objc_claimAutoreleasedReturnValue();
    routeAttributes = v12->_routeAttributes;
    v12->_routeAttributes = (GEORouteAttributes *)v27;

    objc_msgSend(v114, "address");
    v29 = objc_claimAutoreleasedReturnValue();
    address = v12->_address;
    v12->_address = (GEOAddressObject *)v29;

    objc_storeStrong((id *)&v12->_originalSuggestedRoute, a3);
    objc_msgSend(v114, "directionsResponse");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "decoderData");
    v32 = objc_claimAutoreleasedReturnValue();
    decoderData = v12->_decoderData;
    v12->_decoderData = (GEOTransitDecoderData *)v32;

    p_suggestedRoute = (id *)&v12->_suggestedRoute;
    objc_storeStrong((id *)&v12->_suggestedRoute, a3);
    if (v113)
    {
      objc_msgSend(v114, "directionsResponse");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "suggestedRoutes");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v12->_indexInResponse = objc_msgSend(v35, "indexOfObject:", v113);

    }
    else
    {
      v12->_indexInResponse = 0;
    }
    -[GEOTransitDecoderData stations](v12->_decoderData, "stations");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "copy");
    stations = v12->_stations;
    v12->_stations = (NSArray *)v37;

    -[GEOTransitDecoderData stops](v12->_decoderData, "stops");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "copy");
    stops = v12->_stops;
    v12->_stops = (NSArray *)v40;

    -[GEOTransitDecoderData halls](v12->_decoderData, "halls");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "copy");
    halls = v12->_halls;
    v12->_halls = (NSArray *)v43;

    objc_msgSend(v114, "directionsResponse");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "directionsResponseID");
    v46 = objc_claimAutoreleasedReturnValue();
    directionsResponseID = v12->_directionsResponseID;
    v12->_directionsResponseID = (NSData *)v46;

    objc_msgSend(v114, "directionsResponse");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "decoderData");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "waypoints");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    +[GEOTransitRouteBuilder outputForSuggestedRoute:withDecoderData:andWaypoints:andArrivalParameters:andCustodian:](GEOTransitRouteBuilder, "outputForSuggestedRoute:withDecoderData:andWaypoints:andArrivalParameters:andCustodian:", v113, v49, v50, 0, v12);
    v112 = (void *)objc_claimAutoreleasedReturnValue();

    -[GEOComposedRoute _ingestRouteBuilderOutput:](v12, "_ingestRouteBuilderOutput:", v112);
    v12->_isWalkingOnlyTransitRoute = objc_msgSend(v112, "isWalkingOnlyRoute");
    objc_msgSend(v112, "rideSelections");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "copy");
    initialRideSelections = v12->_initialRideSelections;
    v12->_initialRideSelections = (NSArray *)v52;

    objc_msgSend(v112, "sectionOptions");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v54, "copy");
    currentSectionOptions = v12->_currentSectionOptions;
    v12->_currentSectionOptions = (NSArray *)v55;

    if (v12->_isWalkingOnlyTransitRoute)
      v57 = 2;
    else
      v57 = 1;
    v12->_transportType = v57;
    objc_msgSend(v114, "directionsResponse");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "displayHints");
    v59 = objc_claimAutoreleasedReturnValue();
    displayHints = v12->_displayHints;
    v12->_displayHints = (GEORouteDisplayHints *)v59;

    if (objc_msgSend(v113, "hasTransitIncidentMessage"))
    {
      v61 = [_GEOTransitRoutingIncidentMessage alloc];
      objc_msgSend(v113, "transitIncidentMessage");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = -[_GEOTransitRoutingIncidentMessage initWithIncidentMessage:decoderData:](v61, "initWithIncidentMessage:decoderData:", v62, v12->_decoderData);
      transitRoutingIncidentMessage = v12->_transitRoutingIncidentMessage;
      v12->_transitRoutingIncidentMessage = (GEOTransitRoutingIncidentMessage *)v63;

    }
    objc_msgSend(v113, "advisoriesInfo");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "genericAdvisorys");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = v66 == 0;

    if (!v67)
    {
      v68 = (void *)objc_opt_new();
      v121 = 0u;
      v122 = 0u;
      v119 = 0u;
      v120 = 0u;
      objc_msgSend(v113, "advisoriesInfo");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "genericAdvisorys");
      v70 = (void *)objc_claimAutoreleasedReturnValue();

      v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v119, v128, 16);
      if (v71)
      {
        v72 = *(_QWORD *)v120;
        do
        {
          for (i = 0; i != v71; ++i)
          {
            if (*(_QWORD *)v120 != v72)
              objc_enumerationMutation(v70);
            v74 = *(_QWORD *)(*((_QWORD *)&v119 + 1) + 8 * i);
            v75 = [GEOComposedRouteAdvisory alloc];
            -[GEOTransitDecoderData transitIncidents](v12->_decoderData, "transitIncidents");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            v77 = -[GEOComposedRouteAdvisory initWithGeoAdvisoryNotice:transitIncidents:](v75, "initWithGeoAdvisoryNotice:transitIncidents:", v74, v76);
            objc_msgSend(v68, "addObject:", v77);

          }
          v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v119, v128, 16);
        }
        while (v71);
      }

      v78 = objc_msgSend(v68, "copy");
      advisories = v12->_advisories;
      v12->_advisories = (NSArray *)v78;

    }
    objc_msgSend(v113, "displayStrings");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOComposedRoute _initStringsForTransitRouteDisplayStrings:](v12, "_initStringsForTransitRouteDisplayStrings:", v80);

    if (v12->_isWalkingOnlyTransitRoute)
    {
      v117 = 0u;
      v118 = 0u;
      v115 = 0u;
      v116 = 0u;
      objc_msgSend(v113, "steps");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v115, v127, 16);
      if (v82)
      {
        v83 = *(_QWORD *)v116;
        while (2)
        {
          for (j = 0; j != v82; ++j)
          {
            if (*(_QWORD *)v116 != v83)
              objc_enumerationMutation(v81);
            v85 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * j);
            if (objc_msgSend(v85, "maneuverType") == 2
              && objc_msgSend(v85, "hasWalkingIndex"))
            {
              v86 = objc_msgSend(v85, "walkingIndex");
              -[GEOTransitDecoderData walkings](v12->_decoderData, "walkings");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              v88 = objc_msgSend(v87, "count") > (unint64_t)v86;

              if (v88)
              {
                -[GEOTransitDecoderData walkings](v12->_decoderData, "walkings");
                v89 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v89, "objectAtIndexedSubscript:", v86);
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v90, "name");
                v91 = (void *)objc_claimAutoreleasedReturnValue();
                v92 = objc_msgSend(v91, "copy");
                name = v12->_name;
                v12->_name = (NSString *)v92;

              }
              goto LABEL_49;
            }
          }
          v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v115, v127, 16);
          if (v82)
            continue;
          break;
        }
      }
LABEL_49:

    }
    if (objc_msgSend(*p_suggestedRoute, "hasAbsStartTime"))
    {
      v94 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(*p_suggestedRoute, "absStartTime"));
      startDate = v12->_startDate;
      v12->_startDate = (NSDate *)v94;

    }
    v96 = objc_msgSend(*p_suggestedRoute, "absEndTime");
    v12->_expectedTime = v96 - objc_msgSend(*p_suggestedRoute, "absStartTime");
    -[GEOComposedRoute _populateArtworkForSuggestedRoute:decoderData:](v12, "_populateArtworkForSuggestedRoute:decoderData:", v113, v12->_decoderData);
    v12->_selectedSegmentIndex = 0x7FFFFFFFFFFFFFFFLL;
    -[GEOComposedRoute _initializeManeuverDisplaySteps](v12, "_initializeManeuverDisplaySteps");
    v97 = objc_alloc_init(GEOComposedRouteMutableData);
    mutableData = v12->_mutableData;
    v12->_mutableData = v97;

    -[GEOComposedRouteMutableData initializeForRoute:](v12->_mutableData, "initializeForRoute:", v12);
    -[NSArray firstObject](v12->_legs, "firstObject");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "origin");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    if (v100)
    {
      -[NSArray lastObject](v12->_legs, "lastObject");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "destination");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v103 = v102 == 0;

      if (!v103)
      {
        v11 = v12;
LABEL_59:

        self = v12;
        v9 = obj;
LABEL_60:

        goto LABEL_61;
      }
    }
    else
    {

    }
    GEOGetGEOComposedRouteLog();
    v104 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
    {
      -[NSArray firstObject](v12->_legs, "firstObject");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "origin");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray lastObject](v12->_legs, "lastObject");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "destination");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109376;
      v124 = v106 != 0;
      v125 = 1024;
      v126 = v108 != 0;
      _os_log_impl(&dword_1885A9000, v104, OS_LOG_TYPE_ERROR, "GEOComposedRoute was built without a proper origin and destination. This is an error with the route builder. Origin: %d, Destination: %d", buf, 0xEu);

    }
    v11 = 0;
    goto LABEL_59;
  }
  v11 = 0;
LABEL_61:

  return v11;
}

- (GEOComposedRoute)initWithSuggestedRoute:(id)a3 initializerData:(id)a4 updateRequest:(id)a5
{
  id v8;
  id v9;
  id v10;
  GEOComposedRoute *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[GEOComposedRoute initWithSuggestedRoute:initializerData:](self, "initWithSuggestedRoute:initializerData:", v8, v9);
  -[GEOComposedRoute updateTransitRouteUpdateRequest:](v11, "updateTransitRouteUpdateRequest:", v10);

  return v11;
}

- (GEOComposedRoute)initWithSuggestedRoute:(id)a3 initializerData:(id)a4 uniqueRouteID:(id)a5
{
  id v9;
  GEOComposedRoute *v10;
  GEOComposedRoute *v11;

  v9 = a5;
  v10 = -[GEOComposedRoute initWithSuggestedRoute:initializerData:](self, "initWithSuggestedRoute:initializerData:", a3, a4);
  v11 = v10;
  if (v9)
  {
    objc_storeStrong((id *)&v10->_uniqueRouteID, a5);
    objc_storeStrong((id *)&v11->_revisionIdentifier, a5);
  }

  return v11;
}

- (void)_initOtherRouteFeatures:(id)a3 initializerData:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  GEOComposedRouteETAUPosition *v15;
  NSArray *v16;
  NSArray *etauPositions;
  GEORouteRestrictionZoneInfo *v18;
  GEORouteRestrictionZoneInfo *restrictionZoneInfo;
  id *v20;
  id v21;
  void *v22;
  id obj;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v21 = a4;
  v22 = v6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v6, "routeLegs");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v8)
  {
    v26 = 0;
    v24 = *(_QWORD *)v32;
    do
    {
      v9 = 0;
      v25 = v8;
      do
      {
        if (*(_QWORD *)v32 != v24)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v9);
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        objc_msgSend(v10, "updateLocations");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v12)
        {
          v13 = *(_QWORD *)v28;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v28 != v13)
                objc_enumerationMutation(v11);
              v15 = -[GEOComposedRouteETAUPosition initWithComposedRoute:andUpdateLocation:offset:]([GEOComposedRouteETAUPosition alloc], "initWithComposedRoute:andUpdateLocation:offset:", self, *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i), (double)v26);
              objc_msgSend(v7, "addObject:", v15);

            }
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          }
          while (v12);
        }

        v26 += objc_msgSend(v10, "distance");
        ++v9;
      }
      while (v9 != v25);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v8);
  }

  objc_msgSend(v7, "sortedArrayUsingSelector:", sel_compare_);
  v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
  etauPositions = self->_etauPositions;
  self->_etauPositions = v16;

  if (objc_msgSend(v22, "hasRestrictionZoneInfo"))
  {
    v18 = -[GEORouteRestrictionZoneInfo initWithGeoWaypointRoute:]([GEORouteRestrictionZoneInfo alloc], "initWithGeoWaypointRoute:", v22);
    restrictionZoneInfo = self->_restrictionZoneInfo;
    self->_restrictionZoneInfo = v18;

  }
  -[GEOComposedRoute _initAdvisoriesForRoute:initializerData:](self, "_initAdvisoriesForRoute:initializerData:", v22, v21);
  objc_msgSend(v21, "anchorPoints");
  v20 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOComposedRouteAnchorPointList updateWithRoute:](v20, self);
  -[GEOComposedRoute setAnchorPoints:](self, "setAnchorPoints:", v20);

}

- (void)_initAdvisoriesForRoute:(id)a3 initializerData:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  GEOComposedRouteAdvisory *v16;
  void *v17;
  GEOComposedRouteAdvisory *v18;
  NSArray *advisories;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "routePlanningInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "advisoriesInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "genericAdvisorys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (NSArray *)objc_opt_new();
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v4, "routePlanningInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "advisoriesInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "genericAdvisorys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v22;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v11);
          v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v14);
          v16 = [GEOComposedRouteAdvisory alloc];
          objc_msgSend(v4, "incidentsOnRouteLegs");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = -[GEOComposedRouteAdvisory initWithGeoAdvisoryNotice:incidents:](v16, "initWithGeoAdvisoryNotice:incidents:", v15, v17);
          -[NSArray addObject:](v8, "addObject:", v18);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v12);
    }

    advisories = self->_advisories;
    self->_advisories = v8;

  }
}

- (void)_initStringsForTransitRouteDisplayStrings:(id)a3
{
  void *v4;
  GEOComposedString *v5;
  void *v6;
  GEOComposedString *v7;
  GEOComposedString *previewDurationString;
  GEOServerFormattedString *v9;
  GEOServerFormattedString *previewDurationFormatString;
  void *v11;
  GEOComposedString *v12;
  void *v13;
  GEOComposedString *v14;
  GEOComposedString *pickingDurationString;
  GEOServerFormattedString *v16;
  GEOServerFormattedString *pickingDurationFormatString;
  void *v18;
  GEOComposedString *v19;
  void *v20;
  GEOComposedString *v21;
  GEOComposedString *planningDescriptionString;
  GEOServerFormattedString *v23;
  GEOServerFormattedString *planningDescriptionFormatString;
  void *v25;
  GEOComposedString *v26;
  void *v27;
  GEOComposedString *v28;
  GEOComposedString *transitDescriptionString;
  GEOServerFormattedString *v30;
  GEOServerFormattedString *transitDescriptionFormatString;
  void *v32;
  GEOComposedString *v33;
  void *v34;
  GEOComposedString *v35;
  GEOComposedString *transitRouteBadgeString;
  GEOServerFormattedString *v37;
  GEOServerFormattedString *transitRouteBadge;
  id v39;

  v39 = a3;
  objc_msgSend(v39, "duration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = [GEOComposedString alloc];
    objc_msgSend(v39, "duration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[GEOComposedString initWithGeoFormattedString:](v5, "initWithGeoFormattedString:", v6);
    previewDurationString = self->_previewDurationString;
    self->_previewDurationString = v7;

    objc_msgSend(v39, "duration");
    v9 = (GEOServerFormattedString *)objc_claimAutoreleasedReturnValue();
    previewDurationFormatString = self->_previewDurationFormatString;
    self->_previewDurationFormatString = v9;

  }
  objc_msgSend(v39, "durationList");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = [GEOComposedString alloc];
    objc_msgSend(v39, "durationList");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[GEOComposedString initWithGeoFormattedString:](v12, "initWithGeoFormattedString:", v13);
    pickingDurationString = self->_pickingDurationString;
    self->_pickingDurationString = v14;

    objc_msgSend(v39, "durationList");
    v16 = (GEOServerFormattedString *)objc_claimAutoreleasedReturnValue();
    pickingDurationFormatString = self->_pickingDurationFormatString;
    self->_pickingDurationFormatString = v16;

  }
  objc_msgSend(v39, "planningDescription");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = [GEOComposedString alloc];
    objc_msgSend(v39, "planningDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[GEOComposedString initWithGeoFormattedString:](v19, "initWithGeoFormattedString:", v20);
    planningDescriptionString = self->_planningDescriptionString;
    self->_planningDescriptionString = v21;

    objc_msgSend(v39, "planningDescription");
    v23 = (GEOServerFormattedString *)objc_claimAutoreleasedReturnValue();
    planningDescriptionFormatString = self->_planningDescriptionFormatString;
    self->_planningDescriptionFormatString = v23;

  }
  objc_msgSend(v39, "travelDescription");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v26 = [GEOComposedString alloc];
    objc_msgSend(v39, "travelDescription");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[GEOComposedString initWithGeoFormattedString:](v26, "initWithGeoFormattedString:", v27);
    transitDescriptionString = self->_transitDescriptionString;
    self->_transitDescriptionString = v28;

    objc_msgSend(v39, "travelDescription");
    v30 = (GEOServerFormattedString *)objc_claimAutoreleasedReturnValue();
    transitDescriptionFormatString = self->_transitDescriptionFormatString;
    self->_transitDescriptionFormatString = v30;

  }
  objc_msgSend(v39, "badge");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    v33 = [GEOComposedString alloc];
    objc_msgSend(v39, "badge");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[GEOComposedString initWithGeoFormattedString:](v33, "initWithGeoFormattedString:", v34);
    transitRouteBadgeString = self->_transitRouteBadgeString;
    self->_transitRouteBadgeString = v35;

    objc_msgSend(v39, "badge");
    v37 = (GEOServerFormattedString *)objc_claimAutoreleasedReturnValue();
    transitRouteBadge = self->_transitRouteBadge;
    self->_transitRouteBadge = v37;

  }
}

- (void)_ingestRouteBuilderOutput:(id)a3
{
  id v4;
  GEOComposedRouteCoordinateArray *v5;
  GEOComposedRouteCoordinateArray *coordinates;
  void *v7;
  NSArray *v8;
  NSArray *legs;
  void *v10;
  NSArray *v11;
  NSArray *segments;
  void *v13;
  NSArray *v14;
  NSArray *steps;
  void *v16;
  NSArray *v17;
  NSArray *composedGuidanceEvents;
  NSArray *v19;
  NSArray *enrouteNotices;
  void *v21;
  NSArray *v22;
  NSArray *sections;
  void *v24;
  GEOMapRegion *v25;
  GEOMapRegion *boundingMapRegion;
  double v27;
  GEOElevationProfile *v28;
  GEOElevationProfile *elevationProfile;
  GEOComposedRouteCellularCoverage *v30;
  GEOComposedRouteCellularCoverage *cellularCoverage;
  NSArray *v32;
  NSArray *visualInfos;
  NSArray *v34;
  NSArray *visualInfosForRouteNameLabels;
  NSArray *v36;
  NSArray *cameraInfos;
  id v38;

  v4 = a3;
  if (v4)
  {
    v38 = v4;
    objc_msgSend(v4, "coordinatesArray");
    v5 = (GEOComposedRouteCoordinateArray *)objc_claimAutoreleasedReturnValue();
    coordinates = self->_coordinates;
    self->_coordinates = v5;

    objc_msgSend(v38, "legs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (NSArray *)objc_msgSend(v7, "copy");
    legs = self->_legs;
    self->_legs = v8;

    objc_msgSend(v38, "segments");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (NSArray *)objc_msgSend(v10, "copy");
    segments = self->_segments;
    self->_segments = v11;

    objc_msgSend(v38, "steps");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (NSArray *)objc_msgSend(v13, "copy");
    steps = self->_steps;
    self->_steps = v14;

    objc_msgSend(v38, "guidanceEvents");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (NSArray *)objc_msgSend(v16, "copy");
    composedGuidanceEvents = self->_composedGuidanceEvents;
    self->_composedGuidanceEvents = v17;

    objc_msgSend(v38, "enrouteNotices");
    v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
    enrouteNotices = self->_enrouteNotices;
    self->_enrouteNotices = v19;

    self->_usesZilch = -[GEOComposedRouteCoordinateArray usesZilch](self->_coordinates, "usesZilch");
    self->_elevationModel = objc_msgSend(v38, "elevationModel");
    self->_source = objc_msgSend(v38, "source");
    objc_msgSend(v38, "pointSections");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (NSArray *)objc_msgSend(v21, "copy");
    sections = self->_sections;
    self->_sections = v22;

    objc_msgSend(v38, "boundingMapRegion");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (GEOMapRegion *)objc_msgSend(v24, "copy");
    boundingMapRegion = self->_boundingMapRegion;
    self->_boundingMapRegion = v25;

    objc_msgSend(v38, "distance");
    self->_distance = v27;
    objc_msgSend(v38, "elevationProfile");
    v28 = (GEOElevationProfile *)objc_claimAutoreleasedReturnValue();
    elevationProfile = self->_elevationProfile;
    self->_elevationProfile = v28;

    self->_totalAscent = (float)-[GEOElevationProfile sumElevationGainCm](self->_elevationProfile, "sumElevationGainCm")
                       * 0.01;
    self->_totalDescent = (float)-[GEOElevationProfile sumElevationLossCm](self->_elevationProfile, "sumElevationLossCm")* 0.01;
    objc_msgSend(v38, "cellularCoverage");
    v30 = (GEOComposedRouteCellularCoverage *)objc_claimAutoreleasedReturnValue();
    cellularCoverage = self->_cellularCoverage;
    self->_cellularCoverage = v30;

    objc_msgSend(v38, "visualInfos");
    v32 = (NSArray *)objc_claimAutoreleasedReturnValue();
    visualInfos = self->_visualInfos;
    self->_visualInfos = v32;

    objc_msgSend(v38, "visualInfosForRouteNameLabels");
    v34 = (NSArray *)objc_claimAutoreleasedReturnValue();
    visualInfosForRouteNameLabels = self->_visualInfosForRouteNameLabels;
    self->_visualInfosForRouteNameLabels = v34;

    objc_msgSend(v38, "cameraInfos");
    v36 = (NSArray *)objc_claimAutoreleasedReturnValue();
    cameraInfos = self->_cameraInfos;
    self->_cameraInfos = v36;

    v4 = v38;
  }

}

- (void)_populateArtworkForSuggestedRoute:(id)a3 decoderData:(id)a4
{
  id v5;
  void *v6;
  char BOOL;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t k;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  unsigned int v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t m;
  void *v26;
  NSArray *v27;
  NSArray *routePlanningArtworks;
  id v30;
  id obj;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t i;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t j;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  int v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  _BYTE v58[128];
  void *v59;
  uint8_t buf[4];
  unint64_t v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v5 = a4;
  if (!v5)
  {
    +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isInternalInstall"))
    {
      BOOL = GEOConfigGetBOOL(GeoServicesConfig_ShouldRecoverFromMissingDecoderData, (uint64_t)off_1EDF4CEB8);

      if ((BOOL & 1) != 0)
        goto LABEL_53;
    }
    else
    {

    }
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  objc_msgSend(v30, "routePlanningArtworks");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
  if (v32)
  {
    v33 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v54 != v33)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "clustersCount"))
        {
          v51 = 0u;
          v52 = 0u;
          v49 = 0u;
          v50 = 0u;
          objc_msgSend(v8, "clusters");
          v38 = (id)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v49, v63, 16);
          if (v37)
          {
            v36 = *(_QWORD *)v50;
            do
            {
              for (j = 0; j != v37; ++j)
              {
                if (*(_QWORD *)v50 != v36)
                  objc_enumerationMutation(v38);
                v10 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
                if (objc_msgSend(v10, "artworkItemsCount"))
                {
                  v47 = 0u;
                  v48 = 0u;
                  v45 = 0u;
                  v46 = 0u;
                  objc_msgSend(v10, "artworkItems");
                  v11 = (void *)objc_claimAutoreleasedReturnValue();
                  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v45, v62, 16);
                  if (v12)
                  {
                    v13 = *(_QWORD *)v46;
                    do
                    {
                      for (k = 0; k != v12; ++k)
                      {
                        if (*(_QWORD *)v46 != v13)
                          objc_enumerationMutation(v11);
                        v15 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * k);
                        if (objc_msgSend(v15, "hasArtworkIndex"))
                        {
                          v44 = objc_msgSend(v15, "artworkIndex");
                          objc_msgSend(v5, "artworkFromIndices:count:", &v44, 1);
                          v16 = (void *)objc_claimAutoreleasedReturnValue();
                          if (v16)
                          {
                            objc_msgSend(v9, "addObject:", v16);
                          }
                          else
                          {
                            GEOFindOrCreateLog("com.apple.GeoServices", "GEOComposedRoute");
                            v18 = (id)objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                            {
                              v19 = objc_msgSend(v15, "artworkIndex");
                              *(_DWORD *)buf = 134217984;
                              v61 = v19;
                              _os_log_impl(&dword_1885A9000, v18, OS_LOG_TYPE_ERROR, "artworkCluster is nil for artworkIndex: %lu", buf, 0xCu);
                            }

                          }
                        }
                        else
                        {
                          v59 = v15;
                          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
                          v17 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v9, "addObject:", v17);

                        }
                      }
                      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v45, v62, 16);
                    }
                    while (v12);
                  }
                }
                else
                {
                  objc_msgSend(v5, "artworkFromIndices:count:", objc_msgSend(v10, "artworkIndexs"), objc_msgSend(v10, "artworkIndexsCount"));
                  v11 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v11)
                  {
                    objc_msgSend(v9, "addObject:", v11);
                  }
                  else
                  {
                    GEOFindOrCreateLog("com.apple.GeoServices", "GEOComposedRoute");
                    v20 = (id)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                    {
                      objc_msgSend(v10, "_maps_artworkIndicesAsString");
                      v21 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412290;
                      v61 = (unint64_t)v21;
                      _os_log_impl(&dword_1885A9000, v20, OS_LOG_TYPE_ERROR, "artworkCluster is nil for artworkIndices: %@", buf, 0xCu);

                    }
                    v11 = 0;
                  }
                }

              }
              v37 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v49, v63, 16);
            }
            while (v37);
          }
        }
        else
        {
          objc_msgSend(v5, "artworkFromIndices:count:", objc_msgSend(v8, "artworkIndexs"), objc_msgSend(v8, "artworkIndexsCount"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = 0u;
          v43 = 0u;
          v40 = 0u;
          v41 = 0u;
          v38 = v22;
          v23 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v40, v58, 16);
          if (v23)
          {
            v24 = *(_QWORD *)v41;
            do
            {
              for (m = 0; m != v23; ++m)
              {
                if (*(_QWORD *)v41 != v24)
                  objc_enumerationMutation(v38);
                v57 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * m);
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "addObject:", v26);

              }
              v23 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v40, v58, 16);
            }
            while (v23);
          }

        }
        objc_msgSend(v34, "addObject:", v9);

      }
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
    }
    while (v32);
  }

  v27 = (NSArray *)objc_msgSend(v34, "copy");
  routePlanningArtworks = self->_routePlanningArtworks;
  self->_routePlanningArtworks = v27;

LABEL_53:
}

- (void)_enumerateAllStepsWithBlock:(id)a3
{
  void (**v4)(id, void *, uint64_t, char *);
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unsigned int v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t i;
  unsigned int v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSArray *steps;
  id v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  void (**v28)(id, void *, uint64_t, char *);
  char v29;

  v4 = (void (**)(id, void *, uint64_t, char *))a3;
  if (v4)
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", -[GEOTransitDecoderData stepsCount](self->_decoderData, "stepsCount"));
    if (-[GEOComposedRoute supportsRideClusters](self, "supportsRideClusters"))
    {
      -[GEOComposedRoute sectionOptionForTripIndex:](self, "sectionOptionForTripIndex:", 0);
      v5 = objc_claimAutoreleasedReturnValue();
      v29 = 0;
      if (v5)
      {
        v6 = (void *)v5;
        v7 = 0;
        while (1)
        {
          -[GEOComposedRoute rideSelections](self, "rideSelections");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectAtIndexedSubscript:", v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "unsignedIntegerValue");

          v11 = v10 >= objc_msgSend(v6, "sectionsCount")
              ? objc_msgSend(v6, "defaultSectionIndex")
              : objc_msgSend(v6, "sectionAtIndex:", v10);
          v12 = v11;
          -[GEOComposedRoute suggestedRoute](self, "suggestedRoute");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "sectionsCount") <= (unint64_t)v12)
          {
            v15 = 0;
          }
          else
          {
            -[GEOComposedRoute suggestedRoute](self, "suggestedRoute");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "sectionAtIndex:", v12);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

          }
          for (i = 0; i < objc_msgSend(v15, "stepIndexsCount"); ++i)
          {
            v17 = objc_msgSend(v15, "stepIndexAtIndex:", i);
            -[GEOTransitDecoderData steps](self->_decoderData, "steps");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v17;
            if (objc_msgSend(v18, "count") <= (unint64_t)v17)
            {

              v21 = 0;
            }
            else
            {
              -[GEOTransitDecoderData steps](self->_decoderData, "steps");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "objectAtIndex:", v19);
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              if (v21)
              {
                objc_msgSend(v25, "addObject:", v21);
                v4[2](v4, v21, v19, &v29);
                if (v29)
                {

                  break;
                }
              }
            }

          }
          if (v29)
            break;
          -[GEOComposedRoute sectionOptionForTripIndex:](self, "sectionOptionForTripIndex:", ++v7);
          v22 = objc_claimAutoreleasedReturnValue();

          v6 = (void *)v22;
          if (!v22)
            goto LABEL_23;
        }

      }
    }
LABEL_23:
    steps = self->_steps;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __48__GEOComposedRoute__enumerateAllStepsWithBlock___block_invoke;
    v26[3] = &unk_1E1C05B70;
    v24 = v25;
    v27 = v24;
    v28 = v4;
    -[NSArray enumerateObjectsUsingBlock:](steps, "enumerateObjectsUsingBlock:", v26);

  }
}

void __48__GEOComposedRoute__enumerateAllStepsWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "transitStep");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)dealloc
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = self->_steps;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v17;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v6++), "setComposedRoute:", 0);
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v4);
  }

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = self->_segments;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10++), "setComposedRoute:", 0);
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
    }
    while (v8);
  }

  v11.receiver = self;
  v11.super_class = (Class)GEOComposedRoute;
  -[GEOComposedRoute dealloc](&v11, sel_dealloc);
}

- (BOOL)_MapsCarPlay_isEqual:(id)a3
{
  id v4;
  void *v5;
  NSUUID *uniqueRouteID;
  void *v7;
  char v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    uniqueRouteID = self->_uniqueRouteID;
    objc_msgSend(v4, "uniqueRouteID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NSUUID isEqual:](uniqueRouteID, "isEqual:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)registerObserver:(id)a3
{
  id v4;
  GEOObserverHashTable *observers;
  GEOObserverHashTable *v6;
  GEOObserverHashTable *v7;
  id v8;

  v4 = a3;
  observers = self->_observers;
  v8 = v4;
  if (!observers)
  {
    v6 = -[GEOObserverHashTable initWithProtocol:queue:]([GEOObserverHashTable alloc], "initWithProtocol:queue:", &unk_1EE046B48, 0);
    v7 = self->_observers;
    self->_observers = v6;

    observers = self->_observers;
    v4 = v8;
  }
  -[GEOObserverHashTable registerObserver:](observers, "registerObserver:", v4);

}

- (void)unregisterObserver:(id)a3
{
  -[GEOObserverHashTable unregisterObserver:](self->_observers, "unregisterObserver:", a3);
}

- (GEORouteInitializerData)routeInitializerData
{
  return self->_routeInitializerData;
}

- (GEORouteAttributes)routeAttributes
{
  return self->_routeAttributes;
}

- (unint64_t)indexOfSuggestedRoute
{
  return self->_indexInResponse;
}

- (BOOL)isNewProtocolRoute
{
  return self->_geoWaypointRoute != 0;
}

- (double)chargingDuration
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  uint64_t i;
  double v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_legs;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    v5 = 0.0;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "chargingDuration", (_QWORD)v9);
        v5 = v5 + v7;
      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v3);
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (double)travelAndChargingDuration
{
  unint64_t v2;
  double v3;
  double v4;

  LODWORD(v2) = self->_expectedTime;
  v3 = (double)v2;
  -[GEOComposedRoute chargingDuration](self, "chargingDuration");
  return v4 + v3;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *name;
  id v6;

  v6 = a3;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  name = self->_name;
  self->_name = v4;

}

- (void)setUserProvidedName:(id)a3
{
  NSString *v4;
  NSString *userProvidedName;
  id v6;

  v6 = a3;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  userProvidedName = self->_userProvidedName;
  self->_userProvidedName = v4;

}

- (void)setUserProvidedNotes:(id)a3
{
  NSString *v4;
  NSString *userProvidedNotes;
  id v6;

  v6 = a3;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  userProvidedNotes = self->_userProvidedNotes;
  self->_userProvidedNotes = v4;

}

- (void)setStorageID:(id)a3
{
  objc_storeStrong((id *)&self->_storageID, a3);
}

- (void)setTourIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_tourIdentifier, a3);
}

- (void)setTourMuid:(unint64_t)a3
{
  self->_tourMuid = a3;
}

- (void)setDisclaimerText:(id)a3
{
  NSString *v4;
  NSString *disclaimerText;
  id v6;

  v6 = a3;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  disclaimerText = self->_disclaimerText;
  self->_disclaimerText = v4;

}

- (void)setDisclaimerURL:(id)a3
{
  GEOPDURLData *v4;
  GEOPDURLData *disclaimerURL;
  id v6;

  v6 = a3;
  v4 = (GEOPDURLData *)objc_msgSend(v6, "copy");
  disclaimerURL = self->_disclaimerURL;
  self->_disclaimerURL = v4;

}

- (void)setDistance:(double)a3
{
  self->_distance = a3;
}

- (void)setTotalAscent:(double)a3
{
  self->_totalAscent = a3;
}

- (void)setTotalDescent:(double)a3
{
  self->_totalDescent = a3;
}

- (void)setTransportType:(int)a3
{
  self->_transportType = a3;
}

- (double)pointLength
{
  double result;

  if (-[GEOComposedRouteCoordinateArray coordinateCount](self->_coordinates, "coordinateCount") < 2)
    return 0.0;
  -[GEOComposedRouteCoordinateArray distanceFromStartToIndex:](self->_coordinates, "distanceFromStartToIndex:", -[GEOComposedRouteCoordinateArray coordinateCount](self->_coordinates, "coordinateCount") - 1);
  return result;
}

- (id)coordinates
{
  return self->_coordinates;
}

- (void)setIsWalkingOnlyTransitRoute:(BOOL)a3
{
  self->_isWalkingOnlyTransitRoute = a3;
}

- (BOOL)isEVRoute
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_steps;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "evInfo", (_QWORD)v9);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6 == 0;

        if (!v7)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)firstEVStep
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  BOOL v8;
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
  -[GEOComposedRoute steps](self, "steps", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v6, "evInfo");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7 == 0;

        if (!v8)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)lastEVStep
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[GEOComposedRoute steps](self, "steps", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reverseObjectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v7, "evInfo");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8 == 0;

        if (!v9)
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)lastEVStepInLegWithIndex:(unint64_t)a3
{
  void *v4;
  int64_t i;
  void *v6;
  void *v7;
  void *v8;

  -[NSArray objectAtIndexedSubscript:](self->_legs, "objectAtIndexedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = objc_msgSend(v4, "endStepIndex"); i >= objc_msgSend(v4, "startStepIndex"); --i)
  {
    if ((i & 0x8000000000000000) == 0 && i < (int64_t)-[GEOComposedRoute stepsCount](self, "stepsCount"))
    {
      -[GEOComposedRoute steps](self, "steps");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "evInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        goto LABEL_9;

    }
  }
  v7 = 0;
LABEL_9:

  return v7;
}

- (GEOComposedWaypoint)origin
{
  void *v2;
  void *v3;

  -[NSArray firstObject](self->_legs, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "origin");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOComposedWaypoint *)v3;
}

- (GEOComposedWaypoint)destination
{
  void *v2;
  void *v3;

  -[NSArray lastObject](self->_legs, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "destination");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOComposedWaypoint *)v3;
}

- (NSArray)waypoints
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!-[NSArray count](self->_legs, "count"))
    return (NSArray *)0;
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_legs;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v7), "origin", (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  -[NSArray lastObject](self->_legs, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "destination");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  return (NSArray *)v3;
}

- (id)waypointsFromRouteCoordinate:(PolylineCoordinate)a3
{
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->_legs;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "endRouteCoordinate", (_QWORD)v15);
        if (a3.index >= v11 && (a3.index != (_DWORD)v11 || a3.offset > *((float *)&v11 + 1)))
          continue;
        objc_msgSend(v10, "destination");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v13);

      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v5;
}

- (id)waypointDisplayInfoForWaypoint:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "displayInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = self->_legs;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v12, "origin", (_QWORD)v17);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqual:", v4);

          if (v14)
          {
            objc_msgSend(v12, "originDisplayInfo");
            v7 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_13;
          }
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v9)
          continue;
        break;
      }
    }

    -[NSArray lastObject](self->_legs, "lastObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "destinationDisplayInfo");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_13:

  return v7;
}

- (void)setHikeTypeString:(id)a3
{
  objc_storeStrong((id *)&self->_hikeTypeString, a3);
}

- (void)setCoordinates:(id)a3
{
  objc_storeStrong((id *)&self->_coordinates, a3);
}

- (void)setAnchorPoints:(id)a3
{
  GEOComposedRouteAnchorPointList *v4;
  GEOComposedRouteAnchorPointList *anchorPoints;
  id v6;

  v6 = a3;
  v4 = (GEOComposedRouteAnchorPointList *)objc_msgSend(v6, "copy");
  anchorPoints = self->_anchorPoints;
  self->_anchorPoints = v4;

}

- (void)setLegs:(id)a3
{
  objc_storeStrong((id *)&self->_legs, a3);
}

- (void)setSegments:(id)a3
{
  objc_storeStrong((id *)&self->_segments, a3);
}

- (void)setComposedGuidanceEvents:(id)a3
{
  objc_storeStrong((id *)&self->_composedGuidanceEvents, a3);
}

- (void)setSteps:(id)a3
{
  objc_storeStrong((id *)&self->_steps, a3);
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (void)setBoundingMapRegion:(id)a3
{
  objc_storeStrong((id *)&self->_boundingMapRegion, a3);
}

- (void)setIsNavigable:(BOOL)a3
{
  self->_isNavigable = a3;
}

- (void)setAddress:(id)a3
{
  objc_storeStrong((id *)&self->_address, a3);
}

- (void)setElevationProfile:(id)a3
{
  objc_storeStrong((id *)&self->_elevationProfile, a3);
}

- (void)setElevationModel:(int)a3
{
  self->_elevationModel = a3;
}

- (void)setVisualInfos:(id)a3
{
  NSArray *v4;
  NSArray *visualInfos;
  id v6;

  v6 = a3;
  v4 = (NSArray *)objc_msgSend(v6, "copy");
  visualInfos = self->_visualInfos;
  self->_visualInfos = v4;

}

- (void)setVisualInfosForRouteNameLabels:(id)a3
{
  NSArray *v4;
  NSArray *visualInfosForRouteNameLabels;
  id v6;

  v6 = a3;
  v4 = (NSArray *)objc_msgSend(v6, "copy");
  visualInfosForRouteNameLabels = self->_visualInfosForRouteNameLabels;
  self->_visualInfosForRouteNameLabels = v4;

}

- (NSArray)routeDescriptions
{
  return 0;
}

- (unint64_t)numberOfTransitStops
{
  void *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[GEOComposedRoute segments](self, "segments", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v3 += objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "numberOfTransitStops");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  return v3;
}

- (NSArray)baseTransitFares
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[GEOComposedRoute suggestedRoute](self, "suggestedRoute");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "stepsCount"));

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[GEOComposedRoute suggestedRoute](self, "suggestedRoute", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "steps");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v11, "hasBaseFare"))
        {
          objc_msgSend(v11, "baseFare");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12 == 0;

          if (!v13)
          {
            objc_msgSend(v11, "baseFare");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v14);

          }
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  v15 = (void *)objc_msgSend(v5, "copy");
  return (NSArray *)v15;
}

- (BOOL)hasInitialPromptType:(int)a3
{
  return (self->_initialPromptTypes & (1 << a3)) != 0;
}

- (GEOComposedRouteMutableData)mutableData
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__15;
  v8 = __Block_byref_object_dispose__15;
  v9 = 0;
  geo_isolate_sync();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (GEOComposedRouteMutableData *)v2;
}

void __31__GEOComposedRoute_mutableData__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 608));
}

- (void)setMutableData:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  geo_isolate_sync();

}

void __35__GEOComposedRoute_setMutableData___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 608), *(id *)(a1 + 40));
}

- (GEOComposedGeometryRoutePersistentData)persistentData
{
  void *v3;
  GEORawRouteGeometry *v4;
  GEORawRouteGeometry *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_new();
  if (self->_geoWaypointRoute)
  {
    v4 = -[GEORawRouteGeometry initWithGeoWaypointRoute:]([GEORawRouteGeometry alloc], "initWithGeoWaypointRoute:", self->_geoWaypointRoute);
  }
  else
  {
    -[GEOComposedRouteCoordinateArray rawRouteGeometry](self->_coordinates, "rawRouteGeometry");
    v4 = (GEORawRouteGeometry *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  objc_msgSend(v3, "setRawRouteGeometry:", v4);
  objc_msgSend(v3, "setAnchorPoints:", self->_anchorPoints);
  objc_msgSend(v3, "setAddress:", self->_address);
  objc_msgSend(v3, "setBoundingMapRegion:", self->_boundingMapRegion);
  objc_msgSend(v3, "setDistance:", self->_distance);
  LODWORD(v6) = self->_expectedTime;
  objc_msgSend(v3, "setDuration:", (double)v6);
  objc_msgSend(v3, "setElevationProfile:", self->_elevationProfile);
  -[NSArray _geo_filtered:](self->_visualInfos, "_geo_filtered:", &__block_literal_global_39);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTravelDirectionArrows:", v7);

  objc_msgSend(v3, "setRouteNameLabels:", self->_visualInfosForRouteNameLabels);
  objc_msgSend(v3, "setRouteID:", self->_uniqueRouteID);
  objc_msgSend(v3, "setRouteName:", self->_name);
  objc_msgSend(v3, "setSource:", self->_source);
  objc_msgSend(v3, "setStorageID:", self->_storageID);
  objc_msgSend(v3, "setUserProvidedName:", self->_userProvidedName);
  objc_msgSend(v3, "setUserProvidedNotes:", self->_userProvidedNotes);
  objc_msgSend(v3, "setTourIdentifier:", self->_tourIdentifier);
  objc_msgSend(v3, "setTourMuid:", self->_tourMuid);
  objc_msgSend(v3, "setTransportType:", self->_transportType);
  objc_msgSend(v3, "setDisclaimerText:", self->_disclaimerText);
  objc_msgSend(v3, "setDisclaimerURL:", self->_disclaimerURL);
  if ((self->_source & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    objc_msgSend(v3, "setRouteAttributes:", self->_routeAttributes);
    -[GEOComposedRoute waypoints](self, "waypoints");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setWaypoints:", v8);

  }
  return (GEOComposedGeometryRoutePersistentData *)v3;
}

BOOL __34__GEOComposedRoute_persistentData__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 191;
}

- (NSArray)transitPaymentMethods
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  GEOTransitPaymentMethod *v9;
  GEOTransitPaymentMethod *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[GEOTransitDecoderData paymentMethods](self->_decoderData, "paymentMethods");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v2, "count"));
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v7);
        v9 = [GEOTransitPaymentMethod alloc];
        v10 = -[GEOTransitPaymentMethod initWithPaymentMethod:](v9, "initWithPaymentMethod:", v8, (_QWORD)v13);
        objc_msgSend(v3, "addObject:", v10);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  v11 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v11;
}

- (void)_initializeManeuverDisplaySteps
{
  NSArray *v3;
  NSArray *maneuverDisplaySteps;

  -[GEOComposedRoute steps](self, "steps");
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  maneuverDisplaySteps = self->_maneuverDisplaySteps;
  self->_maneuverDisplaySteps = v3;

}

- (void)setManeuverDisplaySteps:(id)a3
{
  NSArray *v5;
  NSArray *v6;

  v5 = (NSArray *)a3;
  if (self->_maneuverDisplaySteps != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_maneuverDisplaySteps, a3);
    v5 = v6;
  }

}

- (void)setCurrentDisplayStep:(unint64_t)a3
{
  BOOL v3;

  v3 = a3 == 0x7FFFFFFFFFFFFFFFLL || self->_currentDisplayStep == a3;
  if (!v3 && -[NSArray count](self->_maneuverDisplaySteps, "count") > a3)
    self->_currentDisplayStep = a3;
}

- (unsigned)pointCount
{
  return -[GEOComposedRouteCoordinateArray coordinateCount](self->_coordinates, "coordinateCount");
}

- (PolylineCoordinate)startRouteCoordinate
{
  return (PolylineCoordinate)0;
}

- (PolylineCoordinate)endRouteCoordinate
{
  return (PolylineCoordinate)(-[GEOComposedRouteCoordinateArray coordinateCount](self->_coordinates, "coordinateCount")- 1);
}

- (GEOPolylineCoordinateRange)routeCoordinateRange
{
  PolylineCoordinate v3;
  PolylineCoordinate v4;
  PolylineCoordinate v5;
  GEOPolylineCoordinateRange result;

  v3 = -[GEOComposedRoute startRouteCoordinate](self, "startRouteCoordinate");
  v4 = -[GEOComposedRoute endRouteCoordinate](self, "endRouteCoordinate");
  v5 = v3;
  result.end = v4;
  result.start = v5;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)startLocationCoordinate
{
  double v2;
  double v3;
  double v4;
  $1AB5FA073B851C12C2339EC22442E995 result;

  -[GEOComposedRouteCoordinateArray coordinateOnRouteAt:](self->_coordinates, "coordinateOnRouteAt:", 0);
  result.var2 = v4;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)endLocationCoordinate
{
  double v2;
  double v3;
  double v4;
  $1AB5FA073B851C12C2339EC22442E995 result;

  -[GEOComposedRouteCoordinateArray coordinateOnRouteAt:](self->_coordinates, "coordinateOnRouteAt:", -[GEOComposedRouteCoordinateArray coordinateCount](self->_coordinates, "coordinateCount") - 1);
  result.var2 = v4;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (BOOL)usesRoutingPathPoints
{
  return -[GEOComposedRouteCoordinateArray usesRoutingPathPoints](self->_coordinates, "usesRoutingPathPoints");
}

- ($1AB5FA073B851C12C2339EC22442E995)pointAt:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  $1AB5FA073B851C12C2339EC22442E995 result;

  -[GEOComposedRouteCoordinateArray coordinateOnRouteAt:](self->_coordinates, "coordinateOnRouteAt:", a3);
  result.var2 = v5;
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (PolylineCoordinate)coordinateAtOffset:(double)a3
{
  return (PolylineCoordinate)-[GEOComposedRouteCoordinateArray routeCoordinateForDistanceAfterStart:](self->_coordinates, "routeCoordinateForDistanceAfterStart:", a3);
}

- ($1AB5FA073B851C12C2339EC22442E995)pointAtRouteCoordinate:(PolylineCoordinate)a3
{
  double v3;
  double v4;
  double v5;
  $1AB5FA073B851C12C2339EC22442E995 result;

  -[GEOComposedRouteCoordinateArray coordinateForRouteCoordinate:](self->_coordinates, "coordinateForRouteCoordinate:", a3);
  result.var2 = v5;
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (PolylineCoordinate)coordinateAtOffset:(double)a3 fromRoutePoint:(unint64_t)a4
{
  return (PolylineCoordinate)-[GEOComposedRouteCoordinateArray routeCoordinateForDistance:afterRouteCoordinate:](self->_coordinates, "routeCoordinateForDistance:afterRouteCoordinate:", a4, a3);
}

- (PolylineCoordinate)coordinateAtOffset:(double)a3 fromRouteCoordinate:(PolylineCoordinate)a4
{
  return (PolylineCoordinate)-[GEOComposedRouteCoordinateArray routeCoordinateForDistance:afterRouteCoordinate:](self->_coordinates, "routeCoordinateForDistance:afterRouteCoordinate:", a4, a3);
}

- (PolylineCoordinate)routeCoordinateAtDistance:(double)a3 beforeRouteCoordinate:(PolylineCoordinate)a4
{
  uint64_t v4;
  double v7;
  double v8;
  float v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v19;

  LODWORD(v4) = a4.index;
  -[GEOComposedRoute pointAtRouteCoordinate:](self, "pointAtRouteCoordinate:");
  v9 = 0.0;
  if ((v4 & 0x80000000) != 0)
  {
LABEL_6:
    LODWORD(v4) = 0;
  }
  else
  {
    v10 = v7;
    v11 = v8;
    v4 = v4;
    while (1)
    {
      -[GEOComposedRoute pointAt:](self, "pointAt:", v4);
      v13 = v12;
      v15 = v14;
      v16 = GEOCalculateDistanceRadius(v12, v14, v10, v11, 6367000.0);
      a3 = a3 - v16;
      if (a3 <= 0.0)
        break;
      v10 = v13;
      v11 = v15;
      if (v4-- <= 0)
        goto LABEL_6;
    }
    v19 = -a3 / v16;
    if (v19 < 0.0)
      v19 = 0.0;
    if (v19 > 1.0)
      v19 = 1.0;
    v9 = v19;
    if (v9 >= 1.0)
    {
      LODWORD(v4) = vcvtms_u32_f32(v9) + v4;
      v9 = v9 - (float)floorf(v9);
    }
  }
  return (PolylineCoordinate)(v4 | ((unint64_t)LODWORD(v9) << 32));
}

- (double)distanceFromPoint:(PolylineCoordinate)a3 toPoint:(PolylineCoordinate)a4
{
  double v4;
  unsigned int index;
  float offset;
  float v8;
  unsigned int v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  unint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;

  index = a3.index;
  offset = a3.offset;
  *(float *)&v4 = a4.offset;
  if (a4.index < a3.index || a4.index == a3.index && a4.offset < a3.offset)
  {
    v8 = a4.offset;
    v9 = a4.index;
  }
  else
  {
    v8 = a3.offset;
    v9 = a3.index;
    offset = a4.offset;
    index = a4.index;
  }
  v10 = -[GEOComposedRoute pointCount](self, "pointCount", v4);
  -[GEOComposedRoute pointAt:](self, "pointAt:", v9);
  v12 = 0.0;
  v13 = 1.0 / GEOMapPointsPerMeterAtLatitude(v11);
  if (v8 <= 0.0)
  {
    v14 = v9;
  }
  else
  {
    v14 = v9 + 1;
    if (v14 >= v10)
      return v12;
    -[GEOComposedRoute pointAt:](self, "pointAt:", v9);
    v17 = GEOTilePointForCoordinate(v15, v16, 20.0);
    v19 = v18;
    -[GEOComposedRoute pointAt:](self, "pointAt:", v9 + 1);
    v22 = GEOTilePointForCoordinate(v20, v21, 20.0);
    v24 = sqrt((v22 - v17) * (v22 - v17) + (v23 - v19) * (v23 - v19));
    if (v9 == index)
      return v13 * (v24 * (float)(offset - v8));
    v12 = v13 * ((1.0 - v8) * v24);
    ++v9;
  }
  -[GEOComposedRoute pointAt:](self, "pointAt:", v14);
  v27 = GEOTilePointForCoordinate(v25, v26, 20.0);
  v29 = v27;
  v30 = v28;
  v31 = v10 - 1;
  if (v31 >= index)
    v32 = index;
  else
    v32 = v31;
  if (v32 <= v14)
  {
    v38 = v28;
    v36 = v27;
  }
  else
  {
    v33 = v9;
    do
    {
      -[GEOComposedRoute pointAt:](self, "pointAt:", ++v33);
      v36 = GEOTilePointForCoordinate(v34, v35, 20.0);
      v38 = v37;
      v12 = v12 + sqrt((v36 - v29) * (v36 - v29) + (v37 - v30) * (v37 - v30)) * v13;
      v30 = v37;
      v29 = v36;
    }
    while (v32 > v33);
  }
  if (offset > 0.0 && v31 > index)
  {
    -[GEOComposedRoute pointAt:](self, "pointAt:", index + 1);
    v41 = GEOTilePointForCoordinate(v39, v40, 20.0);
    return v12 + sqrt((v41 - v36) * (v41 - v36) + (v42 - v38) * (v42 - v38)) * offset * v13;
  }
  return v12;
}

- (double)distanceFromPointIndex:(unint64_t)a3 toPointIndex:(unint64_t)a4
{
  double v4;
  unint64_t v6;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  unint64_t v14;

  v4 = 0.0;
  if (a3 + 1 <= a4)
  {
    v6 = a3;
    do
    {
      -[GEOComposedRoute pointAt:](self, "pointAt:", v6);
      v9 = v8;
      v11 = v10;
      -[GEOComposedRoute pointAt:](self, "pointAt:", v6 + 1);
      v4 = v4 + GEOCalculateDistanceRadius(v9, v11, v12, v13, 6367000.0);
      v14 = v6 + 2;
      ++v6;
    }
    while (v14 <= a4);
  }
  return v4;
}

- (double)stepDistanceFromPoint:(PolylineCoordinate)a3 toPoint:(PolylineCoordinate)a4
{
  double result;

  -[GEOComposedRouteCoordinateArray distanceBetweenRouteCoordinate:andRouteCoordinate:](self->_coordinates, "distanceBetweenRouteCoordinate:andRouteCoordinate:", a3, a4);
  return result;
}

- (PolylineCoordinate)closestPointOnRoute:(id)a3
{
  PolylineCoordinate v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  uint64_t (*v9)();
  const char *v10;
  unint64_t v11;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3812000000;
  v8 = __Block_byref_object_copy__88;
  v9 = __Block_byref_object_dispose__89;
  v10 = "";
  v11 = 0xBF80000000000000;
  geo_reentrant_isolate_sync();
  v3 = (PolylineCoordinate)v6[6];
  _Block_object_dispose(&v5, 8);
  return v3;
}

void __40__GEOComposedRoute_closestPointOnRoute___block_invoke(uint64_t a1)
{
  GEOLocation *v2;
  void *v3;
  void *v4;
  GEORouteMatcher *v5;

  v5 = -[GEORouteMatcher initWithRoute:auditToken:]([GEORouteMatcher alloc], "initWithRoute:auditToken:", *(_QWORD *)(a1 + 32), 0);
  v2 = -[GEOLocation initWithGEOCoordinate:]([GEOLocation alloc], "initWithGEOCoordinate:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  -[GEORouteMatcher matchToClosestPointOnRouteWithLocation:](v5, "matchToClosestPointOnRouteWithLocation:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48) = objc_msgSend(v3, "routeCoordinate");

}

- (unint64_t)stepsCount
{
  return -[NSArray count](self->_steps, "count");
}

- (id)stepAtIndex:(unint64_t)a3
{
  void *v5;

  if (-[NSArray count](self->_steps, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSArray objectAtIndex:](self->_steps, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)stepForPointIndex:(unsigned int)a3
{
  return -[GEOComposedRoute stepAtIndex:](self, "stepAtIndex:", -[GEOComposedRoute stepIndexForPointIndex:](self, "stepIndexForPointIndex:", a3));
}

- (unint64_t)stepIndexForPointIndex:(unint64_t)a3
{
  unsigned int v3;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  if (-[GEOComposedRoute pointCount](self, "pointCount") <= a3)
    return 0x7FFFFFFFFFFFFFFFLL;
  -[GEOComposedRoute steps](self, "steps");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
    return 0x7FFFFFFFFFFFFFFFLL;
  -[GEOComposedRoute steps](self, "steps");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = 0;
    v10 = *(_QWORD *)v17;
    while (2)
    {
      v11 = 0;
      v12 = v8 + v9;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "endPointIndex", (_QWORD)v16) > v3)
        {
          v14 = v9 + v11;
          v13 = v7;
          goto LABEL_14;
        }
        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v9 = v12;
      if (v8)
        continue;
      break;
    }
  }

  -[GEOComposedRoute steps](self, "steps");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count") - 1;
LABEL_14:

  return v14;
}

- (unint64_t)segmentIndexForPointIndex:(unint64_t)a3
{
  unsigned int v3;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  if (-[GEOComposedRoute pointCount](self, "pointCount") <= a3)
    return 0x7FFFFFFFFFFFFFFFLL;
  -[GEOComposedRoute segments](self, "segments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
    return 0x7FFFFFFFFFFFFFFFLL;
  -[GEOComposedRoute segments](self, "segments");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = 0;
    v10 = *(_QWORD *)v17;
    while (2)
    {
      v11 = 0;
      v12 = v8 + v9;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "endPointIndex", (_QWORD)v16) > v3)
        {
          v14 = v9 + v11;
          v13 = v7;
          goto LABEL_14;
        }
        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v9 = v12;
      if (v8)
        continue;
      break;
    }
  }

  -[GEOComposedRoute segments](self, "segments");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count") - 1;
LABEL_14:

  return v14;
}

- (int)estimatedCellularCoverageForOffset:(double)a3
{
  double v5;
  GEOComposedRouteCellularCoverage *cellularCoverage;

  -[GEOComposedRoute distance](self, "distance");
  if (v5 > a3 && (cellularCoverage = self->_cellularCoverage) != 0)
    return -[GEOComposedRouteCellularCoverage cellularCoverageAtOffset:](cellularCoverage, "cellularCoverageAtOffset:", a3);
  else
    return 0;
}

- (void)enumerateCellularCoverageRangesWithBlock:(id)a3
{
  -[GEOComposedRouteCellularCoverage enumerateCoverageRangesWithBlock:](self->_cellularCoverage, "enumerateCoverageRangesWithBlock:", a3);
}

- (unint64_t)segmentIndexForStepIndex:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v13;
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
  -[GEOComposedRoute segments](self, "segments", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = 0;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      v9 = v5 + v6;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v8), "stepRange");
        if (a3 >= v10 && a3 - v10 < v11)
        {
          v13 = v6 + v8;
          goto LABEL_14;
        }
        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v6 = v9;
    }
    while (v5);
  }
  v13 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_14:

  return v13;
}

- (id)segmentForStepIndex:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[GEOComposedRoute segments](self, "segments", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "stepRange");
        if (a3 >= v9 && a3 - v9 < v10)
        {
          v12 = v8;
          goto LABEL_14;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }
  v12 = 0;
LABEL_14:

  return v12;
}

- (id)segmentForPointIndex:(unsigned int)a3
{
  return -[GEOComposedRoute segmentForStepIndex:](self, "segmentForStepIndex:", -[GEOComposedRoute stepIndexForPointIndex:](self, "stepIndexForPointIndex:", a3));
}

- (unint64_t)legIndexForStepIndex:(unint64_t)a3
{
  unint64_t v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  if (!-[NSArray count](self->_legs, "count"))
    return 0x7FFFFFFFFFFFFFFFLL;
  v5 = 0;
  while (1)
  {
    -[NSArray objectAtIndexedSubscript:](self->_legs, "objectAtIndexedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "stepRange");
    v9 = v8;

    if (a3 >= v7 && a3 - v7 < v9)
      break;
    if (++v5 >= -[NSArray count](self->_legs, "count"))
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v5;
}

- (unint64_t)lastStepIndexOfLegAtStepIndex:(unint64_t)a3
{
  unint64_t v4;
  void *v5;
  unint64_t v6;
  uint8_t v8[16];

  v4 = -[GEOComposedRoute legIndexForStepIndex:](self, "legIndexForStepIndex:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: legIndex != NSNotFound", v8, 2u);
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_legs, "objectAtIndexedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "endStepIndex");

  }
  return v6;
}

- (void)setSelectedSegmentIndex:(unint64_t)a3
{
  unint64_t selectedSegmentIndex;
  NSObject *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  unsigned int v22;
  unint64_t v23;
  unint64_t v24;
  BOOL v25;
  unsigned int v26;
  unint64_t v27;
  unint64_t v28;
  BOOL v29;
  int v30;
  int v31;
  unsigned int v32;
  unint64_t v33;
  unint64_t v34;
  BOOL v35;
  int v36;
  int v37;
  unsigned int v38;
  unint64_t v39;
  unint64_t v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  GEOComposedRoute *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[128];
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  unint64_t v53;
  __int16 v54;
  unint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  selectedSegmentIndex = self->_selectedSegmentIndex;
  if (selectedSegmentIndex == a3)
    return;
  self->_selectedSegmentIndex = a3;
  GEOGetGEOComposedRouteLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    -[GEOComposedRoute uniqueRouteID](self, "uniqueRouteID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = self->_selectedSegmentIndex;
    *(_DWORD *)buf = 138543874;
    v51 = v7;
    v52 = 2048;
    v53 = selectedSegmentIndex;
    v54 = 2048;
    v55 = v8;
    _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_INFO, "%{public}@: Updated selected segment index %lu -> %lu", buf, 0x20u);

  }
  -[GEOComposedRoute segments](self, "segments");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count") <= a3)
  {
    v11 = 0;
  }
  else
  {
    -[GEOComposedRoute segments](self, "segments");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndex:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[GEOComposedRoute segments](self, "segments");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (selectedSegmentIndex >= objc_msgSend(v12, "count"))
  {
    v14 = 0;
  }
  else
  {
    -[GEOComposedRoute segments](self, "segments");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndex:", selectedSegmentIndex);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (!v11)
  {
    v15 = 0;
    if (v14)
      goto LABEL_12;
LABEL_14:
    v16 = 0;
    goto LABEL_15;
  }
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!v14)
    goto LABEL_14;
LABEL_12:
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
LABEL_15:
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v44 = self;
  v17 = self->_sections;
  v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v46 != v19)
          objc_enumerationMutation(v17);
        v21 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        v22 = objc_msgSend(v21, "startPointIndex");
        v23 = objc_msgSend(v11, "pointRange");
        v25 = v22 < v23 || v22 - v23 >= v24;
        if (!v25
          && ((v26 = objc_msgSend(v21, "endPointIndex"), v27 = objc_msgSend(v11, "pointRange"), v26 >= v27)
            ? (v29 = v26 - v27 >= v28)
            : (v29 = 1),
              !v29)
          || !objc_msgSend(v11, "pointCount")
          && (v30 = objc_msgSend(v21, "startPointIndex"), v30 == objc_msgSend(v11, "startPointIndex"))
          && (v31 = objc_msgSend(v21, "endPointIndex"), v31 == objc_msgSend(v11, "endPointIndex")))
        {
          objc_msgSend(v15, "addObject:", v21);
        }
        v32 = objc_msgSend(v21, "startPointIndex");
        v33 = objc_msgSend(v14, "pointRange");
        v35 = v32 < v33 || v32 - v33 >= v34;
        if (v35
          || (v38 = objc_msgSend(v21, "endPointIndex"),
              v39 = objc_msgSend(v14, "pointRange"),
              v38 < v39 || v38 - v39 >= v40))
        {
          if (objc_msgSend(v14, "pointCount"))
            continue;
          v36 = objc_msgSend(v21, "startPointIndex");
          if (v36 != objc_msgSend(v14, "startPointIndex"))
            continue;
          v37 = objc_msgSend(v21, "endPointIndex");
          if (v37 != objc_msgSend(v14, "endPointIndex"))
            continue;
        }
        objc_msgSend(v16, "addObject:", v21);
      }
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    }
    while (v18);
  }

  GEOGetGEOComposedRouteLog();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
  {
    -[GEOComposedRoute uniqueRouteID](v44, "uniqueRouteID");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = -[GEOObserverHashTable count](v44->_observers, "count");
    *(_DWORD *)buf = 138543618;
    v51 = v42;
    v52 = 2048;
    v53 = v43;
    _os_log_impl(&dword_1885A9000, v41, OS_LOG_TYPE_INFO, "%{public}@: Will notify %lu observers of updated selected segment index", buf, 0x16u);

  }
  -[GEOObserverHashTable composedRoute:selectedSections:deselectedSections:](v44->_observers, "composedRoute:selectedSections:deselectedSections:", v44, v15, v16);

}

- (BOOL)hasArrivalMapRegion
{
  return 0;
}

- (GEOMapRegion)arrivalMapRegion
{
  return 0;
}

- (BOOL)hasExpectedTime
{
  return self->_expectedTime != 0;
}

- (void)setExpectedTime:(unsigned int)a3
{
  self->_expectedTime = a3;
}

- (BOOL)hasHistoricTravelTime
{
  return self->_historicTravelTime != 0;
}

- (void)getFormOfWay:(int *)a3 roadClass:(int *)a4 at:(unsigned int)a5
{
  uint64_t i;
  GEOComposedRouteCoordinateArray *coordinates;
  int v10;
  _OWORD v11[2];

  if (a3)
  {
    if (a4)
    {
      LODWORD(i) = a5;
      *a3 = 0;
      *a4 = 9;
      if (-[GEOComposedRouteCoordinateArray usesZilch](self->_coordinates, "usesZilch"))
      {
        for (i = i; i != -1; --i)
        {
          if (*a3)
            break;
          coordinates = self->_coordinates;
          if (coordinates)
            -[GEOComposedRouteCoordinateArray zilchControlPointAt:](coordinates, "zilchControlPointAt:", i);
          else
            memset(v11, 0, sizeof(v11));
          if (!zilch::ControlPoint::dummy((zilch::ControlPoint *)v11))
          {
            v10 = zilch::ControlPoint::formOfWay((zilch::ControlPoint *)v11);
            *a3 = zilch::FormOfWay::type((zilch::FormOfWay *)&v10);
            v10 = zilch::ControlPoint::functionalClass((zilch::ControlPoint *)v11);
            *a4 = zilch::FunctionalClass::toInteger((zilch::FunctionalClass *)&v10);
          }
        }
      }
    }
  }
}

- (int)formOfWayAt:(unsigned int)a3
{
  int v4;
  int v5;

  v5 = 0;
  v4 = 9;
  -[GEOComposedRoute getFormOfWay:roadClass:at:](self, "getFormOfWay:roadClass:at:", &v5, &v4, *(_QWORD *)&a3);
  return v5;
}

- (id)roadFeatureAtPointIndex:(unsigned int)a3
{
  id v3;
  _QWORD v5[5];
  unsigned int v6;
  unsigned int v7;
  int v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__15;
  v13 = __Block_byref_object_dispose__15;
  v14 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__GEOComposedRoute_roadFeatureAtPointIndex___block_invoke;
  v5[3] = &unk_1E1C05C08;
  v5[4] = &v9;
  v6 = a3;
  v7 = a3;
  v8 = 0;
  -[GEOComposedRoute forEachSnappedPath:](self, "forEachSnappedPath:", v5);
  v3 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v3;
}

void __44__GEOComposedRoute_roadFeatureAtPointIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[6];

  v3 = a2;
  v4 = v3;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    v5 = *(_DWORD *)(a1 + 40);
    if (v5 >= objc_msgSend(v3, "routeStartIndex")
      && objc_msgSend(v4, "routeEndIndex") > *(_DWORD *)(a1 + 40))
    {
      v6 = objc_msgSend(v4, "mapMatchingSection");
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __44__GEOComposedRoute_roadFeatureAtPointIndex___block_invoke_2;
      v8[3] = &unk_1E1C05BE0;
      v7 = *(_QWORD *)(a1 + 44);
      v8[4] = *(_QWORD *)(a1 + 32);
      v8[5] = v7;
      (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v6 + 40))(v6, v8);
    }
  }

}

uint64_t __44__GEOComposedRoute_roadFeatureAtPointIndex___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v10;
  uint64_t v11;
  id *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;

  v10 = a6;
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(_QWORD *)(v11 + 40);
  v12 = (id *)(v11 + 40);
  if (!v13)
  {
    v15 = *(_DWORD *)(a1 + 40);
    if (*(_DWORD *)a4 >= v15 && (*(_DWORD *)a4 != v15 || *(float *)(a4 + 4) > *(float *)(a1 + 44))
      || v15 >= *(_DWORD *)a5 && (v15 != *(_DWORD *)a5 || *(float *)(a1 + 44) >= *(float *)(a5 + 4)))
    {
      v14 = 0;
      goto LABEL_11;
    }
    objc_storeStrong(v12, a6);
  }
  v14 = 1;
LABEL_11:

  return v14;
}

- (int)transportTypeForStep:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  int v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[GEOComposedRoute steps](self, "steps");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __41__GEOComposedRoute_transportTypeForStep___block_invoke;
  v12[3] = &unk_1E1C05C30;
  v6 = v4;
  v13 = v6;
  v7 = objc_msgSend(v5, "indexOfObjectPassingTest:", v12);

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 4;
  }
  else
  {
    -[GEOComposedRoute steps](self, "steps");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "transportType");

  }
  return v8;
}

uint64_t __41__GEOComposedRoute_transportTypeForStep___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;

  v6 = a2;
  objc_msgSend(v6, "geoStep");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32));

  *a4 = v8;
  return v8;
}

- (id)zilchDataFromStepIndex:(unint64_t)a3
{
  void *v5;
  void *v6;

  if (-[GEOComposedRouteCoordinateArray usesZilch](self->_coordinates, "usesZilch"))
  {
    -[GEOComposedRoute stepAtIndex:](self, "stepAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOComposedRouteCoordinateArray compressedZilchDataToEndOfPathFromIndex:](self->_coordinates, "compressedZilchDataToEndOfPathFromIndex:", objc_msgSend(v5, "startPointIndex"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)zilchDataArrayToEndOfRouteFromStepIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  unint64_t i;
  GEOComposedRouteCoordinateArray *coordinates;
  void *v10;
  void *v11;
  void *v12;

  if (-[GEOComposedRouteCoordinateArray usesZilch](self->_coordinates, "usesZilch"))
  {
    v5 = (void *)objc_opt_new();
    -[GEOComposedRoute stepAtIndex:](self, "stepAtIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOComposedRouteCoordinateArray compressedZilchDataToEndOfPathFromIndex:](self->_coordinates, "compressedZilchDataToEndOfPathFromIndex:", objc_msgSend(v6, "startPointIndex"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v5, "addObject:", v7);
    for (i = -[GEOComposedRoute legIndexForStepIndex:](self, "legIndexForStepIndex:", a3) + 1;
          i < -[NSArray count](self->_legs, "count");
          ++i)
    {
      coordinates = self->_coordinates;
      -[NSArray objectAtIndexedSubscript:](self->_legs, "objectAtIndexedSubscript:", i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOComposedRouteCoordinateArray compressedZilchDataToEndOfPathFromIndex:](coordinates, "compressedZilchDataToEndOfPathFromIndex:", objc_msgSend(v10, "startPointIndex"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v11);

    }
    v12 = (void *)objc_msgSend(v5, "copy");

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (id)routingPathDataFromStart:(PolylineCoordinate)a3
{
  unint64_t v5;
  void *v6;
  uint64_t i;
  void *v8;
  void *v9;
  PolylineCoordinate v10;
  uint64_t v11;
  double v12;
  double v13;
  void *v14;
  void *v16;
  id v17;

  if (!-[GEOComposedRoute usesRoutingPathPoints](self, "usesRoutingPathPoints"))
    return 0;
  v5 = -[GEOComposedRoute legIndexForRouteCoordinate:](self, "legIndexForRouteCoordinate:", a3);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_legs, "count") - v5 + 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; v5 + i < -[NSArray count](self->_legs, "count"); ++i)
  {
    -[NSArray objectAtIndexedSubscript:](self->_legs, "objectAtIndexedSubscript:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = a3;
    if (i)
      v10 = (PolylineCoordinate)objc_msgSend(v8, "startRouteCoordinate");
    v11 = objc_msgSend(v9, "endRouteCoordinate");
    if ((_DWORD)v11 == v10.index)
    {
      *(float *)&v12 = v10.offset;
      LODWORD(v13) = HIDWORD(v11);
      if (*((float *)&v11 + 1) <= v10.offset)
        goto LABEL_13;
    }
    else if (v11 < v10.index)
    {
      goto LABEL_13;
    }
    -[GEOComposedRouteCoordinateArray routingPathDataWithSupportPointFromStart:toEnd:supportPointsOnly:startPathSegment:](self->_coordinates, "routingPathDataWithSupportPointFromStart:toEnd:supportPointsOnly:startPathSegment:", v10, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      objc_msgSend(v6, "addObject:", v14);

LABEL_13:
  }
  if (objc_msgSend(v6, "count"))
    v16 = v6;
  else
    v16 = 0;
  v17 = v16;

  return v17;
}

- (int)routeType
{
  return -[GEOWaypointRoute type](self->_geoWaypointRoute, "type");
}

- (double)distanceBetweenRoutePointIndex:(unsigned int)a3 toPointIndex:(unsigned int)a4
{
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  unsigned int v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  unsigned int i;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v7 = self->_steps;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v36;
    v10 = 0.0;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v36 != v9)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v11);
        if (objc_msgSend(v12, "endPointIndex") >= a3)
        {
          if (objc_msgSend(v12, "startPointIndex") > a4)
            goto LABEL_25;
          if (objc_msgSend(v12, "startPointIndex") < a3
            && objc_msgSend(v12, "endPointIndex") >= a3)
          {
            -[GEOComposedRoute pointAt:](self, "pointAt:", a3);
            v25 = v24;
            v27 = v26;
            v18 = 0.0;
            for (i = a3 + 1; i <= objc_msgSend(v12, "endPointIndex"); ++i)
            {
              -[GEOComposedRoute pointAt:](self, "pointAt:", i);
              v30 = v29;
              v32 = v31;
              v18 = v18 + GEOCalculateDistanceRadius(v25, v27, v29, v31, 6367000.0);
              v27 = v32;
              v25 = v30;
            }
          }
          else if (objc_msgSend(v12, "startPointIndex") > a4
                 || objc_msgSend(v12, "endPointIndex") <= a4)
          {
            objc_msgSend(v12, "distance");
            v18 = v23;
          }
          else
          {
            -[GEOComposedRoute pointAt:](self, "pointAt:", objc_msgSend(v12, "startPointIndex"));
            v14 = v13;
            v16 = v15;
            v17 = objc_msgSend(v12, "startPointIndex") + 1;
            v18 = 0.0;
            while (v17 <= a4)
            {
              -[GEOComposedRoute pointAt:](self, "pointAt:", v17);
              v20 = v19;
              v22 = v21;
              v18 = v18 + GEOCalculateDistanceRadius(v14, v16, v19, v21, 6367000.0);
              ++v17;
              v16 = v22;
              v14 = v20;
            }
          }
          v10 = v10 + v18;
        }
        ++v11;
      }
      while (v11 != v8);
      v33 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      v8 = v33;
    }
    while (v33);
  }
  else
  {
    v10 = 0.0;
  }
LABEL_25:

  return v10;
}

- (double)distanceBetweenLocation:(id)a3 nextPointIndex:(unsigned int)a4 toPointIndex:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  double var1;
  double var0;
  double v10;
  double v11;
  double v12;
  double v13;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  var1 = a3.var1;
  var0 = a3.var0;
  if (-[GEOComposedRoute pointCount](self, "pointCount") - 1 <= a4)
    v6 = -[GEOComposedRoute pointCount](self, "pointCount") - 1;
  -[GEOComposedRoute pointAt:](self, "pointAt:", v6);
  v12 = GEOCalculateDistanceRadius(var0, var1, v10, v11, 6367000.0);
  -[GEOComposedRoute distanceBetweenRoutePointIndex:toPointIndex:](self, "distanceBetweenRoutePointIndex:toPointIndex:", v6, v5);
  return v12 + v13;
}

- (double)distanceBetweenStep:(id)a3 andStep:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;

  v6 = a4;
  v7 = objc_msgSend(a3, "maneuverEndIndex");
  if (v6)
    v8 = objc_msgSend(v6, "maneuverEndIndex");
  else
    v8 = -[GEOComposedRoute pointCount](self, "pointCount") - 1;
  -[GEOComposedRoute distanceBetweenRoutePointIndex:toPointIndex:](self, "distanceBetweenRoutePointIndex:toPointIndex:", v7, v8);
  v10 = v9;

  return v10;
}

- (double)remainingTimeAlongRouteFromStepIndex:(unint64_t)a3 currentStepRemainingDistance:(double)a4
{
  unint64_t v5;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;

  v5 = a3;
  v7 = 0.0;
  if (-[GEOComposedRoute stepsCount](self, "stepsCount") - 1 >= a3
    && -[GEOComposedRoute stepsCount](self, "stepsCount") > v5)
  {
    do
    {
      -[GEOComposedRoute segmentForStepIndex:](self, "segmentForStepIndex:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "remainingTimeAlongSegmentFromStepIndex:currentStepRemainingDistance:", v5, a4);
      v10 = v9;
      v5 = objc_msgSend(v8, "endStepIndex") + 1;
      if (v5 < -[GEOComposedRoute stepsCount](self, "stepsCount"))
      {
        -[GEOComposedRoute stepAtIndex:](self, "stepAtIndex:", v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "distance");
        a4 = v12;

      }
      v7 = v7 + v10;

    }
    while (v5 < -[GEOComposedRoute stepsCount](self, "stepsCount"));
  }
  return v7;
}

- (double)remainingTimeToEndOfLeg:(unint64_t)a3 currentStepRemainingDistance:(double)a4
{
  unint64_t v7;
  double v8;
  unint64_t v9;
  void *v10;
  double v11;
  void *v12;
  double v13;

  v7 = -[GEOComposedRoute lastStepIndexOfLegAtStepIndex:](self, "lastStepIndexOfLegAtStepIndex:");
  v8 = 0.0;
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = v7;
    if (v7 >= a3)
    {
      while (1)
      {
        -[GEOComposedRoute segmentForStepIndex:](self, "segmentForStepIndex:", a3);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "remainingTimeAlongSegmentFromStepIndex:currentStepRemainingDistance:", a3, a4);
        v8 = v8 + v11;
        a3 = objc_msgSend(v10, "endStepIndex") + 1;
        if (a3 > v9)
          break;
        -[GEOComposedRoute stepAtIndex:](self, "stepAtIndex:", a3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "distance");
        a4 = v13;

      }
    }
  }
  return v8;
}

- (double)remainingDistanceToEndOfLeg:(unint64_t)a3 currentStepRemainingDistance:(double)a4
{
  unint64_t v7;
  unint64_t v9;
  void *v10;
  double v11;

  v7 = -[GEOComposedRoute lastStepIndexOfLegAtStepIndex:](self, "lastStepIndexOfLegAtStepIndex:");
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = v7;
    while (++a3 <= v9)
    {
      -[NSArray objectAtIndexedSubscript:](self->_steps, "objectAtIndexedSubscript:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "distance");
      a4 = a4 + v11;

    }
  }
  return a4;
}

- (double)remainingDistanceAlongRouteFromStepIndex:(unint64_t)a3 currentStepRemainingDistance:(double)a4
{
  unint64_t v5;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;

  v5 = a3;
  v7 = 0.0;
  if (-[GEOComposedRoute stepsCount](self, "stepsCount") - 1 >= a3
    && -[GEOComposedRoute stepsCount](self, "stepsCount") > v5)
  {
    do
    {
      -[GEOComposedRoute segmentForStepIndex:](self, "segmentForStepIndex:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "remainingDistanceAlongSegmentFromStepIndex:currentStepRemainingDistance:", v5, a4);
      v10 = v9;
      v5 = objc_msgSend(v8, "endStepIndex") + 1;
      if (v5 < -[GEOComposedRoute stepsCount](self, "stepsCount"))
      {
        -[GEOComposedRoute stepAtIndex:](self, "stepAtIndex:", v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "distance");
        a4 = v12;

      }
      v7 = v7 + v10;

    }
    while (v5 < -[GEOComposedRoute stepsCount](self, "stepsCount"));
  }
  return v7;
}

- (BOOL)checkDrivingArrivalForCoordinate:(id)a3 coordinateOnRoute:(id)a4 routePointIndex:(unsigned int)a5 distanceFromRoute:(double)a6 arrivalMapRegion:(id)a7 checkArrivalRadius:(BOOL)a8 checkDistanceAlongRoute:(BOOL)a9 checkRoadAccessPoints:(BOOL)a10 isOnRoute:(BOOL)a11
{
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;
  _BOOL4 v14;
  double var1;
  double var0;
  double v19;
  double v20;
  id v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  char v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v11 = a11;
  v12 = a10;
  v13 = a9;
  v14 = a8;
  var1 = a4.var1;
  var0 = a4.var0;
  v19 = a3.var1;
  v20 = a3.var0;
  v45 = *MEMORY[0x1E0C80C00];
  v22 = a7;
  if (v13)
  {
    if (v11)
      a6 = 0.0;
    -[GEOComposedRoute distanceBetweenLocation:nextPointIndex:toPointIndex:](self, "distanceBetweenLocation:nextPointIndex:toPointIndex:", a5 + 1, -[GEOComposedRoute pointCount](self, "pointCount") - 1, var0, var1);
    if (a6 + v23 < 10.0)
      goto LABEL_21;
  }
  if (v14
    && (-[GEOComposedRoute pointAt:](self, "pointAt:", -[GEOComposedRoute pointCount](self, "pointCount") - 1),
        GEOCalculateDistanceRadius(v20, v19, v24, v25, 6367000.0) <= 30.0))
  {
LABEL_21:
    v38 = 1;
  }
  else
  {
    if (v12)
    {
      -[GEOComposedRoute destination](self, "destination");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "geoMapItem");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "_roadAccessPoints");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v29 = v28;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      if (v30)
      {
        v31 = *(_QWORD *)v41;
        while (2)
        {
          for (i = 0; i != v30; ++i)
          {
            if (*(_QWORD *)v41 != v31)
              objc_enumerationMutation(v29);
            v33 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
            if (objc_msgSend(v33, "drivingDirection", (_QWORD)v40) == 1
              || objc_msgSend(v33, "drivingDirection") == 3)
            {
              objc_msgSend(v33, "location");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "coordinate");
              v37 = GEOCalculateDistanceRadius(v35, v36, v20, v19, 6367000.0);

              if (v37 < 30.0)
              {

                goto LABEL_21;
              }
            }
          }
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
          if (v30)
            continue;
          break;
        }
      }

    }
    v38 = objc_msgSend(v22, "containsCoordinate:", v20, v19, (_QWORD)v40);
  }

  return v38;
}

- (double)courseAtRouteCoordinateIndex:(unsigned int)a3
{
  double v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  long double v16;
  long double v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = -1.0;
  if (-[GEOComposedRoute pointCount](self, "pointCount") >= 2)
  {
    if (a3 + 1 >= -[GEOComposedRoute pointCount](self, "pointCount"))
      a3 = -[GEOComposedRoute pointCount](self, "pointCount") - 2;
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = self->_legs;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v6);
          if (a3 == objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "endPointIndex", (_QWORD)v19))
          {
            if (a3)
              --a3;
            else
              a3 = 0;
            goto LABEL_16;
          }
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_16:

    -[GEOComposedRoute pointAt:](self, "pointAt:", a3);
    v11 = v10;
    v13 = v12;
    -[GEOComposedRoute pointAt:](self, "pointAt:", a3 + 1);
    if (vabdd_f64(v11, v14) >= 0.00000001 || vabdd_f64(v13, v15) >= 0.00000001)
    {
      v16 = GEOBearingFromCoordinateToCoordinate(v11, v13, v14, v15);
      v17 = fmod(v16, 360.0);
      return fmod(v17 + 360.0, 360.0) + 0.0;
    }
  }
  return v5;
}

- ($1AB5FA073B851C12C2339EC22442E995)locationAtDistance:(double)a3 from:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  $1AB5FA073B851C12C2339EC22442E995 result;

  v6 = a4;
  -[GEOComposedRoute pointAtRouteCoordinate:](self, "pointAtRouteCoordinate:", -[GEOComposedRoute coordinateAtOffset:fromRouteCoordinate:](self, "coordinateAtOffset:fromRouteCoordinate:", objc_msgSend(v6, "routeCoordinate"), a3));
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v8;
  v14 = v10;
  v15 = v12;
  result.var2 = v15;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (id)routeMatchAtDistance:(double)a3 from:(id)a4 stopAtEndOfTunnel:(BOOL)a5 stopAtEndOfManeuver:(BOOL)a6 date:(id)a7
{
  _BOOL4 v8;
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  unsigned int v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  double v22;
  long double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  unint64_t v29;
  id v30;
  uint64_t *v31;
  void *v32;
  NSObject *v33;
  const char *v34;
  PolylineCoordinate v35;
  GEORouteMatch *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  unint64_t v43;
  double v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  NSObject *v53;
  uint64_t v54;
  _QWORD v56[5];
  id v57;
  _QWORD *v58;
  _QWORD *v59;
  _QWORD *v60;
  uint64_t *v61;
  _QWORD *v62;
  uint64_t *v63;
  double v64;
  uint64_t v65;
  double v66;
  long double v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  BOOL v71;
  _QWORD v72[7];
  _QWORD v73[3];
  char v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  char v78;
  _QWORD v79[3];
  char v80;
  _QWORD v81[4];
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t (*v85)(uint64_t, uint64_t);
  void (*v86)(uint64_t);
  id v87;
  uint8_t buf[4];
  uint64_t v89;
  uint64_t v90;

  v8 = a6;
  v9 = a5;
  v90 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a7;
  if (a3 < 0.0)
  {
    v14 = 0;
    goto LABEL_34;
  }
  v15 = objc_msgSend(v12, "routeCoordinate");
  v16 = -[GEOComposedRoute pointCount](self, "pointCount");
  if (v8)
  {
    -[GEOComposedRoute stepAtIndex:](self, "stepAtIndex:", objc_msgSend(v12, "stepIndex"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "maneuverStartPointIndex");
    if (v18 > v15
      || (v19 = v15, v20 = v15, *((float *)&v15 + 1) < 0.0) && (_DWORD)v18 == (_DWORD)v15)
    {
      v20 = v18;
      v19 = v18;
    }
    v21 = v20 & 0xFFFFFFFF00000000;

  }
  else
  {
    v21 = 0;
    v19 = v16 - 1;
  }
  objc_msgSend(v12, "locationCoordinate");
  v23 = GEOMapPointsPerMeterAtLatitude(v22);
  objc_msgSend(v12, "locationCoordinate");
  v25 = v24;
  objc_msgSend(v12, "locationCoordinate");
  v27 = GEOTilePointForCoordinate(v25, v26, 20.0);
  v82 = 0;
  v83 = &v82;
  v84 = 0x3032000000;
  v85 = __Block_byref_object_copy__15;
  v86 = __Block_byref_object_dispose__15;
  v87 = 0;
  v81[0] = 0;
  v81[1] = v81;
  v81[2] = 0x2020000000;
  v81[3] = 0x47EFFFFFE0000000;
  v79[0] = 0;
  v79[1] = v79;
  v79[2] = 0x2020000000;
  v80 = 0;
  v75 = 0;
  v76 = &v75;
  v77 = 0x2020000000;
  v78 = 0;
  v73[0] = 0;
  v73[1] = v73;
  v73[2] = 0x2020000000;
  v74 = 1;
  v72[0] = 0;
  v72[1] = v72;
  v72[2] = 0x3812000000;
  v72[3] = __Block_byref_object_copy__88;
  v72[4] = __Block_byref_object_dispose__89;
  v72[5] = "";
  v72[6] = 0;
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __89__GEOComposedRoute_routeMatchAtDistance_from_stopAtEndOfTunnel_stopAtEndOfManeuver_date___block_invoke;
  v56[3] = &unk_1E1C05C80;
  v64 = v27;
  v65 = v28;
  v29 = v21 | v19;
  v68 = v15;
  v69 = v29;
  v59 = v73;
  v60 = v72;
  v58 = v79;
  v56[4] = self;
  v70 = v15;
  v61 = &v82;
  v62 = v81;
  v66 = a3;
  v67 = v23;
  v71 = v9;
  v63 = &v75;
  v30 = v13;
  v57 = v30;
  -[GEOComposedRoute forEachSnappedPath:](self, "forEachSnappedPath:", v56);
  if (!v9)
  {
    v31 = v83;
    if (v83[5])
      goto LABEL_24;
    v35 = -[GEOComposedRoute coordinateAtOffset:fromRouteCoordinate:](self, "coordinateAtOffset:fromRouteCoordinate:", v15, a3);
    if (v19 > v35.index || (_DWORD)v19 == v35.index && v35.offset < *((float *)&v21 + 1))
    {
      v19 = (uint64_t)v35;
      v29 = (unint64_t)v35;
    }
    v36 = [GEORouteMatch alloc];
    -[GEOComposedRoute pointAtRouteCoordinate:](self, "pointAtRouteCoordinate:", v29);
    v38 = v37;
    v40 = v39;
    v42 = v41;
    v43 = -[GEOComposedRoute stepIndexForPointIndex:](self, "stepIndexForPointIndex:", v19);
    -[GEOComposedRoute courseAtRouteCoordinateIndex:](self, "courseAtRouteCoordinateIndex:", v19);
    v45 = -[GEORouteMatch initWithRoute:routeCoordinate:locationCoordinate:stepIndex:matchedCourse:timestamp:](v36, "initWithRoute:routeCoordinate:locationCoordinate:stepIndex:matchedCourse:timestamp:", self, v29, v43, v30, v38, v40, v42, v44);
    v46 = (void *)v83[5];
    v83[5] = v45;

    v31 = v83;
    if (!v83[5])
      goto LABEL_24;
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOComposedRoute");
    v33 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      goto LABEL_23;
    *(_WORD *)buf = 0;
    v34 = "routeMatchAtDistance using unsnapped route line";
    goto LABEL_22;
  }
  v31 = v83;
  if (!*((_BYTE *)v76 + 24))
  {
    v32 = (void *)v83[5];
    v83[5] = 0;

    GEOFindOrCreateLog("com.apple.GeoServices", "GEOComposedRoute");
    v33 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
LABEL_23:

      v31 = v83;
      goto LABEL_24;
    }
    *(_WORD *)buf = 0;
    v34 = "routeMatchAtDistance never found tunnel";
LABEL_22:
    _os_log_impl(&dword_1885A9000, v33, OS_LOG_TYPE_DEBUG, v34, buf, 2u);
    goto LABEL_23;
  }
LABEL_24:
  if (v31[5])
  {
    objc_msgSend(v12, "projectedFrom");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      objc_msgSend(v12, "projectedFrom");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v48 = v12;
    }
    objc_msgSend((id)v83[5], "setProjectedFrom:", v48);
    if (v47)

    objc_msgSend((id)v83[5], "projectedFrom");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "isGoodMatch");
    objc_msgSend((id)v83[5], "setIsGoodMatch:", v50);

    objc_msgSend((id)v83[5], "projectedFrom");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "modifiedHorizontalAccuracy");
    objc_msgSend((id)v83[5], "setModifiedHorizontalAccuracy:");

    objc_msgSend((id)v83[5], "projectedFrom");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "modifiedCourseAccuracy");
    objc_msgSend((id)v83[5], "setModifiedCourseAccuracy:");

  }
  GEOFindOrCreateLog("com.apple.GeoServices", "GEOComposedRoute");
  v53 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
  {
    v54 = v83[5];
    *(_DWORD *)buf = 138477827;
    v89 = v54;
    _os_log_impl(&dword_1885A9000, v53, OS_LOG_TYPE_DEBUG, "routeMatchAtDistance returning: %{private}@", buf, 0xCu);
  }

  v14 = (id)v83[5];
  _Block_object_dispose(v72, 8);
  _Block_object_dispose(v73, 8);
  _Block_object_dispose(&v75, 8);
  _Block_object_dispose(v79, 8);
  _Block_object_dispose(v81, 8);
  _Block_object_dispose(&v82, 8);

LABEL_34:
  return v14;
}

void __89__GEOComposedRoute_routeMatchAtDistance_from_stopAtEndOfTunnel_stopAtEndOfManeuver_date___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  float v21;
  __int128 v22;
  float v23;
  id v24;
  __int128 v25;
  _QWORD v26[5];
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  _QWORD *v30;
  __int128 v31;
  __int128 v32;
  float v33;
  float v34;
  char v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[4];

  v3 = a2;
  v4 = objc_msgSend(v3, "mapMatchingSection");
  objc_msgSend(v3, "section");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "bounds");
    v7 = *((double *)&v36 + 1);
    v8 = *(double *)&v36;
    v10 = *((double *)&v37 + 1);
    v9 = *(double *)&v38;
  }
  else
  {
    v37 = 0u;
    v38 = 0u;
    v36 = 0u;
    v9 = 0.0;
    v10 = 0.0;
    v7 = 0.0;
    v8 = 0.0;
  }
  *(double *)v39 = v8;
  *(double *)&v39[1] = v7;
  *(double *)&v39[2] = v10;
  *(double *)&v39[3] = v9;

  v12 = *(double *)(a1 + 96);
  v11 = *(double *)(a1 + 104);
  v13 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 24))(v4);
  v14 = *(_DWORD *)(a1 + 128);
  if ((v14 < v13 || v14 == (_DWORD)v13 && *(float *)(a1 + 132) < *((float *)&v13 + 1))
    && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
    || (v15 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 24))(v4),
        v16 = *(_DWORD *)(a1 + 136),
        v16 < v15)
    || v16 == (_DWORD)v15 && *(float *)(a1 + 140) < *((float *)&v15 + 1))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    if (!(*(unsigned int (**)(uint64_t))(*(_QWORD *)v4 + 16))(v4)
      || (v17 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8),
          v18 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 24))(v4),
          *(_DWORD *)(v17 + 48) != (_DWORD)v18)
      || vabds_f32(*(float *)(v17 + 52), *((float *)&v18 + 1)) >= 0.00000011921)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    }
  }
  v19 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 32))(v4);
  v20 = *(_DWORD *)(a1 + 128);
  if (v20 > v19 || v20 == (_DWORD)v19 && *(float *)(a1 + 132) > *((float *)&v19 + 1))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  else
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40)
      && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)
      && (*(unsigned int (**)(uint64_t))(*(_QWORD *)v4 + 16))(v4))
    {
      v21 = (v12 - v8) / v10;
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __89__GEOComposedRoute_routeMatchAtDistance_from_stopAtEndOfTunnel_stopAtEndOfManeuver_date___block_invoke_2;
      v26[3] = &unk_1E1C05C58;
      v26[4] = *(_QWORD *)(a1 + 32);
      v22 = *(_OWORD *)(a1 + 136);
      v23 = (v9 - (v11 - v7)) / v9;
      v33 = v21;
      v34 = v23;
      v31 = *(_OWORD *)(a1 + 112);
      v32 = v22;
      v35 = *(_BYTE *)(a1 + 152);
      v28 = *(_OWORD *)(a1 + 80);
      v29 = *(_QWORD *)(a1 + 72);
      v30 = v39;
      v25 = *(_OWORD *)(a1 + 40);
      v24 = (id)v25;
      v27 = v25;
      (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v4 + 40))(v4, v26);

    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 48) = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 32))(v4);
  }

}

uint64_t __89__GEOComposedRoute_routeMatchAtDistance_from_stopAtEndOfTunnel_stopAtEndOfManeuver_date___block_invoke_2(uint64_t a1, float *a2, float *a3, uint64_t *a4, uint64_t *a5, void *a6)
{
  id v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  uint64_t v18;
  unsigned int v19;
  double v20;
  double v21;
  float v22;
  float v23;
  float v24;
  float v25;
  double v26;
  double *v27;
  double v28;
  float v29;
  int v30;
  NSObject *v31;
  float v32;
  char v33;
  uint64_t v34;
  float v35;
  uint64_t v36;
  double v37;
  void *v38;
  void *v39;
  int v40;
  unsigned int v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  NSObject *v47;
  NSObject *v48;
  uint64_t v49;
  double v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  double *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  float v59;
  float v60;
  GEORouteMatch *v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  uint64_t v66;
  double v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  float v72;
  float v73;
  uint64_t v74;
  uint8_t buf[4];
  float v76;
  uint64_t v77;

  v11 = a6;
  v12 = *a2;
  v13 = a2[1];
  v14 = *a2;
  v15 = v13;
  v17 = *a3;
  v16 = a3[1];
  v18 = *a5;
  v77 = v18;
  v19 = *(_DWORD *)(a1 + 104);
  if (v19 < v18
    || (v32 = *((float *)&v18 + 1), v19 == (_DWORD)v18) && *(float *)(a1 + 108) < *((float *)&v18 + 1))
  {
    objc_msgSend(*(id *)(a1 + 32), "pointAtRouteCoordinate:", *(_QWORD *)(a1 + 104));
    v22 = v17 - v14;
    v23 = v16 - v13;
    v24 = 0.0;
    v25 = (float)((float)(v22 * v22) + 0.0) + (float)(v23 * v23);
    if (v25 > 1.0e-15)
    {
      v26 = GEOTilePointForCoordinate(v20, v21, 20.0);
      v27 = *(double **)(a1 + 80);
      *(float *)&v28 = (v27[3] - (v28 - v27[1])) / v27[3];
      *(float *)&v26 = (v26 - *v27) / v27[2];
      v29 = (float)((float)((float)((float)(*(float *)&v26 - v14) * v22) + 0.0)
                  + (float)((float)(*(float *)&v28 - v13) * v23))
          / v25;
      if (v29 < 0.0)
        v29 = 0.0;
      if (v29 <= 1.0)
        v24 = v29;
      else
        v24 = 1.0;
    }
    v77 = *(_QWORD *)(a1 + 104);
    v30 = v77;
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOComposedRoute");
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = *((float *)&v77 + 1);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v31, OS_LOG_TYPE_DEBUG, "routeMatchAtDistance stopped for max coordinate (next maneuver)", buf, 2u);
    }
    v17 = v14 + (float)(v22 * v24);
    v16 = v13 + (float)(v23 * v24);

    v33 = 0;
    LODWORD(v18) = v30;
  }
  else
  {
    v33 = 1;
  }
  *(float *)buf = v12;
  v76 = v13;
  v34 = *a4;
  v74 = *a4;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v41 = *(_DWORD *)(a1 + 112);
    if (v41 <= v34 && (v41 != (_DWORD)v34 || *(float *)(a1 + 116) < *((float *)&v34 + 1)))
      goto LABEL_49;
    if (v41 >= v18 && (v41 != (_DWORD)v18 || *(float *)(a1 + 116) > v32))
      goto LABEL_49;
    v42 = v17 - v14;
    v43 = v16 - v13;
    v44 = 0.0;
    v45 = (float)((float)(v42 * v42) + 0.0) + (float)(v43 * v43);
    if (v45 > 1.0e-15)
    {
      v46 = (float)((float)((float)((float)(*(float *)(a1 + 120) - v14) * v42) + 0.0)
                  + (float)((float)(*(float *)(a1 + 124) - v13) * v43))
          / v45;
      if (v46 < 0.0)
        v46 = 0.0;
      v44 = 1.0;
      if (v46 <= 1.0)
        v44 = v46;
    }
    v14 = v14 + (float)(v42 * v44);
    v15 = v13 + (float)(v43 * v44);
    *(float *)buf = v14;
    v76 = v15;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(double *)(a1 + 88)
                                                                * *(double *)(a1 + 96)
                                                                / *(double *)(*(_QWORD *)(a1 + 80) + 16);
    v74 = *(_QWORD *)(a1 + 112);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOComposedRoute");
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v72) = 0;
      _os_log_impl(&dword_1885A9000, v47, OS_LOG_TYPE_DEBUG, "routeMatchAtDistance found start", (uint8_t *)&v72, 2u);
    }

    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      goto LABEL_49;
  }
  v35 = sqrtf((float)((float)((float)(v14 - v17) * (float)(v14 - v17)) + 0.0)+ (float)((float)(v15 - v16) * (float)(v15 - v16)));
  v36 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v37 = *(double *)(v36 + 24) - v35;
  *(double *)(v36 + 24) = v37;
  if (v11)
  {
    objc_msgSend(v11, "feature");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "attributes");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "isTunnel");

  }
  else
  {
    v40 = 0;
  }
  if (*(_BYTE *)(a1 + 128) && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) && (v40 & 1) == 0)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }
  else
  {
    if (v40 && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "GEOComposedRoute");
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v72) = 0;
        _os_log_impl(&dword_1885A9000, v48, OS_LOG_TYPE_DEBUG, "routeMatchAtDistance found tunnel", (uint8_t *)&v72, 2u);
      }

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v40;
  }
  v49 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v50 = *(double *)(v49 + 24);
  if (v50 <= 0.0)
    v51 = 1;
  else
    v51 = v33;
  if ((v51 & 1) == 0)
  {
    *(_QWORD *)(v49 + 24) = 0;
    v50 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  }
  if (v50 <= 0.0)
  {
    v72 = v17;
    v73 = v16;
    LODWORD(v37) = 0;
    if (v35 > 0.0)
    {
      v37 = (v50 + v35) / v35;
      *(float *)&v37 = v37;
      v72 = v14 + (float)((float)(v17 - v14) * *(float *)&v37);
      v73 = v15 + (float)((float)(v16 - v15) * *(float *)&v37);
    }
    v53 = objc_msgSend(*(id *)(a1 + 32), "_findRouteCoordinateWithOffset:aPos:aCoord:bCoord:pointOnSegment:bounds:", buf, &v74, &v77, &v72, *(_QWORD *)(a1 + 80), v37);
    v54 = *(double **)(a1 + 80);
    v56 = *v54;
    v55 = v54[1];
    v58 = v54[2];
    v57 = v54[3];
    v60 = v72;
    v59 = v73;
    v61 = [GEORouteMatch alloc];
    v62 = *(void **)(a1 + 32);
    v63 = GEOCoordinate2DForMapPoint(v56 + v60 * v58, v55 + (float)(1.0 - v59) * v57);
    v65 = v64;
    v66 = objc_msgSend(v62, "stepIndexForPointIndex:", v53);
    objc_msgSend(*(id *)(a1 + 32), "courseAtRouteCoordinateIndex:", v53);
    v68 = -[GEORouteMatch initWithRoute:routeCoordinate:locationCoordinate:stepIndex:matchedCourse:timestamp:](v61, "initWithRoute:routeCoordinate:locationCoordinate:stepIndex:matchedCourse:timestamp:", v62, v53, v66, *(_QWORD *)(a1 + 40), v63, v65, 1.79769313e308, v67);
    v69 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v70 = *(void **)(v69 + 40);
    *(_QWORD *)(v69 + 40) = v68;

    v52 = 1;
  }
  else
  {
LABEL_49:
    v52 = 0;
  }

  return v52;
}

- (PolylineCoordinate)_findRouteCoordinateWithOffset:(float)a3 aPos:(const void *)a4 aCoord:(const PolylineCoordinate *)a5 bCoord:(const PolylineCoordinate *)a6 pointOnSegment:(const void *)a7 bounds:(id *)a8
{
  unsigned int index;
  float offset;
  float v10;
  unsigned int v11;
  float v12;
  double v15;
  uint64_t v16;
  float v17;
  PolylineCoordinate v18;

  index = a5->index;
  offset = a5->offset;
  if (a3 == 0.0)
  {
    if (offset >= 1.0)
    {
      index += vcvtms_u32_f32(offset);
      v10 = offset - (float)floorf(offset);
    }
    else
    {
      v10 = a5->offset;
    }
    return (PolylineCoordinate)(index | ((unint64_t)LODWORD(v10) << 32));
  }
  v11 = a6->index;
  v10 = a6->offset;
  if (a3 == 1.0)
  {
    if (v10 < 1.0)
    {
      index = a6->index;
      return (PolylineCoordinate)(index | ((unint64_t)LODWORD(v10) << 32));
    }
    v12 = floorf(v10);
    index = v11 + vcvtms_u32_f32(v10);
LABEL_15:
    v10 = v10 - (float)v12;
    return (PolylineCoordinate)(index | ((unint64_t)LODWORD(v10) << 32));
  }
  if (index == v11)
  {
    v10 = offset + (float)((float)(v10 - offset) * a3);
    if (v10 < 1.0)
      return (PolylineCoordinate)(index | ((unint64_t)LODWORD(v10) << 32));
LABEL_14:
    v12 = floorf(v10);
    index += vcvtms_u32_f32(v10);
    goto LABEL_15;
  }
  if (v10 == 0.0)
  {
    v10 = offset + (float)((float)(1.0 - offset) * a3);
    if (v10 < 1.0)
      return (PolylineCoordinate)(index | ((unint64_t)LODWORD(v10) << 32));
    goto LABEL_14;
  }
  v15 = GEOMetersBetweenMapPoints(a8->var0.var0 + *(float *)a4 * a8->var1.var0, a8->var0.var1 + (float)(1.0 - *((float *)a4 + 1)) * a8->var1.var1, a8->var0.var0 + *(float *)a7 * a8->var1.var0, a8->var0.var1 + (float)(1.0 - *((float *)a7 + 1)) * a8->var1.var1);
  LODWORD(v16) = index + vcvtms_u32_f32(offset);
  v17 = offset - (float)floorf(offset);
  if (offset >= 1.0)
  {
    v16 = v16;
  }
  else
  {
    v17 = offset;
    v16 = index;
  }
  v18 = -[GEOComposedRoute coordinateAtOffset:fromRouteCoordinate:](self, "coordinateAtOffset:fromRouteCoordinate:", v16 | ((unint64_t)LODWORD(v17) << 32), v15);
  v10 = v18.offset;
  index = v18.index;
  return (PolylineCoordinate)(index | ((unint64_t)LODWORD(v10) << 32));
}

- (void)roadFeaturesForRouteCoordinate:(PolylineCoordinate)a3 distanceAhead:(double)a4 handler:(id)a5
{
  void (**v8)(id, _QWORD, double, double, double, double);
  PolylineCoordinate v9;
  uint64_t i;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  long double v18;
  double v19;
  _QWORD v20[8];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  __n128 (*v24)(__n128 *, __n128 *);
  void **(*v25)(uint64_t);
  const char *v26;
  void *v27[3];
  _QWORD v28[5];
  id v29;

  v8 = (void (**)(id, _QWORD, double, double, double, double))a5;
  if (v8)
  {
    v9 = -[GEOComposedRoute coordinateAtOffset:fromRouteCoordinate:](self, "coordinateAtOffset:fromRouteCoordinate:", a3, a4);
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x3032000000;
    v28[3] = __Block_byref_object_copy__15;
    v28[4] = __Block_byref_object_dispose__15;
    v29 = 0;
    v21 = 0;
    v22 = &v21;
    v23 = 0x4812000000;
    v24 = __Block_byref_object_copy__98;
    v25 = __Block_byref_object_dispose__99;
    v26 = "";
    memset(v27, 0, sizeof(v27));
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __73__GEOComposedRoute_roadFeaturesForRouteCoordinate_distanceAhead_handler___block_invoke;
    v20[3] = &unk_1E1C05CD0;
    v20[6] = a3;
    v20[7] = v9;
    v20[4] = &v21;
    v20[5] = v28;
    -[GEOComposedRoute forEachSnappedPath:](self, "forEachSnappedPath:", v20);
    for (i = v22[6]; i != v22[7]; i += 56)
    {
      v11 = *(double *)(i + 8);
      v12 = *(double *)(i + 16);
      v13 = *(double *)(i + 24);
      v14 = *(double *)(i + 32);
      v15 = GEOCoordinate2DForMapPoint(v11 + *(float *)(i + 40) * v13, v12 + (float)(1.0 - *(float *)(i + 44)) * v14);
      v17 = v16;
      v18 = GEOCoordinate2DForMapPoint(v11 + *(float *)(i + 48) * v13, v12 + (float)(1.0 - *(float *)(i + 52)) * v14);
      v8[2](v8, *(_QWORD *)i, v15, v17, v18, v19);
    }
    _Block_object_dispose(&v21, 8);
    std::vector<-[GEOComposedRoute roadFeaturesForRouteCoordinate:distanceAhead:handler:]::FeatureWithEndPoints>::~vector[abi:ne180100](v27);
    _Block_object_dispose(v28, 8);

  }
}

- (void)roadFeaturesForRouteCoordinate:(void *)a1 distanceAhead:handler:
{
  char *v2;
  char *v3;
  void *v4;
  void *v5;

  v2 = (char *)*a1;
  if (*a1)
  {
    v3 = (char *)a1[1];
    v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        v5 = (void *)*((_QWORD *)v3 - 7);
        v3 -= 56;

      }
      while (v3 != v2);
      v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

void __73__GEOComposedRoute_roadFeaturesForRouteCoordinate_distanceAhead_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  __int128 v9;
  _QWORD v10[4];
  id v11;
  __int128 v12;
  __int128 v13;

  v3 = a2;
  v4 = objc_msgSend(v3, "mapMatchingSection");
  if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v4 + 16))(v4))
  {
    v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 32))(v4);
    v6 = *(_DWORD *)(a1 + 48);
    if (v6 < v5 || v6 == (_DWORD)v5 && *(float *)(a1 + 52) < *((float *)&v5 + 1))
    {
      v7 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 24))(v4);
      v8 = *(_DWORD *)(a1 + 56);
      if (v8 > v7 || v8 == (_DWORD)v7 && *(float *)(a1 + 60) > *((float *)&v7 + 1))
      {
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __73__GEOComposedRoute_roadFeaturesForRouteCoordinate_distanceAhead_handler___block_invoke_2;
        v10[3] = &unk_1E1C05CA8;
        v9 = *(_OWORD *)(a1 + 48);
        v12 = *(_OWORD *)(a1 + 32);
        v13 = v9;
        v11 = v3;
        (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v4 + 40))(v4, v10);

      }
    }
  }

}

uint64_t __73__GEOComposedRoute_roadFeaturesForRouteCoordinate_distanceAhead_handler___block_invoke_2(uint64_t a1, uint64_t *a2, _QWORD *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v12;
  void *v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  unint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char *v37;
  char *v38;
  char *v39;
  char *v40;
  char *v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  char *v45;
  void *v46;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;

  v12 = a6;
  v13 = v12;
  if (v12)
  {
    v14 = *(_DWORD *)(a1 + 56);
    if (v14 < *(_DWORD *)a5 || v14 == *(_DWORD *)a5 && *(float *)(a1 + 60) < *(float *)(a5 + 4))
    {
      v15 = *(_DWORD *)(a1 + 64);
      if (*(_DWORD *)a4 < v15 || *(_DWORD *)a4 == v15 && *(float *)(a4 + 4) < *(float *)(a1 + 68))
      {
        v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v18 = *(_QWORD *)(v16 + 48);
        v17 = *(_QWORD *)(v16 + 56);
        if (v18 != v17 && *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) == v12)
        {
          *(_QWORD *)(v17 - 8) = *a3;
LABEL_40:
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a6);
          goto LABEL_41;
        }
        v19 = v12;
        objc_msgSend(*(id *)(a1 + 32), "section");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v20)
        {
          objc_msgSend(v20, "bounds");
          v22 = v50;
          v23 = v49;
          v25 = v51;
          v24 = v52;
        }
        else
        {
          v24 = 0;
          v25 = 0;
          v22 = 0;
          v23 = 0;
        }

        v26 = *a2;
        v27 = *a3;
        v28 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
        v30 = (_QWORD *)v28[7];
        v29 = v28[8];
        if ((unint64_t)v30 < v29)
        {
          *v30 = v19;
          v30[1] = v23;
          v30[2] = v22;
          v30[3] = v25;
          v30[4] = v24;
          v31 = v30 + 7;
          v30[5] = v26;
          v30[6] = v27;
LABEL_39:
          v28[7] = v31;

          goto LABEL_40;
        }
        v48 = v19;
        v32 = v28[6];
        v33 = 0x6DB6DB6DB6DB6DB7 * (((uint64_t)v30 - v32) >> 3);
        if ((unint64_t)(v33 + 1) > 0x492492492492492)
          std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
        v34 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v29 - v32) >> 3);
        v35 = 2 * v34;
        if (2 * v34 <= v33 + 1)
          v35 = v33 + 1;
        if (v34 >= 0x249249249249249)
          v36 = 0x492492492492492;
        else
          v36 = v35;
        if (v36)
        {
          if (v36 > 0x492492492492492)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v37 = (char *)operator new(56 * v36);
        }
        else
        {
          v37 = 0;
        }
        v38 = &v37[56 * v33];
        *(_QWORD *)v38 = v48;
        *((_QWORD *)v38 + 1) = v23;
        *((_QWORD *)v38 + 2) = v22;
        *((_QWORD *)v38 + 3) = v25;
        *((_QWORD *)v38 + 4) = v24;
        *((_QWORD *)v38 + 5) = v26;
        *((_QWORD *)v38 + 6) = v27;
        v39 = (char *)v28[6];
        v40 = (char *)v28[7];
        if (v40 == v39)
        {
          v31 = v38 + 56;
          v28[6] = v38;
          v28[7] = v38 + 56;
          v28[8] = &v37[56 * v36];
        }
        else
        {
          v41 = v38;
          do
          {
            v42 = *((_QWORD *)v40 - 7);
            v40 -= 56;
            *(_QWORD *)v40 = 0;
            *((_QWORD *)v41 - 7) = v42;
            v41 -= 56;
            v43 = *(_OWORD *)(v40 + 8);
            v44 = *(_OWORD *)(v40 + 24);
            *(_OWORD *)(v41 + 40) = *(_OWORD *)(v40 + 40);
            *(_OWORD *)(v41 + 24) = v44;
            *(_OWORD *)(v41 + 8) = v43;
          }
          while (v40 != v39);
          v40 = (char *)v28[6];
          v45 = (char *)v28[7];
          v31 = v38 + 56;
          v28[6] = v41;
          v28[7] = v38 + 56;
          v28[8] = &v37[56 * v36];
          if (v45 != v40)
          {
            v19 = v48;
            do
            {
              v46 = (void *)*((_QWORD *)v45 - 7);
              v45 -= 56;

            }
            while (v45 != v40);
LABEL_37:
            if (v40)
              operator delete(v40);
            goto LABEL_39;
          }
        }
        v19 = v48;
        goto LABEL_37;
      }
    }
  }
LABEL_41:

  return 0;
}

- (id)geoTrafficBannerTexts
{
  void *geoWaypointRoute;

  geoWaypointRoute = self->_geoWaypointRoute;
  if (geoWaypointRoute)
  {
    objc_msgSend(geoWaypointRoute, "trafficBannerTexts");
    geoWaypointRoute = (void *)objc_claimAutoreleasedReturnValue();
  }
  return geoWaypointRoute;
}

- (BOOL)_meetsMinimumPathLengthBetweenStart:(unsigned int)a3 end:(unsigned int)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  unsigned int v11;
  double v12;
  unsigned int v13;
  double v14;
  double v15;
  double v16;
  double v17;

  -[GEOComposedRoute pointAt:](self, "pointAt:", a3);
  v8 = v7;
  v10 = v9;
  v11 = a3 + 1;
  v12 = 0.0;
  do
  {
    v13 = v11;
    if (v11 > a4)
      break;
    -[GEOComposedRoute pointAt:](self, "pointAt:", v11);
    v15 = v14;
    v17 = v16;
    v12 = v12 + GEOCalculateDistanceRadius(v8, v10, v14, v16, 6367000.0);
    v11 = v13 + 1;
    v10 = v17;
    v8 = v15;
  }
  while (v12 < 100.0);
  return v13 <= a4;
}

- (void)_addSnappedPolylinePathsForSection:(id)a3 toPaths:(id)a4 rects:(id *)a5 rectsCount:(unint64_t)a6
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a3;
  v10 = a4;
  v8 = v10;
  v9 = v7;
  geo_reentrant_isolate_sync();

}

void __80__GEOComposedRoute__addSnappedPolylinePathsForSection_toPaths_rects_rectsCount___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  unint64_t v7;
  __int128 *v8;
  __int128 *v9;
  __int128 *v10;
  unint64_t i;
  double *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  unsigned int v18;
  unsigned int v19;
  char v20;
  char v21;
  float v22;
  float v23;
  uint64_t v24;
  unsigned int v25;
  unsigned int v26;
  char v27;
  char v28;
  float v29;
  float v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char *v34;
  __int128 *v35;
  __int128 *v36;
  char *v37;
  unsigned int j;
  void *v39;
  unsigned int v40;
  unsigned int v41;
  unint64_t v42;
  id v43;
  int v44;
  uint64_t v45;
  char v46;
  char v47;
  float v48;
  float v49;
  uint64_t v50;
  char v51;
  char v52;
  float v53;
  float v54;
  uint64_t v55;
  __int128 *v56;
  uint64_t v57;
  char v58;
  char v59;
  GEOSnappedRoutePath *v60;
  int v61;
  GEOSnappedRoutePath *v62;
  id v63;
  unsigned int v64;
  int v65;
  GEOSnappedRoutePath *v66;
  __int128 *v67;
  unsigned int v68;
  unint64_t v69;
  uint64_t v70;
  unsigned int v71;
  unint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;

  v75 = 0u;
  v76 = 0u;
  v74 = 0u;
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "bounds");
    v3 = *((double *)&v74 + 1);
    v4 = *(double *)&v74;
    v6 = *((double *)&v75 + 1);
    v5 = *(double *)&v76;
  }
  else
  {
    v5 = 0.0;
    v6 = 0.0;
    v3 = 0.0;
    v4 = 0.0;
  }
  v7 = *(_QWORD *)(a1 + 56);
  if (v7)
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
    for (i = 0; i < v7; ++i)
    {
      v12 = (double *)(*(_QWORD *)(a1 + 64) + 32 * i);
      v13 = *v12;
      v14 = v12[1];
      v15 = v12[2];
      v16 = v12[3];
      if (GEOMapRectIntersectsRect(*v12, v14, v15, v16, v4, v3, v6, v5))
      {
        v17 = 0;
        v73 = xmmword_189CC14F0;
        *(float *)&v18 = (v13 - v4) / v6;
        *(float *)&v19 = (v5 - (v14 - v3)) / v5;
        v72 = __PAIR64__(v19, v18);
        v20 = 1;
        do
        {
          v21 = v20;
          v22 = *((float *)&v72 + v17);
          v23 = *((float *)&v73 + v17);
          if (v22 < v23)
            v23 = *((float *)&v72 + v17);
          *((float *)&v73 + v17) = v23;
          if (*((float *)&v73 + v17 + 2) >= v22)
            v22 = *((float *)&v73 + v17 + 2);
          *((float *)&v73 + v17 + 2) = v22;
          v17 = 1;
          v20 = 0;
        }
        while ((v21 & 1) != 0);
        v24 = 0;
        *(float *)&v25 = (v13 + v15 - v4) / v6;
        *(float *)&v26 = (v5 - (v14 + v16 - v3)) / v5;
        v72 = __PAIR64__(v26, v25);
        v27 = 1;
        do
        {
          v28 = v27;
          v29 = *((float *)&v72 + v24);
          v30 = *((float *)&v73 + v24);
          if (v29 < v30)
            v30 = *((float *)&v72 + v24);
          *((float *)&v73 + v24) = v30;
          if (*((float *)&v73 + v24 + 2) >= v29)
            v29 = *((float *)&v73 + v24 + 2);
          *((float *)&v73 + v24 + 2) = v29;
          v24 = 1;
          v27 = 0;
        }
        while ((v28 & 1) != 0);
        if (v9 >= v10)
        {
          v31 = v9 - v8;
          v32 = v31 + 1;
          if ((unint64_t)(v31 + 1) >> 60)
            std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
          if (((char *)v10 - (char *)v8) >> 3 > v32)
            v32 = ((char *)v10 - (char *)v8) >> 3;
          if ((unint64_t)((char *)v10 - (char *)v8) >= 0x7FFFFFFFFFFFFFF0)
            v33 = 0xFFFFFFFFFFFFFFFLL;
          else
            v33 = v32;
          if (v33)
          {
            if (v33 >> 60)
              std::__throw_bad_array_new_length[abi:ne180100]();
            v34 = (char *)operator new(16 * v33);
          }
          else
          {
            v34 = 0;
          }
          v35 = (__int128 *)&v34[16 * v31];
          *v35 = v73;
          v36 = v8;
          if (v9 == v8)
          {
            v8 = (__int128 *)&v34[16 * v31];
          }
          else
          {
            v37 = &v34[16 * v31];
            do
            {
              v8 = (__int128 *)(v37 - 16);
              *((_OWORD *)v37 - 1) = *--v9;
              v37 -= 16;
            }
            while (v9 != v36);
          }
          v10 = (__int128 *)&v34[16 * v33];
          v9 = v35 + 1;
          if (v36)
            operator delete(v36);
        }
        else
        {
          *v9++ = v73;
        }
        v7 = *(_QWORD *)(a1 + 56);
      }
    }
    if (v8 == v9)
      goto LABEL_95;
    v70 = objc_msgSend(*(id *)(a1 + 32), "points");
    v68 = objc_msgSend(*(id *)(a1 + 32), "endPointIndex");
    for (j = 0; objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 576), "count") > (unint64_t)j; ++j)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 576), "objectAtIndex:");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "routeEndIndex");
      v41 = objc_msgSend(*(id *)(a1 + 32), "startPointIndex");

      if (v40 > v41)
        break;
    }
    v42 = 0;
    v43 = 0;
    v71 = v68;
    v67 = v8;
LABEL_46:
    if (v42 >= objc_msgSend(*(id *)(a1 + 32), "pointCount") - 1)
      goto LABEL_92;
    v44 = objc_msgSend(*(id *)(a1 + 32), "startPointIndex");
    v45 = 0;
    v73 = xmmword_189CC14F0;
    v72 = *(_QWORD *)(v70 + 12 * v42);
    v46 = 1;
    do
    {
      v47 = v46;
      v48 = *((float *)&v72 + v45);
      v49 = *((float *)&v73 + v45);
      if (v48 < v49)
        v49 = *((float *)&v72 + v45);
      *((float *)&v73 + v45) = v49;
      if (*((float *)&v73 + v45 + 2) >= v48)
        v48 = *((float *)&v73 + v45 + 2);
      *((float *)&v73 + v45 + 2) = v48;
      v45 = 1;
      v46 = 0;
    }
    while ((v47 & 1) != 0);
    v50 = 0;
    v69 = v42 + 1;
    v72 = *(_QWORD *)(v70 + 12 * (v42 + 1));
    v51 = 1;
    do
    {
      v52 = v51;
      v53 = *((float *)&v72 + v50);
      v54 = *((float *)&v73 + v50);
      if (v53 < v54)
        v54 = *((float *)&v72 + v50);
      *((float *)&v73 + v50) = v54;
      if (*((float *)&v73 + v50 + 2) >= v53)
        v53 = *((float *)&v73 + v50 + 2);
      *((float *)&v73 + v50 + 2) = v53;
      v50 = 1;
      v51 = 0;
    }
    while ((v52 & 1) != 0);
    v55 = (v44 + v42);
    v56 = v8;
    do
    {
      v57 = 0;
      v58 = 1;
      while (*((float *)&v73 + v57 + 2) > *((float *)v56 + v57) && *((float *)&v73 + v57) < *((float *)v56 + v57 + 2))
      {
        v59 = v58;
        v58 = 0;
        v57 = 1;
        if ((v59 & 1) == 0)
        {
          if (v43
            && objc_msgSend(v43, "routeStartIndex") <= v55
            && objc_msgSend(v43, "routeEndIndex") > v55)
          {
            v61 = 1;
            goto LABEL_85;
          }
          while (2)
          {

            if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 576), "count") <= (unint64_t)j)
            {
              v43 = 0;
            }
            else
            {
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 576), "objectAtIndex:");
              v43 = (id)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v43, "routeEndIndex") <= v55)
              {
                ++j;
                continue;
              }
              if (v43 && objc_msgSend(v43, "routeStartIndex") <= v55)
              {
                if (v71 < v68)
                {
                  v62 = -[GEOSnappedRoutePath initWithRoute:section:routeStartIndex:routeEndIndex:]([GEOSnappedRoutePath alloc], "initWithRoute:section:routeStartIndex:routeEndIndex:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), v71, v55);
                  objc_msgSend(*(id *)(a1 + 48), "addObject:", v62);

                  v71 = v68;
                }
                objc_msgSend(*(id *)(a1 + 48), "addObject:", v43);
                v43 = v43;
                ++j;
                v61 = 1;
                v63 = v43;
LABEL_84:

                v43 = v63;
                v8 = v67;
LABEL_85:
                v64 = v71;
                if (v71 < v68)
                  v65 = 1;
                else
                  v65 = v61;
                if (!v65)
                  v64 = v55;
                v71 = v64;
LABEL_91:
                v42 = v69;
                goto LABEL_46;
              }
            }
            break;
          }
          v63 = 0;
          v61 = 0;
          goto LABEL_84;
        }
      }
      ++v56;
    }
    while (v56 != v9);
    if (v71 >= v68)
      goto LABEL_91;
    if ((objc_msgSend(*(id *)(a1 + 40), "_meetsMinimumPathLengthBetweenStart:end:", v55, objc_msgSend(*(id *)(a1 + 32), "endPointIndex")) & 1) != 0)
    {
      if (objc_msgSend(*(id *)(a1 + 40), "_meetsMinimumPathLengthBetweenStart:end:", v71, v55))
      {
        v60 = -[GEOSnappedRoutePath initWithRoute:section:routeStartIndex:routeEndIndex:]([GEOSnappedRoutePath alloc], "initWithRoute:section:routeStartIndex:routeEndIndex:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), v71, v55);
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v60);

        v43 = 0;
        v71 = v68;
      }
      goto LABEL_91;
    }
LABEL_92:
    if (v71 < v68)
    {
      v66 = -[GEOSnappedRoutePath initWithRoute:section:routeStartIndex:routeEndIndex:]([GEOSnappedRoutePath alloc], "initWithRoute:section:routeStartIndex:routeEndIndex:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), v71, objc_msgSend(*(id *)(a1 + 32), "endPointIndex"));
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v66);

    }
LABEL_95:
    if (v8)
      operator delete(v8);
  }
}

- (void)_snapPaths:(id)a3 completionHandler:(id)a4
{
  id v6;
  GEOZilchDecoder *v7;
  GEOZilchDecoder *zilchDecoder;
  id v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  GEOZilchDecoder *v15;
  NSObject *v16;
  id v17;
  _QWORD block[4];
  id v19;
  _QWORD v20[5];
  NSObject *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v17 = a4;
  if (!self->_zilchDecoder)
  {
    v7 = objc_alloc_init(GEOZilchDecoder);
    zilchDecoder = self->_zilchDecoder;
    self->_zilchDecoder = v7;

    -[GEOZilchDecoder setMapAccessRestrictions:](self->_zilchDecoder, "setMapAccessRestrictions:", self);
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v10)
  {

    if (!v17)
    {
      v11 = 0;
      goto LABEL_24;
    }
    goto LABEL_22;
  }
  v11 = 0;
  v12 = *(_QWORD *)v23;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v23 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
      if ((objc_msgSend(v14, "isMapMatching") & 1) == 0 && (objc_msgSend(v14, "hasCompletedMapMatching") & 1) == 0)
      {
        if (v17 && !v11)
          v11 = dispatch_group_create();
        if (v11)
          dispatch_group_enter(v11);
        v15 = self->_zilchDecoder;
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __49__GEOComposedRoute__snapPaths_completionHandler___block_invoke;
        v20[3] = &unk_1E1C05D20;
        v20[4] = self;
        v11 = v11;
        v21 = v11;
        objc_msgSend(v14, "matchWithDecoder:completionHandler:", v15, v20);

      }
    }
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  }
  while (v10);

  if (v17)
  {
    if (v11)
    {
      -[GEOZilchDecoder decoderQueue](self->_zilchDecoder, "decoderQueue");
      v16 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __49__GEOComposedRoute__snapPaths_completionHandler___block_invoke_2;
      block[3] = &unk_1E1C05D48;
      v19 = v17;
      dispatch_group_notify(v11, v16, block);

      goto LABEL_24;
    }
LABEL_22:
    v11 = 0;
    (*((void (**)(id, uint64_t))v17 + 2))(v17, 1);
  }
LABEL_24:

}

void __49__GEOComposedRoute__snapPaths_completionHandler___block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;

  if (a2)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 664), "composedRouteUpdatedSnappedPaths:");
  v3 = *(NSObject **)(a1 + 40);
  if (v3)
    dispatch_group_leave(v3);
}

uint64_t __49__GEOComposedRoute__snapPaths_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_addPaths:(id)a3 forObserver:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;

  v5 = a3;
  v8 = a4;
  v6 = v8;
  v7 = v5;
  geo_reentrant_isolate_sync();

}

void __42__GEOComposedRoute__addPaths_forObserver___block_invoke(uint64_t a1)
{
  id v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = 0;
  v4 = 0;
  while (v4 < objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 576), "count")
       || v3 < objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    if (v4 >= objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 576), "count"))
    {
      v5 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 576), "objectAtIndex:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (v3 >= objc_msgSend(*(id *)(a1 + 40), "count"))
    {
      v6 = 0;
      if (!v5)
      {
LABEL_9:
        v7 = objc_msgSend(*(id *)(a1 + 32), "pointCount");
        goto LABEL_12;
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v5)
        goto LABEL_9;
    }
    v7 = objc_msgSend(v5, "routeStartIndex");
LABEL_12:
    v8 = v7;
    if (v6)
      v9 = objc_msgSend(v6, "routeStartIndex");
    else
      v9 = objc_msgSend(*(id *)(a1 + 32), "pointCount");
    if (v5 && v5 == v6)
    {
      objc_msgSend(v5, "registerObserver:", *(_QWORD *)(a1 + 48));
      objc_msgSend(v2, "addObject:", v5);
      ++v4;
      ++v3;
      v6 = v5;
    }
    else if (v8 >= v9)
    {
      if (!v6)
        goto LABEL_25;
      objc_msgSend(v6, "registerObserver:", *(_QWORD *)(a1 + 48));
      objc_msgSend(v2, "addObject:", v6);
      ++v3;
    }
    else
    {
      if (objc_msgSend(v5, "unregisterObserver:", *(_QWORD *)(a1 + 48)))
        objc_msgSend(v2, "addObject:", v5);
      ++v4;
    }

LABEL_25:
  }
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 576);
  *(_QWORD *)(v10 + 576) = v2;

}

- (BOOL)supportsSnapping
{
  return +[GEOZilchDecoder decodingSupported](GEOZilchDecoder, "decodingSupported");
}

- (id)getSnappedPathsForVisibleRect:(id)a3 rectsToSnap:(id *)a4 rectsToSnapCount:(unint64_t)a5 observer:(id)a6 completionHandler:(id)a7
{
  double var1;
  double var0;
  double v12;
  double v13;
  id v15;
  id v16;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v27;
  __int128 v28;
  __int128 v29;
  double v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v12 = a3.var0.var1;
  v13 = a3.var0.var0;
  v36 = *MEMORY[0x1E0C80C00];
  v27 = a6;
  v15 = a7;
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v17 = self->_sections;
  v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v32 != v19)
          objc_enumerationMutation(v17);
        v21 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        if (v21)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "bounds");
          v23 = *((double *)&v28 + 1);
          v22 = *(double *)&v28;
          v24 = *((double *)&v29 + 1);
          v25 = v30;
        }
        else
        {
          v29 = 0u;
          v30 = 0.0;
          v25 = 0.0;
          v24 = 0.0;
          v23 = 0.0;
          v22 = 0.0;
          v28 = 0u;
        }
        if ((GEOMapRectIntersectsRect(v13, v12, var0, var1, v22, v23, v24, v25) & 1) != 0)
          -[GEOComposedRoute _addSnappedPolylinePathsForSection:toPaths:rects:rectsCount:](self, "_addSnappedPolylinePathsForSection:toPaths:rects:rectsCount:", v21, v16, a4, a5);
      }
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v18);
  }

  -[GEOComposedRoute _snapPaths:completionHandler:](self, "_snapPaths:completionHandler:", v16, v15);
  -[GEOComposedRoute _addPaths:forObserver:](self, "_addPaths:forObserver:", v16, v27);

  return v16;
}

- (id)getSnappedPathsForVisibleRect:(id)a3 rectsToSnap:(id *)a4 rectsToSnapCount:(unint64_t)a5 observer:(id)a6
{
  -[GEOComposedRoute getSnappedPathsForVisibleRect:rectsToSnap:rectsToSnapCount:observer:completionHandler:](self, "getSnappedPathsForVisibleRect:rectsToSnap:rectsToSnapCount:observer:completionHandler:", a4, a5, a6, 0, a3.var0.var0, a3.var0.var1, a3.var1.var0, a3.var1.var1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)getSnappedPathsForLocation:(id)a3 radius:(double)a4 observer:(id)a5
{
  double var1;
  double var0;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  __int128 v25;
  __int128 v26;
  double v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  double v32;
  double v33;
  double v34;
  double v35;
  _BYTE v36[128];
  uint64_t v37;

  var1 = a3.var1;
  var0 = a3.var0;
  v37 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  if (a4 >= 200.0)
    v10 = a4;
  else
    v10 = 200.0;
  v32 = GEOMapRectMakeWithRadialDistance(var0, var1, v10);
  v33 = v11;
  v34 = v12;
  v35 = v13;
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v15 = self->_sections;
  v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v29 != v17)
          objc_enumerationMutation(v15);
        v19 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        if (v19)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "bounds");
          v21 = *((double *)&v25 + 1);
          v20 = *(double *)&v25;
          v22 = *((double *)&v26 + 1);
          v23 = v27;
        }
        else
        {
          v26 = 0u;
          v27 = 0.0;
          v23 = 0.0;
          v22 = 0.0;
          v21 = 0.0;
          v20 = 0.0;
          v25 = 0u;
        }
        if ((GEOMapRectIntersectsRect(v20, v21, v22, v23, v32, v33, v34, v35) & 1) != 0)
          -[GEOComposedRoute _addSnappedPolylinePathsForSection:toPaths:rects:rectsCount:](self, "_addSnappedPolylinePathsForSection:toPaths:rects:rectsCount:", v19, v14, &v32, 1);
      }
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v16);
  }

  -[GEOComposedRoute _snapPaths:completionHandler:](self, "_snapPaths:completionHandler:", v14, 0);
  -[GEOComposedRoute _addPaths:forObserver:](self, "_addPaths:forObserver:", v14, v9);

  return v14;
}

- (void)clearSnappedPathsForObserver:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  geo_reentrant_isolate_sync();

}

void __49__GEOComposedRoute_clearSnappedPathsForObserver___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 576);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v7, "unregisterObserver:", *(_QWORD *)(a1 + 40), (_QWORD)v10))
          objc_msgSend(v2, "addObject:", v7);
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 576);
  *(_QWORD *)(v8 + 576) = v2;

}

- (void)forEachSnappedPath:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  geo_reentrant_isolate_sync();

}

void __39__GEOComposedRoute_forEachSnappedPath___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 576);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (BOOL)isSnapping
{
  char v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  geo_reentrant_isolate_sync();
  v2 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __30__GEOComposedRoute_isSnapping__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 576);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v7;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v2);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * i), "isMapMatching", (_QWORD)v6))
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

}

- (GEOComposedRouteTraffic)traffic
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__15;
  v8 = __Block_byref_object_dispose__15;
  v9 = 0;
  geo_isolate_sync();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (GEOComposedRouteTraffic *)v2;
}

void __27__GEOComposedRoute_traffic__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 608), "traffic");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSArray)rideSelections
{
  id v3;
  id v4;
  uint64_t v6;
  id *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = (id *)&v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__15;
  v10 = __Block_byref_object_dispose__15;
  v11 = 0;
  geo_isolate_sync();
  v3 = v7[5];
  if (!v3)
  {
    objc_storeStrong(v7 + 5, self->_initialRideSelections);
    v3 = v7[5];
  }
  v4 = v3;
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v4;
}

void __34__GEOComposedRoute_rideSelections__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 608), "rideSelections");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)applyUpdatesToTransitRoute:(id)a3
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  NSArray *v14;
  NSArray *transitRouteUpdateAlerts;
  GEOComposedRouteTransitDisplayStrings *v16;
  GEOComposedRouteTransitDisplayStrings *transitRouteDisplayStrings;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  GEOObserverHashTable *observers;
  id v25;
  uint64_t v26;
  _BOOL4 v27;
  id v28;
  id obj;
  os_log_t log;
  _QWORD v31[4];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  if (objc_msgSend(v28, "count") && self->_suggestedRoute)
  {
    GEOGetGEOComposedRouteLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      -[GEOComposedRoute uniqueRouteID](self, "uniqueRouteID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v39 = (uint64_t)v5;
      v40 = 2048;
      v41 = objc_msgSend(v28, "count");
      _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_DEBUG, "%{public}@: Will apply %lu transit updates", buf, 0x16u);

    }
    log = (os_log_t)objc_msgSend(v28, "mutableCopy");
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = v28;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v34 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          if (objc_msgSend(v9, "status") == 1)
          {
            objc_msgSend(v9, "routeIdentifier");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "clientRouteID");
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            -[GEOComposedRoute uniqueRouteID](self, "uniqueRouteID");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v11, "isEqual:", v12);

            if ((v13 & 1) != 0)
            {
              objc_msgSend(v9, "alerts");
              v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
              transitRouteUpdateAlerts = self->_transitRouteUpdateAlerts;
              self->_transitRouteUpdateAlerts = v14;

              objc_msgSend(v9, "displayStrings");
              v16 = (GEOComposedRouteTransitDisplayStrings *)objc_claimAutoreleasedReturnValue();
              transitRouteDisplayStrings = self->_transitRouteDisplayStrings;
              self->_transitRouteDisplayStrings = v16;

              objc_msgSend(v9, "displayStrings");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              -[GEOComposedRoute _initStringsForTransitRouteDisplayStrings:](self, "_initStringsForTransitRouteDisplayStrings:", v18);

              v19 = objc_alloc(MEMORY[0x1E0C99E08]);
              objc_msgSend(v9, "stepUpdates");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "stepUpdates");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "valueForKey:", CFSTR("updateIdentifier"));
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = (void *)objc_msgSend(v19, "initWithObjects:forKeys:", v20, v22);

              if (objc_msgSend(v23, "count"))
              {
                v31[0] = MEMORY[0x1E0C809B0];
                v31[1] = 3221225472;
                v31[2] = __47__GEOComposedRoute_applyUpdatesToTransitRoute___block_invoke;
                v31[3] = &unk_1E1C05DE8;
                v32 = v23;
                -[GEOComposedRoute _enumerateAllStepsWithBlock:](self, "_enumerateAllStepsWithBlock:", v31);

              }
            }
            else
            {
              -[NSObject removeObject:](log, "removeObject:", v9);
            }

          }
          else
          {
            -[NSObject removeObject:](log, "removeObject:", v9);
          }
        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v6);
    }

    if (-[NSObject count](log, "count"))
    {
      -[GEOComposedRoute _updateRevisionIdentifier](self, "_updateRevisionIdentifier");
      observers = self->_observers;
      v25 = -[NSObject copy](log, "copy");
      -[GEOObserverHashTable composedRoute:appliedTransitRouteUpdates:](observers, "composedRoute:appliedTransitRouteUpdates:", self, v25);

    }
  }
  else
  {
    GEOGetGEOComposedRouteLog();
    log = (os_log_t)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
    {
      v26 = objc_msgSend(v28, "count");
      v27 = self->_suggestedRoute != 0;
      *(_DWORD *)buf = 134218240;
      v39 = v26;
      v40 = 1026;
      LODWORD(v41) = v27;
      _os_log_impl(&dword_1885A9000, log, OS_LOG_TYPE_DEBUG, "Will not apply transit updates (%lu updates, has suggested route: %{public}d", buf, 0x12u);
    }
  }

}

void __47__GEOComposedRoute_applyUpdatesToTransitRoute___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "updateIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v10, "updateIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v10, "updateTransitStep:", v9);
      if (!objc_msgSend(*(id *)(a1 + 32), "count"))
        *a4 = 1;
    }

  }
}

- (void)updateTransitRouteUpdateRequest:(id)a3
{
  id v4;
  GEOTransitRouteUpdateRequest *v5;
  GEOTransitRouteUpdateRequest *transitRouteUpdateRequest;
  GEOTransitRouteUpdateRequest *v7;
  void *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    v5 = (GEOTransitRouteUpdateRequest *)objc_msgSend(v4, "copy");
    transitRouteUpdateRequest = self->_transitRouteUpdateRequest;
    self->_transitRouteUpdateRequest = v5;

    -[GEOTransitRouteUpdateRequest clearRouteIdentifiers](self->_transitRouteUpdateRequest, "clearRouteIdentifiers");
    v7 = self->_transitRouteUpdateRequest;
    +[GEOTransitRouteIdentifier routeIdentiferForComposedRoute:](GEOTransitRouteIdentifier, "routeIdentiferForComposedRoute:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOTransitRouteUpdateRequest addRouteIdentifier:](v7, "addRouteIdentifier:", v8);

    v4 = v9;
  }

}

- (BOOL)shouldShowSchedule
{
  GEORouteDisplayHints *displayHints;

  displayHints = self->_displayHints;
  return !displayHints || -[GEORouteDisplayHints showTransitSchedules](displayHints, "showTransitSchedules");
}

- (id)getHallForStop:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "hasHallIndex")
    && (v5 = objc_msgSend(v4, "hallIndex"), -[GEOTransitDecoderData hallsCount](self->_decoderData, "hallsCount") > v5))
  {
    -[GEOTransitDecoderData hallAtIndex:](self->_decoderData, "hallAtIndex:", objc_msgSend(v4, "hallIndex"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)getStationForHall:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "hasStationIndex")
    && (v5 = objc_msgSend(v4, "stationIndex"),
        -[GEOTransitDecoderData stationsCount](self->_decoderData, "stationsCount") > v5))
  {
    -[GEOTransitDecoderData stationAtIndex:](self->_decoderData, "stationAtIndex:", objc_msgSend(v4, "stationIndex"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)getStationForStop:(id)a3
{
  void *v4;
  void *v5;

  -[GEOComposedRoute getHallForStop:](self, "getHallForStop:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[GEOComposedRoute getStationForHall:](self, "getStationForHall:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isStopInTerminalStructure:(id)a3
{
  void *v3;
  void *v4;
  int v5;
  int v6;

  -[GEOComposedRoute getStationForStop:](self, "getStationForStop:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "hasStructureType") ^ 1;
  else
    LOBYTE(v5) = 0;
  if (objc_msgSend(v4, "hasStructureType"))
  {
    v6 = objc_msgSend(v4, "structureType");
    if ((v6 + 1) < 6)
      v5 = (0x39u >> (v6 + 1)) & 1;
  }

  return v5;
}

- (GEOServerFormattedString)previewDurationFormatString
{
  void *previewDurationFormatString;
  void *v4;
  GEOServerFormattedString *v5;

  -[GEOComposedRouteTransitDisplayStrings previewDurationFormatString](self->_transitRouteDisplayStrings, "previewDurationFormatString");
  previewDurationFormatString = (void *)objc_claimAutoreleasedReturnValue();
  v4 = previewDurationFormatString;
  if (!previewDurationFormatString)
    previewDurationFormatString = self->_previewDurationFormatString;
  v5 = previewDurationFormatString;

  return v5;
}

- (GEOServerFormattedString)pickingDurationFormatString
{
  void *pickingDurationFormatString;
  void *v4;
  GEOServerFormattedString *v5;

  -[GEOComposedRouteTransitDisplayStrings pickingDurationFormatString](self->_transitRouteDisplayStrings, "pickingDurationFormatString");
  pickingDurationFormatString = (void *)objc_claimAutoreleasedReturnValue();
  v4 = pickingDurationFormatString;
  if (!pickingDurationFormatString)
    pickingDurationFormatString = self->_pickingDurationFormatString;
  v5 = pickingDurationFormatString;

  return v5;
}

- (GEOServerFormattedString)planningDescriptionFormatString
{
  void *planningDescriptionFormatString;
  void *v4;
  GEOServerFormattedString *v5;

  -[GEOComposedRouteTransitDisplayStrings planningDescriptionFormatString](self->_transitRouteDisplayStrings, "planningDescriptionFormatString");
  planningDescriptionFormatString = (void *)objc_claimAutoreleasedReturnValue();
  v4 = planningDescriptionFormatString;
  if (!planningDescriptionFormatString)
    planningDescriptionFormatString = self->_planningDescriptionFormatString;
  v5 = planningDescriptionFormatString;

  return v5;
}

- (GEOServerFormattedString)transitDescriptionFormatString
{
  void *transitDescriptionFormatString;
  void *v4;
  GEOServerFormattedString *v5;

  -[GEOComposedRouteTransitDisplayStrings transitDescriptionFormatString](self->_transitRouteDisplayStrings, "transitDescriptionFormatString");
  transitDescriptionFormatString = (void *)objc_claimAutoreleasedReturnValue();
  v4 = transitDescriptionFormatString;
  if (!transitDescriptionFormatString)
    transitDescriptionFormatString = self->_transitDescriptionFormatString;
  v5 = transitDescriptionFormatString;

  return v5;
}

- (GEOServerFormattedString)transitRouteBadge
{
  void *transitRouteBadge;
  void *v4;
  GEOServerFormattedString *v5;

  -[GEOComposedRouteTransitDisplayStrings transitRouteBadge](self->_transitRouteDisplayStrings, "transitRouteBadge");
  transitRouteBadge = (void *)objc_claimAutoreleasedReturnValue();
  v4 = transitRouteBadge;
  if (!transitRouteBadge)
    transitRouteBadge = self->_transitRouteBadge;
  v5 = transitRouteBadge;

  return v5;
}

- (void)_updateRevisionIdentifier
{
  NSUUID *v3;
  NSUUID *v4;
  NSUUID *revisionIdentifier;
  NSObject *v6;
  void *v7;
  NSUUID *v8;
  int v9;
  void *v10;
  __int16 v11;
  NSUUID *v12;
  __int16 v13;
  NSUUID *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = self->_revisionIdentifier;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  revisionIdentifier = self->_revisionIdentifier;
  self->_revisionIdentifier = v4;

  GEOGetGEOComposedRouteLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    -[GEOComposedRoute uniqueRouteID](self, "uniqueRouteID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = self->_revisionIdentifier;
    v9 = 138543874;
    v10 = v7;
    v11 = 2114;
    v12 = v3;
    v13 = 2114;
    v14 = v8;
    _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_DEBUG, "%{public}@: Updated revision ID %{public}@ -> %{public}@", (uint8_t *)&v9, 0x20u);

  }
}

- (void)setRevisionIdentifier:(id)a3
{
  id v5;
  NSUUID **p_revisionIdentifier;
  NSUUID *v7;
  NSObject *v8;
  void *v9;
  NSUUID *v10;
  int v11;
  void *v12;
  __int16 v13;
  NSUUID *v14;
  __int16 v15;
  NSUUID *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_revisionIdentifier = &self->_revisionIdentifier;
  v7 = self->_revisionIdentifier;
  objc_storeStrong((id *)&self->_revisionIdentifier, a3);
  GEOGetGEOComposedRouteLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    -[GEOComposedRoute uniqueRouteID](self, "uniqueRouteID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *p_revisionIdentifier;
    v11 = 138543874;
    v12 = v9;
    v13 = 2114;
    v14 = v7;
    v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_DEBUG, "%{public}@: Setting revision ID %{public}@ -> %{public}@", (uint8_t *)&v11, 0x20u);

  }
}

- (BOOL)supportsRideClusters
{
  return -[GEOTransitSuggestedRoute sectionOptionsCount](self->_suggestedRoute, "sectionOptionsCount") != 0;
}

- (id)_nextOptionForOption:(id)a3 rideIndex:(unint64_t)a4
{
  id v6;
  unsigned int v7;
  void *v8;
  void *v9;

  v6 = a3;
  if (objc_msgSend(v6, "sectionsCount") <= a4)
    v7 = objc_msgSend(v6, "defaultSectionIndex");
  else
    v7 = objc_msgSend(v6, "sectionAtIndex:", a4);
  if (-[GEOTransitSuggestedRoute sectionsCount](self->_suggestedRoute, "sectionsCount") <= v7)
  {
    v8 = 0;
  }
  else
  {
    -[GEOTransitSuggestedRoute sectionAtIndex:](self->_suggestedRoute, "sectionAtIndex:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v8, "hasNextOptionsIndex"))
  {
    -[GEOTransitSuggestedRoute sectionOptionAtIndex:](self->_suggestedRoute, "sectionOptionAtIndex:", (int)objc_msgSend(v8, "nextOptionsIndex"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)_tripIndexForTripSegment:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[GEOComposedRoute segments](self, "segments", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = 0;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(id *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (v10 == v4)
            goto LABEL_12;
          ++v7;
        }
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  v7 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_12:

  return v7;
}

- (id)sectionOptionForTripIndex:(unint64_t)a3
{
  void *v5;

  if (-[NSArray count](self->_currentSectionOptions, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_currentSectionOptions, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)sectionOptionForTripSegment:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;

  v4 = a3;
  v5 = -[GEOComposedRoute _tripIndexForTripSegment:](self, "_tripIndexForTripSegment:", v4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = 0;
  }
  else
  {
    -[GEOComposedRoute sectionOptionForTripIndex:](self, "sectionOptionForTripIndex:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)boardStepForSection:(id)a3
{
  id v4;
  unint64_t i;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  for (i = 0; i < objc_msgSend(v4, "stepIndexsCount"); ++i)
  {
    v6 = objc_msgSend(v4, "stepIndexAtIndex:", i);
    -[GEOTransitDecoderData steps](self->_decoderData, "steps");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count") <= (unint64_t)v6)
    {
      v9 = 0;
    }
    else
    {
      -[GEOTransitDecoderData steps](self->_decoderData, "steps");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndex:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (objc_msgSend(v9, "maneuverType") == 3)
      goto LABEL_9;

  }
  v9 = 0;
LABEL_9:

  return v9;
}

- (void)tripSegment:(id)a3 didSelectRide:(unint64_t)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  unint64_t v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  unint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[GEOComposedRoute _tripIndexForTripSegment:](self, "_tripIndexForTripSegment:", v6);
  -[GEOComposedRoute rideSelections](self, "rideSelections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  if (v10 != a4)
  {
    GEOGetGEOComposedRouteLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      -[GEOComposedRoute uniqueRouteID](self, "uniqueRouteID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v17 = v12;
      v18 = 2048;
      v19 = a4;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_INFO, "%{public}@: Updating ride index %lu for trip segment %@", buf, 0x20u);

    }
    geo_isolate_sync();
    -[GEOComposedRoute _rebuildRouteForRideChange](self, "_rebuildRouteForRideChange");
    -[GEOComposedRoute _updateRevisionIdentifier](self, "_updateRevisionIdentifier");
    GEOGetGEOComposedRouteLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      -[GEOComposedRoute uniqueRouteID](self, "uniqueRouteID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[GEOObserverHashTable count](self->_observers, "count");
      *(_DWORD *)buf = 138543618;
      v17 = v14;
      v18 = 2048;
      v19 = v15;
      _os_log_impl(&dword_1885A9000, v13, OS_LOG_TYPE_DEBUG, "%{public}@: Will notify %lu observers of updated ride index for trip segment", buf, 0x16u);

    }
    -[GEOObserverHashTable composedRoute:changedSelectedRideInClusteredSegment:fromIndex:toIndex:](self->_observers, "composedRoute:changedSelectedRideInClusteredSegment:fromIndex:toIndex:", self, v6, v10, a4);
  }

}

void __46__GEOComposedRoute_tripSegment_didSelectRide___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1[4] + 608), "rideSelections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:atIndexedSubscript:", v3, a1[5]);

  v4 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(*(id *)(a1[4] + 608), "setRideSelections:", v4);

}

- (void)_rebuildRouteForRideChange
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  GEOTransitSuggestedRoute *suggestedRoute;
  GEOTransitDecoderData *decoderData;
  void *v9;
  void *v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  GEOGetGEOComposedRouteLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[GEOComposedRoute uniqueRouteID](self, "uniqueRouteID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v12 = v4;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_INFO, "%{public}@: Rebuilding route for ride change", buf, 0xCu);

  }
  -[GEOComposedRoute rideSelections](self, "rideSelections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOTransitRouteBuilder optionsForRideSelections:forSuggestionRoute:](GEOTransitRouteBuilder, "optionsForRideSelections:forSuggestionRoute:", v5, self->_suggestedRoute);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOTransitRouteBuilder preprocessClusteredSuggestedRoute:withSectionOptions:andRideSelections:andDecoderData:](GEOTransitRouteBuilder, "preprocessClusteredSuggestedRoute:withSectionOptions:andRideSelections:andDecoderData:", self->_suggestedRoute, v6, v5, self->_decoderData);
  decoderData = self->_decoderData;
  suggestedRoute = self->_suggestedRoute;
  -[GEORouteInitializerData waypoints](self->_routeInitializerData, "waypoints");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOTransitRouteBuilder outputForSuggestedRoute:withDecoderData:andWaypoints:andArrivalParameters:andCustodian:andRideSelections:andSectionOptions:](GEOTransitRouteBuilder, "outputForSuggestedRoute:withDecoderData:andWaypoints:andArrivalParameters:andCustodian:andRideSelections:andSectionOptions:", suggestedRoute, decoderData, v9, 0, self, v5, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[GEOComposedRoute _ingestRouteBuilderOutput:](self, "_ingestRouteBuilderOutput:", v10);
  -[GEOComposedRoute _initializeManeuverDisplaySteps](self, "_initializeManeuverDisplaySteps");

}

- (void)updateRouteWithRideSelections:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  unint64_t v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[GEOComposedRoute rideSelections](self, "rideSelections");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v20, "count");
  if (objc_msgSend(v4, "count") | v5)
  {
    if (!objc_msgSend(v4, "count") || objc_msgSend(v4, "count") != v5)
    {
      GEOGetGEOComposedRouteLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        -[GEOComposedRoute uniqueRouteID](self, "uniqueRouteID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v22 = v8;
        v23 = 2048;
        v24 = v5;
        v25 = 2048;
        v26 = objc_msgSend(v4, "count");
        _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Trying to set incorrect number of ride selections (expected %lu, received %lu)", buf, 0x20u);

      }
      goto LABEL_10;
    }
    if (v4 && objc_msgSend(v4, "isEqualToArray:", v20))
    {
      GEOGetGEOComposedRouteLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        -[GEOComposedRoute uniqueRouteID](self, "uniqueRouteID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v22 = v7;
        v23 = 2112;
        v24 = (uint64_t)v4;
        _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_INFO, "%{public}@: Will not update route ride selections, already set to %@", buf, 0x16u);

      }
LABEL_10:

      goto LABEL_11;
    }
    GEOGetGEOComposedRouteLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      -[GEOComposedRoute uniqueRouteID](self, "uniqueRouteID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v10;
      v23 = 2114;
      v24 = (uint64_t)v4;
      _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_INFO, "%{public}@: Updating route with ride selections: %{public}@", buf, 0x16u);

    }
    -[GEOComposedRoute segments](self, "segments");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v12)
    {
      v13 = 0;
      v14 = 0;
      do
      {
        -[GEOComposedRoute segments](self, "segments");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectAtIndexedSubscript:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v17 = v16;
          if (v14 < objc_msgSend(v4, "count"))
          {
            objc_msgSend(v4, "objectAtIndexedSubscript:", v14);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "unsignedIntegerValue");

            if (v19 < objc_msgSend(v17, "rideOptionsCount"))
              objc_msgSend(v17, "setSelectedRideOptionIndex:", v19);
            ++v14;
          }

        }
        ++v13;
      }
      while (v12 != v13);
    }
  }
LABEL_11:

}

- (id)ticketingSegmentsForSelectedRides
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _GEOTransitTicketingSegment *v16;
  uint64_t v17;
  void *v18;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTransitSuggestedRoute sectionOptions](self->_suggestedRoute, "sectionOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndex:", 0);
  v3 = objc_claimAutoreleasedReturnValue();

  v25 = (void *)v3;
  -[GEOComposedRoute rideSelections](self, "rideSelections");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
    do
    {
      v21 = v4;
      objc_msgSend(v20, "objectAtIndexedSubscript:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v5, "unsignedIntegerValue");

      -[GEOTransitSuggestedRoute sectionAtIndex:](self->_suggestedRoute, "sectionAtIndex:", objc_msgSend(v25, "sectionAtIndex:", v24));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v22 = v6;
      objc_msgSend(v6, "ticketingSegments");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v28 != v9)
              objc_enumerationMutation(v7);
            v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
            if (objc_msgSend(v11, "hasTicketingUrl"))
            {
              objc_msgSend(v11, "ticketingUrl");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "stringByAddingPercentEncodingWithAllowedCharacters:", v13);
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (v15)
              {
                v16 = -[_GEOTransitTicketingSegment initWithSegment:]([_GEOTransitTicketingSegment alloc], "initWithSegment:", v11);
                if (v16)
                  objc_msgSend(v26, "addObject:", v16);

              }
            }
          }
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        }
        while (v8);
      }

      -[GEOComposedRoute _nextOptionForOption:rideIndex:](self, "_nextOptionForOption:rideIndex:", v25, v24);
      v17 = objc_claimAutoreleasedReturnValue();

      v4 = v21 + 1;
      v25 = (void *)v17;
    }
    while (v17);
  }
  v18 = (void *)objc_msgSend(v26, "copy", v4);

  return v18;
}

- (BOOL)allowsNetworkTileLoad
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedRoute)initWithCoder:(id)a3
{
  GEOComposedRoute *v4;
  uint64_t v5;
  GEOWaypointRoute *geoWaypointRoute;
  uint64_t v7;
  GEOTransitDecoderData *decoderData;
  uint64_t v9;
  GEOTransitSuggestedRoute *suggestedRoute;
  uint64_t v11;
  GEOTransitSuggestedRoute *originalSuggestedRoute;
  uint64_t v13;
  GEOComposedRouteCoordinateArray *coordinates;
  uint64_t v15;
  NSArray *legs;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  NSArray *segments;
  NSArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  NSArray *steps;
  NSArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  uint64_t v33;
  NSArray *composedGuidanceEvents;
  uint64_t v35;
  NSArray *enrouteNotices;
  uint64_t v37;
  GEOComposedRouteCellularCoverage *cellularCoverage;
  uint64_t v39;
  NSArray *visualInfos;
  uint64_t v41;
  NSArray *visualInfosForRouteNameLabels;
  uint64_t v43;
  NSArray *cameraInfos;
  void *v45;
  GEOWaypointRoute *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t m;
  GEOComposedRouteETAUPosition *v55;
  uint64_t v56;
  NSArray *etauPositions;
  uint64_t v58;
  NSString *name;
  uint64_t v60;
  NSString *userProvidedName;
  uint64_t v62;
  NSString *userProvidedNotes;
  uint64_t v64;
  NSUUID *storageID;
  uint64_t v66;
  GEOMapItemIdentifier *tourIdentifier;
  uint64_t v68;
  NSString *disclaimerText;
  uint64_t v70;
  GEOPDURLData *disclaimerURL;
  uint64_t v72;
  NSData *serverRouteID;
  uint64_t v74;
  NSUUID *uniqueRouteID;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  uint64_t v82;
  NSDate *startDate;
  uint64_t v84;
  GEOComposedString *routeLabelDescriptionString;
  uint64_t v86;
  GEOServerFormattedString *routeLabelDescription;
  uint64_t v88;
  GEOLabelAction *routeLabelAction;
  uint64_t v90;
  GEOTransitArtworkDataSource *routeLabelArtwork;
  uint64_t v92;
  NSString *trafficDescription;
  uint64_t v94;
  GEOPBTransitArtwork *trafficDescriptionArtwork;
  uint64_t v96;
  GEORouteRestrictionZoneInfo *restrictionZoneInfo;
  uint64_t v98;
  GEOComposedString *infrastructureDescriptionString;
  uint64_t v100;
  GEOServerFormattedString *infrastructureDescription;
  uint64_t v102;
  GEOComposedString *hikeTypeString;
  uint64_t v104;
  NSArray *maneuverDisplaySteps;
  void *v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  uint64_t v110;
  NSArray *routePlanningArtworks;
  uint64_t v112;
  GEOTransitRoutingIncidentMessage *transitRoutingIncidentMessage;
  uint64_t v114;
  NSArray *currentSectionOptions;
  uint64_t v116;
  GEORouteDisplayHints *displayHints;
  uint64_t v118;
  GEOComposedString *previewDurationString;
  uint64_t v120;
  GEOComposedString *pickingDurationString;
  uint64_t v122;
  GEOComposedString *planningDescriptionString;
  uint64_t v124;
  GEOComposedString *planningDistanceString;
  uint64_t v126;
  GEOServerFormattedString *previewDurationFormatString;
  uint64_t v128;
  GEOServerFormattedString *pickingDurationFormatString;
  uint64_t v130;
  GEOServerFormattedString *planningDescriptionFormatString;
  uint64_t v132;
  GEOServerFormattedString *planningDistanceFormatString;
  uint64_t v134;
  NSString *planningSeparatorString;
  uint64_t v136;
  GEOComposedString *transitDescriptionString;
  uint64_t v138;
  GEOServerFormattedString *transitDescriptionFormatString;
  uint64_t v140;
  NSArray *advisories;
  uint64_t v142;
  GEOComposedString *transitRouteBadgeString;
  uint64_t v144;
  GEOServerFormattedString *transitRouteBadge;
  double v146;
  uint64_t v147;
  GEORouteInitializerData *routeInitializerData;
  uint64_t v149;
  GEORouteAttributes *routeAttributes;
  uint64_t v151;
  NSArray *stops;
  uint64_t v153;
  NSArray *stations;
  uint64_t v155;
  NSArray *halls;
  uint64_t v157;
  GEOComposedRouteAnchorPointList *anchorPoints;
  uint64_t v159;
  GEOTransitRouteUpdateRequest *transitRouteUpdateRequest;
  uint64_t v161;
  NSUUID *revisionIdentifier;
  GEOComposedRoute *v163;
  id v164;
  uint64_t v165;
  NSData *directionsResponseID;
  uint64_t v167;
  NSData *etauResponseID;
  uint64_t v169;
  GEOElevationProfile *elevationProfile;
  GEOTransitSuggestedRoute *v171;
  uint64_t v172;
  GEOComposedRoute *v173;
  NSArray *sections;
  uint64_t v175;
  GEOMapRegion *boundingMapRegion;
  uint64_t v177;
  GEOStyleAttributes *styleAttributes;
  uint64_t v179;
  GEOAddressObject *address;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  _BOOL4 v185;
  NSObject *v186;
  NSObject *v187;
  void *v188;
  void *v189;
  NSObject *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  id obj;
  id v197;
  uint64_t v198;
  uint64_t v199;
  unsigned int v200;
  GEOComposedRoute *v201;
  void *v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  uint8_t buf[4];
  _BYTE v224[10];
  _BYTE v225[128];
  _BYTE v226[128];
  _BYTE v227[128];
  _BYTE v228[128];
  _BYTE v229[128];
  uint64_t v230;

  v230 = *MEMORY[0x1E0C80C00];
  v197 = a3;
  v4 = -[GEOComposedRoute init](self, "init");
  if (v4)
  {
    objc_msgSend(v197, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_geoWaypointRoute"));
    v5 = objc_claimAutoreleasedReturnValue();
    geoWaypointRoute = v4->_geoWaypointRoute;
    v4->_geoWaypointRoute = (GEOWaypointRoute *)v5;

    objc_msgSend(v197, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_decoderData"));
    v7 = objc_claimAutoreleasedReturnValue();
    decoderData = v4->_decoderData;
    v4->_decoderData = (GEOTransitDecoderData *)v7;

    objc_msgSend(v197, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_suggestedRoute"));
    v9 = objc_claimAutoreleasedReturnValue();
    suggestedRoute = v4->_suggestedRoute;
    v4->_suggestedRoute = (GEOTransitSuggestedRoute *)v9;

    objc_msgSend(v197, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_originalSuggestedRoute"));
    v11 = objc_claimAutoreleasedReturnValue();
    originalSuggestedRoute = v4->_originalSuggestedRoute;
    v4->_originalSuggestedRoute = (GEOTransitSuggestedRoute *)v11;

    v4->_usesZilch = objc_msgSend(v197, "decodeBoolForKey:", CFSTR("_usesZilch"));
    v4->_source = objc_msgSend(v197, "decodeIntegerForKey:", CFSTR("_source"));
    objc_msgSend(v197, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_coordinates"));
    v13 = objc_claimAutoreleasedReturnValue();
    coordinates = v4->_coordinates;
    v4->_coordinates = (GEOComposedRouteCoordinateArray *)v13;

    objc_msgSend(v197, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_legs"));
    v15 = objc_claimAutoreleasedReturnValue();
    legs = v4->_legs;
    v4->_legs = (NSArray *)v15;

    v221 = 0u;
    v222 = 0u;
    v219 = 0u;
    v220 = 0u;
    v17 = v4->_legs;
    v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v219, v229, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v220;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v220 != v19)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v219 + 1) + 8 * i), "setRoute:", v4);
        }
        v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v219, v229, 16);
      }
      while (v18);
    }

    objc_msgSend(v197, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_segments"));
    v21 = objc_claimAutoreleasedReturnValue();
    segments = v4->_segments;
    v4->_segments = (NSArray *)v21;

    v217 = 0u;
    v218 = 0u;
    v215 = 0u;
    v216 = 0u;
    v23 = v4->_segments;
    v24 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v215, v228, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v216;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v216 != v25)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v215 + 1) + 8 * j), "setComposedRoute:", v4);
        }
        v24 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v215, v228, 16);
      }
      while (v24);
    }

    objc_msgSend(v197, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_steps"));
    v27 = objc_claimAutoreleasedReturnValue();
    steps = v4->_steps;
    v4->_steps = (NSArray *)v27;

    v213 = 0u;
    v214 = 0u;
    v211 = 0u;
    v212 = 0u;
    v29 = v4->_steps;
    v30 = -[NSArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v211, v227, 16);
    if (v30)
    {
      v31 = *(_QWORD *)v212;
      do
      {
        for (k = 0; k != v30; ++k)
        {
          if (*(_QWORD *)v212 != v31)
            objc_enumerationMutation(v29);
          objc_msgSend(*(id *)(*((_QWORD *)&v211 + 1) + 8 * k), "setComposedRoute:", v4);
        }
        v30 = -[NSArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v211, v227, 16);
      }
      while (v30);
    }

    objc_msgSend(v197, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_composedGuidanceEvents"));
    v33 = objc_claimAutoreleasedReturnValue();
    composedGuidanceEvents = v4->_composedGuidanceEvents;
    v4->_composedGuidanceEvents = (NSArray *)v33;

    objc_msgSend(v197, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_enrouteNotices"));
    v35 = objc_claimAutoreleasedReturnValue();
    enrouteNotices = v4->_enrouteNotices;
    v4->_enrouteNotices = (NSArray *)v35;

    objc_msgSend(v197, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_cellularCoverage"));
    v37 = objc_claimAutoreleasedReturnValue();
    cellularCoverage = v4->_cellularCoverage;
    v4->_cellularCoverage = (GEOComposedRouteCellularCoverage *)v37;

    objc_msgSend(v197, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_visualInfos"));
    v39 = objc_claimAutoreleasedReturnValue();
    visualInfos = v4->_visualInfos;
    v4->_visualInfos = (NSArray *)v39;

    objc_msgSend(v197, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_visualInfosForRouteNameLabels"));
    v41 = objc_claimAutoreleasedReturnValue();
    visualInfosForRouteNameLabels = v4->_visualInfosForRouteNameLabels;
    v4->_visualInfosForRouteNameLabels = (NSArray *)v41;

    objc_msgSend(v197, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_cameraInfos"));
    v43 = objc_claimAutoreleasedReturnValue();
    cameraInfos = v4->_cameraInfos;
    v4->_cameraInfos = (NSArray *)v43;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v4->_geoWaypointRoute;
    if (v46)
    {
      v209 = 0u;
      v210 = 0u;
      v207 = 0u;
      v208 = 0u;
      -[GEOWaypointRoute routeLegs](v46, "routeLegs");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      obj = v47;
      v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v207, v226, 16);
      if (v48)
      {
        v200 = 0;
        v198 = *(_QWORD *)v208;
        do
        {
          v49 = 0;
          v199 = v48;
          do
          {
            if (*(_QWORD *)v208 != v198)
              objc_enumerationMutation(obj);
            v50 = *(void **)(*((_QWORD *)&v207 + 1) + 8 * v49);
            v203 = 0u;
            v204 = 0u;
            v205 = 0u;
            v206 = 0u;
            objc_msgSend(v50, "updateLocations");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v203, v225, 16);
            if (v52)
            {
              v53 = *(_QWORD *)v204;
              do
              {
                for (m = 0; m != v52; ++m)
                {
                  if (*(_QWORD *)v204 != v53)
                    objc_enumerationMutation(v51);
                  v55 = -[GEOComposedRouteETAUPosition initWithComposedRoute:andUpdateLocation:offset:]([GEOComposedRouteETAUPosition alloc], "initWithComposedRoute:andUpdateLocation:offset:", v4, *(_QWORD *)(*((_QWORD *)&v203 + 1) + 8 * m), (double)v200);
                  objc_msgSend(v45, "addObject:", v55);

                }
                v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v203, v225, 16);
              }
              while (v52);
            }

            v200 += objc_msgSend(v50, "distance");
            ++v49;
          }
          while (v49 != v199);
          v47 = obj;
          v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v207, v226, 16);
        }
        while (v48);
      }

    }
    objc_msgSend(v45, "sortedArrayUsingSelector:", sel_compare_);
    v56 = objc_claimAutoreleasedReturnValue();
    etauPositions = v4->_etauPositions;
    v4->_etauPositions = (NSArray *)v56;

    objc_msgSend(v197, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_name"));
    v58 = objc_claimAutoreleasedReturnValue();
    name = v4->_name;
    v4->_name = (NSString *)v58;

    objc_msgSend(v197, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_userProvidedName"));
    v60 = objc_claimAutoreleasedReturnValue();
    userProvidedName = v4->_userProvidedName;
    v4->_userProvidedName = (NSString *)v60;

    objc_msgSend(v197, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_userProvidedNotes"));
    v62 = objc_claimAutoreleasedReturnValue();
    userProvidedNotes = v4->_userProvidedNotes;
    v4->_userProvidedNotes = (NSString *)v62;

    objc_msgSend(v197, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_storageID"));
    v64 = objc_claimAutoreleasedReturnValue();
    storageID = v4->_storageID;
    v4->_storageID = (NSUUID *)v64;

    objc_msgSend(v197, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_tourIdentifier"));
    v66 = objc_claimAutoreleasedReturnValue();
    tourIdentifier = v4->_tourIdentifier;
    v4->_tourIdentifier = (GEOMapItemIdentifier *)v66;

    v4->_tourMuid = objc_msgSend(v197, "decodeInt64ForKey:", CFSTR("_tourMuid"));
    objc_msgSend(v197, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_disclaimerText"));
    v68 = objc_claimAutoreleasedReturnValue();
    disclaimerText = v4->_disclaimerText;
    v4->_disclaimerText = (NSString *)v68;

    objc_msgSend(v197, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_disclaimerURL"));
    v70 = objc_claimAutoreleasedReturnValue();
    disclaimerURL = v4->_disclaimerURL;
    v4->_disclaimerURL = (GEOPDURLData *)v70;

    v4->_serverIdentifier = objc_msgSend(v197, "decodeIntegerForKey:", CFSTR("_serverIdentifier"));
    objc_msgSend(v197, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_serverRouteID"));
    v72 = objc_claimAutoreleasedReturnValue();
    serverRouteID = v4->_serverRouteID;
    v4->_serverRouteID = (NSData *)v72;

    objc_msgSend(v197, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_uniqueRouteID"));
    v74 = objc_claimAutoreleasedReturnValue();
    uniqueRouteID = v4->_uniqueRouteID;
    v4->_uniqueRouteID = (NSUUID *)v74;

    objc_msgSend(v197, "decodeDoubleForKey:", CFSTR("_distance"));
    v4->_distance = v76;
    objc_msgSend(v197, "decodeDoubleForKey:", CFSTR("_totalAscent"));
    v4->_totalAscent = v77;
    objc_msgSend(v197, "decodeDoubleForKey:", CFSTR("_totalDescent"));
    v4->_totalDescent = v78;
    v4->_expectedTime = objc_msgSend(v197, "decodeIntegerForKey:", CFSTR("_expectedTime"));
    v4->_historicTravelTime = objc_msgSend(v197, "decodeIntegerForKey:", CFSTR("_historicTravelTime"));
    objc_msgSend(v197, "decodeDoubleForKey:", CFSTR("_freeflowTravelTime"));
    v4->_freeflowTravelTime = v79;
    objc_msgSend(v197, "decodeDoubleForKey:", CFSTR("_travelTimeAggressiveEstimate"));
    v4->_travelTimeAggressiveEstimate = v80;
    objc_msgSend(v197, "decodeDoubleForKey:", CFSTR("_travelTimeConservativeEstimate"));
    v4->_travelTimeConservativeEstimate = v81;
    v4->_avoidsTolls = objc_msgSend(v197, "decodeBoolForKey:", CFSTR("_avoidsTolls"));
    v4->_avoidsHighways = objc_msgSend(v197, "decodeBoolForKey:", CFSTR("_avoidsHighways"));
    v4->_avoidsTraffic = objc_msgSend(v197, "decodeBoolForKey:", CFSTR("_avoidsTraffic"));
    objc_msgSend(v197, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_startDate"));
    v82 = objc_claimAutoreleasedReturnValue();
    startDate = v4->_startDate;
    v4->_startDate = (NSDate *)v82;

    v4->_isNavigable = objc_msgSend(v197, "decodeBoolForKey:", CFSTR("_isNavigable"));
    v4->_transportType = objc_msgSend(v197, "decodeIntegerForKey:", CFSTR("_transportType"));
    v4->_offlineRoute = objc_msgSend(v197, "decodeBoolForKey:", CFSTR("_offlineRoute"));
    objc_msgSend(v197, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_routeLabelDescriptionString"));
    v84 = objc_claimAutoreleasedReturnValue();
    routeLabelDescriptionString = v4->_routeLabelDescriptionString;
    v4->_routeLabelDescriptionString = (GEOComposedString *)v84;

    objc_msgSend(v197, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_routeLabelDescription"));
    v86 = objc_claimAutoreleasedReturnValue();
    routeLabelDescription = v4->_routeLabelDescription;
    v4->_routeLabelDescription = (GEOServerFormattedString *)v86;

    objc_msgSend(v197, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_routeLabelAction"));
    v88 = objc_claimAutoreleasedReturnValue();
    routeLabelAction = v4->_routeLabelAction;
    v4->_routeLabelAction = (GEOLabelAction *)v88;

    objc_msgSend(v197, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_routeLabelArtwork"));
    v90 = objc_claimAutoreleasedReturnValue();
    routeLabelArtwork = v4->_routeLabelArtwork;
    v4->_routeLabelArtwork = (GEOTransitArtworkDataSource *)v90;

    objc_msgSend(v197, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_trafficDescription"));
    v92 = objc_claimAutoreleasedReturnValue();
    trafficDescription = v4->_trafficDescription;
    v4->_trafficDescription = (NSString *)v92;

    objc_msgSend(v197, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_trafficDescriptionArtwork"));
    v94 = objc_claimAutoreleasedReturnValue();
    trafficDescriptionArtwork = v4->_trafficDescriptionArtwork;
    v4->_trafficDescriptionArtwork = (GEOPBTransitArtwork *)v94;

    objc_msgSend(v197, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_restrictionZoneInfo"));
    v96 = objc_claimAutoreleasedReturnValue();
    restrictionZoneInfo = v4->_restrictionZoneInfo;
    v4->_restrictionZoneInfo = (GEORouteRestrictionZoneInfo *)v96;

    objc_msgSend(v197, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_infrastructureDescriptionString"));
    v98 = objc_claimAutoreleasedReturnValue();
    infrastructureDescriptionString = v4->_infrastructureDescriptionString;
    v4->_infrastructureDescriptionString = (GEOComposedString *)v98;

    objc_msgSend(v197, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_infrastructureDescription"));
    v100 = objc_claimAutoreleasedReturnValue();
    infrastructureDescription = v4->_infrastructureDescription;
    v4->_infrastructureDescription = (GEOServerFormattedString *)v100;

    objc_msgSend(v197, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_hikeTypeString"));
    v102 = objc_claimAutoreleasedReturnValue();
    hikeTypeString = v4->_hikeTypeString;
    v4->_hikeTypeString = (GEOComposedString *)v102;

    objc_msgSend(v197, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_maneuverDisplaySteps"));
    v104 = objc_claimAutoreleasedReturnValue();
    maneuverDisplaySteps = v4->_maneuverDisplaySteps;
    v4->_maneuverDisplaySteps = (NSArray *)v104;

    v4->_maneuverDisplayEnabled = objc_msgSend(v197, "decodeBoolForKey:", CFSTR("_maneuverDisplayEnabled"));
    v4->_currentDisplayStep = objc_msgSend(v197, "decodeIntegerForKey:", CFSTR("_currentDisplayStep"));
    v4->_selectedSegmentIndex = objc_msgSend(v197, "decodeIntegerForKey:", CFSTR("_selectedSegmentIndex"));
    v4->_firstVisiblePoint = objc_msgSend(v197, "decodeIntegerForKey:", CFSTR("_firstVisiblePoint"));
    v106 = (void *)MEMORY[0x1E0C99E60];
    v107 = objc_opt_class();
    v108 = objc_opt_class();
    objc_msgSend(v106, "setWithObjects:", v107, v108, objc_opt_class(), 0);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v197, "decodeObjectOfClasses:forKey:", v109, CFSTR("_routePlanningArtworks"));
    v110 = objc_claimAutoreleasedReturnValue();
    routePlanningArtworks = v4->_routePlanningArtworks;
    v4->_routePlanningArtworks = (NSArray *)v110;

    objc_msgSend(v197, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_transitRoutingIncidentMessage"));
    v112 = objc_claimAutoreleasedReturnValue();
    transitRoutingIncidentMessage = v4->_transitRoutingIncidentMessage;
    v4->_transitRoutingIncidentMessage = (GEOTransitRoutingIncidentMessage *)v112;

    objc_msgSend(v197, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_currentSectionOptions"));
    v114 = objc_claimAutoreleasedReturnValue();
    currentSectionOptions = v4->_currentSectionOptions;
    v4->_currentSectionOptions = (NSArray *)v114;

    objc_msgSend(v197, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_displayHints"));
    v116 = objc_claimAutoreleasedReturnValue();
    displayHints = v4->_displayHints;
    v4->_displayHints = (GEORouteDisplayHints *)v116;

    objc_msgSend(v197, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_previewDurationString"));
    v118 = objc_claimAutoreleasedReturnValue();
    previewDurationString = v4->_previewDurationString;
    v4->_previewDurationString = (GEOComposedString *)v118;

    objc_msgSend(v197, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_pickingDurationString"));
    v120 = objc_claimAutoreleasedReturnValue();
    pickingDurationString = v4->_pickingDurationString;
    v4->_pickingDurationString = (GEOComposedString *)v120;

    objc_msgSend(v197, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_planningDescriptionString"));
    v122 = objc_claimAutoreleasedReturnValue();
    planningDescriptionString = v4->_planningDescriptionString;
    v4->_planningDescriptionString = (GEOComposedString *)v122;

    objc_msgSend(v197, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_planningDistanceString"));
    v124 = objc_claimAutoreleasedReturnValue();
    planningDistanceString = v4->_planningDistanceString;
    v4->_planningDistanceString = (GEOComposedString *)v124;

    objc_msgSend(v197, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_previewDurationFormatString"));
    v126 = objc_claimAutoreleasedReturnValue();
    previewDurationFormatString = v4->_previewDurationFormatString;
    v4->_previewDurationFormatString = (GEOServerFormattedString *)v126;

    objc_msgSend(v197, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_pickingDurationFormatString"));
    v128 = objc_claimAutoreleasedReturnValue();
    pickingDurationFormatString = v4->_pickingDurationFormatString;
    v4->_pickingDurationFormatString = (GEOServerFormattedString *)v128;

    objc_msgSend(v197, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_planningDescriptionFormatString"));
    v130 = objc_claimAutoreleasedReturnValue();
    planningDescriptionFormatString = v4->_planningDescriptionFormatString;
    v4->_planningDescriptionFormatString = (GEOServerFormattedString *)v130;

    objc_msgSend(v197, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_planningDistanceFormatString"));
    v132 = objc_claimAutoreleasedReturnValue();
    planningDistanceFormatString = v4->_planningDistanceFormatString;
    v4->_planningDistanceFormatString = (GEOServerFormattedString *)v132;

    objc_msgSend(v197, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_planningSeparatorString"));
    v134 = objc_claimAutoreleasedReturnValue();
    planningSeparatorString = v4->_planningSeparatorString;
    v4->_planningSeparatorString = (NSString *)v134;

    objc_msgSend(v197, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_transitDescriptionString"));
    v136 = objc_claimAutoreleasedReturnValue();
    transitDescriptionString = v4->_transitDescriptionString;
    v4->_transitDescriptionString = (GEOComposedString *)v136;

    objc_msgSend(v197, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_transitDescriptionFormatString"));
    v138 = objc_claimAutoreleasedReturnValue();
    transitDescriptionFormatString = v4->_transitDescriptionFormatString;
    v4->_transitDescriptionFormatString = (GEOServerFormattedString *)v138;

    objc_msgSend(v197, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_advisories"));
    v140 = objc_claimAutoreleasedReturnValue();
    advisories = v4->_advisories;
    v4->_advisories = (NSArray *)v140;

    objc_msgSend(v197, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_transitRouteBadgeString"));
    v142 = objc_claimAutoreleasedReturnValue();
    transitRouteBadgeString = v4->_transitRouteBadgeString;
    v4->_transitRouteBadgeString = (GEOComposedString *)v142;

    objc_msgSend(v197, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_transitRouteBadge"));
    v144 = objc_claimAutoreleasedReturnValue();
    transitRouteBadge = v4->_transitRouteBadge;
    v4->_transitRouteBadge = (GEOServerFormattedString *)v144;

    objc_msgSend(v197, "decodeDoubleForKey:", CFSTR("_transitUpdateInitialDelay"));
    v4->_transitUpdateInitialDelay = v146;
    v4->_isWalkingOnlyTransitRoute = objc_msgSend(v197, "decodeBoolForKey:", CFSTR("_isWalkingOnlyTransitRoute"));
    objc_msgSend(v197, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_routeInitializerData"));
    v147 = objc_claimAutoreleasedReturnValue();
    routeInitializerData = v4->_routeInitializerData;
    v4->_routeInitializerData = (GEORouteInitializerData *)v147;

    objc_msgSend(v197, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_routeAttributes"));
    v149 = objc_claimAutoreleasedReturnValue();
    routeAttributes = v4->_routeAttributes;
    v4->_routeAttributes = (GEORouteAttributes *)v149;

    objc_msgSend(v197, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_stops"));
    v151 = objc_claimAutoreleasedReturnValue();
    stops = v4->_stops;
    v4->_stops = (NSArray *)v151;

    objc_msgSend(v197, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_stations"));
    v153 = objc_claimAutoreleasedReturnValue();
    stations = v4->_stations;
    v4->_stations = (NSArray *)v153;

    objc_msgSend(v197, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_halls"));
    v155 = objc_claimAutoreleasedReturnValue();
    halls = v4->_halls;
    v4->_halls = (NSArray *)v155;

    objc_msgSend(v197, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_anchorPoints"));
    v157 = objc_claimAutoreleasedReturnValue();
    anchorPoints = v4->_anchorPoints;
    v4->_anchorPoints = (GEOComposedRouteAnchorPointList *)v157;

    objc_msgSend(v197, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_transitRouteUpdateRequest"));
    v159 = objc_claimAutoreleasedReturnValue();
    transitRouteUpdateRequest = v4->_transitRouteUpdateRequest;
    v4->_transitRouteUpdateRequest = (GEOTransitRouteUpdateRequest *)v159;

    objc_msgSend(v197, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_revisionIdentifier"));
    v161 = objc_claimAutoreleasedReturnValue();
    revisionIdentifier = v4->_revisionIdentifier;
    v4->_revisionIdentifier = (NSUUID *)v161;

    v163 = v4;
    v201 = v163;
    v164 = v197;
    v202 = v164;
    geo_isolate_sync();
    objc_msgSend(v164, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_directionsResponseID"));
    v165 = objc_claimAutoreleasedReturnValue();
    directionsResponseID = v163->_directionsResponseID;
    v163->_directionsResponseID = (NSData *)v165;

    objc_msgSend(v164, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_etauResponseID"));
    v167 = objc_claimAutoreleasedReturnValue();
    etauResponseID = v163->_etauResponseID;
    v163->_etauResponseID = (NSData *)v167;

    v163->_indexInResponse = objc_msgSend(v164, "decodeIntegerForKey:", CFSTR("_indexInResponse"));
    objc_msgSend(v164, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_elevationProfile"));
    v169 = objc_claimAutoreleasedReturnValue();
    elevationProfile = v163->_elevationProfile;
    v163->_elevationProfile = (GEOElevationProfile *)v169;

    v163->_initialPromptTypes = objc_msgSend(v164, "decodeIntegerForKey:", CFSTR("_initialPromptTypes"));
    v163->_elevationModel = objc_msgSend(v164, "decodeIntegerForKey:", CFSTR("_elevationModel"));
    v171 = v4->_suggestedRoute;
    if (v171)
      +[GEOTransitRouteBuilder buildRouteSectionsForSuggestedRoute:fromSteps:andSegments:andCoordinates:andDecoderData:](GEOTransitRouteBuilder, "buildRouteSectionsForSuggestedRoute:fromSteps:andSegments:andCoordinates:andDecoderData:", v171, v4->_steps, v4->_segments, v4->_coordinates, v4->_decoderData);
    else
      +[GEORouteBuilder buildPointSectionsWithSteps:segments:coordinates:](GEORouteBuilder, "buildPointSectionsWithSteps:segments:coordinates:", v4->_steps, v4->_segments, v4->_coordinates);
    v172 = objc_claimAutoreleasedReturnValue();
    sections = v163->_sections;
    v163->_sections = (NSArray *)v172;

    +[GEORouteBuilder buildMapRegionFromPointSections:](GEORouteBuilder, "buildMapRegionFromPointSections:", v163->_sections);
    v175 = objc_claimAutoreleasedReturnValue();
    boundingMapRegion = v163->_boundingMapRegion;
    v163->_boundingMapRegion = (GEOMapRegion *)v175;

    objc_msgSend(v164, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_styleAttributes"));
    v177 = objc_claimAutoreleasedReturnValue();
    styleAttributes = v163->_styleAttributes;
    v163->_styleAttributes = (GEOStyleAttributes *)v177;

    objc_msgSend(v164, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_address"));
    v179 = objc_claimAutoreleasedReturnValue();
    address = v163->_address;
    v163->_address = (GEOAddressObject *)v179;

    -[NSArray firstObject](v4->_legs, "firstObject");
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v181, "origin");
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    if (v182)
    {
      -[NSArray lastObject](v4->_legs, "lastObject");
      v183 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v183, "destination");
      v184 = (void *)objc_claimAutoreleasedReturnValue();
      v185 = v184 == 0;

      if (!v185)
      {
        objc_msgSend(v164, "error");
        v186 = objc_claimAutoreleasedReturnValue();
        v187 = v186;
        if (v186)
        {
          -[NSObject userInfo](v186, "userInfo");
          v188 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v188, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2938]);
          v189 = (void *)objc_claimAutoreleasedReturnValue();

          GEOGetGEOComposedRouteLog();
          v190 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v190, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v224 = v189;
            _os_log_impl(&dword_1885A9000, v190, OS_LOG_TYPE_ERROR, "Error decoding GEOComposedRoute: %@", buf, 0xCu);
          }

          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v224 = v189;
            _os_log_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Error decoding GEOComposedRoute: %@", buf, 0xCu);
          }
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: NO", buf, 2u);
          }

        }
        v173 = v163;
LABEL_58:

        goto LABEL_59;
      }
    }
    else
    {

    }
    GEOGetGEOComposedRouteLog();
    v187 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v187, OS_LOG_TYPE_ERROR))
    {
      -[NSArray firstObject](v4->_legs, "firstObject");
      v191 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v191, "origin");
      v192 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray lastObject](v4->_legs, "lastObject");
      v193 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v193, "destination");
      v194 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v224 = v192 != 0;
      *(_WORD *)&v224[4] = 1024;
      *(_DWORD *)&v224[6] = v194 != 0;
      _os_log_impl(&dword_1885A9000, v187, OS_LOG_TYPE_ERROR, "GEOComposedRoute was deserialized without a proper origin and destination. This is either an error with the decoder or the incoming serialized data. Origin: %d, Destination: %d", buf, 0xEu);

    }
    v173 = 0;
    goto LABEL_58;
  }
  v173 = 0;
LABEL_59:

  return v173;
}

void __34__GEOComposedRoute_initWithCoder___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 40), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_mutableData"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 608);
  *(_QWORD *)(v3 + 608) = v2;

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;
  geo_isolater *v6;

  v4 = a3;
  v6 = self->_encodeIsolater;
  _geo_isolate_lock();
  objc_msgSend(v4, "encodeObject:forKey:", self->_geoWaypointRoute, CFSTR("_geoWaypointRoute"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_decoderData, CFSTR("_decoderData"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_suggestedRoute, CFSTR("_suggestedRoute"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_originalSuggestedRoute, CFSTR("_originalSuggestedRoute"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_usesZilch, CFSTR("_usesZilch"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_source, CFSTR("_source"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_coordinates, CFSTR("_coordinates"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_legs, CFSTR("_legs"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_segments, CFSTR("_segments"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_steps, CFSTR("_steps"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_composedGuidanceEvents, CFSTR("_composedGuidanceEvents"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_enrouteNotices, CFSTR("_enrouteNotices"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_cellularCoverage, CFSTR("_cellularCoverage"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_visualInfos, CFSTR("_visualInfos"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_visualInfosForRouteNameLabels, CFSTR("_visualInfosForRouteNameLabels"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_cameraInfos, CFSTR("_cameraInfos"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_name, CFSTR("_name"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_userProvidedName, CFSTR("_userProvidedName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_userProvidedNotes, CFSTR("_userProvidedNotes"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_storageID, CFSTR("_storageID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_tourIdentifier, CFSTR("_tourIdentifier"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_tourMuid, CFSTR("_tourMuid"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_disclaimerText, CFSTR("_disclaimerText"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_disclaimerURL, CFSTR("_disclaimerURL"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_serverIdentifier, CFSTR("_serverIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_serverRouteID, CFSTR("_serverRouteID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_uniqueRouteID, CFSTR("_uniqueRouteID"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_distance"), self->_distance);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_totalAscent"), self->_totalAscent);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_totalDescent"), self->_totalDescent);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_expectedTime, CFSTR("_expectedTime"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_historicTravelTime, CFSTR("_historicTravelTime"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_freeflowTravelTime"), self->_freeflowTravelTime);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_travelTimeAggressiveEstimate"), self->_travelTimeAggressiveEstimate);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_travelTimeConservativeEstimate"), self->_travelTimeConservativeEstimate);
  objc_msgSend(v4, "encodeBool:forKey:", self->_avoidsTolls, CFSTR("_avoidsTolls"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_avoidsHighways, CFSTR("_avoidsHighways"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_avoidsTraffic, CFSTR("_avoidsTraffic"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_startDate, CFSTR("_startDate"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isNavigable, CFSTR("_isNavigable"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_transportType, CFSTR("_transportType"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_offlineRoute, CFSTR("_offlineRoute"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_routeLabelDescriptionString, CFSTR("_routeLabelDescriptionString"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_routeLabelAction, CFSTR("_routeLabelAction"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_routeLabelDescription, CFSTR("_routeLabelDescription"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_routeLabelArtwork, CFSTR("_routeLabelArtwork"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_trafficDescription, CFSTR("_trafficDescription"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_trafficDescriptionArtwork, CFSTR("_trafficDescriptionArtwork"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_restrictionZoneInfo, CFSTR("_restrictionZoneInfo"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_infrastructureDescriptionString, CFSTR("_infrastructureDescriptionString"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_infrastructureDescription, CFSTR("_infrastructureDescription"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_hikeTypeString, CFSTR("_hikeTypeString"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_maneuverDisplaySteps, CFSTR("_maneuverDisplaySteps"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_maneuverDisplayEnabled, CFSTR("_maneuverDisplayEnabled"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_currentDisplayStep, CFSTR("_currentDisplayStep"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_selectedSegmentIndex, CFSTR("_selectedSegmentIndex"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_firstVisiblePoint, CFSTR("_firstVisiblePoint"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_routePlanningArtworks, CFSTR("_routePlanningArtworks"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_transitRoutingIncidentMessage, CFSTR("_transitRoutingIncidentMessage"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_currentSectionOptions, CFSTR("_currentSectionOptions"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_displayHints, CFSTR("_displayHints"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_previewDurationString, CFSTR("_previewDurationString"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_pickingDurationString, CFSTR("_pickingDurationString"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_planningDescriptionString, CFSTR("_planningDescriptionString"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_planningDistanceString, CFSTR("_planningDistanceString"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_previewDurationFormatString, CFSTR("_previewDurationFormatString"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_pickingDurationFormatString, CFSTR("_pickingDurationFormatString"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_planningDescriptionFormatString, CFSTR("_planningDescriptionFormatString"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_planningDistanceFormatString, CFSTR("_planningDistanceFormatString"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_planningSeparatorString, CFSTR("_planningSeparatorString"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_transitDescriptionString, CFSTR("_transitDescriptionString"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_transitDescriptionFormatString, CFSTR("_transitDescriptionFormatString"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_advisories, CFSTR("_advisories"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_transitRouteBadgeString, CFSTR("_transitRouteBadgeString"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_transitRouteBadge, CFSTR("_transitRouteBadge"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_transitUpdateInitialDelay"), self->_transitUpdateInitialDelay);
  objc_msgSend(v4, "encodeBool:forKey:", self->_isWalkingOnlyTransitRoute, CFSTR("_isWalkingOnlyTransitRoute"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_routeInitializerData, CFSTR("_routeInitializerData"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_routeAttributes, CFSTR("_routeAttributes"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_stops, CFSTR("_stops"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_stations, CFSTR("_stations"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_halls, CFSTR("_halls"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_anchorPoints, CFSTR("_anchorPoints"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_transitRouteUpdateRequest, CFSTR("_transitRouteUpdateRequest"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_revisionIdentifier, CFSTR("_revisionIdentifier"));
  v5 = v4;
  geo_isolate_sync();
  objc_msgSend(v5, "encodeObject:forKey:", self->_directionsResponseID, CFSTR("_directionsResponseID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_etauResponseID, CFSTR("_etauResponseID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_indexInResponse, CFSTR("_indexInResponse"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_elevationProfile, CFSTR("_elevationProfile"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_styleAttributes, CFSTR("_styleAttributes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_address, CFSTR("_address"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_initialPromptTypes, CFSTR("_initialPromptTypes"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_elevationModel, CFSTR("_elevationModel"));

  _geo_isolate_unlock();
}

uint64_t __36__GEOComposedRoute_encodeWithCoder___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 608), CFSTR("_mutableData"));
}

- (unsigned)laneCountAtRouteCoordinate:(PolylineCoordinate)a3
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  uint64_t v17;
  unsigned int v18;
  float v19;
  double v20;
  unsigned int v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObjectsFromArray:", self->_cameraInfos);
  -[GEOComposedRoute mutableData](self, "mutableData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateableCameraInfos");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObjectsFromArray:", v6);

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v7 = v23;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v29;
    while (1)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        objc_msgSend(v11, "laneChangeInfos");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (!v13)
          goto LABEL_21;
        v14 = *(_QWORD *)v25;
        while (2)
        {
          for (j = 0; j != v13; ++j)
          {
            if (*(_QWORD *)v25 != v14)
              objc_enumerationMutation(v12);
            v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
            v17 = objc_msgSend(v16, "routeCoordinateRange");
            if ((_DWORD)v17 == a3.index)
            {
              LODWORD(v20) = HIDWORD(v17);
              if (*((float *)&v17 + 1) > a3.offset)
                continue;
            }
            else if (v17 >= a3.index)
            {
              continue;
            }
            if (a3.index == v18)
            {
              *(float *)&v20 = v19;
              if (a3.offset <= v19)
                goto LABEL_24;
            }
            else if (a3.index < v18)
            {
LABEL_24:
              v21 = objc_msgSend(v16, "laneCount");

              goto LABEL_26;
            }
          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16, v20);
          if (v13)
            continue;
          break;
        }
LABEL_21:

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      v21 = 0;
      if (!v8)
        goto LABEL_26;
    }
  }
  v21 = 0;
LABEL_26:

  return v21;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[GEOComposedRoute name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[GEOComposedRoute transportType](self, "transportType");
  if (v6 >= 7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_1E1C05E28[(int)v6];
  }
  -[__CFString capitalizedString](v7, "capitalizedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOComposedRoute uniqueRouteID](self, "uniqueRouteID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ - %@ - %@"), v5, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  v11 = (void *)MEMORY[0x1E0CB3940];
  -[GEOComposedRoute distance](self, "distance");
  objc_msgSend(v11, "stringWithFormat:", CFSTR("  %0.1f meters, %d seconds (%0.1f minutes)"), v12, -[GEOComposedRoute expectedTime](self, "expectedTime"), (double)-[GEOComposedRoute expectedTime](self, "expectedTime") / 60.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v13);

  v14 = (void *)MEMORY[0x1E0CB3940];
  v15 = -[GEOComposedRoute pointCount](self, "pointCount");
  -[GEOComposedRoute steps](self, "steps");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");
  -[GEOComposedRoute segments](self, "segments");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");
  -[GEOComposedRoute legs](self, "legs");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("  %d coordinates, %d steps, %d segment(s), %d leg(s)"), v15, v17, v19, objc_msgSend(v20, "count"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v21);

  if (-[GEOComposedRoute transportType](self, "transportType") == 1)
  {
    v22 = (void *)MEMORY[0x1E0CB3940];
    -[GEOComposedRoute stops](self, "stops");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");
    -[GEOComposedRoute halls](self, "halls");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count");
    -[GEOComposedRoute stations](self, "stations");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("  %d stops, %d halls, %d stations"), v24, v26, objc_msgSend(v27, "count"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v28);

  }
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v29;
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t k;
  void *v22;
  NSArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t m;
  NSArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t n;
  NSArray *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t ii;
  NSArray *obj;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  NSArray *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("GEOComposedRoute:\n"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOComposedRoute name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    -[GEOComposedRoute name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("%@ | "), v6);

  }
  v7 = -[GEOComposedRoute transportType](self, "transportType");
  if (v7 >= 7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = off_1E1C05E28[(int)v7];
  }
  -[GEOComposedRoute uniqueRouteID](self, "uniqueRouteID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@ | %@\n"), v8, v9);

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = self->_legs;
  v38 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
  if (v38)
  {
    v37 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v58 != v37)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
        objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), v10);
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        v40 = self->_segments;
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v54;
          do
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v54 != v12)
                objc_enumerationMutation(v40);
              v14 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * j);
              v15 = objc_msgSend(v10, "startRouteCoordinate");
              v16 = objc_msgSend(v14, "startRouteCoordinate");
              if ((_DWORD)v15 == (_DWORD)v16)
              {
                LODWORD(v17) = HIDWORD(v16);
                LODWORD(v18) = HIDWORD(v15);
                if (*((float *)&v15 + 1) > *((float *)&v16 + 1))
                  continue;
              }
              else if (v15 >= v16)
              {
                continue;
              }
              v19 = objc_msgSend(v14, "endRouteCoordinate", v17, v18);
              v20 = objc_msgSend(v10, "endRouteCoordinate");
              if ((_DWORD)v19 == (_DWORD)v20)
              {
                LODWORD(v17) = HIDWORD(v20);
                LODWORD(v18) = HIDWORD(v19);
                if (*((float *)&v19 + 1) > *((float *)&v20 + 1))
                  continue;
              }
              else if (v19 >= v20)
              {
                continue;
              }
              objc_msgSend(v3, "appendFormat:", CFSTR("    %@\n"), v17, v18, v14);
              for (k = objc_msgSend(v14, "startStepIndex"); k <= objc_msgSend(v14, "endStepIndex"); ++k)
              {
                -[NSArray objectAtIndexedSubscript:](self->_steps, "objectAtIndexedSubscript:", k);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "appendFormat:", CFSTR("        %@\n"), v22);

              }
            }
            v11 = -[NSArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v53, v64, 16, v17, v18);
          }
          while (v11);
        }

      }
      v38 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
    }
    while (v38);
  }

  objc_msgSend(v3, "appendFormat:", CFSTR("\nPoints (%d)\n%@\n"), -[GEOComposedRoute pointCount](self, "pointCount"), self->_coordinates);
  if (self->_transportType == 1)
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("\nStations (%d)\n"), -[NSArray count](self->_stations, "count"));
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v23 = self->_stations;
    v24 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v49, v63, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v50;
      do
      {
        for (m = 0; m != v24; ++m)
        {
          if (*(_QWORD *)v50 != v25)
            objc_enumerationMutation(v23);
          objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * m));
        }
        v24 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v49, v63, 16);
      }
      while (v24);
    }

    objc_msgSend(v3, "appendFormat:", CFSTR("\nStops (%d)\n"), -[NSArray count](self->_stops, "count"));
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v27 = self->_stops;
    v28 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v45, v62, 16);
    if (v28)
    {
      v29 = *(_QWORD *)v46;
      do
      {
        for (n = 0; n != v28; ++n)
        {
          if (*(_QWORD *)v46 != v29)
            objc_enumerationMutation(v27);
          objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * n));
        }
        v28 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v45, v62, 16);
      }
      while (v28);
    }

    objc_msgSend(v3, "appendFormat:", CFSTR("\nHalls (%d)\n"), -[NSArray count](self->_halls, "count"));
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v31 = self->_halls;
    v32 = -[NSArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v41, v61, 16);
    if (v32)
    {
      v33 = *(_QWORD *)v42;
      do
      {
        for (ii = 0; ii != v32; ++ii)
        {
          if (*(_QWORD *)v42 != v33)
            objc_enumerationMutation(v31);
          objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * ii));
        }
        v32 = -[NSArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v41, v61, 16);
      }
      while (v32);
    }

  }
  return (NSString *)v3;
}

- (GEOWaypointRoute)geoWaypointRoute
{
  return self->_geoWaypointRoute;
}

- (unint64_t)serverIdentifier
{
  return self->_serverIdentifier;
}

- (NSUUID)uniqueRouteID
{
  return self->_uniqueRouteID;
}

- (void)setUniqueRouteID:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueRouteID, a3);
}

- (unint64_t)source
{
  return self->_source;
}

- (unint64_t)currentDisplayStep
{
  return self->_currentDisplayStep;
}

- (BOOL)maneuverDisplayEnabled
{
  return self->_maneuverDisplayEnabled;
}

- (void)setManeuverDisplayEnabled:(BOOL)a3
{
  self->_maneuverDisplayEnabled = a3;
}

- (NSArray)maneuverDisplaySteps
{
  return self->_maneuverDisplaySteps;
}

- (unsigned)firstVisiblePoint
{
  return self->_firstVisiblePoint;
}

- (void)setFirstVisiblePoint:(unsigned int)a3
{
  self->_firstVisiblePoint = a3;
}

- (unint64_t)selectedSegmentIndex
{
  return self->_selectedSegmentIndex;
}

- (BOOL)usesZilch
{
  return self->_usesZilch;
}

- (NSArray)steps
{
  return self->_steps;
}

- (NSArray)segments
{
  return self->_segments;
}

- (NSArray)legs
{
  return self->_legs;
}

- (GEOComposedRouteAnchorPointList)anchorPoints
{
  return self->_anchorPoints;
}

- (NSArray)composedGuidanceEvents
{
  return self->_composedGuidanceEvents;
}

- (NSArray)enrouteNotices
{
  return self->_enrouteNotices;
}

- (NSArray)visualInfos
{
  return self->_visualInfos;
}

- (NSArray)visualInfosForRouteNameLabels
{
  return self->_visualInfosForRouteNameLabels;
}

- (NSArray)cameraInfos
{
  return self->_cameraInfos;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)userProvidedName
{
  return self->_userProvidedName;
}

- (NSString)userProvidedNotes
{
  return self->_userProvidedNotes;
}

- (NSUUID)storageID
{
  return self->_storageID;
}

- (GEOMapItemIdentifier)tourIdentifier
{
  return self->_tourIdentifier;
}

- (unint64_t)tourMuid
{
  return self->_tourMuid;
}

- (NSString)disclaimerText
{
  return self->_disclaimerText;
}

- (GEOPDURLData)disclaimerURL
{
  return self->_disclaimerURL;
}

- (NSData)serverRouteID
{
  return self->_serverRouteID;
}

- (void)setServerRouteID:(id)a3
{
  objc_storeStrong((id *)&self->_serverRouteID, a3);
}

- (double)distance
{
  return self->_distance;
}

- (double)totalAscent
{
  return self->_totalAscent;
}

- (double)totalDescent
{
  return self->_totalDescent;
}

- (unsigned)expectedTime
{
  return self->_expectedTime;
}

- (unsigned)historicTravelTime
{
  return self->_historicTravelTime;
}

- (double)freeflowTravelTime
{
  return self->_freeflowTravelTime;
}

- (double)travelTimeAggressiveEstimate
{
  return self->_travelTimeAggressiveEstimate;
}

- (double)travelTimeConservativeEstimate
{
  return self->_travelTimeConservativeEstimate;
}

- (GEOServerFormattedString)routeLabelDescription
{
  return self->_routeLabelDescription;
}

- (GEOTransitArtworkDataSource)routeLabelArtwork
{
  return self->_routeLabelArtwork;
}

- (NSString)trafficDescription
{
  return self->_trafficDescription;
}

- (GEOPBTransitArtwork)trafficDescriptionArtwork
{
  return self->_trafficDescriptionArtwork;
}

- (GEORouteRestrictionZoneInfo)restrictionZoneInfo
{
  return self->_restrictionZoneInfo;
}

- (GEOComposedString)infrastructureDescriptionString
{
  return self->_infrastructureDescriptionString;
}

- (GEOServerFormattedString)infrastructureDescription
{
  return self->_infrastructureDescription;
}

- (GEOComposedString)hikeTypeString
{
  return self->_hikeTypeString;
}

- (BOOL)avoidsTolls
{
  return self->_avoidsTolls;
}

- (BOOL)avoidsHighways
{
  return self->_avoidsHighways;
}

- (BOOL)avoidsTraffic
{
  return self->_avoidsTraffic;
}

- (NSArray)sections
{
  return self->_sections;
}

- (GEOMapRegion)boundingMapRegion
{
  return self->_boundingMapRegion;
}

- (GEOTransitSuggestedRoute)suggestedRoute
{
  return self->_suggestedRoute;
}

- (void)setSuggestedRoute:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedRoute, a3);
}

- (GEOTransitSuggestedRoute)originalSuggestedRoute
{
  return self->_originalSuggestedRoute;
}

- (NSArray)routePlanningArtworks
{
  return self->_routePlanningArtworks;
}

- (GEOTransitRoutingIncidentMessage)transitRoutingIncidentMessage
{
  return self->_transitRoutingIncidentMessage;
}

- (GEORouteDisplayHints)displayHints
{
  return self->_displayHints;
}

- (GEOComposedString)routeLabelDescriptionString
{
  return self->_routeLabelDescriptionString;
}

- (GEOLabelAction)routeLabelAction
{
  return self->_routeLabelAction;
}

- (GEOComposedString)previewDurationString
{
  return self->_previewDurationString;
}

- (GEOComposedString)pickingDurationString
{
  return self->_pickingDurationString;
}

- (GEOComposedString)planningDescriptionString
{
  return self->_planningDescriptionString;
}

- (GEOComposedString)planningDistanceString
{
  return self->_planningDistanceString;
}

- (GEOServerFormattedString)planningDistanceFormatString
{
  return self->_planningDistanceFormatString;
}

- (NSString)planningSeparatorString
{
  return self->_planningSeparatorString;
}

- (GEOComposedString)transitDescriptionString
{
  return self->_transitDescriptionString;
}

- (NSArray)advisories
{
  return self->_advisories;
}

- (GEOComposedString)transitRouteBadgeString
{
  return self->_transitRouteBadgeString;
}

- (BOOL)isWalkingOnlyTransitRoute
{
  return self->_isWalkingOnlyTransitRoute;
}

- (double)transitUpdateInitialDelay
{
  return self->_transitUpdateInitialDelay;
}

- (void)setTransitUpdateInitialDelay:(double)a3
{
  self->_transitUpdateInitialDelay = a3;
}

- (NSData)directionsResponseID
{
  return self->_directionsResponseID;
}

- (NSData)etauResponseID
{
  return self->_etauResponseID;
}

- (unint64_t)indexInResponse
{
  return self->_indexInResponse;
}

- (BOOL)isNavigable
{
  return self->_isNavigable;
}

- (int)transportType
{
  return self->_transportType;
}

- (GEOStyleAttributes)styleAttributes
{
  return self->_styleAttributes;
}

- (GEOAddressObject)address
{
  return self->_address;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (GEOElevationProfile)elevationProfile
{
  return self->_elevationProfile;
}

- (void)setTransitPaymentMethods:(id)a3
{
  objc_storeStrong((id *)&self->_transitPaymentMethods, a3);
}

- (NSArray)stations
{
  return self->_stations;
}

- (NSArray)stops
{
  return self->_stops;
}

- (NSArray)halls
{
  return self->_halls;
}

- (GEOTransitRouteUpdateRequest)transitRouteUpdateRequest
{
  return self->_transitRouteUpdateRequest;
}

- (NSUUID)revisionIdentifier
{
  return self->_revisionIdentifier;
}

- (NSArray)etauPositions
{
  return self->_etauPositions;
}

- (BOOL)isOfflineRoute
{
  return self->_offlineRoute;
}

- (int)elevationModel
{
  return self->_elevationModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitRouteUpdateRequest, 0);
  objc_storeStrong((id *)&self->_transitPaymentMethods, 0);
  objc_storeStrong((id *)&self->_transitRouteBadgeString, 0);
  objc_storeStrong((id *)&self->_transitDescriptionString, 0);
  objc_storeStrong((id *)&self->_planningDistanceString, 0);
  objc_storeStrong((id *)&self->_planningDescriptionString, 0);
  objc_storeStrong((id *)&self->_pickingDurationString, 0);
  objc_storeStrong((id *)&self->_previewDurationString, 0);
  objc_storeStrong((id *)&self->_routeLabelAction, 0);
  objc_storeStrong((id *)&self->_routeLabelDescriptionString, 0);
  objc_storeStrong((id *)&self->_hikeTypeString, 0);
  objc_storeStrong((id *)&self->_infrastructureDescriptionString, 0);
  objc_storeStrong((id *)&self->_disclaimerURL, 0);
  objc_storeStrong((id *)&self->_disclaimerText, 0);
  objc_storeStrong((id *)&self->_tourIdentifier, 0);
  objc_storeStrong((id *)&self->_storageID, 0);
  objc_storeStrong((id *)&self->_userProvidedNotes, 0);
  objc_storeStrong((id *)&self->_userProvidedName, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_maneuverDisplaySteps, 0);
  objc_storeStrong((id *)&self->_encodeIsolater, 0);
  objc_storeStrong((id *)&self->_mutableData, 0);
  objc_storeStrong((id *)&self->_mutableDataLock, 0);
  objc_storeStrong((id *)&self->_snappedRoutesIsolater, 0);
  objc_storeStrong((id *)&self->_zilchDecoder, 0);
  objc_storeStrong((id *)&self->_snappedPaths, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_transitRouteDisplayStrings, 0);
  objc_storeStrong((id *)&self->_transitRouteUpdateAlerts, 0);
  objc_storeStrong((id *)&self->_ticketedSegments, 0);
  objc_storeStrong((id *)&self->_transitRouteBadge, 0);
  objc_storeStrong((id *)&self->_displayHints, 0);
  objc_storeStrong((id *)&self->_currentSectionOptions, 0);
  objc_storeStrong((id *)&self->_initialRideSelections, 0);
  objc_storeStrong((id *)&self->_transitRoutingIncidentMessage, 0);
  objc_storeStrong((id *)&self->_routePlanningArtworks, 0);
  objc_storeStrong((id *)&self->_cameraInfos, 0);
  objc_storeStrong((id *)&self->_visualInfosForRouteNameLabels, 0);
  objc_storeStrong((id *)&self->_visualInfos, 0);
  objc_storeStrong((id *)&self->_cellularCoverage, 0);
  objc_storeStrong((id *)&self->_elevationProfile, 0);
  objc_storeStrong((id *)&self->_restrictionZoneInfo, 0);
  objc_storeStrong((id *)&self->_advisories, 0);
  objc_storeStrong((id *)&self->_etauPositions, 0);
  objc_storeStrong((id *)&self->_enrouteNotices, 0);
  objc_storeStrong((id *)&self->_composedGuidanceEvents, 0);
  objc_storeStrong((id *)&self->_anchorPoints, 0);
  objc_storeStrong((id *)&self->_stations, 0);
  objc_storeStrong((id *)&self->_halls, 0);
  objc_storeStrong((id *)&self->_stops, 0);
  objc_storeStrong((id *)&self->_steps, 0);
  objc_storeStrong((id *)&self->_segments, 0);
  objc_storeStrong((id *)&self->_legs, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_boundingMapRegion, 0);
  objc_storeStrong((id *)&self->_coordinates, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_transitDescriptionFormatString, 0);
  objc_storeStrong((id *)&self->_planningSeparatorString, 0);
  objc_storeStrong((id *)&self->_planningDistanceFormatString, 0);
  objc_storeStrong((id *)&self->_planningDescriptionFormatString, 0);
  objc_storeStrong((id *)&self->_pickingDurationFormatString, 0);
  objc_storeStrong((id *)&self->_previewDurationFormatString, 0);
  objc_storeStrong((id *)&self->_infrastructureDescription, 0);
  objc_storeStrong((id *)&self->_routeLabelArtwork, 0);
  objc_storeStrong((id *)&self->_routeLabelDescription, 0);
  objc_storeStrong((id *)&self->_trafficDescriptionArtwork, 0);
  objc_storeStrong((id *)&self->_trafficDescription, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_revisionIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueRouteID, 0);
  objc_storeStrong((id *)&self->_etauResponseID, 0);
  objc_storeStrong((id *)&self->_directionsResponseID, 0);
  objc_storeStrong((id *)&self->_serverRouteID, 0);
  objc_storeStrong((id *)&self->_originalSuggestedRoute, 0);
  objc_storeStrong((id *)&self->_suggestedRoute, 0);
  objc_storeStrong((id *)&self->_decoderData, 0);
  objc_storeStrong((id *)&self->_routeInitializerData, 0);
  objc_storeStrong((id *)&self->_routeAttributes, 0);
  objc_storeStrong((id *)&self->_geoWaypointRoute, 0);
}

- (double)distanceFromStartToIndex:(unint64_t)a3
{
  void *v4;
  double v5;
  double v6;

  -[GEOComposedRoute coordinates](self, "coordinates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "distanceFromStartToIndex:", a3);
  v6 = v5;

  return v6;
}

- (double)distanceToEndFromIndex:(unint64_t)a3
{
  void *v4;
  double v5;
  double v6;

  -[GEOComposedRoute coordinates](self, "coordinates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "distanceToEndFromIndex:", a3);
  v6 = v5;

  return v6;
}

- (double)distanceBetweenIndex:(unint64_t)a3 andIndex:(unint64_t)a4
{
  void *v6;
  double v7;
  double v8;

  -[GEOComposedRoute coordinates](self, "coordinates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "distanceBetweenIndex:andIndex:", a3, a4);
  v8 = v7;

  return v8;
}

- (double)distanceFromStartToRouteCoordinate:(id)a3
{
  void *v4;
  double v5;
  double v6;

  -[GEOComposedRoute coordinates](self, "coordinates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "distanceFromStartToRouteCoordinate:", a3);
  v6 = v5;

  return v6;
}

- (double)distanceToEndFromRouteCoordinate:(id)a3
{
  void *v4;
  double v5;
  double v6;

  -[GEOComposedRoute coordinates](self, "coordinates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "distanceToEndFromRouteCoordinate:", a3);
  v6 = v5;

  return v6;
}

- (double)distanceBetweenRouteCoordinate:(id)a3 andRouteCoordinate:(id)a4
{
  void *v6;
  double v7;
  double v8;

  -[GEOComposedRoute coordinates](self, "coordinates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "distanceBetweenRouteCoordinate:andRouteCoordinate:", a3, a4);
  v8 = v7;

  return v8;
}

- ($212C09783140BCCD23384160D545CE0D)routeCoordinateForDistanceAfterStart:(double)a3
{
  void *v4;
  $212C09783140BCCD23384160D545CE0D v5;

  -[GEOComposedRoute coordinates](self, "coordinates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = ($212C09783140BCCD23384160D545CE0D)objc_msgSend(v4, "routeCoordinateForDistanceAfterStart:", a3);

  return v5;
}

- ($212C09783140BCCD23384160D545CE0D)routeCoordinateForDistanceBeforeEnd:(double)a3
{
  void *v4;
  $212C09783140BCCD23384160D545CE0D v5;

  -[GEOComposedRoute coordinates](self, "coordinates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = ($212C09783140BCCD23384160D545CE0D)objc_msgSend(v4, "routeCoordinateForDistanceBeforeEnd:", a3);

  return v5;
}

- ($212C09783140BCCD23384160D545CE0D)routeCoordinateForDistance:(double)a3 afterStartOfLegIndex:(unint64_t)a4
{
  void *v6;
  $212C09783140BCCD23384160D545CE0D v7;

  -[GEOComposedRoute coordinates](self, "coordinates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = ($212C09783140BCCD23384160D545CE0D)objc_msgSend(v6, "routeCoordinateForDistance:afterStartOfPathIndex:", a4, a3);

  return v7;
}

- ($212C09783140BCCD23384160D545CE0D)routeCoordinateForDistance:(double)a3 beforeEndOfLegIndex:(unint64_t)a4
{
  void *v6;
  $212C09783140BCCD23384160D545CE0D v7;

  -[GEOComposedRoute coordinates](self, "coordinates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = ($212C09783140BCCD23384160D545CE0D)objc_msgSend(v6, "routeCoordinateForDistance:beforeEndOfPathIndex:", a4, a3);

  return v7;
}

- ($212C09783140BCCD23384160D545CE0D)routeCoordinateForDistance:(double)a3 afterRouteCoordinate:(id)a4
{
  void *v6;
  $212C09783140BCCD23384160D545CE0D v7;

  -[GEOComposedRoute coordinates](self, "coordinates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = ($212C09783140BCCD23384160D545CE0D)objc_msgSend(v6, "routeCoordinateForDistance:afterRouteCoordinate:", a4, a3);

  return v7;
}

- ($212C09783140BCCD23384160D545CE0D)routeCoordinateForDistance:(double)a3 beforeRouteCoordinate:(id)a4
{
  void *v6;
  $212C09783140BCCD23384160D545CE0D v7;

  -[GEOComposedRoute coordinates](self, "coordinates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = ($212C09783140BCCD23384160D545CE0D)objc_msgSend(v6, "routeCoordinateForDistance:beforeRouteCoordinate:", a4, a3);

  return v7;
}

- (unint64_t)stepIndexForRouteCoordinate:(id)a3
{
  float var1;
  unint64_t v4;
  unsigned int var0;
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  float v22;
  void *v24;
  void *v25;
  uint64_t v26;
  double v27;

  var1 = a3.var1;
  if (a3.var1 < 0.0)
    return 0x7FFFFFFFFFFFFFFFLL;
  var0 = a3.var0;
  -[GEOComposedRoute steps](self, "steps");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "endRouteCoordinate");
  if ((_DWORD)v9 == var0)
  {
    LODWORD(v10) = HIDWORD(v9);
    if (*((float *)&v9 + 1) < var1)
      goto LABEL_19;
  }
  else if (v9 < var0)
  {
LABEL_19:
    v4 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_30;
  }
  -[GEOComposedRoute steps](self, "steps", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count") - 1;

  v13 = 0;
  while (1)
  {
    v14 = v12 + v13;
    v15 = (v12 + v13) >> 1;
    -[GEOComposedRoute steps](self, "steps");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(v17, "startRouteCoordinate");
    if (var0 != (_DWORD)v18)
      break;
    if (var1 >= *((float *)&v18 + 1))
      goto LABEL_10;
LABEL_14:
    if (v14 < 2)
    {
      v4 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_29;
    }
    v12 = v15 - 1;
LABEL_18:

    if (v13 > v12)
      goto LABEL_19;
  }
  if (var0 < v18)
    goto LABEL_14;
LABEL_10:
  v19 = objc_msgSend(v17, "endRouteCoordinate");
  if ((_DWORD)v19 == var0)
  {
    LODWORD(v20) = HIDWORD(v19);
    if (*((float *)&v19 + 1) >= var1)
      goto LABEL_21;
    goto LABEL_17;
  }
  if (v19 < var0)
  {
LABEL_17:
    v13 = v15 + 1;
    goto LABEL_18;
  }
LABEL_21:
  v21 = objc_msgSend(v17, "startRouteCoordinate", v20);
  v22 = (float)var0 + var1;
  if (vabds_f32((float)v21 + *((float *)&v21 + 1), v22) >= 0.001 || v14 < 2)
    goto LABEL_28;
  -[GEOComposedRoute steps](self, "steps");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v15 - 1;
  objc_msgSend(v24, "objectAtIndexedSubscript:", v15 - 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25
    || (v26 = objc_msgSend(v25, "endRouteCoordinate"),
        v27 = vabds_f32((float)v26 + *((float *)&v26 + 1), v22),
        v25,
        v27 >= 0.001))
  {
LABEL_28:
    v4 = (v12 + v13) >> 1;
  }
LABEL_29:

LABEL_30:
  return v4;
}

- (unint64_t)segmentIndexForRouteCoordinate:(id)a3
{
  return -[GEOComposedRoute segmentIndexForStepIndex:](self, "segmentIndexForStepIndex:", -[GEOComposedRoute stepIndexForRouteCoordinate:](self, "stepIndexForRouteCoordinate:", a3));
}

- (unint64_t)legIndexForRouteCoordinate:(id)a3
{
  float var1;
  unsigned int var0;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  var1 = a3.var1;
  if (a3.var1 < 0.0)
    return 0x7FFFFFFFFFFFFFFFLL;
  var0 = a3.var0;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[GEOComposedRoute legs](self, "legs", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "endRouteCoordinate");
        if (var0 == (_DWORD)v11)
        {
          if (var1 <= *((float *)&v11 + 1))
            goto LABEL_14;
        }
        else if (var0 < v11)
        {
LABEL_14:
          v12 = objc_msgSend(v10, "legIndex");
          goto LABEL_15;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
  v12 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_15:

  return v12;
}

- ($3314123FD9D86BC79D52D2D985513A44)coarseBoundsForRange:(SEL)a3
{
  return -[GEOComposedRoute coarseBoundsForRange:sampleLength:](self, "coarseBoundsForRange:sampleLength:", *(_QWORD *)&a4.start, *(_QWORD *)&a4.end, 50.0);
}

- ($3314123FD9D86BC79D52D2D985513A44)coarseBoundsForRange:(SEL)a3 sampleLength:(GEOPolylineCoordinateRange)a4
{
  PolylineCoordinate end;
  PolylineCoordinate start;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  float offset;
  BOOL v16;
  uint64_t v17;
  PolylineCoordinate v18;
  PolylineCoordinate v19;
  unsigned int index;
  float v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  __int128 v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  __int128 v40;
  double v41;
  $3314123FD9D86BC79D52D2D985513A44 *result;
  __int128 v43;
  __int128 v44;
  __int128 v45;

  end = a4.end;
  start = a4.start;
  *retstr = *($3314123FD9D86BC79D52D2D985513A44 *)GEOMapBoxNull;
  v10 = -[GEOComposedRoute routeCoordinateRange](self, "routeCoordinateRange");
  v12 = v10;
  if ((_DWORD)v11 == (_DWORD)v10)
  {
    if (*((float *)&v11 + 1) == *((float *)&v10 + 1) || *((float *)&v11 + 1) >= *((float *)&v10 + 1))
      goto LABEL_6;
  }
  else if (v11 >= v10)
  {
LABEL_6:
    v14 = v10;
    v12 = v11;
    goto LABEL_9;
  }
  v14 = v11;
LABEL_9:
  offset = *((float *)&v14 + 1);
  if ((_DWORD)v14 != start.index)
  {
    v17 = v14;
    if (v14 >= start.index)
      goto LABEL_14;
    goto LABEL_19;
  }
  v16 = *((float *)&v14 + 1) != start.offset && *((float *)&v14 + 1) < start.offset;
  v17 = v14;
  if (v16)
  {
LABEL_19:
    offset = start.offset;
    LODWORD(v14) = start.index;
    v17 = (uint64_t)start;
  }
LABEL_14:
  if ((_DWORD)v14 == (_DWORD)v12)
  {
    if (offset == *((float *)&v12 + 1) || offset >= *((float *)&v12 + 1))
      goto LABEL_22;
    goto LABEL_21;
  }
  if (v14 < v12)
LABEL_21:
    v12 = v17;
LABEL_22:
  v18 = -[GEOComposedRoute endRouteCoordinate](self, "endRouteCoordinate");
  v19 = v18;
  v21 = v18.offset;
  index = v18.index;
  if (end.index != v18.index)
  {
    if (end.index >= v18.index)
      goto LABEL_28;
    goto LABEL_27;
  }
  if (end.offset != v18.offset && end.offset < v18.offset)
  {
LABEL_27:
    v21 = end.offset;
    index = end.index;
    v19 = end;
  }
LABEL_28:
  while (index != (_DWORD)v12)
  {
    -[GEOComposedRoute coordinates](self, "coordinates");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (index <= v12)
      goto LABEL_35;
LABEL_33:
    objc_msgSend(v22, "coordinateForRouteCoordinate:", v12);
    v24 = v23;
    v26 = v25;
    v28 = v27;

    v29 = GEOTilePointForCoordinate(v24, v26, 20.0);
    v30 = *(_OWORD *)&retstr->var0.var2;
    v43 = *(_OWORD *)&retstr->var0.var0;
    v44 = v30;
    v45 = *(_OWORD *)&retstr->var1.var1;
    GEOBoundingMapBoxAddPoint((double *)&v43, &retstr->var0.var0, v29, v31, v28);
    -[GEOComposedRoute coordinates](self, "coordinates");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v32, "routeCoordinateForDistance:afterRouteCoordinate:", v12, a5);

  }
  if (v21 != *((float *)&v12 + 1))
  {
    -[GEOComposedRoute coordinates](self, "coordinates");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21 <= *((float *)&v12 + 1))
      goto LABEL_35;
    goto LABEL_33;
  }
  -[GEOComposedRoute coordinates](self, "coordinates");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_35:
  objc_msgSend(v22, "coordinateForRouteCoordinate:", v19);
  v34 = v33;
  v36 = v35;
  v38 = v37;

  v39 = GEOTilePointForCoordinate(v34, v36, 20.0);
  v40 = *(_OWORD *)&retstr->var0.var2;
  v43 = *(_OWORD *)&retstr->var0.var0;
  v44 = v40;
  v45 = *(_OWORD *)&retstr->var1.var1;
  result = ($3314123FD9D86BC79D52D2D985513A44 *)GEOBoundingMapBoxAddPoint((double *)&v43, &retstr->var0.var0, v39, v41, v38);
  *(float64x2_t *)&retstr->var1.var0 = vmaxnmq_f64(*(float64x2_t *)&retstr->var1.var0, (float64x2_t)vdupq_n_s64(0x3EB0C6F7A0000000uLL));
  retstr->var1.var2 = fmax(retstr->var1.var2, 0.000000999999997);
  return result;
}

- (GEOComposedRoute)initWithCompanionRoute:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  GEOComposedWaypoint *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  GEOComposedRoute *v17;
  void *v18;
  uint64_t v19;
  GEORouteInitializerData *v20;
  void *v21;
  void *v22;
  GEORouteInitializerData *v23;
  NSObject *p_super;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  GEOComposedRoute *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  NSObject *v49;
  void *v50;
  unsigned int v51;
  void *v52;
  unint64_t v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v58;
  void *v59;
  NSObject *v60;
  unint64_t v61;
  BOOL v62;
  void *v63;
  NSObject *v64;
  void *v65;
  int v66;
  GEOComposedRoute *v67;
  void *v68;
  void *v69;
  GEORouteInitializerData *v70;
  NSObject *v71;
  void *v72;
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint8_t buf[4];
  _BYTE v79[10];
  id v80;
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
  if ((unint64_t)objc_msgSend(v4, "waypointsCount") >= 2)
    v6 = objc_msgSend(v4, "waypointsCount");
  else
    v6 = 2;
  v7 = (void *)objc_msgSend(v5, "initWithCapacity:", v6);
  if (objc_msgSend(v4, "waypointsCount"))
  {
    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    objc_msgSend(v4, "waypoints");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v74, v81, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v75;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v75 != v11)
            objc_enumerationMutation(v8);
          v13 = -[GEOComposedWaypoint initWithCompanionWaypoint:]([GEOComposedWaypoint alloc], "initWithCompanionWaypoint:", *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * i));
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v74, v81, 16);
      }
      while (v10);
    }
  }
  else
  {
    objc_msgSend(v4, "composedOrigin");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "composedDestination");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v8 && v14)
    {
      objc_msgSend(v7, "addObject:", v8);
      objc_msgSend(v7, "addObject:", v15);
    }

  }
  if ((unint64_t)objc_msgSend(v7, "count") > 1)
  {
    objc_msgSend(v4, "request");
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "response");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "etaResponse");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = [GEORouteInitializerData alloc];
    -[NSObject routeAttributes](v16, "routeAttributes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = (void *)v19;
    if (v19)
    {
      objc_msgSend(v4, "styleAttributes");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[GEORouteInitializerData initWithWaypoints:routeAttributes:etauResponse:styleAttributes:](v20, "initWithWaypoints:routeAttributes:etauResponse:styleAttributes:", v7, v21, v19, v22);

    }
    else
    {
      v23 = -[GEORouteInitializerData initWithWaypoints:routeAttributes:directionsResponse:directionsRequest:](v20, "initWithWaypoints:routeAttributes:directionsResponse:directionsRequest:", v7, v21, v18, v16);
    }

    objc_msgSend(v4, "originalSuggestedRoute");
    p_super = objc_claimAutoreleasedReturnValue();
    v72 = v18;
    v70 = v23;
    if (p_super)
      goto LABEL_25;
    if (objc_msgSend(v18, "suggestedRoutesCount"))
    {
      GEOGetCompanionExtrasLog();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1885A9000, v49, OS_LOG_TYPE_DEFAULT, "Found transit suggested route on response, using that", buf, 2u);
      }

      objc_msgSend(v18, "suggestedRoutes");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "firstObject");
      p_super = objc_claimAutoreleasedReturnValue();

      if (p_super)
      {
LABEL_25:
        objc_msgSend(v4, "response");
        v25 = objc_claimAutoreleasedReturnValue();
        if (!v25)
          goto LABEL_27;
        v26 = (void *)v25;
        objc_msgSend(v4, "response");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "decoderData");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v28)
        {
LABEL_27:
          GEOGetCompanionExtrasLog();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v79 = v4;
            _os_log_impl(&dword_1885A9000, v29, OS_LOG_TYPE_ERROR, "GEOCompanionRouteDetails is missing necessary parameters to create a transit route: %@", buf, 0xCu);
          }

        }
        GEOGetCompanionExtrasLog();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1885A9000, v30, OS_LOG_TYPE_DEFAULT, "GEOComposedRoute created from suggested transit route", buf, 2u);
        }

        v31 = -[GEOComposedRoute initWithSuggestedRoute:initializerData:](self, "initWithSuggestedRoute:initializerData:", p_super, v23);
        self = v31;
        if (!v31)
        {
LABEL_63:
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: composedRoute != ((void *)0)", buf, 2u);
          }
          v17 = 0;
          goto LABEL_54;
        }
        goto LABEL_33;
      }
    }
    v51 = objc_msgSend(v4, "routeIndex");
    objc_msgSend(v18, "waypointRoutes");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "count");

    if (v53 <= v51)
    {
      objc_msgSend(v69, "waypointRoute");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = (void *)objc_msgSend(v58, "newWaypointRoutes");
      v60 = v16;
      v61 = objc_msgSend(v59, "count");

      v62 = v61 > v51;
      v16 = v60;
      if (!v62)
        goto LABEL_66;
      objc_msgSend(v69, "waypointRoute");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = (void *)objc_msgSend(v54, "newWaypointRoutes");
      objc_msgSend(v63, "objectAtIndexedSubscript:", v51);
      v55 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v18, "waypointRoutes");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "objectAtIndexedSubscript:", v51);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (v55)
    {
      v31 = -[GEOComposedRoute initWithGeoWaypointRoute:initializerData:]([GEOComposedRoute alloc], "initWithGeoWaypointRoute:initializerData:", v55, v70);
      GEOGetCompanionExtrasLog();
      v64 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1885A9000, v64, OS_LOG_TYPE_DEFAULT, "GEOComposedRoute created from GEOWaypointRoute", buf, 2u);
      }

      p_super = 0;
      v23 = v70;
      if (!v31)
        goto LABEL_63;
LABEL_33:
      v71 = v16;
      objc_msgSend(v4, "routeID");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3A28], "_maps_UUIDWithData:");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (v32)
        -[GEOComposedRoute setUniqueRouteID:](v31, "setUniqueRouteID:", v32);
      objc_msgSend(v4, "revisionID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3A28], "_maps_UUIDWithData:", v33);
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = (void *)v34;
      if (v34)
        v36 = (void *)v34;
      else
        v36 = v32;
      -[GEOComposedRoute setRevisionIdentifier:](v31, "setRevisionIdentifier:", v36);
      -[GEOComposedRoute setSource:](v31, "setSource:", objc_msgSend(v4, "source"));
      v37 = (void *)MEMORY[0x1E0CB3A28];
      objc_msgSend(v4, "storageID");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "_maps_UUIDWithData:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOComposedRoute setStorageID:](v31, "setStorageID:", v39);

      objc_msgSend(v4, "selectedRideIndices");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOComposedRoute updateRouteWithRideSelections:](v31, "updateRouteWithRideSelections:", v40);

      +[GEOTransitRouteUpdateRequest transitRouteUpdateRequestWithDirectionsRequest:directionsResponse:](GEOTransitRouteUpdateRequest, "transitRouteUpdateRequestWithDirectionsRequest:directionsResponse:", v71, v72);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOComposedRoute updateTransitRouteUpdateRequest:](v31, "updateTransitRouteUpdateRequest:", v41);

      objc_msgSend(v4, "anchorPointsData");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "length");

      if (v43)
      {
        v67 = self;
        v44 = (void *)MEMORY[0x1E0CB3710];
        v45 = objc_opt_class();
        objc_msgSend(v4, "anchorPointsData");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = 0;
        objc_msgSend(v44, "unarchivedObjectOfClass:fromData:error:", v45, v46, &v73);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v73;

        if (v48 || !v47)
        {
          GEOGetCompanionExtrasLog();
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v79 = v48;
            _os_log_impl(&dword_1885A9000, v56, OS_LOG_TYPE_ERROR, "Error deserializing anchor points: %@", buf, 0xCu);
          }

        }
        else
        {
          -[GEOComposedRoute setAnchorPoints:](v31, "setAnchorPoints:", v47);
        }

        self = v67;
      }
      v17 = v31;

      p_super = &v17->super;
      v16 = v71;
LABEL_53:
      v23 = v70;
LABEL_54:

      goto LABEL_55;
    }
LABEL_66:
    GEOGetCompanionExtrasLog();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v18, "waypointRoutes");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_msgSend(v65, "count");
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v79 = v51;
      *(_WORD *)&v79[4] = 1024;
      *(_DWORD *)&v79[6] = v66;
      _os_log_impl(&dword_1885A9000, p_super, OS_LOG_TYPE_FAULT, "Unable to create GEOComposedRoute from GEOCompanionRouteDetails because route index (%u) is out of bounds. waypointRoutesCount: %d", buf, 0xEu);

    }
    v17 = 0;
    goto LABEL_53;
  }
  GEOGetCompanionExtrasLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v79 = v4;
    *(_WORD *)&v79[8] = 2050;
    v80 = v4;
    _os_log_impl(&dword_1885A9000, v16, OS_LOG_TYPE_ERROR, "GEOCompanionRouteDetails does not at least 2 waypoints: %@ %{public}p", buf, 0x16u);
  }
  v17 = 0;
LABEL_55:

  return v17;
}

- (void)applyCompanionUpdates:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  void *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v10, "type", (_QWORD)v14) == 1)
          {
            objc_msgSend(v10, "transitRouteUpdate");
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            if (v11)
            {
              objc_msgSend(v10, "transitRouteUpdate");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = v12;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              -[GEOComposedRoute applyUpdatesToTransitRoute:](self, "applyUpdatesToTransitRoute:", v13);

            }
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      }
      while (v7);
    }

  }
}

- (double)_hypothesis_travelDuration
{
  return (double)-[GEOComposedRoute expectedTime](self, "expectedTime");
}

- (double)_hypothesis_travelDurationFromStep:(id)a3 stepRemainingDistance:(double)a4
{
  id v6;
  double v7;
  double v8;

  v6 = a3;
  -[GEOComposedRoute remainingTimeAlongRouteFromStepIndex:currentStepRemainingDistance:](self, "remainingTimeAlongRouteFromStepIndex:currentStepRemainingDistance:", objc_msgSend(v6, "stepIndex"), a4);
  v8 = v7;

  return v8;
}

- (id)geoOriginalWaypointRouteFromRouteCoordinate:(PolylineCoordinate)a3 purpose:(int)a4
{
  return -[GEOComposedRoute geoOriginalWaypointRouteFromRouteCoordinate:purpose:userPosition:origin:startPathSegment:](self, "geoOriginalWaypointRouteFromRouteCoordinate:purpose:userPosition:origin:startPathSegment:", a3, *(_QWORD *)&a4, a3, 0, 0);
}

- (id)geoOriginalWaypointRouteFromRouteCoordinate:(PolylineCoordinate)a3 purpose:(int)a4 userPosition:(PolylineCoordinate)a5 origin:(id)a6 startPathSegment:(id)a7
{
  uint64_t v9;
  float v12;
  unsigned int v13;
  uint64_t v14;
  float v15;
  NSObject *v16;
  double v17;
  id v18;
  __CFString *v19;
  double v20;
  double v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  GEOOriginalRouteLeg *v28;
  uint64_t v29;
  unint64_t v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _BOOL4 v36;
  void *v37;
  GEOWaypointInfo *v38;
  GEOWaypointInfo *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  GEOWaypointInfo *v44;
  void *v45;
  void *v46;
  GEOWaypointInfo *v47;
  GEOWaypointInfo *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  unint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  GEOEVStateInfo *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  double v62;
  void *v63;
  uint64_t v64;
  unint64_t v66;
  GEOWaypointInfo *v67;
  id v68;
  id v69;
  GEOWaypointInfo *v70;
  id obj;
  uint64_t v72;
  GEOOriginalWaypointRoute *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint8_t v78[128];
  uint8_t buf[4];
  id v80;
  __int16 v81;
  __CFString *v82;
  uint64_t v83;

  v9 = *(_QWORD *)&a4;
  v83 = *MEMORY[0x1E0C80C00];
  v69 = a6;
  v68 = a7;
  if (-[GEOComposedRoute transportType](self, "transportType") != 1
    && (-[GEOComposedRoute usesRoutingPathPoints](self, "usesRoutingPathPoints")
     || -[GEOComposedRoute usesZilch](self, "usesZilch")))
  {
    v12 = a3.offset - floorf(a3.offset);
    v13 = vcvtms_u32_f32(a3.offset) + a3.index;
    if (a3.offset >= 0.0)
      v14 = v13;
    else
      v14 = 0;
    if (a3.offset >= 0.0)
      v15 = v12;
    else
      v15 = -1.0;
    v66 = v14 | ((unint64_t)LODWORD(v15) << 32);
    if (-[GEOComposedRoute pointCount](self, "pointCount") - 1 == (_DWORD)v14)
    {
      GEOGetGEOComposedRouteLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        GEOPolylineCoordinateAsString(v66, 1, 0, v17);
        v18 = (id)objc_claimAutoreleasedReturnValue();
        if (v9 >= 0xE)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v9);
          v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v19 = off_1E1C142E8[(int)v9];
        }
        *(_DWORD *)buf = 138478083;
        v80 = v18;
        v81 = 2112;
        v82 = v19;
        _os_log_impl(&dword_1885A9000, v16, OS_LOG_TYPE_ERROR, "geoOriginalWaypointRouteFromRouteCoordinate: was passed a route coordinate [%{private}@] that is at the end of the route for purpose: %@", buf, 0x16u);

      }
    }
    -[GEOComposedRoute distanceBetweenRouteCoordinate:andRouteCoordinate:](self, "distanceBetweenRouteCoordinate:andRouteCoordinate:", v66, a5);
    v21 = v20;
    v73 = objc_alloc_init(GEOOriginalWaypointRoute);
    -[GEOOriginalWaypointRoute setIdentifier:](v73, "setIdentifier:", -[GEOComposedRoute serverIdentifier](self, "serverIdentifier"));
    -[GEOOriginalWaypointRoute setPurpose:](v73, "setPurpose:", v9);
    if (-[GEOComposedRoute isOfflineRoute](self, "isOfflineRoute"))
      v22 = 2;
    else
      v22 = 1;
    -[GEOOriginalWaypointRoute setSource:](v73, "setSource:", v22);
    -[GEOOriginalWaypointRoute setCreationMethod:](v73, "setCreationMethod:", -[GEOComposedRoute _routeCreationMethod](self, "_routeCreationMethod"));
    v23 = v21 * 100.0;
    if (v21 < 0.0)
      v23 = 0.0;
    -[GEOOriginalWaypointRoute setLastValidUserOffsetCm:](v73, "setLastValidUserOffsetCm:", v23);
    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    -[GEOComposedRoute legs](self, "legs");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v78, 16);
    if (v24)
    {
      v72 = *(_QWORD *)v75;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v75 != v72)
            objc_enumerationMutation(obj);
          v26 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * v25);
          v27 = objc_msgSend(v26, "endRouteCoordinate");
          if ((_DWORD)v14 == (_DWORD)v27)
          {
            if (v15 >= *((float *)&v27 + 1))
              goto LABEL_63;
          }
          else if (v14 > v27)
          {
            goto LABEL_63;
          }
          v28 = objc_alloc_init(GEOOriginalRouteLeg);
          -[GEOOriginalRouteLeg setEncryptedTourMuid:](v28, "setEncryptedTourMuid:", -[GEOComposedRoute tourMuid](self, "tourMuid"));
          v29 = objc_msgSend(v26, "startRouteCoordinate");
          v30 = v29;
          if ((_DWORD)v14 != (_DWORD)v29)
          {
            if (v14 <= v29)
              goto LABEL_37;
LABEL_41:
            v30 = v14 | ((unint64_t)LODWORD(v15) << 32);
            goto LABEL_37;
          }
          if (v15 != *((float *)&v29 + 1) && v15 >= *((float *)&v29 + 1))
            goto LABEL_41;
LABEL_37:
          if (-[GEOComposedRoute usesRoutingPathPoints](self, "usesRoutingPathPoints"))
          {
            -[GEOComposedRoute coordinates](self, "coordinates");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "routingPathDataWithSupportPointFromStart:toEnd:supportPointsOnly:startPathSegment:", v30, objc_msgSend(v26, "endRouteCoordinate"), 1, v68);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v33)
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              {
                v61 = objc_msgSend(v26, "endRouteCoordinate");
                GEOPolylineCoordinateRangeAsString(v66, v61, v62);
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v80 = v63;

              }
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: routingPathData != nil", buf, 2u);
              }
            }
            -[GEOOriginalRouteLeg setPathLeg:](v28, "setPathLeg:", v33);
          }
          else
          {
            if (!-[GEOComposedRoute usesZilch](self, "usesZilch"))
              goto LABEL_45;
            -[GEOComposedRoute coordinates](self, "coordinates");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "compressedZilchDataToEndOfPathFromIndex:", v30);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            -[GEOOriginalRouteLeg setZilchPoints:](v28, "setZilchPoints:", v33);
          }

LABEL_45:
          -[GEOOriginalWaypointRoute routeLegs](v73, "routeLegs");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "count") == 0;

          if (!v36)
          {
            objc_msgSend(v26, "geoOriginWaypointInfo");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = (GEOWaypointInfo *)objc_msgSend(v37, "copy");
            v39 = v38;
            if (!v38)
            {
              v67 = -[GEOWaypointInfo initWithSource:]([GEOWaypointInfo alloc], "initWithSource:", 1);
              v39 = v67;
            }
            -[GEOOriginalRouteLeg setOriginWaypointInfo:](v28, "setOriginWaypointInfo:", v39);
            if (!v38)

            objc_msgSend(v26, "origin");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "uniqueID");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "_geo_waypointUUID");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            -[GEOOriginalRouteLeg originWaypointInfo](v28, "originWaypointInfo");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "setUniqueWaypointId:", v42);

            goto LABEL_53;
          }
          if (v69)
          {
            v44 = objc_alloc_init(GEOWaypointInfo);
            -[GEOOriginalRouteLeg setOriginWaypointInfo:](v28, "setOriginWaypointInfo:", v44);

            -[GEOOriginalRouteLeg originWaypointInfo](v28, "originWaypointInfo");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "setSource:", 1);

            objc_msgSend(v69, "uniqueID");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "_geo_waypointUUID");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            -[GEOOriginalRouteLeg originWaypointInfo](v28, "originWaypointInfo");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "setUniqueWaypointId:", v41);
LABEL_53:

          }
          objc_msgSend(v26, "geoDestinationWaypointInfo");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = (GEOWaypointInfo *)objc_msgSend(v46, "copy");
          v48 = v47;
          if (!v47)
          {
            v70 = -[GEOWaypointInfo initWithSource:]([GEOWaypointInfo alloc], "initWithSource:", 1);
            v48 = v70;
          }
          -[GEOOriginalRouteLeg setDestinationWaypointInfo:](v28, "setDestinationWaypointInfo:", v48);
          if (!v47)

          objc_msgSend(v26, "destination");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "uniqueID");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "_geo_waypointUUID");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          -[GEOOriginalRouteLeg destinationWaypointInfo](v28, "destinationWaypointInfo");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "setUniqueWaypointId:", v51);

          v53 = objc_msgSend(v26, "endStepIndex");
          -[GEOComposedRoute steps](self, "steps");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v53) = v53 < objc_msgSend(v54, "count");

          if ((_DWORD)v53)
          {
            -[GEOComposedRoute steps](self, "steps");
            v55 = objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v55, "objectAtIndexedSubscript:", objc_msgSend(v26, "endStepIndex"));
            v56 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v56, "evInfo");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v55) = v57 == 0;

            if ((v55 & 1) == 0)
            {
              v58 = objc_alloc_init(GEOEVStateInfo);
              objc_msgSend(v56, "evInfo");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              -[GEOEVStateInfo setRemainingBatteryCharge:](v58, "setRemainingBatteryCharge:", objc_msgSend(v59, "remainingBatteryCharge"));

              objc_msgSend(v56, "evInfo");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              -[GEOEVStateInfo setRemainingBatteryPercentage:](v58, "setRemainingBatteryPercentage:", objc_msgSend(v60, "remainingBatteryPercentage"));

              -[GEOOriginalRouteLeg setEvStateInfo:](v28, "setEvStateInfo:", v58);
            }
          }
          else
          {
            v56 = 0;
          }
          -[GEOOriginalWaypointRoute addRouteLeg:](v73, "addRouteLeg:", v28);

LABEL_63:
          ++v25;
        }
        while (v24 != v25);
        v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v78, 16);
        v24 = v64;
      }
      while (v64);
    }

  }
  else
  {
    v73 = 0;
  }

  return v73;
}

- (id)geoETAWaypointRoute
{
  return -[GEOComposedRoute geoETAWaypointRouteFromRouteCoordinate:includeOriginWaypointInfo:startPathSegment:](self, "geoETAWaypointRouteFromRouteCoordinate:includeOriginWaypointInfo:startPathSegment:", 0, 0, 0);
}

- (id)geoETAWaypointRouteFromRouteCoordinate:(PolylineCoordinate)a3 includeOriginWaypointInfo:(BOOL)a4 startPathSegment:(id)a5
{
  uint64_t v7;
  NSObject *v8;
  double v9;
  void *v10;
  unint64_t v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  float offset;
  PolylineCoordinate v28;
  void *v29;
  BOOL v30;
  unint64_t i;
  void *v32;
  BOOL v33;
  void *v34;
  void *v35;
  GEOETARoute *v36;
  double v37;
  uint64_t v38;
  float v39;
  uint64_t v40;
  float v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  GEOWaypointInfo *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  unint64_t v59;
  void *v60;
  void *v61;
  GEOETAStep *v62;
  double v63;
  double v64;
  uint64_t v65;
  double v66;
  double v67;
  double v68;
  unsigned int v69;
  double v70;
  uint64_t v71;
  void *v72;
  GEOEVStateInfo *v73;
  _BOOL4 v74;
  unint64_t v75;
  id v76;
  GEOETATrafficUpdateWaypointRoute *v77;
  unint64_t v78;
  uint64_t v79;
  void *v80;
  uint8_t buf[4];
  void *v82;
  __int16 v83;
  int v84;
  uint64_t v85;

  v74 = a4;
  v85 = *MEMORY[0x1E0C80C00];
  v76 = a5;
  if (-[GEOComposedRoute usesZilch](self, "usesZilch"))
  {
    -[GEOComposedRoute _geoETAWaypointRouteWithZilchFromRouteCoordinate:](self, "_geoETAWaypointRouteWithZilchFromRouteCoordinate:", a3);
    v77 = (GEOETATrafficUpdateWaypointRoute *)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  if (!-[GEOComposedRoute usesRoutingPathPoints](self, "usesRoutingPathPoints"))
  {
    v77 = 0;
    goto LABEL_23;
  }
  -[GEOComposedRoute coordinates](self, "coordinates");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3.index >= (unint64_t)(objc_msgSend(v80, "coordinateCount") - 1))
  {
    v19 = objc_msgSend(v80, "coordinateCount") - 1;
    GEOGetGEOComposedRouteLog();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (a3.index == v19)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        GEOPolylineCoordinateAsString(*(_QWORD *)&a3, 1, 0, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138477827;
        v82 = v23;
        _os_log_impl(&dword_1885A9000, v21, OS_LOG_TYPE_DEFAULT, "geoETAWaypointRouteFromRouteCoordinate: called with route coordinate [%{private}@], which is the last coordinate on the route. Returning nil.", buf, 0xCu);

      }
    }
    else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      GEOPolylineCoordinateAsString(*(_QWORD *)&a3, 1, 0, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478083;
      v82 = v25;
      v83 = 1024;
      v84 = objc_msgSend(v80, "coordinateCount");
      _os_log_impl(&dword_1885A9000, v21, OS_LOG_TYPE_ERROR, "geoETAWaypointRouteFromRouteCoordinate: called with route coordinate [%{private}@]. Route coordinate count: %d", buf, 0x12u);

    }
    goto LABEL_21;
  }
  v7 = objc_msgSend(v80, "pathIndexForRouteCoordinate:", a3);
  if (a3.index == objc_msgSend(v80, "routeIndexForLocalIndex:onPath:", objc_msgSend(v80, "coordinateCountForPathAtIndex:", v7) - 1, v7))
  {
    GEOGetGEOComposedRouteLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      GEOPolylineCoordinateAsString(*(_QWORD *)&a3, 1, 0, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138477827;
      v82 = v10;
      _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_DEFAULT, "geoETAWaypointRouteFromRouteCoordinate: called with route coordinate [%{private}@], which is the last coordinate on a route path. Changing coordinate to first coordinate of next path.", buf, 0xCu);

    }
    a3 = (PolylineCoordinate)objc_msgSend(v80, "routeIndexForLocalIndex:onPath:", 0, v7 + 1);
  }
  v11 = -[GEOComposedRoute stepIndexForRouteCoordinate:](self, "stepIndexForRouteCoordinate:", a3);
  -[GEOComposedRoute steps](self, "steps");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11 < objc_msgSend(v12, "count");

  if (!v13)
    goto LABEL_21;
  -[GEOComposedRoute steps](self, "steps");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "routeCoordinateRange");
  if ((_DWORD)v17 == (_DWORD)v16)
  {
    if (*((float *)&v17 + 1) == *((float *)&v16 + 1) || *((float *)&v17 + 1) >= *((float *)&v16 + 1))
      goto LABEL_13;
  }
  else if (v17 >= v16)
  {
LABEL_13:
    v18 = v17;
    v17 = v16;
    goto LABEL_26;
  }
  v18 = v16;
LABEL_26:
  offset = *((float *)&v17 + 1);
  v28 = (PolylineCoordinate)v17;
  if ((_DWORD)v17 != a3.index)
  {
    if (v17 >= a3.index)
      goto LABEL_32;
    goto LABEL_31;
  }
  if (*((float *)&v17 + 1) != a3.offset && *((float *)&v17 + 1) < a3.offset)
  {
LABEL_31:
    offset = a3.offset;
    LODWORD(v17) = a3.index;
    v28 = a3;
  }
LABEL_32:
  if ((_DWORD)v17 != (_DWORD)v18)
  {
    if (v17 >= v18)
      goto LABEL_38;
    goto LABEL_37;
  }
  if (offset != *((float *)&v18 + 1) && offset < *((float *)&v18 + 1))
LABEL_37:
    v18 = (uint64_t)v28;
LABEL_38:
  v79 = v18;

  v75 = -[GEOComposedRoute legIndexForStepIndex:](self, "legIndexForStepIndex:", v11);
  -[GEOComposedRoute legs](self, "legs");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v75 < objc_msgSend(v29, "count");

  if (v30)
  {
    v77 = objc_alloc_init(GEOETATrafficUpdateWaypointRoute);
    -[GEOETATrafficUpdateWaypointRoute setIdentifier:](v77, "setIdentifier:", -[GEOComposedRoute serverIdentifier](self, "serverIdentifier"));
    for (i = v75; ; i = v78 + 1)
    {
      v78 = i;
      -[GEOComposedRoute legs](self, "legs");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v78 < objc_msgSend(v32, "count");

      if (!v33)
        goto LABEL_22;
      -[GEOComposedRoute legs](self, "legs");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectAtIndexedSubscript:", v78);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v36 = objc_alloc_init(GEOETARoute);
      v38 = v79;
      if (v78 != v75)
        v38 = objc_msgSend(v35, "startRouteCoordinate");
      LODWORD(v37) = HIDWORD(v38);
      v39 = *((float *)&v38 + 1) - floorf(*((float *)&v38 + 1));
      v40 = vcvtms_u32_f32(*((float *)&v38 + 1)) + v38;
      v41 = *((float *)&v38 + 1) >= 0.0 ? v39 : -1.0;
      v42 = *((float *)&v38 + 1) >= 0.0 ? v40 : 0;
      v43 = objc_msgSend(v35, "endRouteCoordinate", v37);
      if ((_DWORD)v42 == (_DWORD)v43)
        break;
      if (v42 < v43)
        goto LABEL_53;
LABEL_54:
      if (v78 > v75 || v74)
      {
        objc_msgSend(v35, "geoOriginWaypointInfo");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = (void *)objc_msgSend(v50, "copy");
        -[GEOETARoute setOriginWaypointInfo:](v36, "setOriginWaypointInfo:", v51);

        objc_msgSend(v35, "origin");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "uniqueID");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "_geo_waypointUUID");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOETARoute originWaypointInfo](v36, "originWaypointInfo");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "setUniqueWaypointId:", v49);

      }
      else
      {
        v45 = objc_alloc_init(GEOWaypointInfo);
        -[GEOETARoute setOriginWaypointInfo:](v36, "setOriginWaypointInfo:", v45);

        -[GEOETARoute originWaypointInfo](v36, "originWaypointInfo");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "setSource:", 1);

        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "_geo_waypointUUID");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOETARoute originWaypointInfo](v36, "originWaypointInfo");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setUniqueWaypointId:", v48);
      }

      objc_msgSend(v35, "geoDestinationWaypointInfo");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = (void *)objc_msgSend(v53, "copy");
      -[GEOETARoute setDestinationWaypointInfo:](v36, "setDestinationWaypointInfo:", v54);

      objc_msgSend(v35, "destination");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "uniqueID");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "_geo_waypointUUID");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOETARoute destinationWaypointInfo](v36, "destinationWaypointInfo");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setUniqueWaypointId:", v57);

      v59 = v11;
      if (v11 <= objc_msgSend(v35, "startStepIndex"))
        v59 = objc_msgSend(v35, "startStepIndex");
      while (v59 <= objc_msgSend(v35, "endStepIndex"))
      {
        -[GEOComposedRoute steps](self, "steps");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "objectAtIndexedSubscript:", v59);
        v61 = (void *)objc_claimAutoreleasedReturnValue();

        v62 = objc_alloc_init(GEOETAStep);
        -[GEOETAStep setStepID:](v62, "setStepID:", objc_msgSend(v61, "stepID"));
        objc_msgSend(v61, "distance");
        v64 = v63;
        v65 = objc_msgSend(v61, "duration");
        if (v11 == v59)
        {
          objc_msgSend(v80, "distanceBetweenRouteCoordinate:andRouteCoordinate:", v79, objc_msgSend(v61, "endRouteCoordinate"));
          v64 = v66;
          objc_msgSend(v61, "distance");
          if (v64 > v67 + 0.1)
          {
            objc_msgSend(v61, "distance");
            v64 = v68;
          }
          v69 = objc_msgSend(v61, "duration");
          objc_msgSend(v61, "distance");
          v71 = (v64 / v70 * (double)v69);
        }
        else
        {
          v71 = v65;
        }
        -[GEOETAStep setExpectedTime:](v62, "setExpectedTime:", v71);
        -[GEOETAStep setDistanceCm:](v62, "setDistanceCm:", (v64 * 100.0));
        objc_msgSend(v61, "evInfo");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        if (v72)
        {
          v73 = objc_alloc_init(GEOEVStateInfo);
          -[GEOEVStateInfo setRemainingBatteryCharge:](v73, "setRemainingBatteryCharge:", objc_msgSend(v72, "remainingBatteryCharge"));
          -[GEOEVStateInfo setRemainingBatteryPercentage:](v73, "setRemainingBatteryPercentage:", objc_msgSend(v72, "remainingBatteryPercentage"));
          -[GEOETAStep setEvStateInfo:](v62, "setEvStateInfo:", v73);

        }
        -[GEOETARoute addStep:](v36, "addStep:", v62);

        ++v59;
      }
      -[GEOETATrafficUpdateWaypointRoute addRouteLeg:](v77, "addRouteLeg:", v36);

    }
    if (v41 >= *((float *)&v43 + 1))
      goto LABEL_54;
LABEL_53:
    objc_msgSend(v80, "routingPathDataWithSupportPointFromStart:toEnd:supportPointsOnly:startPathSegment:", v42 | ((unint64_t)LODWORD(v41) << 32), objc_msgSend(v35, "endRouteCoordinate"), 1, v76);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOETARoute setPathLeg:](v36, "setPathLeg:", v44);

    goto LABEL_54;
  }
LABEL_21:
  v77 = 0;
LABEL_22:

LABEL_23:
  return v77;
}

- (void)iterateTravelTimeRangesToRouteCoordinate:(PolylineCoordinate)a3 etaRoute:(id)a4 handler:(id)a5
{
  -[GEOComposedRoute _iterateTravelTimeRangesForRouteCoordinate:etaRoute:fromOrigin:handler:](self, "_iterateTravelTimeRangesForRouteCoordinate:etaRoute:fromOrigin:handler:", a3, a4, 1, a5);
}

- (void)iterateTravelTimeRangesFromRouteCoordinate:(PolylineCoordinate)a3 etaRoute:(id)a4 handler:(id)a5
{
  -[GEOComposedRoute _iterateTravelTimeRangesForRouteCoordinate:etaRoute:fromOrigin:handler:](self, "_iterateTravelTimeRangesForRouteCoordinate:etaRoute:fromOrigin:handler:", a3, a4, 0, a5);
}

- (double)remainingTimeToEndOfCurrentLegFrom:(PolylineCoordinate)a3 etaRoute:(id)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[6];
  uint64_t v16;
  double *v17;
  uint64_t v18;
  uint64_t v19;

  v6 = a4;
  v7 = -[GEOComposedRoute legIndexForRouteCoordinate:](self, "legIndexForRouteCoordinate:", a3);
  -[GEOComposedRoute legs](self, "legs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  v10 = 0.0;
  if (v7 < v9)
  {
    -[GEOComposedRoute legs](self, "legs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "endRouteCoordinate");
    v16 = 0;
    v17 = (double *)&v16;
    v18 = 0x2020000000;
    v19 = 0;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __72__GEOComposedRoute_Extras__remainingTimeToEndOfCurrentLegFrom_etaRoute___block_invoke;
    v15[3] = &unk_1E1C14228;
    v15[4] = &v16;
    v15[5] = v13;
    -[GEOComposedRoute iterateTravelTimeRangesFromRouteCoordinate:etaRoute:handler:](self, "iterateTravelTimeRangesFromRouteCoordinate:etaRoute:handler:", a3, v6, v15);
    v10 = v17[3];
    _Block_object_dispose(&v16, 8);

  }
  return v10;
}

double __72__GEOComposedRoute_Extras__remainingTimeToEndOfCurrentLegFrom_etaRoute___block_invoke(uint64_t a1, uint64_t a2, double a3, double a4, uint64_t a5, _BYTE *a6)
{
  uint64_t v6;
  double result;
  uint64_t v8;

  v6 = *(_QWORD *)(a1 + 40);
  if ((_DWORD)v6 == (_DWORD)a2)
  {
    LODWORD(result) = HIDWORD(a2);
    if (*((float *)&v6 + 1) <= *((float *)&a2 + 1))
    {
LABEL_3:
      *a6 = 1;
      return result;
    }
  }
  else if (v6 < a2)
  {
    goto LABEL_3;
  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = *(double *)(v8 + 24) + a4;
  *(double *)(v8 + 24) = result;
  return result;
}

- (double)remainingTimeToEndOfRouteFrom:(PolylineCoordinate)a3 etaRoute:(id)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  unint64_t i;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  unint64_t v26;

  v6 = a4;
  v7 = -[GEOComposedRoute legIndexForRouteCoordinate:](self, "legIndexForRouteCoordinate:", a3);
  -[GEOComposedRoute legs](self, "legs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  v10 = 0.0;
  if (v7 < v9)
  {
    -[GEOComposedRoute remainingTimeToEndOfCurrentLegFrom:etaRoute:](self, "remainingTimeToEndOfCurrentLegFrom:etaRoute:", a3, v6);
    v10 = v11;
    if (v6)
    {
      -[GEOComposedRoute legs](self, "legs");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");
      objc_msgSend(v6, "legs");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      for (i = v7 + v15 - v13 + 1; ; ++i)
      {
        objc_msgSend(v6, "legs");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "count");

        if (i >= v18)
          break;
        objc_msgSend(v6, "legs");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectAtIndexedSubscript:", i);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v20, "travelDuration");
        v10 = v10 + v21;

      }
    }
    else
    {
      while (1)
      {
        ++v7;
        -[GEOComposedRoute legs](self, "legs");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "count");

        if (v7 >= v26)
          break;
        -[GEOComposedRoute legs](self, "legs");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectAtIndexedSubscript:", v7);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v23, "travelDuration");
        v10 = v10 + v24;

      }
    }
  }

  return v10;
}

- (id)truncatedTrafficFromRouteCoordinate:(PolylineCoordinate)a3
{
  double v3;
  GEOComposedRouteTraffic *v4;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  GEOComposedRouteTrafficColorInfo *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  double v28;
  GEOComposedRouteTrafficIncidentInfo *v29;
  void *v30;
  double v31;
  void *v32;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  *(float *)&v3 = a3.offset;
  if (a3.offset >= 0.0)
  {
    -[GEOComposedRoute coordinates](self, "coordinates", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "distanceFromStartToRouteCoordinate:", a3);
    v9 = v8;

    -[GEOComposedRoute traffic](self, "traffic");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (fabs(v9) >= 0.00000001)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      objc_msgSend(v34, "routeTrafficColors");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "reverseObjectEnumerator");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v40;
        while (2)
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v40 != v15)
              objc_enumerationMutation(v13);
            v17 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
            v18 = objc_alloc_init(GEOComposedRouteTrafficColorInfo);
            -[GEOComposedRouteTrafficColorInfo setColor:](v18, "setColor:", objc_msgSend(v17, "color"));
            objc_msgSend(v11, "insertObject:atIndex:", v18, 0);
            objc_msgSend(v17, "offsetMeters");
            if (v19 <= v9)
            {
              -[GEOComposedRouteTrafficColorInfo setOffsetMeters:](v18, "setOffsetMeters:", 0.0);
              -[GEOComposedRouteTrafficColorInfo setRouteCoordinate:](v18, "setRouteCoordinate:", 0);

              goto LABEL_15;
            }
            objc_msgSend(v17, "offsetMeters");
            -[GEOComposedRouteTrafficColorInfo setOffsetMeters:](v18, "setOffsetMeters:", v20 - v9);
            -[GEOComposedRoute coordinates](self, "coordinates");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[GEOComposedRouteTrafficColorInfo offsetMeters](v18, "offsetMeters");
            -[GEOComposedRouteTrafficColorInfo setRouteCoordinate:](v18, "setRouteCoordinate:", objc_msgSend(v21, "routeCoordinateForDistanceAfterStart:"));

          }
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
          if (v14)
            continue;
          break;
        }
      }
LABEL_15:

      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      objc_msgSend(v34, "routeIncidents");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "reverseObjectEnumerator");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      if (v24)
      {
        v25 = *(_QWORD *)v36;
LABEL_17:
        v26 = 0;
        while (1)
        {
          if (*(_QWORD *)v36 != v25)
            objc_enumerationMutation(v23);
          v27 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v26);
          objc_msgSend(v27, "offsetMeters");
          if (v28 <= v9)
            break;
          v29 = objc_alloc_init(GEOComposedRouteTrafficIncidentInfo);
          objc_msgSend(v27, "incident");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[GEOComposedRouteTrafficIncidentInfo setIncident:](v29, "setIncident:", v30);

          objc_msgSend(v27, "offsetMeters");
          -[GEOComposedRouteTrafficIncidentInfo setOffsetMeters:](v29, "setOffsetMeters:", v31 - v9);
          -[GEOComposedRoute coordinates](self, "coordinates");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[GEOComposedRouteTrafficIncidentInfo offsetMeters](v29, "offsetMeters");
          -[GEOComposedRouteTrafficIncidentInfo setRouteCoordinate:](v29, "setRouteCoordinate:", objc_msgSend(v32, "routeCoordinateForDistanceAfterStart:"));

          objc_msgSend(0, "insertObject:atIndex:", v29, 0);
          if (v24 == ++v26)
          {
            v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
            if (v24)
              goto LABEL_17;
            break;
          }
        }
      }

      v4 = -[GEOComposedRouteTraffic initWithColorInfos:incidentInfos:]([GEOComposedRouteTraffic alloc], "initWithColorInfos:incidentInfos:", v11, 0);
      v10 = v34;
    }
    else
    {
      v10 = v34;
      v4 = v34;
    }

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (PolylineCoordinate)coordinateAtTimeInterval:(double)a3 beforeCoordinate:(PolylineCoordinate)a4 etaRoute:(id)a5
{
  id v8;
  uint64_t v9;
  PolylineCoordinate v10;
  _QWORD v12[7];
  id v13[2];
  id location;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  uint64_t (*v19)();
  const char *v20;
  PolylineCoordinate v21;
  _QWORD v22[5];
  _QWORD v23[4];

  v8 = a5;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v9 = MEMORY[0x1E0C809B0];
  v23[3] = 0;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __79__GEOComposedRoute_Extras__coordinateAtTimeInterval_beforeCoordinate_etaRoute___block_invoke;
  v22[3] = &unk_1E1C14250;
  v22[4] = v23;
  -[GEOComposedRoute iterateTravelTimeRangesToRouteCoordinate:etaRoute:handler:](self, "iterateTravelTimeRangesToRouteCoordinate:etaRoute:handler:", a4, v8, v22);
  v15 = 0;
  v16 = &v15;
  v17 = 0x3812000000;
  v18 = __Block_byref_object_copy__81;
  v19 = __Block_byref_object_dispose__81;
  v20 = "";
  v21 = a4;
  objc_initWeak(&location, self);
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __79__GEOComposedRoute_Extras__coordinateAtTimeInterval_beforeCoordinate_etaRoute___block_invoke_13;
  v12[3] = &unk_1E1C14278;
  objc_copyWeak(v13, &location);
  v13[1] = *(id *)&a3;
  v12[5] = v23;
  v12[6] = &v15;
  v12[4] = self;
  -[GEOComposedRoute iterateTravelTimeRangesToRouteCoordinate:etaRoute:handler:](self, "iterateTravelTimeRangesToRouteCoordinate:etaRoute:handler:", a4, v8, v12);
  v10 = (PolylineCoordinate)v16[6];
  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(v23, 8);

  return v10;
}

double __79__GEOComposedRoute_Extras__coordinateAtTimeInterval_beforeCoordinate_etaRoute___block_invoke(uint64_t a1, double a2, double a3)
{
  uint64_t v3;
  double result;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = *(double *)(v3 + 24) + a3;
  *(double *)(v3 + 24) = result;
  return result;
}

void __79__GEOComposedRoute_Extras__coordinateAtTimeInterval_beforeCoordinate_etaRoute___block_invoke_13(uint64_t a1, uint64_t a2, double a3, double a4, uint64_t a5, _BYTE *a6)
{
  id WeakRetained;
  uint64_t v12;
  double v13;
  double v14;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));

  if (!WeakRetained)
    goto LABEL_4;
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(double *)(v12 + 24) - a4;
  v14 = *(double *)(a1 + 64);
  if (v13 < v14)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48) = objc_msgSend(*(id *)(a1 + 32), "routeCoordinateForDistance:afterRouteCoordinate:", a2, (a4 - v14) / a4 * a3);
LABEL_4:
    *a6 = 1;
    return;
  }
  *(double *)(v12 + 24) = v13;
}

- (PolylineCoordinate)coordinateAtTimeInterval:(double)a3 afterCoordinate:(PolylineCoordinate)a4 etaRoute:(id)a5
{
  id v8;
  PolylineCoordinate v9;
  _QWORD v11[7];
  id v12[2];
  id location;
  _QWORD v14[4];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  uint64_t (*v19)();
  const char *v20;
  PolylineCoordinate v21;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3812000000;
  v18 = __Block_byref_object_copy__81;
  v19 = __Block_byref_object_dispose__81;
  v20 = "";
  v21 = a4;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  v8 = a5;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78__GEOComposedRoute_Extras__coordinateAtTimeInterval_afterCoordinate_etaRoute___block_invoke;
  v11[3] = &unk_1E1C14278;
  objc_copyWeak(v12, &location);
  v12[1] = *(id *)&a3;
  v11[5] = v14;
  v11[6] = &v15;
  v11[4] = self;
  -[GEOComposedRoute iterateTravelTimeRangesFromRouteCoordinate:etaRoute:handler:](self, "iterateTravelTimeRangesFromRouteCoordinate:etaRoute:handler:", a4, v8, v11);

  v9 = (PolylineCoordinate)v16[6];
  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(&v15, 8);
  return v9;
}

void __78__GEOComposedRoute_Extras__coordinateAtTimeInterval_afterCoordinate_etaRoute___block_invoke(uint64_t a1, uint64_t a2, double a3, double a4, uint64_t a5, _BYTE *a6)
{
  id WeakRetained;
  uint64_t v12;
  double v13;
  double v14;
  double v15;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));

  if (!WeakRetained)
    goto LABEL_4;
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(double *)(v12 + 24);
  v14 = v13 + a4;
  v15 = *(double *)(a1 + 64);
  if (v13 + a4 > v15)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48) = objc_msgSend(*(id *)(a1 + 32), "routeCoordinateForDistance:afterRouteCoordinate:", a2, (v15 - v13) / a4 * a3, v14);
LABEL_4:
    *a6 = 1;
    return;
  }
  *(double *)(v12 + 24) = v14;
}

- (void)nextWaypointOrAnchorPointFromRouteCoordinate:(PolylineCoordinate)a3 outWaypoint:(id *)a4 outAnchorPoint:(id *)a5
{
  id *v5;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  BOOL v23;
  BOOL v24;
  id v25;
  id v26;

  if (a4)
  {
    v5 = a5;
    if (a5)
    {
      v9 = -[GEOComposedRoute legIndexForRouteCoordinate:](self, "legIndexForRouteCoordinate:");
      -[GEOComposedRoute legs](self, "legs");
      v25 = (id)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v25, "count");

      if (v9 < v10)
      {
        -[GEOComposedRoute legs](self, "legs");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", v9);
        v26 = (id)objc_claimAutoreleasedReturnValue();

        v12 = objc_msgSend(v26, "endRouteCoordinate");
        objc_msgSend(v26, "destination");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOComposedRoute anchorPoints](self, "anchorPoints");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v14, "count");

        if (v15)
        {
          -[GEOComposedRoute anchorPoints](self, "anchorPoints");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "nextAnchorPointIndexAfter:", a3);

          if (v17
            && (-[GEOComposedRoute anchorPoints](self, "anchorPoints"),
                v18 = (void *)objc_claimAutoreleasedReturnValue(),
                v19 = objc_msgSend(v18, "count") - 1,
                v18,
                v17 < v19))
          {
            -[GEOComposedRoute anchorPoints](self, "anchorPoints");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectAtIndexedSubscript:", v17);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v15 = 0;
          }
        }
        if (!v13 || v15)
        {
          if (v15 && !v13)
          {
            v21 = v15;
            goto LABEL_15;
          }
          v22 = objc_msgSend(v15, "routeCoordinate");
          v23 = v22 >= v12;
          if ((_DWORD)v22 == (_DWORD)v12)
          {
            v24 = *((float *)&v22 + 1) < *((float *)&v12 + 1);
            v21 = v15;
            if (v24)
              goto LABEL_15;
          }
          else
          {
            v21 = v15;
            if (!v23)
              goto LABEL_15;
          }
        }
        v21 = v13;
        v5 = a4;
LABEL_15:
        *v5 = objc_retainAutorelease(v21);

      }
    }
  }
}

- (id)_geoETAWaypointRouteWithZilchFromRouteCoordinate:(PolylineCoordinate)a3
{
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  unint64_t i;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  GEOETARoute *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  GEOETAStep *v24;
  double v25;
  double v26;
  uint64_t v27;
  double v28;
  NSObject *v29;
  int v30;
  uint64_t v31;
  double v32;
  unsigned int v33;
  double v34;
  double v35;
  uint64_t v36;
  void *v37;
  GEOEVStateInfo *v38;
  unint64_t v40;
  GEOETATrafficUpdateWaypointRoute *v41;
  void *v42;
  void *v43;
  unint64_t v44;
  PolylineCoordinate v45;
  void *v46;
  uint8_t buf[4];
  int v48;
  __int16 v49;
  double v50;
  __int16 v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  if (!-[GEOComposedRoute usesZilch](self, "usesZilch"))
    goto LABEL_26;
  v45 = a3;
  v5 = -[GEOComposedRoute stepIndexForRouteCoordinate:](self, "stepIndexForRouteCoordinate:", a3);
  -[GEOComposedRoute steps](self, "steps");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v5 >= v7)
    goto LABEL_26;
  v40 = -[GEOComposedRoute legIndexForStepIndex:](self, "legIndexForStepIndex:", v5);
  -[GEOComposedRoute legs](self, "legs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v40 < v9)
  {
    -[GEOComposedRoute coordinates](self, "coordinates");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_alloc_init(GEOETATrafficUpdateWaypointRoute);
    -[GEOETATrafficUpdateWaypointRoute setIdentifier:](v41, "setIdentifier:", -[GEOComposedRoute serverIdentifier](self, "serverIdentifier"));
    for (i = v40; ; i = v44 + 1)
    {
      v44 = i;
      -[GEOComposedRoute legs](self, "legs");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v44 < objc_msgSend(v11, "count");

      if (!v12)
        break;
      -[GEOComposedRoute legs](self, "legs");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", v44);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = v5;
      if (v5 <= objc_msgSend(v14, "startStepIndex"))
        v15 = objc_msgSend(v14, "startStepIndex");
      -[GEOComposedRoute steps](self, "steps");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", v15);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v46, "compressedZilchDataToEndOfPathFromIndex:", objc_msgSend(v42, "startPointIndex"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_alloc_init(GEOETARoute);
      -[GEOETARoute addZilchPoints:](v17, "addZilchPoints:", v43);
      if (v44 > v40)
      {
        objc_msgSend(v14, "geoOriginWaypointInfo");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOETARoute setOriginWaypointInfo:](v17, "setOriginWaypointInfo:", v18);

      }
      objc_msgSend(v14, "geoDestinationWaypointInfo");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOETARoute setDestinationWaypointInfo:](v17, "setDestinationWaypointInfo:", v19);

      LODWORD(v20) = 0;
      while (v15 <= objc_msgSend(v14, "endStepIndex"))
      {
        -[GEOComposedRoute steps](self, "steps");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectAtIndexedSubscript:", v15);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v22, "pointCount"))
          v23 = objc_msgSend(v22, "pointCount") - 1;
        else
          v23 = 0;
        v24 = objc_alloc_init(GEOETAStep);
        -[GEOETAStep setStepID:](v24, "setStepID:", objc_msgSend(v22, "stepID"));
        v20 = (v23 + v20);
        -[GEOETAStep setZilchPointIndex:](v24, "setZilchPointIndex:", v20);
        if (v5 == v15)
        {
          objc_msgSend(v46, "distanceBetweenRouteCoordinate:andRouteCoordinate:", v45, objc_msgSend(v22, "endPointIndex"));
          v26 = v25;
          objc_msgSend(v22, "distance");
          if (v26 > v28)
          {
            GEOGetGEOComposedRouteLog();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              v30 = objc_msgSend(v22, "stepID");
              objc_msgSend(v22, "distance");
              *(_DWORD *)buf = 67109632;
              v48 = v30;
              v49 = 2048;
              v50 = v26;
              v51 = 2048;
              v52 = v31;
              _os_log_impl(&dword_1885A9000, v29, OS_LOG_TYPE_ERROR, "ETA step (%d) has stepDistanceRemaining of %0.1fm, but total step distance is only %0.1fm. This is probably a server error", buf, 0x1Cu);
            }

            objc_msgSend(v22, "distance");
            v26 = v32;
          }
          LODWORD(v27) = vcvtad_u64_f64(v26 * 100.0);
          -[GEOETAStep setDistanceCm:](v24, "setDistanceCm:", v27);
          v33 = objc_msgSend(v22, "duration");
          objc_msgSend(v22, "distance");
          -[GEOETAStep setExpectedTime:](v24, "setExpectedTime:", (v26 / v34 * (double)v33));
        }
        else
        {
          objc_msgSend(v22, "distance");
          LODWORD(v36) = vcvtad_u64_f64(v35 * 100.0);
          -[GEOETAStep setDistanceCm:](v24, "setDistanceCm:", v36);
          -[GEOETAStep setExpectedTime:](v24, "setExpectedTime:", objc_msgSend(v22, "duration"));
        }
        objc_msgSend(v22, "evInfo");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (v37)
        {
          v38 = objc_alloc_init(GEOEVStateInfo);
          -[GEOEVStateInfo setRemainingBatteryCharge:](v38, "setRemainingBatteryCharge:", objc_msgSend(v37, "remainingBatteryCharge"));
          -[GEOEVStateInfo setRemainingBatteryPercentage:](v38, "setRemainingBatteryPercentage:", objc_msgSend(v37, "remainingBatteryPercentage"));
          -[GEOETAStep setEvStateInfo:](v24, "setEvStateInfo:", v38);

        }
        -[GEOETARoute addStep:](v17, "addStep:", v24);

        ++v15;
      }
      -[GEOETATrafficUpdateWaypointRoute addRouteLeg:](v41, "addRouteLeg:", v17);

    }
  }
  else
  {
LABEL_26:
    v41 = 0;
  }
  return v41;
}

- (void)_iterateTravelTimeRangesForRouteCoordinate:(PolylineCoordinate)a3 etaRoute:(id)a4 fromOrigin:(BOOL)a5 handler:(id)a6
{
  id v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  double v14;
  id v15;
  uint64_t v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[5];
  id v30;
  _BYTE *v31;
  PolylineCoordinate v32;
  BOOL v33;
  uint8_t v34[128];
  _BYTE buf[24];
  char v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  if (v11)
  {
    if (v10)
    {
      v12 = objc_msgSend(v10, "startRouteCoordinate");
      if (a3.index < v12 || a3.index == (_DWORD)v12 && a3.offset < *((float *)&v12 + 1))
      {
        GEOGetGEOComposedRouteLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          GEOPolylineCoordinateAsString(*(_QWORD *)&a3, 1, 0, v14);
          v15 = (id)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v10, "startRouteCoordinate");
          GEOPolylineCoordinateAsString(v16, 1, 0, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v15;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v18;
          _os_log_impl(&dword_1885A9000, v13, OS_LOG_TYPE_ERROR, "Input route coordinate is [%@], but provided ETA route starts from coordinate [%@]. Mixing travel times from directions responses and ETAU responses is not supported yet.", buf, 0x16u);

        }
        v10 = 0;
      }
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v36 = 0;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __99__GEOComposedRoute_Extras___iterateTravelTimeRangesForRouteCoordinate_etaRoute_fromOrigin_handler___block_invoke;
    v29[3] = &unk_1E1C142C8;
    v33 = a5;
    v32 = a3;
    v29[4] = self;
    v30 = v11;
    v31 = buf;
    v19 = (void *)MEMORY[0x18D765024](v29);
    if (v10)
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      objc_msgSend(v10, "legs", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v26;
LABEL_12:
        v23 = 0;
        while (1)
        {
          if (*(_QWORD *)v26 != v22)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v23), "steps");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "enumerateObjectsUsingBlock:", v19);

          if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
            break;
          if (v21 == ++v23)
          {
            v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
            if (v21)
              goto LABEL_12;
            break;
          }
        }
      }
    }
    else
    {
      -[GEOComposedRoute steps](self, "steps");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "enumerateObjectsUsingBlock:", v19);
    }

    _Block_object_dispose(buf, 8);
  }

}

void __99__GEOComposedRoute_Extras___iterateTravelTimeRangesForRouteCoordinate_etaRoute_fromOrigin_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  float v11;
  unsigned int v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  uint64_t v19;
  uint64_t v20;
  char v21;

  v6 = a2;
  v7 = v6;
  if (*(_BYTE *)(a1 + 64))
  {
    v8 = objc_msgSend(v6, "routeCoordinateRange");
    v9 = *(_DWORD *)(a1 + 56);
    if (v9 < v8 || v9 == (_DWORD)v8 && *(float *)(a1 + 60) < *((float *)&v8 + 1))
      goto LABEL_10;
    if (*(_BYTE *)(a1 + 64))
    {
LABEL_9:
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __99__GEOComposedRoute_Extras___iterateTravelTimeRangesForRouteCoordinate_etaRoute_fromOrigin_handler___block_invoke_2;
      v17[3] = &unk_1E1C142A0;
      v21 = *(_BYTE *)(a1 + 64);
      v14 = *(void **)(a1 + 32);
      v13 = *(void **)(a1 + 40);
      v20 = *(_QWORD *)(a1 + 56);
      v17[4] = v14;
      v15 = v13;
      v16 = *(_QWORD *)(a1 + 48);
      v18 = v15;
      v19 = v16;
      objc_msgSend(v14, "_iterateTravelTimeRangesForStep:handler:", v7, v17);
      *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

      goto LABEL_10;
    }
  }
  objc_msgSend(v7, "routeCoordinateRange");
  v12 = *(_DWORD *)(a1 + 56);
  if (v12 <= v10 && (v12 != v10 || *(float *)(a1 + 60) <= v11))
    goto LABEL_9;
LABEL_10:

}

uint64_t __99__GEOComposedRoute_Extras___iterateTravelTimeRangesForRouteCoordinate_etaRoute_fromOrigin_handler___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4, double a5, double a6)
{
  double v7;
  double v8;
  _QWORD *v10;
  int v11;
  unsigned int v12;
  BOOL v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  double v18;

  v7 = a6;
  v8 = a5;
  v10 = (_QWORD *)result;
  LODWORD(a6) = HIDWORD(a2);
  LODWORD(a5) = HIDWORD(a3);
  v11 = *(unsigned __int8 *)(result + 64);
  v12 = *(_DWORD *)(result + 56);
  if (*(_BYTE *)(result + 64))
  {
    if (v12 < a2)
      return result;
    if (v12 == (_DWORD)a2)
    {
      if (fabs(v8) >= 0.01 && *(float *)(result + 60) >= *((float *)&a2 + 1))
        goto LABEL_18;
    }
    else if (fabs(v8) >= 0.01)
    {
      goto LABEL_18;
    }
  }
  else if (v12 <= a3)
  {
    v14 = v12 == (_DWORD)a3 && *(float *)(result + 60) > *((float *)&a3 + 1);
    if (fabs(v8) >= 0.01 && !v14)
    {
LABEL_18:
      v15 = *(_QWORD *)(result + 56);
      if ((_DWORD)a2 == (_DWORD)v15)
      {
        if (*((float *)&a2 + 1) > *((float *)&v15 + 1))
          goto LABEL_30;
      }
      else if (a2 >= v15)
      {
        goto LABEL_30;
      }
      if ((_DWORD)v15 == (_DWORD)a3)
      {
        if (*((float *)&v15 + 1) > *((float *)&a3 + 1))
          goto LABEL_30;
LABEL_26:
        v16 = *(void **)(result + 32);
        if (v11)
        {
          v17 = a2;
        }
        else
        {
          v17 = v10[7];
          v15 = a3;
        }
        objc_msgSend(v16, "distanceBetweenRouteCoordinate:andRouteCoordinate:", v17, v15, a5, a6);
        v7 = v18 / v8 * v7;
        v8 = v18;
        goto LABEL_30;
      }
      if (v15 < a3)
        goto LABEL_26;
LABEL_30:
      result = (*(uint64_t (**)(double, double))(v10[5] + 16))(v8, v7);
      *a4 = *(_BYTE *)(*(_QWORD *)(v10[6] + 8) + 24);
    }
  }
  return result;
}

- (void)_iterateTravelTimeRangesForStep:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, uint64_t, _BYTE *, double, double);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v16;
  unsigned int v17;
  double v18;
  $212C09783140BCCD23384160D545CE0D v19;
  $212C09783140BCCD23384160D545CE0D v20;
  int64x2_t v21;
  int8x8_t v22;
  int8x16_t v23;
  int8x16_t v24;
  float32x2_t v25;
  int32x2_t v26;
  int8x16_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  char v34;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, uint64_t, _BYTE *, double, double))a4;
  if (v7)
  {
    v34 = 0;
    objc_msgSend(v6, "timeCheckpoints");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = objc_msgSend(v6, "routeCoordinateRange");
      v10 = objc_msgSend(v8, "timeToNextCheckpointsCount") - 1;
      __asm { FMOV            V9.2S, #-1.0 }
      do
      {
        if (v10 + 1 <= 0)
          break;
        v16 = objc_msgSend(v8, "distToNextCheckpointAtIndex:", v10);
        v17 = objc_msgSend(v8, "timeToNextCheckpointAtIndex:", v10);
        v18 = (double)v16;
        if (v10)
        {
          v19 = -[GEOComposedRoute routeCoordinateForDistance:afterRouteCoordinate:](self, "routeCoordinateForDistance:afterRouteCoordinate:", v9, (double)v16);
        }
        else
        {
          objc_msgSend(v6, "routeCoordinateRange");
          v19 = v20;
        }
        v21.i64[0] = v9;
        v21.u64[1] = (unint64_t)v19;
        *(int32x2_t *)v21.i8 = vshrn_n_s64(v21, 0x20uLL);
        v22 = (int8x8_t)vcltz_f32(*(float32x2_t *)v21.i8);
        v23.i64[0] = v22.i32[0];
        v23.i64[1] = v22.i32[1];
        v24 = v23;
        v25 = vrndm_f32(*(float32x2_t *)v21.i8);
        v26 = vadd_s32((int32x2_t)vcvt_u32_f32(v25), (int32x2_t)__PAIR64__(v19.var0, v9));
        v23.i64[0] = v26.u32[0];
        v23.i64[1] = v26.u32[1];
        v27 = vorrq_s8((int8x16_t)vshll_n_s32((int32x2_t)vbsl_s8(v22, _D9, (int8x8_t)vsub_f32(*(float32x2_t *)v21.i8, v25)), 0x20uLL), vbicq_s8(v23, v24));
        v7[2](v7, v27.i64[0], v27.i64[1], &v34, v18, (double)v17);
        --v10;
        v9 = (uint64_t)v19;
      }
      while (!v34);
    }
    else
    {
      v28 = objc_msgSend(v6, "routeCoordinateRange");
      v30 = v29;
      objc_msgSend(v6, "distance");
      v32 = v31;
      objc_msgSend(v6, "travelTime");
      v7[2](v7, v28, v30, &v34, v32, v33);
    }

  }
}

- (int)_routeCreationMethod
{
  unint64_t v2;

  v2 = -[GEOComposedRoute source](self, "source");
  if (v2 == 3)
    return 1;
  else
    return 2 * (v2 == 2);
}

@end
