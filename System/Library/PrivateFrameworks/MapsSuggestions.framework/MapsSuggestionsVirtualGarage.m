@implementation MapsSuggestionsVirtualGarage

- (id)initFromResourceDepot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MapsSuggestionsVirtualGarage *v8;
  NSObject *v9;
  const char *v10;
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
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsVirtualGarage.m";
      v14 = 1024;
      v15 = 42;
      v16 = 2082;
      v17 = "-[MapsSuggestionsVirtualGarage initFromResourceDepot:]";
      v18 = 2082;
      v19 = "nil == (resourceDepot)";
      v10 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to build from!";
LABEL_8:
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v12, 0x26u);
    }
LABEL_9:

    v8 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v4, "oneVirtualGarageConnector");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsVirtualGarage.m";
      v14 = 1024;
      v15 = 43;
      v16 = 2082;
      v17 = "-[MapsSuggestionsVirtualGarage initFromResourceDepot:]";
      v18 = 2082;
      v19 = "nil == (resourceDepot.oneVirtualGarageConnector)";
      v10 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires OneVirtualGarageConnector!";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  objc_msgSend(v5, "oneVirtualGarageConnector");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[MapsSuggestionsVirtualGarage initWithConnector:](self, "initWithConnector:", v7);

  v8 = self;
LABEL_10:

  return v8;
}

- (MapsSuggestionsVirtualGarage)initWithConnector:(id)a3
{
  id v5;
  MapsSuggestionsVirtualGarage *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  MapsSuggestionsObservers *v10;
  MapsSuggestionsObservers *observers;
  MapsSuggestionsVirtualGarage *v12;
  NSObject *v13;
  objc_super v15;
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
  v5 = a3;
  if (v5)
  {
    v15.receiver = self;
    v15.super_class = (Class)MapsSuggestionsVirtualGarage;
    v6 = -[MapsSuggestionsVirtualGarage init](&v15, sel_init);
    if (v6)
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = dispatch_queue_create("MapsSuggestionsVirtualGarageQueue", v7);
      queue = v6->_queue;
      v6->_queue = (OS_dispatch_queue *)v8;

      objc_storeStrong((id *)&v6->_connector, a3);
      -[MapsSuggestionsVirtualGarageConnector setDelegate:](v6->_connector, "setDelegate:", v6);
      v10 = -[MapsSuggestionsObservers initWithCallbackQueue:name:]([MapsSuggestionsObservers alloc], "initWithCallbackQueue:name:", v6->_queue, CFSTR("MapsSuggestionsVirtualGarageObservers"));
      observers = v6->_observers;
      v6->_observers = v10;

    }
    self = v6;
    v12 = self;
  }
  else
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsVirtualGarage.m";
      v18 = 1024;
      v19 = 70;
      v20 = 2082;
      v21 = "-[MapsSuggestionsVirtualGarage initWithConnector:]";
      v22 = 2082;
      v23 = "nil == (connector)";
      _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an virtualGarageConnector", buf, 0x26u);
    }

    v12 = 0;
  }

  return v12;
}

- (id)_q_entryForUnpairedVehicles:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  NSObject *v42;
  __int16 v43;
  uint64_t v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v38;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v38 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_msgSend(v11, "pairedAppIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "length");

          if (!v13)
          {
            GEOFindOrCreateLog();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v11, "displayName");
              v34 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v42 = v34;
              _os_log_impl(&dword_1A427D000, v29, OS_LOG_TYPE_ERROR, "Vehicle %@ must have a pairedAppIdentifier", buf, 0xCu);

            }
            v22 = 0;
            goto LABEL_16;
          }
          objc_msgSend(v11, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v14);

          objc_msgSend(v11, "pairedAppIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v15);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
        if (v8)
          continue;
        break;
      }
    }

    GEOConfigGetDouble();
    MapsSuggestionsNowWithOffset(v16);
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "manufacturer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "model");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    GEOConfigGetDouble();
    v36 = (void *)v17;
    +[MapsSuggestionsEntry entryWithType:title:subtitle:weight:expires:sourceSpecificInfo:](MapsSuggestionsEntry, "entryWithType:title:subtitle:weight:expires:sourceSpecificInfo:", 20, v19, v21, v17, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "setBoolean:forKey:", (unint64_t)objc_msgSend(v4, "count") > 1, CFSTR("MapsSuggestionsVehicleSetupWithGenericIconKey"));
    v23 = v5;
    objc_msgSend(v4, "allObjects");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "allObjects");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "arrayByAddingObjectsFromArray:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "componentsJoinedByString:", CFSTR("_"));
    v29 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "pairedAppIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setString:forKey:", v31, CFSTR("MapsSuggestionsOriginBundleIDKey"));

    objc_msgSend(v22, "setString:forKey:", v29, CFSTR("MapsSuggestionsVirtualGaragePK"));
    objc_msgSend(v22, "setString:forKey:", CFSTR("MapsSuggestionsVirtualGaragePK"), CFSTR("MapsSuggestionsPrimaryKey"));
    objc_msgSend(v22, "setBoolean:forKey:", 1, CFSTR("MapsSuggestionsIsNotADestinationKey"));
    objc_msgSend(v22, "setBoolean:forKey:", 0, CFSTR("MapsSuggestionsNeedsETATrackingKey"));
    objc_msgSend(v22, "setBoolean:forKey:", 0, CFSTR("MapsSuggestionsNeedsDistanceTrackingKey"));
    GEOFindOrCreateLog();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      v33 = objc_msgSend(v23, "count");
      *(_DWORD *)buf = 138412546;
      v42 = v29;
      v43 = 2048;
      v44 = v33;
      _os_log_impl(&dword_1A427D000, v32, OS_LOG_TYPE_DEBUG, "Adding VehicleSetup entry with uniqueID %@ and %lu unpaired vehicles", buf, 0x16u);
    }

    v6 = v36;
LABEL_16:

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (BOOL)entriesForUnpairedVehiclesWithHandler:(id)a3
{
  void (**v4)(id, _QWORD, NSObject *);
  int v5;
  NSObject *queue;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v11[4];
  void (**v12)(id, _QWORD, NSObject *);
  id v13;
  _BYTE location[14];
  _BYTE v15[6];
  const char *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, NSObject *))a3;
  if (!v4)
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsVirtualGarage.m";
      *(_WORD *)&location[12] = 1024;
      *(_DWORD *)v15 = 136;
      *(_WORD *)&v15[4] = 2082;
      v16 = "-[MapsSuggestionsVirtualGarage entriesForUnpairedVehiclesWithHandler:]";
      v17 = 2082;
      v18 = "nil == (handler)";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a handler!", location, 0x26u);
    }
    goto LABEL_13;
  }
  v5 = IsEVRoutingSupported();
  if (!v5 || !MapsFeature_IsEnabled_EVRouting() || (GEOConfigGetBOOL() & 1) == 0)
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_QWORD *)location = 67109888;
      *(_WORD *)&location[8] = 1024;
      *(_DWORD *)&location[10] = v5;
      *(_WORD *)v15 = 1024;
      *(_DWORD *)&v15[2] = MapsFeature_IsEnabled_EVRouting();
      LOWORD(v16) = 1024;
      *(_DWORD *)((char *)&v16 + 2) = GEOConfigGetBOOL();
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "_isEVRoutingSupported is %d because: CountrySupportsEVRouting: %d, FeatureEnabled: %d, SourceEnabled: %d", location, 0x1Au);
    }

    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)location = 0;
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "EV routing is not supported", location, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -8, CFSTR("No results. EV Routing is not supported"));
    v9 = objc_claimAutoreleasedReturnValue();
    v4[2](v4, MEMORY[0x1E0C9AA60], v9);
LABEL_13:

    goto LABEL_14;
  }
  objc_initWeak((id *)location, self);
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__MapsSuggestionsVirtualGarage_entriesForUnpairedVehiclesWithHandler___block_invoke;
  v11[3] = &unk_1E4BCEB98;
  objc_copyWeak(&v13, (id *)location);
  v12 = v4;
  dispatch_async(queue, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)location);
LABEL_14:

  return v4 != 0;
}

void __70__MapsSuggestionsVirtualGarage_entriesForUnpairedVehiclesWithHandler___block_invoke(uint64_t a1)
{
  id *v2;
  _QWORD *WeakRetained;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
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
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  GEOFindOrCreateLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "Asking VGConnector for unpaired vehicles", buf, 2u);
    }

    v6 = (void *)WeakRetained[1];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __70__MapsSuggestionsVirtualGarage_entriesForUnpairedVehiclesWithHandler___block_invoke_99;
    v8[3] = &unk_1E4BCEDD8;
    objc_copyWeak(&v10, v2);
    v9 = *(id *)(a1 + 32);
    objc_msgSend(v6, "fetchUnpairedVehiclesWithHandler:", v8);

    objc_destroyWeak(&v10);
  }
  else
  {
    v7 = v4;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v12 = "MapsSuggestionsVirtualGarage.m";
      v13 = 1026;
      v14 = 146;
      v15 = 2082;
      v16 = "-[MapsSuggestionsVirtualGarage entriesForUnpairedVehiclesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __70__MapsSuggestionsVirtualGarage_entriesForUnpairedVehiclesWithHandler___block_invoke_99(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject **WeakRetained;
  NSObject **v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  _QWORD v12[4];
  NSObject *v13;
  id v14;
  NSObject **v15;
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
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained[3];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __70__MapsSuggestionsVirtualGarage_entriesForUnpairedVehiclesWithHandler___block_invoke_100;
    v12[3] = &unk_1E4BCEDB0;
    v13 = v6;
    v14 = v5;
    v10 = *(id *)(a1 + 32);
    v15 = v8;
    v16 = v10;
    dispatch_async(v9, v12);

    v11 = v13;
  }
  else
  {
    GEOFindOrCreateLog();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v18 = "MapsSuggestionsVirtualGarage.m";
      v19 = 1026;
      v20 = 150;
      v21 = 2082;
      v22 = "-[MapsSuggestionsVirtualGarage entriesForUnpairedVehiclesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __70__MapsSuggestionsVirtualGarage_entriesForUnpairedVehiclesWithHandler___block_invoke_100(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a1 + 32) && (v10 = *(void **)(a1 + 40)) != 0 && objc_msgSend(v10, "count"))
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v16 = v12;
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_DEBUG, "Received vehicles: %@", buf, 0xCu);
    }

    -[MapsSuggestionsVirtualGarage _q_entryForUnpairedVehicles:](*(_QWORD *)(a1 + 48), *(void **)(a1 + 40));
    v13 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v13;
    v3 = *(_QWORD *)(a1 + 56);
    if (v13)
    {
      v14 = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v3 + 16))(v3, v9, 0);
      goto LABEL_9;
    }
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v7 = CFSTR("No results. Entry is nil");
  }
  else
  {
    GEOFindOrCreateLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_ERROR, "VG returned no vehicles", buf, 2u);
    }

    v3 = *(_QWORD *)(a1 + 56);
    v4 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(*(id *)(a1 + 32), "localizedDescription");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
      v7 = (const __CFString *)v5;
    else
      v7 = CFSTR("No results. Number of vehicles is zero or there is some other error");
    v8 = v4;
  }
  objc_msgSend(v8, "GEOErrorWithCode:reason:", -8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, MEMORY[0x1E0C9AA60], v9);
LABEL_9:

}

- (void)openConnection
{
  NSObject *queue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__MapsSuggestionsVirtualGarage_openConnection__block_invoke;
  v4[3] = &unk_1E4BCDFF8;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __46__MapsSuggestionsVirtualGarage_openConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  _BYTE *v2;
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
    if (!*((_BYTE *)WeakRetained + 32))
    {
      objc_msgSend(*((id *)WeakRetained + 1), "openVGConnection");
      v2[32] = 1;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136446722;
      v5 = "MapsSuggestionsVirtualGarage.m";
      v6 = 1026;
      v7 = 178;
      v8 = 2082;
      v9 = "-[MapsSuggestionsVirtualGarage openConnection]_block_invoke";
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }

  }
}

- (void)closeConnection
{
  NSObject *queue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__MapsSuggestionsVirtualGarage_closeConnection__block_invoke;
  v4[3] = &unk_1E4BCDFF8;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __47__MapsSuggestionsVirtualGarage_closeConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  _BYTE *v2;
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
    if (*((_BYTE *)WeakRetained + 32))
    {
      objc_msgSend(*((id *)WeakRetained + 1), "closeVGConnection");
      v2[32] = 0;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136446722;
      v5 = "MapsSuggestionsVirtualGarage.m";
      v6 = 1026;
      v7 = 190;
      v8 = 2082;
      v9 = "-[MapsSuggestionsVirtualGarage closeConnection]_block_invoke";
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }

  }
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
  v6[2] = __49__MapsSuggestionsVirtualGarage_registerObserver___block_invoke;
  v6[3] = &unk_1E4BCEB28;
  objc_copyWeak(&v7, &location);
  -[MapsSuggestionsObservers registerObserver:handler:](observers, "registerObserver:handler:", v4, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __49__MapsSuggestionsVirtualGarage_registerObserver___block_invoke(uint64_t a1, int a2)
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
      objc_msgSend(WeakRetained[1], "startObservingVG");
    }
    else
    {
      GEOFindOrCreateLog();
      v4 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = 136446722;
        v6 = "MapsSuggestionsVirtualGarage.m";
        v7 = 1026;
        v8 = 203;
        v9 = 2082;
        v10 = "-[MapsSuggestionsVirtualGarage registerObserver:]_block_invoke";
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
  v6[2] = __51__MapsSuggestionsVirtualGarage_unregisterObserver___block_invoke;
  v6[3] = &unk_1E4BCEB28;
  objc_copyWeak(&v7, &location);
  -[MapsSuggestionsObservers unregisterObserver:handler:](observers, "unregisterObserver:handler:", v4, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __51__MapsSuggestionsVirtualGarage_unregisterObserver___block_invoke(uint64_t a1, int a2)
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
      objc_msgSend(WeakRetained[1], "stopObservingVG");
    }
    else
    {
      GEOFindOrCreateLog();
      v4 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = 136446722;
        v6 = "MapsSuggestionsVirtualGarage.m";
        v7 = 1026;
        v8 = 214;
        v9 = 2082;
        v10 = "-[MapsSuggestionsVirtualGarage unregisterObserver:]_block_invoke";
        _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
      }

    }
  }
}

- (void)virtualGarageDidUpdateUnpairedVehicles:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__MapsSuggestionsVirtualGarage_virtualGarageDidUpdateUnpairedVehicles___block_invoke;
  block[3] = &unk_1E4BCEE28;
  v8 = v4;
  v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(queue, block);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

void __71__MapsSuggestionsVirtualGarage_virtualGarageDidUpdateUnpairedVehicles___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *WeakRetained;
  NSObject *v4;
  void *v5;
  Class isa;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  char v10;
  NSObject *v11;
  _QWORD v12[4];
  NSObject *v13;
  uint8_t buf[4];
  _BYTE v15[10];
  _BYTE v16[6];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = IsEVRoutingSupported();
  if (v2 && MapsFeature_IsEnabled_EVRouting() && (GEOConfigGetBOOL() & 1) != 0)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "count"))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      v4 = WeakRetained;
      if (WeakRetained)
      {
        -[MapsSuggestionsVirtualGarage _q_entryForUnpairedVehicles:]((uint64_t)WeakRetained, *(void **)(a1 + 32));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v5)
        {
          v7 = 0;
          goto LABEL_25;
        }
        isa = v4[2].isa;
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __71__MapsSuggestionsVirtualGarage_virtualGarageDidUpdateUnpairedVehicles___block_invoke_109;
        v12[3] = &unk_1E4BCEE00;
        v7 = v5;
        v13 = v7;
        -[objc_class callBlock:](isa, "callBlock:", v12);
        v8 = v13;
      }
      else
      {
        GEOFindOrCreateLog();
        v8 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          *(_QWORD *)v15 = "MapsSuggestionsVirtualGarage.m";
          *(_WORD *)&v15[8] = 1026;
          *(_DWORD *)v16 = 240;
          *(_WORD *)&v16[4] = 2082;
          v17 = "-[MapsSuggestionsVirtualGarage virtualGarageDidUpdateUnpairedVehicles:]_block_invoke";
          _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
        }
        v7 = v8;
      }

LABEL_25:
LABEL_26:

      return;
    }
    v10 = 1;
  }
  else
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)v15 = 0;
      *(_WORD *)&v15[4] = 1024;
      *(_DWORD *)&v15[6] = v2;
      *(_WORD *)v16 = 1024;
      *(_DWORD *)&v16[2] = MapsFeature_IsEnabled_EVRouting();
      LOWORD(v17) = 1024;
      *(_DWORD *)((char *)&v17 + 2) = GEOConfigGetBOOL();
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_DEBUG, "_isEVRoutingSupported is %d because: CountrySupportsEVRouting: %d, FeatureEnabled: %d, SourceEnabled: %d", buf, 0x1Au);
    }

    v10 = 0;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    if ((v10 & 1) != 0)
      return;
LABEL_17:
    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "EV Routing was not supported after destinationd spun", buf, 2u);
    }
    goto LABEL_26;
  }
  GEOFindOrCreateLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_DEBUG, "Received no unpaired vehicles from VirtualGarage", buf, 2u);
  }

  if ((v10 & 1) == 0)
    goto LABEL_17;
}

void __71__MapsSuggestionsVirtualGarage_virtualGarageDidUpdateUnpairedVehicles___block_invoke_109(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0C99D20];
  v3 = a2;
  objc_msgSend(v2, "arrayWithObjects:count:", &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unpairedVehiclesChangedInVirtualGarage:", v4, v5, v6);

}

- (void)stateOfChargeForVehicleWithIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78__MapsSuggestionsVirtualGarage_stateOfChargeForVehicleWithIdentifier_handler___block_invoke;
  v11[3] = &unk_1E4BCEA10;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __78__MapsSuggestionsVirtualGarage_stateOfChargeForVehicleWithIdentifier_handler___block_invoke(uint64_t a1)
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
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[1], "fetchStateOfChargeForVehicleWithIdentifier:handler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136446722;
      v6 = "MapsSuggestionsVirtualGarage.m";
      v7 = 1026;
      v8 = 257;
      v9 = 2082;
      v10 = "-[MapsSuggestionsVirtualGarage stateOfChargeForVehicleWithIdentifier:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_connector, 0);
}

@end
