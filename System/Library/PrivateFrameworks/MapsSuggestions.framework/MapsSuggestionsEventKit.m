@implementation MapsSuggestionsEventKit

- (MapsSuggestionsEventKit)initWithConnector:(id)a3 network:(id)a4
{
  id v7;
  id v8;
  void *v9;
  MapsSuggestionsEventKit *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  MapsSuggestionsObservers *v14;
  MapsSuggestionsObservers *observers;
  NSMutableDictionary *v16;
  NSMutableDictionary *handleToMapItemMapping;
  NSMutableDictionary *v18;
  NSMutableDictionary *handleToMapItemOriginMapping;
  uint64_t v20;
  NSSet *setOfEventReservationSubtypes;
  MapsSuggestionsCanKicker *v22;
  double v23;
  double v24;
  OS_dispatch_queue *v25;
  uint64_t v26;
  MapsSuggestionsCanKicker *changedNotificationCanKicker;
  MapsSuggestionsEventKit *v28;
  NSObject *v29;
  _QWORD v31[4];
  id v32;
  objc_super v33;
  _BYTE location[12];
  __int16 v35;
  int v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  const char *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    GEOFindOrCreateLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEventKit.m";
      v35 = 1024;
      v36 = 113;
      v37 = 2082;
      v38 = "-[MapsSuggestionsEventKit initWithConnector:network:]";
      v39 = 2082;
      v40 = "nil == (connector)";
      _os_log_impl(&dword_1A427D000, v29, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an EventKitConnector", location, 0x26u);
    }
    goto LABEL_11;
  }
  if (!v8)
  {
    GEOFindOrCreateLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEventKit.m";
      v35 = 1024;
      v36 = 114;
      v37 = 2082;
      v38 = "-[MapsSuggestionsEventKit initWithConnector:network:]";
      v39 = 2082;
      v40 = "nil == (network)";
      _os_log_impl(&dword_1A427D000, v29, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a NetworkRequester", location, 0x26u);
    }
LABEL_11:

    v28 = 0;
    goto LABEL_12;
  }
  v33.receiver = self;
  v33.super_class = (Class)MapsSuggestionsEventKit;
  v10 = -[MapsSuggestionsEventKit init](&v33, sel_init);
  if (v10)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("MapsSuggestionsEventKitQueue", v11);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v10->_connector, a3);
    -[MapsSuggestionsEventKitConnector setDelegate:](v10->_connector, "setDelegate:", v10);
    objc_storeStrong((id *)&v10->_network, a4);
    v14 = -[MapsSuggestionsObservers initWithCallbackQueue:name:]([MapsSuggestionsObservers alloc], "initWithCallbackQueue:name:", v10->_queue, CFSTR("MapsSuggestionsEventKitObservers"));
    observers = v10->_observers;
    v10->_observers = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    handleToMapItemMapping = v10->_handleToMapItemMapping;
    v10->_handleToMapItemMapping = v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    handleToMapItemOriginMapping = v10->_handleToMapItemOriginMapping;
    v10->_handleToMapItemOriginMapping = v18;

    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("http://schema.org/Event"), CFSTR("http://schema.org/SocialEvent"), CFSTR("http://schema.org/MovieShowing"), 0);
    setOfEventReservationSubtypes = v10->_setOfEventReservationSubtypes;
    v10->_setOfEventReservationSubtypes = (NSSet *)v20;

    objc_initWeak((id *)location, v10);
    v22 = [MapsSuggestionsCanKicker alloc];
    GEOConfigGetDouble();
    v24 = v23;
    v25 = v10->_queue;
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __53__MapsSuggestionsEventKit_initWithConnector_network___block_invoke;
    v31[3] = &unk_1E4BCDFF8;
    objc_copyWeak(&v32, (id *)location);
    v26 = -[MapsSuggestionsCanKicker initWithName:time:queue:block:](v22, "initWithName:time:queue:block:", CFSTR("MapsSuggestionsEventKitChangedNotificationCanKicker"), v25, v31, v24);
    changedNotificationCanKicker = v10->_changedNotificationCanKicker;
    v10->_changedNotificationCanKicker = (MapsSuggestionsCanKicker *)v26;

    objc_destroyWeak(&v32);
    objc_destroyWeak((id *)location);
  }
  self = v10;
  v28 = self;
LABEL_12:

  return v28;
}

void __53__MapsSuggestionsEventKit_initWithConnector_network___block_invoke(uint64_t a1)
{
  id *v1;
  _QWORD *WeakRetained;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "Acting on one or more change notifications from EventStore", buf, 2u);
    }

    v5 = (void *)WeakRetained[4];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __53__MapsSuggestionsEventKit_initWithConnector_network___block_invoke_223;
    v7[3] = &unk_1E4BCEAD8;
    objc_copyWeak(&v8, v1);
    objc_msgSend(v5, "callBlock:", v7);
    objc_destroyWeak(&v8);
  }
  else
  {
    v6 = v3;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v10 = "MapsSuggestionsEventKit.m";
      v11 = 1026;
      v12 = 133;
      v13 = 2082;
      v14 = "-[MapsSuggestionsEventKit initWithConnector:network:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __53__MapsSuggestionsEventKit_initWithConnector_network___block_invoke_223(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  int v6;
  char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v3, "eventKitDidChange:", WeakRetained);
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446722;
      v7 = "MapsSuggestionsEventKit.m";
      v8 = 1026;
      v9 = 136;
      v10 = 2082;
      v11 = "-[MapsSuggestionsEventKit initWithConnector:network:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelfCall went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }

  }
}

- (id)initFromResourceDepot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  MapsSuggestionsEventKit *v10;
  NSObject *v11;
  const char *v12;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v14 = 136446978;
    v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEventKit.m";
    v16 = 1024;
    v17 = 146;
    v18 = 2082;
    v19 = "-[MapsSuggestionsEventKit initFromResourceDepot:]";
    v20 = 2082;
    v21 = "nil == (resourceDepot)";
    v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to build from!";
LABEL_11:
    _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v14, 0x26u);
    goto LABEL_12;
  }
  objc_msgSend(v4, "oneEventKitConnector");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v14 = 136446978;
    v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEventKit.m";
    v16 = 1024;
    v17 = 147;
    v18 = 2082;
    v19 = "-[MapsSuggestionsEventKit initFromResourceDepot:]";
    v20 = 2082;
    v21 = "nil == (resourceDepot.oneEventKitConnector)";
    v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires One EventKitConnector!";
    goto LABEL_11;
  }
  objc_msgSend(v5, "oneNetworkRequester");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v14 = 136446978;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEventKit.m";
      v16 = 1024;
      v17 = 148;
      v18 = 2082;
      v19 = "-[MapsSuggestionsEventKit initFromResourceDepot:]";
      v20 = 2082;
      v21 = "nil == (resourceDepot.oneNetworkRequester)";
      v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires One Network!";
      goto LABEL_11;
    }
LABEL_12:

    v10 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v5, "oneEventKitConnector");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "oneNetworkRequester");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[MapsSuggestionsEventKit initWithConnector:network:](self, "initWithConnector:network:", v8, v9);

  v10 = self;
LABEL_13:

  return v10;
}

- (BOOL)canProduceEntriesOfType:(int64_t)a3
{
  return ((unint64_t)a3 < 0x11) & (0x1E108u >> a3);
}

- (BOOL)hasVisibleCalendars
{
  void *v2;
  void *v3;
  BOOL v4;

  -[MapsSuggestionsEventKitConnector visibleCalendars](self->_connector, "visibleCalendars");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "count") != 0;
  else
    v4 = 1;

  return v4;
}

- (BOOL)entriesForEventsAtLocation:(id)a3 period:(id)a4 fetchMapItems:(BOOL)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *queue;
  BOOL v14;
  NSObject *v15;
  const char *v16;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  id v22;
  BOOL v23;
  _BYTE location[12];
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (!v12)
  {
    GEOFindOrCreateLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    *(_DWORD *)location = 136446978;
    *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEventKit.m";
    v25 = 1024;
    v26 = 180;
    v27 = 2082;
    v28 = "-[MapsSuggestionsEventKit entriesForEventsAtLocation:period:fetchMapItems:handler:]";
    v29 = 2082;
    v30 = "nil == (handler)";
    v16 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_11:
    _os_log_impl(&dword_1A427D000, v15, OS_LOG_TYPE_ERROR, v16, location, 0x26u);
    goto LABEL_12;
  }
  if (!v10)
  {
    GEOFindOrCreateLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    *(_DWORD *)location = 136446978;
    *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEventKit.m";
    v25 = 1024;
    v26 = 181;
    v27 = 2082;
    v28 = "-[MapsSuggestionsEventKit entriesForEventsAtLocation:period:fetchMapItems:handler:]";
    v29 = 2082;
    v30 = "nil == (location)";
    v16 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a location";
    goto LABEL_11;
  }
  if (!v11)
  {
    GEOFindOrCreateLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEventKit.m";
      v25 = 1024;
      v26 = 182;
      v27 = 2082;
      v28 = "-[MapsSuggestionsEventKit entriesForEventsAtLocation:period:fetchMapItems:handler:]";
      v29 = 2082;
      v30 = "nil == (period)";
      v16 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a time period";
      goto LABEL_11;
    }
LABEL_12:

    v14 = 0;
    goto LABEL_13;
  }
  objc_initWeak((id *)location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__MapsSuggestionsEventKit_entriesForEventsAtLocation_period_fetchMapItems_handler___block_invoke;
  block[3] = &unk_1E4BCEB00;
  objc_copyWeak(&v22, (id *)location);
  v19 = v11;
  v20 = v10;
  v23 = a5;
  v21 = v12;
  dispatch_async(queue, block);

  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)location);
  v14 = 1;
LABEL_13:

  return v14;
}

void __83__MapsSuggestionsEventKit_entriesForEventsAtLocation_period_fetchMapItems_handler___block_invoke(uint64_t a1)
{
  id WeakRetained;
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
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsEventKit _q_createEntriesWithinPeriod:location:fetchMapItems:handler:]((uint64_t)WeakRetained, *(void **)(a1 + 32), *(void **)(a1 + 40), *(_BYTE *)(a1 + 64), *(void **)(a1 + 48));
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136446722;
      v6 = "MapsSuggestionsEventKit.m";
      v7 = 1026;
      v8 = 186;
      v9 = 2082;
      v10 = "-[MapsSuggestionsEventKit entriesForEventsAtLocation:period:fetchMapItems:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }

  }
}

- (void)_q_createEntriesWithinPeriod:(void *)a3 location:(char)a4 fetchMapItems:(void *)a5 handler:
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  BOOL v51;
  void *v52;
  _BOOL4 v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  BOOL v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  _BOOL4 v64;
  NSObject *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  _BOOL4 v71;
  NSObject *v72;
  NSObject *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  _BOOL4 v78;
  NSObject *v79;
  NSObject *v80;
  void *v81;
  void *v82;
  void *v83;
  char isKindOfClass;
  NSObject *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  NSObject *v89;
  void *v90;
  NSObject *v91;
  NSObject *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  NSObject *v99;
  uint64_t v100;
  double v101;
  double v102;
  double v103;
  NSObject *v104;
  void *v105;
  double v106;
  double v107;
  double v108;
  MapsSuggestionsEntry *v109;
  void *v110;
  MapsSuggestionsEntry *v111;
  double v112;
  double v113;
  double v114;
  double v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  int v133;
  uint64_t v134;
  id v135;
  void *v136;
  void *v137;
  id v138;
  id v139;
  NSObject *v140;
  NSObject *v141;
  MapsSuggestionsEntry *v142;
  id v143;
  MapsSuggestionsEntry *v144;
  void *v145;
  void *v146;
  id v147;
  void *v148;
  NSObject *v149;
  NSObject *v150;
  void *v151;
  MapsSuggestionsEntry *v152;
  NSObject *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  NSObject *v168;
  int v169;
  MapsSuggestionsEntry *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  uint64_t v178;
  MapsSuggestionsEntry *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  uint64_t v186;
  void *v187;
  void *v188;
  id v189;
  NSObject *v190;
  NSObject *v191;
  NSObject *v192;
  const char *v193;
  NSObject *v194;
  NSObject *v195;
  NSObject *v196;
  NSObject *v197;
  const char *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  NSObject *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  _BOOL4 v208;
  NSObject *v209;
  uint64_t v210;
  void *v211;
  uint64_t v212;
  id v213;
  id v214;
  id v215;
  id v216;
  id v217;
  id v218;
  void *v219;
  void *v220;
  id v221;
  id v222;
  id v223;
  id v224;
  void *v225;
  void *v226;
  id v227;
  id v228;
  NSObject *v229;
  void *v230;
  NSObject *v231;
  NSObject *v232;
  BOOL v233;
  NSObject *v234;
  id v235;
  void *v236;
  NSObject *v237;
  NSObject *v238;
  uint64_t v239;
  NSObject *v240;
  MapsSuggestionsEntry *v241;
  void *v242;
  uint64_t v243;
  NSObject *v244;
  void *v245;
  NSObject *v246;
  id v247;
  void *v248;
  uint64_t v249;
  void *v250;
  NSObject *v251;
  void *v252;
  NSObject *v253;
  NSObject *v254;
  NSObject *v255;
  void *v256;
  NSObject *v257;
  void *v258;
  NSObject *v259;
  NSObject *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  _BOOL4 v265;
  NSObject *v266;
  NSObject *v267;
  void *v268;
  void *v269;
  void *v270;
  _BOOL4 v271;
  NSObject *v272;
  void *v273;
  uint64_t v274;
  void *v275;
  uint64_t v276;
  id v277;
  uint64_t v278;
  NSObject *v279;
  NSObject *v280;
  id v281;
  id v282;
  NSObject *v283;
  id v284;
  NSObject *v285;
  NSObject *v286;
  NSObject *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  id v292;
  void *v293;
  void *v294;
  MapsSuggestionsEntry *v295;
  void *v296;
  id v297;
  id v298;
  void *v299;
  void *v300;
  NSObject *v301;
  NSObject *v302;
  NSObject *v303;
  NSObject *v304;
  void *v305;
  NSObject *group;
  uint64_t v307;
  NSObject *v308;
  id v309;
  void *v310;
  id v311;
  void *v312;
  void *v314;
  void *v315;
  void *v316;
  void *v317;
  void *v318;
  id v320;
  void *v321;
  NSObject *v322;
  void *v323;
  void *v324;
  id obj;
  uint64_t v326;
  uint64_t v327;
  _QWORD v328[4];
  id v329;
  id v330;
  id v331;
  id v332;
  _QWORD v333[4];
  MapsSuggestionsEntry *v334;
  NSObject *v335;
  NSObject *v336;
  id v337;
  NSObject *v338;
  id v339;
  NSObject *v340;
  id v341;
  __int128 v342;
  __int128 v343;
  __int128 v344;
  __int128 v345;
  _QWORD v346[4];
  id v347;
  id v348;
  _QWORD block[4];
  id v350;
  id v351;
  id location;
  __int128 v353;
  __int128 v354;
  __int128 v355;
  __int128 v356;
  _QWORD v357[4];
  NSObject *v358;
  char v359;
  __CFString *v360;
  uint8_t v361[128];
  _BYTE buf[40];
  id v363;
  uint64_t v364;
  CLLocationCoordinate2D v365;
  CLLocationCoordinate2D v366;
  CLLocationCoordinate2D v367;
  CLLocationCoordinate2D v368;
  CLLocationCoordinate2D v369;
  CLLocationCoordinate2D v370;

  v364 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a5;
  v314 = v7;
  v318 = v8;
  v316 = v9;
  if (!v7)
  {
    GEOFindOrCreateLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEventKit.m";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 745;
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "-[MapsSuggestionsEventKit _q_createEntriesWithinPeriod:location:fetchMapItems:handler:]";
      *(_WORD *)&buf[28] = 2082;
      *(_QWORD *)&buf[30] = "nil == (period)";
      _os_log_impl(&dword_1A427D000, v18, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a period", buf, 0x26u);
    }
    goto LABEL_19;
  }
  if (!v8)
  {
    GEOFindOrCreateLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEventKit.m";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 746;
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "-[MapsSuggestionsEventKit _q_createEntriesWithinPeriod:location:fetchMapItems:handler:]";
      *(_WORD *)&buf[28] = 2082;
      *(_QWORD *)&buf[30] = "nil == (location)";
      _os_log_impl(&dword_1A427D000, v18, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a location", buf, 0x26u);
    }
    goto LABEL_19;
  }
  if (!v9)
  {
    GEOFindOrCreateLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEventKit.m";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 747;
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "-[MapsSuggestionsEventKit _q_createEntriesWithinPeriod:location:fetchMapItems:handler:]";
      *(_WORD *)&buf[28] = 2082;
      *(_QWORD *)&buf[30] = "nil == (handler)";
      _os_log_impl(&dword_1A427D000, v18, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a handler", buf, 0x26u);
    }
LABEL_19:

    goto LABEL_365;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  GEOFindOrCreateLog();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend((id)a1, "uniqueName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "_q_createEntriesWithinPeriod";
    _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

  }
  GEOFindOrCreateLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_q_createEntriesWithinPeriod", ", buf, 2u);
  }

  objc_initWeak(&location, (id)a1);
  if ((objc_msgSend((id)a1, "hasVisibleCalendars") & 1) == 0)
  {
    GEOFindOrCreateLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A427D000, v19, OS_LOG_TYPE_DEBUG, "Returning because all the calendars are invisible", buf, 2u);
    }

    v20 = *(NSObject **)(a1 + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __87__MapsSuggestionsEventKit__q_createEntriesWithinPeriod_location_fetchMapItems_handler___block_invoke;
    block[3] = &unk_1E4BCEB98;
    objc_copyWeak(&v351, &location);
    v350 = v316;
    dispatch_async(v20, block);

    objc_destroyWeak(&v351);
    goto LABEL_364;
  }
  v13 = *(void **)(a1 + 16);
  v14 = v7;
  objc_msgSend(*(id *)(a1 + 16), "visibleCalendars");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v17 = v15;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 16), "calendarsForEntityType:", 0);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    v23 = (void *)MEMORY[0x1E0C9AA60];
    if (v21)
      v23 = (void *)v21;
    v17 = v23;

  }
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v17, "count"));
  v355 = 0u;
  v356 = 0u;
  v353 = 0u;
  v354 = 0u;
  v25 = v17;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v353, buf, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v354;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v354 != v27)
          objc_enumerationMutation(v25);
        v29 = *(void **)(*((_QWORD *)&v353 + 1) + 8 * i);
        if (!objc_msgSend(v29, "isSuggestedEventCalendar") || GEOConfigGetBOOL())
          objc_msgSend(v24, "addObject:", v29);
      }
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v353, buf, 16);
    }
    while (v26);
  }

  v30 = *(void **)(a1 + 16);
  objc_msgSend(v14, "startDate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "endDate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v24, "copy");
  objc_msgSend(v30, "predicateForEventsWithStartDate:endDate:calendars:", v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "eventsMatchingPredicate:", v34);
  v305 = (void *)objc_claimAutoreleasedReturnValue();

  if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
    dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
  if (s_verbose)
  {
    GEOFindOrCreateLog();
    v35 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      v36 = objc_msgSend(v305, "count");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v36;
      _os_log_impl(&dword_1A427D000, v35, OS_LOG_TYPE_DEBUG, "Received %lu records from EKEventStore", buf, 0xCu);
    }

  }
  if (!objc_msgSend(v305, "count"))
  {
    GEOFindOrCreateLog();
    v285 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v285, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A427D000, v285, OS_LOG_TYPE_DEBUG, "Number of events are zero. Returning.", buf, 2u);
    }

    v286 = *(NSObject **)(a1 + 8);
    v346[0] = MEMORY[0x1E0C809B0];
    v346[1] = 3221225472;
    v346[2] = __87__MapsSuggestionsEventKit__q_createEntriesWithinPeriod_location_fetchMapItems_handler___block_invoke_271;
    v346[3] = &unk_1E4BCEB98;
    objc_copyWeak(&v348, &location);
    v347 = v316;
    dispatch_async(v286, v346);

    objc_destroyWeak(&v348);
    goto LABEL_363;
  }
  GEOFindOrCreateLog();
  v37 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend((id)a1, "uniqueName");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v38;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "_q_createEntriesWithinPeriod_Entries";
    _os_log_impl(&dword_1A427D000, v37, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

  }
  GEOFindOrCreateLog();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v39))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v39, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_q_createEntriesWithinPeriod_Entries", ", buf, 2u);
  }

  v311 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(*(id *)(a1 + 56), "allKeys");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v300 = (void *)objc_msgSend(v40, "mutableCopy");

  group = dispatch_group_create();
  v342 = 0u;
  v343 = 0u;
  v344 = 0u;
  v345 = 0u;
  obj = v305;
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v342, v361, 16);
  if (!v41)
    goto LABEL_354;
  v326 = *(_QWORD *)v343;
  do
  {
    v327 = v41;
    for (j = 0; j != v327; ++j)
    {
      if (*(_QWORD *)v343 != v326)
        objc_enumerationMutation(obj);
      v43 = *(void **)(*((_QWORD *)&v342 + 1) + 8 * j);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        GEOFindOrCreateLog();
        v46 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v43, "title");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v48;
          _os_log_impl(&dword_1A427D000, v46, OS_LOG_TYPE_DEBUG, "Skipping event {%@} because event is not of type EKCalenderItem", buf, 0xCu);

        }
LABEL_64:
        v49 = v46;
LABEL_65:

        continue;
      }
      if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
        dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
      if (s_verbose)
      {
        GEOFindOrCreateLog();
        v44 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v43, "title");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v45;
          _os_log_impl(&dword_1A427D000, v44, OS_LOG_TYPE_DEBUG, "Treating event {%@}", buf, 0xCu);

        }
      }
      if (objc_msgSend(v43, "status") == 3)
      {
        GEOFindOrCreateLog();
        v46 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v43, "title");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v47;
          _os_log_impl(&dword_1A427D000, v46, OS_LOG_TYPE_DEBUG, "Skipping event {%@} because the event is canceled", buf, 0xCu);

        }
        goto LABEL_64;
      }
      objc_msgSend(v43, "selfAttendee");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v50 == 0;

      if (!v51)
      {
        objc_msgSend(v43, "selfAttendee");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(v52, "participantStatus") == 3;

        if (v53)
        {
          GEOFindOrCreateLog();
          v46 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v43, "title");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v54;
            _os_log_impl(&dword_1A427D000, v46, OS_LOG_TYPE_DEBUG, "Skipping event {%@} because the participant declined the event", buf, 0xCu);

          }
          goto LABEL_64;
        }
      }
      GEOFindOrCreateLog();
      v55 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v43, "title");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v56;
        _os_log_impl(&dword_1A427D000, v55, OS_LOG_TYPE_DEBUG, "Treating event {%@}", buf, 0xCu);

      }
      v49 = v43;
      -[NSObject customObjectForKey:](v49, "customObjectForKey:", CFSTR("SuggestionsSchemaOrg"));
      v46 = objc_claimAutoreleasedReturnValue();
      -[NSObject uniqueId](v49, "uniqueId");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = v57 == 0;

      if (v58)
        goto LABEL_65;
      if (!v46 && (GEOConfigGetBOOL() & 1) == 0)
      {
        GEOFindOrCreateLog();
        v73 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
        {
          -[NSObject title](v49, "title");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v74;
          _os_log_impl(&dword_1A427D000, v73, OS_LOG_TYPE_DEBUG, "RoutineSource will process the calendar item %@ because it does not have the schema.org blob and the MapsSuggestionsCalendarEventsFromCalendarSource server default is NO", buf, 0xCu);

        }
        v46 = 0;
        goto LABEL_65;
      }
      v59 = v49;
      v49 = v59;
      if (!v59)
      {
        GEOFindOrCreateLog();
        v66 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A427D000, v66, OS_LOG_TYPE_DEBUG, "No Event", buf, 2u);
        }

LABEL_101:
LABEL_102:
        v323 = 0;
        goto LABEL_103;
      }
      -[NSObject preferredLocationWithoutPrediction](v59, "preferredLocationWithoutPrediction");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "geoLocation");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      if (v61)
      {
        -[NSObject preferredLocationWithoutPrediction](v49, "preferredLocationWithoutPrediction");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "geoLocation");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "coordinate");
        v64 = CLLocationCoordinate2DIsValid(v365);

        if (v64)
        {
          GEOFindOrCreateLog();
          v65 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A427D000, v65, OS_LOG_TYPE_DEBUG, "Using Event's preferredLocationWithoutPrediction", buf, 2u);
          }

          -[NSObject preferredLocationWithoutPrediction](v49, "preferredLocationWithoutPrediction");
          v323 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_103;
        }
      }
      else
      {

      }
      -[NSObject preferredLocation](v49, "preferredLocation");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "geoLocation");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      if (v68)
      {
        -[NSObject preferredLocation](v49, "preferredLocation");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "geoLocation");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "coordinate");
        v71 = CLLocationCoordinate2DIsValid(v366);

        if (v71)
        {
          GEOFindOrCreateLog();
          v72 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A427D000, v72, OS_LOG_TYPE_DEBUG, "Using Event's preferredLocation", buf, 2u);
          }

          -[NSObject preferredLocation](v49, "preferredLocation");
          v323 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_103;
        }
      }
      else
      {

      }
      -[NSObject structuredLocation](v49, "structuredLocation");
      v66 = objc_claimAutoreleasedReturnValue();
      -[NSObject geoLocation](v66, "geoLocation");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v75)
        goto LABEL_101;
      -[NSObject structuredLocation](v49, "structuredLocation");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "geoLocation");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "coordinate");
      v78 = CLLocationCoordinate2DIsValid(v367);

      if (!v78)
        goto LABEL_102;
      GEOFindOrCreateLog();
      v79 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A427D000, v79, OS_LOG_TYPE_DEBUG, "Using Event's structuredLocation", buf, 2u);
      }

      -[NSObject structuredLocation](v49, "structuredLocation");
      v323 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_103:

      objc_msgSend(v323, "geoLocation");
      v324 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v324)
      {
        GEOFindOrCreateLog();
        v80 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
        {
          -[NSObject title](v49, "title");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v82;
          _os_log_impl(&dword_1A427D000, v80, OS_LOG_TYPE_DEBUG, "Skipping event {%@} because it lacks a location", buf, 0xCu);

        }
        goto LABEL_109;
      }
      if (-[NSObject hasPredictedLocation](v49, "hasPredictedLocation"))
      {
        GEOFindOrCreateLog();
        v80 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
        {
          -[NSObject title](v49, "title");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v81;
          _os_log_impl(&dword_1A427D000, v80, OS_LOG_TYPE_DEBUG, "Skipping event {%@} because the location is a suggested location", buf, 0xCu);

        }
LABEL_109:

        goto LABEL_65;
      }
      if (v46)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[NSObject firstObject](v46, "firstObject");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            GEOFindOrCreateLog();
            v85 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v46;
              _os_log_impl(&dword_1A427D000, v85, OS_LOG_TYPE_DEBUG, "Received CustomObject:%@", buf, 0xCu);
            }

          }
        }
      }
      v46 = v46;
      -[NSObject firstObject](v46, "firstObject");
      v320 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v320, "objectForKeyedSubscript:", CFSTR("@type"));
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = v86;
      if (v86 && objc_msgSend(v86, "length"))
      {
        if (objc_msgSend(v87, "containsString:", CFSTR("http://schema.org/")))
        {
          objc_msgSend(v87, "stringByReplacingOccurrencesOfString:withString:", CFSTR("http://schema.org/"), &stru_1E4BDFC28);
          v88 = objc_claimAutoreleasedReturnValue();

          v87 = (void *)v88;
        }
        GEOFindOrCreateLog();
        v89 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v89, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v87;
          _os_log_impl(&dword_1A427D000, v89, OS_LOG_TYPE_DEBUG, "schemaType is %@", buf, 0xCu);
        }

        if (objc_msgSend(v87, "isEqualToString:", CFSTR("EventReservation")))
        {
          objc_msgSend(v320, "objectForKeyedSubscript:", CFSTR("reservationFor"));
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "objectForKeyedSubscript:", CFSTR("@type"));
          v91 = objc_claimAutoreleasedReturnValue();

          GEOFindOrCreateLog();
          v92 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v91;
            _os_log_impl(&dword_1A427D000, v92, OS_LOG_TYPE_DEBUG, "Subtype is %@", buf, 0xCu);
          }

          if (!objc_msgSend(*(id *)(a1 + 48), "containsObject:", v91))
            goto LABEL_127;
          objc_msgSend(v320, "objectForKeyedSubscript:", CFSTR("reservedTicket"));
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("ticketedSeat"));
          v94 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v94, "objectForKeyedSubscript:", CFSTR("seatSection"));
          v321 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "objectForKeyedSubscript:", CFSTR("seatRow"));
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "objectForKeyedSubscript:", CFSTR("seatNumber"));
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          v97 = objc_msgSend(v321, "length");
          v98 = objc_msgSend(v95, "length");
          LODWORD(v97) = v98 + v97 + objc_msgSend(v96, "length") == 0;

          if (!(_DWORD)v97)
          {
            v100 = 16;
          }
          else
          {
LABEL_127:
            GEOFindOrCreateLog();
            v99 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A427D000, v99, OS_LOG_TYPE_DEBUG, "No subtype available or no seat information available. Changing type to CalendarEvent.", buf, 2u);
            }

            v100 = 3;
          }
        }
        else
        {
          if (_MergedGlobals_32 != -1)
            dispatch_once(&_MergedGlobals_32, &__block_literal_global_6);
          objc_msgSend((id)qword_1ED22EF20, "objectForKeyedSubscript:", v87);
          v141 = objc_claimAutoreleasedReturnValue();
          v91 = v141;
          if (v141)
            v100 = -[NSObject integerValue](v141, "integerValue");
          else
            v100 = 0;
        }
      }
      else
      {
        GEOFindOrCreateLog();
        v91 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A427D000, v91, OS_LOG_TYPE_DEBUG, "Schema type cannot be nil. Defaulting to Calendar Event.", buf, 2u);
        }
        v100 = 3;
      }

      objc_msgSend(v324, "distanceFromLocation:", v318);
      v102 = v101;
      if (v100 != 15)
      {
        GEOConfigGetDouble();
        if (v103 < v102)
        {
          GEOFindOrCreateLog();
          v104 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v104, OS_LOG_TYPE_DEBUG))
          {
            -[NSObject title](v49, "title");
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v105;
            *(_WORD *)&buf[12] = 2048;
            *(double *)&buf[14] = v102;
            _os_log_impl(&dword_1A427D000, v104, OS_LOG_TYPE_DEBUG, "Skipping event {%@} because it is too far away (%.2f m).", buf, 0x16u);

          }
          goto LABEL_65;
        }
      }
      GEOConfigGetDouble();
      if (v100 == 15 || (v107 = v106, v100 == 13))
      {
        GEOConfigGetDouble();
        v107 = v108;
      }
      v109 = [MapsSuggestionsEntry alloc];
      -[NSObject title](v49, "title");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      v111 = -[MapsSuggestionsEntry initWithType:title:](v109, "initWithType:title:", v100, v110);

      objc_msgSend(v324, "coordinate");
      v113 = v112;
      v115 = v114;
      -[NSObject uniqueId](v49, "uniqueId");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      -[MapsSuggestionsEntry setString:forKey:](v111, "setString:forKey:", v116, CFSTR("MapsSuggestionsCalendarPK"));

      -[MapsSuggestionsEntry setString:forKey:](v111, "setString:forKey:", CFSTR("MapsSuggestionsCalendarPK"), CFSTR("MapsSuggestionsPrimaryKey"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v113);
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      -[MapsSuggestionsEntry setNumber:forKey:](v111, "setNumber:forKey:", v117, CFSTR("MapsSuggestionsLatitudeKey"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v115);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      -[MapsSuggestionsEntry setNumber:forKey:](v111, "setNumber:forKey:", v118, CFSTR("MapsSuggestionsLongitudeKey"));

      -[MapsSuggestionsEntry setBoolean:forKey:](v111, "setBoolean:forKey:", objc_msgSend(v324, "referenceFrame") != 2, CFSTR("MapsSuggestionsShiftCoordinateIfNeededKey"));
      -[NSObject location](v49, "location");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      v120 = v119;
      if (!v119)
      {
        -[NSObject locationWithoutPrediction](v49, "locationWithoutPrediction");
        v312 = (void *)objc_claimAutoreleasedReturnValue();
        v120 = v312;
      }
      -[MapsSuggestionsEntry setString:forKey:](v111, "setString:forKey:", v120, CFSTR("MapsSuggestionsDestinationAddressKey"));
      if (!v119)

      -[NSObject startDate](v49, "startDate");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      -[MapsSuggestionsEntry setDate:forKey:](v111, "setDate:forKey:", v121, CFSTR("MapsSuggestionsScheduledTimeKey"));

      -[NSObject endDate](v49, "endDate");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      -[MapsSuggestionsEntry setDate:forKey:](v111, "setDate:forKey:", v122, CFSTR("MapsSuggestionsScheduledEndTimeKey"));

      -[MapsSuggestionsEntry setBoolean:forKey:](v111, "setBoolean:forKey:", 1, CFSTR("MapsSuggestionsNeedsETATrackingKey"));
      -[NSObject suggestionInfo](v49, "suggestionInfo");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "opaqueKey");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      -[MapsSuggestionsEntry setString:forKey:](v111, "setString:forKey:", v124, CFSTR("MapsSuggestionsCoreSuggestionsOpaqueKey"));

      -[NSObject suggestionInfo](v49, "suggestionInfo");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v125, "uniqueKey");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      -[MapsSuggestionsEntry setString:forKey:](v111, "setString:forKey:", v126, CFSTR("MapsSuggestionsCoreSuggestionsUniqueKey"));

      -[NSObject eventIdentifier](v49, "eventIdentifier");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      -[MapsSuggestionsEntry setString:forKey:](v111, "setString:forKey:", v127, CFSTR("MapsSuggestionsEventIDKey"));

      -[NSObject endDate](v49, "endDate");
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      -[MapsSuggestionsEntry setExpires:](v111, "setExpires:", v128);

      -[NSObject timeZone](v49, "timeZone");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v129, "name");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      -[MapsSuggestionsEntry setString:forKey:](v111, "setString:forKey:", v130, CFSTR("MapsSuggestionsEventTimeZoneKey"));

      -[MapsSuggestionsEntry setBoolean:forKey:](v111, "setBoolean:forKey:", v107 > v102, CFSTR("MapsSuggestionsAlreadyThereKey"));
      v322 = v49;
      -[NSObject organizer](v322, "organizer");
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      if (v131)
      {
        -[NSObject organizer](v322, "organizer");
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        v133 = objc_msgSend(v132, "isCurrentUser");

        v134 = v133 ^ 1u;
      }
      else
      {
        v134 = 0;
      }

      -[MapsSuggestionsEntry setBoolean:forKey:](v111, "setBoolean:forKey:", v134, CFSTR("MapsSuggestionsCalendarIsInvitationKey"));
      v135 = objc_alloc(MEMORY[0x1E0C99E60]);
      v360 = MapsSuggestionsCalendarAppBundleID;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v360, 1);
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      v315 = (void *)objc_msgSend(v135, "initWithArray:", v136);

      -[MapsSuggestionsEntry setSet:forKey:](v111, "setSet:forKey:", v315, CFSTR("MapsSuggestionsAssociatedBundleIDsKey"));
      -[MapsSuggestionsEntry setBoolean:forKey:](v111, "setBoolean:forKey:", -[NSObject hasRecurrenceRules](v322, "hasRecurrenceRules"), CFSTR("MapsSuggestionsCalendarEventIsRecurringKey"));
      -[NSObject calendar](v322, "calendar");
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v136) = objc_msgSend(v137, "sharingStatus") == 2;

      if ((_DWORD)v136)
        -[MapsSuggestionsEntry setBoolean:forKey:](v111, "setBoolean:forKey:", 1, CFSTR("MapsSuggestionsCalendarIsSharedToMeKey"));
      objc_msgSend(v323, "title");
      v317 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v317, "length"))
      {
        v138 = v317;
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        *(_QWORD *)&buf[24] = __Block_byref_object_copy__4;
        *(_QWORD *)&buf[32] = __Block_byref_object_dispose__4;
        v363 = 0;
        *(_QWORD *)&v353 = MEMORY[0x1E0C809B0];
        *((_QWORD *)&v353 + 1) = 3221225472;
        *(_QWORD *)&v354 = ___firstLineOfString_block_invoke;
        *((_QWORD *)&v354 + 1) = &unk_1E4BCECA0;
        *(_QWORD *)&v355 = buf;
        objc_msgSend(v138, "enumerateLinesUsingBlock:", &v353);
        v139 = *(id *)(*(_QWORD *)&buf[8] + 40);
        _Block_object_dispose(buf, 8);

        -[MapsSuggestionsEntry setString:forKey:](v111, "setString:forKey:", v139, CFSTR("MapsSuggestionsEntryTitleNameKey"));
        GEOFindOrCreateLog();
        v140 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v140, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v138;
          _os_log_impl(&dword_1A427D000, v140, OS_LOG_TYPE_DEBUG, "About to process entry with name %@.", buf, 0xCu);
        }

      }
      switch(-[MapsSuggestionsEntry type](v111, "type"))
      {
        case 3:
          if (-[MapsSuggestionsEventKit _addCalendarEventFieldsToEntry:event:](v111, v322))
            goto LABEL_192;
          goto LABEL_279;
        case 8:
          v170 = v111;
          v309 = v320;
          v303 = v322;
          v144 = v170;
          if (-[MapsSuggestionsEntry type](v170, "type") != 8)
          {
            GEOFindOrCreateLog();
            v194 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v194, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446978;
              *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEventKit.m";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 627;
              *(_WORD *)&buf[18] = 2082;
              *(_QWORD *)&buf[20] = "-[MapsSuggestionsEventKit _addRestaurantReservationFieldsToEntry:fromSchemaOrgDictionary:event:]";
              *(_WORD *)&buf[28] = 2082;
              *(_QWORD *)&buf[30] = "entry.type != MapsSuggestionsEntryTypeRestaurantReservation";
              _os_log_impl(&dword_1A427D000, v194, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Entry needs to be of type MapsSuggestionsEntryTypeRestaurantReservation", buf, 0x26u);
            }

            goto LABEL_279;
          }
          GEOConfigGetDouble();
          -[MapsSuggestionsEntry setWeight:](v170, "setWeight:");
          -[NSObject endDate](v303, "endDate");
          v171 = (void *)objc_claimAutoreleasedReturnValue();
          GEOConfigGetDouble();
          objc_msgSend(v171, "dateByAddingTimeInterval:");
          v172 = (void *)objc_claimAutoreleasedReturnValue();
          -[MapsSuggestionsEntry setExpires:](v144, "setExpires:", v172);

          objc_msgSend(v309, "objectForKeyedSubscript:", CFSTR("reservationId"));
          v173 = (void *)objc_claimAutoreleasedReturnValue();
          v174 = v173;
          if (v173)
          {
            v297 = v173;
          }
          else
          {
            -[NSObject suggestionInfo](v303, "suggestionInfo");
            v199 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v199, "uniqueKey");
            v297 = (id)objc_claimAutoreleasedReturnValue();

          }
          -[MapsSuggestionsEntry setString:forKey:](v144, "setString:forKey:", v297, CFSTR("MapsSuggestionsReservationsBookingIDKey"));
          if (v297)
            -[MapsSuggestionsEntry setString:forKey:](v144, "setString:forKey:", CFSTR("MapsSuggestionsReservationsBookingIDKey"), CFSTR("MapsSuggestionsPrimaryKey"));
          objc_msgSend(v309, "objectForKeyedSubscript:", CFSTR("partySize"));
          v200 = (void *)objc_claimAutoreleasedReturnValue();
          -[MapsSuggestionsEntry setNumber:forKey:](v144, "setNumber:forKey:", v200, CFSTR("MapsSuggestionsReservationsPartySizeKey"));

          objc_msgSend(v309, "objectForKeyedSubscript:", CFSTR("reservationStatus"));
          v289 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v309, "objectForKeyedSubscript:", CFSTR("reservationFor"));
          v201 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v201, "objectForKeyedSubscript:", CFSTR("name"));
          v293 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v293, "length"))
          {
            v202 = v293;
            goto LABEL_339;
          }
          v203 = v303;
          v287 = v203;
          if (!v49)
          {
            GEOFindOrCreateLog();
            v234 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v234, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A427D000, v234, OS_LOG_TYPE_DEBUG, "No Event", buf, 2u);
            }
LABEL_336:

            goto LABEL_337;
          }
          -[NSObject preferredLocationWithoutPrediction](v203, "preferredLocationWithoutPrediction");
          v204 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v204, "geoLocation");
          v205 = (void *)objc_claimAutoreleasedReturnValue();
          if (v205)
          {
            -[NSObject preferredLocationWithoutPrediction](v287, "preferredLocationWithoutPrediction");
            v206 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v206, "geoLocation");
            v207 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v207, "coordinate");
            v208 = CLLocationCoordinate2DIsValid(v368);

            if (v208)
            {
              GEOFindOrCreateLog();
              v209 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v209, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A427D000, v209, OS_LOG_TYPE_DEBUG, "Using Event's preferredLocationWithoutPrediction", buf, 2u);
              }

              -[NSObject preferredLocationWithoutPrediction](v287, "preferredLocationWithoutPrediction");
              v210 = objc_claimAutoreleasedReturnValue();
LABEL_335:
              v273 = (void *)v210;
              goto LABEL_338;
            }
          }
          else
          {

          }
          -[NSObject preferredLocation](v287, "preferredLocation");
          v261 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v261, "geoLocation");
          v262 = (void *)objc_claimAutoreleasedReturnValue();
          if (v262)
          {
            -[NSObject preferredLocation](v287, "preferredLocation");
            v263 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v263, "geoLocation");
            v264 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v264, "coordinate");
            v265 = CLLocationCoordinate2DIsValid(v369);

            if (v265)
            {
              GEOFindOrCreateLog();
              v266 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v266, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A427D000, v266, OS_LOG_TYPE_DEBUG, "Using Event's preferredLocation", buf, 2u);
              }

              -[NSObject preferredLocation](v287, "preferredLocation");
              v210 = objc_claimAutoreleasedReturnValue();
              goto LABEL_335;
            }
          }
          else
          {

          }
          -[NSObject structuredLocation](v287, "structuredLocation");
          v234 = objc_claimAutoreleasedReturnValue();
          -[NSObject geoLocation](v234, "geoLocation");
          v268 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v268)
            goto LABEL_336;
          -[NSObject structuredLocation](v287, "structuredLocation");
          v269 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v269, "geoLocation");
          v270 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v270, "coordinate");
          v271 = CLLocationCoordinate2DIsValid(v370);

          if (v271)
          {
            GEOFindOrCreateLog();
            v272 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v272, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A427D000, v272, OS_LOG_TYPE_DEBUG, "Using Event's structuredLocation", buf, 2u);
            }

            -[NSObject structuredLocation](v287, "structuredLocation");
            v210 = objc_claimAutoreleasedReturnValue();
            goto LABEL_335;
          }
LABEL_337:
          v273 = 0;
LABEL_338:

          objc_msgSend(v273, "title");
          v274 = objc_claimAutoreleasedReturnValue();

          v202 = (void *)v274;
LABEL_339:
          v275 = v202;
          v276 = objc_msgSend(v202, "length");
          if (v276)
          {
            -[MapsSuggestionsEntry setTitle:](v144, "setTitle:", v275);
            v277 = v289;
            if ((objc_msgSend(v277, "isEqualToString:", CFSTR("http://schema.org/ReservationConfirmed")) & 1) != 0)
            {
              v278 = 1;
            }
            else if ((objc_msgSend(v277, "isEqualToString:", CFSTR("http://schema.org/ReservationCancelled")) & 1) != 0)
            {
              v278 = 2;
            }
            else if (objc_msgSend(v277, "isEqualToString:", CFSTR("http://schema.org/ReservationPending")))
            {
              v278 = 3;
            }
            else
            {
              v278 = 0;
            }

            -[MapsSuggestionsEntry setInteger:forKey:](v144, "setInteger:forKey:", v278, CFSTR("MapsSuggestionsReservationsStatusKey"));
          }
          else
          {
            GEOFindOrCreateLog();
            v279 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v279, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446978;
              *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEventKit.m";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 650;
              *(_WORD *)&buf[18] = 2082;
              *(_QWORD *)&buf[20] = "-[MapsSuggestionsEventKit _addRestaurantReservationFieldsToEntry:fromSchemaOrgDictionary:event:]";
              *(_WORD *)&buf[28] = 2082;
              *(_QWORD *)&buf[30] = "name.length == 0u";
              _os_log_impl(&dword_1A427D000, v279, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Entry does not have name in either schema.org dictionary or in the event object", buf, 0x26u);
            }

          }
          if (v276)
            goto LABEL_282;
          goto LABEL_279;
        case 13:
          v142 = v111;
          v143 = v320;
          v301 = v322;
          v144 = v142;
          v307 = -[MapsSuggestionsEntry type](v142, "type");
          if (v307 == 13)
          {
            -[NSObject endDate](v301, "endDate");
            v145 = (void *)objc_claimAutoreleasedReturnValue();
            GEOConfigGetDouble();
            objc_msgSend(v145, "dateByAddingTimeInterval:");
            v146 = (void *)objc_claimAutoreleasedReturnValue();
            -[MapsSuggestionsEntry setExpires:](v144, "setExpires:", v146);

            GEOConfigGetDouble();
            -[MapsSuggestionsEntry setWeight:](v144, "setWeight:");
            v295 = v144;
            v147 = v143;
            objc_msgSend(v147, "objectForKeyedSubscript:", CFSTR("checkinTime"));
            v148 = (void *)objc_claimAutoreleasedReturnValue();
            if (v148)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                MapsSuggestionsDateFromString(v148);
                v291 = (void *)objc_claimAutoreleasedReturnValue();
                GEOFindOrCreateLog();
                v149 = objc_claimAutoreleasedReturnValue();
                v150 = v149;
                if (v291)
                {
                  if (os_log_type_enabled(v149, OS_LOG_TYPE_DEBUG))
                  {
                    objc_msgSend(v147, "objectForKeyedSubscript:", CFSTR("checkinTime"));
                    v151 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    *(_QWORD *)&buf[4] = CFSTR("checkinTime");
                    *(_WORD *)&buf[12] = 2112;
                    *(_QWORD *)&buf[14] = v151;
                    _os_log_impl(&dword_1A427D000, v150, OS_LOG_TYPE_DEBUG, "%@ time from schema is %@", buf, 0x16u);

                  }
                  -[MapsSuggestionsEntry setDate:forKey:](v295, "setDate:forKey:", v291, CFSTR("MapsSuggestionsScheduledTimeKey"));
                }
                else
                {
                  if (os_log_type_enabled(v149, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(_QWORD *)&buf[4] = CFSTR("checkinTime");
                    _os_log_impl(&dword_1A427D000, v150, OS_LOG_TYPE_ERROR, "Could not parse date '%@'", buf, 0xCu);
                  }
                  v291 = v150;
                }

              }
            }

            v190 = v295;
            v235 = v147;
            objc_msgSend(v235, "objectForKeyedSubscript:", CFSTR("checkoutTime"));
            v236 = (void *)objc_claimAutoreleasedReturnValue();
            if (v236)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                MapsSuggestionsDateFromString(v236);
                v299 = (void *)objc_claimAutoreleasedReturnValue();
                GEOFindOrCreateLog();
                v237 = objc_claimAutoreleasedReturnValue();
                v238 = v237;
                if (v299)
                {
                  if (os_log_type_enabled(v237, OS_LOG_TYPE_DEBUG))
                  {
                    objc_msgSend(v235, "objectForKeyedSubscript:", CFSTR("checkoutTime"));
                    v239 = objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    *(_QWORD *)&buf[4] = CFSTR("checkoutTime");
                    *(_WORD *)&buf[12] = 2112;
                    v294 = (void *)v239;
                    *(_QWORD *)&buf[14] = v239;
                    _os_log_impl(&dword_1A427D000, v238, OS_LOG_TYPE_DEBUG, "%@ time from schema is %@", buf, 0x16u);

                  }
                  -[NSObject setDate:forKey:](v190, "setDate:forKey:", v299, CFSTR("MapsSuggestionsScheduledEndTimeKey"));
                }
                else
                {
                  if (os_log_type_enabled(v237, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(_QWORD *)&buf[4] = CFSTR("checkoutTime");
                    _os_log_impl(&dword_1A427D000, v238, OS_LOG_TYPE_ERROR, "Could not parse date '%@'", buf, 0xCu);
                  }
                  v299 = v238;
                }

              }
            }

          }
          else
          {
            GEOFindOrCreateLog();
            v190 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v190, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446978;
              *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEventKit.m";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 397;
              *(_WORD *)&buf[18] = 2082;
              *(_QWORD *)&buf[20] = "-[MapsSuggestionsEventKit _addHotelFieldsToEntry:fromSchemaOrgDictionary:event:]";
              *(_WORD *)&buf[28] = 2082;
              *(_QWORD *)&buf[30] = "entry.type != MapsSuggestionsEntryTypeHotel";
              _os_log_impl(&dword_1A427D000, v190, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Entry needs to be of type MapsSuggestionsEntryTypeHotel", buf, 0x26u);
            }
          }
          v233 = v307 == 13;

          goto LABEL_278;
        case 14:
          v152 = v111;
          v153 = v322;
          if (-[MapsSuggestionsEntry type](v152, "type") == 14)
          {
            -[NSObject customObjectForKey:](v153, "customObjectForKey:", CFSTR("SGEventMetadataKey"));
            v308 = objc_claimAutoreleasedReturnValue();
            if (!v308)
            {
              GEOFindOrCreateLog();
              v191 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v191, OS_LOG_TYPE_ERROR))
                goto LABEL_215;
              *(_WORD *)buf = 0;
              v197 = v191;
              v198 = "Suggestions custom object is nil. Returning.";
LABEL_231:
              _os_log_impl(&dword_1A427D000, v197, OS_LOG_TYPE_ERROR, v198, buf, 2u);
              goto LABEL_215;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              GEOFindOrCreateLog();
              v191 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v191, OS_LOG_TYPE_ERROR))
                goto LABEL_215;
              *(_WORD *)buf = 0;
              v197 = v191;
              v198 = "Suggestions custom object is not an NSDictionary. Returning.";
              goto LABEL_231;
            }
            -[NSObject objectForKeyedSubscript:](v308, "objectForKeyedSubscript:", CFSTR("SGEventMetadataCategoryDescriptionKey"));
            v302 = objc_claimAutoreleasedReturnValue();
            GEOConfigGetDouble();
            -[MapsSuggestionsEntry setWeight:](v152, "setWeight:");
            -[NSObject startDate](v153, "startDate");
            v175 = (void *)objc_claimAutoreleasedReturnValue();
            -[MapsSuggestionsEntry setDate:forKey:](v152, "setDate:forKey:", v175, CFSTR("MapsSuggestionsScheduledTimeKey"));

            -[NSObject endDate](v153, "endDate");
            v176 = (void *)objc_claimAutoreleasedReturnValue();
            -[MapsSuggestionsEntry setDate:forKey:](v152, "setDate:forKey:", v176, CFSTR("MapsSuggestionsScheduledEndTimeKey"));

            -[NSObject endDate](v153, "endDate");
            v177 = (void *)objc_claimAutoreleasedReturnValue();
            -[MapsSuggestionsEntry setExpires:](v152, "setExpires:", v177);

            v178 = -[NSObject isEqualToString:](v302, "isEqualToString:", CFSTR("CarRentalPickup"));
            if ((v178 & 1) != 0
              || -[NSObject isEqualToString:](v302, "isEqualToString:", CFSTR("CarRentalDropoff")))
            {
              -[MapsSuggestionsEntry setBoolean:forKey:](v152, "setBoolean:forKey:", v178, CFSTR("MapsSuggestionsCalendarCarRentalIsPickupDayKey"));
              goto LABEL_191;
            }
            GEOFindOrCreateLog();
            v267 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v267, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A427D000, v267, OS_LOG_TYPE_DEBUG, "Neither pickup nor drop off, not processing as a Car Rental entry. Returning NO.", buf, 2u);
            }

            v191 = v302;
LABEL_215:

          }
          else
          {
            GEOFindOrCreateLog();
            v195 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v195, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446978;
              *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEventKit.m";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 411;
              *(_WORD *)&buf[18] = 2082;
              *(_QWORD *)&buf[20] = "-[MapsSuggestionsEventKit _addCarRentalFieldsToEntry:event:]";
              *(_WORD *)&buf[28] = 2082;
              *(_QWORD *)&buf[30] = "entry.type != MapsSuggestionsEntryTypeCarRental";
              _os_log_impl(&dword_1A427D000, v195, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Entry needs to be of type MapsSuggestionsEntryTypeCarRental", buf, 0x26u);
            }

          }
LABEL_279:
          GEOFindOrCreateLog();
          v240 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v240, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A427D000, v240, OS_LOG_TYPE_DEBUG, "Changing type of the entry to MapsSuggestionsEntryTypeCalendarEvent", buf, 2u);
          }

          v241 = [MapsSuggestionsEntry alloc];
          -[MapsSuggestionsEntry title](v111, "title");
          v242 = (void *)objc_claimAutoreleasedReturnValue();
          v243 = -[MapsSuggestionsEntry initWithType:title:](v241, "initWithType:title:", 3, v242);

          objc_msgSend((id)v243, "mergeFromSuggestionEntry:behavior:", v111, 0);
          v144 = (MapsSuggestionsEntry *)(id)v243;

          LOBYTE(v243) = -[MapsSuggestionsEventKit _addCalendarEventFieldsToEntry:event:](v144, v322);
          if ((v243 & 1) != 0)
            goto LABEL_282;
          GEOFindOrCreateLog();
          v168 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v168, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v320;
            _os_log_impl(&dword_1A427D000, v168, OS_LOG_TYPE_ERROR, "This should never happen. Continue - unusable Schema.org dictionary %@ AND bad event data to construct a sensible Calendar Event entry", buf, 0xCu);
          }
          goto LABEL_299;
        case 15:
          v179 = v111;
          v292 = v320;
          v304 = v322;
          v144 = v179;
          if (-[MapsSuggestionsEntry type](v179, "type") != 15)
          {
            GEOFindOrCreateLog();
            v196 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v196, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446978;
              *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEventKit.m";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 300;
              *(_WORD *)&buf[18] = 2082;
              *(_QWORD *)&buf[20] = "-[MapsSuggestionsEventKit _addTravelFlightFieldsToEntry:fromSchemaOrgDictionary:event:]";
              *(_WORD *)&buf[28] = 2082;
              *(_QWORD *)&buf[30] = "entry.type != MapsSuggestionsEntryTypeTravelFlight";
              _os_log_impl(&dword_1A427D000, v196, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Entry needs to be of type MapsSuggestionsEntryTypeTravelFlight", buf, 0x26u);
            }

            goto LABEL_279;
          }
          -[NSObject startDate](v304, "startDate");
          v180 = (void *)objc_claimAutoreleasedReturnValue();
          GEOConfigGetDouble();
          objc_msgSend(v180, "dateByAddingTimeInterval:");
          v181 = (void *)objc_claimAutoreleasedReturnValue();
          -[MapsSuggestionsEntry setExpires:](v144, "setExpires:", v181);

          GEOConfigGetDouble();
          -[MapsSuggestionsEntry setWeight:](v144, "setWeight:");
          -[NSObject startDate](v304, "startDate");
          v182 = (void *)objc_claimAutoreleasedReturnValue();
          -[MapsSuggestionsEntry setDate:forKey:](v144, "setDate:forKey:", v182, CFSTR("MapsSuggestionsFlightDepartureTimeKey"));

          objc_msgSend(v292, "objectForKeyedSubscript:", CFSTR("reservationFor"));
          v310 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v310, "objectForKeyedSubscript:", CFSTR("flightNumber"));
          v183 = (void *)objc_claimAutoreleasedReturnValue();
          v184 = (void *)MEMORY[0x1E0CB3500];
          v298 = v183;
          objc_msgSend(v184, "letterCharacterSet");
          v185 = (void *)objc_claimAutoreleasedReturnValue();
          v186 = objc_msgSend(v298, "rangeOfCharacterFromSet:", v185);

          if (v186 == 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v310, "objectForKeyedSubscript:", CFSTR("airlineCode"));
            v187 = (void *)objc_claimAutoreleasedReturnValue();
            v188 = v187;
            if (v187)
            {
              v189 = v187;
            }
            else
            {
              objc_msgSend(v310, "objectForKeyedSubscript:", CFSTR("airline"));
              v211 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v211, "objectForKeyedSubscript:", CFSTR("iataCode"));
              v189 = (id)objc_claimAutoreleasedReturnValue();

            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v189, "length"))
            {
              v212 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@%@"), v189, v298);

              v298 = (id)v212;
            }

          }
          -[MapsSuggestionsEntry setString:forKey:](v144, "setString:forKey:", v298, CFSTR("MapsSuggestionsFullFlightNumberKey"));
          objc_msgSend(v310, "objectForKey:", CFSTR("departureAirportCode"));
          v290 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v290, "length"))
          {
            v213 = v290;
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = buf;
            *(_QWORD *)&buf[16] = 0x3032000000;
            *(_QWORD *)&buf[24] = __Block_byref_object_copy__4;
            *(_QWORD *)&buf[32] = __Block_byref_object_dispose__4;
            v363 = 0;
            *(_QWORD *)&v353 = MEMORY[0x1E0C809B0];
            *((_QWORD *)&v353 + 1) = 3221225472;
            *(_QWORD *)&v354 = ___firstLineOfString_block_invoke;
            *((_QWORD *)&v354 + 1) = &unk_1E4BCECA0;
            *(_QWORD *)&v355 = buf;
            objc_msgSend(v213, "enumerateLinesUsingBlock:", &v353);
            v214 = *(id *)(*(_QWORD *)&buf[8] + 40);
            _Block_object_dispose(buf, 8);

            -[MapsSuggestionsEntry setString:forKey:](v144, "setString:forKey:", v214, CFSTR("MapsSuggestionsEntryTitleNameKey"));
            v215 = v213;
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = buf;
            *(_QWORD *)&buf[16] = 0x3032000000;
            *(_QWORD *)&buf[24] = __Block_byref_object_copy__4;
            *(_QWORD *)&buf[32] = __Block_byref_object_dispose__4;
            v363 = 0;
            *(_QWORD *)&v353 = MEMORY[0x1E0C809B0];
            *((_QWORD *)&v353 + 1) = 3221225472;
            *(_QWORD *)&v354 = ___firstLineOfString_block_invoke;
            *((_QWORD *)&v354 + 1) = &unk_1E4BCECA0;
            *(_QWORD *)&v355 = buf;
            objc_msgSend(v215, "enumerateLinesUsingBlock:", &v353);
            v216 = *(id *)(*(_QWORD *)&buf[8] + 40);
            _Block_object_dispose(buf, 8);

            -[MapsSuggestionsEntry setString:forKey:](v144, "setString:forKey:", v216, CFSTR("MapsSuggestionsFlightDepartureAirportCodeKey"));
          }
          objc_msgSend(v310, "objectForKey:", CFSTR("arrivalAirportCode"));
          v288 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v288, "length"))
          {
            v217 = v288;
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = buf;
            *(_QWORD *)&buf[16] = 0x3032000000;
            *(_QWORD *)&buf[24] = __Block_byref_object_copy__4;
            *(_QWORD *)&buf[32] = __Block_byref_object_dispose__4;
            v363 = 0;
            *(_QWORD *)&v353 = MEMORY[0x1E0C809B0];
            *((_QWORD *)&v353 + 1) = 3221225472;
            *(_QWORD *)&v354 = ___firstLineOfString_block_invoke;
            *((_QWORD *)&v354 + 1) = &unk_1E4BCECA0;
            *(_QWORD *)&v355 = buf;
            objc_msgSend(v217, "enumerateLinesUsingBlock:", &v353);
            v218 = *(id *)(*(_QWORD *)&buf[8] + 40);
            _Block_object_dispose(buf, 8);

            -[MapsSuggestionsEntry setString:forKey:](v144, "setString:forKey:", v218, CFSTR("MapsSuggestionsFlightArrivalAirportCodeKey"));
          }
          objc_msgSend(v310, "objectForKey:", CFSTR("departureAirport"));
          v219 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v219, "objectForKey:", CFSTR("iataCode"));
            v220 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v220, "length"))
            {
              v221 = v220;
              *(_QWORD *)buf = 0;
              *(_QWORD *)&buf[8] = buf;
              *(_QWORD *)&buf[16] = 0x3032000000;
              *(_QWORD *)&buf[24] = __Block_byref_object_copy__4;
              *(_QWORD *)&buf[32] = __Block_byref_object_dispose__4;
              v363 = 0;
              *(_QWORD *)&v353 = MEMORY[0x1E0C809B0];
              *((_QWORD *)&v353 + 1) = 3221225472;
              *(_QWORD *)&v354 = ___firstLineOfString_block_invoke;
              *((_QWORD *)&v354 + 1) = &unk_1E4BCECA0;
              *(_QWORD *)&v355 = buf;
              objc_msgSend(v221, "enumerateLinesUsingBlock:", &v353);
              v222 = *(id *)(*(_QWORD *)&buf[8] + 40);
              _Block_object_dispose(buf, 8);

              -[MapsSuggestionsEntry setString:forKey:](v144, "setString:forKey:", v222, CFSTR("MapsSuggestionsEntryTitleNameKey"));
              v223 = v221;
              *(_QWORD *)buf = 0;
              *(_QWORD *)&buf[8] = buf;
              *(_QWORD *)&buf[16] = 0x3032000000;
              *(_QWORD *)&buf[24] = __Block_byref_object_copy__4;
              *(_QWORD *)&buf[32] = __Block_byref_object_dispose__4;
              v363 = 0;
              *(_QWORD *)&v353 = MEMORY[0x1E0C809B0];
              *((_QWORD *)&v353 + 1) = 3221225472;
              *(_QWORD *)&v354 = ___firstLineOfString_block_invoke;
              *((_QWORD *)&v354 + 1) = &unk_1E4BCECA0;
              *(_QWORD *)&v355 = buf;
              objc_msgSend(v223, "enumerateLinesUsingBlock:", &v353);
              v224 = *(id *)(*(_QWORD *)&buf[8] + 40);
              _Block_object_dispose(buf, 8);

              -[MapsSuggestionsEntry setString:forKey:](v144, "setString:forKey:", v224, CFSTR("MapsSuggestionsFlightDepartureAirportCodeKey"));
            }

          }
          objc_msgSend(v310, "objectForKey:", CFSTR("arrivalAirport"));
          v225 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v225, "objectForKeyedSubscript:", CFSTR("iataCode"));
            v226 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v226, "length"))
            {
              v227 = v226;
              *(_QWORD *)buf = 0;
              *(_QWORD *)&buf[8] = buf;
              *(_QWORD *)&buf[16] = 0x3032000000;
              *(_QWORD *)&buf[24] = __Block_byref_object_copy__4;
              *(_QWORD *)&buf[32] = __Block_byref_object_dispose__4;
              v363 = 0;
              *(_QWORD *)&v353 = MEMORY[0x1E0C809B0];
              *((_QWORD *)&v353 + 1) = 3221225472;
              *(_QWORD *)&v354 = ___firstLineOfString_block_invoke;
              *((_QWORD *)&v354 + 1) = &unk_1E4BCECA0;
              *(_QWORD *)&v355 = buf;
              objc_msgSend(v227, "enumerateLinesUsingBlock:", &v353);
              v228 = *(id *)(*(_QWORD *)&buf[8] + 40);
              _Block_object_dispose(buf, 8);

              -[MapsSuggestionsEntry setString:forKey:](v144, "setString:forKey:", v228, CFSTR("MapsSuggestionsFlightArrivalAirportCodeKey"));
            }

          }
          if (-[MapsSuggestionsEntry containsKey:](v144, "containsKey:", CFSTR("MapsSuggestionsFlightArrivalAirportCodeKey")))
          {
            v229 = dispatch_group_create();
            dispatch_group_enter(v229);
            v230 = *(void **)(a1 + 24);
            v357[0] = MEMORY[0x1E0C809B0];
            v357[1] = 3221225472;
            v357[2] = __87__MapsSuggestionsEventKit__addTravelFlightFieldsToEntry_fromSchemaOrgDictionary_event___block_invoke;
            v357[3] = &unk_1E4BCEB50;
            v358 = v229;
            v231 = v229;
            MapsSuggestionsSetArrivalAirportFieldsForEntry(v144, v230, v357);
            dispatch_group_wait(v231, 0xFFFFFFFFFFFFFFFFLL);
            v359 = 1;

          }
          else
          {
            GEOFindOrCreateLog();
            v232 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v232, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A427D000, v232, OS_LOG_TYPE_INFO, "Did not find arrival airport information in flight schema. Returning what we have.", buf, 2u);
            }

            v359 = 1;
          }

          v233 = v359;
LABEL_278:
          if (!v233)
            goto LABEL_279;
          goto LABEL_282;
        case 16:
          v152 = v111;
          v153 = v320;
          v308 = v322;
          if (-[MapsSuggestionsEntry type](v152, "type") != 16)
          {
            GEOFindOrCreateLog();
            v191 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v191, OS_LOG_TYPE_ERROR))
              goto LABEL_215;
            *(_DWORD *)buf = 136446978;
            *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEventKit.m";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 453;
            *(_WORD *)&buf[18] = 2082;
            *(_QWORD *)&buf[20] = "-[MapsSuggestionsEventKit _addTicketedEventFieldsToEntry:fromSchemaOrgDictionary:event:]";
            *(_WORD *)&buf[28] = 2082;
            *(_QWORD *)&buf[30] = "entry.type != MapsSuggestionsEntryTypeTicketedEvent";
            v192 = v191;
            v193 = "At %{public}s:%d, %{public}s forbids: %{public}s. Entry needs to be of type MapsSuggestionsEntryTypeTicketedEvent";
LABEL_214:
            _os_log_impl(&dword_1A427D000, v192, OS_LOG_TYPE_ERROR, v193, buf, 0x26u);
            goto LABEL_215;
          }
          if (!v153)
          {
            GEOFindOrCreateLog();
            v191 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v191, OS_LOG_TYPE_ERROR))
              goto LABEL_215;
            *(_DWORD *)buf = 136446978;
            *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEventKit.m";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 454;
            *(_WORD *)&buf[18] = 2082;
            *(_QWORD *)&buf[20] = "-[MapsSuggestionsEventKit _addTicketedEventFieldsToEntry:fromSchemaOrgDictionary:event:]";
            *(_WORD *)&buf[28] = 2082;
            *(_QWORD *)&buf[30] = "schema == nil";
            v192 = v191;
            v193 = "At %{public}s:%d, %{public}s forbids: %{public}s. Schema dictionary cannot be nil";
            goto LABEL_214;
          }
          -[NSObject endDate](v308, "endDate");
          v154 = (void *)objc_claimAutoreleasedReturnValue();
          GEOConfigGetDouble();
          objc_msgSend(v154, "dateByAddingTimeInterval:");
          v155 = (void *)objc_claimAutoreleasedReturnValue();
          -[MapsSuggestionsEntry setExpires:](v152, "setExpires:", v155);

          GEOConfigGetDouble();
          -[MapsSuggestionsEntry setWeight:](v152, "setWeight:");
          -[NSObject startDate](v308, "startDate");
          v156 = (void *)objc_claimAutoreleasedReturnValue();
          -[MapsSuggestionsEntry setDate:forKey:](v152, "setDate:forKey:", v156, CFSTR("MapsSuggestionsCalendarTicketedEventShowTimeKey"));

          -[NSObject title](v308, "title");
          v157 = (void *)objc_claimAutoreleasedReturnValue();
          -[MapsSuggestionsEntry setString:forKey:](v152, "setString:forKey:", v157, CFSTR("MapsSuggestionsCalendarTicketedEventNameKey"));

          v302 = objc_opt_new();
          -[NSObject objectForKeyedSubscript:](v153, "objectForKeyedSubscript:", CFSTR("reservedTicket"));
          v158 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v158, "objectForKeyedSubscript:", CFSTR("ticketedSeat"));
          v159 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v159, "objectForKeyedSubscript:", CFSTR("seatSection"));
          v296 = (void *)objc_claimAutoreleasedReturnValue();
          if (v296)
          {
            MapsSuggestionsLocalizedTicketedEvent_SectionString(v296);
            v160 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject addObject:](v302, "addObject:", v160);

          }
          objc_msgSend(v159, "objectForKeyedSubscript:", CFSTR("seatRow"));
          v161 = (void *)objc_claimAutoreleasedReturnValue();
          v162 = v161;
          if (v161)
          {
            MapsSuggestionsLocalizedTicketedEvent_SeatRowString(v161);
            v163 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject addObject:](v302, "addObject:", v163);

          }
          objc_msgSend(v159, "objectForKeyedSubscript:", CFSTR("seatNumber"));
          v164 = (void *)objc_claimAutoreleasedReturnValue();
          v165 = v164;
          if (v164)
          {
            MapsSuggestionsLocalizedTicketedEvent_SeatNumberString(v164);
            v166 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject addObject:](v302, "addObject:", v166);

          }
          -[NSObject componentsJoinedByString:](v302, "componentsJoinedByString:", CFSTR(", "));
          v167 = (void *)objc_claimAutoreleasedReturnValue();
          -[MapsSuggestionsEntry setString:forKey:](v152, "setString:forKey:", v167, CFSTR("MapsSuggestionsCalendarTicketedEventSeatDetailsKey"));

LABEL_191:
LABEL_192:
          v144 = v111;
LABEL_282:
          if ((a4 & 1) != 0)
          {
            objc_msgSend(v323, "mapKitHandle");
            v168 = objc_claimAutoreleasedReturnValue();
            GEOFindOrCreateLog();
            v244 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v244, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend((id)a1, "uniqueName");
              v245 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v245;
              *(_WORD *)&buf[12] = 2080;
              *(_QWORD *)&buf[14] = "_q_createEntriesWithinPeriod_MapItem";
              _os_log_impl(&dword_1A427D000, v244, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

            }
            GEOFindOrCreateLog();
            v246 = objc_claimAutoreleasedReturnValue();
            if (os_signpost_enabled(v246))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_1A427D000, v246, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_q_createEntriesWithinPeriod_MapItem", ", buf, 2u);
            }

            if (v168)
            {
              objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v168);
              v247 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", v168);
              v248 = (void *)objc_claimAutoreleasedReturnValue();
              v249 = objc_msgSend(v248, "integerValue");

              if (v247)
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v249);
                v250 = (void *)objc_claimAutoreleasedReturnValue();
                -[MapsSuggestionsEntry setNumber:forKey:](v144, "setNumber:forKey:", v250, CFSTR("MapsSuggestionsGEOMapItemOriginKey"));

                -[MapsSuggestionsEntry setGeoMapItem:](v144, "setGeoMapItem:", v247);
                objc_msgSend(v311, "addObject:", v144);
                objc_msgSend(v300, "removeObject:", v168);
                GEOFindOrCreateLog();
                v251 = (id)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v251, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend((id)a1, "uniqueName");
                  v252 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  *(_QWORD *)&buf[4] = v252;
                  *(_WORD *)&buf[12] = 2080;
                  *(_QWORD *)&buf[14] = "_q_createEntriesWithinPeriod_MapItem";
                  _os_log_impl(&dword_1A427D000, v251, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);

                }
                GEOFindOrCreateLog();
                v253 = objc_claimAutoreleasedReturnValue();
                if (os_signpost_enabled(v253))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_1A427D000, v253, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_q_createEntriesWithinPeriod_MapItem", ", buf, 2u);
                }
                v169 = 35;
LABEL_315:

                goto LABEL_316;
              }
LABEL_309:
              v256 = 0;
            }
            else
            {
              GEOFindOrCreateLog();
              v254 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v254, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A427D000, v254, OS_LOG_TYPE_DEBUG, "We have no MapItemHandle for this Event", buf, 2u);
              }

              if (!-[MapsSuggestionsEntry containsKey:](v144, "containsKey:", CFSTR("MapsSuggestionsDestinationAddressKey"))|| !-[MapsSuggestionsEntry containsKey:](v144, "containsKey:", CFSTR("MapsSuggestionsLatitudeKey"))|| !-[MapsSuggestionsEntry containsKey:](v144, "containsKey:", CFSTR("MapsSuggestionsLongitudeKey")))
              {
                v247 = 0;
                goto LABEL_309;
              }
              GEOFindOrCreateLog();
              v255 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v255, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A427D000, v255, OS_LOG_TYPE_DEBUG, "Entry has address, removing lat/long", buf, 2u);
              }

              -[MapsSuggestionsEntry numberForKey:](v144, "numberForKey:", CFSTR("MapsSuggestionsLatitudeKey"));
              v247 = (id)objc_claimAutoreleasedReturnValue();
              -[MapsSuggestionsEntry numberForKey:](v144, "numberForKey:", CFSTR("MapsSuggestionsLongitudeKey"));
              v256 = (void *)objc_claimAutoreleasedReturnValue();
            }
            -[MapsSuggestionsEntry setMapItemHandleData:](v144, "setMapItemHandleData:", v168);
            GEOFindOrCreateLog();
            v257 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v257, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend((id)a1, "uniqueName");
              v258 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v258;
              *(_WORD *)&buf[12] = 2080;
              *(_QWORD *)&buf[14] = "_q_createEntriesWithinPeriod_MapItem_Download";
              _os_log_impl(&dword_1A427D000, v257, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

            }
            GEOFindOrCreateLog();
            v259 = objc_claimAutoreleasedReturnValue();
            if (os_signpost_enabled(v259))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_1A427D000, v259, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_q_createEntriesWithinPeriod_MapItem_Download", ", buf, 2u);
            }

            dispatch_group_enter(group);
            v260 = *(NSObject **)(a1 + 8);
            v333[0] = MEMORY[0x1E0C809B0];
            v333[1] = 3221225472;
            v333[2] = __87__MapsSuggestionsEventKit__q_createEntriesWithinPeriod_location_fetchMapItems_handler___block_invoke_284;
            v333[3] = &unk_1E4BCEC10;
            objc_copyWeak(&v341, &location);
            v334 = v144;
            v335 = v322;
            v336 = group;
            v247 = v247;
            v337 = v247;
            v253 = v256;
            v338 = v253;
            v339 = v311;
            v340 = v168;
            dispatch_async(v260, v333);

            objc_destroyWeak(&v341);
            v169 = 0;
            goto LABEL_315;
          }
          objc_msgSend(v311, "addObject:", v144);
          GEOFindOrCreateLog();
          v168 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v168, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A427D000, v168, OS_LOG_TYPE_INFO, "Skipping fetching the mapItems because fetchMapItems == NO", buf, 2u);
          }
LABEL_299:

          v169 = 35;
LABEL_316:
          v111 = v144;
LABEL_317:

          if (v169 && v169 != 35)
          {

            goto LABEL_359;
          }
          break;
        default:
          if (-[MapsSuggestionsEntry type](v111, "type") == -1000000)
            goto LABEL_279;
          GEOFindOrCreateLog();
          v168 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v168, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446978;
            *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEventKit.m";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 937;
            *(_WORD *)&buf[18] = 2082;
            *(_QWORD *)&buf[20] = "-[MapsSuggestionsEventKit _q_createEntriesWithinPeriod:location:fetchMapItems:handler:]";
            *(_WORD *)&buf[28] = 2082;
            *(_QWORD *)&buf[30] = "entry.type + 1000000L";
            _os_log_impl(&dword_1A427D000, v168, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. How can we get here? That's not a type MSgEventKit can produce!", buf, 0x26u);
          }
          v169 = 1;
          goto LABEL_317;
      }
    }
    v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v342, v361, 16);
  }
  while (v41);
LABEL_354:

  v280 = *(NSObject **)(a1 + 8);
  v328[0] = MEMORY[0x1E0C809B0];
  v328[1] = 3221225472;
  v328[2] = __87__MapsSuggestionsEventKit__q_createEntriesWithinPeriod_location_fetchMapItems_handler___block_invoke_289;
  v328[3] = &unk_1E4BCEC78;
  objc_copyWeak(&v332, &location);
  v281 = v311;
  v329 = v281;
  v282 = v316;
  v331 = v282;
  v330 = v300;
  dispatch_group_notify(group, v280, v328);
  if ((a4 & 1) == 0)
  {
    GEOFindOrCreateLog();
    v283 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v283, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromMapsSuggestionsEntries(v281);
      v284 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v284;
      _os_log_impl(&dword_1A427D000, v283, OS_LOG_TYPE_DEBUG, "fetchMapItems == NO. Sending %@", buf, 0xCu);

    }
    (*((void (**)(id, id, _QWORD))v282 + 2))(v282, v281, 0);
  }

  objc_destroyWeak(&v332);
LABEL_359:

LABEL_363:
LABEL_364:
  objc_destroyWeak(&location);
LABEL_365:

}

- (BOOL)deleteOrDeclineEntry:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  BOOL v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  _BYTE location[12];
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    *(_DWORD *)location = 136446978;
    *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEventKit.m";
    v21 = 1024;
    v22 = 223;
    v23 = 2082;
    v24 = "-[MapsSuggestionsEventKit deleteOrDeclineEntry:handler:]";
    v25 = 2082;
    v26 = "nil == (handler)";
    v11 = "At %{public}s:%d, %{public}s forbids: %{public}s. handler cannot be nil";
LABEL_9:
    v12 = v10;
    v13 = OS_LOG_TYPE_ERROR;
    v14 = 38;
LABEL_12:
    _os_log_impl(&dword_1A427D000, v12, v13, v11, location, v14);
    goto LABEL_13;
  }
  if (!v6)
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    *(_DWORD *)location = 136446978;
    *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEventKit.m";
    v21 = 1024;
    v22 = 224;
    v23 = 2082;
    v24 = "-[MapsSuggestionsEventKit deleteOrDeclineEntry:handler:]";
    v25 = 2082;
    v26 = "nil == (entry)";
    v11 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a suggestion entry";
    goto LABEL_9;
  }
  if ((objc_msgSend(v6, "containsKey:", CFSTR("MapsSuggestionsEventIDKey")) & 1) == 0)
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)location = 138412290;
      *(_QWORD *)&location[4] = v6;
      v11 = "Could not remove Entry without EventIDKey: %@";
      v12 = v10;
      v13 = OS_LOG_TYPE_DEBUG;
      v14 = 12;
      goto LABEL_12;
    }
LABEL_13:

    v9 = 0;
    goto LABEL_14;
  }
  objc_initWeak((id *)location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__MapsSuggestionsEventKit_deleteOrDeclineEntry_handler___block_invoke;
  block[3] = &unk_1E4BCEA10;
  objc_copyWeak(&v19, (id *)location);
  v17 = v6;
  v18 = v7;
  dispatch_async(queue, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)location);
  v9 = 1;
LABEL_14:

  return v9;
}

void __56__MapsSuggestionsEventKit_deleteOrDeclineEntry_handler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void (**v7)(_QWORD);
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint32_t v19;
  id v20;
  uint8_t buf[4];
  char *v22;
  __int16 v23;
  _WORD v24[17];

  *(_QWORD *)&v24[13] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = (id *)WeakRetained;
  if (WeakRetained)
  {
    v5 = *(void **)(a1 + 32);
    v4 = *(void **)(a1 + 40);
    v6 = *((_QWORD *)WeakRetained + 1);
    v7 = v4;
    v8 = v5;
    dispatch_assert_queue_V2(v6);
    objc_msgSend(v8, "stringForKey:", CFSTR("MapsSuggestionsEventIDKey"));
    v9 = objc_claimAutoreleasedReturnValue();

    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v22 = (char *)v9;
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_DEBUG, "About to delete '%@' from Calendar", buf, 0xCu);
    }

    objc_msgSend(v3[2], "eventWithIdentifier:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v3[2];
    v20 = 0;
    objc_msgSend(v12, "removeEvent:span:error:", v11, 0, &v20);
    v13 = v20;
    v7[2](v7);

    GEOFindOrCreateLog();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v13)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v22 = (char *)v9;
        v23 = 2112;
        *(_QWORD *)v24 = v13;
        v16 = "Error during deletion of '%@': %@";
        v17 = v15;
        v18 = OS_LOG_TYPE_ERROR;
        v19 = 22;
LABEL_12:
        _os_log_impl(&dword_1A427D000, v17, v18, v16, buf, v19);
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v22 = (char *)v9;
      v16 = "Successfully deleted '%@' from Calendar";
      v17 = v15;
      v18 = OS_LOG_TYPE_DEBUG;
      v19 = 12;
      goto LABEL_12;
    }

    goto LABEL_14;
  }
  GEOFindOrCreateLog();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446722;
    v22 = "MapsSuggestionsEventKit.m";
    v23 = 1026;
    *(_DWORD *)v24 = 233;
    v24[2] = 2082;
    *(_QWORD *)&v24[3] = "-[MapsSuggestionsEventKit deleteOrDeclineEntry:handler:]_block_invoke";
    _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
  }

LABEL_14:
}

- (void)registerObserver:(id)a3
{
  id v4;
  MapsSuggestionsObservers *observers;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  observers = self->_observers;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__MapsSuggestionsEventKit_registerObserver___block_invoke;
  v6[3] = &unk_1E4BCEB28;
  objc_copyWeak(&v7, &location);
  -[MapsSuggestionsObservers registerObserver:handler:](observers, "registerObserver:handler:", v4, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __44__MapsSuggestionsEventKit_registerObserver___block_invoke(uint64_t a1, int a2)
{
  id *WeakRetained;
  id *v3;
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
    v3 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained[2], "startListeningForChanges");
    }
    else
    {
      GEOFindOrCreateLog();
      v4 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = 136446722;
        v6 = "MapsSuggestionsEventKit.m";
        v7 = 1026;
        v8 = 245;
        v9 = 2082;
        v10 = "-[MapsSuggestionsEventKit registerObserver:]_block_invoke";
        _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
      }

    }
  }
}

- (void)unregisterObserver:(id)a3
{
  id v4;
  MapsSuggestionsObservers *observers;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  observers = self->_observers;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__MapsSuggestionsEventKit_unregisterObserver___block_invoke;
  v6[3] = &unk_1E4BCEB28;
  objc_copyWeak(&v7, &location);
  -[MapsSuggestionsObservers unregisterObserver:handler:](observers, "unregisterObserver:handler:", v4, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __46__MapsSuggestionsEventKit_unregisterObserver___block_invoke(uint64_t a1, int a2)
{
  id *WeakRetained;
  id *v3;
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
    v3 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained[2], "stopListeningForChanges");
    }
    else
    {
      GEOFindOrCreateLog();
      v4 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = 136446722;
        v6 = "MapsSuggestionsEventKit.m";
        v7 = 1026;
        v8 = 256;
        v9 = 2082;
        v10 = "-[MapsSuggestionsEventKit unregisterObserver:]_block_invoke";
        _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
      }

    }
  }
}

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "description");
}

- (void)eventKitDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "uniqueName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "Received eventKitDidChange:%@", (uint8_t *)&v7, 0xCu);

  }
  -[MapsSuggestionsCanKicker kickCanBySameTime](self->_changedNotificationCanKicker, "kickCanBySameTime");

}

void __87__MapsSuggestionsEventKit__addTravelFlightFieldsToEntry_fromSchemaOrgDictionary_event___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __48__MapsSuggestionsEventKit__entryTypeFromSchema___block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ED22EF20;
  qword_1ED22EF20 = (uint64_t)&unk_1E4C09ED0;

}

- (BOOL)_addCalendarEventFieldsToEntry:(void *)a1 event:(void *)a2
{
  id v3;
  id v4;
  uint64_t v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = objc_msgSend(v3, "type");
  if (v5 == 3)
  {
    v6 = objc_msgSend(v4, "status") == 2;
    objc_msgSend(v4, "isAllDay");
    GEOConfigGetDouble();
    objc_msgSend(v3, "setWeight:");
    objc_msgSend(v4, "endDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    GEOConfigGetDouble();
    objc_msgSend(v7, "dateByAddingTimeInterval:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setExpires:", v8);

    objc_msgSend(v3, "setBoolean:forKey:", objc_msgSend(v4, "isAllDay"), CFSTR("MapsSuggestionsCalendarAllDayEventKey"));
    objc_msgSend(v3, "setBoolean:forKey:", v6, CFSTR("MapsSuggestionsCalendarTentativeEventKey"));
  }
  else
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 136446978;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEventKit.m";
      v13 = 1024;
      v14 = 590;
      v15 = 2082;
      v16 = "-[MapsSuggestionsEventKit _addCalendarEventFieldsToEntry:event:]";
      v17 = 2082;
      v18 = "entry.type != MapsSuggestionsEntryTypeCalendarEvent";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Entry needs to be of type MapsSuggestionsEntryTypeCalendarEvent", (uint8_t *)&v11, 0x26u);
    }

  }
  return v5 == 3;
}

- (void)interestingFlightEventsFrom:(id)a3 to:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *queue;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v8, v9);
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __66__MapsSuggestionsEventKit_interestingFlightEventsFrom_to_handler___block_invoke;
  v15[3] = &unk_1E4BCEA10;
  objc_copyWeak(&v18, &location);
  v16 = v11;
  v17 = v10;
  v13 = v10;
  v14 = v11;
  dispatch_async(queue, v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __66__MapsSuggestionsEventKit_interestingFlightEventsFrom_to_handler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  NSObject *v7;
  uint8_t buf[4];
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    MapsSuggestionsCurrentBestLocation();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __66__MapsSuggestionsEventKit_interestingFlightEventsFrom_to_handler___block_invoke_265;
    v6[3] = &unk_1E4BCDE70;
    v7 = *(id *)(a1 + 40);
    -[MapsSuggestionsEventKit _q_createEntriesWithinPeriod:location:fetchMapItems:handler:]((uint64_t)WeakRetained, v3, v4, 0, v6);

    v5 = v7;
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v9 = "MapsSuggestionsEventKit.m";
      v10 = 1026;
      v11 = 720;
      v12 = 2082;
      v13 = "-[MapsSuggestionsEventKit interestingFlightEventsFrom:to:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __66__MapsSuggestionsEventKit_interestingFlightEventsFrom_to_handler___block_invoke_265(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "type", (_QWORD)v16) == 15)
          objc_msgSend(v7, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v9);
  }

  GEOFindOrCreateLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v14 = objc_msgSend(v5, "count");
    v15 = objc_msgSend(v7, "count");
    *(_DWORD *)buf = 134218240;
    v21 = v14;
    v22 = 2048;
    v23 = v15;
    _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_DEBUG, "Filtered flight entries: Before: %lu, After: %lu", buf, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __87__MapsSuggestionsEventKit__q_createEntriesWithinPeriod_location_fetchMapItems_handler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  char *v6;
  NSObject *v7;
  int v8;
  char *v9;
  __int16 v10;
  _WORD v11[17];

  *(_QWORD *)&v11[13] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -8, CFSTR("All Calendars are invisible"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, MEMORY[0x1E0C9AA60], v4);

    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(WeakRetained, "uniqueName");
      v6 = (char *)objc_claimAutoreleasedReturnValue();
      v8 = 138412546;
      v9 = v6;
      v10 = 2080;
      *(_QWORD *)v11 = "_q_createEntriesWithinPeriod";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v8, 0x16u);

    }
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v7))
    {
      LOWORD(v8) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_q_createEntriesWithinPeriod", ", (uint8_t *)&v8, 2u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136446722;
      v9 = "MapsSuggestionsEventKit.m";
      v10 = 1026;
      *(_DWORD *)v11 = 764;
      v11[2] = 2082;
      *(_QWORD *)&v11[3] = "-[MapsSuggestionsEventKit _q_createEntriesWithinPeriod:location:fetchMapItems:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }

  }
}

void __87__MapsSuggestionsEventKit__q_createEntriesWithinPeriod_location_fetchMapItems_handler___block_invoke_271(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  char *v6;
  NSObject *v7;
  int v8;
  char *v9;
  __int16 v10;
  _WORD v11[17];

  *(_QWORD *)&v11[13] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -8, CFSTR("No events available"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, MEMORY[0x1E0C9AA60], v4);

    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(WeakRetained, "uniqueName");
      v6 = (char *)objc_claimAutoreleasedReturnValue();
      v8 = 138412546;
      v9 = v6;
      v10 = 2080;
      *(_QWORD *)v11 = "_q_createEntriesWithinPeriod";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v8, 0x16u);

    }
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v7))
    {
      LOWORD(v8) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_q_createEntriesWithinPeriod", ", (uint8_t *)&v8, 2u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136446722;
      v9 = "MapsSuggestionsEventKit.m";
      v10 = 1026;
      *(_DWORD *)v11 = 777;
      v11[2] = 2082;
      *(_QWORD *)&v11[3] = "-[MapsSuggestionsEventKit _q_createEntriesWithinPeriod:location:fetchMapItems:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }

  }
}

void __87__MapsSuggestionsEventKit__q_createEntriesWithinPeriod_location_fetchMapItems_handler___block_invoke_284(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  NSObject *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 88);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = *(void **)(a1 + 32);
    v6 = (void *)*((_QWORD *)WeakRetained + 3);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __87__MapsSuggestionsEventKit__q_createEntriesWithinPeriod_location_fetchMapItems_handler___block_invoke_285;
    v9[3] = &unk_1E4BCEBE8;
    v10 = v5;
    objc_copyWeak(&v17, v2);
    v7 = *(void **)(a1 + 48);
    v11 = *(_QWORD *)(a1 + 40);
    v12 = v7;
    v13 = *(id *)(a1 + 56);
    v14 = *(id *)(a1 + 64);
    v15 = *(id *)(a1 + 72);
    v16 = *(id *)(a1 + 80);
    GEOMapItemFromMapsSuggestionsEntry(v10, v6, 1, v9);

    objc_destroyWeak(&v17);
    v8 = v10;
  }
  else
  {
    GEOFindOrCreateLog();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v19 = "MapsSuggestionsEventKit.m";
      v20 = 1026;
      v21 = 1009;
      v22 = 2082;
      v23 = "-[MapsSuggestionsEventKit _q_createEntriesWithinPeriod:location:fetchMapItems:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __87__MapsSuggestionsEventKit__q_createEntriesWithinPeriod_location_fetchMapItems_handler___block_invoke_285(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id WeakRetained;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  char *v12;
  NSObject *v13;
  char *v14;
  NSObject *v15;
  NSObject *v16;
  char *v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28[2];
  uint8_t buf[4];
  char *v30;
  __int16 v31;
  _WORD v32[17];

  *(_QWORD *)&v32[13] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(a1[4], "containsKey:", CFSTR("MapsSuggestionsGEOMapItemOriginKey")))
  {
    v7 = (void *)objc_msgSend(a1[4], "integerForKey:", CFSTR("MapsSuggestionsGEOMapItemOriginKey"));
    WeakRetained = objc_loadWeakRetained(a1 + 11);
    if (WeakRetained)
    {
      v9 = WeakRetained;
      if (v7)
      {
        v10 = *((_QWORD *)WeakRetained + 1);
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __87__MapsSuggestionsEventKit__q_createEntriesWithinPeriod_location_fetchMapItems_handler___block_invoke_286;
        v19[3] = &unk_1E4BCEBC0;
        objc_copyWeak(v28, a1 + 11);
        v20 = v5;
        v21 = a1[4];
        v22 = a1[7];
        v23 = a1[8];
        v24 = a1[9];
        v25 = a1[10];
        v28[1] = v7;
        v26 = a1[6];
        v27 = v6;
        dispatch_async(v10, v19);

        objc_destroyWeak(v28);
        goto LABEL_20;
      }
      goto LABEL_6;
    }
  }
  else
  {
    v9 = objc_loadWeakRetained(a1 + 11);
    if (v9)
    {
LABEL_6:
      GEOFindOrCreateLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(a1[5], "title");
        v12 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v30 = v12;
        _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "Could not get MapItem for event {%@}", buf, 0xCu);

      }
      GEOFindOrCreateLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        -[NSObject uniqueName](v9, "uniqueName");
        v14 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v30 = v14;
        v31 = 2080;
        *(_QWORD *)v32 = "_q_createEntriesWithinPeriod_MapItem_Download";
        _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);

      }
      GEOFindOrCreateLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v15))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A427D000, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_q_createEntriesWithinPeriod_MapItem_Download", ", buf, 2u);
      }

      GEOFindOrCreateLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        -[NSObject uniqueName](v9, "uniqueName");
        v17 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v30 = v17;
        v31 = 2080;
        *(_QWORD *)v32 = "_q_createEntriesWithinPeriod_MapItem";
        _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);

      }
      GEOFindOrCreateLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v18))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A427D000, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_q_createEntriesWithinPeriod_MapItem", ", buf, 2u);
      }

      dispatch_group_leave((dispatch_group_t)a1[6]);
      goto LABEL_20;
    }
  }
  GEOFindOrCreateLog();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446722;
    v30 = "MapsSuggestionsEventKit.m";
    v31 = 1026;
    *(_DWORD *)v32 = 1020;
    v32[2] = 2082;
    *(_QWORD *)&v32[3] = "-[MapsSuggestionsEventKit _q_createEntriesWithinPeriod:location:fetchMapItems:handler:]_block_invoke";
    _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", buf, 0x1Cu);
  }

LABEL_20:
}

void __87__MapsSuggestionsEventKit__q_createEntriesWithinPeriod_location_fetchMapItems_handler___block_invoke_286(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  NSObject *v19;
  char *v20;
  NSObject *v21;
  NSObject *v22;
  char *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  char *v27;
  void *v28;
  NSObject *v29;
  char *v30;
  NSObject *v31;
  NSObject *v32;
  char *v33;
  NSObject *v34;
  int v35;
  char *v36;
  __int16 v37;
  _WORD v38[17];

  *(_QWORD *)&v38[13] = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 96));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    if (v3)
    {
      v4 = v3;
      objc_msgSend(*(id *)(a1 + 40), "stringForKey:", CFSTR("MapsSuggestionsEntryTitleNameKey"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "length"))
      {
        objc_msgSend(v4, "place");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setName:", v5);

        v7 = objc_alloc_init(MEMORY[0x1E0D271F0]);
        objc_msgSend(v7, "setName:", v5);
        objc_msgSend(v4, "setUserValues:", v7);
        if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
          dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
        if (s_verbose)
        {
          GEOFindOrCreateLog();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          {
            v35 = 138412290;
            v36 = (char *)v4;
            _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "Separately adding name to the GeoMapItem %@", (uint8_t *)&v35, 0xCu);
          }

        }
      }
      objc_msgSend(*(id *)(a1 + 40), "setGeoMapItem:", v4);
      v9 = *(void **)(a1 + 40);
      v10 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "coordinate");
      objc_msgSend(v10, "numberWithDouble:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setNumber:forKey:", v11, CFSTR("MapsSuggestionsLatitudeKey"));

      v12 = *(void **)(a1 + 40);
      v13 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "coordinate");
      objc_msgSend(v13, "numberWithDouble:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setNumber:forKey:", v15, CFSTR("MapsSuggestionsLongitudeKey"));

      objc_msgSend(v4, "coordinate");
      if ((v17 < -180.0 || v17 > 180.0 || v16 < -90.0 || v16 > 90.0) && *(_QWORD *)(a1 + 48) && *(_QWORD *)(a1 + 56))
      {
        objc_msgSend(*(id *)(a1 + 40), "setNumber:forKey:");
        objc_msgSend(*(id *)(a1 + 40), "setNumber:forKey:", *(_QWORD *)(a1 + 56), CFSTR("MapsSuggestionsLongitudeKey"));
      }
      objc_msgSend(*(id *)(a1 + 64), "addObject:", *(_QWORD *)(a1 + 40));
      if (*(_QWORD *)(a1 + 72))
      {
        objc_msgSend(WeakRetained[7], "setObject:forKeyedSubscript:", v4);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 104));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained[8], "setObject:forKeyedSubscript:", v18, *(_QWORD *)(a1 + 72));

      }
      GEOFindOrCreateLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(WeakRetained, "uniqueName");
        v20 = (char *)objc_claimAutoreleasedReturnValue();
        v35 = 138412546;
        v36 = v20;
        v37 = 2080;
        *(_QWORD *)v38 = "_q_createEntriesWithinPeriod_MapItem_Download";
        _os_log_impl(&dword_1A427D000, v19, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v35, 0x16u);

      }
      GEOFindOrCreateLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v21))
      {
        LOWORD(v35) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A427D000, v21, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_q_createEntriesWithinPeriod_MapItem_Download", ", (uint8_t *)&v35, 2u);
      }

      GEOFindOrCreateLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(WeakRetained, "uniqueName");
        v23 = (char *)objc_claimAutoreleasedReturnValue();
        v35 = 138412546;
        v36 = v23;
        v37 = 2080;
        *(_QWORD *)v38 = "_q_createEntriesWithinPeriod_MapItem";
        _os_log_impl(&dword_1A427D000, v22, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v35, 0x16u);

      }
      GEOFindOrCreateLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v24))
      {
        LOWORD(v35) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A427D000, v24, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_q_createEntriesWithinPeriod_MapItem", ", (uint8_t *)&v35, 2u);
      }

      dispatch_group_leave(*(dispatch_group_t *)(a1 + 80));
    }
    else
    {
      GEOFindOrCreateLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
        v27 = (char *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 88), "localizedDescription");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 138412546;
        v36 = v27;
        v37 = 2112;
        *(_QWORD *)v38 = v28;
        _os_log_impl(&dword_1A427D000, v26, OS_LOG_TYPE_DEBUG, "Error forming geoMapItem for entry %@. Error is %@", (uint8_t *)&v35, 0x16u);

      }
      GEOFindOrCreateLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(WeakRetained, "uniqueName");
        v30 = (char *)objc_claimAutoreleasedReturnValue();
        v35 = 138412546;
        v36 = v30;
        v37 = 2080;
        *(_QWORD *)v38 = "_q_createEntriesWithinPeriod_MapItem_Download";
        _os_log_impl(&dword_1A427D000, v29, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", (uint8_t *)&v35, 0x16u);

      }
      GEOFindOrCreateLog();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v31))
      {
        LOWORD(v35) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A427D000, v31, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_q_createEntriesWithinPeriod_MapItem_Download", ", (uint8_t *)&v35, 2u);
      }

      GEOFindOrCreateLog();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(WeakRetained, "uniqueName");
        v33 = (char *)objc_claimAutoreleasedReturnValue();
        v35 = 138412546;
        v36 = v33;
        v37 = 2080;
        *(_QWORD *)v38 = "_q_createEntriesWithinPeriod_MapItem";
        _os_log_impl(&dword_1A427D000, v32, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", (uint8_t *)&v35, 0x16u);

      }
      GEOFindOrCreateLog();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v34))
      {
        LOWORD(v35) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A427D000, v34, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_q_createEntriesWithinPeriod_MapItem", ", (uint8_t *)&v35, 2u);
      }

      dispatch_group_leave(*(dispatch_group_t *)(a1 + 80));
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v25 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v35 = 136446722;
      v36 = "MapsSuggestionsEventKit.m";
      v37 = 1026;
      *(_DWORD *)v38 = 1030;
      v38[2] = 2082;
      *(_QWORD *)&v38[3] = "-[MapsSuggestionsEventKit _q_createEntriesWithinPeriod:location:fetchMapItems:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v25, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf3 went away in %{public}s", (uint8_t *)&v35, 0x1Cu);
    }

  }
}

void __87__MapsSuggestionsEventKit__q_createEntriesWithinPeriod_location_fetchMapItems_handler___block_invoke_289(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  NSObject *v4;
  char *v5;
  NSObject *v6;
  char *v7;
  NSObject *v8;
  NSObject *v9;
  char *v10;
  NSObject *v11;
  int v12;
  char *v13;
  __int16 v14;
  _WORD v15[17];

  *(_QWORD *)&v15[13] = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "MSg_copyIf:", &__block_literal_global_292);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromMapsSuggestionsEntries(v3);
      v5 = (char *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v5;
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "Sending %@", (uint8_t *)&v12, 0xCu);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(WeakRetained[7], "removeObjectsForKeys:", *(_QWORD *)(a1 + 40));
    objc_msgSend(WeakRetained[8], "removeObjectsForKeys:", *(_QWORD *)(a1 + 40));
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(WeakRetained, "uniqueName");
      v7 = (char *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v7;
      v14 = 2080;
      *(_QWORD *)v15 = "_q_createEntriesWithinPeriod_Entries";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v12, 0x16u);

    }
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v8))
    {
      LOWORD(v12) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_q_createEntriesWithinPeriod_Entries", ", (uint8_t *)&v12, 2u);
    }

    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(WeakRetained, "uniqueName");
      v10 = (char *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v10;
      v14 = 2080;
      *(_QWORD *)v15 = "_q_createEntriesWithinPeriod";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v12, 0x16u);

    }
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v11))
    {
      LOWORD(v12) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_q_createEntriesWithinPeriod", ", (uint8_t *)&v12, 2u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = 136446722;
      v13 = "MapsSuggestionsEventKit.m";
      v14 = 1026;
      *(_DWORD *)v15 = 1081;
      v15[2] = 2082;
      *(_QWORD *)&v15[3] = "-[MapsSuggestionsEventKit _q_createEntriesWithinPeriod:location:fetchMapItems:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v12, 0x1Cu);
    }
    v3 = v11;
  }

}

BOOL __87__MapsSuggestionsEventKit__q_createEntriesWithinPeriod_location_fetchMapItems_handler___block_invoke_290(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handleToMapItemOriginMapping, 0);
  objc_storeStrong((id *)&self->_handleToMapItemMapping, 0);
  objc_storeStrong((id *)&self->_setOfEventReservationSubtypes, 0);
  objc_storeStrong((id *)&self->_changedNotificationCanKicker, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->_connector, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
