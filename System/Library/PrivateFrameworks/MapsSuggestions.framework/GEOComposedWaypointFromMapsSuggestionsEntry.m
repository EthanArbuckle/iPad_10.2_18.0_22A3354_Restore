@implementation GEOComposedWaypointFromMapsSuggestionsEntry

void __GEOComposedWaypointFromMapsSuggestionsEntry_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void (*v7)(void);
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!a2 || v5)
  {
    if (objc_msgSend(v5, "code") == -8
      && (objc_msgSend(v6, "domain"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          GEOErrorDomain(),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v8, "isEqualToString:", v9),
          v9,
          v8,
          v10))
    {
      GEOFindOrCreateLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_DEBUG, "No ETA/Route available", (uint8_t *)&v14, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "setBoolean:forKey:", 1, CFSTR("MapsSuggestionsRoutingNotAvailableKey"));
      objc_msgSend(*(id *)(a1 + 32), "setBoolean:forKey:", 0, CFSTR("MapsSuggestionsNeedsETATrackingKey"));
    }
    else
    {
      GEOFindOrCreateLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "geoMapItem");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138478083;
        v15 = v13;
        v16 = 2113;
        v17 = v6;
        _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "Could not get waypoint for %{private}@: %{private}@", (uint8_t *)&v14, 0x16u);

      }
    }
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v7();

}

void __GEOComposedWaypointFromMapsSuggestionsEntry_block_invoke_89(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void (*v7)(void);
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!a2 || v5)
  {
    if (objc_msgSend(v5, "code") == -8
      && (objc_msgSend(v6, "domain"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          GEOErrorDomain(),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v8, "isEqualToString:", v9),
          v9,
          v8,
          v10))
    {
      GEOFindOrCreateLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_DEBUG, "No ETA/Route available", (uint8_t *)&v14, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "setBoolean:forKey:", 1, CFSTR("MapsSuggestionsRoutingNotAvailableKey"));
      objc_msgSend(*(id *)(a1 + 32), "setBoolean:forKey:", 0, CFSTR("MapsSuggestionsNeedsETATrackingKey"));
    }
    else
    {
      GEOFindOrCreateLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = *(_QWORD *)(a1 + 40);
        v14 = 138478083;
        v15 = v13;
        v16 = 2113;
        v17 = v6;
        _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "Could not get waypoint for %{private}@: %{private}@", (uint8_t *)&v14, 0x16u);
      }

    }
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v7();

}

void __GEOComposedWaypointFromMapsSuggestionsEntry_block_invoke_90(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void (*v7)(void);
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!a2 || v5)
  {
    if (objc_msgSend(v5, "code") == -8
      && (objc_msgSend(v6, "domain"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          GEOErrorDomain(),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v8, "isEqualToString:", v9),
          v9,
          v8,
          v10))
    {
      GEOFindOrCreateLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_DEBUG, "No ETA/Route available", (uint8_t *)&v14, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "setBoolean:forKey:", 1, CFSTR("MapsSuggestionsRoutingNotAvailableKey"));
      objc_msgSend(*(id *)(a1 + 32), "setBoolean:forKey:", 0, CFSTR("MapsSuggestionsNeedsETATrackingKey"));
    }
    else
    {
      GEOFindOrCreateLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = *(_QWORD *)(a1 + 40);
        v14 = 138478083;
        v15 = v13;
        v16 = 2113;
        v17 = v6;
        _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "Could not get waypoint for %{private}@: %{private}@", (uint8_t *)&v14, 0x16u);
      }

    }
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v7();

}

@end
