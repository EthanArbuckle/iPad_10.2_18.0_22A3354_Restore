@implementation MapsSuggestionsRoutine

- (MapsSuggestionsRoutine)initWithRoutineConnector:(id)a3 networkRequester:(id)a4
{
  id v7;
  id v8;
  void *v9;
  MapsSuggestionsRoutine *v10;
  MapsSuggestionsRoutine *v11;
  void *v12;
  OS_dispatch_queue *v13;
  OS_dispatch_queue *innerQueue;
  NSString *v15;
  NSString *name;
  MapsSuggestionsObservers *v17;
  OS_dispatch_queue *v18;
  uint64_t v19;
  MapsSuggestionsObservers *parkedCarObservers;
  uint64_t v21;
  NSMutableDictionary *loiLocationsForHome;
  uint64_t v23;
  NSMutableDictionary *loiLocationsForWork;
  uint64_t v25;
  NSMutableDictionary *loiLocationsForSchool;
  uint64_t v27;
  NSMutableDictionary *loiVisits;
  double v29;
  uint64_t Integer;
  MapsSuggestionsLimitedDictionary *v31;
  MapsSuggestionsLimitedDictionary *mapItemCache;
  MapsSuggestionsLimitedDictionary *v33;
  MapsSuggestionsLimitedDictionary *mapItemCacheOrigin;
  MapsSuggestionsRoutine *v35;
  NSObject *v36;
  objc_super v38;
  _BYTE buf[18];
  __int16 v40;
  const char *v41;
  __int16 v42;
  const char *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    GEOFindOrCreateLog();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 212;
      v40 = 2082;
      v41 = "-[MapsSuggestionsRoutine initWithRoutineConnector:networkRequester:]";
      v42 = 2082;
      v43 = "nil == (routineConnector)";
      _os_log_impl(&dword_1A427D000, v36, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a RoutineInterface", buf, 0x26u);
    }
    goto LABEL_11;
  }
  if (!v8)
  {
    GEOFindOrCreateLog();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 213;
      v40 = 2082;
      v41 = "-[MapsSuggestionsRoutine initWithRoutineConnector:networkRequester:]";
      v42 = 2082;
      v43 = "nil == (networkRequester)";
      _os_log_impl(&dword_1A427D000, v36, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a NetworkRequester", buf, 0x26u);
    }
LABEL_11:

    v35 = 0;
    goto LABEL_12;
  }
  v38.receiver = self;
  v38.super_class = (Class)MapsSuggestionsRoutine;
  v10 = -[MapsSuggestionsRoutine init](&v38, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_connector, a3);
    objc_storeStrong((id *)&v11->_networkRequester, a4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    MSg::Queue::Queue((dispatch_queue_t *)buf, CFSTR("MapsSuggestionsRoutineQueue"), v12);
    v13 = *(OS_dispatch_queue **)buf;
    *(_QWORD *)buf = 0;
    innerQueue = v11->_queue._innerQueue;
    v11->_queue._innerQueue = v13;

    v15 = *(NSString **)&buf[8];
    *(_QWORD *)&buf[8] = 0;
    name = v11->_queue._name;
    v11->_queue._name = v15;

    v17 = [MapsSuggestionsObservers alloc];
    v18 = v11->_queue._innerQueue;
    v19 = -[MapsSuggestionsObservers initWithCallbackQueue:name:](v17, "initWithCallbackQueue:name:", v18, CFSTR("MapsSuggestionsParkedCarObservers"));
    parkedCarObservers = v11->_parkedCarObservers;
    v11->_parkedCarObservers = (MapsSuggestionsObservers *)v19;

    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    loiLocationsForHome = v11->_loiLocationsForHome;
    v11->_loiLocationsForHome = (NSMutableDictionary *)v21;

    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    loiLocationsForWork = v11->_loiLocationsForWork;
    v11->_loiLocationsForWork = (NSMutableDictionary *)v23;

    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
    loiLocationsForSchool = v11->_loiLocationsForSchool;
    v11->_loiLocationsForSchool = (NSMutableDictionary *)v25;

    v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
    loiVisits = v11->_loiVisits;
    v11->_loiVisits = (NSMutableDictionary *)v27;

    GEOConfigGetDouble();
    v11->_requeryInterval = v29;
    Integer = GEOConfigGetInteger();
    v31 = -[MapsSuggestionsLimitedDictionary initWithMaximumCapacity:]([MapsSuggestionsLimitedDictionary alloc], "initWithMaximumCapacity:", Integer);
    mapItemCache = v11->_mapItemCache;
    v11->_mapItemCache = v31;

    v33 = -[MapsSuggestionsLimitedDictionary initWithMaximumCapacity:]([MapsSuggestionsLimitedDictionary alloc], "initWithMaximumCapacity:", Integer);
    mapItemCacheOrigin = v11->_mapItemCacheOrigin;
    v11->_mapItemCacheOrigin = v33;

    v11->_areFrequentLocationsAvailable = GEOConfigGetBOOL();
  }
  self = v11;
  v35 = self;
LABEL_12:

  return v35;
}

- (id)initFromResourceDepot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  MapsSuggestionsRoutine *v10;
  NSObject *v11;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = 136446978;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      v15 = 1024;
      v16 = 244;
      v17 = 2082;
      v18 = "-[MapsSuggestionsRoutine initFromResourceDepot:]";
      v19 = 2082;
      v20 = "nil == (resourceDepot)";
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to build from!", (uint8_t *)&v13, 0x26u);
    }
    goto LABEL_13;
  }
  objc_msgSend(v4, "oneRoutineConnector");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = 136446978;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      v15 = 1024;
      v16 = 245;
      v17 = 2082;
      v18 = "-[MapsSuggestionsRoutine initFromResourceDepot:]";
      v19 = 2082;
      v20 = "nil == (resourceDepot.oneRoutineConnector)";
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires One RoutineConnector!", (uint8_t *)&v13, 0x26u);
    }
    goto LABEL_13;
  }
  objc_msgSend(v5, "oneNetworkRequester");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = 136446978;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      v15 = 1024;
      v16 = 246;
      v17 = 2082;
      v18 = "-[MapsSuggestionsRoutine initFromResourceDepot:]";
      v19 = 2082;
      v20 = "nil == (resourceDepot.oneNetworkRequester)";
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires One Network!", (uint8_t *)&v13, 0x26u);
    }
LABEL_13:

    v10 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v5, "oneRoutineConnector");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "oneNetworkRequester");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[MapsSuggestionsRoutine initWithRoutineConnector:networkRequester:](self, "initWithRoutineConnector:networkRequester:", v8, v9);

  v10 = self;
LABEL_14:

  return v10;
}

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "description");
}

- (BOOL)canProduceEntriesOfType:(int64_t)a3
{
  NSObject *v3;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)a3 > 0x18)
  {
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = 136446978;
      v6 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      v7 = 1024;
      v8 = 396;
      v9 = 2082;
      v10 = "-[MapsSuggestionsRoutine canProduceEntriesOfType:]";
      v11 = 2082;
      v12 = "YES";
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Detected an unsupported MapsSuggestionsEntryType!", (uint8_t *)&v5, 0x26u);
    }

    goto LABEL_3;
  }
  if (((1 << a3) & 0x1F7FF68) != 0)
  {
LABEL_3:
    LOBYTE(self) = 0;
    return (char)self;
  }
  if (((1 << a3) & 0x80096) != 0)
  {
    if (self)
      LOBYTE(self) = MapsSuggestionsIsLocationAllowedForBundleID((void *)*MEMORY[0x1E0D26D08]);
  }
  else
  {
    if (qword_1ED22F068 != -1)
      dispatch_once(&qword_1ED22F068, &__block_literal_global_421);
    LOBYTE(self) = _MergedGlobals_43 != 0;
  }
  return (char)self;
}

- (uint64_t)_addParkedCarFieldsToSuggestionsEntry:(void *)a1 vehicleEvent:(void *)a2
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  NSObject *v17;
  int v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (!v3)
  {
    GEOFindOrCreateLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v19 = 136446978;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      v21 = 1024;
      v22 = 439;
      v23 = 2082;
      v24 = "-[MapsSuggestionsRoutine _addParkedCarFieldsToSuggestionsEntry:vehicleEvent:]";
      v25 = 2082;
      v26 = "nil == (entry)";
      _os_log_impl(&dword_1A427D000, v17, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires suggestion entry", (uint8_t *)&v19, 0x26u);
    }
    goto LABEL_15;
  }
  if (objc_msgSend(v3, "type") != 7)
  {
    GEOFindOrCreateLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v19 = 136446978;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      v21 = 1024;
      v22 = 440;
      v23 = 2082;
      v24 = "-[MapsSuggestionsRoutine _addParkedCarFieldsToSuggestionsEntry:vehicleEvent:]";
      v25 = 2082;
      v26 = "MapsSuggestionsEntryTypeParkedCar != entry.type";
      _os_log_impl(&dword_1A427D000, v17, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Suggestion entry needs to be ParkedCar", (uint8_t *)&v19, 0x26u);
    }
LABEL_15:

    v16 = 0;
    goto LABEL_16;
  }
  v5 = (void *)MEMORY[0x1E0C99D68];
  GEOConfigGetDouble();
  objc_msgSend(v5, "dateWithTimeIntervalSinceNow:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setExpires:", v6);

  GEOConfigGetDouble();
  objc_msgSend(v3, "setWeight:");
  if (v4)
  {
    objc_msgSend(v3, "setBoolean:forKey:", 1, CFSTR("MapsSuggestionsRoutineIsBackedByVehicleEventKey"));
    objc_msgSend(v4, "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDate:forKey:", v7, CFSTR("MapsSuggestionsWhenItHappenedKey"));

    objc_msgSend(v4, "nearbyLocationOfInterest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "nearbyLocationOfInterest");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v10, "type"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setNumber:forKey:", v11, CFSTR("MapsSuggestionsCoreRoutineTypeSource"));

      objc_msgSend(v4, "nearbyLocationOfInterest");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "customLabel");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      if (v13)
        v15 = (const __CFString *)v13;
      else
        v15 = &stru_1E4BDFC28;
      objc_msgSend(v3, "setString:forKey:", v15, CFSTR("MapsSuggestionsCoreRoutineCustomLabel"));

    }
  }
  v16 = 1;
LABEL_16:

  return v16;
}

- (MapsSuggestionsEntry)_suggestionEntryForPLOI:(_QWORD *)a1
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  unint64_t v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  const char *v20;
  id v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  const char *v28;
  id v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  const char *v36;
  id v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  const char *v44;
  char v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  BOOL v53;
  NSObject *v54;
  _QWORD *v55;
  id v56;
  void *v57;
  dispatch_semaphore_t v58;
  void *v59;
  uint64_t v60;
  NSObject *v61;
  void *v62;
  double v63;
  dispatch_time_t v64;
  MapsSuggestionsEntry *v65;
  id v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  MapsSuggestionsEntry *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  const __CFString *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  double v99;
  double v100;
  NSObject *v101;
  double v102;
  double v103;
  NSObject *v104;
  double v105;
  double v106;
  MapsSuggestionsEntry *v107;
  void *v108;
  void *v109;
  uint64_t v110;
  void *v111;
  void *v112;
  NSObject *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  id v117;
  NSObject *v118;
  const char *v119;
  void *v121;
  char v122;
  uint64_t v123;
  void *v124;
  _QWORD *v125;
  id v126;
  void *v127;
  id v128;
  void *v129;
  id v130;
  void *v131;
  MapsSuggestionsEntry *log;
  id obj;
  _QWORD v134[4];
  NSObject *v135;
  _QWORD v136[4];
  NSObject *v137;
  __int128 *v138;
  _BYTE *v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  uint8_t v144[16];
  __int128 v145;
  __int128 v146;
  __int128 v147;
  uint8_t v148[48];
  __int128 v149;
  _BYTE buf[40];
  id v151;
  uint64_t v152;

  v152 = *MEMORY[0x1E0C80C00];
  v130 = a2;
  objc_msgSend(v130, "locationOfInterest");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "sources");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = a1;
  objc_msgSend(v131, "mapItem");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v131, "type");
  v128 = v124;
  GEOFindOrCreateLog();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = objc_msgSend(v128, "count");
    _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "Treating Routine entry of %u types", buf, 8u);
  }
  v123 = v3;

  v149 = 0u;
  memset(v148, 0, sizeof(v148));
  obj = v128;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", v148, v144, 16);
  if (v5)
  {
    v6 = **(_QWORD **)&v148[16];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (**(_QWORD **)&v148[16] != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*(_QWORD *)&v148[8] + 8 * i);
        GEOFindOrCreateLog();
        v9 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          v10 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v10;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v8;
          v11 = v10;
          _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_DEBUG, " . %@: %@", buf, 0x16u);

        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", v148, v144, 16);
    }
    while (v5);
  }

  if (v123)
  {
    if (v123 != 1)
    {
      if (v123 == 2)
      {
        if (MapsSuggestionsSawHomeOrWorkOnThisDevice::s_onceToken != -1)
          dispatch_once(&MapsSuggestionsSawHomeOrWorkOnThisDevice::s_onceToken, &__block_literal_global_25);
        v12 = 19;
        goto LABEL_112;
      }
      v13 = obj;
      v14 = (void *)objc_opt_class();
      if (v13)
      {
        if (v14)
        {
          if ((objc_msgSend(v14, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
          {
            v142 = 0u;
            v143 = 0u;
            v140 = 0u;
            v141 = 0u;
            v15 = v13;
            v16 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v140, buf, 16);
            if (v16)
            {
              v17 = *(_QWORD *)v141;
LABEL_29:
              v18 = 0;
              while (1)
              {
                if (*(_QWORD *)v141 != v17)
                  objc_enumerationMutation(v15);
                v19 = *(id *)(*((_QWORD *)&v140 + 1) + 8 * v18);
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  break;

                if (v16 == ++v18)
                {
                  v16 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v140, buf, 16);
                  if (v16)
                    goto LABEL_29;
                  goto LABEL_43;
                }
              }
LABEL_44:

              if (!v19)
                goto LABEL_67;
              v21 = v13;
              v22 = (void *)objc_opt_class();
              if (v13)
              {
                if (v22)
                {
                  if ((objc_msgSend(v22, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
                  {
                    v142 = 0u;
                    v143 = 0u;
                    v140 = 0u;
                    v141 = 0u;
                    v23 = v21;
                    v24 = -[NSObject countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v140, buf, 16);
                    if (v24)
                    {
                      v25 = *(_QWORD *)v141;
LABEL_50:
                      v26 = 0;
                      while (1)
                      {
                        if (*(_QWORD *)v141 != v25)
                          objc_enumerationMutation(v23);
                        v27 = *(id *)(*((_QWORD *)&v140 + 1) + 8 * v26);
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                          break;

                        if (v24 == ++v26)
                        {
                          v24 = -[NSObject countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v140, buf, 16);
                          if (v24)
                            goto LABEL_50;
                          goto LABEL_64;
                        }
                      }
LABEL_65:

                      if (v27)
                      {
                        v12 = 4;
                        goto LABEL_112;
                      }
LABEL_67:
                      v29 = v13;
                      v30 = (void *)objc_opt_class();
                      if (v13)
                      {
                        if (v30)
                        {
                          if ((objc_msgSend(v30, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
                          {
                            v142 = 0u;
                            v143 = 0u;
                            v140 = 0u;
                            v141 = 0u;
                            v31 = v29;
                            v32 = -[NSObject countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v140, buf, 16);
                            if (v32)
                            {
                              v33 = *(_QWORD *)v141;
LABEL_72:
                              v34 = 0;
                              while (1)
                              {
                                if (*(_QWORD *)v141 != v33)
                                  objc_enumerationMutation(v31);
                                v35 = *(id *)(*((_QWORD *)&v140 + 1) + 8 * v34);
                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                  break;

                                if (v32 == ++v34)
                                {
                                  v32 = -[NSObject countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v140, buf, 16);
                                  if (v32)
                                    goto LABEL_72;
                                  goto LABEL_86;
                                }
                              }
LABEL_87:

                              if (v35)
                              {
                                v12 = 7;
                                goto LABEL_112;
                              }
                              v37 = v29;
                              v38 = (void *)objc_opt_class();
                              if (v13)
                              {
                                if (v38)
                                {
                                  if ((objc_msgSend(v38, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
                                  {
                                    v142 = 0u;
                                    v143 = 0u;
                                    v140 = 0u;
                                    v141 = 0u;
                                    v39 = v37;
                                    v40 = -[NSObject countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v140, buf, 16);
                                    if (v40)
                                    {
                                      v41 = *(_QWORD *)v141;
LABEL_94:
                                      v42 = 0;
                                      while (1)
                                      {
                                        if (*(_QWORD *)v141 != v41)
                                          objc_enumerationMutation(v39);
                                        v43 = *(id *)(*((_QWORD *)&v140 + 1) + 8 * v42);
                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                          goto LABEL_109;

                                        if (v40 == ++v42)
                                        {
                                          v40 = -[NSObject countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v140, buf, 16);
                                          if (v40)
                                            goto LABEL_94;
                                          break;
                                        }
                                      }
                                    }
LABEL_108:
                                    v43 = 0;
LABEL_109:

                                    if (v43)
                                      v12 = 4;
                                    else
                                      v12 = 0;
                                    goto LABEL_112;
                                  }
                                  GEOFindOrCreateLog();
                                  v39 = objc_claimAutoreleasedReturnValue();
                                  if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                                    goto LABEL_108;
                                  *(_DWORD *)buf = 136446978;
                                  *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSu"
                                                       "ggestionsRoutine.mm";
                                  *(_WORD *)&buf[12] = 1024;
                                  *(_DWORD *)&buf[14] = 280;
                                  *(_WORD *)&buf[18] = 2082;
                                  *(_QWORD *)&buf[20] = "T *_get(NSArray<RTSource *> *__strong) [T = RTSourceCoreRoutine]";
                                  *(_WORD *)&buf[28] = 2082;
                                  *(_QWORD *)&buf[30] = "! [rtSourceClass isSubclassOfClass:[RTSource class]]";
                                  v44 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a RTSource-derived class";
                                }
                                else
                                {
                                  GEOFindOrCreateLog();
                                  v39 = objc_claimAutoreleasedReturnValue();
                                  if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                                    goto LABEL_108;
                                  *(_DWORD *)buf = 136446978;
                                  *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSu"
                                                       "ggestionsRoutine.mm";
                                  *(_WORD *)&buf[12] = 1024;
                                  *(_DWORD *)&buf[14] = 279;
                                  *(_WORD *)&buf[18] = 2082;
                                  *(_QWORD *)&buf[20] = "T *_get(NSArray<RTSource *> *__strong) [T = RTSourceCoreRoutine]";
                                  *(_WORD *)&buf[28] = 2082;
                                  *(_QWORD *)&buf[30] = "nil == (rtSourceClass)";
                                  v44 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a class";
                                }
                              }
                              else
                              {
                                GEOFindOrCreateLog();
                                v39 = objc_claimAutoreleasedReturnValue();
                                if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                                  goto LABEL_108;
                                *(_DWORD *)buf = 136446978;
                                *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSugg"
                                                     "estionsRoutine.mm";
                                *(_WORD *)&buf[12] = 1024;
                                *(_DWORD *)&buf[14] = 278;
                                *(_WORD *)&buf[18] = 2082;
                                *(_QWORD *)&buf[20] = "T *_get(NSArray<RTSource *> *__strong) [T = RTSourceCoreRoutine]";
                                *(_WORD *)&buf[28] = 2082;
                                *(_QWORD *)&buf[30] = "nil == (rtSources)";
                                v44 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires sources";
                              }
                              _os_log_impl(&dword_1A427D000, v39, OS_LOG_TYPE_ERROR, v44, buf, 0x26u);
                              goto LABEL_108;
                            }
LABEL_86:
                            v35 = 0;
                            goto LABEL_87;
                          }
                          GEOFindOrCreateLog();
                          v31 = objc_claimAutoreleasedReturnValue();
                          if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                            goto LABEL_86;
                          *(_DWORD *)buf = 136446978;
                          *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
                          *(_WORD *)&buf[12] = 1024;
                          *(_DWORD *)&buf[14] = 280;
                          *(_WORD *)&buf[18] = 2082;
                          *(_QWORD *)&buf[20] = "T *_get(NSArray<RTSource *> *__strong) [T = RTSourceCoreRoutineVehicleEvent]";
                          *(_WORD *)&buf[28] = 2082;
                          *(_QWORD *)&buf[30] = "! [rtSourceClass isSubclassOfClass:[RTSource class]]";
                          v36 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a RTSource-derived class";
                        }
                        else
                        {
                          GEOFindOrCreateLog();
                          v31 = objc_claimAutoreleasedReturnValue();
                          if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                            goto LABEL_86;
                          *(_DWORD *)buf = 136446978;
                          *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
                          *(_WORD *)&buf[12] = 1024;
                          *(_DWORD *)&buf[14] = 279;
                          *(_WORD *)&buf[18] = 2082;
                          *(_QWORD *)&buf[20] = "T *_get(NSArray<RTSource *> *__strong) [T = RTSourceCoreRoutineVehicleEvent]";
                          *(_WORD *)&buf[28] = 2082;
                          *(_QWORD *)&buf[30] = "nil == (rtSourceClass)";
                          v36 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a class";
                        }
                      }
                      else
                      {
                        GEOFindOrCreateLog();
                        v31 = objc_claimAutoreleasedReturnValue();
                        if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                          goto LABEL_86;
                        *(_DWORD *)buf = 136446978;
                        *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
                        *(_WORD *)&buf[12] = 1024;
                        *(_DWORD *)&buf[14] = 278;
                        *(_WORD *)&buf[18] = 2082;
                        *(_QWORD *)&buf[20] = "T *_get(NSArray<RTSource *> *__strong) [T = RTSourceCoreRoutineVehicleEvent]";
                        *(_WORD *)&buf[28] = 2082;
                        *(_QWORD *)&buf[30] = "nil == (rtSources)";
                        v36 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires sources";
                      }
                      _os_log_impl(&dword_1A427D000, v31, OS_LOG_TYPE_ERROR, v36, buf, 0x26u);
                      goto LABEL_86;
                    }
LABEL_64:
                    v27 = 0;
                    goto LABEL_65;
                  }
                  GEOFindOrCreateLog();
                  v23 = objc_claimAutoreleasedReturnValue();
                  if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                    goto LABEL_64;
                  *(_DWORD *)buf = 136446978;
                  *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
                  *(_WORD *)&buf[12] = 1024;
                  *(_DWORD *)&buf[14] = 280;
                  *(_WORD *)&buf[18] = 2082;
                  *(_QWORD *)&buf[20] = "T *_get(NSArray<RTSource *> *__strong) [T = RTSourceCoreRoutine]";
                  *(_WORD *)&buf[28] = 2082;
                  *(_QWORD *)&buf[30] = "! [rtSourceClass isSubclassOfClass:[RTSource class]]";
                  v28 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a RTSource-derived class";
                }
                else
                {
                  GEOFindOrCreateLog();
                  v23 = objc_claimAutoreleasedReturnValue();
                  if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                    goto LABEL_64;
                  *(_DWORD *)buf = 136446978;
                  *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
                  *(_WORD *)&buf[12] = 1024;
                  *(_DWORD *)&buf[14] = 279;
                  *(_WORD *)&buf[18] = 2082;
                  *(_QWORD *)&buf[20] = "T *_get(NSArray<RTSource *> *__strong) [T = RTSourceCoreRoutine]";
                  *(_WORD *)&buf[28] = 2082;
                  *(_QWORD *)&buf[30] = "nil == (rtSourceClass)";
                  v28 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a class";
                }
              }
              else
              {
                GEOFindOrCreateLog();
                v23 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                  goto LABEL_64;
                *(_DWORD *)buf = 136446978;
                *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = 278;
                *(_WORD *)&buf[18] = 2082;
                *(_QWORD *)&buf[20] = "T *_get(NSArray<RTSource *> *__strong) [T = RTSourceCoreRoutine]";
                *(_WORD *)&buf[28] = 2082;
                *(_QWORD *)&buf[30] = "nil == (rtSources)";
                v28 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires sources";
              }
              _os_log_impl(&dword_1A427D000, v23, OS_LOG_TYPE_ERROR, v28, buf, 0x26u);
              goto LABEL_64;
            }
LABEL_43:
            v19 = 0;
            goto LABEL_44;
          }
          GEOFindOrCreateLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            goto LABEL_43;
          *(_DWORD *)buf = 136446978;
          *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 280;
          *(_WORD *)&buf[18] = 2082;
          *(_QWORD *)&buf[20] = "T *_get(NSArray<RTSource *> *__strong) [T = RTSourceEventKit]";
          *(_WORD *)&buf[28] = 2082;
          *(_QWORD *)&buf[30] = "! [rtSourceClass isSubclassOfClass:[RTSource class]]";
          v20 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a RTSource-derived class";
        }
        else
        {
          GEOFindOrCreateLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            goto LABEL_43;
          *(_DWORD *)buf = 136446978;
          *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 279;
          *(_WORD *)&buf[18] = 2082;
          *(_QWORD *)&buf[20] = "T *_get(NSArray<RTSource *> *__strong) [T = RTSourceEventKit]";
          *(_WORD *)&buf[28] = 2082;
          *(_QWORD *)&buf[30] = "nil == (rtSourceClass)";
          v20 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a class";
        }
      }
      else
      {
        GEOFindOrCreateLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          goto LABEL_43;
        *(_DWORD *)buf = 136446978;
        *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 278;
        *(_WORD *)&buf[18] = 2082;
        *(_QWORD *)&buf[20] = "T *_get(NSArray<RTSource *> *__strong) [T = RTSourceEventKit]";
        *(_WORD *)&buf[28] = 2082;
        *(_QWORD *)&buf[30] = "nil == (rtSources)";
        v20 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires sources";
      }
      _os_log_impl(&dword_1A427D000, v15, OS_LOG_TYPE_ERROR, v20, buf, 0x26u);
      goto LABEL_43;
    }
    if (MapsSuggestionsSawHomeOrWorkOnThisDevice::s_onceToken != -1)
      dispatch_once(&MapsSuggestionsSawHomeOrWorkOnThisDevice::s_onceToken, &__block_literal_global_25);
    v12 = 2;
  }
  else
  {
    if (MapsSuggestionsSawHomeOrWorkOnThisDevice::s_onceToken != -1)
      dispatch_once(&MapsSuggestionsSawHomeOrWorkOnThisDevice::s_onceToken, &__block_literal_global_25);
    v12 = 1;
  }
LABEL_112:

  if ((objc_msgSend(v125, "canProduceEntriesOfType:", v12) & 1) != 0)
  {
    v45 = objc_msgSend(v131, "typeSource");
    log = -[MapsSuggestionsEntry initWithType:title:]([MapsSuggestionsEntry alloc], "initWithType:title:", v12, &stru_1E4BDFC28);
    objc_msgSend(v131, "location");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "latitude");
    v48 = v47;
    objc_msgSend(v131, "location");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "longitude");
    v51 = v50;

    *(_QWORD *)&v140 = 0;
    *((_QWORD *)&v140 + 1) = &v140;
    *(_QWORD *)&v141 = 0x4012000000;
    *((_QWORD *)&v141 + 1) = __Block_byref_object_copy__15;
    *(_QWORD *)&v142 = __Block_byref_object_dispose__15;
    *((_QWORD *)&v142 + 1) = &unk_1A4409329;
    *(double *)&v143 = v48;
    *((double *)&v143 + 1) = v51;
    if (objc_msgSend(MEMORY[0x1E0D27178], "isLocationShiftRequiredForCoordinate:", v48, v51))
    {
      objc_msgSend(v131, "location");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v52, "referenceFrame") == 2;

      if (!v53)
      {
        GEOFindOrCreateLog();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A427D000, v54, OS_LOG_TYPE_DEBUG, "Entry needs location shift.", buf, 2u);
        }

        v55 = v125;
        if (!v125[17])
        {
          v56 = objc_alloc_init(MEMORY[0x1E0D27178]);
          v57 = (void *)v125[17];
          v125[17] = v56;

          v55 = v125;
        }
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        buf[24] = 0;
        v58 = dispatch_semaphore_create(0);
        v59 = (void *)v55[17];
        v60 = MEMORY[0x1E0C809B0];
        v136[0] = MEMORY[0x1E0C809B0];
        v136[1] = 3221225472;
        v136[2] = __50__MapsSuggestionsRoutine__suggestionEntryForPLOI___block_invoke;
        v136[3] = &unk_1E4BD0768;
        v138 = &v140;
        v139 = buf;
        v137 = v58;
        v134[0] = v60;
        v134[1] = 3221225472;
        v134[2] = __50__MapsSuggestionsRoutine__suggestionEntryForPLOI___block_invoke_270;
        v134[3] = &unk_1E4BD0790;
        v61 = v137;
        v135 = v61;
        dispatch_get_global_queue(17, 0);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "shiftCoordinate:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:", v136, 0, v134, v62, v48, v51, 0.0);

        GEOConfigGetDouble();
        v64 = dispatch_time(0, (uint64_t)(v63 * 1000000000.0));
        dispatch_semaphore_wait(v61, v64);
        if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
        {
          GEOFindOrCreateLog();
          v118 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v144 = 0;
            _os_log_impl(&dword_1A427D000, v118, OS_LOG_TYPE_ERROR, "Entry required location shift, but could not shift it. This entry will be dropped until the location shift completes successfully", v144, 2u);
          }

          _Block_object_dispose(buf, 8);
          v71 = 0;
LABEL_184:
          _Block_object_dispose(&v140, 8);
LABEL_185:

          goto LABEL_186;
        }

        _Block_object_dispose(buf, 8);
      }
    }
    v65 = log;
    v66 = v127;
    v67 = v66;
    if (v65)
    {
      if (v66)
      {
        -[MapsSuggestionsEntry setGeoMapItem:](v65, "setGeoMapItem:", 0);
        objc_msgSend(v67, "name");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        *(_QWORD *)&buf[24] = __Block_byref_object_copy__329;
        *(_QWORD *)&buf[32] = __Block_byref_object_dispose__330;
        v151 = 0;
        *(_QWORD *)v144 = MEMORY[0x1E0C809B0];
        *(_QWORD *)&v144[8] = 3221225472;
        *(_QWORD *)&v145 = ___ZL18_firstLineOfStringP8NSString_block_invoke;
        *((_QWORD *)&v145 + 1) = &unk_1E4BD0BA0;
        *(_QWORD *)&v146 = buf;
        objc_msgSend(v68, "enumerateLinesUsingBlock:", v144);
        v69 = *(id *)(*(_QWORD *)&buf[8] + 40);
        _Block_object_dispose(buf, 8);

        -[MapsSuggestionsEntry setUndecoratedTitle:](v65, "setUndecoratedTitle:", v69);
        -[MapsSuggestionsEntry setUndecoratedSubtitle:](v65, "setUndecoratedSubtitle:", 0);
      }
    }
    else
    {
      GEOFindOrCreateLog();
      v72 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 424;
        *(_WORD *)&buf[18] = 2082;
        *(_QWORD *)&buf[20] = "-[MapsSuggestionsRoutine _addFieldsToSuggestionsEntry:fromRTMapItem:]";
        *(_WORD *)&buf[28] = 2082;
        *(_QWORD *)&buf[30] = "nil == (entry)";
        _os_log_impl(&dword_1A427D000, v72, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires suggestion entry", buf, 0x26u);
      }

    }
    objc_msgSend(v131, "identifier");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "UUIDString");
    v129 = (void *)objc_claimAutoreleasedReturnValue();

    -[MapsSuggestionsEntry setString:forKey:](v65, "setString:forKey:", v129, CFSTR("MapsSuggestionsCoreRoutinePK"));
    -[MapsSuggestionsEntry setString:forKey:](v65, "setString:forKey:", CFSTR("MapsSuggestionsCoreRoutinePK"), CFSTR("MapsSuggestionsPrimaryKey"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(*((_QWORD *)&v140 + 1) + 48));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[MapsSuggestionsEntry setNumber:forKey:](v65, "setNumber:forKey:", v74, CFSTR("MapsSuggestionsLatitudeKey"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(*((_QWORD *)&v140 + 1) + 56));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[MapsSuggestionsEntry setNumber:forKey:](v65, "setNumber:forKey:", v75, CFSTR("MapsSuggestionsLongitudeKey"));

    v76 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v131, "location");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "horizontalUncertainty");
    objc_msgSend(v76, "numberWithDouble:");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[MapsSuggestionsEntry setNumber:forKey:](v65, "setNumber:forKey:", v78, CFSTR("MapsSuggestionsCoreRoutineLocationUncertainty"));

    -[MapsSuggestionsEntry setInteger:forKey:](v65, "setInteger:forKey:", 0, CFSTR("MapsSuggestionsGEOMapItemOriginKey"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v131, "type"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[MapsSuggestionsEntry setNumber:forKey:](v65, "setNumber:forKey:", v79, CFSTR("MapsSuggestionsCoreRoutineType"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v131, "typeSource"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[MapsSuggestionsEntry setNumber:forKey:](v65, "setNumber:forKey:", v80, CFSTR("MapsSuggestionsCoreRoutineTypeSource"));

    objc_msgSend(v131, "customLabel");
    v81 = objc_claimAutoreleasedReturnValue();
    v82 = (void *)v81;
    if (v81)
      v83 = (const __CFString *)v81;
    else
      v83 = &stru_1E4BDFC28;
    -[MapsSuggestionsEntry setString:forKey:](v65, "setString:forKey:", v83, CFSTR("MapsSuggestionsCoreRoutineCustomLabel"));

    objc_msgSend(v131, "identifier");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[MapsSuggestionsEntry setUUID:forKey:](v65, "setUUID:forKey:", v84, CFSTR("MapsSuggestionsCoreRoutineIdentifier"));

    objc_msgSend(v130, "nextEntryTime");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[MapsSuggestionsEntry setDate:forKey:](v65, "setDate:forKey:", v85, CFSTR("MapsSuggestionsScheduledTimeKey"));

    v86 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v131, "visits");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "numberWithUnsignedInteger:", objc_msgSend(v87, "count"));
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[MapsSuggestionsEntry setNumber:forKey:](v65, "setNumber:forKey:", v88, CFSTR("MapsSuggestionsCoreRoutineVisitsCountKey"));

    -[MapsSuggestionsEntry setBoolean:forKey:](v65, "setBoolean:forKey:", v45 & 1, CFSTR("MapsSuggestionsCoreRoutineFromMeCardKey"));
    objc_msgSend(v67, "geoMapItemHandle");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    -[MapsSuggestionsEntry setMapItemHandleData:](v65, "setMapItemHandleData:", v89);

    objc_msgSend(v130, "nextEntryTime");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = v90;
    if (!v90)
    {
      v92 = (void *)MEMORY[0x1E0C99D68];
      GEOConfigGetDouble();
      objc_msgSend(v92, "dateWithTimeIntervalSinceNow:");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[MapsSuggestionsEntry setExpires:](v65, "setExpires:", v91);
    if (!v90)

    objc_msgSend(v131, "visits");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "firstObject");
    v94 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v94, "entryDate");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[MapsSuggestionsEntry setDate:forKey:](v65, "setDate:forKey:", v95, CFSTR("MapsSuggestionsCoreRoutineFirstVisit"));

    objc_msgSend(v131, "visits");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "lastObject");
    v97 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v97, "entryDate");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    -[MapsSuggestionsEntry setDate:forKey:](v65, "setDate:forKey:", v98, CFSTR("MapsSuggestionsCoreRoutineLastVisit"));

    objc_msgSend(v130, "confidence");
    v100 = v99;
    GEOFindOrCreateLog();
    v101 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)&buf[4] = v100;
      _os_log_impl(&dword_1A427D000, v101, OS_LOG_TYPE_DEBUG, "Got a confidence of %.2f", buf, 0xCu);
    }

    switch(v12)
    {
      case 1uLL:
        GEOConfigGetDouble();
        -[MapsSuggestionsEntry setWeight:](v65, "setWeight:", v100 * v102);
        if (MapsSuggestionsSawHomeOrWorkOnThisDevice::s_onceToken != -1)
          goto LABEL_190;
        goto LABEL_155;
      case 2uLL:
        GEOConfigGetDouble();
        -[MapsSuggestionsEntry setWeight:](v65, "setWeight:", v100 * v105);
        if (MapsSuggestionsSawHomeOrWorkOnThisDevice::s_onceToken == -1)
          goto LABEL_155;
        goto LABEL_190;
      case 3uLL:
      case 5uLL:
      case 6uLL:
        goto LABEL_149;
      case 4uLL:
        GEOConfigGetDouble();
        -[MapsSuggestionsEntry setWeight:](v65, "setWeight:", v100 * v106);
        goto LABEL_155;
      case 7uLL:
        v126 = obj;
        v112 = (void *)objc_opt_class();
        if (v126)
        {
          if (v112)
          {
            if ((objc_msgSend(v112, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
            {
              v146 = 0u;
              v147 = 0u;
              *(_OWORD *)v144 = 0u;
              v145 = 0u;
              v113 = v126;
              v114 = -[NSObject countByEnumeratingWithState:objects:count:](v113, "countByEnumeratingWithState:objects:count:", v144, buf, 16);
              if (!v114)
                goto LABEL_178;
              v115 = *(_QWORD *)v145;
LABEL_161:
              v116 = 0;
              while (1)
              {
                if (*(_QWORD *)v145 != v115)
                  objc_enumerationMutation(v113);
                v117 = *(id *)(*(_QWORD *)&v144[8] + 8 * v116);
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  break;

                if (v114 == ++v116)
                {
                  v114 = -[NSObject countByEnumeratingWithState:objects:count:](v113, "countByEnumeratingWithState:objects:count:", v144, buf, 16);
                  if (!v114)
                  {
LABEL_178:

                    goto LABEL_179;
                  }
                  goto LABEL_161;
                }
              }

              if (!v117)
              {
LABEL_179:
                GEOFindOrCreateLog();
                v104 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136446978;
                  *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
                  *(_WORD *)&buf[12] = 1024;
                  *(_DWORD *)&buf[14] = 569;
                  *(_WORD *)&buf[18] = 2082;
                  *(_QWORD *)&buf[20] = "-[MapsSuggestionsRoutine _suggestionEntryForPLOI:]";
                  *(_WORD *)&buf[28] = 2082;
                  *(_QWORD *)&buf[30] = "nil == (rtSource)";
                  _os_log_impl(&dword_1A427D000, v104, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. ParkedCar needs to be a VehicleEvent", buf, 0x26u);
                }
                goto LABEL_181;
              }
              objc_msgSend(v117, "vehicleEvent");
              v121 = (void *)objc_claimAutoreleasedReturnValue();
              v122 = -[MapsSuggestionsRoutine _addParkedCarFieldsToSuggestionsEntry:vehicleEvent:](v65, v121);

              if ((v122 & 1) != 0)
                goto LABEL_155;
LABEL_182:
              v71 = 0;
LABEL_183:

              goto LABEL_184;
            }
            GEOFindOrCreateLog();
            v113 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
              goto LABEL_178;
            *(_DWORD *)v148 = 136446978;
            *(_QWORD *)&v148[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
            *(_WORD *)&v148[12] = 1024;
            *(_DWORD *)&v148[14] = 280;
            *(_WORD *)&v148[18] = 2082;
            *(_QWORD *)&v148[20] = "T *_get(NSArray<RTSource *> *__strong) [T = RTSourceCoreRoutineVehicleEvent]";
            *(_WORD *)&v148[28] = 2082;
            *(_QWORD *)&v148[30] = "! [rtSourceClass isSubclassOfClass:[RTSource class]]";
            v119 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a RTSource-derived class";
          }
          else
          {
            GEOFindOrCreateLog();
            v113 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
              goto LABEL_178;
            *(_DWORD *)v148 = 136446978;
            *(_QWORD *)&v148[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
            *(_WORD *)&v148[12] = 1024;
            *(_DWORD *)&v148[14] = 279;
            *(_WORD *)&v148[18] = 2082;
            *(_QWORD *)&v148[20] = "T *_get(NSArray<RTSource *> *__strong) [T = RTSourceCoreRoutineVehicleEvent]";
            *(_WORD *)&v148[28] = 2082;
            *(_QWORD *)&v148[30] = "nil == (rtSourceClass)";
            v119 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a class";
          }
        }
        else
        {
          GEOFindOrCreateLog();
          v113 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
            goto LABEL_178;
          *(_DWORD *)v148 = 136446978;
          *(_QWORD *)&v148[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
          *(_WORD *)&v148[12] = 1024;
          *(_DWORD *)&v148[14] = 278;
          *(_WORD *)&v148[18] = 2082;
          *(_QWORD *)&v148[20] = "T *_get(NSArray<RTSource *> *__strong) [T = RTSourceCoreRoutineVehicleEvent]";
          *(_WORD *)&v148[28] = 2082;
          *(_QWORD *)&v148[30] = "nil == (rtSources)";
          v119 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires sources";
        }
        _os_log_impl(&dword_1A427D000, v113, OS_LOG_TYPE_ERROR, v119, v148, 0x26u);
        goto LABEL_178;
      default:
        if (v12 == 19)
        {
          GEOConfigGetDouble();
          -[MapsSuggestionsEntry setWeight:](v65, "setWeight:", v100 * v103);
          if (MapsSuggestionsSawHomeOrWorkOnThisDevice::s_onceToken != -1)
LABEL_190:
            dispatch_once(&MapsSuggestionsSawHomeOrWorkOnThisDevice::s_onceToken, &__block_literal_global_25);
LABEL_155:
          v107 = v65;
          -[MapsSuggestionsEntry stringForKey:](v107, "stringForKey:", CFSTR("MapsSuggestionsCoreRoutineCustomLabel"));
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          -[MapsSuggestionsEntry numberForKey:](v107, "numberForKey:", CFSTR("MapsSuggestionsCoreRoutineType"));
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          v110 = objc_msgSend(v109, "integerValue");

          MapsSuggestionsRoutineLocalizedLabelLOIType(v110, v108);
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          -[MapsSuggestionsEntry setString:forKey:](v107, "setString:forKey:", v111, CFSTR("MapsSuggestionsCoreRoutineLabel"));

          v71 = v107;
          goto LABEL_183;
        }
LABEL_149:
        GEOFindOrCreateLog();
        v104 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446978;
          *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 577;
          *(_WORD *)&buf[18] = 2082;
          *(_QWORD *)&buf[20] = "-[MapsSuggestionsRoutine _suggestionEntryForPLOI:]";
          *(_WORD *)&buf[28] = 2082;
          *(_QWORD *)&buf[30] = "type == type";
          _os_log_impl(&dword_1A427D000, v104, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. We converted into an EntryType we can't handle?!", buf, 0x26u);
        }
LABEL_181:

        goto LABEL_182;
    }
  }
  if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
    dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
  if (s_verbose)
  {
    GEOFindOrCreateLog();
    log = (MapsSuggestionsEntry *)(id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&log->super, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromMapsSuggestionsEntryType(v12);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v70;
      _os_log_impl(&dword_1A427D000, &log->super, OS_LOG_TYPE_DEBUG, "RoutineSource drops type of %@", buf, 0xCu);

    }
    v71 = 0;
    goto LABEL_185;
  }
  v71 = 0;
LABEL_186:

  return v71;
}

intptr_t __50__MapsSuggestionsRoutine__suggestionEntryForPLOI___block_invoke(uint64_t a1, double a2, double a3)
{
  uint64_t v4;
  NSObject *v5;
  uint8_t v7[16];

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(double *)(v4 + 48) = a2;
  *(double *)(v4 + 56) = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "Successfully shifted entry's coordinate.", v7, 2u);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __50__MapsSuggestionsRoutine__suggestionEntryForPLOI___block_invoke_270(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  GEOFindOrCreateLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "Failed to shift entry's coordinate: %@", (uint8_t *)&v5, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __64__MapsSuggestionsRoutine__resolveMapItemsAndAddEntries_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char *v6;
  char *v7;
  id *WeakRetained;
  id *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412290;
      v14 = v7;
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "Could not get MapItem: %@", (uint8_t *)&v13, 0xCu);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
    v9 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained[15], "setObject:forKeyedSubscript:", v5, *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 48), "numberForKey:", CFSTR("MapsSuggestionsGEOMapItemOriginKey"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9[16], "setObject:forKeyedSubscript:", v10, *(_QWORD *)(a1 + 40));

      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    }
    else
    {
      GEOFindOrCreateLog();
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = 136446722;
        v14 = "MapsSuggestionsRoutine.mm";
        v15 = 1026;
        v16 = 673;
        v17 = 2082;
        v18 = "-[MapsSuggestionsRoutine _resolveMapItemsAndAddEntries:handler:]_block_invoke";
        _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v13, 0x1Cu);
      }

    }
  }

}

void __64__MapsSuggestionsRoutine__resolveMapItemsAndAddEntries_handler___block_invoke_278(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  char *v4;
  NSObject *v5;
  int v6;
  char *v7;
  __int16 v8;
  _WORD v9[17];

  *(_QWORD *)&v9[13] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    GEOFindOrCreateLog();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(WeakRetained, "uniqueName");
      v4 = (char *)objc_claimAutoreleasedReturnValue();
      v6 = 138412546;
      v7 = v4;
      v8 = 2080;
      *(_QWORD *)v9 = "_resolveMapItemsAndAddEntries";
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v6, 0x16u);

    }
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v5))
    {
      LOWORD(v6) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_resolveMapItemsAndAddEntries", ", (uint8_t *)&v6, 2u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446722;
      v7 = "MapsSuggestionsRoutine.mm";
      v8 = 1026;
      *(_DWORD *)v9 = 689;
      v9[2] = 2082;
      *(_QWORD *)&v9[3] = "-[MapsSuggestionsRoutine _resolveMapItemsAndAddEntries:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }

  }
}

- (char)fetchEntriesForLocation:(id)a3 period:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  NSObject *v13;
  char v14;
  const char *v16;
  NSObject *v17;
  NSObject *v18;
  MapsSuggestionsRoutineConnector *connector;
  void *v20;
  double v21;
  double v22;
  NSObject *v23;
  _QWORD v24[4];
  id v25;
  id v26[2];
  id location;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  _BYTE v31[24];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v29 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      v30 = 1024;
      *(_DWORD *)v31 = 700;
      *(_WORD *)&v31[4] = 2082;
      *(_QWORD *)&v31[6] = "-[MapsSuggestionsRoutine fetchEntriesForLocation:period:handler:]";
      *(_WORD *)&v31[14] = 2082;
      *(_QWORD *)&v31[16] = "nil == (handler)";
      _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a handler", buf, 0x26u);
    }
    goto LABEL_20;
  }
  if (!v8)
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v29 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      v30 = 1024;
      *(_DWORD *)v31 = 701;
      *(_WORD *)&v31[4] = 2082;
      *(_QWORD *)&v31[6] = "-[MapsSuggestionsRoutine fetchEntriesForLocation:period:handler:]";
      *(_WORD *)&v31[14] = 2082;
      *(_QWORD *)&v31[16] = "nil == (location)";
      _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a location", buf, 0x26u);
    }
    goto LABEL_20;
  }
  if (!v9)
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v29 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      v30 = 1024;
      *(_DWORD *)v31 = 702;
      *(_WORD *)&v31[4] = 2082;
      *(_QWORD *)&v31[6] = "-[MapsSuggestionsRoutine fetchEntriesForLocation:period:handler:]";
      *(_WORD *)&v31[14] = 2082;
      *(_QWORD *)&v31[16] = "nil == (period)";
      _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a period", buf, 0x26u);
    }
    goto LABEL_20;
  }
  objc_msgSend(v9, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v29 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      v30 = 1024;
      *(_DWORD *)v31 = 703;
      *(_WORD *)&v31[4] = 2082;
      *(_QWORD *)&v31[6] = "-[MapsSuggestionsRoutine fetchEntriesForLocation:period:handler:]";
      *(_WORD *)&v31[14] = 2082;
      *(_QWORD *)&v31[16] = "nil == (period.startDate)";
      _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a startDate", buf, 0x26u);
    }
    goto LABEL_20;
  }
  objc_msgSend(v9, "duration");
  if (v12 == 0.0)
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v29 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      v30 = 1024;
      *(_DWORD *)v31 = 704;
      *(_WORD *)&v31[4] = 2082;
      *(_QWORD *)&v31[6] = "-[MapsSuggestionsRoutine fetchEntriesForLocation:period:handler:]";
      *(_WORD *)&v31[14] = 2082;
      *(_QWORD *)&v31[16] = "0.0 == period.duration";
      _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an interval", buf, 0x26u);
    }
LABEL_20:

    v14 = 0;
    goto LABEL_21;
  }
  if (+[MapsSuggestionsSiri isEnabled](MapsSuggestionsSiri, "isEnabled"))
  {
    v16 = (const char *)-[MapsSuggestionsRoutine fetchEntriesForLocation:period:handler:]::s_stepCounter++;
    GEOFindOrCreateLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v29 = v16;
      _os_log_impl(&dword_1A427D000, v17, OS_LOG_TYPE_DEBUG, "FindAllPLOIEntries %lu BEGIN", buf, 0xCu);
    }

    objc_initWeak(&location, self);
    GEOFindOrCreateLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      v29 = v16;
      v30 = 2112;
      *(_QWORD *)v31 = v9;
      *(_WORD *)&v31[8] = 2112;
      *(_QWORD *)&v31[10] = v8;
      _os_log_impl(&dword_1A427D000, v18, OS_LOG_TYPE_DEBUG, "FindAllPLOIEntries %lu uses %@ location=%@", buf, 0x20u);
    }

    connector = self->_connector;
    objc_msgSend(v9, "startDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "duration");
    v22 = v21;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __65__MapsSuggestionsRoutine_fetchEntriesForLocation_period_handler___block_invoke;
    v24[3] = &unk_1E4BD0960;
    objc_copyWeak(v26, &location);
    v25 = v10;
    v26[1] = (id)v16;
    -[MapsSuggestionsRoutineConnector fetchNextPLOIsFromLocation:startDate:timeInterval:withHandler:](connector, "fetchNextPLOIsFromLocation:startDate:timeInterval:withHandler:", v8, v20, v24, v22);

    objc_destroyWeak(v26);
    objc_destroyWeak(&location);
  }
  else
  {
    GEOFindOrCreateLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A427D000, v23, OS_LOG_TYPE_DEBUG, "User turned off Siri Suggestions for maps. Not attempting to fetch entries", buf, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
  }
  v14 = 1;
LABEL_21:

  return v14;
}

void __65__MapsSuggestionsRoutine_fetchEntriesForLocation_period_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char *v6;
  dispatch_queue_t *WeakRetained;
  dispatch_queue_t *v8;
  NSObject *v9;
  NSObject *v10;
  char *v11;
  id v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18[2];
  uint8_t buf[4];
  char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (v6)
  {
    if (WeakRetained)
    {
      GEOFindOrCreateLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v6;
        _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "Could not get PLOIs: %@", buf, 0xCu);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      GEOFindOrCreateLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v11 = *(char **)(a1 + 48);
        *(_DWORD *)buf = 134217984;
        v20 = v11;
        _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_DEBUG, "FindAllPLOIEntries %lu FAIL", buf, 0xCu);
      }
    }
    else
    {
      GEOFindOrCreateLog();
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v20 = "MapsSuggestionsRoutine.mm";
        v21 = 1026;
        v22 = 729;
        v23 = 2082;
        v24 = "-[MapsSuggestionsRoutine fetchEntriesForLocation:period:handler:]_block_invoke";
        _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
      }

    }
  }
  else if (WeakRetained)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __65__MapsSuggestionsRoutine_fetchEntriesForLocation_period_handler___block_invoke_285;
    v15[3] = &unk_1E4BCE820;
    objc_copyWeak(v18, (id *)(a1 + 40));
    v16 = v5;
    v12 = *(id *)(a1 + 32);
    v13 = *(void **)(a1 + 48);
    v17 = v12;
    v18[1] = v13;
    dispatch_async(v8[3], v15);

    objc_destroyWeak(v18);
  }
  else
  {
    GEOFindOrCreateLog();
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v20 = "MapsSuggestionsRoutine.mm";
      v21 = 1026;
      v22 = 736;
      v23 = 2082;
      v24 = "-[MapsSuggestionsRoutine fetchEntriesForLocation:period:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: outerStrongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __65__MapsSuggestionsRoutine_fetchEntriesForLocation_period_handler___block_invoke_285(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  char *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  void *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  void *v43;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  id v47;
  id v48;
  NSObject *v49;
  char *v50;
  uint64_t v51;
  id v52;
  id v53;
  id v54;
  id v55;
  NSObject *group;
  char *v57;
  id v58;
  id obj;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD v65[4];
  NSObject *v66;
  id v67;
  void *v68;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  id location;
  uint8_t v75[128];
  _BYTE block[24];
  void *v77;
  id v78;
  id v79;
  id v80[2];
  uint8_t buf[4];
  char *v82;
  __int16 v83;
  _BYTE v84[14];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v57 = (char *)-[MapsSuggestionsRoutine fetchEntriesForLocation:period:handler:]::s_stepCounter;
    v51 = a1;
    v3 = *(void **)(a1 + 32);
    v4 = *(void **)(a1 + 40);
    v55 = v3;
    v54 = v4;
    dispatch_assert_queue_V2((dispatch_queue_t)WeakRetained[3]);
    v60 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (!*((_BYTE *)WeakRetained + 144))
    {
      GEOConfigSetBOOL();
      *((_BYTE *)WeakRetained + 144) = 1;
    }
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v82 = "-[MapsSuggestionsRoutine _treatPLOIs:stepCounter:handler:]";
      v83 = 1024;
      *(_DWORD *)v84 = objc_msgSend(v55, "count");
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "%s: about to process %u routine LOIs", buf, 0x12u);
    }

    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    obj = v55;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v75, 16);
    if (v6)
    {
      v7 = 0;
      v8 = 0;
      v9 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v62 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
          -[MapsSuggestionsRoutine _suggestionEntryForPLOI:](WeakRetained, v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v12)
          {
            if (objc_msgSend(v12, "type") == 1)
            {
              objc_msgSend(v11, "confidence");
              v15 = v14;
              if ((v7 & 1) != 0 && v14 <= 0.0 && GEOConfigGetBOOL())
              {
                GEOFindOrCreateLog();
                v16 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v82 = (char *)v11;
                  _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_DEBUG, "We already had a high-confidence Home, we don't need a low-confidence one: %@", buf, 0xCu);
                }
LABEL_22:

                goto LABEL_23;
              }
              v7 |= v15 > 0.0;
            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", ++v8);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setNumber:forKey:", v17, CFSTR("MapsSuggestionsOriginalPositionKey"));

            objc_msgSend(v60, "addObject:", v13);
            GEOFindOrCreateLog();
            v16 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v13, "fullDescription");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218242;
              v82 = v57;
              v83 = 2112;
              *(_QWORD *)v84 = v18;
              _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_DEBUG, "FindAllPLOIEntries %lu yielded MapsSuggestionEntry: %@", buf, 0x16u);

            }
            goto LABEL_22;
          }
LABEL_23:

        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v75, 16);
      }
      while (v6);
    }

    v53 = v60;
    v52 = v54;
    dispatch_assert_queue_V2((dispatch_queue_t)WeakRetained[3]);
    GEOFindOrCreateLog();
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(WeakRetained, "uniqueName");
      v20 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v82 = v20;
      v83 = 2080;
      *(_QWORD *)v84 = "_resolveMapItemsAndAddEntries";
      _os_log_impl(&dword_1A427D000, v19, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

    }
    GEOFindOrCreateLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v21, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_resolveMapItemsAndAddEntries", ", buf, 2u);
    }

    objc_initWeak(&location, WeakRetained);
    group = dispatch_group_create();
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v58 = v53;
    v22 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v70, buf, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v71;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v71 != v23)
            objc_enumerationMutation(v58);
          v25 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * v24);
          if (objc_msgSend(v25, "type"))
          {
            MapsSuggestionsDestinationKey(v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
              dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
            if (s_verbose)
            {
              GEOFindOrCreateLog();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              {
                v28 = WeakRetained[15];
                *(_DWORD *)block = 138412546;
                *(_QWORD *)&block[4] = v26;
                *(_WORD *)&block[12] = 2112;
                *(_QWORD *)&block[14] = v28;
                _os_log_impl(&dword_1A427D000, v27, OS_LOG_TYPE_DEBUG, "Trying destination key %@ on %@", block, 0x16u);
              }

            }
            objc_msgSend((id)WeakRetained[15], "objectForKeyedSubscript:", v26);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            if (v29)
            {
              GEOFindOrCreateLog();
              v30 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
              {
                v31 = objc_msgSend((id)WeakRetained[15], "hitsOnKey:", v26);
                objc_msgSend((id)WeakRetained[15], "totalHitRatio");
                v33 = v32;
                v34 = objc_msgSend((id)WeakRetained[15], "count");
                *(_DWORD *)block = 67109632;
                *(_DWORD *)&block[4] = v31;
                *(_WORD *)&block[8] = 2048;
                *(_QWORD *)&block[10] = v33;
                *(_WORD *)&block[18] = 1024;
                *(_DWORD *)&block[20] = v34;
                _os_log_impl(&dword_1A427D000, v30, OS_LOG_TYPE_DEBUG, "Cache hit (%ux) (ratio: %.2f on %u elements)", block, 0x18u);
              }

              objc_msgSend(v25, "setGeoMapItem:", v29);
              objc_msgSend((id)WeakRetained[16], "objectForKeyedSubscript:", v26);
              v35 = objc_claimAutoreleasedReturnValue();
              v36 = (void *)v35;
              v37 = &unk_1E4C098A8;
              if (v35)
                v37 = (void *)v35;
              v38 = v37;

              objc_msgSend(v25, "setNumber:forKey:", v38, CFSTR("MapsSuggestionsGEOMapItemOriginKey"));
            }
            else
            {
              GEOFindOrCreateLog();
              v39 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend((id)WeakRetained[15], "totalHitRatio");
                v41 = v40;
                v42 = objc_msgSend((id)WeakRetained[15], "count");
                *(_DWORD *)block = 134218240;
                *(_QWORD *)&block[4] = v41;
                *(_WORD *)&block[12] = 1024;
                *(_DWORD *)&block[14] = v42;
                _os_log_impl(&dword_1A427D000, v39, OS_LOG_TYPE_DEBUG, "Cache miss (ratio: %.2f on %u elements)", block, 0x12u);
              }

              dispatch_group_enter(group);
              v43 = (void *)WeakRetained[2];
              v65[0] = MEMORY[0x1E0C809B0];
              v65[1] = 3221225472;
              v65[2] = __64__MapsSuggestionsRoutine__resolveMapItemsAndAddEntries_handler___block_invoke;
              v65[3] = &unk_1E4BD07B8;
              v44 = group;
              v66 = v44;
              objc_copyWeak(&v69, &location);
              v67 = v26;
              v68 = v25;
              if (!GEOMapItemFromMapsSuggestionsEntry(v25, v43, 1, v65))
                dispatch_group_leave(v44);

              objc_destroyWeak(&v69);
              v38 = v66;
            }

          }
          ++v24;
        }
        while (v22 != v24);
        v22 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v70, buf, 16);
      }
      while (v22);
    }

    v45 = (void *)WeakRetained[3];
    *(_QWORD *)block = MEMORY[0x1E0C809B0];
    *(_QWORD *)&block[8] = 3221225472;
    *(_QWORD *)&block[16] = __64__MapsSuggestionsRoutine__resolveMapItemsAndAddEntries_handler___block_invoke_278;
    v77 = &unk_1E4BD07E0;
    v46 = v45;
    objc_copyWeak(v80, &location);
    v47 = v52;
    v79 = v47;
    v48 = v58;
    v78 = v48;
    dispatch_group_notify(group, v46, block);

    objc_destroyWeak(v80);
    objc_destroyWeak(&location);

    GEOFindOrCreateLog();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
    {
      v50 = *(char **)(v51 + 56);
      *(_DWORD *)buf = 134217984;
      v82 = v50;
      _os_log_impl(&dword_1A427D000, v49, OS_LOG_TYPE_DEBUG, "FindAllPLOIEntries %lu END", buf, 0xCu);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v49 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v82 = "MapsSuggestionsRoutine.mm";
      v83 = 1026;
      *(_DWORD *)v84 = 738;
      *(_WORD *)&v84[4] = 2082;
      *(_QWORD *)&v84[6] = "-[MapsSuggestionsRoutine fetchEntriesForLocation:period:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v49, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

- (void)_addMapItemToShortcut:(void *)a3 fromLOI:(void *)a4 group:
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  _QWORD v15[4];
  NSObject *v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v7)
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    *(_DWORD *)buf = 136446978;
    v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
    v20 = 1024;
    v21 = 753;
    v22 = 2082;
    v23 = "-[MapsSuggestionsRoutine _addMapItemToShortcut:fromLOI:group:]";
    v24 = 2082;
    v25 = "nil == (shortcut)";
    v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a shortcut";
LABEL_11:
    _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, v14, buf, 0x26u);
    goto LABEL_12;
  }
  if (!v8)
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    *(_DWORD *)buf = 136446978;
    v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
    v20 = 1024;
    v21 = 754;
    v22 = 2082;
    v23 = "-[MapsSuggestionsRoutine _addMapItemToShortcut:fromLOI:group:]";
    v24 = 2082;
    v25 = "nil == (loi)";
    v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a LOI";
    goto LABEL_11;
  }
  if (!v9)
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    *(_DWORD *)buf = 136446978;
    v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
    v20 = 1024;
    v21 = 755;
    v22 = 2082;
    v23 = "-[MapsSuggestionsRoutine _addMapItemToShortcut:fromLOI:group:]";
    v24 = 2082;
    v25 = "nil == (group)";
    v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a dispatch group";
    goto LABEL_11;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  dispatch_group_enter(v10);
  v11 = *(void **)(a1 + 16);
  objc_msgSend(v8, "mapItem");
  v12 = objc_claimAutoreleasedReturnValue();
  -[NSObject geoMapItemHandle](v12, "geoMapItemHandle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __62__MapsSuggestionsRoutine__addMapItemToShortcut_fromLOI_group___block_invoke;
  v15[3] = &unk_1E4BCF158;
  v16 = v10;
  v17 = v7;
  objc_msgSend(v11, "resolveMapItemHandleData:completion:", v13, v15);

LABEL_12:
}

void __62__MapsSuggestionsRoutine__addMapItemToShortcut_fromLOI_group___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  unint64_t v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6 || !objc_msgSend(v5, "count"))
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412290;
      v14 = v6;
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "Could not resolve Shortcut mapItem, error: %@", (uint8_t *)&v13, 0xCu);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    objc_msgSend(v5, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    MapsSuggestionsMapItemConvertIfNeeded(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setGeoMapItem:", v9);

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    v10 = *(id *)(a1 + 40);
    v11 = v10;
    if (v10 && (objc_msgSend(v10, "isSetupPlaceholder") & 1) == 0)
    {
      v12 = objc_msgSend(v11, "type") & 0xFFFFFFFFFFFFFFFELL;

      if (v12 == 2 && MapsSuggestionsSawHomeOrWorkOnThisDevice::s_onceToken != -1)
        dispatch_once(&MapsSuggestionsSawHomeOrWorkOnThisDevice::s_onceToken, &__block_literal_global_25);
    }
    else
    {

    }
  }

}

- (id)capLocationsOfInterest:(unint64_t)a3 maxResults:
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    if (objc_msgSend(v5, "count") <= a3)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_290);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "subarrayWithRange:", 0, a3);
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __60__MapsSuggestionsRoutine_capLocationsOfInterest_maxResults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "visits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "visits");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "compare:", v10);

  return v11;
}

- (char)fetchAllSuggestedLOIsExcludingTypes:(id)a3 minVisits:(unint64_t)a4 maxAge:(double)a5 maxResults:(unint64_t)a6 handler:(id)a7
{
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  MapsSuggestionsLocationOfInterest *v18;
  MapsSuggestionsNetworkRequester *networkRequester;
  NSObject *v20;
  MapsSuggestionsLocationOfInterest *v21;
  NSObject *innerQueue;
  id v23;
  char v24;
  dispatch_group_t v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id obj;
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD v37[4];
  NSObject *v38;
  id v39;
  MapsSuggestionsLocationOfInterest *v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD block[4];
  id v47;
  id v48[2];
  id location[2];
  _QWORD aBlock[4];
  NSObject *v51;
  id v52;
  id v53;
  unint64_t v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v30 = a7;
  if (+[MapsSuggestionsSiri isEnabled](MapsSuggestionsSiri, "isEnabled"))
  {
    v26 = dispatch_group_create();
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __98__MapsSuggestionsRoutine_fetchAllSuggestedLOIsExcludingTypes_minVisits_maxAge_maxResults_handler___block_invoke;
    aBlock[3] = &unk_1E4BD0848;
    v12 = v26;
    v51 = v12;
    v54 = a4;
    v52 = v31;
    v29 = v11;
    v53 = v29;
    v13 = _Block_copy(aBlock);
    objc_initWeak(location, self);
    dispatch_group_enter(v12);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __98__MapsSuggestionsRoutine_fetchAllSuggestedLOIsExcludingTypes_minVisits_maxAge_maxResults_handler___block_invoke_295;
    block[3] = &unk_1E4BCFFB8;
    objc_copyWeak(v48, location);
    v48[1] = *(id *)&a5;
    v28 = v13;
    v47 = v28;
    dispatch_async((dispatch_queue_t)self->_queue._innerQueue, block);
    dispatch_group_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
    -[MapsSuggestionsRoutine capLocationsOfInterest:maxResults:]((uint64_t)self, v29, a6);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v27, "count"));
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    obj = v27;
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v43 != v16)
            objc_enumerationMutation(obj);
          v18 = -[MapsSuggestionsLocationOfInterest initWithLOI:]([MapsSuggestionsLocationOfInterest alloc], "initWithLOI:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i));
          dispatch_group_enter(v12);
          networkRequester = self->_networkRequester;
          v37[0] = MEMORY[0x1E0C809B0];
          v37[1] = 3221225472;
          v37[2] = __98__MapsSuggestionsRoutine_fetchAllSuggestedLOIsExcludingTypes_minVisits_maxAge_maxResults_handler___block_invoke_297;
          v37[3] = &unk_1E4BD0870;
          objc_copyWeak(&v41, location);
          v20 = v12;
          v38 = v20;
          v39 = v14;
          v21 = v18;
          v40 = v21;
          if (!-[MapsSuggestionsLocationOfInterest hydrateMapItemWithNetworkRequester:completion:](v21, "hydrateMapItemWithNetworkRequester:completion:", networkRequester, v37))dispatch_group_leave(v20);

          objc_destroyWeak(&v41);
        }
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
      }
      while (v15);
    }

    innerQueue = self->_queue._innerQueue;
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __98__MapsSuggestionsRoutine_fetchAllSuggestedLOIsExcludingTypes_minVisits_maxAge_maxResults_handler___block_invoke_299;
    v34[3] = &unk_1E4BCF070;
    v35 = v14;
    v36 = v30;
    v23 = v14;
    dispatch_group_notify(v12, innerQueue, v34);

    objc_destroyWeak(v48);
    objc_destroyWeak(location);

    v24 = 1;
  }
  else
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_DEBUG, "User turned off Siri Suggestions for maps. Not attempting to fetch shortcuts", (uint8_t *)location, 2u);
    }
    v24 = 0;
  }

  return v24;
}

void __98__MapsSuggestionsRoutine_fetchAllSuggestedLOIsExcludingTypes_minVisits_maxAge_maxResults_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  __CFString *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  NSObject *v26;
  uint64_t v27;
  id v28;
  __CFString *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  const __CFString *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v31 = v6;
  v32 = v5;
  if (!v5 || v6)
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v30 = CFSTR("NO");
      if (!v5)
        v30 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v45 = v30;
      v46 = 2112;
      v47 = v31;
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "LOIs: Error fetching LOIs. is LOIs nil? %@, Error: %@", buf, 0x16u);
    }
  }
  else
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v7 = v5;
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v36;
      v33 = a1;
      do
      {
        v34 = v8;
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v36 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_msgSend(v11, "visits", v31);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "count");

          if (v13 < *(_QWORD *)(a1 + 56))
          {
            GEOFindOrCreateLog();
            v14 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v11, "identifier");
              v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v45 = v15;
              v46 = 1024;
              LODWORD(v47) = v13;
              _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_DEBUG, "Skipping %@: only %u visits", buf, 0x12u);

            }
LABEL_11:

            continue;
          }
          objc_msgSend(v11, "mapItem");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16 == 0;

          if (v17)
          {
            GEOFindOrCreateLog();
            v14 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v11, "identifier");
              v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v45 = v29;
              _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_DEBUG, "Skipping %@: no mapItem", buf, 0xCu);

            }
            goto LABEL_11;
          }
          v18 = *(void **)(a1 + 40);
          if (v18 && objc_msgSend(v18, "count"))
          {
            v19 = *(void **)(a1 + 40);
            v20 = v11;
            v21 = v19;
            v39 = 0u;
            v40 = 0u;
            v41 = 0u;
            v42 = 0u;
            v22 = v21;
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v39, buf, 16);
            if (v23)
            {
              v24 = *(_QWORD *)v40;
              while (2)
              {
                for (j = 0; j != v23; ++j)
                {
                  if (*(_QWORD *)v40 != v24)
                    objc_enumerationMutation(v22);
                  v26 = v7;
                  v27 = objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * j), "integerValue");
                  if (shortcutTypeForRTLOIType(objc_msgSend(v20, "type")) == v27)
                  {

                    v7 = v26;
                    a1 = v33;

                    goto LABEL_29;
                  }
                  v7 = v26;
                }
                v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v39, buf, 16);
                a1 = v33;
                if (v23)
                  continue;
                break;
              }
            }

          }
          v28 = *(id *)(a1 + 48);
          objc_sync_enter(v28);
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v11);
          objc_sync_exit(v28);

LABEL_29:
          ;
        }
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      }
      while (v8);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __98__MapsSuggestionsRoutine_fetchAllSuggestedLOIsExcludingTypes_minVisits_maxAge_maxResults_handler___block_invoke_295(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  NSObject *v4;
  int v5;
  char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    MapsSuggestionsNowWithOffset(-*(double *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained[1], "fetchLocationsOfInterestVisitedSinceDate:withHandler:", v3, *(_QWORD *)(a1 + 32));

  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136446722;
      v6 = "MapsSuggestionsRoutine.mm";
      v7 = 1026;
      v8 = 832;
      v9 = 2082;
      v10 = "-[MapsSuggestionsRoutine fetchAllSuggestedLOIsExcludingTypes:minVisits:maxAge:maxResults:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }

  }
}

void __98__MapsSuggestionsRoutine_fetchAllSuggestedLOIsExcludingTypes_minVisits_maxAge_maxResults_handler___block_invoke_297(id *a1, void *a2)
{
  id v3;
  dispatch_queue_t *WeakRetained;
  NSObject *v5;
  _QWORD v6[4];
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  uint8_t buf[4];
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __98__MapsSuggestionsRoutine_fetchAllSuggestedLOIsExcludingTypes_minVisits_maxAge_maxResults_handler___block_invoke_298;
    v6[3] = &unk_1E4BCFF90;
    v7 = v3;
    v8 = a1[4];
    v9 = a1[5];
    v10 = a1[6];
    dispatch_async(WeakRetained[3], v6);

    v5 = v7;
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v12 = "MapsSuggestionsRoutine.mm";
      v13 = 1026;
      v14 = 850;
      v15 = 2082;
      v16 = "-[MapsSuggestionsRoutine fetchAllSuggestedLOIsExcludingTypes:minVisits:maxAge:maxResults:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __98__MapsSuggestionsRoutine_fetchAllSuggestedLOIsExcludingTypes_minVisits_maxAge_maxResults_handler___block_invoke_298(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    GEOFindOrCreateLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = 138412290;
      v5 = v3;
      _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_ERROR, "returnedError: %@", (uint8_t *)&v4, 0xCu);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", *(_QWORD *)(a1 + 56));
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void __98__MapsSuggestionsRoutine_fetchAllSuggestedLOIsExcludingTypes_minVisits_maxAge_maxResults_handler___block_invoke_299(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  (*(void (**)(uint64_t))(v1 + 16))(v1);

}

- (char)fetchSuggestedLOIsForTypes:(id)a3 minVisits:(unint64_t)a4 maxAge:(double)a5 maxResults:(unint64_t)a6 handler:(id)a7
{
  id v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  MapsSuggestionsLocationOfInterest *v23;
  MapsSuggestionsNetworkRequester *networkRequester;
  NSObject *v25;
  MapsSuggestionsLocationOfInterest *v26;
  NSObject *innerQueue;
  id v28;
  char v29;
  NSObject *v30;
  NSObject *v31;
  void *v33;
  dispatch_group_t v34;
  id v35;
  id v36;
  id v37;
  id obj;
  void *v39;
  _QWORD v40[4];
  id v41;
  id v42;
  _QWORD v43[4];
  NSObject *v44;
  id v45;
  MapsSuggestionsLocationOfInterest *v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD block[4];
  id v53;
  id v54[3];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD aBlock[4];
  NSObject *v60;
  id v61;
  unint64_t v62;
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE location[12];
  __int16 v66;
  int v67;
  __int16 v68;
  const char *v69;
  __int16 v70;
  const char *v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v37 = a3;
  v36 = a7;
  if (!v36)
  {
    GEOFindOrCreateLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      v66 = 1024;
      v67 = 881;
      v68 = 2082;
      v69 = "-[MapsSuggestionsRoutine fetchSuggestedLOIsForTypes:minVisits:maxAge:maxResults:handler:]";
      v70 = 2082;
      v71 = "nil == (handler)";
      _os_log_impl(&dword_1A427D000, v30, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", location, 0x26u);
    }

    goto LABEL_31;
  }
  if (!+[MapsSuggestionsSiri isEnabled](MapsSuggestionsSiri, "isEnabled"))
  {
    GEOFindOrCreateLog();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)location = 0;
      _os_log_impl(&dword_1A427D000, v31, OS_LOG_TYPE_DEBUG, "User turned off Siri Suggestions for maps. Not attempting to fetch shortcuts", location, 2u);
    }
    goto LABEL_30;
  }
  if (!v37 || !objc_msgSend(v37, "count"))
  {
    GEOFindOrCreateLog();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)location = 0;
      _os_log_impl(&dword_1A427D000, v31, OS_LOG_TYPE_DEBUG, "No types give to fetch. Not attempting to fetch shortcuts", location, 2u);
    }
LABEL_30:

LABEL_31:
    v29 = 0;
    goto LABEL_32;
  }
  objc_initWeak((id *)location, self);
  v34 = dispatch_group_create();
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__MapsSuggestionsRoutine_fetchSuggestedLOIsForTypes_minVisits_maxAge_maxResults_handler___block_invoke;
  aBlock[3] = &unk_1E4BD0898;
  v13 = v34;
  v60 = v13;
  v62 = a4;
  v35 = v12;
  v61 = v35;
  v39 = _Block_copy(aBlock);
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v14 = v37;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v56 != v16)
          objc_enumerationMutation(v14);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * i), "integerValue");
        dispatch_group_enter(v13);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __89__MapsSuggestionsRoutine_fetchSuggestedLOIsForTypes_minVisits_maxAge_maxResults_handler___block_invoke_300;
        block[3] = &unk_1E4BD08C0;
        objc_copyWeak(v54, (id *)location);
        v54[1] = v18;
        v53 = v39;
        v54[2] = *(id *)&a5;
        dispatch_async((dispatch_queue_t)self->_queue._innerQueue, block);

        objc_destroyWeak(v54);
      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
    }
    while (v15);
  }

  dispatch_group_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  -[MapsSuggestionsRoutine capLocationsOfInterest:maxResults:]((uint64_t)self, v35, a6);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v33, "count"));
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v33;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v63, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v49;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v49 != v21)
          objc_enumerationMutation(obj);
        v23 = -[MapsSuggestionsLocationOfInterest initWithLOI:]([MapsSuggestionsLocationOfInterest alloc], "initWithLOI:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * j));
        dispatch_group_enter(v13);
        networkRequester = self->_networkRequester;
        v43[0] = MEMORY[0x1E0C809B0];
        v43[1] = 3221225472;
        v43[2] = __89__MapsSuggestionsRoutine_fetchSuggestedLOIsForTypes_minVisits_maxAge_maxResults_handler___block_invoke_301;
        v43[3] = &unk_1E4BD0870;
        objc_copyWeak(&v47, (id *)location);
        v25 = v13;
        v44 = v25;
        v45 = v19;
        v26 = v23;
        v46 = v26;
        if (!-[MapsSuggestionsLocationOfInterest hydrateMapItemWithNetworkRequester:completion:](v26, "hydrateMapItemWithNetworkRequester:completion:", networkRequester, v43))dispatch_group_leave(v25);

        objc_destroyWeak(&v47);
      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v63, 16);
    }
    while (v20);
  }

  innerQueue = self->_queue._innerQueue;
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __89__MapsSuggestionsRoutine_fetchSuggestedLOIsForTypes_minVisits_maxAge_maxResults_handler___block_invoke_303;
  v40[3] = &unk_1E4BCF070;
  v41 = v19;
  v42 = v36;
  v28 = v19;
  dispatch_group_notify(v13, innerQueue, v40);

  objc_destroyWeak((id *)location);
  v29 = 1;
LABEL_32:

  return v29;
}

void __89__MapsSuggestionsRoutine_fetchSuggestedLOIsForTypes_minVisits_maxAge_maxResults_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  __CFString *v15;
  void *v16;
  _BOOL4 v17;
  __CFString *v18;
  NSObject *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  const __CFString *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v21 = v6;
  v22 = v5;
  if (!v5 || v6)
  {
    GEOFindOrCreateLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = CFSTR("NO");
      if (!v5)
        v20 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v29 = v20;
      v30 = 2112;
      v31 = v21;
      v7 = v19;
      _os_log_impl(&dword_1A427D000, v19, OS_LOG_TYPE_ERROR, "LOIs: Error fetching LOIs. is LOIs nil? %@, Error: %@", buf, 0x16u);
    }
    else
    {
      v7 = v19;
    }
  }
  else
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v7 = v5;
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v11, "visits", v21);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "count");

          if (v13 >= *(_QWORD *)(a1 + 48))
          {
            objc_msgSend(v11, "mapItem");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v16 == 0;

            if (!v17)
            {
              v14 = *(id *)(a1 + 40);
              objc_sync_enter(v14);
              objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
              objc_sync_exit(v14);
              goto LABEL_17;
            }
            GEOFindOrCreateLog();
            v14 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v11, "identifier");
              v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v29 = v18;
              _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_DEBUG, "Skipping %@: no mapItem", buf, 0xCu);

            }
          }
          else
          {
            GEOFindOrCreateLog();
            v14 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v11, "identifier");
              v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v29 = v15;
              v30 = 1024;
              LODWORD(v31) = v13;
              _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_DEBUG, "Skipping %@: only %u visits", buf, 0x12u);

            }
          }

LABEL_17:
        }
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v8);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __89__MapsSuggestionsRoutine_fetchSuggestedLOIsForTypes_minVisits_maxAge_maxResults_handler___block_invoke_300(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  int v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = 0;
    switch(*(_QWORD *)(a1 + 48))
    {
      case 0:
      case 1:
      case 6:
        MapsSuggestionsNowWithOffset(-*(double *)(a1 + 56));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3[1], "fetchLocationsOfInterestVisitedSinceDate:withHandler:", v5, *(_QWORD *)(a1 + 32));

        break;
      case 2:
        goto LABEL_9;
      case 3:
        v4 = 1;
        goto LABEL_9;
      case 5:
        v4 = 2;
LABEL_9:
        objc_msgSend(WeakRetained[1], "fetchLocationsOfInterestOfType:withHandler:", v4, *(_QWORD *)(a1 + 32));
        break;
      default:
        break;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 136446722;
      v8 = "MapsSuggestionsRoutine.mm";
      v9 = 1026;
      v10 = 924;
      v11 = 2082;
      v12 = "-[MapsSuggestionsRoutine fetchSuggestedLOIsForTypes:minVisits:maxAge:maxResults:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v7, 0x1Cu);
    }

  }
}

void __89__MapsSuggestionsRoutine_fetchSuggestedLOIsForTypes_minVisits_maxAge_maxResults_handler___block_invoke_301(id *a1, void *a2)
{
  id v3;
  dispatch_queue_t *WeakRetained;
  NSObject *v5;
  _QWORD v6[4];
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  uint8_t buf[4];
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __89__MapsSuggestionsRoutine_fetchSuggestedLOIsForTypes_minVisits_maxAge_maxResults_handler___block_invoke_302;
    v6[3] = &unk_1E4BCFF90;
    v7 = v3;
    v8 = a1[4];
    v9 = a1[5];
    v10 = a1[6];
    dispatch_async(WeakRetained[3], v6);

    v5 = v7;
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v12 = "MapsSuggestionsRoutine.mm";
      v13 = 1026;
      v14 = 957;
      v15 = 2082;
      v16 = "-[MapsSuggestionsRoutine fetchSuggestedLOIsForTypes:minVisits:maxAge:maxResults:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __89__MapsSuggestionsRoutine_fetchSuggestedLOIsForTypes_minVisits_maxAge_maxResults_handler___block_invoke_302(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    GEOFindOrCreateLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = 138412290;
      v5 = v3;
      _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_ERROR, "returnedError: %@", (uint8_t *)&v4, 0xCu);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", *(_QWORD *)(a1 + 56));
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void __89__MapsSuggestionsRoutine_fetchSuggestedLOIsForTypes_minVisits_maxAge_maxResults_handler___block_invoke_303(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  (*(void (**)(uint64_t))(v1 + 16))(v1);

}

- (char)fetchSuggestedShortcutsForType:(int64_t)a3 minVisits:(unint64_t)a4 maxAge:(double)a5 handler:(id)a6
{
  id v10;
  int64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *innerQueue;
  id v16;
  id v17;
  NSObject *v18;
  char v19;
  NSObject *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25[2];
  _QWORD aBlock[4];
  id v27;
  id v28[3];
  _BYTE location[12];
  __int16 v30;
  int v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  if (v10)
  {
    if (+[MapsSuggestionsSiri isEnabled](MapsSuggestionsSiri, "isEnabled"))
    {
      if ((unint64_t)a3 <= 1)
        v11 = 1;
      else
        v11 = a3;
      objc_initWeak((id *)location, self);
      v12 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __82__MapsSuggestionsRoutine_fetchSuggestedShortcutsForType_minVisits_maxAge_handler___block_invoke;
      aBlock[3] = &unk_1E4BD0910;
      v27 = v10;
      objc_copyWeak(v28, (id *)location);
      v28[1] = (id)a4;
      v28[2] = (id)v11;
      v13 = _Block_copy(aBlock);
      MapsSuggestionsNowWithOffset(-a5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v12;
      v22[1] = 3221225472;
      v22[2] = __82__MapsSuggestionsRoutine_fetchSuggestedShortcutsForType_minVisits_maxAge_handler___block_invoke_2;
      v22[3] = &unk_1E4BD0938;
      objc_copyWeak(v25, (id *)location);
      v25[1] = (id)v11;
      v23 = v14;
      v24 = v13;
      innerQueue = self->_queue._innerQueue;
      v16 = v14;
      v17 = v13;
      dispatch_async(innerQueue, v22);

      objc_destroyWeak(v25);
      objc_destroyWeak(v28);

      objc_destroyWeak((id *)location);
    }
    else
    {
      GEOFindOrCreateLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)location = 0;
        _os_log_impl(&dword_1A427D000, v20, OS_LOG_TYPE_DEBUG, "User turned off Siri Suggestions for maps. Not attempting to fetch shortcuts", location, 2u);
      }

      (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
    }
    v19 = 1;
  }
  else
  {
    GEOFindOrCreateLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      v30 = 1024;
      v31 = 988;
      v32 = 2082;
      v33 = "-[MapsSuggestionsRoutine fetchSuggestedShortcutsForType:minVisits:maxAge:handler:]";
      v34 = 2082;
      v35 = "nil == (handler)";
      _os_log_impl(&dword_1A427D000, v18, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", location, 0x26u);
    }

    v19 = 0;
  }

  return v19;
}

void __82__MapsSuggestionsRoutine_fetchSuggestedShortcutsForType_minVisits_maxAge_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  dispatch_queue_t *WeakRetained;
  NSObject *v9;
  const __CFString *v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  __int128 v16;
  uint8_t buf[4];
  char *v18;
  __int16 v19;
  _WORD v20[17];

  *(_QWORD *)&v20[13] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = CFSTR("NO");
      if (!v5)
        v10 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v18 = (char *)v10;
      v19 = 2112;
      *(_QWORD *)v20 = v7;
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "Shortcuts: Error fetching LOIs. is LOIs nil? %@, Error: %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __82__MapsSuggestionsRoutine_fetchSuggestedShortcutsForType_minVisits_maxAge_handler___block_invoke_304;
      block[3] = &unk_1E4BD08E8;
      objc_copyWeak(&v15, (id *)(a1 + 40));
      v13 = v5;
      v16 = *(_OWORD *)(a1 + 48);
      v14 = *(id *)(a1 + 32);
      dispatch_async(WeakRetained[3], block);

      objc_destroyWeak(&v15);
    }
    else
    {
      GEOFindOrCreateLog();
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v18 = "MapsSuggestionsRoutine.mm";
        v19 = 1026;
        *(_DWORD *)v20 = 1011;
        v20[2] = 2082;
        *(_QWORD *)&v20[3] = "-[MapsSuggestionsRoutine fetchSuggestedShortcutsForType:minVisits:maxAge:handler:]_block_invoke";
        _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: outerStrongSelf went away in %{public}s", buf, 0x1Cu);
      }

    }
  }

}

void __82__MapsSuggestionsRoutine_fetchSuggestedShortcutsForType_minVisits_maxAge_handler___block_invoke_304(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  char *v11;
  void *v12;
  _BOOL4 v13;
  MapsSuggestionsShortcut *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  char *v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  __int128 v23;
  void *v24;
  _QWORD *WeakRetained;
  NSObject *group;
  id obj;
  _QWORD block[4];
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  const char *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    group = dispatch_group_create();
    v2 = objc_msgSend(*(id *)(a1 + 32), "count");
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v2);
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    obj = *(id *)(a1 + 32);
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (!v3)
      goto LABEL_17;
    v5 = *(_QWORD *)v32;
    *(_QWORD *)&v4 = 138412290;
    v23 = v4;
    while (1)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v32 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v7, "visits", v23);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "count");

        if (v9 >= *(_QWORD *)(a1 + 56))
        {
          objc_msgSend(v7, "mapItem");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12 == 0;

          if (!v13)
          {
            v14 = [MapsSuggestionsShortcut alloc];
            v15 = *(_QWORD *)(a1 + 64);
            objc_msgSend(v7, "identifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "UUIDString");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "preferredName");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = -[MapsSuggestionsShortcut initWithType:identifier:geoMapItem:customName:](v14, "initWithType:identifier:geoMapItem:customName:", v15, v17, 0, v18);

            objc_msgSend(v24, "addObject:", v10);
            -[MapsSuggestionsRoutine _addMapItemToShortcut:fromLOI:group:]((uint64_t)WeakRetained, v10, v7, group);
            goto LABEL_15;
          }
          GEOFindOrCreateLog();
          v10 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v7, "identifier");
            v19 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v23;
            v37 = v19;
            _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_DEBUG, "Skipping %@: no mapItem", buf, 0xCu);

          }
        }
        else
        {
          GEOFindOrCreateLog();
          v10 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v7, "identifier");
            v11 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v37 = v11;
            v38 = 1024;
            v39 = v9;
            _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_DEBUG, "Skipping %@: only %u visits", buf, 0x12u);

          }
        }

LABEL_15:
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (!v3)
      {
LABEL_17:

        v20 = WeakRetained[3];
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __82__MapsSuggestionsRoutine_fetchSuggestedShortcutsForType_minVisits_maxAge_handler___block_invoke_306;
        block[3] = &unk_1E4BCF070;
        v21 = *(id *)(a1 + 40);
        v29 = v24;
        v30 = v21;
        v22 = v24;
        dispatch_group_notify(group, v20, block);

        goto LABEL_21;
      }
    }
  }
  GEOFindOrCreateLog();
  v22 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446722;
    v37 = "MapsSuggestionsRoutine.mm";
    v38 = 1026;
    v39 = 1013;
    v40 = 2082;
    v41 = "-[MapsSuggestionsRoutine fetchSuggestedShortcutsForType:minVisits:maxAge:handler:]_block_invoke";
    _os_log_impl(&dword_1A427D000, v22, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
  }
  group = v22;
LABEL_21:

}

uint64_t __82__MapsSuggestionsRoutine_fetchSuggestedShortcutsForType_minVisits_maxAge_handler___block_invoke_306(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __82__MapsSuggestionsRoutine_fetchSuggestedShortcutsForType_minVisits_maxAge_handler___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = 0;
    switch(*(_QWORD *)(a1 + 56))
    {
      case 0:
      case 1:
      case 6:
        objc_msgSend(WeakRetained[1], "fetchLocationsOfInterestVisitedSinceDate:withHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
        break;
      case 2:
        goto LABEL_9;
      case 3:
        v4 = 1;
        goto LABEL_9;
      case 5:
        v4 = 2;
LABEL_9:
        objc_msgSend(WeakRetained[1], "fetchLocationsOfInterestOfType:withHandler:", v4, *(_QWORD *)(a1 + 40));
        break;
      default:
        break;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446722;
      v7 = "MapsSuggestionsRoutine.mm";
      v8 = 1026;
      v9 = 1045;
      v10 = 2082;
      v11 = "-[MapsSuggestionsRoutine fetchSuggestedShortcutsForType:minVisits:maxAge:handler:]_block_invoke_2";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }

  }
}

- (char)readMeCardWithMinVisits:(unint64_t)a3 maxAge:(double)a4 handler:(id)a5
{
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *innerQueue;
  id v15;
  NSObject *v16;
  NSObject *v17;
  char v18;
  NSObject *v19;
  uint8_t v21[16];
  _QWORD block[4];
  id v23;
  id v24;
  id v25;
  _QWORD aBlock[4];
  id v27;
  id v28[2];
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  const char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  GEOFindOrCreateLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_DEBUG, "ASYNC FAILURE INVESTIGATION: Entering method readMeCardWithMinVisits", buf, 2u);
  }

  if (v8)
  {
    if (+[MapsSuggestionsSiri isEnabled](MapsSuggestionsSiri, "isEnabled"))
    {
      objc_initWeak((id *)buf, self);
      v10 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __65__MapsSuggestionsRoutine_readMeCardWithMinVisits_maxAge_handler___block_invoke;
      aBlock[3] = &unk_1E4BD0960;
      v27 = v8;
      objc_copyWeak(v28, (id *)buf);
      v28[1] = (id)a3;
      v11 = _Block_copy(aBlock);
      MapsSuggestionsNowWithOffset(-a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      block[0] = v10;
      block[1] = 3221225472;
      block[2] = __65__MapsSuggestionsRoutine_readMeCardWithMinVisits_maxAge_handler___block_invoke_310;
      block[3] = &unk_1E4BCE780;
      objc_copyWeak(&v25, (id *)buf);
      v23 = v12;
      v13 = v11;
      v24 = v13;
      innerQueue = self->_queue._innerQueue;
      v15 = v12;
      dispatch_async(innerQueue, block);
      GEOFindOrCreateLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_DEBUG, "ASYNC FAILURE INVESTIGATION: Calling back", v21, 2u);
      }

      objc_destroyWeak(&v25);
      objc_destroyWeak(v28);

      objc_destroyWeak((id *)buf);
    }
    else
    {
      GEOFindOrCreateLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A427D000, v19, OS_LOG_TYPE_DEBUG, "User turned off Siri Suggestions for maps. Not attempting to fetch shortcuts for MeCard", buf, 2u);
      }

      (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, 0, 0);
    }
    v18 = 1;
  }
  else
  {
    GEOFindOrCreateLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v30 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      v31 = 1024;
      v32 = 1072;
      v33 = 2082;
      v34 = "-[MapsSuggestionsRoutine readMeCardWithMinVisits:maxAge:handler:]";
      v35 = 2082;
      v36 = "nil == (handler)";
      _os_log_impl(&dword_1A427D000, v17, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
    }

    v18 = 0;
  }

  return v18;
}

void __65__MapsSuggestionsRoutine_readMeCardWithMinVisits_maxAge_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  dispatch_queue_t *WeakRetained;
  NSObject *v9;
  id v10;
  void *v11;
  NSObject *v12;
  const __CFString *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18[2];
  uint8_t buf[4];
  char *v20;
  __int16 v21;
  _WORD v22[17];

  *(_QWORD *)&v22[13] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = CFSTR("NO");
      if (!v5)
        v13 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v20 = (char *)v13;
      v21 = 2112;
      *(_QWORD *)v22 = v7;
      _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "MeCard: Error fetching LOIs. is LOIs nil? %@, Error: %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      GEOFindOrCreateLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_DEBUG, "ASYNC FAILURE INVESTIGATION: Entering queue", buf, 2u);
      }

      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __65__MapsSuggestionsRoutine_readMeCardWithMinVisits_maxAge_handler___block_invoke_307;
      v15[3] = &unk_1E4BCE820;
      objc_copyWeak(v18, (id *)(a1 + 40));
      v10 = v5;
      v11 = *(void **)(a1 + 48);
      v16 = v10;
      v18[1] = v11;
      v17 = *(id *)(a1 + 32);
      dispatch_async(WeakRetained[3], v15);

      objc_destroyWeak(v18);
    }
    else
    {
      GEOFindOrCreateLog();
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v20 = "MapsSuggestionsRoutine.mm";
        v21 = 1026;
        *(_DWORD *)v22 = 1090;
        v22[2] = 2082;
        *(_QWORD *)&v22[3] = "-[MapsSuggestionsRoutine readMeCardWithMinVisits:maxAge:handler:]_block_invoke";
        _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: outerStrongSelf went away in %{public}s", buf, 0x1Cu);
      }

    }
  }

}

void __65__MapsSuggestionsRoutine_readMeCardWithMinVisits_maxAge_handler___block_invoke_307(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  char *v12;
  MapsSuggestionsShortcut *v13;
  MapsSuggestionsShortcut *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  __int128 v22;
  void *v23;
  _QWORD *WeakRetained;
  NSObject *group;
  id obj;
  uint64_t v27;
  _QWORD block[4];
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  const char *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    group = dispatch_group_create();
    v2 = objc_msgSend(*(id *)(a1 + 32), "count");
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v2);
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    v27 = a1;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "ASYNC FAILURE INVESTIGATION: Starting to loop over shortcuts", buf, 2u);
    }

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    obj = *(id *)(a1 + 32);
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v4)
    {
      v6 = *(_QWORD *)v32;
      *(_QWORD *)&v5 = 138412546;
      v22 = v5;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v32 != v6)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(v8, "visits", v22);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "count");

          if (v10 >= *(_QWORD *)(v27 + 56))
          {
            v14 = [MapsSuggestionsShortcut alloc];
            v15 = shortcutTypeForRTLOIType(objc_msgSend(v8, "type"));
            objc_msgSend(v8, "identifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "UUIDString");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "preferredName");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = -[MapsSuggestionsShortcut initWithType:identifier:geoMapItem:customName:](v14, "initWithType:identifier:geoMapItem:customName:", v15, v17, 0, v18);

            GEOFindOrCreateLog();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v37 = (char *)v13;
              _os_log_impl(&dword_1A427D000, v19, OS_LOG_TYPE_DEBUG, "ASYNC FAILURE INVESTIGATION: Shortcut %@ created", buf, 0xCu);
            }

            objc_msgSend(v23, "addObject:", v13);
            -[MapsSuggestionsRoutine _addMapItemToShortcut:fromLOI:group:]((uint64_t)WeakRetained, v13, v8, group);
            GEOFindOrCreateLog();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v37 = (char *)v13;
              _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_DEBUG, "ASYNC FAILURE INVESTIGATION: Added MapItem to shortcut: %@", buf, 0xCu);
            }
          }
          else
          {
            GEOFindOrCreateLog();
            v11 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v8, "identifier");
              v12 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v22;
              v37 = v12;
              v38 = 1024;
              v39 = v10;
              _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_DEBUG, "Skipping %@: only %u visits", buf, 0x12u);

            }
            v13 = (MapsSuggestionsShortcut *)v11;
          }

        }
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v4);
    }

    v20 = WeakRetained[3];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__MapsSuggestionsRoutine_readMeCardWithMinVisits_maxAge_handler___block_invoke_308;
    block[3] = &unk_1E4BCE138;
    v29 = v23;
    v30 = *(id *)(v27 + 40);
    v21 = v23;
    dispatch_group_notify(group, v20, block);

  }
  else
  {
    GEOFindOrCreateLog();
    v21 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v37 = "MapsSuggestionsRoutine.mm";
      v38 = 1026;
      v39 = 1093;
      v40 = 2082;
      v41 = "-[MapsSuggestionsRoutine readMeCardWithMinVisits:maxAge:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v21, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
    group = v21;
  }

}

void __65__MapsSuggestionsRoutine_readMeCardWithMinVisits_maxAge_handler___block_invoke_308(uint64_t a1)
{
  MapsSuggestionsMeCard *v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = -[MapsSuggestionsMeCard initWithShortcuts:hasCorrected:hasGeocoded:]([MapsSuggestionsMeCard alloc], "initWithShortcuts:hasCorrected:hasGeocoded:", *(_QWORD *)(a1 + 32), 1, 1);
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "ASYNC FAILURE INVESTIGATION: Calling Handler", v4, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __65__MapsSuggestionsRoutine_readMeCardWithMinVisits_maxAge_handler___block_invoke_310(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v3;
  NSObject *v4;
  int v5;
  char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v5) = 0;
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "ASYNC FAILURE INVESTIGATION: Beginning to fetch locations of interest", (uint8_t *)&v5, 2u);
    }

    objc_msgSend(WeakRetained[1], "fetchLocationsOfInterestVisitedSinceDate:withHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v5) = 0;
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "ASYNC FAILURE INVESTIGATION: Just fetched locations of interest", (uint8_t *)&v5, 2u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136446722;
      v6 = "MapsSuggestionsRoutine.mm";
      v7 = 1026;
      v8 = 1128;
      v9 = 2082;
      v10 = "-[MapsSuggestionsRoutine readMeCardWithMinVisits:maxAge:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }

  }
}

- (void)updateFixedLOIs
{
  NSMutableDictionary *v3;
  MapsSuggestionsRoutineConnector *connector;
  uint64_t v5;
  NSMutableDictionary *v6;
  MapsSuggestionsRoutineConnector *v7;
  NSMutableDictionary *v8;
  MapsSuggestionsRoutineConnector *v9;
  NSObject *v10;
  _QWORD v11[4];
  NSObject *v12;
  id v13;
  _QWORD v14[4];
  NSMutableDictionary *v15;
  id v16;
  _QWORD v17[4];
  NSMutableDictionary *v18;
  id v19;
  uint8_t buf[8];
  id location;

  objc_initWeak(&location, self);
  if (+[MapsSuggestionsSiri isEnabled](MapsSuggestionsSiri, "isEnabled"))
  {
    v3 = self->_loiVisits;
    connector = self->_connector;
    v5 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __41__MapsSuggestionsRoutine_updateFixedLOIs__block_invoke;
    v17[3] = &unk_1E4BD0A90;
    objc_copyWeak(&v19, &location);
    v6 = v3;
    v18 = v6;
    -[MapsSuggestionsRoutineConnector fetchLocationsOfInterestOfType:withHandler:](connector, "fetchLocationsOfInterestOfType:withHandler:", 0, v17);
    v7 = self->_connector;
    v14[0] = v5;
    v14[1] = 3221225472;
    v14[2] = __41__MapsSuggestionsRoutine_updateFixedLOIs__block_invoke_2;
    v14[3] = &unk_1E4BD0A90;
    objc_copyWeak(&v16, &location);
    v8 = v6;
    v15 = v8;
    -[MapsSuggestionsRoutineConnector fetchLocationsOfInterestOfType:withHandler:](v7, "fetchLocationsOfInterestOfType:withHandler:", 1, v14);
    v9 = self->_connector;
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __41__MapsSuggestionsRoutine_updateFixedLOIs__block_invoke_2_314;
    v11[3] = &unk_1E4BD0A90;
    objc_copyWeak(&v13, &location);
    v10 = v8;
    v12 = v10;
    -[MapsSuggestionsRoutineConnector fetchLocationsOfInterestOfType:withHandler:](v9, "fetchLocationsOfInterestOfType:withHandler:", 2, v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&v16);

    objc_destroyWeak(&v19);
  }
  else
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_DEBUG, "User turned off Siri Suggestions for maps. Not attempting to update LOIs", buf, 2u);
    }
  }

  objc_destroyWeak(&location);
}

void __41__MapsSuggestionsRoutine_updateFixedLOIs__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char *v6;
  id WeakRetained;
  _QWORD *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      GEOFindOrCreateLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v6;
        _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "Error getting Home LOIs: %@", buf, 0xCu);
      }
    }
    else
    {
      v10 = *((id *)WeakRetained + 6);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __41__MapsSuggestionsRoutine_updateFixedLOIs__block_invoke_311;
      block[3] = &unk_1E4BCE690;
      v13 = v10;
      v14 = v5;
      v15 = *(id *)(a1 + 32);
      v11 = v8[3];
      v9 = v10;
      dispatch_async(v11, block);

    }
  }
  else
  {
    GEOFindOrCreateLog();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v17 = "MapsSuggestionsRoutine.mm";
      v18 = 1026;
      v19 = 1150;
      v20 = 2082;
      v21 = "-[MapsSuggestionsRoutine updateFixedLOIs]_block_invoke";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __41__MapsSuggestionsRoutine_updateFixedLOIs__block_invoke_311(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = *(id *)(a1 + 40);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v22;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v22 != v3)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v4);
        v6 = *(void **)(a1 + 32);
        v7 = objc_alloc(MEMORY[0x1E0C9E3B8]);
        objc_msgSend(v5, "location");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "latitude");
        v10 = v9;
        objc_msgSend(v5, "location");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "longitude");
        v13 = (void *)objc_msgSend(v7, "initWithLatitude:longitude:", v10, v12);
        objc_msgSend(v5, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKey:", v13, v14);

        v15 = *(void **)(a1 + 48);
        v16 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v5, "visits");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v17, "count"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKey:", v18, v19);

        if (MapsSuggestionsSawHomeOrWorkOnThisDevice::s_onceToken != -1)
          dispatch_once(&MapsSuggestionsSawHomeOrWorkOnThisDevice::s_onceToken, &__block_literal_global_25);
        ++v4;
      }
      while (v2 != v4);
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v2);
  }

}

void __41__MapsSuggestionsRoutine_updateFixedLOIs__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char *v6;
  id WeakRetained;
  _QWORD *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      GEOFindOrCreateLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v6;
        _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "Error getting Work LOIs: %@", buf, 0xCu);
      }
    }
    else
    {
      v10 = *((id *)WeakRetained + 7);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __41__MapsSuggestionsRoutine_updateFixedLOIs__block_invoke_313;
      block[3] = &unk_1E4BCE690;
      v13 = v10;
      v14 = v5;
      v15 = *(id *)(a1 + 32);
      v11 = v8[3];
      v9 = v10;
      dispatch_async(v11, block);

    }
  }
  else
  {
    GEOFindOrCreateLog();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v17 = "MapsSuggestionsRoutine.mm";
      v18 = 1026;
      v19 = 1170;
      v20 = 2082;
      v21 = "-[MapsSuggestionsRoutine updateFixedLOIs]_block_invoke_2";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __41__MapsSuggestionsRoutine_updateFixedLOIs__block_invoke_313(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = *(id *)(a1 + 40);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v22;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v22 != v3)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v4);
        v6 = *(void **)(a1 + 32);
        v7 = objc_alloc(MEMORY[0x1E0C9E3B8]);
        objc_msgSend(v5, "location");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "latitude");
        v10 = v9;
        objc_msgSend(v5, "location");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "longitude");
        v13 = (void *)objc_msgSend(v7, "initWithLatitude:longitude:", v10, v12);
        objc_msgSend(v5, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKey:", v13, v14);

        v15 = *(void **)(a1 + 48);
        v16 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v5, "visits");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v17, "count"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKey:", v18, v19);

        if (MapsSuggestionsSawHomeOrWorkOnThisDevice::s_onceToken != -1)
          dispatch_once(&MapsSuggestionsSawHomeOrWorkOnThisDevice::s_onceToken, &__block_literal_global_25);
        ++v4;
      }
      while (v2 != v4);
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v2);
  }

}

void __41__MapsSuggestionsRoutine_updateFixedLOIs__block_invoke_2_314(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char *v6;
  id WeakRetained;
  _QWORD *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      GEOFindOrCreateLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v6;
        _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "Error getting School LOIs: %@", buf, 0xCu);
      }
    }
    else
    {
      v10 = *((id *)WeakRetained + 8);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __41__MapsSuggestionsRoutine_updateFixedLOIs__block_invoke_315;
      block[3] = &unk_1E4BCE690;
      v13 = v10;
      v14 = v5;
      v15 = *(id *)(a1 + 32);
      v11 = v8[3];
      v9 = v10;
      dispatch_async(v11, block);

    }
  }
  else
  {
    GEOFindOrCreateLog();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v17 = "MapsSuggestionsRoutine.mm";
      v18 = 1026;
      v19 = 1190;
      v20 = 2082;
      v21 = "-[MapsSuggestionsRoutine updateFixedLOIs]_block_invoke_2";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __41__MapsSuggestionsRoutine_updateFixedLOIs__block_invoke_315(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = *(id *)(a1 + 40);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v22;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v22 != v3)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v4);
        v6 = *(void **)(a1 + 32);
        v7 = objc_alloc(MEMORY[0x1E0C9E3B8]);
        objc_msgSend(v5, "location");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "latitude");
        v10 = v9;
        objc_msgSend(v5, "location");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "longitude");
        v13 = (void *)objc_msgSend(v7, "initWithLatitude:longitude:", v10, v12);
        objc_msgSend(v5, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKey:", v13, v14);

        v15 = *(void **)(a1 + 48);
        v16 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v5, "visits");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v17, "count"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKey:", v18, v19);

        if (MapsSuggestionsSawHomeOrWorkOnThisDevice::s_onceToken != -1)
          dispatch_once(&MapsSuggestionsSawHomeOrWorkOnThisDevice::s_onceToken, &__block_literal_global_25);
        ++v4;
      }
      while (v2 != v4);
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v2);
  }

}

- (unint64_t)countHomeLOIs
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__MapsSuggestionsRoutine_countHomeLOIs__block_invoke;
  v3[3] = &unk_1E4BD0988;
  v3[4] = self;
  return MSg::Queue::sync<unsigned long>((NSObject **)&self->_queue, v3);
}

uint64_t __39__MapsSuggestionsRoutine_countHomeLOIs__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count");
}

- (unint64_t)countWorkLOIs
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__MapsSuggestionsRoutine_countWorkLOIs__block_invoke;
  v3[3] = &unk_1E4BD0988;
  v3[4] = self;
  return MSg::Queue::sync<unsigned long>((NSObject **)&self->_queue, v3);
}

uint64_t __39__MapsSuggestionsRoutine_countWorkLOIs__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "count");
}

- (unint64_t)countSchoolLOIs
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__MapsSuggestionsRoutine_countSchoolLOIs__block_invoke;
  v3[3] = &unk_1E4BD0988;
  v3[4] = self;
  return MSg::Queue::sync<unsigned long>((NSObject **)&self->_queue, v3);
}

uint64_t __41__MapsSuggestionsRoutine_countSchoolLOIs__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "count");
}

- (char)fetchLastVisitAtLocation:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  MapsSuggestionsRoutineConnector *connector;
  NSObject *v10;
  char v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  _BYTE location[12];
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    if (v6)
    {
      objc_initWeak((id *)location, self);
      connector = self->_connector;
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __59__MapsSuggestionsRoutine_fetchLastVisitAtLocation_handler___block_invoke_2;
      v13[3] = &unk_1E4BD09B0;
      objc_copyWeak(&v16, (id *)location);
      v14 = v6;
      v15 = v8;
      -[MapsSuggestionsRoutineConnector fetchLocationOfInterestAtLocation:withHandler:](connector, "fetchLocationOfInterestAtLocation:withHandler:", v14, v13);

      objc_destroyWeak(&v16);
      objc_destroyWeak((id *)location);
    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __59__MapsSuggestionsRoutine_fetchLastVisitAtLocation_handler___block_invoke;
      block[3] = &unk_1E4BCE348;
      v18 = v7;
      dispatch_async((dispatch_queue_t)self->_queue._innerQueue, block);

    }
    v11 = 1;
  }
  else
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      v20 = 1024;
      v21 = 1232;
      v22 = 2082;
      v23 = "-[MapsSuggestionsRoutine fetchLastVisitAtLocation:handler:]";
      v24 = 2082;
      v25 = "nil == (handler)";
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", location, 0x26u);
    }

    v11 = 0;
  }

  return v11;
}

void __59__MapsSuggestionsRoutine_fetchLastVisitAtLocation_handler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -12, CFSTR("The location was nil; We have not visited nil."));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD))(v1 + 16))(v1, 0, 0);

}

void __59__MapsSuggestionsRoutine_fetchLastVisitAtLocation_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  dispatch_queue_t *WeakRetained;
  char *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  char *v12;
  NSObject *v13;
  id *v14;
  _QWORD v15[4];
  char *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD block[4];
  char *v21;
  NSObject *v22;
  uint8_t buf[4];
  char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v6)
    {
      v8 = (char *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Error getting LOI at %@: %@"), *(_QWORD *)(a1 + 32), v6);
      GEOFindOrCreateLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v8;
        _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }

      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __59__MapsSuggestionsRoutine_fetchLastVisitAtLocation_handler___block_invoke_323;
      block[3] = &unk_1E4BCF070;
      v10 = *(id *)(a1 + 40);
      v21 = v8;
      v22 = v10;
      v11 = WeakRetained[3];
      v12 = v8;
      dispatch_async(v11, block);

      v13 = v22;
    }
    else
    {
      objc_msgSend(v5, "visits");
      v12 = (char *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "count"))
      {
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __59__MapsSuggestionsRoutine_fetchLastVisitAtLocation_handler___block_invoke_3;
        v15[3] = &unk_1E4BCF070;
        v17 = *(id *)(a1 + 40);
        v16 = v12;
        dispatch_async(WeakRetained[3], v15);

        v14 = &v17;
      }
      else
      {
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __59__MapsSuggestionsRoutine_fetchLastVisitAtLocation_handler___block_invoke_2_324;
        v18[3] = &unk_1E4BCE348;
        v14 = &v19;
        v19 = *(id *)(a1 + 40);
        dispatch_async(WeakRetained[3], v18);
      }
      v13 = *v14;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v24 = "MapsSuggestionsRoutine.mm";
      v25 = 1026;
      v26 = 1245;
      v27 = 2082;
      v28 = "-[MapsSuggestionsRoutine fetchLastVisitAtLocation:handler:]_block_invoke_2";
      _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
    v12 = (char *)v13;
  }

}

void __59__MapsSuggestionsRoutine_fetchLastVisitAtLocation_handler___block_invoke_323(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -15, *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD))(v1 + 16))(v1, 0, 0);

}

uint64_t __59__MapsSuggestionsRoutine_fetchLastVisitAtLocation_handler___block_invoke_2_324(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __59__MapsSuggestionsRoutine_fetchLastVisitAtLocation_handler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "lastObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "entryDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exitDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *, _QWORD))(v2 + 16))(v2, v3, v5, 0);

}

- (void)_cacheEntryExitDatesFromVisit:(void *)a3 forMapItemIdentifier:(void *)a4 name:
{
  id v7;
  id v8;
  id v9;
  char BOOL;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  BOOL = GEOConfigGetBOOL();
  v11 = *(void **)(a1 + 80);
  if ((BOOL & 1) != 0)
  {
    if (!v11)
    {
      v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v13 = *(void **)(a1 + 80);
      *(_QWORD *)(a1 + 80) = v12;

    }
    if (!*(_QWORD *)(a1 + 88))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *(void **)(a1 + 88);
      *(_QWORD *)(a1 + 88) = v14;

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = v7;
      objc_msgSend(v16, "entry");
      v17 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "exit");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17 && v18)
      {
        v31[0] = v17;
        v31[1] = v18;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 80), "setObject:forKeyedSubscript:", v19, v8);

        GEOFindOrCreateLog();
        v20 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(*(id *)(a1 + 80), "objectForKeyedSubscript:", v8);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "description");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 138412802;
          v26 = v21;
          v27 = 2112;
          v28 = v9;
          v29 = 2112;
          v30 = v22;
          _os_log_impl(&dword_1A427D000, v20, OS_LOG_TYPE_DEBUG, "Caching dates %@ for %@, %@", (uint8_t *)&v25, 0x20u);

        }
        goto LABEL_16;
      }
    }
    else
    {
      v18 = 0;
      v17 = 0;
    }
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 80), "setObject:forKeyedSubscript:", v24, v8);

LABEL_16:
    goto LABEL_17;
  }
  *(_QWORD *)(a1 + 80) = 0;

  v23 = *(void **)(a1 + 88);
  *(_QWORD *)(a1 + 88) = 0;

  GEOFindOrCreateLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v25) = 0;
    _os_log_impl(&dword_1A427D000, v17, OS_LOG_TYPE_DEBUG, "Caching of visits from Routine is disabled. Returning.", (uint8_t *)&v25, 2u);
  }
LABEL_17:

}

void __44__MapsSuggestionsRoutine__fetchStoredVisits__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    GEOFindOrCreateLog();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "Got %@ visits from CoreRoutine. About to Signal the Semaphore.", (uint8_t *)&v10, 0xCu);

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (char)fetchLastVisitAtMapItem:(id)a3 withinDistance:(double)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int BOOL;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  char v23;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28[2];
  _QWORD v29[4];
  id v30;
  _BYTE *v31;
  _QWORD block[5];
  id v33;
  _BYTE *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  _QWORD v41[4];
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  uint64_t v46;
  _BYTE v47[40];
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (v9)
  {
    if (!v8
      || (objc_msgSend(v8, "_identifier"), v10 = (void *)objc_claimAutoreleasedReturnValue(), v10, !v10))
    {
      objc_msgSend(v8, "_identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
        GEOFindOrCreateLog();
        v20 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v8, "name");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v47 = 138412290;
          *(_QWORD *)&v47[4] = v21;
          _os_log_impl(&dword_1A427D000, v20, OS_LOG_TYPE_ERROR, "mapItemIdentifier is nil for %@", v47, 0xCu);

        }
      }
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __73__MapsSuggestionsRoutine_fetchLastVisitAtMapItem_withinDistance_handler___block_invoke;
      v41[3] = &unk_1E4BCE348;
      v42 = v9;
      dispatch_async((dispatch_queue_t)self->_queue._innerQueue, v41);

      goto LABEL_19;
    }
    BOOL = GEOConfigGetBOOL();
    v12 = MEMORY[0x1E0C809B0];
    if (BOOL)
    {
      GEOConfigGetDouble();
      v14 = v13;
      v37 = 0;
      v38 = &v37;
      v39 = 0x2020000000;
      v40 = 0;
      *(_QWORD *)v47 = 0;
      *(_QWORD *)&v47[8] = v47;
      *(_QWORD *)&v47[16] = 0x3032000000;
      *(_QWORD *)&v47[24] = __Block_byref_object_copy__329;
      *(_QWORD *)&v47[32] = __Block_byref_object_dispose__330;
      v48 = 0;
      dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue._innerQueue);
      block[0] = v12;
      block[1] = 3221225472;
      block[2] = __73__MapsSuggestionsRoutine_fetchLastVisitAtMapItem_withinDistance_handler___block_invoke_2;
      block[3] = &unk_1E4BD0A00;
      block[4] = self;
      v36 = v14;
      v15 = v8;
      v33 = v15;
      v34 = v47;
      v35 = &v37;
      dispatch_sync((dispatch_queue_t)self->_queue._innerQueue, block);
      if (*((_BYTE *)v38 + 24))
      {
        GEOFindOrCreateLog();
        v16 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v15, "name");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = *(_QWORD *)(*(_QWORD *)&v47[8] + 40);
          *(_DWORD *)buf = 138412546;
          v44 = v17;
          v45 = 2112;
          v46 = v18;
          _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_DEBUG, "Returning cached dates for the visit to %@ instead of querying Routine. %@", buf, 0x16u);

        }
        v29[0] = v12;
        v29[1] = 3221225472;
        v29[2] = __73__MapsSuggestionsRoutine_fetchLastVisitAtMapItem_withinDistance_handler___block_invoke_333;
        v29[3] = &unk_1E4BCDE48;
        v31 = v47;
        v30 = v9;
        dispatch_async((dispatch_queue_t)self->_queue._innerQueue, v29);

        _Block_object_dispose(v47, 8);
        _Block_object_dispose(&v37, 8);
        goto LABEL_19;
      }

      _Block_object_dispose(v47, 8);
      _Block_object_dispose(&v37, 8);
    }
    objc_initWeak((id *)v47, self);
    v25[0] = v12;
    v25[1] = 3221225472;
    v25[2] = __73__MapsSuggestionsRoutine_fetchLastVisitAtMapItem_withinDistance_handler___block_invoke_2_334;
    v25[3] = &unk_1E4BCE820;
    objc_copyWeak(v28, (id *)v47);
    v26 = v8;
    v27 = v9;
    v28[1] = *(id *)&a4;
    dispatch_async((dispatch_queue_t)self->_queue._innerQueue, v25);

    objc_destroyWeak(v28);
    objc_destroyWeak((id *)v47);
LABEL_19:
    v23 = 1;
    goto LABEL_20;
  }
  GEOFindOrCreateLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v47 = 136446978;
    *(_QWORD *)&v47[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
    *(_WORD *)&v47[12] = 1024;
    *(_DWORD *)&v47[14] = 1407;
    *(_WORD *)&v47[18] = 2082;
    *(_QWORD *)&v47[20] = "-[MapsSuggestionsRoutine fetchLastVisitAtMapItem:withinDistance:handler:]";
    *(_WORD *)&v47[28] = 2082;
    *(_QWORD *)&v47[30] = "nil == (handler)";
    _os_log_impl(&dword_1A427D000, v22, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", v47, 0x26u);
  }

  v23 = 0;
LABEL_20:

  return v23;
}

void __73__MapsSuggestionsRoutine_fetchLastVisitAtMapItem_withinDistance_handler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -12, CFSTR("The mapItem was nil; We have not visited nil."));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD))(v1 + 16))(v1, 0, 0);

}

void __73__MapsSuggestionsRoutine_fetchLastVisitAtMapItem_withinDistance_handler___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  if (v2 && MapsSuggestionsSecondsSince(v2) > *(double *)(a1 + 64))
  {
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v4 = *(_QWORD *)(a1 + 64);
      v15 = 134217984;
      v16 = v4;
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "Resetting the cache. We do this every %g seconds", (uint8_t *)&v15, 0xCu);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeAllObjects");
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) = 0;

  }
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88))
  {
    objc_msgSend(*(id *)(a1 + 40), "_identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
      objc_msgSend(*(id *)(a1 + 40), "_identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v7) = v9 == 0;

      if ((v7 & 1) == 0)
      {
        v10 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
        objc_msgSend(*(id *)(a1 + 40), "_identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v11);
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v14 = *(void **)(v13 + 40);
        *(_QWORD *)(v13 + 40) = v12;

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          && objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count") == 2)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
        }
      }
    }
  }
}

void __73__MapsSuggestionsRoutine_fetchLastVisitAtMapItem_withinDistance_handler___block_invoke_333(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count") == 2
    && (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectAtIndexedSubscript:", 0),
        (v2 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v6 = (id)v2,
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectAtIndexedSubscript:", 1),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v6,
        v3))
  {
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectAtIndexedSubscript:", 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectAtIndexedSubscript:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void *, _QWORD))(v4 + 16))(v4, v7, v5, 0);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

void __73__MapsSuggestionsRoutine_fetchLastVisitAtMapItem_withinDistance_handler___block_invoke_2_334(uint64_t a1)
{
  id WeakRetained;
  double *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  dispatch_semaphore_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  uint64_t Integer;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  double v38;
  void *v39;
  id v40;
  id v41;
  NSObject *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  void *v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  CLLocationDegrees v53;
  void *v54;
  CLLocationDegrees v55;
  CLLocationCoordinate2D v56;
  double v57;
  void *v58;
  void *v59;
  BOOL v60;
  NSObject *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  NSObject *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  NSObject *v77;
  uint64_t v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE buf[32];
  NSObject *v84;
  __int128 *v85;
  __int128 *v86;
  __int128 v87;
  uint64_t v88;
  uint64_t (*v89)(uint64_t, uint64_t);
  void (*v90)(uint64_t);
  id v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = (double *)WeakRetained;
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(*((dispatch_queue_t *)WeakRetained + 3));
    *(_QWORD *)&v79 = 0;
    *((_QWORD *)&v79 + 1) = &v79;
    *(_QWORD *)&v80 = 0x3032000000;
    *((_QWORD *)&v80 + 1) = __Block_byref_object_copy__329;
    *(_QWORD *)&v81 = __Block_byref_object_dispose__330;
    *((_QWORD *)&v81 + 1) = 0;
    *(_QWORD *)&v87 = 0;
    *((_QWORD *)&v87 + 1) = &v87;
    v88 = 0x3032000000;
    v89 = __Block_byref_object_copy__329;
    v90 = __Block_byref_object_dispose__330;
    v91 = 0;
    v4 = (void *)*((_QWORD *)v3 + 12);
    v78 = a1;
    if (!v4 || MapsSuggestionsSecondsSince(v4) > v3[13])
    {
      GEOFindOrCreateLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        v6 = *((_QWORD *)v3 + 13);
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v6;
        _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "Calling fetchStoredVisitsWithOptions again. We do this every %g seconds", buf, 0xCu);
      }

      v7 = dispatch_semaphore_create(0);
      MapsSuggestionsNow();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)*((_QWORD *)v3 + 12);
      *((_QWORD *)v3 + 12) = v8;

      v10 = (void *)*((_QWORD *)v3 + 1);
      GEOConfigGetDouble();
      v12 = v11;
      Integer = GEOConfigGetInteger();
      v14 = objc_alloc(MEMORY[0x1E0CB3588]);
      MapsSuggestionsNowWithOffset(-v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      MapsSuggestionsNow();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v14, "initWithStartDate:endDate:", v15, v16);

      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", &unk_1E4C098C0, &unk_1E4C098D8, 0);
      v19 = objc_alloc(MEMORY[0x1E0D18508]);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0D185C8]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", Integer);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v19, "initWithAscending:confidence:dateInterval:labelVisit:limit:sources:", 1, v20, v17, 1, v21, v18);

      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __44__MapsSuggestionsRoutine__fetchStoredVisits__block_invoke;
      *(_QWORD *)&buf[24] = &unk_1E4BD09D8;
      v85 = &v79;
      v23 = v7;
      v84 = v23;
      v86 = &v87;
      objc_msgSend(v10, "fetchStoredVisitsWithOptions:handler:", v22, buf);

      dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
      v24 = *(void **)(*((_QWORD *)&v87 + 1) + 40);
      if (v24)
      {
        v25 = objc_msgSend(v24, "copy");
        v26 = (void *)*((_QWORD *)v3 + 14);
        *((_QWORD *)v3 + 14) = v25;

      }
    }
    v77 = *(id *)(*((_QWORD *)&v79 + 1) + 40);
    _Block_object_dispose(&v87, 8);

    _Block_object_dispose(&v79, 8);
    v27 = (void *)*((_QWORD *)v3 + 14);
    if (v77)
    {
      v3[14] = 0.0;

      v28 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(*(id *)(v78 + 32), "name");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_msgSend(v28, "initWithFormat:", CFSTR("Error getting visits at %@, %@"), v29, v77);

      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v78 + 32), "_identifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v78 + 32), "name");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[MapsSuggestionsRoutine _cacheEntryExitDatesFromVisit:forMapItemIdentifier:name:]((uint64_t)v3, v31, v32, v33);

      v34 = *(_QWORD *)(v78 + 40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -15, v30);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v34 + 16))(v34, 0, 0, v35);

      v36 = v77;
    }
    else
    {
      v38 = *(double *)(v78 + 56);
      v39 = *(void **)(v78 + 32);
      v40 = v27;
      v41 = v39;
      v76 = v40;
      if (v40)
      {
        v42 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v40, "count"));
        v81 = 0u;
        v82 = 0u;
        v79 = 0u;
        v80 = 0u;
        v43 = v40;
        v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v79, buf, 16);
        if (v44)
        {
          v45 = *(_QWORD *)v80;
          do
          {
            for (i = 0; i != v44; ++i)
            {
              if (*(_QWORD *)v80 != v45)
                objc_enumerationMutation(v43);
              v47 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
              v48 = CLLocationCoordinate2DFromGEOLocationCoordinate2D(objc_msgSend(v41, "coordinate"));
              v50 = v49;
              objc_msgSend(v47, "location");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "latitude");
              v53 = v52;
              objc_msgSend(v47, "location");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v54, "longitude");
              v56 = CLLocationCoordinate2DMake(v53, v55);

              MapsSuggestionsDistanceBetweenCoordinates(v48, v50, v56.latitude, v56.longitude);
              if (v57 <= v38)
              {
                objc_msgSend(v47, "placeInference");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v58, "mapItem");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                v60 = v59 == 0;

                if (!v60)
                  -[NSObject addObject:](v42, "addObject:", v47);
              }
            }
            v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v79, buf, 16);
          }
          while (v44);
        }

        if (-[NSObject count](v42, "count"))
        {
          GEOFindOrCreateLog();
          v61 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSObject count](v42, "count"));
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v87) = 138412290;
            *(_QWORD *)((char *)&v87 + 4) = v62;
            _os_log_impl(&dword_1A427D000, v61, OS_LOG_TYPE_DEBUG, "RefinedVisits now contains %@ places", (uint8_t *)&v87, 0xCu);

          }
        }
        v63 = -[NSObject copy](v42, "copy");
      }
      else
      {
        GEOFindOrCreateLog();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A427D000, v42, OS_LOG_TYPE_ERROR, "_allVisits are nil", buf, 2u);
        }
        v63 = 0;
      }

      _findMatchingVisit(*(void **)(v78 + 32), v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      if (v64)
      {
        objc_msgSend(*(id *)(v78 + 32), "_identifier");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v78 + 32), "name");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        -[MapsSuggestionsRoutine _cacheEntryExitDatesFromVisit:forMapItemIdentifier:name:]((uint64_t)v3, v64, v65, v66);

        v67 = *(_QWORD *)(v78 + 40);
        objc_msgSend(v64, "entry");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "exit");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, void *, _QWORD))(v67 + 16))(v67, v68, v69, 0);

      }
      else
      {
        GEOFindOrCreateLog();
        v70 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(*(id *)(v78 + 32), "name");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = *(_QWORD *)(v78 + 56);
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v71;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v72;
          _os_log_impl(&dword_1A427D000, v70, OS_LOG_TYPE_DEBUG, "No matching LOI visit found in CR for %@ within a distance of %f", buf, 0x16u);

        }
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v78 + 32), "_identifier");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v78 + 32), "name");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        -[MapsSuggestionsRoutine _cacheEntryExitDatesFromVisit:forMapItemIdentifier:name:]((uint64_t)v3, v73, v74, v75);

        (*(void (**)(void))(*(_QWORD *)(v78 + 40) + 16))();
      }

      v36 = 0;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v37 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)&buf[4] = "MapsSuggestionsRoutine.mm";
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = 1467;
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "-[MapsSuggestionsRoutine fetchLastVisitAtMapItem:withinDistance:handler:]_block_invoke_2";
      _os_log_impl(&dword_1A427D000, v37, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

    v36 = v37;
  }

}

- (char)fetchMostRecentVisitWithinDistance:(double)a3 ofMapItem:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  MapsSuggestionsRoutineConnector *connector;
  id v15;
  NSObject *v16;
  char v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  _QWORD block[4];
  id v24;
  _BYTE location[12];
  __int16 v26;
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v9)
  {
    if (v8)
    {
      objc_msgSend(v8, "coordinate");
      CLLocationFromGEOLocationCoordinate2D(v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak((id *)location, self);
      connector = self->_connector;
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __79__MapsSuggestionsRoutine_fetchMostRecentVisitWithinDistance_ofMapItem_handler___block_invoke_2;
      v19[3] = &unk_1E4BD0A28;
      objc_copyWeak(&v22, (id *)location);
      v20 = v13;
      v21 = v10;
      v15 = v13;
      -[MapsSuggestionsRoutineConnector fetchLocationsOfInterestWithinDistance:ofLocation:withHandler:](connector, "fetchLocationsOfInterestWithinDistance:ofLocation:withHandler:", v15, v19, a3);

      objc_destroyWeak(&v22);
      objc_destroyWeak((id *)location);
    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __79__MapsSuggestionsRoutine_fetchMostRecentVisitWithinDistance_ofMapItem_handler___block_invoke;
      block[3] = &unk_1E4BCE348;
      v24 = v9;
      dispatch_async((dispatch_queue_t)self->_queue._innerQueue, block);

    }
    v17 = 1;
  }
  else
  {
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      v26 = 1024;
      v27 = 1501;
      v28 = 2082;
      v29 = "-[MapsSuggestionsRoutine fetchMostRecentVisitWithinDistance:ofMapItem:handler:]";
      v30 = 2082;
      v31 = "nil == (handler)";
      _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", location, 0x26u);
    }

    v17 = 0;
  }

  return v17;
}

void __79__MapsSuggestionsRoutine_fetchMostRecentVisitWithinDistance_ofMapItem_handler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -12, CFSTR("The mapItem was nil; We have not visited nil."));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD))(v1 + 16))(v1, 0, 0);

}

void __79__MapsSuggestionsRoutine_fetchMostRecentVisitWithinDistance_ofMapItem_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  char *v24;
  id v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  id v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  dispatch_queue_t *WeakRetained;
  id obj;
  unint64_t v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD block[4];
  char *v49;
  NSObject *v50;
  uint8_t buf[4];
  char *v52;
  __int16 v53;
  _BYTE v54[18];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v32 = a2;
  v5 = a3;
  v33 = v5;
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v5)
    {
      v6 = (char *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Error getting LOIs at %@: %@"), *(_QWORD *)(a1 + 32), v5);
      GEOFindOrCreateLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v52 = v6;
        _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }

      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __79__MapsSuggestionsRoutine_fetchMostRecentVisitWithinDistance_ofMapItem_handler___block_invoke_339;
      block[3] = &unk_1E4BCF070;
      v8 = *(id *)(a1 + 40);
      v49 = v6;
      v50 = v8;
      v9 = WeakRetained[3];
      v36 = v6;
      dispatch_async(v9, block);

      v10 = v50;
    }
    else
    {
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      obj = v32;
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
      v31 = a1;
      if (v11)
      {
        v36 = 0;
        v10 = 0;
        v12 = *(_QWORD *)v45;
        while (2)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v45 != v12)
              objc_enumerationMutation(obj);
            v14 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
            objc_msgSend(v14, "visits");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "count") == 0;

            if (!v16)
            {
              objc_msgSend(v14, "visits");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "lastObject");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "entryDate");
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v14, "visits");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "lastObject");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "exitDate");
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              GEOFindOrCreateLog();
              v23 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v14, "identifier");
                v24 = (char *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v52 = v24;
                v53 = 2112;
                *(_QWORD *)v54 = v19;
                *(_WORD *)&v54[8] = 2112;
                *(_QWORD *)&v54[10] = v22;
                _os_log_impl(&dword_1A427D000, v23, OS_LOG_TYPE_DEBUG, "%@ : {entry:%@} {exit:%@}", buf, 0x20u);

              }
              if (v19)
              {
                if (!v22)
                {
                  v41[0] = MEMORY[0x1E0C809B0];
                  v41[1] = 3221225472;
                  v41[2] = __79__MapsSuggestionsRoutine_fetchMostRecentVisitWithinDistance_ofMapItem_handler___block_invoke_340;
                  v41[3] = &unk_1E4BCF070;
                  v27 = *(id *)(v31 + 40);
                  v42 = v19;
                  v43 = v27;
                  v28 = WeakRetained[3];
                  v29 = v19;
                  dispatch_async(v28, v41);

                  v30 = obj;
                  goto LABEL_30;
                }
                if (v36 | (unint64_t)v10)
                {
                  if (objc_msgSend(v22, "compare:", v10) == 1)
                  {
                    v25 = v19;

                    v26 = v22;
                    v36 = (unint64_t)v25;
                    v10 = v26;
                  }
                }
                else
                {
                  v36 = v19;
                  v10 = v22;
                }
              }

            }
          }
          v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
          if (v11)
            continue;
          break;
        }
      }
      else
      {
        v36 = 0;
        v10 = 0;
      }

      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __79__MapsSuggestionsRoutine_fetchMostRecentVisitWithinDistance_ofMapItem_handler___block_invoke_2_341;
      v37[3] = &unk_1E4BCF020;
      v40 = *(id *)(v31 + 40);
      v36 = (unint64_t)(id)v36;
      v38 = (id)v36;
      v10 = v10;
      v39 = v10;
      dispatch_async(WeakRetained[3], v37);

      v30 = v40;
LABEL_30:

    }
  }
  else
  {
    GEOFindOrCreateLog();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v52 = "MapsSuggestionsRoutine.mm";
      v53 = 1026;
      *(_DWORD *)v54 = 1515;
      *(_WORD *)&v54[4] = 2082;
      *(_QWORD *)&v54[6] = "-[MapsSuggestionsRoutine fetchMostRecentVisitWithinDistance:ofMapItem:handler:]_block_invoke_2";
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
    v36 = (unint64_t)v10;
  }

}

void __79__MapsSuggestionsRoutine_fetchMostRecentVisitWithinDistance_ofMapItem_handler___block_invoke_339(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -15, *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD))(v1 + 16))(v1, 0, 0);

}

uint64_t __79__MapsSuggestionsRoutine_fetchMostRecentVisitWithinDistance_ofMapItem_handler___block_invoke_340(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0, 0);
}

uint64_t __79__MapsSuggestionsRoutine_fetchMostRecentVisitWithinDistance_ofMapItem_handler___block_invoke_2_341(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

- (void)addParkedCarObserver:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  MapsSuggestionsObservers *parkedCarObservers;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD aBlock[5];
  id v13;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__MapsSuggestionsRoutine_addParkedCarObserver___block_invoke;
  aBlock[3] = &unk_1E4BD0A90;
  aBlock[4] = self;
  objc_copyWeak(&v13, &location);
  v6 = _Block_copy(aBlock);
  parkedCarObservers = self->_parkedCarObservers;
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __47__MapsSuggestionsRoutine_addParkedCarObserver___block_invoke_2;
  v9[3] = &unk_1E4BD0AB8;
  objc_copyWeak(&v11, &location);
  v10 = v6;
  v8 = v6;
  -[MapsSuggestionsObservers registerObserver:handler:](parkedCarObservers, "registerObserver:handler:", v4, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __47__MapsSuggestionsRoutine_addParkedCarObserver___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char *v6;
  NSObject *v7;
  NSObject *WeakRetained;
  NSObject *v9;
  NSObject *v10;
  int v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (*(_QWORD *)(a1 + 32)
    && MapsSuggestionsIsLocationAllowedForBundleID((void *)*MEMORY[0x1E0D26D08])
    && +[MapsSuggestionsSiri isEnabled](MapsSuggestionsSiri, "isEnabled"))
  {
    if (v6)
    {
      GEOFindOrCreateLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v11 = 138412290;
        v12 = v6;
        _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "Error on VehicleEvent update: %@", (uint8_t *)&v11, 0xCu);
      }

    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v9 = WeakRetained;
    if (WeakRetained)
    {
      -[objc_class callBlock:](WeakRetained[5].isa, "callBlock:", &__block_literal_global_344);
    }
    else
    {
      GEOFindOrCreateLog();
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = 136446722;
        v12 = "MapsSuggestionsRoutine.mm";
        v13 = 1026;
        v14 = 1587;
        v15 = 2082;
        v16 = "-[MapsSuggestionsRoutine addParkedCarObserver:]_block_invoke";
        _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v11, 0x1Cu);
      }

      v9 = 0;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_DEBUG, "We are not allowed to send out VehicleEvents right now.", (uint8_t *)&v11, 2u);
    }
  }

}

uint64_t __47__MapsSuggestionsRoutine_addParkedCarObserver___block_invoke_342(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updatedParkedCar");
}

void __47__MapsSuggestionsRoutine_addParkedCarObserver___block_invoke_2(uint64_t a1, int a2)
{
  id *WeakRetained;
  NSObject *v4;
  NSObject *v5;
  int v6;
  char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      GEOFindOrCreateLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v6) = 0;
        _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "First ParkedCarObserver. Start monitoring Routine.", (uint8_t *)&v6, 2u);
      }

      objc_msgSend(WeakRetained[1], "startMonitoringVehicleEventsWithHandler:", *(_QWORD *)(a1 + 32));
    }
    else
    {
      GEOFindOrCreateLog();
      v5 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = 136446722;
        v7 = "MapsSuggestionsRoutine.mm";
        v8 = 1026;
        v9 = 1596;
        v10 = 2082;
        v11 = "-[MapsSuggestionsRoutine addParkedCarObserver:]_block_invoke_2";
        _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
      }

    }
  }
}

- (void)removeParkedCarObserver:(id)a3
{
  id v4;
  MapsSuggestionsObservers *parkedCarObservers;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  parkedCarObservers = self->_parkedCarObservers;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__MapsSuggestionsRoutine_removeParkedCarObserver___block_invoke;
  v6[3] = &unk_1E4BCE1D8;
  objc_copyWeak(&v7, &location);
  -[MapsSuggestionsObservers unregisterObserver:handler:](parkedCarObservers, "unregisterObserver:handler:", v4, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __50__MapsSuggestionsRoutine_removeParkedCarObserver___block_invoke(uint64_t a1, int a2)
{
  id *WeakRetained;
  NSObject *v3;
  NSObject *v4;
  int v5;
  char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      GEOFindOrCreateLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v5) = 0;
        _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "Last ParkedCarObserver. Stop monitoring Routine.", (uint8_t *)&v5, 2u);
      }

      objc_msgSend(WeakRetained[1], "stopMonitoringVehicleEvents");
    }
    else
    {
      GEOFindOrCreateLog();
      v4 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = 136446722;
        v6 = "MapsSuggestionsRoutine.mm";
        v7 = 1026;
        v8 = 1609;
        v9 = 2082;
        v10 = "-[MapsSuggestionsRoutine removeParkedCarObserver:]_block_invoke";
        _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
      }

    }
  }
}

- (void)removeParkedCarsAllowingFeature:(BOOL)a3 handler:(id)a4
{
  _BOOL4 v4;
  void (**v6)(_QWORD);
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (v4)
  {
    -[MapsSuggestionsRoutineConnector clearAllVehicleEventsWithHandler:](self->_connector, "clearAllVehicleEventsWithHandler:", v6);
  }
  else
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2050000000;
    v7 = (void *)qword_1ED22F070;
    v14 = qword_1ED22F070;
    if (!qword_1ED22F070)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = ___ZL27getMCProfileConnectionClassv_block_invoke;
      v10[3] = &unk_1E4BD0BC8;
      v10[4] = &v11;
      ___ZL27getMCProfileConnectionClassv_block_invoke((uint64_t)v10);
      v7 = (void *)v12[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v11, 8);
    objc_msgSend(v8, "sharedConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFindMyCarAllowed:", 0);

    v6[2](v6);
  }

}

- (char)touristBitForLocation:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  MapsSuggestionsRoutineConnector *connector;
  char v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  double v13;
  _QWORD v15[4];
  NSObject *v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      v19 = 1024;
      v20 = 1635;
      v21 = 2082;
      v22 = "-[MapsSuggestionsRoutine touristBitForLocation:handler:]";
      v23 = 2082;
      v24 = "nil == (handler)";
      v11 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a handler";
LABEL_9:
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, v11, buf, 0x26u);
    }
LABEL_10:
    v9 = 0;
    goto LABEL_14;
  }
  if (!v6)
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      v19 = 1024;
      v20 = 1636;
      v21 = 2082;
      v22 = "-[MapsSuggestionsRoutine touristBitForLocation:handler:]";
      v23 = 2082;
      v24 = "nil == (location)";
      v11 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a location";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  if (+[MapsSuggestionsSiri isEnabled](MapsSuggestionsSiri, "isEnabled"))
  {
    connector = self->_connector;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __56__MapsSuggestionsRoutine_touristBitForLocation_handler___block_invoke;
    v15[3] = &unk_1E4BD0AE0;
    v16 = v7;
    -[MapsSuggestionsRoutineConnector fetchRoutineModeFromLocation:withHandler:](connector, "fetchRoutineModeFromLocation:withHandler:", v6, v15);
    v9 = 1;
    v10 = v16;
  }
  else
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_DEBUG, "User turned off Siri Suggestions for maps. Not attempting to get tourist bit", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -13, CFSTR("User turned off Siri Suggestions for Maps. We cannot go to CoreRoutine"));
    v10 = objc_claimAutoreleasedReturnValue();
    v13 = MapsSuggestionsConfidenceDontKnow();
    (*((void (**)(id, NSObject *, double))v7 + 2))(v7, v10, v13);
    v9 = 1;
  }
LABEL_14:

  return v9;
}

void __56__MapsSuggestionsRoutine_touristBitForLocation_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  __n128 v5;
  id v6;

  v6 = a3;
  if (a2)
  {
    if (a2 == 2)
    {
      v5.n128_f64[0] = MapsSuggestionsConfidenceDefinitelyTrue();
    }
    else
    {
      v5.n128_u64[0] = 0;
      if (a2 == 1)
        v5.n128_f64[0] = MapsSuggestionsConfidenceDefinitelyFalse();
    }
  }
  else
  {
    v5.n128_f64[0] = MapsSuggestionsConfidenceDontKnow();
  }
  (*(void (**)(__n128))(*(_QWORD *)(a1 + 32) + 16))(v5);

}

- (char)fetchLOIsSinceDate:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  char *v9;
  NSObject *v10;
  MapsSuggestionsRoutineConnector *connector;
  NSObject *v12;
  char v13;
  NSObject *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  _BYTE v23[14];
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v21 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      v22 = 1024;
      *(_DWORD *)v23 = 1667;
      *(_WORD *)&v23[4] = 2082;
      *(_QWORD *)&v23[6] = "-[MapsSuggestionsRoutine fetchLOIsSinceDate:handler:]";
      v24 = 2082;
      v25 = "nil == (handler)";
      _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
    }
    goto LABEL_14;
  }
  if (!v6)
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v21 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      v22 = 1024;
      *(_DWORD *)v23 = 1668;
      *(_WORD *)&v23[4] = 2082;
      *(_QWORD *)&v23[6] = "-[MapsSuggestionsRoutine fetchLOIsSinceDate:handler:]";
      v24 = 2082;
      v25 = "nil == (sinceDate)";
      _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a date", buf, 0x26u);
    }
LABEL_14:

    v13 = 0;
    goto LABEL_19;
  }
  if (+[MapsSuggestionsSiri isEnabled](MapsSuggestionsSiri, "isEnabled"))
  {
    objc_initWeak(&location, self);
    GEOFindOrCreateLog();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      -[MapsSuggestionsRoutine uniqueName](self, "uniqueName");
      v9 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v21 = v9;
      v22 = 2080;
      *(_QWORD *)v23 = "fetchLocationsSinceDate";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

    }
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "fetchLocationsSinceDate", ", buf, 2u);
    }

    connector = self->_connector;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __53__MapsSuggestionsRoutine_fetchLOIsSinceDate_handler___block_invoke;
    v16[3] = &unk_1E4BCF048;
    objc_copyWeak(&v18, &location);
    v17 = v7;
    -[MapsSuggestionsRoutineConnector fetchLocationsOfInterestVisitedSinceDate:withHandler:](connector, "fetchLocationsOfInterestVisitedSinceDate:withHandler:", v6, v16);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    GEOFindOrCreateLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_DEBUG, "User turned off Siri Suggestions for maps. Not attempting to fetch locations", buf, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }
  v13 = 1;
LABEL_19:

  return v13;
}

void __53__MapsSuggestionsRoutine_fetchLOIsSinceDate_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char *v6;
  dispatch_queue_t *WeakRetained;
  dispatch_queue_t *v8;
  NSObject *v9;
  NSObject *v10;
  char *v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  char *v19;
  __int16 v20;
  _WORD v21[17];

  *(_QWORD *)&v21[13] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (!v6)
  {
    if (WeakRetained)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __53__MapsSuggestionsRoutine_fetchLOIsSinceDate_handler___block_invoke_351;
      block[3] = &unk_1E4BCE780;
      objc_copyWeak(&v17, (id *)(a1 + 40));
      v15 = v5;
      v16 = *(id *)(a1 + 32);
      dispatch_async(v8[3], block);

      objc_destroyWeak(&v17);
      goto LABEL_18;
    }
    GEOFindOrCreateLog();
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v19 = "MapsSuggestionsRoutine.mm";
      v20 = 1026;
      *(_DWORD *)v21 = 1689;
      v21[2] = 2082;
      *(_QWORD *)&v21[3] = "-[MapsSuggestionsRoutine fetchLOIsSinceDate:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: outerStrongSelf went away in %{public}s", buf, 0x1Cu);
    }
LABEL_17:

    goto LABEL_18;
  }
  if (!WeakRetained)
  {
    GEOFindOrCreateLog();
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v19 = "MapsSuggestionsRoutine.mm";
      v20 = 1026;
      *(_DWORD *)v21 = 1682;
      v21[2] = 2082;
      *(_QWORD *)&v21[3] = "-[MapsSuggestionsRoutine fetchLOIsSinceDate:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
    goto LABEL_17;
  }
  GEOFindOrCreateLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v6;
    _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "Could not get LOIs: %@", buf, 0xCu);
  }

  GEOFindOrCreateLog();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    -[dispatch_queue_t uniqueName](v8, "uniqueName");
    v11 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v19 = v11;
    v20 = 2080;
    *(_QWORD *)v21 = "fetchLocationsSinceDate";
    _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);

  }
  GEOFindOrCreateLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "fetchLocationsSinceDate", ", buf, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_18:

}

void __53__MapsSuggestionsRoutine_fetchLOIsSinceDate_handler___block_invoke_351(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  MapsSuggestionsLocationOfInterest *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  MapsSuggestionsLocationOfInterest *v10;
  NSObject *v11;
  uint64_t v12;
  id obj;
  void *v14;
  _QWORD *WeakRetained;
  _QWORD block[5];
  NSObject *v17;
  id v18;
  _QWORD v19[4];
  NSObject *v20;
  NSObject *v21;
  MapsSuggestionsLocationOfInterest *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v2 = dispatch_group_create();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v12 = a1;
    obj = *(id *)(a1 + 32);
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v3)
    {
      v4 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v24 != v4)
            objc_enumerationMutation(obj);
          v6 = -[MapsSuggestionsLocationOfInterest initWithLOI:]([MapsSuggestionsLocationOfInterest alloc], "initWithLOI:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i), v12);
          if (v6)
          {
            dispatch_group_enter(v2);
            v7 = WeakRetained[2];
            v19[0] = MEMORY[0x1E0C809B0];
            v19[1] = 3221225472;
            v19[2] = __53__MapsSuggestionsRoutine_fetchLOIsSinceDate_handler___block_invoke_352;
            v19[3] = &unk_1E4BD0B08;
            v8 = v2;
            v20 = v8;
            v9 = v14;
            v21 = v9;
            v10 = v6;
            v22 = v10;
            if (!-[MapsSuggestionsLocationOfInterest hydrateMapItemWithNetworkRequester:completion:](v10, "hydrateMapItemWithNetworkRequester:completion:", v7, v19))
            {
              dispatch_group_leave(v8);

              goto LABEL_17;
            }

          }
        }
        v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v3)
          continue;
        break;
      }
    }

    v11 = WeakRetained[3];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__MapsSuggestionsRoutine_fetchLOIsSinceDate_handler___block_invoke_353;
    block[3] = &unk_1E4BD0B30;
    block[4] = WeakRetained;
    v18 = *(id *)(v12 + 40);
    v9 = v14;
    v17 = v9;
    dispatch_group_notify(v2, v11, block);

    v8 = v2;
  }
  else
  {
    GEOFindOrCreateLog();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v29 = "MapsSuggestionsRoutine.mm";
      v30 = 1026;
      v31 = 1691;
      v32 = 2082;
      v33 = "-[MapsSuggestionsRoutine fetchLOIsSinceDate:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
    v9 = v8;
  }
LABEL_17:

}

void __53__MapsSuggestionsRoutine_fetchLOIsSinceDate_handler___block_invoke_352(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "returnedError: %@", (uint8_t *)&v5, 0xCu);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", *(_QWORD *)(a1 + 48));
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __53__MapsSuggestionsRoutine_fetchLOIsSinceDate_handler___block_invoke_353(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  int v6;
  void *v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "uniqueName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v3;
    v8 = 2080;
    v9 = "fetchLocationsSinceDate";
    _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v6, 0x16u);

  }
  GEOFindOrCreateLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    LOWORD(v6) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "fetchLocationsSinceDate", ", (uint8_t *)&v6, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (char)fetchLocationsSinceDate:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  char *v9;
  NSObject *v10;
  MapsSuggestionsRoutineConnector *connector;
  NSObject *v12;
  char v13;
  NSObject *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  _BYTE v23[14];
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v21 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      v22 = 1024;
      *(_DWORD *)v23 = 1732;
      *(_WORD *)&v23[4] = 2082;
      *(_QWORD *)&v23[6] = "-[MapsSuggestionsRoutine fetchLocationsSinceDate:handler:]";
      v24 = 2082;
      v25 = "nil == (handler)";
      _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
    }
    goto LABEL_14;
  }
  if (!v6)
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v21 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      v22 = 1024;
      *(_DWORD *)v23 = 1733;
      *(_WORD *)&v23[4] = 2082;
      *(_QWORD *)&v23[6] = "-[MapsSuggestionsRoutine fetchLocationsSinceDate:handler:]";
      v24 = 2082;
      v25 = "nil == (sinceDate)";
      _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a date", buf, 0x26u);
    }
LABEL_14:

    v13 = 0;
    goto LABEL_19;
  }
  if (+[MapsSuggestionsSiri isEnabled](MapsSuggestionsSiri, "isEnabled"))
  {
    objc_initWeak(&location, self);
    GEOFindOrCreateLog();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      -[MapsSuggestionsRoutine uniqueName](self, "uniqueName");
      v9 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v21 = v9;
      v22 = 2080;
      *(_QWORD *)v23 = "fetchLocationsSinceDate";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

    }
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "fetchLocationsSinceDate", ", buf, 2u);
    }

    connector = self->_connector;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __58__MapsSuggestionsRoutine_fetchLocationsSinceDate_handler___block_invoke;
    v16[3] = &unk_1E4BCF048;
    objc_copyWeak(&v18, &location);
    v17 = v7;
    -[MapsSuggestionsRoutineConnector fetchLocationsOfInterestVisitedSinceDate:withHandler:](connector, "fetchLocationsOfInterestVisitedSinceDate:withHandler:", v6, v16);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    GEOFindOrCreateLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_DEBUG, "User turned off Siri Suggestions for maps. Not attempting to fetch locations", buf, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v7 + 2))(v7, 0, 0, 0);
  }
  v13 = 1;
LABEL_19:

  return v13;
}

void __58__MapsSuggestionsRoutine_fetchLocationsSinceDate_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char *v6;
  dispatch_queue_t *WeakRetained;
  dispatch_queue_t *v8;
  NSObject *v9;
  NSObject *v10;
  char *v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  char *v19;
  __int16 v20;
  _WORD v21[17];

  *(_QWORD *)&v21[13] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (!v6)
  {
    if (WeakRetained)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __58__MapsSuggestionsRoutine_fetchLocationsSinceDate_handler___block_invoke_354;
      block[3] = &unk_1E4BCE780;
      objc_copyWeak(&v17, (id *)(a1 + 40));
      v15 = v5;
      v16 = *(id *)(a1 + 32);
      dispatch_async(v8[3], block);

      objc_destroyWeak(&v17);
      goto LABEL_18;
    }
    GEOFindOrCreateLog();
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v19 = "MapsSuggestionsRoutine.mm";
      v20 = 1026;
      *(_DWORD *)v21 = 1754;
      v21[2] = 2082;
      *(_QWORD *)&v21[3] = "-[MapsSuggestionsRoutine fetchLocationsSinceDate:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: outerStrongSelf went away in %{public}s", buf, 0x1Cu);
    }
LABEL_17:

    goto LABEL_18;
  }
  if (!WeakRetained)
  {
    GEOFindOrCreateLog();
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v19 = "MapsSuggestionsRoutine.mm";
      v20 = 1026;
      *(_DWORD *)v21 = 1747;
      v21[2] = 2082;
      *(_QWORD *)&v21[3] = "-[MapsSuggestionsRoutine fetchLocationsSinceDate:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
    goto LABEL_17;
  }
  GEOFindOrCreateLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v6;
    _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "Could not get LOIs: %@", buf, 0xCu);
  }

  GEOFindOrCreateLog();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    -[dispatch_queue_t uniqueName](v8, "uniqueName");
    v11 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v19 = v11;
    v20 = 2080;
    *(_QWORD *)v21 = "fetchLocationsSinceDate";
    _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);

  }
  GEOFindOrCreateLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "fetchLocationsSinceDate", ", buf, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_18:

}

void __58__MapsSuggestionsRoutine_fetchLocationsSinceDate_handler___block_invoke_354(uint64_t a1)
{
  id WeakRetained;
  dispatch_queue_t *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  char *v28;
  NSObject *v29;
  void *v30;
  void (**v31)(id, void *, void *, _QWORD);
  void *v32;
  id obj;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  char *v40;
  __int16 v41;
  _QWORD v42[16];

  *(_QWORD *)((char *)&v42[14] + 2) = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v32 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (dispatch_queue_t *)WeakRetained;
    v4 = *(void **)(a1 + 32);
    v5 = *(void **)(a1 + 40);
    v6 = v4;
    v31 = v5;
    v30 = v6;
    dispatch_assert_queue_V2(v3[3]);
    v7 = objc_msgSend(v6, "count");
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v40 = "-[MapsSuggestionsRoutine _treatLOIs:handler:]";
      v41 = 1024;
      LODWORD(v42[0]) = v7;
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "%s: about to process %u routine LOIs", buf, 0x12u);
    }

    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v7);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v7);
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    obj = v30;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, buf, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v36 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          v14 = objc_alloc(MEMORY[0x1E0C9E3B8]);
          objc_msgSend(v13, "location");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "latitude");
          v17 = v16;
          objc_msgSend(v13, "location");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "longitude");
          v20 = (void *)objc_msgSend(v14, "initWithLatitude:longitude:", v17, v19);

          if (v20)
          {
            objc_msgSend(v9, "addObject:", v20);
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "visits");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "lastObject");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "exitDate");
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (v24)
              v25 = v24;
            else
              v25 = v21;
            v26 = v25;
            objc_msgSend(v34, "addObject:", v26);

          }
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, buf, 16);
      }
      while (v10);
    }

    v31[2](v31, v9, v34, 0);
    GEOFindOrCreateLog();
    v27 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v32, "uniqueName");
      v28 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v40 = v28;
      v41 = 2080;
      v42[0] = "fetchLocationsSinceDate";
      _os_log_impl(&dword_1A427D000, v27, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);

    }
    GEOFindOrCreateLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v29))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v29, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "fetchLocationsSinceDate", ", buf, 2u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v29 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v40 = "MapsSuggestionsRoutine.mm";
      v41 = 1026;
      LODWORD(v42[0]) = 1756;
      WORD2(v42[0]) = 2082;
      *(_QWORD *)((char *)v42 + 6) = "-[MapsSuggestionsRoutine fetchLocationsSinceDate:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v29, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

- (void)forgetLocationOfInterest:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  MapsSuggestionsRoutine *v10;
  _QWORD *v11;
  MapsSuggestionsRoutine *v12;
  NSObject *innerQueue;
  NSObject *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _BYTE block[40];
  _QWORD *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __59__MapsSuggestionsRoutine_forgetLocationOfInterest_handler___block_invoke;
  v16[3] = &unk_1E4BD0B58;
  v17 = v6;
  v18 = v7;
  v9 = v7;
  v15 = v6;
  v10 = self;
  v11 = v16;
  if (v10)
  {
    v12 = v10;
    innerQueue = v10->_queue._innerQueue;
    *(_QWORD *)block = v8;
    *(_QWORD *)&block[8] = 3221225472;
    *(_QWORD *)&block[16] = ___ZNK3MSg5Queue5asyncI22MapsSuggestionsRoutineEEvPT_U13block_pointerFvS4_E_block_invoke;
    *(_QWORD *)&block[24] = &unk_1E4BCE138;
    *(_QWORD *)&block[32] = v12;
    v20 = v11;
    dispatch_async(innerQueue, block);

    v14 = *(NSObject **)&block[32];
  }
  else
  {
    GEOFindOrCreateLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)block = 136446978;
      *(_QWORD *)&block[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsQueue.hpp";
      *(_WORD *)&block[12] = 1024;
      *(_DWORD *)&block[14] = 208;
      *(_WORD *)&block[18] = 2082;
      *(_QWORD *)&block[20] = "void MSg::Queue::async(S *, void (^__strong)(S *)) const [S = MapsSuggestionsRoutine]";
      *(_WORD *)&block[28] = 2082;
      *(_QWORD *)&block[30] = "nil == (callerSelf)";
      _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires self", block, 0x26u);
    }
  }

}

void __59__MapsSuggestionsRoutine_forgetLocationOfInterest_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id *v6;

  v6 = a2;
  v3 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithUUIDString:", v4);

  objc_msgSend(v6[1], "removeLocationOfInterestWithIdentifier:handler:", v5, *(_QWORD *)(a1 + 40));
}

- (char)predictedExitTimeFromLocation:(id)a3 date:(id)a4 handler:(id)a5
{
  char *v8;
  id v9;
  id v10;
  NSObject *v11;
  MapsSuggestionsRoutineConnector *connector;
  char v13;
  NSObject *v14;
  const char *v15;
  NSObject *v17;
  _QWORD v18[4];
  NSObject *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  _BYTE v25[14];
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = (char *)a3;
  v9 = a4;
  v10 = a5;
  GEOFindOrCreateLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v23 = v8;
    v24 = 2112;
    *(_QWORD *)v25 = v9;
    _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_DEBUG, "Getting ExitTime of %@ at %@", buf, 0x16u);
  }

  if (!v10)
  {
    GEOFindOrCreateLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    *(_DWORD *)buf = 136446978;
    v23 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
    v24 = 1024;
    *(_DWORD *)v25 = 1820;
    *(_WORD *)&v25[4] = 2082;
    *(_QWORD *)&v25[6] = "-[MapsSuggestionsRoutine predictedExitTimeFromLocation:date:handler:]";
    v26 = 2082;
    v27 = "nil == (handler)";
    v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_14:
    _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_ERROR, v15, buf, 0x26u);
    goto LABEL_15;
  }
  if (!v8)
  {
    GEOFindOrCreateLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    *(_DWORD *)buf = 136446978;
    v23 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
    v24 = 1024;
    *(_DWORD *)v25 = 1821;
    *(_WORD *)&v25[4] = 2082;
    *(_QWORD *)&v25[6] = "-[MapsSuggestionsRoutine predictedExitTimeFromLocation:date:handler:]";
    v26 = 2082;
    v27 = "nil == (location)";
    v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a location";
    goto LABEL_14;
  }
  if (!v9)
  {
    GEOFindOrCreateLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v23 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      v24 = 1024;
      *(_DWORD *)v25 = 1822;
      *(_WORD *)&v25[4] = 2082;
      *(_QWORD *)&v25[6] = "-[MapsSuggestionsRoutine predictedExitTimeFromLocation:date:handler:]";
      v26 = 2082;
      v27 = "nil == (date)";
      v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a date";
      goto LABEL_14;
    }
LABEL_15:
    v13 = 0;
    goto LABEL_16;
  }
  if (+[MapsSuggestionsSiri isEnabled](MapsSuggestionsSiri, "isEnabled"))
  {
    connector = self->_connector;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __69__MapsSuggestionsRoutine_predictedExitTimeFromLocation_date_handler___block_invoke;
    v18[3] = &unk_1E4BCE3B0;
    v19 = v8;
    v20 = v9;
    v21 = v10;
    -[MapsSuggestionsRoutineConnector fetchPredictedExitDatesFromLocation:onDate:withHandler:](connector, "fetchPredictedExitDatesFromLocation:onDate:withHandler:", v19, v20, v18);

    v13 = 1;
    v14 = v19;
  }
  else
  {
    GEOFindOrCreateLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A427D000, v17, OS_LOG_TYPE_DEBUG, "User turned off Siri Suggestions for maps. Not attempting to get exit times", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -13, CFSTR("User turned off Siri Suggestions for Maps. We cannot go to CoreRoutine"));
    v14 = objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, NSObject *))v10 + 2))(v10, 0, v14);
    v13 = 1;
  }
LABEL_16:

  return v13;
}

void __69__MapsSuggestionsRoutine_predictedExitTimeFromLocation_date_handler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = a1[4];
      v9 = a1[5];
      v15 = 138412802;
      v16 = v8;
      v17 = 2112;
      v18 = v9;
      v19 = 2112;
      v20 = v6;
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "Error getting ExitTime for %@ at %@: %@", (uint8_t *)&v15, 0x20u);
    }
LABEL_9:

    (*(void (**)(void))(a1[6] + 16))();
    goto LABEL_10;
  }
  if (!objc_msgSend(v5, "count"))
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v13 = a1[4];
      v14 = a1[5];
      v15 = 138412546;
      v16 = v13;
      v17 = 2112;
      v18 = v14;
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "Unknown ExitTime for %@ at %@", (uint8_t *)&v15, 0x16u);
    }
    goto LABEL_9;
  }
  v10 = a1[6];
  objc_msgSend(v5, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v10 + 16))(v10, v12, 0);

LABEL_10:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationShifter, 0);
  objc_storeStrong((id *)&self->_mapItemCacheOrigin, 0);
  objc_storeStrong((id *)&self->_mapItemCache, 0);
  objc_storeStrong((id *)&self->_allVisits, 0);
  objc_storeStrong((id *)&self->_visitQueryTimeStamp, 0);
  objc_storeStrong((id *)&self->_cacheTimeStamp, 0);
  objc_storeStrong((id *)&self->_identifierToDatesMapping, 0);
  objc_storeStrong((id *)&self->_loiVisits, 0);
  objc_storeStrong((id *)&self->_loiLocationsForSchool, 0);
  objc_storeStrong((id *)&self->_loiLocationsForWork, 0);
  objc_storeStrong((id *)&self->_loiLocationsForHome, 0);
  objc_storeStrong((id *)&self->_parkedCarObservers, 0);

  objc_storeStrong((id *)&self->_networkRequester, 0);
  objc_storeStrong((id *)&self->_connector, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end
