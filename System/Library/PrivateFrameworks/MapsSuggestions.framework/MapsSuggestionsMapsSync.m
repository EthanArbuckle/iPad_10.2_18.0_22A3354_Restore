@implementation MapsSuggestionsMapsSync

- (MapsSuggestionsMapsSync)initWithMapsSyncConnector:(id)a3
{
  id v5;
  MapsSuggestionsMapsSync *v6;
  void *v7;
  OS_dispatch_queue *v8;
  OS_dispatch_queue *innerQueue;
  NSString *v10;
  NSString *name;
  MapsSuggestionsObservers *v12;
  OS_dispatch_queue *v13;
  uint64_t v14;
  MapsSuggestionsObservers *historyObservers;
  MapsSuggestionsObservers *v16;
  OS_dispatch_queue *v17;
  uint64_t v18;
  MapsSuggestionsObservers *transitItemObservers;
  MapsSuggestionsObservers *v20;
  OS_dispatch_queue *v21;
  uint64_t v22;
  MapsSuggestionsObservers *favoriteItemObservers;
  NSObject *v24;
  void *v25;
  void *v26;
  objc_super v28;
  _BYTE buf[22];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)MapsSuggestionsMapsSync;
  v6 = -[MapsSuggestionsMapsSync init](&v28, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    MSg::Queue::Queue((dispatch_queue_t *)buf, CFSTR("MapsSuggestionsMapsSyncQueue"), v7);
    v8 = *(OS_dispatch_queue **)buf;
    *(_QWORD *)buf = 0;
    innerQueue = v6->_queue._innerQueue;
    v6->_queue._innerQueue = v8;

    v10 = *(NSString **)&buf[8];
    *(_QWORD *)&buf[8] = 0;
    name = v6->_queue._name;
    v6->_queue._name = v10;

    objc_storeStrong((id *)&v6->_connector, a3);
    -[MapsSuggestionsMapsSyncConnector setDelegate:](v6->_connector, "setDelegate:", v6);
    v12 = [MapsSuggestionsObservers alloc];
    v13 = v6->_queue._innerQueue;
    v14 = -[MapsSuggestionsObservers initWithCallbackQueue:name:](v12, "initWithCallbackQueue:name:", v13, CFSTR("MapsSuggestionsMapsSyncHistoryObservers"));
    historyObservers = v6->_historyObservers;
    v6->_historyObservers = (MapsSuggestionsObservers *)v14;

    v16 = [MapsSuggestionsObservers alloc];
    v17 = v6->_queue._innerQueue;
    v18 = -[MapsSuggestionsObservers initWithCallbackQueue:name:](v16, "initWithCallbackQueue:name:", v17, CFSTR("MapsSuggestionsMapsSyncTransitItemsObservers"));
    transitItemObservers = v6->_transitItemObservers;
    v6->_transitItemObservers = (MapsSuggestionsObservers *)v18;

    v20 = [MapsSuggestionsObservers alloc];
    v21 = v6->_queue._innerQueue;
    v22 = -[MapsSuggestionsObservers initWithCallbackQueue:name:](v20, "initWithCallbackQueue:name:", v21, CFSTR("MapsSuggestionsMapsSyncFavoriteItemsObservers"));
    favoriteItemObservers = v6->_favoriteItemObservers;
    v6->_favoriteItemObservers = (MapsSuggestionsObservers *)v22;

    GEOFindOrCreateLog();
    v24 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      -[MapsSuggestionsMapsSync uniqueName](v6, "uniqueName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[MapsSuggestionsMapsSyncConnector uniqueName](v6->_connector, "uniqueName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v25;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v26;
      _os_log_impl(&dword_1A427D000, v24, OS_LOG_TYPE_DEBUG, "%@ is using %@", buf, 0x16u);

    }
  }

  return v6;
}

- (id)initFromResourceDepot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MapsSuggestionsMapsSync *v8;
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
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 136446978;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
      v13 = 1024;
      v14 = 72;
      v15 = 2082;
      v16 = "-[MapsSuggestionsMapsSync initFromResourceDepot:]";
      v17 = 2082;
      v18 = "nil == (resourceDepot)";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to build from!", (uint8_t *)&v11, 0x26u);
    }
    goto LABEL_9;
  }
  objc_msgSend(v4, "oneMapsSyncConnector");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 136446978;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
      v13 = 1024;
      v14 = 73;
      v15 = 2082;
      v16 = "-[MapsSuggestionsMapsSync initFromResourceDepot:]";
      v17 = 2082;
      v18 = "nil == (resourceDepot.oneMapsSyncConnector)";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires One MapsSyncConnector!", (uint8_t *)&v11, 0x26u);
    }
LABEL_9:

    v8 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v5, "oneMapsSyncConnector");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[MapsSuggestionsMapsSync initWithMapsSyncConnector:](self, "initWithMapsSyncConnector:", v7);

  v8 = self;
LABEL_10:

  return v8;
}

- (char)userHasFavoriteTransitLinesWithHandler:(id)a3
{
  id v4;
  MapsSuggestionsMapsSyncConnector *connector;
  char v6;
  NSObject *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  _BYTE location[12];
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_initWeak((id *)location, self);
    connector = self->_connector;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __66__MapsSuggestionsMapsSync_userHasFavoriteTransitLinesWithHandler___block_invoke;
    v9[3] = &unk_1E4BD0298;
    objc_copyWeak(&v11, (id *)location);
    v10 = v4;
    v6 = -[MapsSuggestionsMapsSyncConnector allContentOfType:handler:](connector, "allContentOfType:handler:", 2, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)location);
  }
  else
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
      v13 = 1024;
      v14 = 80;
      v15 = 2082;
      v16 = "-[MapsSuggestionsMapsSync userHasFavoriteTransitLinesWithHandler:]";
      v17 = 2082;
      v18 = "nil == (handler)";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. MapsSuggestionsUserHasFavoriteTransitItemBlock handler cannot be nil!", location, 0x26u);
    }

    v6 = 0;
  }

  return v6;
}

void __66__MapsSuggestionsMapsSync_userHasFavoriteTransitLinesWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[4];
  NSObject *v9;
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
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[1];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __66__MapsSuggestionsMapsSync_userHasFavoriteTransitLinesWithHandler___block_invoke_112;
    v8[3] = &unk_1E4BCE138;
    v9 = v3;
    v10 = *(id *)(a1 + 32);
    dispatch_async(v6, v8);

    v7 = v9;
  }
  else
  {
    GEOFindOrCreateLog();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v12 = "MapsSuggestionsMapsSync.mm";
      v13 = 1026;
      v14 = 85;
      v15 = 2082;
      v16 = "-[MapsSuggestionsMapsSync userHasFavoriteTransitLinesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

uint64_t __66__MapsSuggestionsMapsSync_userHasFavoriteTransitLinesWithHandler___block_invoke_112(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v3 = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v3);
}

- (char)userHasFavoriteTransitPOIsWithHandler:(id)a3
{
  id v4;
  MapsSuggestionsMapsSyncConnector *connector;
  char v6;
  NSObject *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  _BYTE location[12];
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_initWeak((id *)location, self);
    connector = self->_connector;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __65__MapsSuggestionsMapsSync_userHasFavoriteTransitPOIsWithHandler___block_invoke;
    v9[3] = &unk_1E4BD0298;
    objc_copyWeak(&v11, (id *)location);
    v10 = v4;
    v6 = -[MapsSuggestionsMapsSyncConnector allContentOfType:handler:](connector, "allContentOfType:handler:", 3, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)location);
  }
  else
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
      v13 = 1024;
      v14 = 102;
      v15 = 2082;
      v16 = "-[MapsSuggestionsMapsSync userHasFavoriteTransitPOIsWithHandler:]";
      v17 = 2082;
      v18 = "nil == (handler)";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. MapsSuggestionsUserHasFavoriteTransitItemBlock handler cannot be nil!", location, 0x26u);
    }

    v6 = 0;
  }

  return v6;
}

void __65__MapsSuggestionsMapsSync_userHasFavoriteTransitPOIsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[4];
  NSObject *v9;
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
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[1];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __65__MapsSuggestionsMapsSync_userHasFavoriteTransitPOIsWithHandler___block_invoke_116;
    v8[3] = &unk_1E4BCE138;
    v9 = v3;
    v10 = *(id *)(a1 + 32);
    dispatch_async(v6, v8);

    v7 = v9;
  }
  else
  {
    GEOFindOrCreateLog();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v12 = "MapsSuggestionsMapsSync.mm";
      v13 = 1026;
      v14 = 107;
      v15 = 2082;
      v16 = "-[MapsSuggestionsMapsSync userHasFavoriteTransitPOIsWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

uint64_t __65__MapsSuggestionsMapsSync_userHasFavoriteTransitPOIsWithHandler___block_invoke_116(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  unsigned int v8;
  NSObject *v9;
  uint8_t v11[16];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = -[NSObject countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v13 != v4)
          objc_enumerationMutation(v2);
        MapsSuggestionsShortcutFromMSFavoriteItem(*(void **)(*((_QWORD *)&v12 + 1) + 8 * i));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "type") == 1)
        {
          objc_msgSend(v6, "geoMapItem");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = MapsSuggestionsMapItemIsTransitStation(v7);

          if (v8)
          {
            GEOFindOrCreateLog();
            v9 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)v11 = 0;
              _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_DEBUG, "User has at least one favorite transit stop", v11, 2u);
            }

            goto LABEL_16;
          }
        }

      }
      v3 = -[NSObject countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v3)
        continue;
      break;
    }
  }

  GEOFindOrCreateLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_DEBUG, "User has no transit stops", v11, 2u);
  }
LABEL_16:

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (char)durationSinceLastTransitHistoryRoute:(id)a3
{
  id v4;
  MapsSuggestionsMapsSyncConnector *connector;
  char v6;
  NSObject *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  _BYTE location[12];
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_initWeak((id *)location, self);
    connector = self->_connector;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __64__MapsSuggestionsMapsSync_durationSinceLastTransitHistoryRoute___block_invoke;
    v9[3] = &unk_1E4BD0298;
    objc_copyWeak(&v11, (id *)location);
    v10 = v4;
    v6 = -[MapsSuggestionsMapsSyncConnector allContentOfType:handler:](connector, "allContentOfType:handler:", 1, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)location);
  }
  else
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
      v13 = 1024;
      v14 = 136;
      v15 = 2082;
      v16 = "-[MapsSuggestionsMapsSync durationSinceLastTransitHistoryRoute:]";
      v17 = 2082;
      v18 = "nil == (handler)";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. MapsSuggestionsDurationSinceLastTransitRouteBlock handler cannot be nil!", location, 0x26u);
    }

    v6 = 0;
  }

  return v6;
}

void __64__MapsSuggestionsMapsSync_durationSinceLastTransitHistoryRoute___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[4];
  NSObject *v9;
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
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[1];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __64__MapsSuggestionsMapsSync_durationSinceLastTransitHistoryRoute___block_invoke_117;
    v8[3] = &unk_1E4BCE138;
    v9 = v3;
    v10 = *(id *)(a1 + 32);
    dispatch_async(v6, v8);

    v7 = v9;
  }
  else
  {
    GEOFindOrCreateLog();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v12 = "MapsSuggestionsMapsSync.mm";
      v13 = 1026;
      v14 = 141;
      v15 = 2082;
      v16 = "-[MapsSuggestionsMapsSync durationSinceLastTransitHistoryRoute:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __64__MapsSuggestionsMapsSync_durationSinceLastTransitHistoryRoute___block_invoke_117(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  char v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  double v27;
  uint64_t v28;
  const __CFString *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v3)
  {
    v4 = 0;
    v5 = 0;
    v6 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = v8;

          objc_msgSend(v9, "routeRequestStorage", (_QWORD)v22);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "transportType") == 1;

          v5 |= v11;
          v4 = v9;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v3);

    if ((v5 & 1) != 0)
    {
      MapsSuggestionsNow();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "createTime");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceDate:", v13);
      v15 = v14;

      (*(void (**)(double))(*(_QWORD *)(a1 + 40) + 16))(v15);
      GEOFindOrCreateLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v27 = v15;
        _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_DEBUG, "Time since the transit history route: %f", buf, 0xCu);
      }
      goto LABEL_17;
    }
  }
  else
  {

    v4 = 0;
  }
  v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
  GEOErrorDomain();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = *MEMORY[0x1E0CB2D68];
  v29 = CFSTR("There is no transit history route");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v17, "initWithDomain:code:userInfo:", v18, -8, v19);

  (*(void (**)(double))(*(_QWORD *)(a1 + 40) + 16))(0.0);
  GEOFindOrCreateLog();
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    -[NSObject localizedDescription](v16, "localizedDescription");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v27 = *(double *)&v21;
    _os_log_impl(&dword_1A427D000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

  }
LABEL_17:

}

- (char)entriesFromHistoryWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  OS_dispatch_queue *v6;
  MapsSuggestionsMapsSyncConnector *connector;
  OS_dispatch_queue *v8;
  char v9;
  NSObject *v10;
  _QWORD v12[4];
  OS_dispatch_queue *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "entriesFromHistoryWithHandler", buf, 2u);
  }

  if (v4)
  {
    objc_initWeak((id *)buf, self);
    v6 = objc_retainAutorelease(self->_queue._innerQueue);
    connector = self->_connector;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __57__MapsSuggestionsMapsSync_entriesFromHistoryWithHandler___block_invoke;
    v12[3] = &unk_1E4BD0328;
    v8 = v6;
    v13 = v8;
    objc_copyWeak(&v15, (id *)buf);
    v14 = v4;
    v9 = -[MapsSuggestionsMapsSyncConnector allContentOfType:handler:](connector, "allContentOfType:handler:", 1, v12);

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
      v18 = 1024;
      v19 = 180;
      v20 = 2082;
      v21 = "-[MapsSuggestionsMapsSync entriesFromHistoryWithHandler:]";
      v22 = 2082;
      v23 = "nil == (handler)";
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
    }

    v9 = 0;
  }

  return v9;
}

void __57__MapsSuggestionsMapsSync_entriesFromHistoryWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;
  uint8_t buf[4];
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_21);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  GEOFindOrCreateLog();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    v13 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "Received %u RecentHistory items from MapsSync", buf, 8u);
  }

  v6 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__MapsSuggestionsMapsSync_entriesFromHistoryWithHandler___block_invoke_124;
  block[3] = &unk_1E4BCE780;
  objc_copyWeak(&v11, (id *)(a1 + 48));
  v9 = v4;
  v10 = *(id *)(a1 + 40);
  v7 = v4;
  dispatch_async(v6, block);

  objc_destroyWeak(&v11);
}

uint64_t __57__MapsSuggestionsMapsSync_entriesFromHistoryWithHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "createTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "compare:", v6);

  return v7;
}

void __57__MapsSuggestionsMapsSync_entriesFromHistoryWithHandler___block_invoke_124(uint64_t a1)
{
  uint64_t v1;
  __int128 v2;
  int v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  MapsSuggestionsEntry *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  id v24;
  void *v25;
  _BOOL4 v26;
  _BOOL8 v27;
  id v28;
  id v29;
  MapsSuggestionsEntry *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _BOOL4 v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  id v46;
  void *v47;
  _BOOL4 v48;
  _BOOL8 v49;
  NSObject *v50;
  MapsSuggestionsEntry *v51;
  MapsSuggestionsEntry *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  _BOOL4 v59;
  void *v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  NSObject *v65;
  void *v66;
  double v67;
  MapsSuggestionsEntry *v68;
  NSObject *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  NSObject *v73;
  void *v74;
  _BOOL4 v75;
  void *v76;
  _BOOL4 v77;
  NSObject *v78;
  void *v79;
  NSObject *v80;
  NSObject *v81;
  const char *v82;
  NSObject *v83;
  NSObject *v84;
  NSObject *v85;
  const char *v86;
  uint32_t v87;
  MapsSuggestionsEntry *v88;
  void *v89;
  _BOOL4 v90;
  void *v91;
  _BOOL4 v92;
  NSObject *v93;
  void *v94;
  NSObject *v95;
  NSObject *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  _BOOL4 v101;
  void *v102;
  _BOOL4 v103;
  void *v104;
  NSObject *v105;
  uint64_t v106;
  NSObject *v107;
  void *v108;
  uint64_t v109;
  id v110;
  NSObject *v111;
  __int128 v112;
  id v113;
  id WeakRetained;
  NSObject *v116;
  id obj;
  uint64_t v118;
  int v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  _BYTE v124[128];
  _BYTE buf[12];
  __int16 v126;
  int v127;
  __int16 v128;
  const char *v129;
  __int16 v130;
  const char *v131;
  uint64_t v132;

  v132 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
  {
    GEOFindOrCreateLog();
    v111 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)&buf[4] = "MapsSuggestionsMapsSync.mm";
      v126 = 1026;
      v127 = 195;
      v128 = 2082;
      v129 = "-[MapsSuggestionsMapsSync entriesFromHistoryWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v111, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
    v116 = v111;
    goto LABEL_129;
  }
  v116 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
  v122 = 0u;
  v123 = 0u;
  v120 = 0u;
  v121 = 0u;
  obj = *(id *)(a1 + 32);
  v1 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v120, v124, 16);
  if (v1)
  {
    v3 = 0;
    v119 = 0;
    v118 = *(_QWORD *)v121;
    *(_QWORD *)&v2 = 138412290;
    v112 = v2;
LABEL_4:
    v4 = 0;
    while (1)
    {
      if (*(_QWORD *)v121 != v118)
        objc_enumerationMutation(obj);
      if ((v119 & v3 & 1) != 0)
        goto LABEL_121;
      v5 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * v4);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || objc_msgSend(v5, "conformsToProtocol:", &unk_1EE7337E8))
        break;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || objc_msgSend(v5, "conformsToProtocol:", &unk_1EE728A70))
      {
        if ((v3 & 1) == 0)
        {
          v28 = v5;
          if (objc_msgSend(v28, "navigationInterrupted"))
          {
            v29 = v28;
            v30 = -[MapsSuggestionsEntry initWithType:title:]([MapsSuggestionsEntry alloc], "initWithType:title:", 11, &stru_1E4BDFC28);
            objc_msgSend(v29, "identifier");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "UUIDString");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[MapsSuggestionsEntry setString:forKey:](v30, "setString:forKey:", v32, CFSTR("MapsSuggestionsMapsSyncSourcePK"));

            -[MapsSuggestionsEntry setString:forKey:](v30, "setString:forKey:", CFSTR("MapsSuggestionsMapsSyncSourcePK"), CFSTR("MapsSuggestionsPrimaryKey"));
            objc_msgSend(v29, "routeRequestStorage");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "waypoints");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "lastObject");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "mapItemStorage");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            -[MapsSuggestionsEntry setGeoMapItem:](v30, "setGeoMapItem:", v36);

            -[MapsSuggestionsEntry geoMapItem](v30, "geoMapItem");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v34) = v37 == 0;

            if ((_DWORD)v34)
            {
              GEOFindOrCreateLog();
              v84 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136446978;
                *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
                v126 = 1024;
                v127 = 610;
                v128 = 2082;
                v129 = "-[MapsSuggestionsMapsSync _createEntryFromRecentHistoryRoute:]";
                v130 = 2082;
                v131 = "nil == (entry.geoMapItem)";
                _os_log_impl(&dword_1A427D000, v84, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. MapsSyncDirectionsHistoryItem had no mapItem", buf, 0x26u);
              }
            }
            else
            {
              objc_msgSend(v29, "createTime");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = v38 == 0;

              if (!v39)
              {
                objc_msgSend(v29, "createTime");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                -[MapsSuggestionsEntry setDate:forKey:](v30, "setDate:forKey:", v40, CFSTR("MapsSuggestionsWhenItHappenedKey"));

                GEOConfigGetDouble();
                -[MapsSuggestionsEntry setWeight:](v30, "setWeight:");
                -[MapsSuggestionsMapsSync _addFieldsToSuggestionsEntry:](v30);
                objc_msgSend(v29, "createTime");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                GEOConfigGetDouble();
                objc_msgSend(v41, "dateByAddingTimeInterval:");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                -[MapsSuggestionsEntry setExpires:](v30, "setExpires:", v42);

                -[MapsSuggestionsEntry setBoolean:forKey:](v30, "setBoolean:forKey:", 0, CFSTR("MapsSuggestionsIsResumingAnEVRoute"));
                -[MapsSuggestionsEntry geoMapItem](v30, "geoMapItem");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                GEOConfigGetDouble();
                v45 = v44;
                v46 = v43;
                v47 = v46;
                if (v46)
                {
                  *(_QWORD *)buf = 0;
                  v48 = MapsSuggestionsDistanceFromHereToMapItem(v46, buf);
                  v49 = *(double *)buf < v45 && v48;
                }
                else
                {
                  GEOFindOrCreateLog();
                  v96 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136446978;
                    *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
                    v126 = 1024;
                    v127 = 700;
                    v128 = 2082;
                    v129 = "BOOL _isAlreadyThere(MapsSuggestionsMapItem *__strong, CLLocationDistance)";
                    v130 = 2082;
                    v131 = "nil == (mapItem)";
                    _os_log_impl(&dword_1A427D000, v96, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a mapItem", buf, 0x26u);
                  }

                  v49 = 0;
                }

                -[MapsSuggestionsEntry setBoolean:forKey:](v30, "setBoolean:forKey:", v49, CFSTR("MapsSuggestionsAlreadyThereKey"));
                objc_msgSend(v29, "sharedETAData");
                v97 = (void *)objc_claimAutoreleasedReturnValue();
                -[MapsSuggestionsEntry setData:forKey:](v30, "setData:forKey:", v97, CFSTR("MapsSuggestionsResumeRouteRouteSharedETAData"));

                if (objc_msgSend(v33, "hasTransportType"))
                {
                  v98 = objc_msgSend(v33, "transportType");
                  if ((_DWORD)v98 != 4)
                  {
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v98);
                    v99 = (void *)objc_claimAutoreleasedReturnValue();
                    -[MapsSuggestionsEntry setNumber:forKey:](v30, "setNumber:forKey:", v99, CFSTR("MapsSuggestionsTransportTypeKey"));

                  }
                }
                -[MapsSuggestionsEntry setRouteRequestStorage:forKey:](v30, "setRouteRequestStorage:forKey:", v33, CFSTR("MapsSuggestionsResumeRouteRouteRequestStorage"), v112);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0
                  || objc_msgSend(v29, "conformsToProtocol:", &unk_1EE728AE8))
                {
                  -[MapsSuggestionsMapsSync _updateEntry:withEvInfo:](v30, v29);
                }
                v88 = v30;
LABEL_108:

                if (v88)
                {
                  v73 = v88;
                  -[NSObject expires](v73, "expires");
                  v100 = (void *)objc_claimAutoreleasedReturnValue();
                  v101 = v100 == 0;

                  if (v101)
                  {
                    GEOFindOrCreateLog();
                    v105 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v105, OS_LOG_TYPE_DEBUG))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_1A427D000, v105, OS_LOG_TYPE_DEBUG, "Entry did not have an expiration set. Keeping it", buf, 2u);
                    }

                  }
                  else
                  {
                    -[NSObject expires](v73, "expires");
                    v102 = (void *)objc_claimAutoreleasedReturnValue();
                    v103 = MapsSuggestionsIsInThePast(v102);

                    if (v103)
                    {
                      GEOFindOrCreateLog();
                      v78 = (id)objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
                      {
                        -[NSObject title](v73, "title");
                        v104 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = v112;
                        *(_QWORD *)&buf[4] = v104;
                        _os_log_impl(&dword_1A427D000, v78, OS_LOG_TYPE_INFO, "Dropping expired entry %@", buf, 0xCu);

                      }
                      goto LABEL_58;
                    }
                  }
LABEL_68:

                  -[NSObject addObject:](v116, "addObject:", v73);
                  v3 = 1;
                  goto LABEL_69;
                }
                GEOFindOrCreateLog();
                v73 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  v81 = v73;
                  v82 = "Could not create a ResumeRoute entry from the route data recieved from MapsSync";
LABEL_62:
                  _os_log_impl(&dword_1A427D000, v81, OS_LOG_TYPE_ERROR, v82, buf, 2u);
                }
LABEL_63:
                v80 = 0;
                v3 = 0;
                goto LABEL_64;
              }
              GEOFindOrCreateLog();
              v84 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A427D000, v84, OS_LOG_TYPE_ERROR, "usageDate was nil", buf, 2u);
              }
            }

            v88 = 0;
            goto LABEL_108;
          }
LABEL_29:
          v3 = 0;
          goto LABEL_70;
        }
LABEL_11:
        v3 = 1;
        goto LABEL_71;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if ((v119 & 1) == 0)
          goto LABEL_40;
        v119 = 1;
      }
      else if (!(v119 & 1 | ((objc_msgSend(v5, "conformsToProtocol:", &unk_1EE733848) & 1) == 0)))
      {
LABEL_40:
        v113 = v5;
        v52 = -[MapsSuggestionsEntry initWithType:title:]([MapsSuggestionsEntry alloc], "initWithType:title:", 5, &stru_1E4BDFC28);
        objc_msgSend(v113, "identifier");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "UUIDString");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[MapsSuggestionsEntry setString:forKey:](v52, "setString:forKey:", v54, CFSTR("MapsSuggestionsMapsSyncSourcePK"));

        -[MapsSuggestionsEntry setString:forKey:](v52, "setString:forKey:", CFSTR("MapsSuggestionsMapsSyncSourcePK"), CFSTR("MapsSuggestionsPrimaryKey"));
        objc_msgSend(v113, "mapItemStorage");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        MapsSuggestionsMapItemConvertIfNeeded(v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        -[MapsSuggestionsEntry setGeoMapItem:](v52, "setGeoMapItem:", v56);

        -[MapsSuggestionsEntry geoMapItem](v52, "geoMapItem");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v55) = v57 == 0;

        if ((_DWORD)v55)
        {
          GEOFindOrCreateLog();
          v65 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446978;
            *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
            v126 = 1024;
            v127 = 719;
            v128 = 2082;
            v129 = "-[MapsSuggestionsMapsSync _createEntryFromRecentHistoryPlace:]";
            v130 = 2082;
            v131 = "nil == (entry.geoMapItem)";
            v85 = v65;
            v86 = "At %{public}s:%d, %{public}s forbids: %{public}s. MapsSyncRecentHistoryItem had no mapItem   ";
            v87 = 38;
            goto LABEL_83;
          }
        }
        else
        {
          objc_msgSend(v113, "createTime");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = v58 == 0;

          if (!v59)
          {
            objc_msgSend(v113, "createTime");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            -[MapsSuggestionsEntry setDate:forKey:](v52, "setDate:forKey:", v60, CFSTR("MapsSuggestionsWhenItHappenedKey"));

            GEOConfigGetDouble();
            -[MapsSuggestionsEntry setWeight:](v52, "setWeight:");
            -[MapsSuggestionsMapsSync _addFieldsToSuggestionsEntry:](v52);
            objc_msgSend(v113, "createTime");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            GEOConfigGetDouble();
            objc_msgSend(v61, "dateByAddingTimeInterval:");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            -[MapsSuggestionsEntry setExpires:](v52, "setExpires:", v62);

            GEOConfigGetDouble();
            v64 = v63;
            MapsSuggestionsCurrentBestLocation();
            v65 = objc_claimAutoreleasedReturnValue();
            MapsSuggestionsLocationForEntry(v52);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "distanceFromLocation:", v65);
            -[MapsSuggestionsEntry setBoolean:forKey:](v52, "setBoolean:forKey:", v67 < v64, CFSTR("MapsSuggestionsAlreadyThereKey"));
            v68 = v52;

            goto LABEL_85;
          }
          GEOFindOrCreateLog();
          v65 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            v85 = v65;
            v86 = "usageDate was nil";
            v87 = 2;
LABEL_83:
            _os_log_impl(&dword_1A427D000, v85, OS_LOG_TYPE_ERROR, v86, buf, v87);
          }
        }
        v68 = 0;
LABEL_85:

        if (!v68)
        {
          GEOFindOrCreateLog();
          v73 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A427D000, v73, OS_LOG_TYPE_ERROR, "Could not create a RecentHistory entry from the place data recieved from MapsSync", buf, 2u);
          }
          v80 = 0;
          goto LABEL_64;
        }
        v73 = v68;
        -[NSObject expires](v73, "expires");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v90 = v89 == 0;

        if (v90)
        {
          GEOFindOrCreateLog();
          v95 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v95, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A427D000, v95, OS_LOG_TYPE_DEBUG, "Entry did not have an expiration set. Keeping it", buf, 2u);
          }

        }
        else
        {
          -[NSObject expires](v73, "expires");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          v92 = MapsSuggestionsIsInThePast(v91);

          if (v92)
          {
            GEOFindOrCreateLog();
            v93 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
            {
              -[NSObject title](v73, "title");
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v112;
              *(_QWORD *)&buf[4] = v94;
              _os_log_impl(&dword_1A427D000, v93, OS_LOG_TYPE_INFO, "Dropping expired entry %@", buf, 0xCu);

            }
LABEL_59:
            v80 = v73;
LABEL_64:

            v73 = v80;
LABEL_69:

LABEL_70:
            goto LABEL_71;
          }
        }

        -[NSObject addObject:](v116, "addObject:", v73);
        v119 = 1;
        goto LABEL_69;
      }
LABEL_71:
      if (v1 == ++v4)
      {
        v106 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v120, v124, 16);
        v1 = v106;
        if (v106)
          goto LABEL_4;
        goto LABEL_121;
      }
    }
    if ((v3 & 1) == 0)
    {
      v6 = v5;
      if (!objc_msgSend(v6, "navigationInterrupted"))
        goto LABEL_29;
      v7 = v6;
      v8 = -[MapsSuggestionsEntry initWithType:title:]([MapsSuggestionsEntry alloc], "initWithType:title:", 11, &stru_1E4BDFC28);
      objc_msgSend(v7, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "UUIDString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MapsSuggestionsEntry setString:forKey:](v8, "setString:forKey:", v10, CFSTR("MapsSuggestionsMapsSyncSourcePK"));

      -[MapsSuggestionsEntry setString:forKey:](v8, "setString:forKey:", CFSTR("MapsSuggestionsMapsSyncSourcePK"), CFSTR("MapsSuggestionsPrimaryKey"));
      objc_msgSend(v7, "routeRequestStorage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "waypoints");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "mapItemStorage");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MapsSuggestionsEntry setGeoMapItem:](v8, "setGeoMapItem:", v14);

      -[MapsSuggestionsEntry geoMapItem](v8, "geoMapItem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v12) = v15 == 0;

      if ((_DWORD)v12)
      {
        GEOFindOrCreateLog();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446978;
          *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
          v126 = 1024;
          v127 = 655;
          v128 = 2082;
          v129 = "-[MapsSuggestionsMapsSync _createEntryFromRecentHistoryMultiPointRoute:]";
          v130 = 2082;
          v131 = "nil == (entry.geoMapItem)";
          _os_log_impl(&dword_1A427D000, v50, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. MapsSyncHistoryMultiPointRoute had no mapItem", buf, 0x26u);
        }
      }
      else
      {
        objc_msgSend(v7, "createTime");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16 == 0;

        if (!v17)
        {
          objc_msgSend(v7, "createTime");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[MapsSuggestionsEntry setDate:forKey:](v8, "setDate:forKey:", v18, CFSTR("MapsSuggestionsWhenItHappenedKey"));

          GEOConfigGetDouble();
          -[MapsSuggestionsEntry setWeight:](v8, "setWeight:");
          -[MapsSuggestionsMapsSync _addFieldsToSuggestionsEntry:](v8);
          objc_msgSend(v7, "createTime");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          GEOConfigGetDouble();
          objc_msgSend(v19, "dateByAddingTimeInterval:");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[MapsSuggestionsEntry setExpires:](v8, "setExpires:", v20);

          -[MapsSuggestionsEntry setBoolean:forKey:](v8, "setBoolean:forKey:", 0, CFSTR("MapsSuggestionsIsResumingAnEVRoute"));
          -[MapsSuggestionsEntry geoMapItem](v8, "geoMapItem");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          GEOConfigGetDouble();
          v23 = v22;
          v24 = v21;
          v25 = v24;
          if (v24)
          {
            *(_QWORD *)buf = 0;
            v26 = MapsSuggestionsDistanceFromHereToMapItem(v24, buf);
            v27 = *(double *)buf < v23 && v26;
          }
          else
          {
            GEOFindOrCreateLog();
            v69 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446978;
              *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
              v126 = 1024;
              v127 = 700;
              v128 = 2082;
              v129 = "BOOL _isAlreadyThere(MapsSuggestionsMapItem *__strong, CLLocationDistance)";
              v130 = 2082;
              v131 = "nil == (mapItem)";
              _os_log_impl(&dword_1A427D000, v69, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a mapItem", buf, 0x26u);
            }

            v27 = 0;
          }

          -[MapsSuggestionsEntry setBoolean:forKey:](v8, "setBoolean:forKey:", v27, CFSTR("MapsSuggestionsAlreadyThereKey"));
          if (objc_msgSend(v11, "hasTransportType"))
          {
            v70 = objc_msgSend(v11, "transportType");
            if ((_DWORD)v70 != 4)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v70);
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              -[MapsSuggestionsEntry setNumber:forKey:](v8, "setNumber:forKey:", v71, CFSTR("MapsSuggestionsTransportTypeKey"));

            }
          }
          -[MapsSuggestionsEntry setRouteRequestStorage:forKey:](v8, "setRouteRequestStorage:forKey:", v11, CFSTR("MapsSuggestionsResumeRouteRouteRequestStorage"), v112);
          -[MapsSuggestionsEntry setInteger:forKey:](v8, "setInteger:forKey:", (int)objc_msgSend(v7, "routeProgressWaypointIndex"), CFSTR("MapsSuggestionsResumeRouteWaypointIndex"));
          objc_msgSend(v7, "sharedETAData");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          -[MapsSuggestionsEntry setData:forKey:](v8, "setData:forKey:", v72, CFSTR("MapsSuggestionsResumeRouteRouteSharedETAData"));

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            || objc_msgSend(v7, "conformsToProtocol:", &unk_1EE728AE8))
          {
            -[MapsSuggestionsMapsSync _updateEntry:withEvInfo:](v8, v7);
          }
          v51 = v8;
LABEL_53:

          if (v51)
          {
            v73 = v51;
            -[NSObject expires](v73, "expires");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            v75 = v74 == 0;

            if (v75)
            {
              GEOFindOrCreateLog();
              v83 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A427D000, v83, OS_LOG_TYPE_DEBUG, "Entry did not have an expiration set. Keeping it", buf, 2u);
              }

            }
            else
            {
              -[NSObject expires](v73, "expires");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              v77 = MapsSuggestionsIsInThePast(v76);

              if (v77)
              {
                GEOFindOrCreateLog();
                v78 = (id)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
                {
                  -[NSObject title](v73, "title");
                  v79 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = v112;
                  *(_QWORD *)&buf[4] = v79;
                  _os_log_impl(&dword_1A427D000, v78, OS_LOG_TYPE_INFO, "Dropping expired entry %@", buf, 0xCu);

                }
LABEL_58:

                v3 = 0;
                goto LABEL_59;
              }
            }
            goto LABEL_68;
          }
          GEOFindOrCreateLog();
          v73 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            v81 = v73;
            v82 = "Could not create a ResumeRoute entry from the MPR data recieved from MapsSync";
            goto LABEL_62;
          }
          goto LABEL_63;
        }
        GEOFindOrCreateLog();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A427D000, v50, OS_LOG_TYPE_ERROR, "usageDate was nil", buf, 2u);
        }
      }

      v51 = 0;
      goto LABEL_53;
    }
    goto LABEL_11;
  }
LABEL_121:

  GEOFindOrCreateLog();
  v107 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v107, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromMapsSuggestionsEntries(v116);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v108;
    _os_log_impl(&dword_1A427D000, v107, OS_LOG_TYPE_DEBUG, "Sending %@", buf, 0xCu);

  }
  v109 = *(_QWORD *)(a1 + 40);
  v110 = -[NSObject copy](v116, "copy");
  (*(void (**)(uint64_t, id, _QWORD))(v109 + 16))(v109, v110, 0);

  if ((unint64_t)-[NSObject count](v116, "count") >= 3)
  {
    GEOFindOrCreateLog();
    v111 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
      v126 = 1024;
      v127 = 258;
      v128 = 2082;
      v129 = "-[MapsSuggestionsMapsSync entriesFromHistoryWithHandler:]_block_invoke";
      v130 = 2082;
      v131 = "entriesToAdd.count > 2u";
      _os_log_impl(&dword_1A427D000, v111, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. 1 RecentHistory + 1 ResumeRoute cannot be more than 2 in total", buf, 0x26u);
    }
LABEL_129:

  }
}

- (char)mapItemsForHistoricPlaces:(BOOL)a3 routes:(BOOL)a4 maxAge:(double)a5 handler:(id)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v10;
  NSObject *v11;
  const char *v12;
  const char *v13;
  MapsSuggestionsMapsSyncConnector *connector;
  char v15;
  NSObject *v16;
  _QWORD v18[4];
  NSObject *v19;
  double v20;
  BOOL v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  _BYTE v25[24];
  uint64_t v26;

  v7 = a4;
  v8 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  GEOFindOrCreateLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = "NO";
    if (v8)
      v13 = "YES";
    else
      v13 = "NO";
    *(_DWORD *)buf = 136315650;
    v23 = v13;
    if (v7)
      v12 = "YES";
    v24 = 2080;
    *(_QWORD *)v25 = v12;
    *(_WORD *)&v25[8] = 2048;
    *(double *)&v25[10] = a5;
    _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_DEBUG, "mapItemsForHistoricPlaces:%s routes:%s maxAge:%.1f", buf, 0x20u);
  }

  if (v10)
  {
    connector = self->_connector;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __75__MapsSuggestionsMapsSync_mapItemsForHistoricPlaces_routes_maxAge_handler___block_invoke;
    v18[3] = &unk_1E4BD0300;
    v19 = v10;
    v20 = a5;
    v21 = v8;
    v15 = -[MapsSuggestionsMapsSyncConnector allContentOfType:handler:](connector, "allContentOfType:handler:", 1, v18);
    v16 = v19;
  }
  else
  {
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v23 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
      v24 = 1024;
      *(_DWORD *)v25 = 273;
      *(_WORD *)&v25[4] = 2082;
      *(_QWORD *)&v25[6] = "-[MapsSuggestionsMapsSync mapItemsForHistoricPlaces:routes:maxAge:handler:]";
      *(_WORD *)&v25[14] = 2082;
      *(_QWORD *)&v25[16] = "nil == (handler)";
      _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
    }
    v15 = 0;
  }

  return v15;
}

void __75__MapsSuggestionsMapsSync_mapItemsForHistoricPlaces_routes_maxAge_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  const __CFString *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v25 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "count"))
    {
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v25, "count"));
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v4 = v25;
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (!v5)
        goto LABEL_26;
      v6 = *(_QWORD *)v28;
      while (1)
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v28 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v7);
          objc_msgSend(v8, "createTime", v25);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = MapsSuggestionsSecondsTo(v9);

          if (*(double *)(a1 + 40) >= -v10 && *(_BYTE *)(a1 + 48))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              || objc_msgSend(v8, "conformsToProtocol:", &unk_1EE733848))
            {
              objc_msgSend(v8, "mapItemStorage");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              MapsSuggestionsMapItemConvertIfNeeded(v11);
              v12 = (void *)objc_claimAutoreleasedReturnValue();

              if (v12)
                objc_msgSend(v26, "addObject:", v12);
LABEL_14:

              goto LABEL_15;
            }
            if (*(_BYTE *)(a1 + 48))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0
                || objc_msgSend(v8, "conformsToProtocol:", &unk_1EE728A70))
              {
                objc_msgSend(v8, "routeRequestStorage");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "waypoints");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "lastObject");
                v12 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v12, "geoMapItem");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                v16 = v15;
                if (v15)
                {
                  MapsSuggestionsMapItemConvertIfNeeded(v15);
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v17)
                    objc_msgSend(v26, "addObject:", v17);

                }
                goto LABEL_14;
              }
            }
          }
LABEL_15:
          ++v7;
        }
        while (v5 != v7);
        v18 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        v5 = v18;
        if (!v18)
        {
LABEL_26:

          v19 = *(_QWORD *)(a1 + 32);
          v20 = (void *)objc_msgSend(v26, "copy");
          (*(void (**)(uint64_t, void *, _QWORD))(v19 + 16))(v19, v20, 0);

          v21 = v26;
          goto LABEL_30;
        }
      }
    }
    GEOFindOrCreateLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A427D000, v24, OS_LOG_TYPE_DEBUG, "Received 0 historyItems from Sync", buf, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    GEOFindOrCreateLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v33 = "-[MapsSuggestionsMapsSync mapItemsForHistoricPlaces:routes:maxAge:handler:]_block_invoke";
      v34 = 2112;
      v35 = CFSTR("We didn't expect to get nil from allContentOfType:, but we did!");
      _os_log_impl(&dword_1A427D000, v22, OS_LOG_TYPE_ERROR, "Error in %s: %@", buf, 0x16u);
    }

    v23 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -11, CFSTR("We didn't expect to get nil from allContentOfType:, but we did!"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v23 + 16))(v23, 0, v21);
LABEL_30:

  }
}

- (char)deleteEntry:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  MapsSuggestionsMapsSyncConnector *connector;
  NSObject *v13;
  char v14;
  const char *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  _QWORD v20[4];
  NSObject *v21;
  id v22;
  id v23;
  _BYTE location[12];
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_DWORD *)location = 136446978;
    *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
    v25 = 1024;
    v26 = 331;
    v27 = 2082;
    v28 = "-[MapsSuggestionsMapsSync deleteEntry:handler:]";
    v29 = 2082;
    v30 = "nil == (handler)";
    v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_11:
    _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_ERROR, v15, location, 0x26u);
    goto LABEL_18;
  }
  if (!v6)
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_DWORD *)location = 136446978;
    *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
    v25 = 1024;
    v26 = 332;
    v27 = 2082;
    v28 = "-[MapsSuggestionsMapsSync deleteEntry:handler:]";
    v29 = 2082;
    v30 = "nil == (entry)";
    v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a suggestions entry";
    goto LABEL_11;
  }
  v8 = objc_msgSend(v6, "type");
  if (v8 == 5 || v8 == 11)
  {
    v9 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v6, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithUUIDString:", v10);

    if (v11)
    {
      objc_initWeak((id *)location, self);
      connector = self->_connector;
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __47__MapsSuggestionsMapsSync_deleteEntry_handler___block_invoke;
      v20[3] = &unk_1E4BD0328;
      objc_copyWeak(&v23, (id *)location);
      v13 = v11;
      v21 = v13;
      v22 = v7;
      v14 = -[MapsSuggestionsMapsSyncConnector allContentOfType:handler:](connector, "allContentOfType:handler:", 1, v20);

      objc_destroyWeak(&v23);
      objc_destroyWeak((id *)location);
LABEL_19:

      goto LABEL_20;
    }
    GEOFindOrCreateLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
      v25 = 1024;
      v26 = 348;
      v27 = 2082;
      v28 = "-[MapsSuggestionsMapsSync deleteEntry:handler:]";
      v29 = 2082;
      v30 = "nil == (uuid)";
      _os_log_impl(&dword_1A427D000, v18, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Invalid entry without a UUID?!", location, 0x26u);
    }

    v13 = 0;
LABEL_18:
    v14 = 0;
    goto LABEL_19;
  }
  GEOFindOrCreateLog();
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromMapsSuggestionsEntryType(objc_msgSend(v6, "type"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)location = 138412290;
    *(_QWORD *)&location[4] = v17;
    _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_DEBUG, "Cannot remove entries of type %@", location, 0xCu);

  }
  (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  v14 = 1;
LABEL_20:

  return v14;
}

void __47__MapsSuggestionsMapsSync_deleteEntry_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  void *v20;
  uint8_t v21[128];
  uint8_t buf[4];
  char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = v3;
    v6 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v9, "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqual:", *(_QWORD *)(a1 + 32));

          if (v11)
          {
            v15 = (void *)WeakRetained[3];
            v20 = v9;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
            v14 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "deleteObjects:completion:", v14, *(_QWORD *)(a1 + 40));
            goto LABEL_15;
          }
        }
        v6 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        if (v6)
          continue;
        break;
      }
    }

    v12 = *(_QWORD *)(a1 + 40);
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Can't find anything in MapsSync with UUID=%@"), *(_QWORD *)(a1 + 32));
    objc_msgSend(v13, "GEOErrorWithCode:reason:", -13, v5);
    v14 = objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, NSObject *))(v12 + 16))(v12, v14);
  }
  else
  {
    GEOFindOrCreateLog();
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v23 = "MapsSuggestionsMapsSync.mm";
      v24 = 1026;
      v25 = 352;
      v26 = 2082;
      v27 = "-[MapsSuggestionsMapsSync deleteEntry:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
    v5 = v14;
  }
LABEL_15:

}

- (char)canProduceRatingRequestForMapItem:(id)a3 maxAge:(double)a4 handler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  char *v11;
  uint64_t v12;
  MapsSuggestionsMapsSyncConnector *connector;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  id *v18;
  id *v19;
  NSObject *innerQueue;
  _QWORD *v21;
  const char *v22;
  char v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  double v27;
  _QWORD v29[4];
  id v30;
  NSObject *v31;
  _QWORD v32[4];
  _QWORD block[4];
  id v34;
  NSObject *v35;
  id v36;
  uint64_t v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[2];
  _QWORD v41[4];
  id v42;
  _QWORD v43[2];
  _QWORD v44[4];
  id v45;
  _QWORD v46[2];
  void *v47;
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  _BYTE v51[14];
  __int16 v52;
  const char *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  GEOFindOrCreateLog();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v8, "name");
    v11 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v49 = v11;
    v50 = 2048;
    *(double *)v51 = a4;
    _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_DEBUG, "Checking canProduceRatingRequestForMapItem:'%@' maxAge:%.1f", buf, 0x16u);

  }
  if (v9)
  {
    if (v8)
    {
      v12 = objc_msgSend(v8, "_muid");
      connector = self->_connector;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MapsSuggestionsMapsSyncConnector MapsSyncReviewedPlace_fetchWithMuids:](connector, "MapsSyncReviewedPlace_fetchWithMuids:", v15);
      v16 = objc_claimAutoreleasedReturnValue();

      GEOFindOrCreateLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v49 = (const char *)v16;
        _os_log_impl(&dword_1A427D000, v17, OS_LOG_TYPE_DEBUG, "MapsSyncReviewedPlace: %@", buf, 0xCu);
      }

      if (v16)
      {
        if (-[NSObject hasUserReviewed](v16, "hasUserReviewed"))
        {
          v41[0] = MEMORY[0x1E0C809B0];
          v41[1] = 3221225472;
          v41[2] = __76__MapsSuggestionsMapsSync_canProduceRatingRequestForMapItem_maxAge_handler___block_invoke_226;
          v41[3] = &unk_1E4BD0350;
          v18 = &v42;
          v42 = v8;
          v43[1] = v12;
          v19 = (id *)v43;
          v43[0] = v9;
          innerQueue = self->_queue._innerQueue;
          v21 = v41;
        }
        else
        {
          -[NSObject lastSuggestedReviewDate](v16, "lastSuggestedReviewDate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v24 == 0;

          if (!v25)
          {
            -[NSObject lastSuggestedReviewDate](v16, "lastSuggestedReviewDate");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = MapsSuggestionsSecondsSince(v26);

            if (v27 >= a4)
            {
              v29[0] = MEMORY[0x1E0C809B0];
              v29[1] = 3221225472;
              v29[2] = __76__MapsSuggestionsMapsSync_canProduceRatingRequestForMapItem_maxAge_handler___block_invoke_229;
              v29[3] = &unk_1E4BD0378;
              v30 = v8;
              v32[1] = v12;
              *(double *)&v32[2] = a4;
              *(double *)&v32[3] = v27;
              v32[0] = v9;
              v31 = v16;
              dispatch_async((dispatch_queue_t)self->_queue._innerQueue, v29);

              v18 = &v30;
              v19 = (id *)v32;
            }
            else
            {
              block[0] = MEMORY[0x1E0C809B0];
              block[1] = 3221225472;
              block[2] = __76__MapsSuggestionsMapsSync_canProduceRatingRequestForMapItem_maxAge_handler___block_invoke_228;
              block[3] = &unk_1E4BD03A0;
              v34 = v8;
              v37 = v12;
              v35 = v16;
              v36 = v9;
              dispatch_async((dispatch_queue_t)self->_queue._innerQueue, block);

              v18 = &v34;
              v19 = (id *)&v35;
            }
            goto LABEL_22;
          }
          v38[0] = MEMORY[0x1E0C809B0];
          v38[1] = 3221225472;
          v38[2] = __76__MapsSuggestionsMapsSync_canProduceRatingRequestForMapItem_maxAge_handler___block_invoke_227;
          v38[3] = &unk_1E4BD0350;
          v18 = &v39;
          v39 = v8;
          v40[1] = v12;
          v19 = (id *)v40;
          v40[0] = v9;
          innerQueue = self->_queue._innerQueue;
          v21 = v38;
        }
      }
      else
      {
        v44[0] = MEMORY[0x1E0C809B0];
        v44[1] = 3221225472;
        v44[2] = __76__MapsSuggestionsMapsSync_canProduceRatingRequestForMapItem_maxAge_handler___block_invoke;
        v44[3] = &unk_1E4BD0350;
        v18 = &v45;
        v45 = v8;
        v46[1] = v12;
        v19 = (id *)v46;
        v46[0] = v9;
        innerQueue = self->_queue._innerQueue;
        v21 = v44;
      }
      dispatch_async(innerQueue, v21);
LABEL_22:

      v23 = 1;
      goto LABEL_23;
    }
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v49 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
      v50 = 1024;
      *(_DWORD *)v51 = 373;
      *(_WORD *)&v51[4] = 2082;
      *(_QWORD *)&v51[6] = "-[MapsSuggestionsMapsSync canProduceRatingRequestForMapItem:maxAge:handler:]";
      v52 = 2082;
      v53 = "nil == (mapItem)";
      v22 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a mapItem";
      goto LABEL_14;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v49 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
      v50 = 1024;
      *(_DWORD *)v51 = 372;
      *(_WORD *)&v51[4] = 2082;
      *(_QWORD *)&v51[6] = "-[MapsSuggestionsMapsSync canProduceRatingRequestForMapItem:maxAge:handler:]";
      v52 = 2082;
      v53 = "nil == (handler)";
      v22 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_14:
      _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_ERROR, v22, buf, 0x26u);
    }
  }
  v23 = 0;
LABEL_23:

  return v23;
}

uint64_t __76__MapsSuggestionsMapsSync_canProduceRatingRequestForMapItem_maxAge_handler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 48);
    v6 = 138412546;
    v7 = v3;
    v8 = 2048;
    v9 = v4;
    _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_DEBUG, "No prior Rating record for %@ (%llu). Can show Suggestion.", (uint8_t *)&v6, 0x16u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __76__MapsSuggestionsMapsSync_canProduceRatingRequestForMapItem_maxAge_handler___block_invoke_226(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 48);
    v6 = 138412546;
    v7 = v3;
    v8 = 2048;
    v9 = v4;
    _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_DEBUG, "Already have Rating for %@ (%llu). Will not show Suggestion", (uint8_t *)&v6, 0x16u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __76__MapsSuggestionsMapsSync_canProduceRatingRequestForMapItem_maxAge_handler___block_invoke_227(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 48);
    v6 = 138412546;
    v7 = v3;
    v8 = 2048;
    v9 = v4;
    _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_DEBUG, "User reviewed without explicit suggestion %@ (%llu). Can show Suggestion.", (uint8_t *)&v6, 0x16u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __76__MapsSuggestionsMapsSync_canProduceRatingRequestForMapItem_maxAge_handler___block_invoke_228(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 40), "lastSuggestedReviewDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v3;
    v10 = 2048;
    v11 = v4;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_DEBUG, "Already asked for Rating %@ (%llu) on %@. Can show Suggestion.", (uint8_t *)&v8, 0x20u);

  }
  v6 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "lastSuggestedReviewDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *))(v6 + 16))(v6, 1, v7);

}

void __76__MapsSuggestionsMapsSync_canProduceRatingRequestForMapItem_maxAge_handler___block_invoke_229(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 56);
    v5 = *(double *)(a1 + 64) - *(double *)(a1 + 72);
    v8 = 138412802;
    v9 = v3;
    v10 = 2048;
    v11 = v4;
    v12 = 2048;
    v13 = v5;
    _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_DEBUG, "Time limit for this Rating %@ (%llu) is over. It has %.3f sec left. Will not show Suggestion.", (uint8_t *)&v8, 0x20u);

  }
  v6 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "lastSuggestedReviewDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);

}

- (char)didProduceRatingRequestForMapItem:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  char *v9;
  uint64_t v10;
  MapsSuggestionsMapsSyncConnector *connector;
  void *v12;
  void *v13;
  void *v14;
  NSObject *innerQueue;
  NSObject *v16;
  const char *v17;
  char v18;
  MapsSuggestionsMapsSyncConnector *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  char *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[4];
  id v29;
  NSObject *v30;
  id v31;
  uint64_t v32;
  _QWORD block[4];
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  _BYTE v43[24];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  GEOFindOrCreateLog();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "name");
    v9 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v41 = v9;
    _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "didProduceRatingRequestForMapItem:'%@'", buf, 0xCu);

  }
  if (!v7)
  {
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    *(_DWORD *)buf = 136446978;
    v41 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
    v42 = 1024;
    *(_DWORD *)v43 = 429;
    *(_WORD *)&v43[4] = 2082;
    *(_QWORD *)&v43[6] = "-[MapsSuggestionsMapsSync didProduceRatingRequestForMapItem:handler:]";
    *(_WORD *)&v43[14] = 2082;
    *(_QWORD *)&v43[16] = "nil == (handler)";
    v17 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_11:
    _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_ERROR, v17, buf, 0x26u);
    goto LABEL_12;
  }
  if (!v6)
  {
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    *(_DWORD *)buf = 136446978;
    v41 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
    v42 = 1024;
    *(_DWORD *)v43 = 430;
    *(_WORD *)&v43[4] = 2082;
    *(_QWORD *)&v43[6] = "-[MapsSuggestionsMapsSync didProduceRatingRequestForMapItem:handler:]";
    *(_WORD *)&v43[14] = 2082;
    *(_QWORD *)&v43[16] = "nil == (mapItem)";
    v17 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a mapItem";
    goto LABEL_11;
  }
  v10 = objc_msgSend(v6, "_muid");
  connector = self->_connector;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MapsSuggestionsMapsSyncConnector MapsSyncReviewedPlace_fetchWithMuids:](connector, "MapsSyncReviewedPlace_fetchWithMuids:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__MapsSuggestionsMapsSync_didProduceRatingRequestForMapItem_handler___block_invoke;
    block[3] = &unk_1E4BD03A0;
    v34 = v6;
    v37 = v10;
    v35 = v14;
    v36 = v7;
    innerQueue = self->_queue._innerQueue;
    v16 = v14;
    dispatch_async(innerQueue, block);

LABEL_17:
    v18 = 1;
    goto LABEL_18;
  }
  v19 = self->_connector;
  MapsSuggestionsNow();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MapsSuggestionsMapsSyncConnector saveNewReviewedPlaceWithMuid:lastSuggestedReviewDate:](v19, "saveNewReviewedPlaceWithMuid:lastSuggestedReviewDate:", v10, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  GEOFindOrCreateLog();
  v22 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "name");
    v23 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "lastSuggestedReviewDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v41 = v23;
    v42 = 2048;
    *(_QWORD *)v43 = v10;
    *(_WORD *)&v43[8] = 2112;
    *(_QWORD *)&v43[10] = v24;
    _os_log_impl(&dword_1A427D000, v22, OS_LOG_TYPE_DEBUG, "Creating a new reviewedPlace for %@ (%llu) with lastSuggestedReviewDate of %@", buf, 0x20u);

  }
  if (v21)
  {
    objc_msgSend(MEMORY[0x1E0D473D8], "sharedStore");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __69__MapsSuggestionsMapsSync_didProduceRatingRequestForMapItem_handler___block_invoke_232;
    v28[3] = &unk_1E4BD03C8;
    v31 = v7;
    v29 = v6;
    v32 = v10;
    v16 = v21;
    v30 = v16;
    objc_msgSend(v25, "saveWithObjects:completionHandler:", v26, v28);

    goto LABEL_17;
  }
  GEOFindOrCreateLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    v41 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
    v42 = 1024;
    *(_DWORD *)v43 = 448;
    *(_WORD *)&v43[4] = 2082;
    *(_QWORD *)&v43[6] = "-[MapsSuggestionsMapsSync didProduceRatingRequestForMapItem:handler:]";
    *(_WORD *)&v43[14] = 2082;
    *(_QWORD *)&v43[16] = "nil == (reviewedPlace)";
    v17 = "At %{public}s:%d, %{public}s forbids: %{public}s. We have no MapsSyncReviewedPlace and couldn't make one either";
    goto LABEL_11;
  }
LABEL_12:
  v18 = 0;
LABEL_18:

  return v18;
}

void __69__MapsSuggestionsMapsSync_didProduceRatingRequestForMapItem_handler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 56);
    v7 = 138412546;
    v8 = v3;
    v9 = 2048;
    v10 = v4;
    _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_DEBUG, "Not creating a new reviewedPlace. Already suggested this Rating before for %@ (%llu)", (uint8_t *)&v7, 0x16u);

  }
  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "lastSuggestedReviewDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v5 + 16))(v5, v6, 0);

  }
}

void __69__MapsSuggestionsMapsSync_didProduceRatingRequestForMapItem_handler___block_invoke_232(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Error during commit of Rating: %@"), v3);
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v4;
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    v6 = *(_QWORD *)(a1 + 48);
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", 17, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);

    }
    goto LABEL_10;
  }
  GEOFindOrCreateLog();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138412546;
    v13 = v9;
    v14 = 2048;
    v15 = v10;
    _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "Added record for Rating %@ (%llu)", buf, 0x16u);

  }
  v11 = *(_QWORD *)(a1 + 48);
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 40), "lastSuggestedReviewDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v11 + 16))(v11, v4, 0);
LABEL_10:

  }
}

- (void)addMapsSyncObserver:(id)a3 forContentType:(int64_t)a4
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v7 = 32;
    switch(a4)
    {
      case 0:
        GEOFindOrCreateLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          goto LABEL_13;
        v10 = 136446978;
        v11 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
        v12 = 1024;
        v13 = 471;
        v14 = 2082;
        v15 = "-[MapsSuggestionsMapsSync addMapsSyncObserver:forContentType:]";
        v16 = 2082;
        v17 = "YES";
        v9 = "At %{public}s:%d, %{public}s forbids: %{public}s. MapsSuggestionsMapsSyncTypeUnknown does not make sense";
        goto LABEL_12;
      case 1:
        break;
      case 2:
        v7 = 40;
        break;
      case 3:
        v7 = 48;
        break;
      default:
        GEOFindOrCreateLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          goto LABEL_13;
        v10 = 136446978;
        v11 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
        v12 = 1024;
        v13 = 487;
        v14 = 2082;
        v15 = "-[MapsSuggestionsMapsSync addMapsSyncObserver:forContentType:]";
        v16 = 2082;
        v17 = "YES";
        v9 = "At %{public}s:%d, %{public}s forbids: %{public}s. Detected an unsupported MapsSuggestionsMapsSyncConnectorType!";
        goto LABEL_12;
    }
    objc_msgSend(*(id *)((char *)&self->super.isa + v7), "registerObserver:handler:", v6, 0);
  }
  else
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 136446978;
      v11 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
      v12 = 1024;
      v13 = 467;
      v14 = 2082;
      v15 = "-[MapsSuggestionsMapsSync addMapsSyncObserver:forContentType:]";
      v16 = 2082;
      v17 = "nil == (observer)";
      v9 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an observer";
LABEL_12:
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v10, 0x26u);
    }
LABEL_13:

  }
}

- (void)removeMapsSyncObserver:(id)a3 forContentType:(int64_t)a4
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v7 = 32;
    switch(a4)
    {
      case 0:
        GEOFindOrCreateLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          goto LABEL_13;
        v10 = 136446978;
        v11 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
        v12 = 1024;
        v13 = 497;
        v14 = 2082;
        v15 = "-[MapsSuggestionsMapsSync removeMapsSyncObserver:forContentType:]";
        v16 = 2082;
        v17 = "YES";
        v9 = "At %{public}s:%d, %{public}s forbids: %{public}s. MapsSuggestionsMapsSyncTypeUnknown does not make sense";
        goto LABEL_12;
      case 1:
        break;
      case 2:
        v7 = 40;
        break;
      case 3:
        v7 = 48;
        break;
      default:
        GEOFindOrCreateLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          goto LABEL_13;
        v10 = 136446978;
        v11 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
        v12 = 1024;
        v13 = 513;
        v14 = 2082;
        v15 = "-[MapsSuggestionsMapsSync removeMapsSyncObserver:forContentType:]";
        v16 = 2082;
        v17 = "YES";
        v9 = "At %{public}s:%d, %{public}s forbids: %{public}s. Detected an unsupported MapsSuggestionsMapsSyncConnectorType!";
        goto LABEL_12;
    }
    objc_msgSend(*(id *)((char *)&self->super.isa + v7), "unregisterObserver:handler:", v6, 0);
  }
  else
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 136446978;
      v11 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
      v12 = 1024;
      v13 = 493;
      v14 = 2082;
      v15 = "-[MapsSuggestionsMapsSync removeMapsSyncObserver:forContentType:]";
      v16 = 2082;
      v17 = "nil == (observer)";
      v9 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an observer";
LABEL_12:
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v10, 0x26u);
    }
LABEL_13:

  }
}

- (void)removeMapsSyncObserverForAllContentTypes:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[MapsSuggestionsMapsSync removeMapsSyncObserver:forContentType:](self, "removeMapsSyncObserver:forContentType:", v4, 1);
    -[MapsSuggestionsMapsSync removeMapsSyncObserver:forContentType:](self, "removeMapsSyncObserver:forContentType:", v4, 2);
    -[MapsSuggestionsMapsSync removeMapsSyncObserver:forContentType:](self, "removeMapsSyncObserver:forContentType:", v4, 3);
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446978;
      v7 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
      v8 = 1024;
      v9 = 518;
      v10 = 2082;
      v11 = "-[MapsSuggestionsMapsSync removeMapsSyncObserverForAllContentTypes:]";
      v12 = 2082;
      v13 = "nil == (observer)";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an observer", (uint8_t *)&v6, 0x26u);
    }

  }
}

- (char)shortcutsFromFavoritesWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  OS_dispatch_queue *v6;
  MapsSuggestionsMapsSyncConnector *connector;
  NSObject *v8;
  char v9;
  _QWORD v11[4];
  OS_dispatch_queue *v12;
  id v13;
  uint8_t buf[4];
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
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "entriesFromFavoritesWithHandler", buf, 2u);
  }

  if (v4)
  {
    v6 = objc_retainAutorelease(self->_queue._innerQueue);
    connector = self->_connector;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __61__MapsSuggestionsMapsSync_shortcutsFromFavoritesWithHandler___block_invoke;
    v11[3] = &unk_1E4BD03F0;
    v12 = v6;
    v13 = v4;
    v8 = v6;
    v9 = -[MapsSuggestionsMapsSyncConnector allContentOfType:handler:](connector, "allContentOfType:handler:", 3, v11);

  }
  else
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
      v16 = 1024;
      v17 = 529;
      v18 = 2082;
      v19 = "-[MapsSuggestionsMapsSync shortcutsFromFavoritesWithHandler:]";
      v20 = 2082;
      v21 = "nil == (handler)";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
    }
    v9 = 0;
  }

  return v9;
}

void __61__MapsSuggestionsMapsSync_shortcutsFromFavoritesWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  uint8_t buf[4];
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  GEOFindOrCreateLog();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    v14 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "Received %u Favorite items from MapsSync", buf, 8u);
  }

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__MapsSuggestionsMapsSync_shortcutsFromFavoritesWithHandler___block_invoke_237;
  block[3] = &unk_1E4BCE478;
  v10 = v3;
  v11 = v5;
  v6 = *(NSObject **)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  v7 = v5;
  v8 = v3;
  dispatch_async(v6, block);

}

void __61__MapsSuggestionsMapsSync_shortcutsFromFavoritesWithHandler___block_invoke_237(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v13;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v13 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v5);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          || (objc_msgSend(v6, "conformsToProtocol:", &unk_1EE7338A8, (_QWORD)v12) & 1) != 0)
        {
          v7 = v6;
          if ((objc_msgSend(v7, "hidden") & 1) == 0)
          {
            v8 = *(void **)(a1 + 40);
            MapsSuggestionsShortcutFromMSFavoriteItem(v7);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v9);

          }
        }
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v3);
  }

  v10 = *(_QWORD *)(a1 + 48);
  v11 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  (*(void (**)(uint64_t, void *, _QWORD))(v10 + 16))(v10, v11, 0);

}

- (void)mapsSyncDidChangeForType:(int64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10[2];
  _BYTE location[12];
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = 32;
  switch(a3)
  {
    case 0:
      GEOFindOrCreateLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)location = 136446978;
        *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
        v12 = 1024;
        v13 = 562;
        v14 = 2082;
        v15 = "-[MapsSuggestionsMapsSync mapsSyncDidChangeForType:]";
        v16 = 2082;
        v17 = "YES";
        v7 = "At %{public}s:%d, %{public}s forbids: %{public}s. MapsSuggestionsMapsSyncTypeUnknown does not make sense";
        goto LABEL_10;
      }
      break;
    case 1:
      goto LABEL_6;
    case 2:
      v5 = 40;
      goto LABEL_6;
    case 3:
      v5 = 48;
LABEL_6:
      v8 = *(id *)((char *)&self->super.isa + v5);
      if (!v8)
        goto LABEL_8;
      v6 = v8;
      objc_initWeak((id *)location, self);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __52__MapsSuggestionsMapsSync_mapsSyncDidChangeForType___block_invoke;
      v9[3] = &unk_1E4BD0418;
      objc_copyWeak(v10, (id *)location);
      v10[1] = (id)a3;
      -[NSObject callBlock:](v6, "callBlock:", v9);
      objc_destroyWeak(v10);
      objc_destroyWeak((id *)location);
      break;
    default:
LABEL_8:
      GEOFindOrCreateLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)location = 136446978;
        *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
        v12 = 1024;
        v13 = 578;
        v14 = 2082;
        v15 = "-[MapsSuggestionsMapsSync mapsSyncDidChangeForType:]";
        v16 = 2082;
        v17 = "nil == (observers)";
        v7 = "At %{public}s:%d, %{public}s forbids: %{public}s. Detected an unsupported MapsSuggestionsMapsSyncConnectorType!";
LABEL_10:
        _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, v7, location, 0x26u);
      }
      break;
  }

}

void __52__MapsSuggestionsMapsSync_mapsSyncDidChangeForType___block_invoke(uint64_t a1, void *a2)
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
    objc_msgSend(v3, "mapsSync:didChangeForContentType:", WeakRetained, *(_QWORD *)(a1 + 40));
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446722;
      v7 = "MapsSuggestionsMapsSync.mm";
      v8 = 1026;
      v9 = 582;
      v10 = 2082;
      v11 = "-[MapsSuggestionsMapsSync mapsSyncDidChangeForType:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }

  }
}

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "description");
}

- (void)_addFieldsToSuggestionsEntry:(void *)a1
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  NSObject *v11;
  const char *v12;
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
  v1 = a1;
  v2 = v1;
  if (!v1)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = 136446978;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
      v15 = 1024;
      v16 = 766;
      v17 = 2082;
      v18 = "-[MapsSuggestionsMapsSync _addFieldsToSuggestionsEntry:]";
      v19 = 2082;
      v20 = "nil == (entry)";
      v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires suggestion entry";
LABEL_8:
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v13, 0x26u);
    }
LABEL_9:

    goto LABEL_10;
  }
  objc_msgSend(v1, "geoMapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = 136446978;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
      v15 = 1024;
      v16 = 767;
      v17 = 2082;
      v18 = "-[MapsSuggestionsMapsSync _addFieldsToSuggestionsEntry:]";
      v19 = 2082;
      v20 = "nil == (entry.geoMapItem)";
      v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a mapItem to be set in advance";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v2, "geoMapItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "centerCoordinate");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNumber:forKey:", v6, CFSTR("MapsSuggestionsLatitudeKey"));

  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v2, "geoMapItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "centerCoordinate");
  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNumber:forKey:", v10, CFSTR("MapsSuggestionsLongitudeKey"));

  objc_msgSend(v2, "setNumber:forKey:", &unk_1E4C09878, CFSTR("MapsSuggestionsGEOMapItemOriginKey"));
LABEL_10:

}

- (void)_updateEntry:(void *)a1 withEvInfo:(void *)a2
{
  id v3;
  double v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a1;
  v3 = a2;
  objc_msgSend(v3, "requiredBatteryCharge");
  if (v4 > 0.0)
  {
    objc_msgSend(v3, "vehicleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "vehicleIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "length");

      if (v7)
      {
        objc_msgSend(v11, "setBoolean:forKey:", 1, CFSTR("MapsSuggestionsIsResumingAnEVRoute"));
        objc_msgSend(v3, "vehicleIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setString:forKey:", v8, CFSTR("MapsSuggestionsVehicleIdentifierKey"));

        v9 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v3, "requiredBatteryCharge");
        objc_msgSend(v9, "numberWithDouble:");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setNumber:forKey:", v10, CFSTR("MapsSuggestionsRequiredChargeForEVKey"));

      }
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_favoriteItemObservers, 0);
  objc_storeStrong((id *)&self->_transitItemObservers, 0);
  objc_storeStrong((id *)&self->_historyObservers, 0);
  objc_storeStrong((id *)&self->_connector, 0);

}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
