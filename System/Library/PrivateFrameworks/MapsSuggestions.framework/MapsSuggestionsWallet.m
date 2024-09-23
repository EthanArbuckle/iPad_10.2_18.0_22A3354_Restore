@implementation MapsSuggestionsWallet

+ (BOOL)isAvailable
{
  return +[MapsSuggestionsRealWalletConnector isAvailable](MapsSuggestionsRealWalletConnector, "isAvailable");
}

- (void)passKitDidChange:(id)a3
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
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "uniqueName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "Received passKitDidChange from:%@. CanKicking the notification.", (uint8_t *)&v7, 0xCu);

  }
  -[MapsSuggestionsCanKicker kickCanBySameTime](self->_changedNotificationCanKicker, "kickCanBySameTime");

}

- (MapsSuggestionsWallet)initWithConnector:(id)a3 network:(id)a4
{
  id v7;
  id v8;
  MapsSuggestionsWallet *v9;
  void *v10;
  OS_dispatch_queue *v11;
  OS_dispatch_queue *innerQueue;
  NSString *v13;
  NSString *name;
  MapsSuggestionsLimitedDictionary *v15;
  MapsSuggestionsLimitedDictionary *airportCache;
  MapsSuggestionsObservers *v17;
  OS_dispatch_queue *v18;
  uint64_t v19;
  MapsSuggestionsObservers *observers;
  MapsSuggestionsCanKicker *v21;
  double v22;
  double v23;
  OS_dispatch_queue *v24;
  uint64_t v25;
  MapsSuggestionsCanKicker *changedNotificationCanKicker;
  _QWORD v28[4];
  id v29;
  id location;
  NSString *v31;
  objc_super v32;

  v7 = a3;
  v8 = a4;
  v32.receiver = self;
  v32.super_class = (Class)MapsSuggestionsWallet;
  v9 = -[MapsSuggestionsWallet init](&v32, sel_init);
  if (v9)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    MSg::Queue::Queue((dispatch_queue_t *)&location, CFSTR("MapsSuggestionsWalletQueue"), v10);
    v11 = (OS_dispatch_queue *)location;
    location = 0;
    innerQueue = v9->_queue._innerQueue;
    v9->_queue._innerQueue = v11;

    v13 = v31;
    v31 = 0;
    name = v9->_queue._name;
    v9->_queue._name = v13;

    objc_storeStrong((id *)&v9->_connector, a3);
    -[MapsSuggestionsWalletConnector setDelegate:](v9->_connector, "setDelegate:", v9);
    objc_storeStrong((id *)&v9->_network, a4);
    v15 = -[MapsSuggestionsLimitedDictionary initWithMaximumCapacity:]([MapsSuggestionsLimitedDictionary alloc], "initWithMaximumCapacity:", GEOConfigGetInteger());
    airportCache = v9->_airportCache;
    v9->_airportCache = v15;

    v17 = [MapsSuggestionsObservers alloc];
    v18 = v9->_queue._innerQueue;
    v19 = -[MapsSuggestionsObservers initWithCallbackQueue:name:](v17, "initWithCallbackQueue:name:", v18, CFSTR("MapsSuggestionsWalletObservers"));
    observers = v9->_observers;
    v9->_observers = (MapsSuggestionsObservers *)v19;

    objc_initWeak(&location, v9);
    v21 = [MapsSuggestionsCanKicker alloc];
    GEOConfigGetDouble();
    v23 = v22;
    v24 = v9->_queue._innerQueue;
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __51__MapsSuggestionsWallet_initWithConnector_network___block_invoke;
    v28[3] = &unk_1E4BCDDF8;
    objc_copyWeak(&v29, &location);
    v25 = -[MapsSuggestionsCanKicker initWithName:time:queue:block:](v21, "initWithName:time:queue:block:", CFSTR("MapsSuggestionsPassKitChangedNotificationCanKicker"), v24, v28, v23);
    changedNotificationCanKicker = v9->_changedNotificationCanKicker;
    v9->_changedNotificationCanKicker = (MapsSuggestionsCanKicker *)v25;

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __51__MapsSuggestionsWallet_initWithConnector_network___block_invoke(uint64_t a1)
{
  id *v1;
  _QWORD *WeakRetained;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "Acting on one or more change notifications from PassKit", buf, 2u);
    }

    v4 = (void *)WeakRetained[5];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __51__MapsSuggestionsWallet_initWithConnector_network___block_invoke_126;
    v6[3] = &unk_1E4BCFCD0;
    objc_copyWeak(&v7, v1);
    objc_msgSend(v4, "callBlock:", v6);
    objc_destroyWeak(&v7);
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v9 = "MapsSuggestionsWallet.mm";
      v10 = 1026;
      v11 = 95;
      v12 = 2082;
      v13 = "-[MapsSuggestionsWallet initWithConnector:network:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __51__MapsSuggestionsWallet_initWithConnector_network___block_invoke_126(uint64_t a1, void *a2)
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
    objc_msgSend(v3, "passKitDidChange:", WeakRetained);
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446722;
      v7 = "MapsSuggestionsWallet.mm";
      v8 = 1026;
      v9 = 98;
      v10 = 2082;
      v11 = "-[MapsSuggestionsWallet initWithConnector:network:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelfCall went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }

  }
}

- (id)initFromResourceDepot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MapsSuggestionsRealWalletConnector *v7;
  void *v8;
  MapsSuggestionsWallet *v9;
  NSObject *v10;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsWallet.mm";
      v14 = 1024;
      v15 = 109;
      v16 = 2082;
      v17 = "-[MapsSuggestionsWallet initFromResourceDepot:]";
      v18 = 2082;
      v19 = "nil == (resourceDepot)";
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to build from!", (uint8_t *)&v12, 0x26u);
    }
    goto LABEL_9;
  }
  objc_msgSend(v4, "oneNetworkRequester");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsWallet.mm";
      v14 = 1024;
      v15 = 110;
      v16 = 2082;
      v17 = "-[MapsSuggestionsWallet initFromResourceDepot:]";
      v18 = 2082;
      v19 = "nil == (resourceDepot.oneNetworkRequester)";
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires One Network!", (uint8_t *)&v12, 0x26u);
    }
LABEL_9:

    v9 = 0;
    goto LABEL_10;
  }
  v7 = objc_alloc_init(MapsSuggestionsRealWalletConnector);
  objc_msgSend(v5, "oneNetworkRequester");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[MapsSuggestionsWallet initWithConnector:network:](self, "initWithConnector:network:", v7, v8);

  v9 = self;
LABEL_10:

  return v9;
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
  v6[2] = __42__MapsSuggestionsWallet_registerObserver___block_invoke;
  v6[3] = &unk_1E4BCE1D8;
  objc_copyWeak(&v7, &location);
  -[MapsSuggestionsObservers registerObserver:handler:](observers, "registerObserver:handler:", v4, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __42__MapsSuggestionsWallet_registerObserver___block_invoke(uint64_t a1, int a2)
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
      objc_msgSend(WeakRetained[3], "startListeningForChanges");
    }
    else
    {
      GEOFindOrCreateLog();
      v4 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = 136446722;
        v6 = "MapsSuggestionsWallet.mm";
        v7 = 1026;
        v8 = 134;
        v9 = 2082;
        v10 = "-[MapsSuggestionsWallet registerObserver:]_block_invoke";
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
  v6[2] = __44__MapsSuggestionsWallet_unregisterObserver___block_invoke;
  v6[3] = &unk_1E4BCE1D8;
  objc_copyWeak(&v7, &location);
  -[MapsSuggestionsObservers unregisterObserver:handler:](observers, "unregisterObserver:handler:", v4, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __44__MapsSuggestionsWallet_unregisterObserver___block_invoke(uint64_t a1, int a2)
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
      objc_msgSend(WeakRetained[3], "stopListeningForChanges");
    }
    else
    {
      GEOFindOrCreateLog();
      v4 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = 136446722;
        v6 = "MapsSuggestionsWallet.mm";
        v7 = 1026;
        v8 = 146;
        v9 = 2082;
        v10 = "-[MapsSuggestionsWallet unregisterObserver:]_block_invoke";
        _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
      }

    }
  }
}

- (char)entriesFromPassesBefore:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  GEOFindOrCreateLog();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsWallet uniqueName](self, "uniqueName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v18 = v9;
    v19 = 2080;
    v20 = "entriesFromPassesBefore:handler:";
    _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

  }
  GEOFindOrCreateLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "entriesFromPassesBefore:handler:", ", buf, 2u);
  }

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57__MapsSuggestionsWallet_entriesFromPassesBefore_handler___block_invoke;
  v14[3] = &unk_1E4BCFCF8;
  v11 = v7;
  v16 = v11;
  v12 = v6;
  v15 = v12;
  MSg::Queue::async<MapsSuggestionsWallet>((NSObject **)&self->_queue, self, v14);

  return 1;
}

void __57__MapsSuggestionsWallet_entriesFromPassesBefore_handler___block_invoke(uint64_t a1, void *a2)
{
  dispatch_queue_t *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  -[MapsSuggestionsWallet _q_readPassesWithHandler:withEndDate:](v3, *(void **)(a1 + 40), *(void **)(a1 + 32));
  GEOFindOrCreateLog();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    -[dispatch_queue_t uniqueName](v3, "uniqueName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v5;
    v9 = 2080;
    v10 = "entriesFromPassesBefore:handler:";
    _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v7, 0x16u);

  }
  GEOFindOrCreateLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    LOWORD(v7) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "entriesFromPassesBefore:handler:", ", (uint8_t *)&v7, 2u);
  }

}

- (void)_q_readPassesWithHandler:(void *)a3 withEndDate:
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  double v11;
  id v12;
  double v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t i;
  id v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  MapsSuggestionsEntry *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  id v52;
  void *v53;
  _BOOL4 v54;
  void *v55;
  int v56;
  uint64_t v57;
  id v58;
  void *v59;
  _BOOL4 v60;
  void *v61;
  int v62;
  uint64_t v63;
  void *v64;
  _BOOL4 v65;
  NSObject *v66;
  NSObject *v67;
  void *v68;
  NSObject *v69;
  void *v70;
  MapsSuggestionsEntry *v71;
  NSObject *v72;
  MapsSuggestionsEntry *v73;
  double v74;
  double v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  NSObject *v81;
  void *v82;
  NSObject *v83;
  NSObject *v84;
  _QWORD *v85;
  void *v86;
  void *v87;
  NSObject *v88;
  id v89;
  int v90;
  NSObject *v91;
  dispatch_queue_t v92;
  dispatch_queue_t v93;
  NSObject *v94;
  dispatch_queue_t v95;
  NSObject *v96;
  id v97;
  void *v98;
  id v99;
  void *v100;
  id v101;
  void *v102;
  id v103;
  id v104;
  NSObject *group;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *context;
  void *v111;
  id v112;
  void *v113;
  dispatch_queue_t *val;
  id obj;
  uint64_t v116;
  _QWORD block[4];
  id v118;
  id v119;
  id v120;
  _QWORD v121[4];
  NSObject *v122;
  _QWORD v123[4];
  NSObject *v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  id location;
  _BYTE v130[128];
  __CFString *v131;
  const __CFString *v132;
  uint64_t v133;
  void (*v134)(id *, void *, void *);
  void *v135;
  MapsSuggestionsEntry *v136;
  id v137;
  _QWORD *v138;
  id v139;
  _BYTE buf[40];
  id v141;
  id v142[2];
  _BYTE from[18];
  __int16 v144;
  const char *v145;
  __int16 v146;
  const char *v147;
  uint64_t v148;

  v148 = *MEMORY[0x1E0C80C00];
  v101 = a2;
  v5 = a3;
  if (a1)
  {
    v103 = v5;
    dispatch_assert_queue_V2(a1[1]);
    val = a1;
    GEOFindOrCreateLog();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      -[dispatch_queue_t uniqueName](a1, "uniqueName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "_q_readPassesWithHandler";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

    }
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_q_readPassesWithHandler", ", buf, 2u);
    }

    objc_initWeak(&location, val);
    group = dispatch_group_create();
    v104 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v9 = v103;
    if (v103)
    {
      GEOFindOrCreateLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v103;
        _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_DEBUG, "endDate for the request is non-nil: %@", buf, 0xCu);
      }

      v9 = v103;
    }
    GEOConfigGetDouble();
    MapsSuggestionsNowWithOffset((double)-(uint64_t)(v11 * 1000000000.0) / 1000000000.0);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v12 = v9;
    }
    else
    {
      GEOConfigGetDouble();
      MapsSuggestionsNowWithOffset((double)(uint64_t)(v13 * 1000000000.0) / 1000000000.0);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v12;
    v15 = v100;
    v99 = v14;
    v111 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v15, v99);
    v102 = v15;

    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v111;
      _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_DEBUG, "Looking for passes in window %@", buf, 0xCu);
    }

    v98 = (void *)MEMORY[0x1A859CDD8]();
    -[NSObject passesOfType:](val[3], "passesOfType:", 0);
    v127 = 0u;
    v128 = 0u;
    v125 = 0u;
    v126 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v125, v130, 16);
    if (v17)
    {
      v116 = *(_QWORD *)v126;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v126 != v116)
            objc_enumerationMutation(obj);
          v19 = *(id *)(*((_QWORD *)&v125 + 1) + 8 * i);
          v20 = v19;
          if (!v19)
          {
            GEOFindOrCreateLog();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446978;
              *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsWallet.mm";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 322;
              *(_WORD *)&buf[18] = 2082;
              *(_QWORD *)&buf[20] = "BOOL _isSupportedPassStyle(PKPass *__strong)";
              *(_WORD *)&buf[28] = 2082;
              *(_QWORD *)&buf[30] = "nil == (pass)";
              _os_log_impl(&dword_1A427D000, v24, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a pass", buf, 0x26u);
            }
            goto LABEL_85;
          }
          v21 = ((objc_msgSend(v19, "style") - 2) & 0xFFFFFFFFFFFFFFFDLL) == 0;

          if (!v21)
            continue;
          objc_msgSend(v20, "relevantDates");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "firstObject");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "date");
          v24 = objc_claimAutoreleasedReturnValue();

          if (!v24 || (objc_msgSend(v111, "containsDate:", v24) & 1) == 0)
          {
            GEOFindOrCreateLog();
            v45 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v20, "localizedDescription");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v46;
              _os_log_impl(&dword_1A427D000, v45, OS_LOG_TYPE_DEBUG, "Skipping %@", buf, 0xCu);

            }
            goto LABEL_85;
          }
          GEOFindOrCreateLog();
          v25 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v20, "localizedDescription");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v26;
            _os_log_impl(&dword_1A427D000, v25, OS_LOG_TYPE_DEBUG, "✅ Processing pass: %@", buf, 0xCu);

          }
          context = (void *)MEMORY[0x1A859CDD8]();
          v27 = v20;
          dispatch_assert_queue_V2(val[1]);
          if (-[NSObject style](v27, "style") != 4)
          {
            v47 = 0;
LABEL_83:

            goto LABEL_84;
          }
          v28 = v27;
          dispatch_assert_queue_V2(val[1]);
          GEOFindOrCreateLog();
          v29 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            -[dispatch_queue_t uniqueName](val, "uniqueName");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v30;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "_entryFromFlightPass";
            _os_log_impl(&dword_1A427D000, v29, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

          }
          GEOFindOrCreateLog();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_signpost_enabled(v31))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1A427D000, v31, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_entryFromFlightPass", ", buf, 2u);
          }

          GEOFindOrCreateLog();
          v32 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            -[NSObject localizedDescription](v28, "localizedDescription");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject flightCode](v28, "flightCode");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v33;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v34;
            _os_log_impl(&dword_1A427D000, v32, OS_LOG_TYPE_DEBUG, "Trying %@ (%@)", buf, 0x16u);

          }
          -[NSObject fieldReader](val[3], "fieldReader");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "loadPass:", v28);

          -[NSObject fieldReader](val[3], "fieldReader");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "combinedFlightCode");
          v37 = (id)objc_claimAutoreleasedReturnValue();

          -[NSObject fieldReader](val[3], "fieldReader");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "departureAirportCode");
          v113 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSObject fieldReader](val[3], "fieldReader");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "arrivalAirportCode");
          v109 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSObject fieldReader](val[3], "fieldReader");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "departureTerminal");
          v108 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSObject fieldReader](val[3], "fieldReader");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "departureGate");
          v107 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSObject fieldReader](val[3], "fieldReader");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "departureTime");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = v43;
          if (v43)
          {
            v112 = v43;
          }
          else
          {
            -[NSObject relevantDates](v28, "relevantDates");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "firstObject");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "date");
            v112 = (id)objc_claimAutoreleasedReturnValue();

          }
          -[NSObject fieldReader](val[3], "fieldReader");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "arrivalTime");
          v106 = (void *)objc_claimAutoreleasedReturnValue();

          GEOFindOrCreateLog();
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v113;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v37;
            *(_WORD *)&buf[22] = 2112;
            *(_QWORD *)&buf[24] = v112;
            _os_log_impl(&dword_1A427D000, v51, OS_LOG_TYPE_DEBUG, "departureAirportCode=%@, fullFlightNumber=%@, departureTime=%@", buf, 0x20u);
          }

          if (!v113 || !v37 || !v112)
          {
            GEOFindOrCreateLog();
            v67 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
            {
              -[NSObject uniqueID](v28, "uniqueID");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v68;
              _os_log_impl(&dword_1A427D000, v67, OS_LOG_TYPE_DEBUG, "Cannot do anything with %@", buf, 0xCu);

            }
            GEOFindOrCreateLog();
            v69 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
            {
              -[dispatch_queue_t uniqueName](val, "uniqueName");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v70;
              *(_WORD *)&buf[12] = 2080;
              *(_QWORD *)&buf[14] = "_entryFromFlightPass";
              _os_log_impl(&dword_1A427D000, v69, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);

            }
            GEOFindOrCreateLog();
            v66 = objc_claimAutoreleasedReturnValue();
            if (os_signpost_enabled(v66))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_1A427D000, v66, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_entryFromFlightPass", ", buf, 2u);
            }
            goto LABEL_62;
          }
          v52 = v37;
          objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = objc_msgSend(v52, "rangeOfCharacterFromSet:", v53) == 0x7FFFFFFFFFFFFFFFLL;

          if (v54)
          {
            -[NSObject organizationName](v28, "organizationName");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = objc_msgSend(CFSTR("JetBlue"), "isEqualToString:", v55);

            if (v56)
            {
              v57 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("B6%@"), v52);

              v52 = (id)v57;
            }
          }
          v58 = v52;
          objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = objc_msgSend(v58, "rangeOfCharacterFromSet:", v59) == 0x7FFFFFFFFFFFFFFFLL;

          if (v60)
          {
            -[NSObject organizationName](v28, "organizationName");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v62 = objc_msgSend(CFSTR("Spirit Airlines Inc"), "isEqualToString:", v61);

            if (v62)
            {
              v63 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("NK%@"), v58);

              v58 = (id)v63;
            }
          }
          v37 = v58;
          objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = objc_msgSend(v37, "rangeOfCharacterFromSet:", v64) == 0x7FFFFFFFFFFFFFFFLL;

          if (v65)
          {
            GEOFindOrCreateLog();
            v66 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136447490;
              *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsWallet.mm";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 268;
              *(_WORD *)&buf[18] = 2082;
              *(_QWORD *)&buf[20] = "-[MapsSuggestionsWallet _q_entryFromFlightPass:]";
              *(_WORD *)&buf[28] = 2082;
              *(_QWORD *)&buf[30] = "_isAllNumeric(fullFlightNumber)";
              *(_WORD *)&buf[38] = 2112;
              v141 = v37;
              LOWORD(v142[0]) = 2112;
              *(id *)((char *)v142 + 2) = v113;
              _os_log_impl(&dword_1A427D000, v66, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Full Flight number should not be all numeric: '%@' from %@", buf, 0x3Au);
            }
LABEL_62:
            v71 = 0;
            goto LABEL_70;
          }
          GEOFindOrCreateLog();
          v72 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v37;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v113;
            *(_WORD *)&buf[22] = 2112;
            *(_QWORD *)&buf[24] = v112;
            _os_log_impl(&dword_1A427D000, v72, OS_LOG_TYPE_DEBUG, "Creating Entry for Flight %@ (%@ %@)", buf, 0x20u);
          }

          v73 = [MapsSuggestionsEntry alloc];
          GEOConfigGetDouble();
          v75 = v74;
          GEOConfigGetDouble();
          objc_msgSend(v112, "dateByAddingTimeInterval:");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v132 = CFSTR("MapsSuggestionsWalletPK");
          *(_QWORD *)from = CFSTR("MapsSuggestionsPrimaryKey");
          *(_QWORD *)&from[8] = CFSTR("MapsSuggestionsWalletPK");
          -[NSObject uniqueID](v28, "uniqueID");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v133 = (uint64_t)v77;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v132, from, 2);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = -[MapsSuggestionsEntry initWithType:title:subtitle:weight:expires:geoMapItem:sourceSpecificInfo:](v73, "initWithType:title:subtitle:weight:expires:geoMapItem:sourceSpecificInfo:", 15, v113, 0, v76, 0, v78, v75);

          -[MapsSuggestionsEntry setString:forKey:](v71, "setString:forKey:", v37, CFSTR("MapsSuggestionsFullFlightNumberKey"));
          -[MapsSuggestionsEntry setString:forKey:](v71, "setString:forKey:", v107, CFSTR("MapsSuggestionsFlightDepartureGateKey"));
          -[MapsSuggestionsEntry setString:forKey:](v71, "setString:forKey:", v108, CFSTR("MapsSuggestionsFlightDepartureTerminalKey"));
          -[MapsSuggestionsEntry setString:forKey:](v71, "setString:forKey:", v113, CFSTR("MapsSuggestionsFlightDepartureAirportCodeKey"));
          -[MapsSuggestionsEntry setString:forKey:](v71, "setString:forKey:", v109, CFSTR("MapsSuggestionsFlightArrivalAirportCodeKey"));
          -[MapsSuggestionsEntry setString:forKey:](v71, "setString:forKey:", v113, CFSTR("MapsSuggestionsFlightFullTargetAirportKey"));
          -[MapsSuggestionsEntry setDate:forKey:](v71, "setDate:forKey:", v112, CFSTR("MapsSuggestionsFlightDepartureTimeKey"));
          -[MapsSuggestionsEntry setString:forKey:](v71, "setString:forKey:", v113, CFSTR("MapsSuggestionsEntryTitleNameKey"));
          -[MapsSuggestionsEntry setDate:forKey:](v71, "setDate:forKey:", v112, CFSTR("MapsSuggestionsScheduledTimeKey"));
          -[MapsSuggestionsEntry setDate:forKey:](v71, "setDate:forKey:", v106, CFSTR("MapsSuggestionsScheduledEndTimeKey"));
          v79 = objc_alloc(MEMORY[0x1E0C99E60]);
          v131 = MapsSuggestionsWalletAppBundleID;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v131, 1);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = objc_msgSend(v79, "initWithArray:", v80);

          -[MapsSuggestionsEntry setSet:forKey:](v71, "setSet:forKey:", v66, CFSTR("MapsSuggestionsAssociatedBundleIDsKey"));
          GEOFindOrCreateLog();
          v81 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
          {
            -[dispatch_queue_t uniqueName](val, "uniqueName");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v82;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "_entryFromFlightPass";
            _os_log_impl(&dword_1A427D000, v81, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);

          }
          GEOFindOrCreateLog();
          v83 = objc_claimAutoreleasedReturnValue();
          if (os_signpost_enabled(v83))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1A427D000, v83, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_entryFromFlightPass", ", buf, 2u);
          }

LABEL_70:
          if (v71)
          {
            objc_msgSend(v104, "addObject:", v71);
            dispatch_group_enter(group);
            dispatch_group_enter(group);
            v123[0] = MEMORY[0x1E0C809B0];
            v123[1] = 3221225472;
            v123[2] = __62__MapsSuggestionsWallet__q_readPassesWithHandler_withEndDate___block_invoke;
            v123[3] = &unk_1E4BCFD70;
            v84 = group;
            v124 = v84;
            v47 = v71;
            v85 = v123;
            dispatch_assert_queue_V2(val[1]);
            if (-[MapsSuggestionsEntry containsKey:](v47, "containsKey:", CFSTR("MapsSuggestionsFlightFullTargetAirportKey")))
            {
              objc_initWeak((id *)from, val);
              -[MapsSuggestionsEntry stringForKey:](v47, "stringForKey:", CFSTR("MapsSuggestionsFlightFullTargetAirportKey"));
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject objectForKeyedSubscript:](val[6], "objectForKeyedSubscript:", v86);
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              if (v87)
              {
                *(_QWORD *)buf = MEMORY[0x1E0C809B0];
                *(_QWORD *)&buf[8] = 3221225472;
                *(_QWORD *)&buf[16] = __62__MapsSuggestionsWallet__q_addLocationInfoToEntry_completion___block_invoke;
                *(_QWORD *)&buf[24] = &unk_1E4BCE7F8;
                objc_copyWeak(&v142[1], (id *)from);
                *(_QWORD *)&buf[32] = v47;
                v141 = v87;
                v142[0] = v85;
                v88 = val[1];
                v89 = v87;
                dispatch_async(v88, buf);

                objc_destroyWeak(&v142[1]);
                v90 = 1;
              }
              else
              {
                v92 = val[4];
                v132 = (const __CFString *)MEMORY[0x1E0C809B0];
                v133 = 3221225472;
                v134 = __62__MapsSuggestionsWallet__q_addLocationInfoToEntry_completion___block_invoke_136;
                v135 = &unk_1E4BCFD48;
                v138 = v85;
                objc_copyWeak(&v139, (id *)from);
                v136 = v47;
                v137 = v86;
                v90 = MapsSuggestionsSearchAirport(v137, v92, &v132);

                objc_destroyWeak(&v139);
              }

              objc_destroyWeak((id *)from);
            }
            else
            {
              GEOFindOrCreateLog();
              v91 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)from = 136446978;
                *(_QWORD *)&from[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsWallet.mm";
                *(_WORD *)&from[12] = 1024;
                *(_DWORD *)&from[14] = 181;
                v144 = 2082;
                v145 = "-[MapsSuggestionsWallet _q_addLocationInfoToEntry:completion:]";
                v146 = 2082;
                v147 = "NO == [entry containsKey:MapsSuggestionsFlightFullTargetAirportKey]";
                _os_log_impl(&dword_1A427D000, v91, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires airport code", from, 0x26u);
              }

              v90 = 0;
            }

            v93 = val[4];
            v121[0] = MEMORY[0x1E0C809B0];
            v121[1] = 3221225472;
            v121[2] = __62__MapsSuggestionsWallet__q_readPassesWithHandler_withEndDate___block_invoke_2;
            v121[3] = &unk_1E4BCFD70;
            v94 = v84;
            v122 = v94;
            MapsSuggestionsSetArrivalAirportFieldsForEntry(v47, v93, v121);
            if (!v90)
              dispatch_group_leave(v94);

            v27 = v124;
            goto LABEL_83;
          }
          v47 = 0;
LABEL_84:

          objc_autoreleasePoolPop(context);
LABEL_85:

        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v125, v130, 16);
      }
      while (v17);
    }

    objc_autoreleasePoolPop(v98);
    v95 = val[1];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__MapsSuggestionsWallet__q_readPassesWithHandler_withEndDate___block_invoke_3;
    block[3] = &unk_1E4BCE780;
    v96 = v95;
    objc_copyWeak(&v120, &location);
    v118 = v104;
    v119 = v101;
    v97 = v104;
    dispatch_group_notify(group, v96, block);

    objc_destroyWeak(&v120);
    objc_destroyWeak(&location);
    v5 = v103;
  }

}

- (BOOL)canProduceEntriesOfType:(int64_t)a3
{
  return a3 == 15;
}

void __62__MapsSuggestionsWallet__q_addLocationInfoToEntry_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
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
  if (WeakRetained)
  {
    v3 = MapsSuggestionsSetLocationFromMapItem(*(void **)(a1 + 32), *(void **)(a1 + 40), 9);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136446722;
      v6 = "MapsSuggestionsWallet.mm";
      v7 = 1026;
      v8 = 192;
      v9 = 2082;
      v10 = "-[MapsSuggestionsWallet _q_addLocationInfoToEntry:completion:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }

  }
}

void __62__MapsSuggestionsWallet__q_addLocationInfoToEntry_completion___block_invoke_136(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  dispatch_queue_t *WeakRetained;
  NSObject *v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  _BYTE v17[14];
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6 || objc_msgSend(v5, "count") != 1)
  {
    GEOFindOrCreateLog();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v17 = objc_msgSend(v5, "count");
      *(_WORD *)&v17[4] = 2112;
      *(_QWORD *)&v17[6] = v6;
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "Could not get airport code in %u mapItems, error: %@", buf, 0x12u);
    }

    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained(a1 + 7);
    if (WeakRetained)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __62__MapsSuggestionsWallet__q_addLocationInfoToEntry_completion___block_invoke_137;
      block[3] = &unk_1E4BCFD20;
      objc_copyWeak(&v15, a1 + 7);
      v11 = v5;
      v14 = a1[6];
      v12 = a1[4];
      v13 = a1[5];
      dispatch_async(WeakRetained[1], block);

      objc_destroyWeak(&v15);
    }
    else
    {
      GEOFindOrCreateLog();
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        *(_QWORD *)v17 = "MapsSuggestionsWallet.mm";
        *(_WORD *)&v17[8] = 1026;
        *(_DWORD *)&v17[10] = 210;
        v18 = 2082;
        v19 = "-[MapsSuggestionsWallet _q_addLocationInfoToEntry:completion:]_block_invoke";
        _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
      }

    }
  }

}

void __62__MapsSuggestionsWallet__q_addLocationInfoToEntry_completion___block_invoke_137(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  char *v6;
  id v7;
  NSObject *v8;
  char *v9;
  int v10;
  char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    MapsSuggestionsMapItemConvertIfNeeded(v3);
    v4 = objc_claimAutoreleasedReturnValue();

    if ((MapsSuggestionsMapItemIsAirport(v4) & 1) != 0)
    {
      if (!MapsSuggestionsMapItemIsVenue(v4))
      {
        GEOFindOrCreateLog();
        v5 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        {
          -[NSObject name](v4, "name");
          v6 = (char *)objc_claimAutoreleasedReturnValue();
          v10 = 138412290;
          v11 = v6;
          _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "Airport '%@' is not a Venue, but that's ok", (uint8_t *)&v10, 0xCu);

        }
      }
      v7 = MapsSuggestionsSetLocationFromMapItem(*(void **)(a1 + 40), v4, 9);
      objc_msgSend(WeakRetained[6], "setObject:forKeyedSubscript:", v4, *(_QWORD *)(a1 + 48));
    }
    else
    {
      GEOFindOrCreateLog();
      v8 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        -[NSObject name](v4, "name");
        v9 = (char *)objc_claimAutoreleasedReturnValue();
        v10 = 138412290;
        v11 = v9;
        _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "Airport '%@' is not actually an Airport", (uint8_t *)&v10, 0xCu);

      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v10 = 136446722;
      v11 = "MapsSuggestionsWallet.mm";
      v12 = 1026;
      v13 = 212;
      v14 = 2082;
      v15 = "-[MapsSuggestionsWallet _q_addLocationInfoToEntry:completion:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", (uint8_t *)&v10, 0x1Cu);
    }

  }
}

void __62__MapsSuggestionsWallet__q_readPassesWithHandler_withEndDate___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __62__MapsSuggestionsWallet__q_readPassesWithHandler_withEndDate___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __62__MapsSuggestionsWallet__q_readPassesWithHandler_withEndDate___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  double v5;
  double v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  char *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  double v26;
  uint8_t v27[128];
  uint8_t buf[4];
  char *v29;
  __int16 v30;
  _BYTE v31[14];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    MapsSuggestionsCurrentBestLocation();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      GEOConfigGetDouble();
      v6 = v5;
      v26 = 0.0;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v7 = *(id *)(a1 + 32);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v23 != v9)
              objc_enumerationMutation(v7);
            v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
            objc_msgSend(v11, "geoMapItem", (_QWORD)v22);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = v12 == 0;

            if (!v13)
            {
              MapsSuggestionsDistanceFromHereToEntry(v11, &v26);
              objc_msgSend(v11, "setBoolean:forKey:", v26 < v6, CFSTR("MapsSuggestionsAlreadyThereKey"), v26);
              -[NSObject addObject:](v3, "addObject:", v11);
            }
          }
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        }
        while (v8);
      }

      v14 = *(_QWORD *)(a1 + 40);
      if (v14)
      {
        v15 = -[NSObject copy](v3, "copy");
        (*(void (**)(uint64_t, id, _QWORD))(v14 + 16))(v14, v15, 0);

      }
      GEOFindOrCreateLog();
      v16 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(WeakRetained, "uniqueName");
        v17 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v29 = v17;
        v30 = 2080;
        *(_QWORD *)v31 = "_q_readPassesWithHandler";
        _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);

      }
      GEOFindOrCreateLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v18))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A427D000, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_q_readPassesWithHandler", ", buf, 2u);
      }

    }
    else
    {
      GEOFindOrCreateLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A427D000, v19, OS_LOG_TYPE_DEBUG, "No current location, keeping what we had", buf, 2u);
      }

      v20 = *(_QWORD *)(a1 + 40);
      if (v20)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -13, CFSTR("No current location"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v20 + 16))(v20, 0, v21);

      }
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v29 = "MapsSuggestionsWallet.mm";
      v30 = 1026;
      *(_DWORD *)v31 = 401;
      *(_WORD *)&v31[4] = 2082;
      *(_QWORD *)&v31[6] = "-[MapsSuggestionsWallet _q_readPassesWithHandler:withEndDate:]_block_invoke_3";
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

- (char)hasTransitPassWithHandler:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __51__MapsSuggestionsWallet_hasTransitPassWithHandler___block_invoke;
    v9[3] = &unk_1E4BCFD98;
    v10 = v4;
    MSg::Queue::async<MapsSuggestionsWallet>((NSObject **)&self->_queue, self, v9);

    v6 = 1;
  }
  else
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsWallet.mm";
      v13 = 1024;
      v14 = 439;
      v15 = 2082;
      v16 = "-[MapsSuggestionsWallet hasTransitPassWithHandler:]";
      v17 = 2082;
      v18 = "nil == (handler)";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
    }

    v6 = 0;
  }

  return v6;
}

void __51__MapsSuggestionsWallet_hasTransitPassWithHandler___block_invoke(uint64_t a1, id *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];

  -[MapsSuggestionsWallet connector](a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "passesOfType:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = ___ZL19_passesWithCardType17PKPaymentCardTypeP34MapsSuggestionsRealWalletConnector_block_invoke;
  v7[3] = &__block_descriptor_40_e8_B16__0_8l;
  v7[4] = 2;
  objc_msgSend(v4, "MSg_copyIf:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, BOOL, _QWORD))(v6 + 16))(v6, objc_msgSend(v5, "count") != 0, 0);

}

- (id)connector
{
  if (a1)
    a1 = (id *)a1[3];
  return a1;
}

- (char)hasPaymentCardWithHandler:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __51__MapsSuggestionsWallet_hasPaymentCardWithHandler___block_invoke;
    v9[3] = &unk_1E4BCFD98;
    v10 = v4;
    MSg::Queue::async<MapsSuggestionsWallet>((NSObject **)&self->_queue, self, v9);

    v6 = 1;
  }
  else
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsWallet.mm";
      v13 = 1024;
      v14 = 451;
      v15 = 2082;
      v16 = "-[MapsSuggestionsWallet hasPaymentCardWithHandler:]";
      v17 = 2082;
      v18 = "nil == (handler)";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
    }

    v6 = 0;
  }

  return v6;
}

void __51__MapsSuggestionsWallet_hasPaymentCardWithHandler___block_invoke(uint64_t a1, id *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[MapsSuggestionsWallet connector](a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v6 = v3;
    objc_msgSend(v3, "defaultPass");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, BOOL, _QWORD))(v4 + 16))(v4, v5 != 0, 0);

    v3 = v6;
  }

}

- (char)hasExpressPaymentCardWithHandler:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __58__MapsSuggestionsWallet_hasExpressPaymentCardWithHandler___block_invoke;
    v9[3] = &unk_1E4BCFD98;
    v10 = v4;
    MSg::Queue::async<MapsSuggestionsWallet>((NSObject **)&self->_queue, self, v9);

    v6 = 1;
  }
  else
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsWallet.mm";
      v13 = 1024;
      v14 = 464;
      v15 = 2082;
      v16 = "-[MapsSuggestionsWallet hasExpressPaymentCardWithHandler:]";
      v17 = 2082;
      v18 = "nil == (handler)";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
    }

    v6 = 0;
  }

  return v6;
}

void __58__MapsSuggestionsWallet_hasExpressPaymentCardWithHandler___block_invoke(uint64_t a1, id *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[MapsSuggestionsWallet connector](a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v6 = v3;
    objc_msgSend(v3, "defaultPass");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v4 + 16))(v4, objc_msgSend(v6, "expressSupportedByPass:", v5), 0);

    v3 = v6;
  }

}

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "description");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changedNotificationCanKicker, 0);
  objc_storeStrong((id *)&self->_airportCache, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->_connector, 0);

}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
