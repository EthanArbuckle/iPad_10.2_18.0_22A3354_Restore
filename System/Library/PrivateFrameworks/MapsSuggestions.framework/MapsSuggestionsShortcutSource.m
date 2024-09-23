@implementation MapsSuggestionsShortcutSource

- (MapsSuggestionsShortcutSource)initWithShortcutManager:(id)a3 delegate:(id)a4 name:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  MapsSuggestionsShortcutSource *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *queue;
  MapsSuggestionsCanKicker *v17;
  double v18;
  double v19;
  OS_dispatch_queue *v20;
  uint64_t v21;
  MapsSuggestionsCanKicker *updateForcer;
  MapsSuggestionsShortcutSource *v23;
  NSObject *v24;
  _QWORD v26[4];
  id v27;
  objc_super v28;
  _BYTE location[12];
  __int16 v30;
  int v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (!v10)
  {
    GEOFindOrCreateLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutSource.m";
      v30 = 1024;
      v31 = 35;
      v32 = 2082;
      v33 = "-[MapsSuggestionsShortcutSource initWithShortcutManager:delegate:name:]";
      v34 = 2082;
      v35 = "nil == (delegate)";
      _os_log_impl(&dword_1A427D000, v24, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a source delegate", location, 0x26u);
    }
    goto LABEL_11;
  }
  if (!v11)
  {
    GEOFindOrCreateLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutSource.m";
      v30 = 1024;
      v31 = 36;
      v32 = 2082;
      v33 = "-[MapsSuggestionsShortcutSource initWithShortcutManager:delegate:name:]";
      v34 = 2082;
      v35 = "nil == (name)";
      _os_log_impl(&dword_1A427D000, v24, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a name", location, 0x26u);
    }
LABEL_11:

    v23 = 0;
    goto LABEL_12;
  }
  v28.receiver = self;
  v28.super_class = (Class)MapsSuggestionsShortcutSource;
  v13 = -[MapsSuggestionsBaseSource initWithDelegate:name:](&v28, sel_initWithDelegate_name_, v10, v11);
  if (v13)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("MapsSuggestionsShortcutSourceQueue", v14);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v15;

    objc_storeStrong((id *)&v13->_shortcutManager, a3);
    objc_initWeak((id *)location, v13);
    v17 = [MapsSuggestionsCanKicker alloc];
    GEOConfigGetDouble();
    v19 = v18;
    v20 = v13->_queue;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __71__MapsSuggestionsShortcutSource_initWithShortcutManager_delegate_name___block_invoke;
    v26[3] = &unk_1E4BCDFF8;
    objc_copyWeak(&v27, (id *)location);
    v21 = -[MapsSuggestionsCanKicker initWithName:time:queue:block:](v17, "initWithName:time:queue:block:", CFSTR("MapsSuggestionsShortcutSourceCanKicker"), v20, v26, v19);
    updateForcer = v13->_updateForcer;
    v13->_updateForcer = (MapsSuggestionsCanKicker *)v21;

    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)location);
  }
  self = v13;
  v23 = self;
LABEL_12:

  return v23;
}

void __71__MapsSuggestionsShortcutSource_initWithShortcutManager_delegate_name___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  NSObject *v5;
  int v6;
  char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_DEBUG, "Reloading because of timeout", (uint8_t *)&v6, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsShortcutSource _updateSuggestionEntriesWithHandler:]((uint64_t)WeakRetained, 0);
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446722;
      v7 = "MapsSuggestionsShortcutSource.m";
      v8 = 1026;
      v9 = 52;
      v10 = 2082;
      v11 = "-[MapsSuggestionsShortcutSource initWithShortcutManager:delegate:name:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }

  }
}

- (void)_updateSuggestionEntriesWithHandler:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  GEOFindOrCreateLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[MapsSuggestionsShortcutSource _updateSuggestionEntriesWithHandler:]";
    _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  objc_initWeak((id *)buf, (id)a1);
  v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__MapsSuggestionsShortcutSource__updateSuggestionEntriesWithHandler___block_invoke;
  v7[3] = &unk_1E4BD1098;
  objc_copyWeak(&v9, (id *)buf);
  v6 = v3;
  v8 = v6;
  objc_msgSend(v5, "readMeCardWithHandler:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);

}

- (id)initFromResourceDepot:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MapsSuggestionsShortcutSource *v12;
  NSObject *v13;
  const char *v14;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v16 = 136446978;
    v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutSource.m";
    v18 = 1024;
    v19 = 62;
    v20 = 2082;
    v21 = "-[MapsSuggestionsShortcutSource initFromResourceDepot:name:]";
    v22 = 2082;
    v23 = "nil == (resourceDepot)";
    v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to buid!";
LABEL_11:
    _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v16, 0x26u);
    goto LABEL_12;
  }
  objc_msgSend(v6, "oneFavorites");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v16 = 136446978;
    v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutSource.m";
    v18 = 1024;
    v19 = 63;
    v20 = 2082;
    v21 = "-[MapsSuggestionsShortcutSource initFromResourceDepot:name:]";
    v22 = 2082;
    v23 = "nil == (resourceDepot.oneFavorites)";
    v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one Favorites!";
    goto LABEL_11;
  }
  objc_msgSend(v6, "oneSourceDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v16 = 136446978;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutSource.m";
      v18 = 1024;
      v19 = 64;
      v20 = 2082;
      v21 = "-[MapsSuggestionsShortcutSource initFromResourceDepot:name:]";
      v22 = 2082;
      v23 = "nil == (resourceDepot.oneSourceDelegate)";
      v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one SourceDelegate!";
      goto LABEL_11;
    }
LABEL_12:

    v12 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v6, "oneFavorites");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "oneSourceDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[MapsSuggestionsShortcutSource initWithShortcutManager:delegate:name:](self, "initWithShortcutManager:delegate:name:", v10, v11, v7);

  v12 = self;
LABEL_13:

  return v12;
}

- (void)_renameDuplicateMeCardTypes:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  BOOL v21;
  void *v22;
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
  v3 = a3;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v3);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "type");
        if (v11 == 2)
          ++v7;
        if (v11 == 3)
          ++v8;
        if (v11 == 5)
          ++v6;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
    v7 = 0;
    v8 = 0;
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v12 = v3;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
        objc_msgSend(v17, "customName", (_QWORD)v24);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18)
        {
          objc_msgSend(v17, "geoMapItem");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            v20 = objc_msgSend(v17, "type") == 2 && v7 > 1;
            if (v20
              || (objc_msgSend(v17, "type") == 3 ? (v21 = v8 > 1) : (v21 = 0),
                  v21 || objc_msgSend(v17, "type") == 5 && v6 >= 2))
            {
              objc_msgSend(v17, "geoMapItem");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              MapsSuggestionsMapItemStreetName(v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "setCustomName:", v23);

            }
          }
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v14);
  }

}

- (void)_treatShortcuts:(void *)a3 error:(void *)a4 handler:
{
  id v7;
  id v8;
  void (**v9)(_QWORD);
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  _DWORD v21[7];

  *(_QWORD *)&v21[5] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  GEOFindOrCreateLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)v21 = "-[MapsSuggestionsShortcutSource _treatShortcuts:error:handler:]";
    _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  v11 = objc_msgSend(*(id *)(a1 + 40), "kickCanBySameTime");
  if (!v7 || v8)
  {
    GEOFindOrCreateLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v21 = v8;
      _os_log_impl(&dword_1A427D000, v17, OS_LOG_TYPE_ERROR, "Error getting Shortcuts: %@", buf, 0xCu);
    }

    objc_msgSend((id)a1, "addOrUpdateMySuggestionEntries:", MEMORY[0x1E0C9AA60]);
    if (v9)
      v9[2](v9);
  }
  else
  {
    v12 = (void *)MEMORY[0x1A859CDD8](v11);
    v13 = objc_msgSend(v7, "count");
    GEOFindOrCreateLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109378;
      v21[0] = v13;
      LOWORD(v21[1]) = 2112;
      *(_QWORD *)((char *)&v21[1] + 2) = v7;
      _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_DEBUG, "Received %u Shortcuts: %@", buf, 0x12u);
    }

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v13);
    objc_msgSend((id)a1, "_renameDuplicateMeCardTypes:", v7);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __63__MapsSuggestionsShortcutSource__treatShortcuts_error_handler___block_invoke;
    v18[3] = &unk_1E4BD1070;
    v16 = v15;
    v19 = v16;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v18);
    objc_msgSend((id)a1, "addOrUpdateMySuggestionEntries:", v16);
    if (v9)
      v9[2](v9);

    objc_autoreleasePoolPop(v12);
  }

}

void __63__MapsSuggestionsShortcutSource__treatShortcuts_error_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  GEOFindOrCreateLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_DEBUG, "Treating Shortcut %@", (uint8_t *)&v9, 0xCu);
  }

  if ((objc_msgSend(v5, "isHidden") & 1) == 0)
  {
    MapsSuggestionsEntryFromShortcut(v5, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      GEOFindOrCreateLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v9 = 138412546;
        v10 = v5;
        v11 = 1024;
        v12 = a3;
        _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "Made Entry out of Shortcut '%@' at pos %u", (uint8_t *)&v9, 0x12u);
      }

      objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
    }

  }
}

void __69__MapsSuggestionsShortcutSource__updateSuggestionEntriesWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject **WeakRetained;
  NSObject **v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
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
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained[3];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __69__MapsSuggestionsShortcutSource__updateSuggestionEntriesWithHandler___block_invoke_106;
    v11[3] = &unk_1E4BCF4E8;
    objc_copyWeak(&v15, (id *)(a1 + 40));
    v12 = v5;
    v13 = v6;
    v14 = *(id *)(a1 + 32);
    dispatch_async(v9, v11);

    objc_destroyWeak(&v15);
  }
  else
  {
    GEOFindOrCreateLog();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v17 = "MapsSuggestionsShortcutSource.m";
      v18 = 1026;
      v19 = 155;
      v20 = 2082;
      v21 = "-[MapsSuggestionsShortcutSource _updateSuggestionEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __69__MapsSuggestionsShortcutSource__updateSuggestionEntriesWithHandler___block_invoke_106(id *a1)
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
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    objc_msgSend(a1[4], "shortcutsForAll");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[MapsSuggestionsShortcutSource _treatShortcuts:error:handler:]((uint64_t)WeakRetained, v3, a1[5], a1[6]);

  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136446722;
      v6 = "MapsSuggestionsShortcutSource.m";
      v7 = 1026;
      v8 = 157;
      v9 = 2082;
      v10 = "-[MapsSuggestionsShortcutSource _updateSuggestionEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }

  }
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

+ (unint64_t)disposition
{
  return 2;
}

- (void)start
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = 136315138;
    v5 = "-[MapsSuggestionsShortcutSource start]";
    _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v4, 0xCu);
  }

  -[MapsSuggestionsShortcutManager registerMeCardObserver:](self->_shortcutManager, "registerMeCardObserver:", self);
  -[MapsSuggestionsShortcutSource updateSuggestionEntriesWithHandler:](self, "updateSuggestionEntriesWithHandler:", 0);
}

- (void)stop
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = 136315138;
    v5 = "-[MapsSuggestionsShortcutSource stop]";
    _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v4, 0xCu);
  }

  -[MapsSuggestionsShortcutManager unregisterMeCardObserver:](self->_shortcutManager, "unregisterMeCardObserver:", self);
  -[MapsSuggestionsCanKicker cancel](self->_updateForcer, "cancel");
}

- (double)updateSuggestionEntriesWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[MapsSuggestionsShortcutSource updateSuggestionEntriesWithHandler:]";
    _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__MapsSuggestionsShortcutSource_updateSuggestionEntriesWithHandler___block_invoke;
  v9[3] = &unk_1E4BCEB98;
  objc_copyWeak(&v11, (id *)buf);
  v10 = v4;
  v7 = v4;
  dispatch_async(queue, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
  return 0.0;
}

void __68__MapsSuggestionsShortcutSource_updateSuggestionEntriesWithHandler___block_invoke(uint64_t a1)
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
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsShortcutSource _updateSuggestionEntriesWithHandler:]((uint64_t)WeakRetained, *(void **)(a1 + 32));
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136446722;
      v6 = "MapsSuggestionsShortcutSource.m";
      v7 = 1026;
      v8 = 196;
      v9 = 2082;
      v10 = "-[MapsSuggestionsShortcutSource updateSuggestionEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }

  }
}

- (BOOL)canProduceEntriesOfType:(int64_t)a3
{
  return MapsSuggestionsEntryTypeCouldBeShortcut(a3);
}

- (BOOL)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5
{
  return 0;
}

- (void)meCardReader:(id)a3 didUpdateMeCard:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *queue;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  GEOFindOrCreateLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "uniqueName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v16 = v9;
    _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "Reloading because of changes from %@", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__MapsSuggestionsShortcutSource_meCardReader_didUpdateMeCard___block_invoke;
  v12[3] = &unk_1E4BCDB40;
  objc_copyWeak(&v14, (id *)buf);
  v13 = v7;
  v11 = v7;
  dispatch_async(queue, v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);

}

void __62__MapsSuggestionsShortcutSource_meCardReader_didUpdateMeCard___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  int v4;
  char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "shortcutsForAll");
    v3 = objc_claimAutoreleasedReturnValue();
    -[MapsSuggestionsShortcutSource _treatShortcuts:error:handler:]((uint64_t)WeakRetained, v3, 0, 0);
  }
  else
  {
    GEOFindOrCreateLog();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136446722;
      v5 = "MapsSuggestionsShortcutSource.m";
      v6 = 1026;
      v7 = 224;
      v8 = 2082;
      v9 = "-[MapsSuggestionsShortcutSource meCardReader:didUpdateMeCard:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateForcer, 0);
  objc_storeStrong((id *)&self->_shortcutManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
