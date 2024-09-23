@implementation MapsSuggestionsBiome

- (id)initFromResourceDepot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MapsSuggestionsBiome *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  uint64_t v11;
  MapsSuggestionsBiomeConnector *connector;
  double v13;
  MapsSuggestionsBiome *v14;
  NSObject *v15;
  const char *v16;
  objc_super v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    GEOFindOrCreateLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBiome.m";
      v21 = 1024;
      v22 = 113;
      v23 = 2082;
      v24 = "-[MapsSuggestionsBiome initFromResourceDepot:]";
      v25 = 2082;
      v26 = "nil == (resourceDepot)";
      v16 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to build from!";
LABEL_10:
      _os_log_impl(&dword_1A427D000, v15, OS_LOG_TYPE_ERROR, v16, buf, 0x26u);
    }
LABEL_11:

    v14 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v4, "oneBiomeConnector");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    GEOFindOrCreateLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBiome.m";
      v21 = 1024;
      v22 = 114;
      v23 = 2082;
      v24 = "-[MapsSuggestionsBiome initFromResourceDepot:]";
      v25 = 2082;
      v26 = "nil == (resourceDepot.oneBiomeConnector)";
      v16 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a BiomeConnector!";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v18.receiver = self;
  v18.super_class = (Class)MapsSuggestionsBiome;
  v7 = -[MapsSuggestionsBiome init](&v18, sel_init);
  if (v7)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("MapsSuggestionsBiomeQueue", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

    objc_msgSend(v5, "oneBiomeConnector");
    v11 = objc_claimAutoreleasedReturnValue();
    connector = v7->_connector;
    v7->_connector = (MapsSuggestionsBiomeConnector *)v11;

    GEOConfigGetDouble();
    v7->_expirationDuration = v13;
  }
  self = v7;
  v14 = self;
LABEL_12:

  return v14;
}

- (void)registerForUpdatesWithHandler:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *queue;
  id v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id location;
  _QWORD block[5];
  id v13;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__MapsSuggestionsBiome_registerForUpdatesWithHandler___block_invoke;
  block[3] = &unk_1E4BCE9E8;
  block[4] = self;
  v7 = v4;
  v13 = v7;
  dispatch_sync(queue, block);
  if (!self->_registeredForFindMy || !self->_registeredForSmartReplies)
  {
    objc_initWeak(&location, self);
    v8 = self->_queue;
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __54__MapsSuggestionsBiome_registerForUpdatesWithHandler___block_invoke_120;
    v9[3] = &unk_1E4BCDFF8;
    objc_copyWeak(&v10, &location);
    dispatch_async(v8, v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

void __54__MapsSuggestionsBiome_registerForUpdatesWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD aBlock[4];
  id v15;
  id location;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 56);
  *(_QWORD *)(v3 + 56) = v2;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v5 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v5 + 24))
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __54__MapsSuggestionsBiome_registerForUpdatesWithHandler___block_invoke_2;
    aBlock[3] = &unk_1E4BCE9C0;
    objc_copyWeak(&v15, &location);
    v6 = _Block_copy(aBlock);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    objc_destroyWeak(&v15);
    v5 = *(_QWORD *)(a1 + 32);
  }
  if (!*(_BYTE *)(v5 + 25))
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __54__MapsSuggestionsBiome_registerForUpdatesWithHandler___block_invoke_118;
    v12[3] = &unk_1E4BCE9C0;
    objc_copyWeak(&v13, &location);
    v9 = _Block_copy(v12);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 48);
    *(_QWORD *)(v10 + 48) = v9;

    objc_destroyWeak(&v13);
  }
  objc_destroyWeak(&location);
}

void __54__MapsSuggestionsBiome_registerForUpdatesWithHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  _QWORD *WeakRetained;
  NSObject *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  uint8_t buf[4];
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (!objc_msgSend(v6, "count"))
    {
      v10 = WeakRetained[2];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __54__MapsSuggestionsBiome_registerForUpdatesWithHandler___block_invoke_115;
      block[3] = &unk_1E4BCDFF8;
      objc_copyWeak(&v12, v7);
      dispatch_async(v10, block);
      objc_destroyWeak(&v12);
      goto LABEL_10;
    }
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = (char *)v6;
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "Error from X, %@", buf, 0xCu);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v14 = "MapsSuggestionsBiome.m";
      v15 = 1026;
      v16 = 166;
      v17 = 2082;
      v18 = "-[MapsSuggestionsBiome registerForUpdatesWithHandler:]_block_invoke_2";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
LABEL_10:

}

void __54__MapsSuggestionsBiome_registerForUpdatesWithHandler___block_invoke_115(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  int v4;
  char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 24) = 1;
    (*(void (**)(void))(*((_QWORD *)WeakRetained + 7) + 16))();
  }
  else
  {
    GEOFindOrCreateLog();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136446722;
      v5 = "MapsSuggestionsBiome.m";
      v6 = 1026;
      v7 = 169;
      v8 = 2082;
      v9 = "-[MapsSuggestionsBiome registerForUpdatesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }

  }
}

void __54__MapsSuggestionsBiome_registerForUpdatesWithHandler___block_invoke_118(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  _QWORD *WeakRetained;
  NSObject *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  uint8_t buf[4];
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (!objc_msgSend(v6, "count"))
    {
      v10 = WeakRetained[2];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __54__MapsSuggestionsBiome_registerForUpdatesWithHandler___block_invoke_119;
      block[3] = &unk_1E4BCDFF8;
      objc_copyWeak(&v12, v7);
      dispatch_async(v10, block);
      objc_destroyWeak(&v12);
      goto LABEL_10;
    }
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = (char *)v6;
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "Error from X, %@", buf, 0xCu);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v14 = "MapsSuggestionsBiome.m";
      v15 = 1026;
      v16 = 178;
      v17 = 2082;
      v18 = "-[MapsSuggestionsBiome registerForUpdatesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
LABEL_10:

}

void __54__MapsSuggestionsBiome_registerForUpdatesWithHandler___block_invoke_119(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  int v4;
  char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 25) = 1;
    (*(void (**)(void))(*((_QWORD *)WeakRetained + 7) + 16))();
  }
  else
  {
    GEOFindOrCreateLog();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136446722;
      v5 = "MapsSuggestionsBiome.m";
      v6 = 1026;
      v7 = 181;
      v8 = 2082;
      v9 = "-[MapsSuggestionsBiome registerForUpdatesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }

  }
}

void __54__MapsSuggestionsBiome_registerForUpdatesWithHandler___block_invoke_120(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  NSObject *v3;
  int v4;
  char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[1], "registerForFindMyUpdatesWithHandler:", WeakRetained[6]);
    objc_msgSend(v2[1], "registerForSmartRepliesUpdatesWithHandler:", v2[5]);
  }
  else
  {
    GEOFindOrCreateLog();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136446722;
      v5 = "MapsSuggestionsBiome.m";
      v6 = 1026;
      v7 = 192;
      v8 = 2082;
      v9 = "-[MapsSuggestionsBiome registerForUpdatesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }

  }
}

- (BOOL)_shouldAllowEventType:(int)a3
{
  if (a3 == 1 || (a3 & 0xFFFFFFFE) == 2)
    return GEOConfigGetBOOL();
  else
    return 1;
}

- (id)_entriesFromFindMy:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  MapsSuggestionsEntry *v26;
  MapsSuggestionsEntry *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  objc_class *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  id v57;
  MapsSuggestionsBiome *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  id v70;
  id v71;
  uint8_t buf[4];
  void *v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (objc_msgSend(v4, "count"))
  {
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
    v57 = v4;
    if (!v6)
    {
      v8 = 0;
      goto LABEL_48;
    }
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v67;
    v58 = self;
    v59 = v5;
    v63 = *(_QWORD *)v67;
    while (1)
    {
      v10 = 0;
      v64 = v7;
      do
      {
        if (*(_QWORD *)v67 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v11, "handle");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            if (-[MapsSuggestionsBiome _shouldAllowEventType:](self, "_shouldAllowEventType:", objc_msgSend(v11, "actionType")))
            {
              objc_msgSend(v11, "eventTimestampBegin");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "dateByAddingTimeInterval:", self->_expirationDuration);
              v14 = objc_claimAutoreleasedReturnValue();

              objc_msgSend(v11, "eventTimestampBegin");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              GEOConfigGetDouble();
              objc_msgSend(v15, "dateByAddingTimeInterval:");
              v65 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v11, "eventTimestampEnd");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (v16)
              {
                objc_msgSend(v11, "eventTimestampEnd");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "earlierDate:", v14);
                v18 = objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v18 = v14;
              }

              v20 = objc_msgSend(v11, "actionType");
              if (v20 == 1)
              {
                v25 = 1;
                goto LABEL_24;
              }
              v9 = v63;
              v7 = v64;
              if (v20 == 3)
              {

                v18 = 0;
                v62 = 3;
                goto LABEL_25;
              }
              if (v20 == 2)
              {
                objc_msgSend(v11, "eventTimestampEnd");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                if (v21)
                {
                  objc_msgSend(v11, "eventTimestampEnd");
                  v22 = v8;
                  v23 = objc_claimAutoreleasedReturnValue();
                  -[NSObject earlierDate:](v23, "earlierDate:", v65);
                  v24 = objc_claimAutoreleasedReturnValue();

                  v18 = v23;
                  v8 = v22;
                  self = v58;
                }
                else
                {
                  v24 = v65;
                }

                v18 = v24;
                v25 = 2;
LABEL_24:
                v62 = v25;
                v9 = v63;
                v7 = v64;
                if (!MapsSuggestionsIsInThePast(v18))
                {
LABEL_25:
                  v26 = [MapsSuggestionsEntry alloc];
                  GEOConfigGetDouble();
                  v60 = v18;
                  v27 = -[MapsSuggestionsEntry initWithType:title:subtitle:weight:expires:geoMapItem:sourceSpecificInfo:](v26, "initWithType:title:subtitle:weight:expires:geoMapItem:sourceSpecificInfo:", 24, CFSTR("Contact Activity"), CFSTR("From Biome/FindMy"), v18, 0, 0);
                  -[MapsSuggestionsEntry setString:forKey:](v27, "setString:forKey:", v12, CFSTR("MapsSuggestionsContactActivityPK"));
                  -[MapsSuggestionsEntry setString:forKey:](v27, "setString:forKey:", CFSTR("MapsSuggestionsContactActivityPK"), CFSTR("MapsSuggestionsPrimaryKey"));
                  objc_msgSend(v11, "bundleID");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  -[MapsSuggestionsEntry setString:forKey:](v27, "setString:forKey:", v28, CFSTR("MapsSuggestionsOriginBundleIDKey"));

                  v29 = v12;
                  if (objc_msgSend(v29, "containsString:", CFSTR("@"))
                    && (objc_msgSend(v29, "containsString:", CFSTR(".")) & 1) != 0)
                  {

                    v71 = v29;
                    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v71, 1);
                    v30 = v8;
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    -[MapsSuggestionsEntry setArray:forKey:](v27, "setArray:forKey:", v31, CFSTR("MapsSuggestionsContactAllEmailAddressesKey"));

                    v8 = v30;
                  }
                  else
                  {

                    -[MapsSuggestionsEntry setArray:forKey:](v27, "setArray:forKey:", 0, CFSTR("MapsSuggestionsContactAllEmailAddressesKey"));
                  }
                  v61 = v8;
                  v32 = v29;
                  if (objc_msgSend(v32, "length"))
                  {
                    objc_msgSend(v32, "stringByReplacingOccurrencesOfString:withString:", CFSTR("("), &stru_1E4BDFC28);
                    v33 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v33, "stringByReplacingOccurrencesOfString:withString:", CFSTR(")"), &stru_1E4BDFC28);
                    v34 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v34, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), &stru_1E4BDFC28);
                    v35 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v35, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E4BDFC28);
                    v36 = (void *)objc_claimAutoreleasedReturnValue();

                    v37 = v36;
                    v38 = v37;
                  }
                  else
                  {
                    v37 = 0;
                    v38 = v32;
                  }

                  objc_msgSend(v37, "stringByReplacingOccurrencesOfString:withString:", CFSTR("+"), &stru_1E4BDFC28);
                  v39 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v40, "invertedSet");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  v42 = objc_msgSend(v39, "rangeOfCharacterFromSet:", v41);

                  if (v42 == 0x7FFFFFFFFFFFFFFFLL)
                  {
                    v70 = v32;
                    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1);
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    -[MapsSuggestionsEntry setArray:forKey:](v27, "setArray:forKey:", v43, CFSTR("MapsSuggestionsContactAllPhoneNumbersKey"));

                  }
                  else
                  {
                    -[MapsSuggestionsEntry setArray:forKey:](v27, "setArray:forKey:", 0, CFSTR("MapsSuggestionsContactAllPhoneNumbersKey"));
                  }
                  v8 = v61;
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v62);
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  -[MapsSuggestionsEntry setNumber:forKey:](v27, "setNumber:forKey:", v44, CFSTR("MapsSuggestionsContactActivityKey"));

                  -[MapsSuggestionsEntry setString:forKey:](v27, "setString:forKey:", CFSTR("FindMy"), CFSTR("MapsSuggestionsOriginatingAppName"));
                  v45 = objc_alloc(MEMORY[0x1E0C99E20]);
                  v46 = (void *)objc_msgSend(v45, "initWithObjects:", MapsSuggestionsFindMyAppBundleID, 0);
                  objc_msgSend(v11, "bundleID");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v47)
                  {
                    objc_msgSend(v11, "bundleID");
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v46, "addObject:", v48);

                  }
                  v49 = (void *)objc_msgSend(v46, "copy");
                  -[MapsSuggestionsEntry setSet:forKey:](v27, "setSet:forKey:", v49, CFSTR("MapsSuggestionsAssociatedBundleIDsKey"));

                  if (!v61)
                    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v59, "count"));
                  objc_msgSend(v11, "actionType");
                  BMFindMyContactActivityEventTypeAsString();
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  v51 = (objc_class *)MEMORY[0x1E0CB3940];
                  v52 = v32;
                  v53 = (void *)objc_msgSend([v51 alloc], "initWithFormat:", CFSTR("%@_%@"), v52, v50);

                  objc_msgSend(v8, "setObject:forKey:", v27, v53);
                  self = v58;
                  v5 = v59;
                  v9 = v63;
                  v7 = v64;
                  v18 = v60;
                }
              }

            }
            else
            {
              GEOFindOrCreateLog();
              v14 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v11, "actionType");
                BMFindMyContactActivityEventTypeAsString();
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v73 = v19;
                _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_ERROR, "Not processing %@ because the switch is off", buf, 0xCu);

              }
            }

          }
        }
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
      if (!v7)
      {
LABEL_48:

        objc_msgSend(v8, "allValues");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = (void *)objc_msgSend(v55, "copy");

        v4 = v57;
        goto LABEL_49;
      }
    }
  }
  v54 = 0;
LABEL_49:

  return v54;
}

- (id)_entriesFromSmartReplies:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  MapsSuggestionsEntry *v44;
  MapsSuggestionsEntry *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v62;
  MapsSuggestionsBiome *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  uint64_t v67;
  id obj;
  void *v69;
  void *v70;
  uint64_t v71;
  NSObject *v72;
  void *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint8_t buf[4];
  void *v87;
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v63 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (objc_msgSend(v4, "count"))
  {
    if ((GEOConfigGetBOOL() & 1) != 0)
    {
      v84 = 0u;
      v85 = 0u;
      v82 = 0u;
      v83 = 0u;
      v62 = v4;
      obj = v4;
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v90, 16);
      if (!v5)
      {
        v7 = 0;
        goto LABEL_60;
      }
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v83;
      v64 = *(_QWORD *)v83;
      while (1)
      {
        v9 = 0;
        v67 = v6;
        do
        {
          if (*(_QWORD *)v83 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * v9);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_52;
          objc_msgSend(v10, "contactInformation");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v11)
            goto LABEL_51;
          v69 = v10;
          v71 = v9;
          v72 = v7;
          v12 = objc_alloc(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v11, "phoneNumber");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)objc_msgSend(v12, "initWithCapacity:", objc_msgSend(v13, "count"));

          v80 = 0u;
          v81 = 0u;
          v78 = 0u;
          v79 = 0u;
          v73 = v11;
          objc_msgSend(v11, "phoneNumber");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v78, v89, 16);
          if (!v16)
            goto LABEL_22;
          v17 = v16;
          v18 = *(_QWORD *)v79;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v79 != v18)
                objc_enumerationMutation(v15);
              v20 = *(id *)(*((_QWORD *)&v78 + 1) + 8 * i);
              v21 = v20;
              if (v20 && objc_msgSend(v20, "length"))
              {
                objc_msgSend(v21, "stringByReplacingOccurrencesOfString:withString:", CFSTR("("), &stru_1E4BDFC28);
                v22 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v22, "stringByReplacingOccurrencesOfString:withString:", CFSTR(")"), &stru_1E4BDFC28);
                v23 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v23, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), &stru_1E4BDFC28);
                v24 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v24, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E4BDFC28);
                v21 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v21)
                  continue;
                objc_msgSend(v14, "addObject:", v21);
              }

            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v78, v89, 16);
          }
          while (v17);
LABEL_22:

          v25 = objc_alloc(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v73, "emailAddress");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = (void *)objc_msgSend(v25, "initWithCapacity:", objc_msgSend(v26, "count"));

          v76 = 0u;
          v77 = 0u;
          v74 = 0u;
          v75 = 0u;
          objc_msgSend(v73, "emailAddress");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v74, v88, 16);
          if (v29)
          {
            v30 = v29;
            v31 = *(_QWORD *)v75;
            do
            {
              for (j = 0; j != v30; ++j)
              {
                if (*(_QWORD *)v75 != v31)
                  objc_enumerationMutation(v28);
                v33 = *(id *)(*((_QWORD *)&v74 + 1) + 8 * j);
                if (objc_msgSend(v33, "containsString:", CFSTR("@"))
                  && (objc_msgSend(v33, "containsString:", CFSTR(".")) & 1) != 0)
                {

                  objc_msgSend(v27, "addObject:", v33);
                }
                else
                {

                }
              }
              v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v74, v88, 16);
            }
            while (v30);
          }

          if (objc_msgSend(v14, "count") || objc_msgSend(v27, "count"))
          {
            v11 = v73;
            objc_msgSend(v73, "identifier");
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            if (v34)
            {
              objc_msgSend(v69, "predictionTimestamp");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "dateByAddingTimeInterval:", v63->_expirationDuration);
              v36 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v69, "predictionExpiration");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              if (v37)
              {
                objc_msgSend(v69, "predictionExpiration");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "earlierDate:", v36);
                v39 = (id)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v39 = v36;
              }

              GEOFindOrCreateLog();
              v40 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v73, "phoneNumber");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v87 = v41;
                _os_log_impl(&dword_1A427D000, v40, OS_LOG_TYPE_DEBUG, "All Phone Numbers: %@", buf, 0xCu);

              }
              v66 = v36;

              GEOFindOrCreateLog();
              v42 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v73, "emailAddress");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v87 = v43;
                _os_log_impl(&dword_1A427D000, v42, OS_LOG_TYPE_DEBUG, "All Email Addresses: %@", buf, 0xCu);

              }
              v44 = [MapsSuggestionsEntry alloc];
              GEOConfigGetDouble();
              v45 = -[MapsSuggestionsEntry initWithType:title:subtitle:weight:expires:geoMapItem:sourceSpecificInfo:](v44, "initWithType:title:subtitle:weight:expires:geoMapItem:sourceSpecificInfo:", 24, CFSTR("Contact Activity"), CFSTR("From Biome/SmartReplies"), v39, 0, 0);
              objc_msgSend(v73, "fullDisplayName");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              -[MapsSuggestionsEntry setString:forKey:](v45, "setString:forKey:", v46, CFSTR("MapsSuggestionsContactDisplayNameKey"));

              objc_msgSend(v73, "identifier");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              -[MapsSuggestionsEntry setString:forKey:](v45, "setString:forKey:", v47, CFSTR("MapsSuggestionsContactActivityPK"));

              -[MapsSuggestionsEntry setString:forKey:](v45, "setString:forKey:", CFSTR("MapsSuggestionsContactActivityPK"), CFSTR("MapsSuggestionsPrimaryKey"));
              objc_msgSend(v69, "bundleID");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              -[MapsSuggestionsEntry setString:forKey:](v45, "setString:forKey:", v48, CFSTR("MapsSuggestionsOriginBundleIDKey"));

              v49 = (void *)objc_msgSend(v27, "copy");
              -[MapsSuggestionsEntry setArray:forKey:](v45, "setArray:forKey:", v49, CFSTR("MapsSuggestionsContactAllEmailAddressesKey"));

              v50 = (void *)objc_msgSend(v14, "copy");
              -[MapsSuggestionsEntry setArray:forKey:](v45, "setArray:forKey:", v50, CFSTR("MapsSuggestionsContactAllPhoneNumbersKey"));

              -[MapsSuggestionsEntry setNumber:forKey:](v45, "setNumber:forKey:", &unk_1E4C097B8, CFSTR("MapsSuggestionsContactActivityKey"));
              -[MapsSuggestionsEntry setString:forKey:](v45, "setString:forKey:", CFSTR("Messages"), CFSTR("MapsSuggestionsOriginatingAppName"));
              v51 = objc_alloc(MEMORY[0x1E0C99E20]);
              v52 = (void *)objc_msgSend(v51, "initWithObjects:", MapsSuggestionsFindMyAppBundleID, 0);
              objc_msgSend(v69, "bundleID");
              v53 = (void *)objc_claimAutoreleasedReturnValue();

              if (v53)
              {
                objc_msgSend(v69, "bundleID");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "addObject:", v54);

              }
              v70 = v39;
              v55 = (void *)objc_msgSend(v52, "copy");
              -[MapsSuggestionsEntry setSet:forKey:](v45, "setSet:forKey:", v55, CFSTR("MapsSuggestionsAssociatedBundleIDsKey"));

              v56 = v72;
              v65 = v52;
              if (!v72)
                v56 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(obj, "count"));
              objc_msgSend(v73, "identifier");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_%@"), v57, CFSTR("BMMapsRecentConversationsIntentActionTypeMeetup"));

              -[NSObject setObject:forKeyedSubscript:](v56, "setObject:forKeyedSubscript:", v45, v58);
              v11 = v73;
              v7 = v56;

            }
            else
            {
              v7 = v72;
            }
          }
          else
          {
            v7 = v72;
            v11 = v73;
          }

          v6 = v67;
          v8 = v64;
          v9 = v71;
LABEL_51:

LABEL_52:
          ++v9;
        }
        while (v9 != v6);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v90, 16);
        if (!v6)
        {
LABEL_60:

          -[NSObject allValues](v7, "allValues");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = (void *)objc_msgSend(v60, "copy");

          v4 = v62;
          goto LABEL_61;
        }
      }
    }
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "Not processing DirectionsSuggestionsFromSmartReplies because the switch is off", buf, 2u);
    }
    v59 = 0;
LABEL_61:

  }
  else
  {
    v59 = 0;
  }

  return v59;
}

- (BOOL)entriesFromFindMyWithCompletionHandler:(id)a3
{
  id v4;
  MapsSuggestionsBiomeConnector *connector;
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
    v9[2] = __63__MapsSuggestionsBiome_entriesFromFindMyWithCompletionHandler___block_invoke;
    v9[3] = &unk_1E4BCEA38;
    v10 = v4;
    objc_copyWeak(&v11, (id *)location);
    v6 = -[MapsSuggestionsBiomeConnector getFindMyStreamsWithHandler:](connector, "getFindMyStreamsWithHandler:", v9);
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
      *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBiome.m";
      v13 = 1024;
      v14 = 421;
      v15 = 2082;
      v16 = "-[MapsSuggestionsBiome entriesFromFindMyWithCompletionHandler:]";
      v17 = 2082;
      v18 = "nil == (handler)";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Handler cannot be nil", location, 0x26u);
    }

    v6 = 0;
  }

  return v6;
}

void __63__MapsSuggestionsBiome_entriesFromFindMyWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject **WeakRetained;
  NSObject *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "Error from X, %@", buf, 0xCu);
    }

    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v9);
  }
  else
  {
    WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      v9 = WeakRetained;
      v11 = WeakRetained[2];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __63__MapsSuggestionsBiome_entriesFromFindMyWithCompletionHandler___block_invoke_137;
      block[3] = &unk_1E4BCEA10;
      objc_copyWeak(&v16, (id *)(a1 + 40));
      v14 = v5;
      v15 = *(id *)(a1 + 32);
      dispatch_async(v11, block);

      objc_destroyWeak(&v16);
    }
    else
    {
      GEOFindOrCreateLog();
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v18 = "MapsSuggestionsBiome.m";
        v19 = 1026;
        v20 = 427;
        v21 = 2082;
        v22 = "-[MapsSuggestionsBiome entriesFromFindMyWithCompletionHandler:]_block_invoke";
        _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
      }

      v9 = 0;
    }
  }

}

void __63__MapsSuggestionsBiome_entriesFromFindMyWithCompletionHandler___block_invoke_137(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *log;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  void *v31;
  uint8_t buf[4];
  char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  const char *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("eventTimestampBegin"), 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sortedArrayUsingDescriptors:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      log = v7;
      v26 = WeakRetained;
      v25 = v6;
      v8 = v6;
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v10 = v8;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, buf, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v28 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v16 = objc_alloc(MEMORY[0x1E0CB3940]);
              objc_msgSend(v15, "actionType");
              BMFindMyContactActivityEventTypeAsString();
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "handle");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "eventTimestampBegin");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("FindMy event ~%@~ occured with %@ at %@"), v17, v18, v19);
              objc_msgSend(v9, "addObject:", v20);

            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, buf, 16);
        }
        while (v12);
      }

      v21 = (char *)objc_msgSend(v9, "copy");
      *(_DWORD *)buf = 138412290;
      v33 = v21;
      v7 = log;
      _os_log_impl(&dword_1A427D000, log, OS_LOG_TYPE_DEBUG, "Received a Stream from FindMy: %@", buf, 0xCu);

      WeakRetained = v26;
      v6 = v25;
    }

    objc_msgSend(WeakRetained, "_entriesFromFindMy:", v6);
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      GEOFindOrCreateLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A427D000, v23, OS_LOG_TYPE_ERROR, "Received a Stream from FindMy but could not make any viable entries out of it", buf, 2u);
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    GEOFindOrCreateLog();
    v22 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v33 = "MapsSuggestionsBiome.m";
      v34 = 1026;
      v35 = 429;
      v36 = 2082;
      v37 = "-[MapsSuggestionsBiome entriesFromFindMyWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v22, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", buf, 0x1Cu);
    }
    v6 = v22;
  }

}

- (BOOL)entriesFromSmartRepliesWithCompletionHandler:(id)a3
{
  id v4;
  MapsSuggestionsBiomeConnector *connector;
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
    v9[2] = __69__MapsSuggestionsBiome_entriesFromSmartRepliesWithCompletionHandler___block_invoke;
    v9[3] = &unk_1E4BCEA38;
    v10 = v4;
    objc_copyWeak(&v11, (id *)location);
    v6 = -[MapsSuggestionsBiomeConnector getSmartRepliesStreamsWithHandler:](connector, "getSmartRepliesStreamsWithHandler:", v9);
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
      *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBiome.m";
      v13 = 1024;
      v14 = 446;
      v15 = 2082;
      v16 = "-[MapsSuggestionsBiome entriesFromSmartRepliesWithCompletionHandler:]";
      v17 = 2082;
      v18 = "nil == (handler)";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Handler cannot be nil", location, 0x26u);
    }

    v6 = 0;
  }

  return v6;
}

void __69__MapsSuggestionsBiome_entriesFromSmartRepliesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject **WeakRetained;
  NSObject *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "Error from X, %@", buf, 0xCu);
    }

    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v9);
  }
  else
  {
    WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      v9 = WeakRetained;
      v11 = WeakRetained[2];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __69__MapsSuggestionsBiome_entriesFromSmartRepliesWithCompletionHandler___block_invoke_141;
      block[3] = &unk_1E4BCEA10;
      objc_copyWeak(&v16, (id *)(a1 + 40));
      v14 = v5;
      v15 = *(id *)(a1 + 32);
      dispatch_async(v11, block);

      objc_destroyWeak(&v16);
    }
    else
    {
      GEOFindOrCreateLog();
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v18 = "MapsSuggestionsBiome.m";
        v19 = 1026;
        v20 = 452;
        v21 = 2082;
        v22 = "-[MapsSuggestionsBiome entriesFromSmartRepliesWithCompletionHandler:]_block_invoke";
        _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
      }

      v9 = 0;
    }
  }

}

void __69__MapsSuggestionsBiome_entriesFromSmartRepliesWithCompletionHandler___block_invoke_141(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  char *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *log;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  void *v41;
  uint8_t buf[4];
  char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  const char *v47;
  uint64_t v48;

  v1 = a1;
  v48 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = *(void **)(v1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("predictionTimestamp"), 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sortedArrayUsingDescriptors:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      log = v7;
      v33 = v1;
      v34 = WeakRetained;
      v32 = v6;
      v8 = v6;
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v10 = v8;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, buf, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v38;
        v35 = v9;
        v36 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v38 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v15, "contactInformation");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "friendlyName");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = v17;
              if (v17)
              {
                v19 = v17;
              }
              else
              {
                v20 = v10;
                objc_msgSend(v16, "emailAddress");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "componentsJoinedByString:", CFSTR(", "));
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = v22;
                if (v22)
                {
                  v19 = v22;
                }
                else
                {
                  objc_msgSend(v16, "phoneNumber");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "componentsJoinedByString:", CFSTR(", "));
                  v19 = (id)objc_claimAutoreleasedReturnValue();

                  v9 = v35;
                }

                v10 = v20;
                v13 = v36;
              }

              v25 = objc_alloc(MEMORY[0x1E0CB3940]);
              objc_msgSend(v15, "predictionTimestamp");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = (void *)objc_msgSend(v25, "initWithFormat:", CFSTR("Messages event occured with %@ at %@"), v19, v26);
              objc_msgSend(v9, "addObject:", v27);

            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, buf, 16);
        }
        while (v12);
      }

      v28 = (char *)objc_msgSend(v9, "copy");
      *(_DWORD *)buf = 138412290;
      v43 = v28;
      v7 = log;
      _os_log_impl(&dword_1A427D000, log, OS_LOG_TYPE_DEBUG, "Received a Stream from SmartReplies: %@", buf, 0xCu);

      v1 = v33;
      WeakRetained = v34;
      v6 = v32;
    }

    objc_msgSend(WeakRetained, "_entriesFromSmartReplies:", v6);
    v29 = objc_claimAutoreleasedReturnValue();
    if (!v29)
    {
      GEOFindOrCreateLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A427D000, v30, OS_LOG_TYPE_ERROR, "Received a Stream from SmartReplies but could not make any viable entries out of it", buf, 2u);
      }

    }
    (*(void (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
  }
  else
  {
    GEOFindOrCreateLog();
    v29 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v43 = "MapsSuggestionsBiome.m";
      v44 = 1026;
      v45 = 454;
      v46 = 2082;
      v47 = "-[MapsSuggestionsBiome entriesFromSmartRepliesWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v29, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", buf, 0x1Cu);
    }
    v6 = v29;
  }

}

- (void)dealloc
{
  MapsSuggestionsBiomeConnector *connector;
  objc_super v4;

  *(_WORD *)&self->_registeredForSmartReplies = 0;
  connector = self->_connector;
  if (connector)
  {
    -[MapsSuggestionsBiomeConnector unregisterFindMyUpdates](connector, "unregisterFindMyUpdates");
    -[MapsSuggestionsBiomeConnector unregisterSmartRepliesUpdates](self->_connector, "unregisterSmartRepliesUpdates");
  }
  v4.receiver = self;
  v4.super_class = (Class)MapsSuggestionsBiome;
  -[MapsSuggestionsBiome dealloc](&v4, sel_dealloc);
}

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "description");
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong(&self->_findMyUpdateHandler, 0);
  objc_storeStrong(&self->_smartRepliesUpdateHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connector, 0);
}

@end
