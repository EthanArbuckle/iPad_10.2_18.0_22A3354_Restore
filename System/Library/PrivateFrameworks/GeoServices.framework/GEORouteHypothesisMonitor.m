@implementation GEORouteHypothesisMonitor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)userPreferencesProvider
{
  return (id)userPreferencesProvider;
}

+ (void)setUserPreferencesProvider:(id)a3
{
  objc_storeStrong((id *)&userPreferencesProvider, a3);
}

+ (id)serverFormattedStringFormatter
{
  return (id)serverFormattedStringFormatter;
}

+ (void)setServerFormattedStringFormatter:(id)a3
{
  objc_storeStrong((id *)&serverFormattedStringFormatter, a3);
}

+ (id)routeAttributesForTransportType:(int)a3 withArrivalDate:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  __CFString *v10;
  GEORouteAttributes *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  int v15;
  GEOAutomobileOptions *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  int v22;
  int v23;
  const __CFString *v24;
  const __CFString *v25;
  id v26;
  void *v27;
  NSObject *v28;
  unint64_t i;
  void *v30;
  NSObject *v31;
  _QWORD v33[2];
  int v34;
  char v35;
  __int16 v36;
  char v37;
  uint8_t buf[4];
  _BYTE v39[10];
  const __CFString *v40;
  int Integer;
  __int16 v42;
  _BOOL4 HasValue;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (a3 == 4)
  {
    v6 = GEOGetUserTransportTypePreference();
    GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67175681;
      *(_DWORD *)v39 = v6;
      *(_WORD *)&v39[4] = 1025;
      *(_DWORD *)&v39[6] = GEOConfigGetInteger(GeoServicesConfig_TransportTypePreference, (uint64_t)off_1EDF4CBC8);
      LOWORD(v40) = 1024;
      *(_DWORD *)((char *)&v40 + 2) = _GEOConfigHasValue(GeoServicesConfig_TransportTypePreference, (uint64_t)off_1EDF4CBC8);
      HIWORD(v40) = 1025;
      Integer = GEOConfigGetInteger(GeoServicesConfig_DefaultMapMode, (uint64_t)off_1EDF4DB98);
      v42 = 1024;
      HasValue = _GEOConfigHasValue(GeoServicesConfig_DefaultMapMode, (uint64_t)off_1EDF4DB98);
      _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_DEFAULT, "Setting transport type from user preference: %{private}d | transport type reference: %{private}d (%d) | default map mode: %{private}d (%d)", buf, 0x20u);
    }

    if (v6 == 1)
      v8 = 2;
    else
      v8 = v6 == 2;
    GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = off_1E1C0F6D8[v8];
      *(_DWORD *)buf = 138477827;
      *(_QWORD *)v39 = v10;
      _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_DEFAULT, "Transport type read from user defaults: %{private}@", buf, 0xCu);

    }
  }
  else if (a3 == 3)
  {
    v8 = 0;
  }
  else
  {
    v8 = a3;
  }
  v11 = objc_alloc_init(GEORouteAttributes);
  -[GEORouteAttributes setRoutePointTypeForTransportType:](v11, "setRoutePointTypeForTransportType:", v8);
  -[GEORouteAttributes setIncludeManeuverIcons:](v11, "setIncludeManeuverIcons:", 0);
  -[GEORouteAttributes setMainTransportType:](v11, "setMainTransportType:", v8);
  if (-[GEORouteAttributes mainTransportType](v11, "mainTransportType"))
  {
    v12 = 0;
  }
  else
  {
    +[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v13, "currentCountrySupportsTraffic");

  }
  -[GEORouteAttributes setIncludeTrafficAlongRoute:](v11, "setIncludeTrafficAlongRoute:", v12);
  -[GEORouteAttributes setIncludeTrafficIncidents:](v11, "setIncludeTrafficIncidents:", v12);
  if (v5)
  {
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    v37 = 0;
    v36 = 0;
    v33[0] = 0;
    v33[1] = v14;
    v34 = 1;
    v35 = 6;
    -[GEORouteAttributes setTimepoint:](v11, "setTimepoint:", v33);
  }
  v15 = -[GEORouteAttributes mainTransportType](v11, "mainTransportType");
  if (v15 == 1)
  {
    +[GEORouteHypothesisMonitor userPreferencesProvider](GEORouteHypothesisMonitor, "userPreferencesProvider");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "currentTransitOptions");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[GEORouteAttributes setTransitOptions:](v11, "setTransitOptions:", v20);
    GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
    v28 = objc_claimAutoreleasedReturnValue();
    LODWORD(v27) = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);

    if (!(_DWORD)v27)
    {
LABEL_36:

      goto LABEL_37;
    }
    v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    for (i = 0; i < objc_msgSend(v20, "avoidedModesCount"); ++i)
    {
      objc_msgSend(v20, "avoidedModesAsString:", objc_msgSend(v20, "avoidedModeAtIndex:", i));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addObject:", v30);

    }
    GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      *(_QWORD *)v39 = v26;
      _os_log_impl(&dword_1885A9000, v31, OS_LOG_TYPE_DEFAULT, "Avoided transit modes %{private}@", buf, 0xCu);
    }

LABEL_35:
    goto LABEL_36;
  }
  if (!v15)
  {
    v16 = objc_alloc_init(GEOAutomobileOptions);
    -[GEORouteAttributes setAutomobileOptions:](v11, "setAutomobileOptions:", v16);

    -[GEORouteAttributes automobileOptions](v11, "automobileOptions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setIncludeHistoricTravelTime:", 1);

    -[GEORouteAttributes automobileOptions](v11, "automobileOptions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTrafficType:", 3);

    +[GEORouteHypothesisMonitor userPreferencesProvider](GEORouteHypothesisMonitor, "userPreferencesProvider");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "currentUserPreferences");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_msgSend(v20, "avoidTolls");
      v23 = objc_msgSend(v20, "avoidHighways");
      v24 = CFSTR("NO");
      if (v22)
        v25 = CFSTR("YES");
      else
        v25 = CFSTR("NO");
      if (v23)
        v24 = CFSTR("YES");
      *(_DWORD *)buf = 138478083;
      *(_QWORD *)v39 = v25;
      *(_WORD *)&v39[8] = 2113;
      v40 = v24;
      _os_log_impl(&dword_1885A9000, v21, OS_LOG_TYPE_DEFAULT, "Avoid tolls %{private}@, Avoid highways %{private}@", buf, 0x16u);
    }

    -[GEORouteAttributes automobileOptions](v11, "automobileOptions");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setUserPreferences:", v20);
    goto LABEL_35;
  }
LABEL_37:
  -[GEORouteAttributes setIncludeHistoricTravelTime:](v11, "setIncludeHistoricTravelTime:", 1);
  -[GEORouteAttributes setTrafficType:](v11, "setTrafficType:", 3);

  return v11;
}

+ (id)monitorWithSource:(id)a3 toDestination:(id)a4 traceName:(id)a5 traits:(id)a6 routeAttributes:(id)a7 clientInfo:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  __CFString *v21;
  void *v22;
  char v23;
  void *v24;
  uint8_t buf[4];
  __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = objc_msgSend(v17, "mainTransportType");
    if (v20 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v20);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = off_1E1C0F6F0[(int)v20];
    }
    *(_DWORD *)buf = 138477827;
    v27 = v21;
    _os_log_impl(&dword_1885A9000, v19, OS_LOG_TYPE_DEFAULT, "Transport type passed from planned destination: %{private}@", buf, 0xCu);

  }
  if (objc_msgSend(v17, "mainTransportType") == 1)
  {
    +[GEONavdDefaults sharedInstance](GEONavdDefaults, "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "transitTTLSupported");

    if ((v23 & 1) == 0)
      objc_msgSend(v17, "setMainTransportType:", 0);
  }
  objc_msgSend(v17, "mainTransportType");
  v24 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSource:toDestination:traceName:traits:routeAttributes:clientInfo:", v13, v14, v15, v16, v17, v18);

  return v24;
}

- (GEORouteHypothesisMonitor)initWithSource:(id)a3 toDestination:(id)a4 traceName:(id)a5 traits:(id)a6 routeAttributes:(id)a7 clientInfo:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  GEORouteHypothesisMonitor *v21;
  GEORouteHypothesisMonitor *v22;
  GEORouteHypothesisMonitor *v23;
  uint64_t v24;
  NSString *traceName;
  uint64_t v26;
  GEORouteAttributes *routeAttributes;
  uint64_t v28;
  GEONavdClientInfo *clientInfo;
  NSMutableArray *v30;
  NSMutableArray *rerouteEntries;
  GEORouteAttributes *v32;
  uint64_t v33;
  NSDate *arrivalDate;
  uint64_t v35;
  GEOETAUpdater *liveETAUpdater;
  GEORouteHypothesis *v37;
  GEORouteHypothesis *hypothesis;
  GEORouteHypothesizerAnalyticsStore *v39;
  GEORouteHypothesizerAnalyticsStore *analyticsStore;
  GEORouteHypothesisMonitor *v41;
  id v43;
  uint8_t buf[8];
  double v45;
  uint64_t v46;
  objc_super v47;

  v43 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v20, OS_LOG_TYPE_DEFAULT, "Creating route hypothesizer", buf, 2u);
  }

  v47.receiver = self;
  v47.super_class = (Class)GEORouteHypothesisMonitor;
  v21 = -[GEORouteHypothesisMonitor init](&v47, sel_init);
  v22 = v21;
  v23 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_source, a3);
    objc_storeStrong((id *)&v22->_destination, a4);
    v24 = objc_msgSend(v16, "copy");
    traceName = v23->_traceName;
    v23->_traceName = (NSString *)v24;

    objc_storeStrong((id *)&v22->_traits, a6);
    v26 = objc_msgSend(v18, "copy");
    routeAttributes = v23->_routeAttributes;
    v23->_routeAttributes = (GEORouteAttributes *)v26;

    v28 = objc_msgSend(v19, "copy");
    clientInfo = v23->_clientInfo;
    v23->_clientInfo = (GEONavdClientInfo *)v28;

    v30 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    rerouteEntries = v23->_rerouteEntries;
    v23->_rerouteEntries = v30;

    if (-[GEORouteAttributes hasTimepoint](v23->_routeAttributes, "hasTimepoint"))
    {
      *(_QWORD *)buf = 0;
      v45 = 0.0;
      v46 = 0;
      v32 = v23->_routeAttributes;
      if (v32)
      {
        -[GEORouteAttributes timepoint](v32, "timepoint");
        if ((v46 & 0x400000000) != 0 && (_DWORD)v46 == 1)
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v45);
          v33 = objc_claimAutoreleasedReturnValue();
          arrivalDate = v23->_arrivalDate;
          v23->_arrivalDate = (NSDate *)v33;

        }
      }
    }
    -[GEORouteHypothesisMonitor _commonInit](v23, "_commonInit");
    if (-[GEORouteHypothesisMonitor supportsLiveTraffic](v23, "supportsLiveTraffic"))
    {
      v35 = -[GEORouteHypothesisMonitor _newETAUpdater](v23, "_newETAUpdater");
      liveETAUpdater = v23->_liveETAUpdater;
      v23->_liveETAUpdater = (GEOETAUpdater *)v35;

    }
    v37 = objc_alloc_init(GEORouteHypothesis);
    hypothesis = v23->_hypothesis;
    v23->_hypothesis = v37;

    -[GEORouteHypothesis setSupportsLiveTraffic:](v23->_hypothesis, "setSupportsLiveTraffic:", -[GEORouteHypothesisMonitor supportsLiveTraffic](v23, "supportsLiveTraffic"));
    v39 = objc_alloc_init(GEORouteHypothesizerAnalyticsStore);
    analyticsStore = v23->_analyticsStore;
    v23->_analyticsStore = v39;

    v41 = v23;
  }

  return v23;
}

- (GEORouteHypothesisMonitor)initWithCoder:(id)a3
{
  id v4;
  GEORouteHypothesisMonitor *v5;
  uint64_t v6;
  GEOComposedWaypoint *source;
  uint64_t v8;
  GEOComposedWaypoint *destination;
  uint64_t v10;
  NSDate *arrivalDate;
  uint64_t v12;
  GEOMapServiceTraits *traits;
  uint64_t v14;
  GEORouteHypothesis *hypothesis;
  uint64_t v16;
  GEOComposedETARoute *liveETARoute;
  uint64_t v18;
  GEORouteHypothesizerAnalyticsStore *analyticsStore;
  uint64_t v20;
  GEOLocation *lastMatchedLocation;
  uint64_t v22;
  GEOLocation *originLocation;
  double v24;
  uint64_t v25;
  NSString *traceName;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSMutableArray *rerouteEntries;
  uint64_t v33;
  GEORouteAttributes *routeAttributes;
  uint64_t v35;
  GEONavdClientInfo *clientInfo;
  uint64_t v37;
  GEOComposedRoute *route;
  uint64_t v39;
  GEORouteMatch *routeMatch;
  uint64_t v41;
  GEOETAUpdater *liveETAUpdater;
  GEORouteHypothesisMonitor *v43;
  objc_super v45;

  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)GEORouteHypothesisMonitor;
  v5 = -[GEORouteHypothesisMonitor init](&v45, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SourceKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    source = v5->_source;
    v5->_source = (GEOComposedWaypoint *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DestinationKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    destination = v5->_destination;
    v5->_destination = (GEOComposedWaypoint *)v8;

    v5->_transportType = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("TransportTypeKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ArrivalDateKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    arrivalDate = v5->_arrivalDate;
    v5->_arrivalDate = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TraitsKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    traits = v5->_traits;
    v5->_traits = (GEOMapServiceTraits *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HypothesisKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    hypothesis = v5->_hypothesis;
    v5->_hypothesis = (GEORouteHypothesis *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LiveETARouteKey"));
    v16 = objc_claimAutoreleasedReturnValue();
    liveETARoute = v5->_liveETARoute;
    v5->_liveETARoute = (GEOComposedETARoute *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AnalyticsStoreKey"));
    v18 = objc_claimAutoreleasedReturnValue();
    analyticsStore = v5->_analyticsStore;
    v5->_analyticsStore = (GEORouteHypothesizerAnalyticsStore *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LastMatchedLocationKey"));
    v20 = objc_claimAutoreleasedReturnValue();
    lastMatchedLocation = v5->_lastMatchedLocation;
    v5->_lastMatchedLocation = (GEOLocation *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("OriginLocationKey"));
    v22 = objc_claimAutoreleasedReturnValue();
    originLocation = v5->_originLocation;
    v5->_originLocation = (GEOLocation *)v22;

    v5->_hasArrived = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HasArrivedKey"));
    v5->_isTraveling = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IsTravelingKey"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("TravelScoreKey"));
    v5->_travelScore = v24;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TraceNameKey"));
    v25 = objc_claimAutoreleasedReturnValue();
    traceName = v5->_traceName;
    v5->_traceName = (NSString *)v25;

    v27 = (void *)MEMORY[0x1E0C99E60];
    v28 = objc_opt_class();
    objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v29, CFSTR("RerouteEntriesKey"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v30);
    rerouteEntries = v5->_rerouteEntries;
    v5->_rerouteEntries = (NSMutableArray *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RouteAttributes"));
    v33 = objc_claimAutoreleasedReturnValue();
    routeAttributes = v5->_routeAttributes;
    v5->_routeAttributes = (GEORouteAttributes *)v33;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ClientInfo"));
    v35 = objc_claimAutoreleasedReturnValue();
    clientInfo = v5->_clientInfo;
    v5->_clientInfo = (GEONavdClientInfo *)v35;

    -[GEORouteHypothesisMonitor _commonInit](v5, "_commonInit");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RouteKey"));
    v37 = objc_claimAutoreleasedReturnValue();
    route = v5->_route;
    v5->_route = (GEOComposedRoute *)v37;

    if (v5->_lastMatchedLocation)
    {
      -[GEORouteHypothesisMonitor routeMatchForLocation:](v5, "routeMatchForLocation:");
      v39 = objc_claimAutoreleasedReturnValue();
      routeMatch = v5->_routeMatch;
      v5->_routeMatch = (GEORouteMatch *)v39;

    }
    if (-[GEORouteHypothesisMonitor supportsLiveTraffic](v5, "supportsLiveTraffic"))
    {
      v41 = -[GEORouteHypothesisMonitor _newETAUpdater](v5, "_newETAUpdater");
      liveETAUpdater = v5->_liveETAUpdater;
      v5->_liveETAUpdater = (GEOETAUpdater *)v41;

    }
    v43 = v5;

  }
  return v5;
}

- (void)_commonInit
{
  GEODirectionsRequestFeedback *v3;
  void *v4;
  GEODirectionsRequestFeedback *v5;
  GEODirectionsRequestFeedback *feedback;
  GEOCommonOptions *v7;
  GEOCommonOptions *commonOptions;
  geo_isolater *v9;
  geo_isolater *requestIsolater;

  v3 = [GEODirectionsRequestFeedback alloc];
  -[GEOMapServiceTraits appIdentifier](self->_traits, "appIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[GEODirectionsRequestFeedback initWithPurpose:andSource:andIdentifier:](v3, "initWithPurpose:andSource:andIdentifier:", 9, 3, v4);
  feedback = self->_feedback;
  self->_feedback = v5;

  v7 = objc_alloc_init(GEOCommonOptions);
  commonOptions = self->_commonOptions;
  self->_commonOptions = v7;

  -[GEOCommonOptions setIncludeTravelTimeAggressive:](self->_commonOptions, "setIncludeTravelTimeAggressive:", 1);
  -[GEOCommonOptions setIncludeTravelTimeConservative:](self->_commonOptions, "setIncludeTravelTimeConservative:", 1);
  -[GEOCommonOptions setIncludeTravelTimeEstimate:](self->_commonOptions, "setIncludeTravelTimeEstimate:", 1);
  -[GEOCommonOptions setExcludeGuidance:](self->_commonOptions, "setExcludeGuidance:", 1);
  v9 = (geo_isolater *)geo_isolater_create();
  requestIsolater = self->_requestIsolater;
  self->_requestIsolater = v9;

}

- (id)_newETAUpdater
{
  GEOETAUpdater *v3;
  GEOComposedWaypoint *source;
  void *v5;
  GEOComposedWaypoint *destination;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(GEOETAUpdater);
  -[GEOETAUpdater setDelegate:](v3, "setDelegate:", self);
  -[GEOETAUpdater setRouteAttributes:](v3, "setRouteAttributes:", self->_routeAttributes);
  source = self->_source;
  v5 = source;
  if (!source)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[0] = v5;
  destination = self->_destination;
  v7 = destination;
  if (!destination)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOETAUpdater setWaypoints:](v3, "setWaypoints:", v8);

  if (!destination)
  if (!source)

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[GEOETAUpdater setDelegate:](self->_liveETAUpdater, "setDelegate:", 0);
  -[GEORouteHypothesisMonitor cancelCurrentRequest](self, "cancelCurrentRequest");
  v3.receiver = self;
  v3.super_class = (Class)GEORouteHypothesisMonitor;
  -[GEORouteHypothesisMonitor dealloc](&v3, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[GEORouteHypothesisMonitor source](self, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("SourceKey"));

  -[GEORouteHypothesisMonitor destination](self, "destination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("DestinationKey"));

  objc_msgSend(v7, "encodeInt32:forKey:", -[GEORouteHypothesisMonitor transportType](self, "transportType"), CFSTR("TransportTypeKey"));
  -[GEORouteHypothesisMonitor arrivalDate](self, "arrivalDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("ArrivalDateKey"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_traits, CFSTR("TraitsKey"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_hypothesis, CFSTR("HypothesisKey"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_liveETARoute, CFSTR("LiveETARouteKey"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_analyticsStore, CFSTR("AnalyticsStoreKey"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_lastMatchedLocation, CFSTR("LastMatchedLocationKey"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_originLocation, CFSTR("OriginLocationKey"));
  objc_msgSend(v7, "encodeBool:forKey:", self->_hasArrived, CFSTR("HasArrivedKey"));
  objc_msgSend(v7, "encodeBool:forKey:", self->_isTraveling, CFSTR("IsTravelingKey"));
  objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("TravelScoreKey"), self->_travelScore);
  objc_msgSend(v7, "encodeObject:forKey:", self->_rerouteEntries, CFSTR("RerouteEntriesKey"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_traceName, CFSTR("TraceNameKey"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_route, CFSTR("RouteKey"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_routeAttributes, CFSTR("RouteAttributes"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_clientInfo, CFSTR("ClientInfo"));

}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("{\n\tSource: %@\n"), self->_source);
  objc_msgSend(v3, "appendFormat:", CFSTR("\tDestination: %@\n"), self->_destination);
  objc_msgSend(v3, "appendFormat:", CFSTR("\tRoute attributes: %@\n"), self->_routeAttributes);
  -[GEORouteHypothesis description](self->_hypothesis, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tHypothesis: %@\n"), v4);

  v5 = (void *)MEMORY[0x18D765024](self->_handler);
  objc_msgSend(v3, "appendFormat:", CFSTR("\tHandler: %@\n"), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR("}\n"));
  return (NSString *)v3;
}

- (NSString)routeName
{
  void *route;

  route = self->_route;
  if (route)
  {
    objc_msgSend(route, "name");
    route = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)route;
}

- (int)transportType
{
  GEORouteAttributes *routeAttributes;

  routeAttributes = self->_routeAttributes;
  if (routeAttributes)
    return -[GEORouteAttributes mainTransportType](routeAttributes, "mainTransportType");
  else
    return self->_transportType;
}

- (BOOL)supportsLiveTraffic
{
  char v2;
  void *v3;

  if (-[GEORouteHypothesisMonitor transportType](self, "transportType"))
    return 0;
  +[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "currentCountrySupportsTraffic");

  return v2;
}

- (BOOL)supportsDirections
{
  void *v2;
  char v3;

  +[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "currentCountrySupportsDirections");

  return v3;
}

- (BOOL)_hasInitialRoute
{
  return self->_originLocation != 0;
}

- (void)updateLocation:(id)a3 allowServer:(BOOL)a4 hypothesisHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  id handler;
  NSObject *v12;
  NSObject *v13;
  GEORouteHypothesis *hypothesis;
  int v15;
  GEORouteHypothesis *v16;
  uint64_t v17;

  v6 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_msgSend(v9, "copy");
  handler = self->_handler;
  self->_handler = v10;

  if (-[GEORouteHypothesisMonitor supportsDirections](self, "supportsDirections"))
  {
    -[GEORouteHypothesisMonitor _updateLocation:allowServer:](self, "_updateLocation:allowServer:", v8, v6);
    if (v6)
    {
      if (self->_needReroute)
      {
        -[GEORouteHypothesisMonitor _requestNewRouteFromLocation:usualRouteData:](self, "_requestNewRouteFromLocation:usualRouteData:", v8, 0);
        goto LABEL_14;
      }
      if (-[GEORouteHypothesisMonitor supportsLiveTraffic](self, "supportsLiveTraffic")
        && -[GEORouteHypothesisMonitor _shouldUpdateETAForRouteMatch:](self, "_shouldUpdateETAForRouteMatch:", self->_routeMatch))
      {
        -[GEORouteHypothesisMonitor _fetchETAWithRouteMatch:](self, "_fetchETAWithRouteMatch:", self->_routeMatch);
        goto LABEL_14;
      }
    }
    GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      hypothesis = self->_hypothesis;
      v15 = 138477827;
      v16 = hypothesis;
      _os_log_impl(&dword_1885A9000, v13, OS_LOG_TYPE_INFO, "Hypothesis updated: %{private}@\n", (uint8_t *)&v15, 0xCu);
    }

    -[GEORouteHypothesizerAnalyticsStore didGenerateHypothesis](self->_analyticsStore, "didGenerateHypothesis");
    -[GEORouteHypothesisMonitor callHandlerIvar](self, "callHandlerIvar");
  }
  else
  {
    -[GEORouteHypothesis _clearHypothesisAndSetErrorWithCode:](self->_hypothesis, "_clearHypothesisAndSetErrorWithCode:", -6);
    -[GEORouteHypothesisMonitor callHandlerIvar](self, "callHandlerIvar");
    GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_ERROR, "Directions not supported. Returning.", (uint8_t *)&v15, 2u);
    }

  }
LABEL_14:

}

- (void)_updateLocation:(id)a3 allowServer:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  NSObject *v8;
  NSObject *v9;
  double v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t buf[16];
  uint8_t v14[16];

  v4 = a4;
  v7 = a3;
  objc_storeStrong((id *)&self->_lastLocation, a3);
  if (-[GEORouteHypothesisMonitor _hasInitialRoute](self, "_hasInitialRoute"))
  {
    -[GEORouteHypothesis setLastLocation:](self->_hypothesis, "setLastLocation:", v7);
    -[GEORouteHypothesisMonitor checkRouteForLocation:](self, "checkRouteForLocation:", v7);
    if (self->_needReroute)
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_INFO, "Updater does not have a route. Returning.", buf, 2u);
      }

    }
    else
    {
      -[GEORouteHypothesis _updateTravelStateHasArrived:isTraveling:travelScore:isNavigating:isNavigatingToDestination:](self->_hypothesis, "_updateTravelStateHasArrived:isTraveling:travelScore:isNavigating:isNavigatingToDestination:", self->_hasArrived, self->_isTraveling, -[GEORouteHypothesisMonitor _isNavigating](self, "_isNavigating"), -[GEORouteHypothesisMonitor _isNavigatingToDestination](self, "_isNavigatingToDestination"), self->_travelScore);
      -[NSDate timeIntervalSinceNow](self->_arrivalDate, "timeIntervalSinceNow");
      if (v10 < 0.0)
      {
        if (v10 <= -14400.0)
          -[GEORouteHypothesisMonitor recordETAUpdatesAfterEventStart](self, "recordETAUpdatesAfterEventStart");
        else
          -[GEORouteHypothesizerAnalyticsStore setEtaUpdatesAfterEventStart:](self->_analyticsStore, "setEtaUpdatesAfterEventStart:", -[GEORouteHypothesizerAnalyticsStore etaUpdatesAfterEventStart](self->_analyticsStore, "etaUpdatesAfterEventStart")+ 1);
      }
      if (self->_hasArrived)
      {
        GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v12 = 0;
          _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_DEFAULT, "Route hypothesizer arrived\n", v12, 2u);
        }

        -[GEORouteHypothesisMonitor recordETAUpdatesAfterEventStart](self, "recordETAUpdatesAfterEventStart");
      }
      -[GEORouteHypothesisMonitor _recalculateETAWithRouteMatch:](self, "_recalculateETAWithRouteMatch:", self->_routeMatch);
    }
  }
  else if (v4)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_INFO, "Don't have inital route. Kicking off route request and returning.", v14, 2u);
    }

    objc_storeStrong((id *)&self->_originLocation, a3);
    self->_needReroute = 1;
  }

}

- (BOOL)_shouldUpdateETAForRouteMatch:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  BOOL v7;
  double v8;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "route");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "distance");
    if (v6 == 0.0)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(v5, "distanceToEndFromRouteCoordinate:", objc_msgSend(v4, "routeCoordinate"));
      v7 = v8 > 0.0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_recalculateETAWithRouteMatch:(id)a3
{
  -[GEORouteHypothesisMonitor doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)_fetchETAWithRouteMatch:(id)a3
{
  -[GEORouteHypothesisMonitor _updateRouteMatchETAAndTravelState](self, "_updateRouteMatchETAAndTravelState", a3);
  -[GEORouteHypothesizerAnalyticsStore didGenerateHypothesis](self->_analyticsStore, "didGenerateHypothesis");
  -[GEORouteHypothesisMonitor callHandlerIvar](self, "callHandlerIvar");
}

- (void)recordETAUpdatesAfterEventStart
{
  void *v3;
  id v4;

  if (!-[GEORouteHypothesizerAnalyticsStore etaUpdatesWereReported](self->_analyticsStore, "etaUpdatesWereReported"))
  {
    -[GEORouteHypothesizerAnalyticsStore setEtaUpdatesWereReported:](self->_analyticsStore, "setEtaUpdatesWereReported:", 1);
    +[GEONavdAnalyticsManager sharedManager](GEONavdAnalyticsManager, "sharedManager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "analyticsReporter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "recordETAUpdatesAfterEventStart:", -[GEORouteHypothesizerAnalyticsStore etaUpdatesAfterEventStart](self->_analyticsStore, "etaUpdatesAfterEventStart"));

  }
}

- (void)clientDisplayedUINotification:(unint64_t)a3
{
  -[GEORouteHypothesizerAnalyticsStore didShowUI:](self->_analyticsStore, "didShowUI:", a3);
}

- (void)callHandlerIvar
{
  id handler;
  id v4;
  void (**v5)(id, GEORouteHypothesis *);

  handler = self->_handler;
  if (handler)
  {
    v5 = (void (**)(id, GEORouteHypothesis *))MEMORY[0x18D765024](handler, a2);
    v4 = self->_handler;
    self->_handler = 0;

    if (GEOConfigGetBOOL(GeoServicesConfig_TTLETADebugAlert, (uint64_t)off_1EDF4CED8))
      -[GEORouteHypothesisMonitor _showDebugAlert](self, "_showDebugAlert");
    if (v5)
      v5[2](v5, self->_hypothesis);

  }
}

- (void)_showDebugAlert
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
  void *v12;
  GEORouteHypothesis *hypothesis;
  void *v14;
  double v15;
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
  CFUserNotificationRef v26;
  SInt32 error;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimeZone:", v4);

  objc_msgSend(v3, "setDateFormat:", CFSTR("HH:mm"));
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = -[GEORouteHypothesisMonitor transportType](self, "transportType");
  if (v6 >= 7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_1E1C0F6F0[(int)v6];
  }
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ TTL"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB37A0];
  objc_msgSend(v3, "stringFromDate:", self->_arrivalDate);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("Event Date: %@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[GEORouteHypothesis error](self->_hypothesis, "error");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  hypothesis = self->_hypothesis;
  if (v12)
  {
    -[GEORouteHypothesis error](hypothesis, "error");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendFormat:", CFSTR("\nError: %@"), v14);
  }
  else
  {
    -[GEORouteHypothesis estimatedTravelTime](hypothesis, "estimatedTravelTime");
    _navd_debugDurationAsString(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendFormat:", CFSTR("\nETA: %@"), v16);

    -[GEOComposedRoute startDate](self->_route, "startDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringFromDate:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendFormat:", CFSTR("\n\nStart Date: %@"), v18);

    -[GEORouteHypothesis conservativeDepartureDate](self->_hypothesis, "conservativeDepartureDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringFromDate:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendFormat:", CFSTR("\nConservative Date: %@"), v20);

    if (-[GEORouteHypothesisMonitor transportType](self, "transportType") == 1)
    {
      -[GEOComposedRoute startDate](self->_route, "startDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "dateByAddingTimeInterval:", (double)-[GEOComposedRoute expectedTime](self->_route, "expectedTime"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "stringFromDate:", v14);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "appendFormat:", CFSTR("\nArrival Date: %@"), v22);
    }
    else
    {
      -[GEORouteHypothesis aggressiveDepartureDate](self->_hypothesis, "aggressiveDepartureDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringFromDate:", v14);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "appendFormat:", CFSTR("\nAggressive Date: %@"), v22);
    }

  }
  -[GEORouteHypothesis generationDate](self->_hypothesis, "generationDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendFormat:", CFSTR("\n\nGenerated at: %@"), v24);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKey:", v8, *MEMORY[0x1E0C9B800]);
  objc_msgSend(v25, "setObject:forKey:", v11, *MEMORY[0x1E0C9B810]);
  objc_msgSend(v25, "setObject:forKey:", CFSTR("OK"), *MEMORY[0x1E0C9B838]);
  error = 0;
  v26 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0.0, 0, &error, (CFDictionaryRef)v25);
  if (v26)
    CFRelease(v26);

}

- (void)_updateRouteMatchETAAndTravelState
{
  -[GEORouteHypothesisMonitor checkRouteForLocation:](self, "checkRouteForLocation:", self->_lastLocation);
  -[GEORouteHypothesis _updateTravelStateHasArrived:isTraveling:travelScore:isNavigating:isNavigatingToDestination:](self->_hypothesis, "_updateTravelStateHasArrived:isTraveling:travelScore:isNavigating:isNavigatingToDestination:", self->_hasArrived, self->_isTraveling, -[GEORouteHypothesisMonitor _isNavigating](self, "_isNavigating"), -[GEORouteHypothesisMonitor _isNavigatingToDestination](self, "_isNavigatingToDestination"), self->_travelScore);
  -[GEORouteHypothesisMonitor _recalculateETAWithRouteMatch:](self, "_recalculateETAWithRouteMatch:", self->_routeMatch);
}

- (void)etaUpdater:(id)a3 willSendETATrafficUpdateRequest:(id)a4
{
  objc_msgSend(a4, "setSessionState:", self->_sessionState);
}

- (void)etaUpdater:(id)a3 receivedETATrafficUpdateResponse:(id)a4 etaRoute:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  objc_msgSend(v7, "waypointRoute");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

LABEL_4:
    objc_storeStrong((id *)&self->_liveETARoute, a5);
    -[GEOComposedRoute mutableData](self->_route, "mutableData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateForRoute:etaRoute:", self->_route, self->_liveETARoute);

    -[GEORouteHypothesisMonitor _updateRouteMatchETAAndTravelState](self, "_updateRouteMatchETAAndTravelState");
    goto LABEL_5;
  }
  if (objc_msgSend(v7, "routesCount"))
    goto LABEL_4;
  GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = 138412290;
    v13 = v7;
    _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_ERROR, "Error getting route from ETAU response: %@", (uint8_t *)&v12, 0xCu);
  }

LABEL_5:
}

- (void)etaUpdater:(id)a3 receivedError:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_ERROR, "Error from etaUpdater: %@", (uint8_t *)&v7, 0xCu);
  }

  -[GEORouteHypothesis _setError:](self->_hypothesis, "_setError:", v5);
}

- (void)etaUpdaterUpdatedETA:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  GEORouteHypothesis *hypothesis;
  int v7;
  GEORouteHypothesis *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_DEBUG, "ETA refreshed", (uint8_t *)&v7, 2u);
  }

  -[GEORouteHypothesizerAnalyticsStore didGenerateHypothesis](self->_analyticsStore, "didGenerateHypothesis");
  GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    hypothesis = self->_hypothesis;
    v7 = 138477827;
    v8 = hypothesis;
    _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_INFO, "Hypothesis updated: %{private}@\n", (uint8_t *)&v7, 0xCu);
  }

}

- (void)_executeBlockAccessingCurrentRequest:(id)a3
{
  geo_isolate_sync();
}

- (void)_requestNewRouteFromLocation:(id)a3 usualRouteData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  GEODirectionsRequest *v9;
  GEODirectionsRequest *currentRequest;
  GEOComposedRoute *route;
  BOOL v12;
  void *v13;
  GEOComposedWaypoint *v14;
  GEODirectionsRequest *v15;
  void *v16;
  GEODirectionsRequest *v17;
  GEODirectionsRequest *v18;
  void *v19;
  GEOComposedRoute *v20;
  GEORouteMatch *routeMatch;
  GEOLocation *lastMatchedLocation;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  _QWORD v30[5];
  _QWORD v31[5];
  id v32;
  BOOL v33;

  v6 = a3;
  v7 = a4;
  if (self->_currentRequest)
  {
    +[GEODirectionsRequester sharedRequester](GEODirectionsRequester, "sharedRequester");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cancelRequest:", self->_currentRequest);

  }
  v9 = -[GEODirectionsRequest initWithFeedback:]([GEODirectionsRequest alloc], "initWithFeedback:", self->_feedback);
  currentRequest = self->_currentRequest;
  self->_currentRequest = v9;

  -[GEODirectionsRequest setRouteAttributes:](self->_currentRequest, "setRouteAttributes:", self->_routeAttributes);
  -[GEODirectionsRequest setCommonOptions:](self->_currentRequest, "setCommonOptions:", self->_commonOptions);
  -[GEODirectionsRequest setMainTransportTypeMaxRouteCount:](self->_currentRequest, "setMainTransportTypeMaxRouteCount:", 1);
  -[GEODirectionsRequest setCurrentUserLocation:](self->_currentRequest, "setCurrentUserLocation:", v6);
  route = self->_route;
  v12 = route != 0;
  if (v7 && !route)
  {
    -[GEODirectionsRequest setGetRouteForZilchPoints:](self->_currentRequest, "setGetRouteForZilchPoints:", 1);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEODirectionsRequest setOriginalRouteZilchPoints:](self->_currentRequest, "setOriginalRouteZilchPoints:", v13);

LABEL_8:
    v17 = self->_currentRequest;
    -[GEOComposedWaypoint geoWaypointTyped](self->_source, "geoWaypointTyped");
    v14 = (GEOComposedWaypoint *)objc_claimAutoreleasedReturnValue();
    -[GEODirectionsRequest addWaypointTyped:](v17, "addWaypointTyped:", v14);
    goto LABEL_9;
  }
  if (!route)
    goto LABEL_8;
  v14 = -[GEOComposedWaypoint initWithLocation:isCurrentLocation:]([GEOComposedWaypoint alloc], "initWithLocation:isCurrentLocation:", v6, 1);
  v15 = self->_currentRequest;
  -[GEOComposedWaypoint geoWaypointTyped](v14, "geoWaypointTyped");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEODirectionsRequest addWaypointTyped:](v15, "addWaypointTyped:", v16);

LABEL_9:
  v18 = self->_currentRequest;
  -[GEOComposedWaypoint geoWaypointTyped](self->_destination, "geoWaypointTyped");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEODirectionsRequest addWaypointTyped:](v18, "addWaypointTyped:", v19);

  v20 = self->_route;
  self->_route = 0;

  routeMatch = self->_routeMatch;
  self->_routeMatch = 0;

  lastMatchedLocation = self->_lastMatchedLocation;
  self->_lastMatchedLocation = 0;

  v23 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __73__GEORouteHypothesisMonitor__requestNewRouteFromLocation_usualRouteData___block_invoke;
  v31[3] = &unk_1E1C0F668;
  v31[4] = self;
  v24 = v6;
  v32 = v24;
  v33 = v12;
  v30[0] = v23;
  v30[1] = 3221225472;
  v30[2] = __73__GEORouteHypothesisMonitor__requestNewRouteFromLocation_usualRouteData___block_invoke_3;
  v30[3] = &unk_1E1C0F690;
  v30[4] = self;
  v27[0] = v23;
  v27[1] = 3221225472;
  v27[2] = __73__GEORouteHypothesisMonitor__requestNewRouteFromLocation_usualRouteData___block_invoke_5;
  v27[3] = &unk_1E1C0F6B8;
  v27[4] = self;
  v28 = (id)MEMORY[0x18D765024](v31);
  v29 = (id)MEMORY[0x18D765024](v30);
  v25 = v29;
  v26 = v28;
  -[GEORouteHypothesisMonitor _executeBlockAccessingCurrentRequest:](self, "_executeBlockAccessingCurrentRequest:", v27);

}

uint64_t __73__GEORouteHypothesisMonitor__requestNewRouteFromLocation_usualRouteData___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  _QWORD v5[5];

  objc_msgSend(*(id *)(a1 + 32), "_receivedRouteResponse:forLocation:isReroute:", a2, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
  v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __73__GEORouteHypothesisMonitor__requestNewRouteFromLocation_usualRouteData___block_invoke_2;
  v5[3] = &unk_1E1C00178;
  v5[4] = v3;
  return objc_msgSend(v3, "_executeBlockAccessingCurrentRequest:", v5);
}

void __73__GEORouteHypothesisMonitor__requestNewRouteFromLocation_usualRouteData___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 160);
  *(_QWORD *)(v1 + 160) = 0;

}

uint64_t __73__GEORouteHypothesisMonitor__requestNewRouteFromLocation_usualRouteData___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  _QWORD v5[5];

  objc_msgSend(*(id *)(a1 + 32), "_routeRequestFailed:", a2);
  v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __73__GEORouteHypothesisMonitor__requestNewRouteFromLocation_usualRouteData___block_invoke_4;
  v5[3] = &unk_1E1C00178;
  v5[4] = v3;
  return objc_msgSend(v3, "_executeBlockAccessingCurrentRequest:", v5);
}

void __73__GEORouteHypothesisMonitor__requestNewRouteFromLocation_usualRouteData___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 160);
  *(_QWORD *)(v1 + 160) = 0;

}

void __73__GEORouteHypothesisMonitor__requestNewRouteFromLocation_usualRouteData___block_invoke_5(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (*(_QWORD *)(a1[4] + 160))
  {
    +[GEONavdPowerLogManager _powerLogWithEventName:](GEONavdPowerLogManager, "_powerLogWithEventName:", CFSTR("RequestingDirections"));
    +[GEODirectionsRequester sharedRequester](GEODirectionsRequester, "sharedRequester");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v2 = *(_QWORD *)(a1[4] + 160);
    +[GEOMapService sharedService](GEOMapService, "sharedService");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "defaultTraits");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1[4] + 136), "auditToken");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startRequest:traits:auditToken:callbackQueue:finished:networkActivity:error:", v2, v4, v5, MEMORY[0x1E0C80D38], a1[5], 0, a1[6]);

  }
}

- (void)_receivedRouteResponse:(id)a3 forLocation:(id)a4 isReroute:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  NSData *v10;
  NSData *sessionState;
  GEORouteInitializerData *v12;
  GEOComposedWaypoint *destination;
  void *v14;
  GEORouteInitializerData *v15;
  void *v16;
  BOOL v17;
  GEOComposedRoute *v18;
  void *v19;
  void *v20;
  GEOComposedRoute *v21;
  GEOComposedRoute *v22;
  GEOComposedRoute *route;
  double v24;
  double v25;
  double v26;
  double v27;
  GEORerouteInfo *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  __CFString *v33;
  const __CFString *v34;
  GEORouteHypothesis *hypothesis;
  unsigned int v36;
  double v37;
  GEORouteHypothesis *v38;
  unsigned int v39;
  double v40;
  GEORouteHypothesis *v41;
  void *v42;
  GEORouteHypothesis *v43;
  NSDate *arrivalDate;
  unsigned int v45;
  double v46;
  double v47;
  double v48;
  NSObject *v49;
  id v50;
  double v51;
  id v52;
  void *v53;
  int v54;
  id v55;
  __int16 v56;
  id v57;
  __int16 v58;
  void *v59;
  _QWORD v60[3];

  v5 = a5;
  v60[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "sessionState");
  v10 = (NSData *)objc_claimAutoreleasedReturnValue();
  sessionState = self->_sessionState;
  self->_sessionState = v10;

  v12 = [GEORouteInitializerData alloc];
  destination = self->_destination;
  v60[0] = self->_source;
  v60[1] = destination;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[GEORouteInitializerData initWithWaypoints:routeAttributes:directionsResponse:](v12, "initWithWaypoints:routeAttributes:directionsResponse:", v14, self->_routeAttributes, v8);

  objc_msgSend(v8, "waypointRoutes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count") == 0;

  if (v17)
  {
    if (!objc_msgSend(v8, "suggestedRoutesCount"))
      goto LABEL_6;
    v22 = [GEOComposedRoute alloc];
    objc_msgSend(v8, "suggestedRoutes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[GEOComposedRoute initWithSuggestedRoute:initializerData:](v22, "initWithSuggestedRoute:initializerData:", v20, v15);
  }
  else
  {
    v18 = [GEOComposedRoute alloc];
    objc_msgSend(v8, "waypointRoutes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[GEOComposedRoute initWithGeoWaypointRoute:initializerData:](v18, "initWithGeoWaypointRoute:initializerData:", v20, v15);
  }
  route = self->_route;
  self->_route = v21;

LABEL_6:
  if (v5)
  {
    objc_msgSend(v9, "coordinate");
    v25 = v24;
    v27 = v26;
    v28 = objc_alloc_init(GEORerouteInfo);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEORerouteInfo setTime:](v28, "setTime:", v29);

    -[GEOComposedWaypoint latLng](self->_destination, "latLng");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "coordinate");
    -[GEORerouteInfo setDistanceFromDestination:](v28, "setDistanceFromDestination:", (double)GEOCalculateDistanceRadius(v25, v27, v31, v32, 6367000.0));

    -[NSMutableArray addObject:](self->_rerouteEntries, "addObject:", v28);
  }
  if (self->_route)
    -[GEORouteHypothesisMonitor _updateScoreForLocation:](self, "_updateScoreForLocation:", v9);
  self->_needReroute = 0;
  if (v5)
    -[GEORouteHypothesizerAnalyticsStore didReroute](self->_analyticsStore, "didReroute");
  -[GEORouteHypothesisMonitor routeName](self, "routeName");
  v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v33)
    v34 = v33;
  else
    v34 = &stru_1E1C241D0;
  -[GEORouteHypothesis setRouteName:](self->_hypothesis, "setRouteName:", v34);
  hypothesis = self->_hypothesis;
  v36 = -[GEOComposedRoute expectedTime](self->_route, "expectedTime");
  -[GEOComposedRoute freeflowTravelTime](self->_route, "freeflowTravelTime");
  -[GEORouteHypothesis _updateCurrentTrafficDensity:staticTravelTime:](hypothesis, "_updateCurrentTrafficDensity:staticTravelTime:", (double)v36, v37);
  v38 = self->_hypothesis;
  v39 = -[GEOComposedRoute historicTravelTime](self->_route, "historicTravelTime");
  -[GEOComposedRoute freeflowTravelTime](self->_route, "freeflowTravelTime");
  -[GEORouteHypothesis _updateHistoricTrafficDensity:staticTravelTime:](v38, "_updateHistoricTrafficDensity:staticTravelTime:", (double)v39, v40);
  v41 = self->_hypothesis;
  -[GEOComposedRoute trafficDescription](self->_route, "trafficDescription");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORouteHypothesis _updateTrafficDensityDescription:](v41, "_updateTrafficDensityDescription:", v42);

  arrivalDate = self->_arrivalDate;
  v43 = self->_hypothesis;
  v45 = -[GEOComposedRoute expectedTime](self->_route, "expectedTime");
  -[GEOComposedRoute travelTimeConservativeEstimate](self->_route, "travelTimeConservativeEstimate");
  v47 = v46;
  -[GEOComposedRoute travelTimeAggressiveEstimate](self->_route, "travelTimeAggressiveEstimate");
  -[GEORouteHypothesis _updateDepartureAndArrivalSuggestionsForArrivalDate:travelTimeWithTraffic:conservativeTravelTime:aggressiveTravelTime:transportType:](v43, "_updateDepartureAndArrivalSuggestionsForArrivalDate:travelTimeWithTraffic:conservativeTravelTime:aggressiveTravelTime:transportType:", arrivalDate, -[GEOComposedRoute transportType](self->_route, "transportType"), (double)v45, v47, v48);
  -[GEORouteHypothesis _setError:](self->_hypothesis, "_setError:", 0);
  GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
  v49 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    _navd_debugDurationAsString((double)-[GEOComposedRoute expectedTime](self->_route, "expectedTime"));
    v50 = (id)objc_claimAutoreleasedReturnValue();
    -[GEOComposedRoute freeflowTravelTime](self->_route, "freeflowTravelTime");
    _navd_debugDurationAsString(v51);
    v52 = (id)objc_claimAutoreleasedReturnValue();
    _navd_debugDurationAsString((double)-[GEOComposedRoute historicTravelTime](self->_route, "historicTravelTime"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 138412802;
    v55 = v50;
    v56 = 2112;
    v57 = v52;
    v58 = 2112;
    v59 = v53;
    _os_log_impl(&dword_1885A9000, v49, OS_LOG_TYPE_DEFAULT, "Received route for hypothesis. Travel duration: %@ | Static: %@ | Historic: %@", (uint8_t *)&v54, 0x20u);

  }
  -[GEORouteHypothesisMonitor _updateRouteMatchETAAndTravelState](self, "_updateRouteMatchETAAndTravelState");
  -[GEORouteHypothesisMonitor callHandlerIvar](self, "callHandlerIvar");

}

- (void)_routeRequestFailed:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_ERROR, "Error from route request: %@", (uint8_t *)&v6, 0xCu);
  }

  self->_needReroute = 0;
  -[GEORouteHypothesis _setError:](self->_hypothesis, "_setError:", v4);
  -[GEORouteHypothesisMonitor callHandlerIvar](self, "callHandlerIvar");

}

- (id)navDestination
{
  Class v2;
  Class v3;
  SEL v4;
  SEL v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v14[2];

  v2 = NSClassFromString(CFSTR("MNNavigationStateManager"));
  if (!v2)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v14[0]) = 0;
      _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_ERROR, "Could not find load nav state manager", (uint8_t *)v14, 2u);
    }
    goto LABEL_9;
  }
  v3 = v2;
  v4 = NSSelectorFromString(CFSTR("sharedManager"));
  v5 = NSSelectorFromString(CFSTR("navSessionDestination"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = (void *)MEMORY[0x1E0C99DB8];
    -[objc_class methodSignatureForSelector:](v3, "methodSignatureForSelector:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invocationWithMethodSignature:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setSelector:", v4);
    objc_msgSend(v8, "setTarget:", v3);
    objc_msgSend(v8, "invoke");
    v14[0] = 0;
    objc_msgSend(v8, "getReturnValue:", v14);
    v9 = v14[0];

  }
  else
  {
    v9 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_9:
    v12 = 0;
    goto LABEL_10;
  }
  -[objc_class instanceMethodSignatureForSelector:](v3, "instanceMethodSignatureForSelector:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSelector:", v5);
  objc_msgSend(v11, "setTarget:", v9);
  objc_msgSend(v11, "invoke");
  v14[0] = 0;
  objc_msgSend(v11, "getReturnValue:", v14);
  v12 = v14[0];

LABEL_10:
  return v12;
}

- (BOOL)_isNavigating
{
  void *v2;
  BOOL v3;

  -[GEORouteHypothesisMonitor navDestination](self, "navDestination");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)_isNavigatingToDestination
{
  _BOOL4 v3;
  GEOComposedWaypoint *destination;
  void *v5;
  NSObject *v6;
  uint8_t v8[16];

  v3 = -[GEORouteHypothesisMonitor _isNavigating](self, "_isNavigating");
  if (v3)
  {
    destination = self->_destination;
    -[GEORouteHypothesisMonitor navDestination](self, "navDestination");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(destination) = -[GEOComposedWaypoint isSameAs:](destination, "isSameAs:", v5);

    if ((_DWORD)destination)
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_INFO, "User is navigating to the same destination as event", v8, 2u);
      }

      LOBYTE(v3) = 1;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (void)_updateScoreForLocation:(id)a3
{
  void *v4;
  unint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  id v11;

  v11 = a3;
  self->_travelScore = 1.0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  v6 = 0;
  while (v5 < -[NSMutableArray count](self->_rerouteEntries, "count"))
  {
    -[NSMutableArray objectAtIndex:](self->_rerouteEntries, "objectAtIndex:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NSMutableArray count](self->_rerouteEntries, "count");
    -[GEOComposedWaypoint latLng](self->_destination, "latLng");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "coordinate");
    objc_msgSend(v7, "updateWithCurrentTime:location:isMostRecentReroute:destinationCoordinate:numThrottledReroutes:", v4, v11, v5 == v8 - 1, 0);

    objc_msgSend(v7, "penalty");
    if (v10 <= -2.22044605e-16 || v10 >= 2.22044605e-16)
    {
      self->_travelScore = self->_travelScore - v10;
    }
    else
    {
      if (!v6)
        v6 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      objc_msgSend(v6, "addIndex:", v5);
    }

    ++v5;
  }
  if (v6)
    -[NSMutableArray removeObjectsAtIndexes:](self->_rerouteEntries, "removeObjectsAtIndexes:", v6);

}

- (void)cancelCurrentRequest
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __49__GEORouteHypothesisMonitor_cancelCurrentRequest__block_invoke;
  v2[3] = &unk_1E1C00178;
  v2[4] = self;
  -[GEORouteHypothesisMonitor _executeBlockAccessingCurrentRequest:](self, "_executeBlockAccessingCurrentRequest:", v2);
}

void __49__GEORouteHypothesisMonitor_cancelCurrentRequest__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 160))
  {
    +[GEODirectionsRequester sharedRequester](GEODirectionsRequester, "sharedRequester");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cancelRequest:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160));

    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 160);
    *(_QWORD *)(v3 + 160) = 0;

  }
}

- (void)checkRouteForLocation:(id)a3
{
  -[GEORouteHypothesisMonitor doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)travelStateChanged
{
  GEORouteHypothesizerAnalyticsStore *analyticsStore;
  id v3;

  if (self->_isTraveling)
  {
    if (self->_hypothesis)
    {
      analyticsStore = self->_analyticsStore;
      -[GEORouteHypothesis conservativeDepartureDate](self->_hypothesis, "conservativeDepartureDate");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      -[GEORouteHypothesizerAnalyticsStore didStartMovingWithExpectedDepartureTime:](analyticsStore, "didStartMovingWithExpectedDepartureTime:");

    }
  }
  else
  {
    -[GEORouteHypothesizerAnalyticsStore didStopMoving](self->_analyticsStore, "didStopMoving");
  }
}

- (id)routeMatchForLocation:(id)a3
{
  id v4;
  GEORouteMatcher *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  long double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;

  v4 = a3;
  v5 = -[GEORouteMatcher initWithRoute:auditToken:]([GEORouteMatcher alloc], "initWithRoute:auditToken:", self->_route, 0);
  -[GEORouteMatcher matchToRouteWithLocation:](v5, "matchToRouteWithLocation:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    goto LABEL_9;
  objc_msgSend(v6, "modifiedHorizontalAccuracy");
  if (v8 >= 0.0)
  {
    objc_msgSend(v7, "distanceFromRoute");
    v10 = v9;
    objc_msgSend(v7, "modifiedHorizontalAccuracy");
    if (v10 - v11 > 100.0)
    {
      objc_msgSend(v7, "setIsGoodMatch:", 0);
      goto LABEL_11;
    }
  }
  objc_msgSend(v7, "modifiedCourseAccuracy");
  if (v12 < 0.0)
    goto LABEL_5;
  objc_msgSend(v4, "course");
  v14 = v13;
  objc_msgSend(v7, "matchedCourse");
  v16 = fmod(v15 - v14 + 180.0, 360.0);
  v17 = fmod(v16 + 360.0, 360.0);
  objc_msgSend(v7, "modifiedCourseAccuracy");
  v19 = v18;
  objc_msgSend(v4, "speed");
  if (v20 <= 9.0 || fabs(v17 + -180.0) - v19 <= 100.0)
  {
LABEL_5:
    objc_msgSend(v7, "setIsGoodMatch:", 1);
LABEL_11:
    v21 = v7;
    goto LABEL_12;
  }
  objc_msgSend(v7, "setIsGoodMatch:", 0);
LABEL_9:
  v21 = 0;
LABEL_12:

  return v21;
}

- (GEODirectionsRequestFeedback)feedback
{
  return self->_feedback;
}

- (void)setFeedback:(id)a3
{
  objc_storeStrong((id *)&self->_feedback, a3);
}

- (GEOComposedWaypoint)source
{
  return self->_source;
}

- (GEOComposedWaypoint)destination
{
  return self->_destination;
}

- (NSDate)arrivalDate
{
  return self->_arrivalDate;
}

- (GEORouteHypothesis)hypothesis
{
  return self->_hypothesis;
}

- (GEORouteAttributes)routeAttributes
{
  return self->_routeAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionState, 0);
  objc_storeStrong((id *)&self->_traceName, 0);
  objc_storeStrong((id *)&self->_arrivalMapRegion, 0);
  objc_storeStrong((id *)&self->_lastMatchedLocation, 0);
  objc_storeStrong((id *)&self->_routeMatch, 0);
  objc_storeStrong((id *)&self->_rerouteEntries, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_requestIsolater, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_analyticsStore, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_commonOptions, 0);
  objc_storeStrong((id *)&self->_routeAttributes, 0);
  objc_storeStrong((id *)&self->_liveETARoute, 0);
  objc_storeStrong((id *)&self->_liveETAUpdater, 0);
  objc_storeStrong((id *)&self->_etaUpdaterDispatchGroup, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);
  objc_storeStrong((id *)&self->_hypothesis, 0);
  objc_storeStrong((id *)&self->_arrivalDate, 0);
  objc_storeStrong((id *)&self->_originLocation, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_feedback, 0);
  objc_storeStrong(&self->_handler, 0);
}

@end
