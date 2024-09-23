@implementation MapsSuggestionsFlightUpdater

- (MapsSuggestionsFlightUpdater)initWithFlightRequester:(id)a3 networkRequester:(id)a4
{
  id v7;
  id v8;
  MapsSuggestionsFlightUpdater *v9;
  MapsSuggestionsFlightUpdater *v10;
  void *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *innerQueue;
  NSString *v14;
  NSString *name;
  dispatch_queue_t v17;
  NSString *v18;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)MapsSuggestionsFlightUpdater;
  v9 = -[MapsSuggestionsFlightUpdater init](&v19, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_flightRequester, a3);
    objc_storeStrong((id *)&v10->_networkRequester, a4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    MSg::Queue::Queue(&v17, CFSTR("MapsSuggestionsFlightQueue"), v11);
    v12 = v17;
    v17 = 0;
    innerQueue = v10->_queue._innerQueue;
    v10->_queue._innerQueue = (OS_dispatch_queue *)v12;

    v14 = v18;
    v18 = 0;
    name = v10->_queue._name;
    v10->_queue._name = v14;

  }
  return v10;
}

- (id)initFromResourceDepot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  MapsSuggestionsFlightUpdater *v10;
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
      v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFlight.mm";
      v15 = 1024;
      v16 = 60;
      v17 = 2082;
      v18 = "-[MapsSuggestionsFlightUpdater initFromResourceDepot:]";
      v19 = 2082;
      v20 = "nil == (resourceDepot)";
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to build from!", (uint8_t *)&v13, 0x26u);
    }
    goto LABEL_13;
  }
  objc_msgSend(v4, "oneFlightRequester");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = 136446978;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFlight.mm";
      v15 = 1024;
      v16 = 61;
      v17 = 2082;
      v18 = "-[MapsSuggestionsFlightUpdater initFromResourceDepot:]";
      v19 = 2082;
      v20 = "nil == (resourceDepot.oneFlightRequester)";
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires One FlightRequester!", (uint8_t *)&v13, 0x26u);
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
      v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFlight.mm";
      v15 = 1024;
      v16 = 62;
      v17 = 2082;
      v18 = "-[MapsSuggestionsFlightUpdater initFromResourceDepot:]";
      v19 = 2082;
      v20 = "nil == (resourceDepot.oneNetworkRequester)";
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires One Network!", (uint8_t *)&v13, 0x26u);
    }
LABEL_13:

    v10 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v5, "oneFlightRequester");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "oneNetworkRequester");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[MapsSuggestionsFlightUpdater initWithFlightRequester:networkRequester:](self, "initWithFlightRequester:networkRequester:", v8, v9);

  v10 = self;
LABEL_14:

  return v10;
}

- (uint64_t)_getTerminalMapItemForFlightEntry:(void *)a3 handler:
{
  id v5;
  id v6;
  NSObject *v7;
  char *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  _QWORD v17[4];
  NSObject *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!a1)
  {
    v12 = 0;
    goto LABEL_24;
  }
  if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
    dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
  if (s_verbose)
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[MapsSuggestionsFlightUpdater _getTerminalMapItemForFlightEntry:handler:]";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
    }

  }
  if (!v6)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    *(_DWORD *)buf = 136446978;
    v22 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFlight.mm";
    v23 = 1024;
    v24 = 106;
    v25 = 2082;
    v26 = "-[MapsSuggestionsFlightUpdater _getTerminalMapItemForFlightEntry:handler:]";
    v27 = 2082;
    v28 = "nil == (handler)";
    v13 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a handler";
LABEL_18:
    v14 = v11;
    v15 = 38;
LABEL_21:
    _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
    goto LABEL_22;
  }
  if (!v5)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    *(_DWORD *)buf = 136446978;
    v22 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFlight.mm";
    v23 = 1024;
    v24 = 107;
    v25 = 2082;
    v26 = "-[MapsSuggestionsFlightUpdater _getTerminalMapItemForFlightEntry:handler:]";
    v27 = 2082;
    v28 = "nil == (entry)";
    v13 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a handler";
    goto LABEL_18;
  }
  if ((objc_msgSend(v5, "containsKey:", CFSTR("MapsSuggestionsFlightTerminalSearchKey")) & 1) != 0)
  {
    objc_msgSend(v5, "stringForKey:", CFSTR("MapsSuggestionsFlightTerminalSearchKey"));
    v8 = (char *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v8;
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_DEBUG, "terminalSearchString='%@'", buf, 0xCu);
    }

    v10 = *(void **)(a1 + 16);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __74__MapsSuggestionsFlightUpdater__getTerminalMapItemForFlightEntry_handler___block_invoke;
    v17[3] = &unk_1E4BCE3B0;
    v11 = v8;
    v18 = v11;
    v19 = v5;
    v20 = v6;
    v12 = MapsSuggestionsSearchTerminal(v11, v19, v10, v17);

    goto LABEL_23;
  }
  GEOFindOrCreateLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v13 = "Entry did not contain MapsSuggestionsFlightTerminalSearchKey. Cannot get Terminal mapItem";
    v14 = v11;
    v15 = 2;
    goto LABEL_21;
  }
LABEL_22:
  v12 = 0;
LABEL_23:

LABEL_24:
  return v12;
}

void __74__MapsSuggestionsFlightUpdater__getTerminalMapItemForFlightEntry_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6 || !objc_msgSend(v5, "count"))
  {
    GEOFindOrCreateLog();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "geoMapItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v31 = v8;
      v32 = 2112;
      v33 = v10;
      v34 = 2112;
      v35 = (uint64_t)v6;
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "Couldn't get Terminal '%@' within the Venue '%@': %@", buf, 0x20u);

    }
    goto LABEL_4;
  }
  if ((unint64_t)objc_msgSend(v5, "count") >= 2)
  {
    GEOFindOrCreateLog();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "geoMapItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v31 = v11;
      v32 = 2112;
      v33 = v13;
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "Too many mapItems returned for Terminal '%@' within the Venue '%@'", buf, 0x16u);

    }
LABEL_4:

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_5;
  }
  objc_msgSend(v5, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  MapsSuggestionsMapItemConvertIfNeeded(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if ((MapsSuggestionsMapItemIsTerminal(v15) & 1) != 0)
  {
    if (!MapsSuggestionsMapItemIsVenue(v15))
    {
      GEOFindOrCreateLog();
      v16 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v15, "name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v31 = v17;
        _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_ERROR, "Terminal '%@' is not a Venue", buf, 0xCu);

      }
    }
    v18 = MapsSuggestionsSetLocationFromMapItem(*(void **)(a1 + 40), v15, 2);
    MapsSuggestionsFlightUpdateAlreadyThere(*(void **)(a1 + 40));
    GEOFindOrCreateLog();
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 40), "geoMapItem");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "name");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "geoMapItem");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "_poiCategory");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "geoMapItem");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "_venueInfo");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "venueIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "venueID");
      *(_DWORD *)buf = 138412802;
      v31 = v29;
      v32 = 2112;
      v33 = v21;
      v34 = 2048;
      v35 = v25;
      _os_log_impl(&dword_1A427D000, v19, OS_LOG_TYPE_DEBUG, "Successfully got a Terminal '%@' as %@, venueID: %llu", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "setBoolean:forKey:", 1, CFSTR("MapsSuggestionsFlightMapItemIsTerminalKey"));
    objc_msgSend(*(id *)(a1 + 40), "setBoolean:forKey:", 0, CFSTR("MapsSuggestionsFlightMapItemIsGateKey"));
  }
  else
  {
    GEOFindOrCreateLog();
    v26 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v15, "name");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v31 = v27;
      _os_log_impl(&dword_1A427D000, v26, OS_LOG_TYPE_ERROR, "Terminal '%@' is not actually a Terminal", buf, 0xCu);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

LABEL_5:
}

void __70__MapsSuggestionsFlightUpdater__getGateMapItemForFlightEntry_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6 || !objc_msgSend(v5, "count"))
  {
    GEOFindOrCreateLog();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "geoMapItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v31 = v8;
      v32 = 2112;
      v33 = v10;
      v34 = 2112;
      v35 = (uint64_t)v6;
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "Couldn't get Gate '%@' within the Venue '%@': %@", buf, 0x20u);

    }
    goto LABEL_4;
  }
  if ((unint64_t)objc_msgSend(v5, "count") >= 2)
  {
    GEOFindOrCreateLog();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "geoMapItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v31 = v11;
      v32 = 2112;
      v33 = v13;
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "Too many mapItems returned for Gate '%@' within the Venue '%@'", buf, 0x16u);

    }
LABEL_4:

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_5;
  }
  objc_msgSend(v5, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  MapsSuggestionsMapItemConvertIfNeeded(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if ((MapsSuggestionsMapItemIsGate(v15) & 1) != 0)
  {
    if (!MapsSuggestionsMapItemIsVenue(v15))
    {
      GEOFindOrCreateLog();
      v16 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v15, "name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v31 = v17;
        _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_ERROR, "Gate '%@' is not a Venue", buf, 0xCu);

      }
    }
    v18 = MapsSuggestionsSetLocationFromMapItem(*(void **)(a1 + 40), v15, 2);
    MapsSuggestionsFlightUpdateAlreadyThere(*(void **)(a1 + 40));
    GEOFindOrCreateLog();
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 40), "geoMapItem");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "name");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "geoMapItem");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "_poiCategory");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "geoMapItem");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "_venueInfo");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "venueIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "venueID");
      *(_DWORD *)buf = 138412802;
      v31 = v29;
      v32 = 2112;
      v33 = v21;
      v34 = 2048;
      v35 = v25;
      _os_log_impl(&dword_1A427D000, v19, OS_LOG_TYPE_DEBUG, "Successfully got a Gate '%@' as %@, venueID: %llu", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "setBoolean:forKey:", 1, CFSTR("MapsSuggestionsFlightMapItemIsGateKey"));
  }
  else
  {
    GEOFindOrCreateLog();
    v26 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v15, "name");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v31 = v27;
      _os_log_impl(&dword_1A427D000, v26, OS_LOG_TYPE_ERROR, "Gate '%@' is not actually a Gate", buf, 0xCu);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

LABEL_5:
}

void __63__MapsSuggestionsFlightUpdater__updateFlightsForEntry_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *WeakRetained;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  _QWORD *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  char *v17;
  id v18;
  _QWORD *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  char *v26;
  id v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  _BYTE v31[32];
  char *v32;
  id v33;
  id v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  const char *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v8 = *(void **)(a1 + 32);
    v9 = v5;
    v10 = v8;
    if (objc_msgSend(v9, "containsKey:", CFSTR("MapsSuggestionsFlightDepartureGateKey"))
      && objc_msgSend(v9, "BOOLeanForKey:", CFSTR("MapsSuggestionsAlreadyThereKey")))
    {
      v11 = MEMORY[0x1E0C809B0];
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __68__MapsSuggestionsFlightUpdater__updateGateIfNeededForEntry_handler___block_invoke;
      v29[3] = &unk_1E4BCE400;
      v27 = v10;
      v30 = v27;
      v12 = v9;
      v13 = v29;
      if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
        dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
      v28 = v12;
      if (s_verbose)
      {
        GEOFindOrCreateLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v36 = "-[MapsSuggestionsFlightUpdater _getGateMapItemForFlightEntry:handler:]";
          _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
        }

        v12 = v28;
      }
      if (v12)
      {
        objc_msgSend(v12, "stringForKey:", CFSTR("MapsSuggestionsFlightDepartureGateKey"));
        v26 = (char *)objc_claimAutoreleasedReturnValue();
        GEOFindOrCreateLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v36 = v26;
          _os_log_impl(&dword_1A427D000, v15, OS_LOG_TYPE_DEBUG, "gateSearchString='%@'", buf, 0xCu);
        }

        v16 = (void *)WeakRetained[2];
        *(_QWORD *)v31 = v11;
        *(_QWORD *)&v31[8] = 3221225472;
        *(_QWORD *)&v31[16] = __70__MapsSuggestionsFlightUpdater__getGateMapItemForFlightEntry_handler___block_invoke;
        *(_QWORD *)&v31[24] = &unk_1E4BCE3B0;
        v17 = v26;
        v32 = v17;
        v18 = v28;
        v33 = v18;
        v19 = v13;
        v34 = v19;
        LODWORD(v16) = MapsSuggestionsSearchGate(v17, v18, v16, v31);

        if ((_DWORD)v16 == 1)
          goto LABEL_22;
      }
      else
      {
        GEOFindOrCreateLog();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446978;
          v36 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFlight.mm";
          v37 = 1024;
          v38 = 167;
          v39 = 2082;
          v40 = "-[MapsSuggestionsFlightUpdater _getGateMapItemForFlightEntry:handler:]";
          v41 = 2082;
          v42 = "nil == (entry)";
          _os_log_impl(&dword_1A427D000, v25, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a handler", buf, 0x26u);
        }

      }
    }
    else
    {

    }
    v20 = v9;
    if (objc_msgSend(v20, "containsKey:", CFSTR("MapsSuggestionsFlightFullTargetAirportKey")))
    {
      v21 = objc_alloc_init(MEMORY[0x1E0D271F0]);
      objc_msgSend(v20, "stringForKey:", CFSTR("MapsSuggestionsFlightFullTargetAirportKey"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setName:", v22);

      objc_msgSend(v20, "geoMapItem");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setUserValues:", v21);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    goto LABEL_22;
  }
  GEOFindOrCreateLog();
  v24 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v31 = 136446722;
    *(_QWORD *)&v31[4] = "MapsSuggestionsFlight.mm";
    *(_WORD *)&v31[12] = 1026;
    *(_DWORD *)&v31[14] = 237;
    *(_WORD *)&v31[18] = 2082;
    *(_QWORD *)&v31[20] = "-[MapsSuggestionsFlightUpdater _updateFlightsForEntry:handler:]_block_invoke";
    _os_log_impl(&dword_1A427D000, v24, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", v31, 0x1Cu);
  }

LABEL_22:
}

void __63__MapsSuggestionsFlightUpdater__updateFlightsForEntry_handler___block_invoke_116(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  dispatch_queue_t *WeakRetained;
  NSObject *v8;
  _QWORD v9[4];
  NSObject *v10;
  id v11;
  id v12;
  dispatch_queue_t *v13;
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
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __63__MapsSuggestionsFlightUpdater__updateFlightsForEntry_handler___block_invoke_117;
    v9[3] = &unk_1E4BCE428;
    v10 = v6;
    v14 = a1[5];
    v11 = a1[4];
    v12 = v5;
    v13 = WeakRetained;
    v15 = a1[6];
    dispatch_async(WeakRetained[3], v9);

    v8 = v10;
  }
  else
  {
    GEOFindOrCreateLog();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v17 = "MapsSuggestionsFlight.mm";
      v18 = 1026;
      v19 = 249;
      v20 = 2082;
      v21 = "-[MapsSuggestionsFlightUpdater _updateFlightsForEntry:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __63__MapsSuggestionsFlightUpdater__updateFlightsForEntry_handler___block_invoke_117(uint64_t a1)
{
  NSObject *v2;
  const __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  char v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  const __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    GEOFindOrCreateLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = *(const __CFString **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v30 = v3;
      _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_ERROR, "Error getting flights: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    return;
  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v4 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "departingAirportCode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    MapsSuggestionsBestFlightLeg(v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      GEOFindOrCreateLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v30 = CFSTR("Received no eligible flight legs to work with!?");
        _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }

      v14 = *(_QWORD *)(a1 + 64);
      v15 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -8, CFSTR("Received no eligible flight legs to work with!?"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void *))(v14 + 16))(v14, v15, v16);

      goto LABEL_30;
    }
    MapsSuggestionsUpdateEntryFromFlightLeg(*(void **)(a1 + 40), v6);
    MapsSuggestionsFlightUpdateAlreadyThere(*(void **)(a1 + 40));
    v7 = *(id *)(a1 + 40);
    if (objc_msgSend(v7, "containsKey:", CFSTR("MapsSuggestionsFlightAlwaysGetTerminalAndGateKey")))
    {
      v8 = objc_msgSend(v7, "BOOLeanForKey:", CFSTR("MapsSuggestionsFlightAlwaysGetTerminalAndGateKey"));

      if ((v8 & 1) == 0)
        goto LABEL_26;
      goto LABEL_21;
    }
    objc_msgSend(v7, "geoMapItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0D27008], "sharedConfiguration");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "countryCode");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("CN"));

      if (v20)
      {

        goto LABEL_21;
      }
      objc_msgSend(v17, "_venueInfo");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "venueIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
LABEL_21:
        if (objc_msgSend(*(id *)(a1 + 40), "containsKey:", CFSTR("MapsSuggestionsFlightDepartureTerminalKey")))
        {
          if ((objc_msgSend(*(id *)(a1 + 40), "BOOLeanForKey:is:", CFSTR("MapsSuggestionsFlightMapItemIsTerminalKey"), 1) & 1) == 0&& (objc_msgSend(*(id *)(a1 + 40), "BOOLeanForKey:is:", CFSTR("MapsSuggestionsFlightMapItemIsGateKey"), 1) & 1) == 0)
          {
            v23 = *(_QWORD *)(a1 + 56);
            v24 = *(void **)(a1 + 40);
            v27[0] = MEMORY[0x1E0C809B0];
            v27[1] = 3221225472;
            v27[2] = __63__MapsSuggestionsFlightUpdater__updateFlightsForEntry_handler___block_invoke_122;
            v27[3] = &unk_1E4BCE400;
            v28 = *(id *)(a1 + 72);
            LOBYTE(v23) = -[MapsSuggestionsFlightUpdater _getTerminalMapItemForFlightEntry:handler:](v23, v24, v27) == 1;

            if ((v23 & 1) != 0)
              goto LABEL_30;
          }
        }
        v25 = a1 + 72;
LABEL_29:
        (*(void (**)(void))(*(_QWORD *)v25 + 16))();
LABEL_30:

        return;
      }
    }
    else
    {

    }
LABEL_26:
    GEOFindOrCreateLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A427D000, v26, OS_LOG_TYPE_DEBUG, "We should not get Terminal & Gate for this Entry", buf, 2u);
    }

    v25 = a1 + 64;
    goto LABEL_29;
  }
  GEOFindOrCreateLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v30 = CFSTR("Received no flights to work with!?");
    _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }

  v10 = *(_QWORD *)(a1 + 64);
  v11 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -8, CFSTR("Received no flights to work with!?"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *))(v10 + 16))(v10, v11, v12);

}

void __63__MapsSuggestionsFlightUpdater__updateFlightsForEntry_handler___block_invoke_122(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a2;
  v6 = a3;
  v10 = v5;
  if (objc_msgSend(v10, "containsKey:", CFSTR("MapsSuggestionsFlightFullTargetAirportKey")))
  {
    v7 = objc_alloc_init(MEMORY[0x1E0D271F0]);
    objc_msgSend(v10, "stringForKey:", CFSTR("MapsSuggestionsFlightFullTargetAirportKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setName:", v8);

    objc_msgSend(v10, "geoMapItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setUserValues:", v7);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __68__MapsSuggestionsFlightUpdater__updateGateIfNeededForEntry_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a2;
  v6 = a3;
  v10 = v5;
  if (objc_msgSend(v10, "containsKey:", CFSTR("MapsSuggestionsFlightFullTargetAirportKey")))
  {
    v7 = objc_alloc_init(MEMORY[0x1E0D271F0]);
    objc_msgSend(v10, "stringForKey:", CFSTR("MapsSuggestionsFlightFullTargetAirportKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setName:", v8);

    objc_msgSend(v10, "geoMapItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setUserValues:", v7);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (char)updateFlightsForEntry:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  NSObject *v10;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFlight.mm";
      v17 = 1024;
      v18 = 330;
      v19 = 2082;
      v20 = "-[MapsSuggestionsFlightUpdater updateFlightsForEntry:handler:]";
      v21 = 2082;
      v22 = "nil == (entry)";
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry", buf, 0x26u);
    }
    goto LABEL_13;
  }
  if (!v7)
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFlight.mm";
      v17 = 1024;
      v18 = 331;
      v19 = 2082;
      v20 = "-[MapsSuggestionsFlightUpdater updateFlightsForEntry:handler:]";
      v21 = 2082;
      v22 = "nil == (handler)";
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a handler block", buf, 0x26u);
    }
    goto LABEL_13;
  }
  if (objc_msgSend(v6, "type") != 15)
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFlight.mm";
      v17 = 1024;
      v18 = 332;
      v19 = 2082;
      v20 = "-[MapsSuggestionsFlightUpdater updateFlightsForEntry:handler:]";
      v21 = 2082;
      v22 = "MapsSuggestionsEntryTypeTravelFlight != entry.type";
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a flight entry", buf, 0x26u);
    }
LABEL_13:

    v9 = 0;
    goto LABEL_14;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__MapsSuggestionsFlightUpdater_updateFlightsForEntry_handler___block_invoke;
  block[3] = &unk_1E4BCE478;
  block[4] = self;
  v13 = v6;
  v14 = v8;
  dispatch_sync((dispatch_queue_t)self->_queue._innerQueue, block);

  v9 = 1;
LABEL_14:

  return v9;
}

void __62__MapsSuggestionsFlightUpdater_updateFlightsForEntry_handler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19[2];
  _QWORD aBlock[4];
  id v21;
  id v22;
  id location;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  v3 = *(id *)(a1 + 40);
  v4 = v2;
  if (v1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 24));
    objc_msgSend(v3, "dateForKey:", CFSTR("MapsSuggestionsFlightDepartureTimeKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MapsSuggestionsSecondsTo(v5);
    GEOConfigGetDouble();
    if (v6 <= v7)
    {
      objc_msgSend(v3, "stringForKey:", CFSTR("MapsSuggestionsFullFlightNumberKey"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, (id)v1);
      v10 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __63__MapsSuggestionsFlightUpdater__updateFlightsForEntry_handler___block_invoke;
      aBlock[3] = &unk_1E4BCE3D8;
      objc_copyWeak(&v22, &location);
      v11 = v4;
      v21 = v11;
      v12 = _Block_copy(aBlock);
      v13 = *(void **)(v1 + 8);
      v15[0] = v10;
      v15[1] = 3221225472;
      v15[2] = __63__MapsSuggestionsFlightUpdater__updateFlightsForEntry_handler___block_invoke_116;
      v15[3] = &unk_1E4BCE450;
      objc_copyWeak(v19, &location);
      v17 = v11;
      v16 = v3;
      v18 = v12;
      v14 = v12;
      objc_msgSend(v13, "requestFlightsWithFullFlightNumber:departureDate:handler:", v9, v5, v15);

      objc_destroyWeak(v19);
      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);

    }
    else
    {
      GEOFindOrCreateLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v15[0]) = 0;
        _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "Too early to do flight updates. Skipping update", (uint8_t *)v15, 2u);
      }

      (*((void (**)(id, id, _QWORD))v4 + 2))(v4, v3, 0);
    }

  }
}

- (void).cxx_destruct
{

  objc_storeStrong((id *)&self->_networkRequester, 0);
  objc_storeStrong((id *)&self->_flightRequester, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end
