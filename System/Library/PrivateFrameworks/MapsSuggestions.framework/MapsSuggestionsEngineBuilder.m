@implementation MapsSuggestionsEngineBuilder

- (MapsSuggestionsEngineBuilder)init
{
  NSObject *v3;
  MapsSuggestionsEngineBuilder *v4;
  MapsSuggestionsSelfBuildingResourceDepot *v5;
  MapsSuggestionsFullResourceDepot *resourceDepot;
  objc_super v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "Aug 12 2024";
    v11 = 2080;
    v12 = "21:25:19";
    _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_INFO, "Using MapsSuggestionsEngine built on %s %s", buf, 0x16u);
  }

  v8.receiver = self;
  v8.super_class = (Class)MapsSuggestionsEngineBuilder;
  v4 = -[MapsSuggestionsEngineBuilder init](&v8, sel_init);
  if (v4)
  {
    v5 = -[MapsSuggestionsSelfBuildingResourceDepot initWithName:]([MapsSuggestionsSelfBuildingResourceDepot alloc], "initWithName:", CFSTR("EngineBuilderResourceDepot"));
    resourceDepot = v4->_resourceDepot;
    v4->_resourceDepot = (MapsSuggestionsFullResourceDepot *)v5;

  }
  return v4;
}

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "description");
}

+ (id)forDevice
{
  MapsSuggestionsDefaultTitleFormatter *v2;
  MapsSuggestionsHomeWorkTitleFormatter *v3;
  MapsSuggestionsFrequentLocationTitleFormatter *v4;
  MapsSuggestionsResumeRouteTitleFormatter *v5;
  MapsSuggestionsParkedCarTitleFormatter *v6;
  MapsSuggestionsCarRentalTitleFormatter *v7;
  MapsSuggestionsFlightTitleFormatter *v8;
  MapsSuggestionsOrderStatusTitleFormatter *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  MapsSuggestionsHotelTitleFormatter *v15;
  MapsSuggestionsEngineBuilder *v16;
  _QWORD v17[12];
  uint64_t v18;
  uint64_t v19;
  MapsSuggestionsFrequentLocationTitleFormatter *v20;
  MapsSuggestionsDefaultTitleFormatter *v21;
  MapsSuggestionsOrderStatusTitleFormatter *v22;
  MapsSuggestionsResumeRouteTitleFormatter *v23;
  MapsSuggestionsParkedCarTitleFormatter *v24;
  MapsSuggestionsHotelTitleFormatter *v25;
  MapsSuggestionsCarRentalTitleFormatter *v26;
  MapsSuggestionsFlightTitleFormatter *v27;
  MapsSuggestionsDefaultTitleFormatter *v28;
  MapsSuggestionsDefaultTitleFormatter *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v16 = objc_alloc_init(MapsSuggestionsEngineBuilder);
  -[MapsSuggestionsEngineBuilder setLocationUpdater:](v16, "setLocationUpdater:", 0);
  -[MapsSuggestionsEngineBuilder setHasTracker:](v16, "setHasTracker:", 1);
  v2 = objc_alloc_init(MapsSuggestionsDefaultTitleFormatter);
  v3 = objc_alloc_init(MapsSuggestionsHomeWorkTitleFormatter);
  v15 = objc_alloc_init(MapsSuggestionsHotelTitleFormatter);
  v4 = objc_alloc_init(MapsSuggestionsFrequentLocationTitleFormatter);
  v5 = objc_alloc_init(MapsSuggestionsResumeRouteTitleFormatter);
  v6 = objc_alloc_init(MapsSuggestionsParkedCarTitleFormatter);
  v7 = objc_alloc_init(MapsSuggestionsCarRentalTitleFormatter);
  v8 = objc_alloc_init(MapsSuggestionsFlightTitleFormatter);
  v9 = objc_alloc_init(MapsSuggestionsOrderStatusTitleFormatter);
  v17[0] = &unk_1E4C09D28;
  v17[1] = &unk_1E4C09D40;
  v18 = (uint64_t)v3;
  v19 = (uint64_t)v3;
  v17[2] = &unk_1E4C09D58;
  v17[3] = &unk_1E4C09D70;
  v20 = v4;
  v21 = v2;
  v17[4] = &unk_1E4C09D88;
  v17[5] = &unk_1E4C09DA0;
  v22 = v9;
  v23 = v5;
  v17[6] = &unk_1E4C09DB8;
  v17[7] = &unk_1E4C09DD0;
  v24 = v6;
  v25 = v15;
  v17[8] = &unk_1E4C09DE8;
  v17[9] = &unk_1E4C09E00;
  v26 = v7;
  v27 = v8;
  v17[10] = &unk_1E4C09E18;
  v17[11] = &unk_1E4C09E30;
  v28 = v2;
  v29 = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, v17, 12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  -[MapsSuggestionsEngineBuilder setTitleFormatters:](v16, "setTitleFormatters:", v11);
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");
  -[MapsSuggestionsEngineBuilder setSourceClasses:](v16, "setSourceClasses:", v13);

  return v16;
}

- (id)withResourceDepot:(id)a3
{
  -[MapsSuggestionsEngineBuilder setResourceDepot:](self, "setResourceDepot:", a3);
  return self;
}

- (id)withLocationUpdater:(id)a3
{
  -[MapsSuggestionsEngineBuilder setLocationUpdater:](self, "setLocationUpdater:", a3);
  return self;
}

- (id)withoutTracker
{
  -[MapsSuggestionsEngineBuilder setHasTracker:](self, "setHasTracker:", 0);
  return self;
}

- (id)withFavorites
{
  void *v3;
  char v4;
  void *v5;

  -[MapsSuggestionsEngineBuilder sourceClasses](self, "sourceClasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", objc_opt_class());

  if ((v4 & 1) == 0)
  {
    -[MapsSuggestionsEngineBuilder sourceClasses](self, "sourceClasses");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", objc_opt_class());

  }
  return self;
}

- (id)withPreFilters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MapsSuggestionsEngineBuilder includePreFilters](self, "includePreFilters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v4, "count"));
    -[MapsSuggestionsEngineBuilder setIncludePreFilters:](self, "setIncludePreFilters:", v6);

  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10);
        -[MapsSuggestionsEngineBuilder includePreFilters](self, "includePreFilters", (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "containsObject:", v11);

        if ((v13 & 1) == 0)
        {
          -[MapsSuggestionsEngineBuilder includePreFilters](self, "includePreFilters");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v11);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  -[MapsSuggestionsEngineBuilder excludePreFilters](self, "excludePreFilters");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "minusSet:", v7);

  return self;
}

- (id)withPostFilters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MapsSuggestionsEngineBuilder includePostFilters](self, "includePostFilters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v4, "count"));
    -[MapsSuggestionsEngineBuilder setIncludePostFilters:](self, "setIncludePostFilters:", v6);

  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10);
        -[MapsSuggestionsEngineBuilder includePostFilters](self, "includePostFilters", (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "containsObject:", v11);

        if ((v13 & 1) == 0)
        {
          -[MapsSuggestionsEngineBuilder includePostFilters](self, "includePostFilters");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v11);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  -[MapsSuggestionsEngineBuilder excludePostFilters](self, "excludePostFilters");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "minusSet:", v7);

  return self;
}

- (id)withImprovers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MapsSuggestionsEngineBuilder includeImprovers](self, "includeImprovers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    -[MapsSuggestionsEngineBuilder setIncludeImprovers:](self, "setIncludeImprovers:", v6);

  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10);
        -[MapsSuggestionsEngineBuilder includeImprovers](self, "includeImprovers", (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "containsObject:", v11);

        if ((v13 & 1) == 0)
        {
          -[MapsSuggestionsEngineBuilder includeImprovers](self, "includeImprovers");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v11);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  -[MapsSuggestionsEngineBuilder excludeImprovers](self, "excludeImprovers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeObjectsInArray:", v7);

  return self;
}

- (id)withoutPreFilters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MapsSuggestionsEngineBuilder excludePreFilters](self, "excludePreFilters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v4, "count"));
    -[MapsSuggestionsEngineBuilder setExcludePreFilters:](self, "setExcludePreFilters:", v6);

  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10);
        -[MapsSuggestionsEngineBuilder excludePreFilters](self, "excludePreFilters", (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "containsObject:", v11);

        if ((v13 & 1) == 0)
        {
          -[MapsSuggestionsEngineBuilder excludePreFilters](self, "excludePreFilters");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v11);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  -[MapsSuggestionsEngineBuilder includePreFilters](self, "includePreFilters");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "minusSet:", v7);

  return self;
}

- (id)withDedupers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MapsSuggestionsEngineBuilder includeDedupers](self, "includeDedupers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    -[MapsSuggestionsEngineBuilder setIncludeDedupers:](self, "setIncludeDedupers:", v6);

  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10);
        -[MapsSuggestionsEngineBuilder includeDedupers](self, "includeDedupers", (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "containsObject:", v11);

        if ((v13 & 1) == 0)
        {
          -[MapsSuggestionsEngineBuilder includeDedupers](self, "includeDedupers");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v11);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  -[MapsSuggestionsEngineBuilder excludeDedupers](self, "excludeDedupers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeObjectsInArray:", v7);

  return self;
}

- (id)withSourceClasses:(id)a3
{
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v5)
  {
    v7 = *(_QWORD *)v17;
    *(_QWORD *)&v6 = 138412290;
    v15 = v6;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v8);
        -[MapsSuggestionsEngineBuilder sourceClasses](self, "sourceClasses", v15, (_QWORD)v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "containsObject:", v9);

        if (v11)
        {
          GEOFindOrCreateLog();
          v12 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v9, "description");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v15;
            v21 = v13;
            _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_DEBUG, "Engine already contains source %@", buf, 0xCu);

          }
        }
        else
        {
          if (!v4)
            goto LABEL_13;
          -[MapsSuggestionsEngineBuilder sourceClasses](self, "sourceClasses");
          v12 = objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](v12, "addObject:", v9);
        }

LABEL_13:
        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v5);
  }

  return self;
}

- (id)withTitleFormatter:(id)a3 forType:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  MapsSuggestionsEngineBuilder *v11;
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
  v6 = a3;
  v7 = v6;
  if (!v6)
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v13 = 136446978;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEngineBuilder.mm";
      v15 = 1024;
      v16 = 488;
      v17 = 2082;
      v18 = "-[MapsSuggestionsEngineBuilder withTitleFormatter:forType:]";
      v19 = 2082;
      v20 = "nil == (titleFormatter)";
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a title formatter", (uint8_t *)&v13, 0x26u);
    }
    goto LABEL_10;
  }
  if ((objc_msgSend(v6, "conformsToProtocol:", &unk_1EE71BFF8) & 1) == 0
    && (objc_msgSend(v7, "conformsToProtocol:", &unk_1EE71D9F0) & 1) == 0)
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v13 = 136446978;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEngineBuilder.mm";
      v15 = 1024;
      v16 = 491;
      v17 = 2082;
      v18 = "-[MapsSuggestionsEngineBuilder withTitleFormatter:forType:]";
      v19 = 2082;
      v20 = "! [titleFormatter conformsToProtocol:@protocol(MapsSuggestionsETATitleFormatter)] && ! [titleFormatter confo"
            "rmsToProtocol:@protocol(MapsSuggestionsDistanceTitleFormatter)]";
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an ETA and/or Distance title formatter", (uint8_t *)&v13, 0x26u);
    }
LABEL_10:

    goto LABEL_11;
  }
  -[MapsSuggestionsEngineBuilder titleFormatters](self, "titleFormatters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

LABEL_11:
  v11 = self;

  return v11;
}

- (id)build
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  MapsSuggestionsSimpleStrategy *v6;
  MapsSuggestionsUnknownFilter *v7;
  MapsSuggestionsServerSideFilter *v8;
  MapsSuggestionsTooFewVisitsFilter *v9;
  MapsSuggestionsNoAddressFilter *v10;
  MapsSuggestionsAppConnectionFilter *v11;
  MapsSuggestionsExpiredFilter *v12;
  MapsSuggestionsCoarseLocationFilter *v13;
  MapsSuggestionsFlightDeparturesOnlyFilter *v14;
  MapsSuggestionsFlightTooFarFilter *v15;
  MapsSuggestionsAppConnectionImprover *v16;
  MapsSuggestionsSinkRankImprover *v17;
  MapsSuggestionsDeleteSupportImprover *v18;
  MapsSuggestionsHomeWorkImprover *v19;
  MapsSuggestionsFavoritesImprover *v20;
  MapsSuggestionsResumeRouteImprover *v21;
  MapsSuggestionsCalendarEventImprover *v22;
  MapsSuggestionsFrequentLocationImprover *v23;
  MapsSuggestionsParkedCarImprover *v24;
  MapsSuggestionsReservationImprover *v25;
  MapsSuggestionsLockscreenImprover *v26;
  MapsSuggestionsHotelImprover *v27;
  MapsSuggestionsCarRentalImprover *v28;
  MapsSuggestionsTravelFlightImprover *v29;
  MapsSuggestionsTicketedEventImprover *v30;
  MapsSuggestionsRecentHistoryImprover *v31;
  MapsSuggestionsPortraitImprover *v32;
  MapsSuggestionsPinnedPlaceImprover *v33;
  MapsSuggestionsVirtualGarageImprover *v34;
  MapsSuggestionsRatingRequestImprover *v35;
  _TtC15MapsSuggestions38MapsSuggestionsContactActivityImprover *v36;
  MapsSuggestionsOrderStatusImprover *v37;
  MapsSuggestionsShortcutDeduper *v38;
  MapsSuggestionsOrderStatusDeduper *v39;
  _TtC15MapsSuggestions37MapsSuggestionsContactActivityDeduper *v40;
  MapsSuggestionsUniqueIdentifierDeduper *v41;
  MapsSuggestionsUniqueIdentifierDeduper *v42;
  MapsSuggestionsUniqueIdentifierDeduper *v43;
  MapsSuggestionsUniqueIdentifierDeduper *v44;
  MapsSuggestionsUniqueIdentifierDeduper *v45;
  MapsSuggestionsUniqueIdentifierDeduper *v46;
  MapsSuggestionsUniqueIdentifierDeduper *v47;
  MapsSuggestionsUniqueIdentifierDeduper *v48;
  MapsSuggestionsUniqueIdentifierDeduper *v49;
  MapsSuggestionsShortcutAtMapItemDeduper *v50;
  _QWORD *v51;
  MapsSuggestionsShortcutAtMapItemDeduper *v52;
  MapsSuggestionsSameRidesharingRideDeduper *v53;
  MapsSuggestionsHomeWorkSchoolDeduper *v54;
  MapsSuggestionsFrequentLocationDeduper *v55;
  MapsSuggestionsParkedCarDeduper *v56;
  MapsSuggestionsRecentHistoryDeduper *v57;
  MapsSuggestionsAppConnectionDeduper *v58;
  MapsSuggestionsAppConnectionAndRecentsDeduper *v59;
  MapsSuggestionsRideBookingAppConnectionDeduper *v60;
  MapsSuggestionsCalendarEventDeduper *v61;
  MapsSuggestionsReservationDeduper *v62;
  MapsSuggestionsResumeRouteDeduper *v63;
  MapsSuggestionsResumeRouteAndRestaurantDeduper *v64;
  MapsSuggestionsUniqueIdentifierDeduper *v65;
  MapsSuggestionsUniqueIdentifierDeduper *v66;
  MapsSuggestionsUniqueIdentifierDeduper *v67;
  MapsSuggestionsFlightDeduper *v68;
  MapsSuggestionsVehicleSetupResumeRouteDeduper *v69;
  MapsSuggestionsUniqueIdentifierDeduper *v70;
  MapsSuggestionsUniqueIdentifierDeduper *v71;
  MapsSuggestionsGEOMapItemDeduper *v72;
  MapsSuggestionsGEOMapItemDeduper *v73;
  MapsSuggestionsGEOMapItemDeduper *v74;
  MapsSuggestionsGEOMapItemDeduper *v75;
  MapsSuggestionsGEOMapItemDeduper *v76;
  MapsSuggestionsGEOMapItemDeduper *v77;
  MapsSuggestionsGEOMapItemDeduper *v78;
  MapsSuggestionsGEOMapItemDeduper *v79;
  MapsSuggestionsGEOMapItemDeduper *v80;
  MapsSuggestionsDeletedFilter *v81;
  MapsSuggestionsTooEarlyFilter *v82;
  MapsSuggestionsNoTitleFilter *v83;
  MapsSuggestionsAlreadyThereFilter *v84;
  MapsSuggestionsTooFarFilter *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t i;
  uint64_t v90;
  void *v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t j;
  uint64_t v96;
  void *v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t k;
  uint64_t v102;
  void *v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t m;
  uint64_t v108;
  void *v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t n;
  uint64_t v114;
  void *v115;
  void *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t ii;
  uint64_t v120;
  void *v121;
  void *v122;
  _BOOL4 v123;
  MapsSuggestionsDefaultLocationUpdater *v124;
  MapsSuggestionsETARequirements *v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  MapsSuggestionsManager *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  MapsSuggestionsManager *v140;
  void *v141;
  void *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t jj;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  uint64_t v150;
  NSObject *p_super;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  id v155;
  void *v156;
  void *v157;
  NSObject *v158;
  NSObject *v159;
  void *v160;
  MapsSuggestionsEngine *v161;
  void *v162;
  MapsSuggestionsEngine *v163;
  NSObject *v164;
  MapsSuggestionsETARequirements *v166;
  MapsSuggestionsManager *v167;
  id obj;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  _BYTE buf[28];
  __int16 v202;
  const char *v203;
  _BYTE v204[128];
  _BYTE v205[128];
  _BYTE v206[128];
  _BYTE v207[128];
  _BYTE v208[128];
  _BYTE v209[128];
  _BYTE v210[128];
  _BYTE v211[128];
  uint64_t v212;

  v212 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsEngineBuilder uniqueName](self, "uniqueName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v4;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "MapsSuggestionsEngineBuilding";
    _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

  }
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MapsSuggestionsEngineBuilding", ", buf, 2u);
  }

  v6 = objc_alloc_init(MapsSuggestionsSimpleStrategy);
  v7 = objc_alloc_init(MapsSuggestionsUnknownFilter);
  -[MapsSuggestionsSimpleStrategy addPreFilter:](v6, "addPreFilter:", v7);

  v8 = objc_alloc_init(MapsSuggestionsServerSideFilter);
  -[MapsSuggestionsSimpleStrategy addPreFilter:](v6, "addPreFilter:", v8);

  v9 = objc_alloc_init(MapsSuggestionsTooFewVisitsFilter);
  -[MapsSuggestionsSimpleStrategy addPreFilter:](v6, "addPreFilter:", v9);

  v10 = objc_alloc_init(MapsSuggestionsNoAddressFilter);
  -[MapsSuggestionsSimpleStrategy addPreFilter:](v6, "addPreFilter:", v10);

  v11 = objc_alloc_init(MapsSuggestionsAppConnectionFilter);
  -[MapsSuggestionsSimpleStrategy addPreFilter:](v6, "addPreFilter:", v11);

  v12 = objc_alloc_init(MapsSuggestionsExpiredFilter);
  -[MapsSuggestionsSimpleStrategy addPreFilter:](v6, "addPreFilter:", v12);

  v13 = objc_alloc_init(MapsSuggestionsCoarseLocationFilter);
  -[MapsSuggestionsSimpleStrategy addPreFilter:](v6, "addPreFilter:", v13);

  v14 = objc_alloc_init(MapsSuggestionsFlightDeparturesOnlyFilter);
  -[MapsSuggestionsSimpleStrategy addPreFilter:](v6, "addPreFilter:", v14);

  v15 = objc_alloc_init(MapsSuggestionsFlightTooFarFilter);
  -[MapsSuggestionsSimpleStrategy addPreFilter:](v6, "addPreFilter:", v15);

  v16 = objc_alloc_init(MapsSuggestionsAppConnectionImprover);
  -[MapsSuggestionsSimpleStrategy addImprover:](v6, "addImprover:", v16);

  v17 = objc_alloc_init(MapsSuggestionsSinkRankImprover);
  -[MapsSuggestionsSimpleStrategy addImprover:](v6, "addImprover:", v17);

  v18 = objc_alloc_init(MapsSuggestionsDeleteSupportImprover);
  -[MapsSuggestionsSimpleStrategy addImprover:](v6, "addImprover:", v18);

  v19 = objc_alloc_init(MapsSuggestionsHomeWorkImprover);
  -[MapsSuggestionsSimpleStrategy addImprover:](v6, "addImprover:", v19);

  v20 = objc_alloc_init(MapsSuggestionsFavoritesImprover);
  -[MapsSuggestionsSimpleStrategy addImprover:](v6, "addImprover:", v20);

  v21 = objc_alloc_init(MapsSuggestionsResumeRouteImprover);
  -[MapsSuggestionsSimpleStrategy addImprover:](v6, "addImprover:", v21);

  v22 = objc_alloc_init(MapsSuggestionsCalendarEventImprover);
  -[MapsSuggestionsSimpleStrategy addImprover:](v6, "addImprover:", v22);

  v23 = objc_alloc_init(MapsSuggestionsFrequentLocationImprover);
  -[MapsSuggestionsSimpleStrategy addImprover:](v6, "addImprover:", v23);

  v24 = objc_alloc_init(MapsSuggestionsParkedCarImprover);
  -[MapsSuggestionsSimpleStrategy addImprover:](v6, "addImprover:", v24);

  v25 = objc_alloc_init(MapsSuggestionsReservationImprover);
  -[MapsSuggestionsSimpleStrategy addImprover:](v6, "addImprover:", v25);

  v26 = objc_alloc_init(MapsSuggestionsLockscreenImprover);
  -[MapsSuggestionsSimpleStrategy addImprover:](v6, "addImprover:", v26);

  v27 = objc_alloc_init(MapsSuggestionsHotelImprover);
  -[MapsSuggestionsSimpleStrategy addImprover:](v6, "addImprover:", v27);

  v28 = objc_alloc_init(MapsSuggestionsCarRentalImprover);
  -[MapsSuggestionsSimpleStrategy addImprover:](v6, "addImprover:", v28);

  v29 = objc_alloc_init(MapsSuggestionsTravelFlightImprover);
  -[MapsSuggestionsSimpleStrategy addImprover:](v6, "addImprover:", v29);

  v30 = objc_alloc_init(MapsSuggestionsTicketedEventImprover);
  -[MapsSuggestionsSimpleStrategy addImprover:](v6, "addImprover:", v30);

  v31 = objc_alloc_init(MapsSuggestionsRecentHistoryImprover);
  -[MapsSuggestionsSimpleStrategy addImprover:](v6, "addImprover:", v31);

  v32 = objc_alloc_init(MapsSuggestionsPortraitImprover);
  -[MapsSuggestionsSimpleStrategy addImprover:](v6, "addImprover:", v32);

  v33 = objc_alloc_init(MapsSuggestionsPinnedPlaceImprover);
  -[MapsSuggestionsSimpleStrategy addImprover:](v6, "addImprover:", v33);

  v34 = objc_alloc_init(MapsSuggestionsVirtualGarageImprover);
  -[MapsSuggestionsSimpleStrategy addImprover:](v6, "addImprover:", v34);

  v35 = objc_alloc_init(MapsSuggestionsRatingRequestImprover);
  -[MapsSuggestionsSimpleStrategy addImprover:](v6, "addImprover:", v35);

  v36 = objc_alloc_init(_TtC15MapsSuggestions38MapsSuggestionsContactActivityImprover);
  -[MapsSuggestionsSimpleStrategy addImprover:](v6, "addImprover:", v36);

  v37 = objc_alloc_init(MapsSuggestionsOrderStatusImprover);
  -[MapsSuggestionsSimpleStrategy addImprover:](v6, "addImprover:", v37);

  v38 = objc_alloc_init(MapsSuggestionsShortcutDeduper);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v6, "addDeduper:", v38);

  v39 = objc_alloc_init(MapsSuggestionsOrderStatusDeduper);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v6, "addDeduper:", v39);

  v40 = objc_alloc_init(_TtC15MapsSuggestions37MapsSuggestionsContactActivityDeduper);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v6, "addDeduper:", v40);

  v41 = -[MapsSuggestionsUniqueIdentifierDeduper initWithType:]([MapsSuggestionsUniqueIdentifierDeduper alloc], "initWithType:", 1);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v6, "addDeduper:", v41);

  v42 = -[MapsSuggestionsUniqueIdentifierDeduper initWithType:]([MapsSuggestionsUniqueIdentifierDeduper alloc], "initWithType:", 2);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v6, "addDeduper:", v42);

  v43 = -[MapsSuggestionsUniqueIdentifierDeduper initWithType:]([MapsSuggestionsUniqueIdentifierDeduper alloc], "initWithType:", 19);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v6, "addDeduper:", v43);

  v44 = -[MapsSuggestionsUniqueIdentifierDeduper initWithType:]([MapsSuggestionsUniqueIdentifierDeduper alloc], "initWithType:", 17);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v6, "addDeduper:", v44);

  v45 = -[MapsSuggestionsUniqueIdentifierDeduper initWithType:]([MapsSuggestionsUniqueIdentifierDeduper alloc], "initWithType:", 8);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v6, "addDeduper:", v45);

  v46 = -[MapsSuggestionsUniqueIdentifierDeduper initWithType:]([MapsSuggestionsUniqueIdentifierDeduper alloc], "initWithType:", 20);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v6, "addDeduper:", v46);

  v47 = -[MapsSuggestionsUniqueIdentifierDeduper initWithType:]([MapsSuggestionsUniqueIdentifierDeduper alloc], "initWithType:", 21);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v6, "addDeduper:", v47);

  v48 = -[MapsSuggestionsUniqueIdentifierDeduper initWithType:]([MapsSuggestionsUniqueIdentifierDeduper alloc], "initWithType:", 22);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v6, "addDeduper:", v48);

  v49 = -[MapsSuggestionsUniqueIdentifierDeduper initWithType:]([MapsSuggestionsUniqueIdentifierDeduper alloc], "initWithType:", 24);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v6, "addDeduper:", v49);

  v50 = [MapsSuggestionsShortcutAtMapItemDeduper alloc];
  v51 = operator new(0x18uLL);
  *(_QWORD *)&buf[16] = v51 + 3;
  v51[2] = 12;
  *(_OWORD *)v51 = xmmword_1A43B3798;
  *(_QWORD *)buf = v51;
  *(_QWORD *)&buf[8] = v51 + 3;
  v52 = -[MapsSuggestionsShortcutAtMapItemDeduper initWithSacrificedTypes:](v50, "initWithSacrificedTypes:", buf);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v6, "addDeduper:", v52);

  if (*(_QWORD *)buf)
  {
    *(_QWORD *)&buf[8] = *(_QWORD *)buf;
    operator delete(*(void **)buf);
  }
  v53 = objc_alloc_init(MapsSuggestionsSameRidesharingRideDeduper);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v6, "addDeduper:", v53);

  v54 = objc_alloc_init(MapsSuggestionsHomeWorkSchoolDeduper);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v6, "addDeduper:", v54);

  v55 = objc_alloc_init(MapsSuggestionsFrequentLocationDeduper);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v6, "addDeduper:", v55);

  v56 = objc_alloc_init(MapsSuggestionsParkedCarDeduper);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v6, "addDeduper:", v56);

  v57 = objc_alloc_init(MapsSuggestionsRecentHistoryDeduper);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v6, "addDeduper:", v57);

  v58 = objc_alloc_init(MapsSuggestionsAppConnectionDeduper);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v6, "addDeduper:", v58);

  v59 = objc_alloc_init(MapsSuggestionsAppConnectionAndRecentsDeduper);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v6, "addDeduper:", v59);

  v60 = objc_alloc_init(MapsSuggestionsRideBookingAppConnectionDeduper);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v6, "addDeduper:", v60);

  v61 = objc_alloc_init(MapsSuggestionsCalendarEventDeduper);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v6, "addDeduper:", v61);

  v62 = objc_alloc_init(MapsSuggestionsReservationDeduper);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v6, "addDeduper:", v62);

  v63 = objc_alloc_init(MapsSuggestionsResumeRouteDeduper);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v6, "addDeduper:", v63);

  v64 = objc_alloc_init(MapsSuggestionsResumeRouteAndRestaurantDeduper);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v6, "addDeduper:", v64);

  v65 = -[MapsSuggestionsUniqueIdentifierDeduper initWithType:]([MapsSuggestionsUniqueIdentifierDeduper alloc], "initWithType:", 10);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v6, "addDeduper:", v65);

  v66 = -[MapsSuggestionsUniqueIdentifierDeduper initWithType:]([MapsSuggestionsUniqueIdentifierDeduper alloc], "initWithType:", 6);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v6, "addDeduper:", v66);

  v67 = -[MapsSuggestionsUniqueIdentifierDeduper initWithType:]([MapsSuggestionsUniqueIdentifierDeduper alloc], "initWithType:", 13);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v6, "addDeduper:", v67);

  v68 = objc_alloc_init(MapsSuggestionsFlightDeduper);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v6, "addDeduper:", v68);

  v69 = objc_alloc_init(MapsSuggestionsVehicleSetupResumeRouteDeduper);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v6, "addDeduper:", v69);

  v70 = -[MapsSuggestionsUniqueIdentifierDeduper initWithType:]([MapsSuggestionsUniqueIdentifierDeduper alloc], "initWithType:", 14);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v6, "addDeduper:", v70);

  v71 = -[MapsSuggestionsUniqueIdentifierDeduper initWithType:]([MapsSuggestionsUniqueIdentifierDeduper alloc], "initWithType:", 16);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v6, "addDeduper:", v71);

  v72 = -[MapsSuggestionsGEOMapItemDeduper initWithSacrificedType:]([MapsSuggestionsGEOMapItemDeduper alloc], "initWithSacrificedType:", 13);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v6, "addDeduper:", v72);

  v73 = -[MapsSuggestionsGEOMapItemDeduper initWithSacrificedType:]([MapsSuggestionsGEOMapItemDeduper alloc], "initWithSacrificedType:", 17);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v6, "addDeduper:", v73);

  v74 = -[MapsSuggestionsGEOMapItemDeduper initWithSacrificedType:]([MapsSuggestionsGEOMapItemDeduper alloc], "initWithSacrificedType:", 5);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v6, "addDeduper:", v74);

  v75 = -[MapsSuggestionsGEOMapItemDeduper initWithSacrificedType:]([MapsSuggestionsGEOMapItemDeduper alloc], "initWithSacrificedType:", 12);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v6, "addDeduper:", v75);

  v76 = -[MapsSuggestionsGEOMapItemDeduper initWithSacrificedType:]([MapsSuggestionsGEOMapItemDeduper alloc], "initWithSacrificedType:", 4);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v6, "addDeduper:", v76);

  v77 = -[MapsSuggestionsGEOMapItemDeduper initWithSacrificedType:]([MapsSuggestionsGEOMapItemDeduper alloc], "initWithSacrificedType:", 23);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v6, "addDeduper:", v77);

  v78 = -[MapsSuggestionsGEOMapItemDeduper initWithSacrificedType:]([MapsSuggestionsGEOMapItemDeduper alloc], "initWithSacrificedType:", 3);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v6, "addDeduper:", v78);

  v79 = -[MapsSuggestionsGEOMapItemDeduper initWithSacrificedType:]([MapsSuggestionsGEOMapItemDeduper alloc], "initWithSacrificedType:", 2);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v6, "addDeduper:", v79);

  v80 = -[MapsSuggestionsGEOMapItemDeduper initWithSacrificedType:]([MapsSuggestionsGEOMapItemDeduper alloc], "initWithSacrificedType:", 1);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v6, "addDeduper:", v80);

  v81 = objc_alloc_init(MapsSuggestionsDeletedFilter);
  -[MapsSuggestionsSimpleStrategy addPostFilter:](v6, "addPostFilter:", v81);

  v82 = objc_alloc_init(MapsSuggestionsTooEarlyFilter);
  -[MapsSuggestionsSimpleStrategy addPostFilter:](v6, "addPostFilter:", v82);

  v83 = objc_alloc_init(MapsSuggestionsNoTitleFilter);
  -[MapsSuggestionsSimpleStrategy addPostFilter:](v6, "addPostFilter:", v83);

  v84 = objc_alloc_init(MapsSuggestionsAlreadyThereFilter);
  -[MapsSuggestionsSimpleStrategy addPostFilter:](v6, "addPostFilter:", v84);

  v85 = objc_alloc_init(MapsSuggestionsTooFarFilter);
  -[MapsSuggestionsSimpleStrategy addPostFilter:](v6, "addPostFilter:", v85);

  -[MapsSuggestionsEngineBuilder setStrategy:](self, "setStrategy:", v6);
  v199 = 0u;
  v200 = 0u;
  v197 = 0u;
  v198 = 0u;
  -[MapsSuggestionsEngineBuilder includePreFilters](self, "includePreFilters");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v197, v211, 16);
  if (v87)
  {
    v88 = *(_QWORD *)v198;
    do
    {
      for (i = 0; i != v87; ++i)
      {
        if (*(_QWORD *)v198 != v88)
          objc_enumerationMutation(v86);
        v90 = *(_QWORD *)(*((_QWORD *)&v197 + 1) + 8 * i);
        -[MapsSuggestionsEngineBuilder strategy](self, "strategy");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "addPreFilter:", v90);

      }
      v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v197, v211, 16);
    }
    while (v87);
  }

  v195 = 0u;
  v196 = 0u;
  v193 = 0u;
  v194 = 0u;
  -[MapsSuggestionsEngineBuilder includePostFilters](self, "includePostFilters");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v193, v210, 16);
  if (v93)
  {
    v94 = *(_QWORD *)v194;
    do
    {
      for (j = 0; j != v93; ++j)
      {
        if (*(_QWORD *)v194 != v94)
          objc_enumerationMutation(v92);
        v96 = *(_QWORD *)(*((_QWORD *)&v193 + 1) + 8 * j);
        -[MapsSuggestionsEngineBuilder strategy](self, "strategy");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "addPostFilter:", v96);

      }
      v93 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v193, v210, 16);
    }
    while (v93);
  }

  v191 = 0u;
  v192 = 0u;
  v189 = 0u;
  v190 = 0u;
  -[MapsSuggestionsEngineBuilder includeImprovers](self, "includeImprovers");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v189, v209, 16);
  if (v99)
  {
    v100 = *(_QWORD *)v190;
    do
    {
      for (k = 0; k != v99; ++k)
      {
        if (*(_QWORD *)v190 != v100)
          objc_enumerationMutation(v98);
        v102 = *(_QWORD *)(*((_QWORD *)&v189 + 1) + 8 * k);
        -[MapsSuggestionsEngineBuilder strategy](self, "strategy");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "addImprover:", v102);

      }
      v99 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v189, v209, 16);
    }
    while (v99);
  }

  v187 = 0u;
  v188 = 0u;
  v185 = 0u;
  v186 = 0u;
  -[MapsSuggestionsEngineBuilder includeDedupers](self, "includeDedupers");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v185, v208, 16);
  if (v105)
  {
    v106 = *(_QWORD *)v186;
    do
    {
      for (m = 0; m != v105; ++m)
      {
        if (*(_QWORD *)v186 != v106)
          objc_enumerationMutation(v104);
        v108 = *(_QWORD *)(*((_QWORD *)&v185 + 1) + 8 * m);
        -[MapsSuggestionsEngineBuilder strategy](self, "strategy");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "addDeduper:", v108);

      }
      v105 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v185, v208, 16);
    }
    while (v105);
  }

  v183 = 0u;
  v184 = 0u;
  v181 = 0u;
  v182 = 0u;
  -[MapsSuggestionsEngineBuilder excludePreFilters](self, "excludePreFilters");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v181, v207, 16);
  if (v111)
  {
    v112 = *(_QWORD *)v182;
    do
    {
      for (n = 0; n != v111; ++n)
      {
        if (*(_QWORD *)v182 != v112)
          objc_enumerationMutation(v110);
        v114 = *(_QWORD *)(*((_QWORD *)&v181 + 1) + 8 * n);
        -[MapsSuggestionsEngineBuilder strategy](self, "strategy");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v115, "removeFilter:", v114);

      }
      v111 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v181, v207, 16);
    }
    while (v111);
  }

  v179 = 0u;
  v180 = 0u;
  v177 = 0u;
  v178 = 0u;
  -[MapsSuggestionsEngineBuilder excludePostFilters](self, "excludePostFilters");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v177, v206, 16);
  if (v117)
  {
    v118 = *(_QWORD *)v178;
    do
    {
      for (ii = 0; ii != v117; ++ii)
      {
        if (*(_QWORD *)v178 != v118)
          objc_enumerationMutation(v116);
        v120 = *(_QWORD *)(*((_QWORD *)&v177 + 1) + 8 * ii);
        -[MapsSuggestionsEngineBuilder strategy](self, "strategy");
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v121, "removeFilter:", v120);

      }
      v117 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v177, v206, 16);
    }
    while (v117);
  }

  -[MapsSuggestionsEngineBuilder locationUpdater](self, "locationUpdater");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = v122 == 0;

  if (v123)
  {
    v124 = objc_alloc_init(MapsSuggestionsDefaultLocationUpdater);
    -[MapsSuggestionsEngineBuilder setLocationUpdater:](self, "setLocationUpdater:", v124);

  }
  if (-[MapsSuggestionsEngineBuilder hasTracker](self, "hasTracker"))
  {
    v125 = [MapsSuggestionsETARequirements alloc];
    GEOConfigGetDouble();
    v127 = v126;
    GEOConfigGetDouble();
    v129 = v128;
    GEOConfigGetDouble();
    v166 = -[MapsSuggestionsETARequirements initWithMaxAge:maxDistance:minAccuracy:](v125, "initWithMaxAge:maxDistance:minAccuracy:", v127, v129, v130);
  }
  else
  {
    v166 = 0;
  }
  v131 = [MapsSuggestionsManager alloc];
  -[MapsSuggestionsEngineBuilder strategy](self, "strategy");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  -[MapsSuggestionsEngineBuilder locationUpdater](self, "locationUpdater");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  -[MapsSuggestionsEngineBuilder resourceDepot](self, "resourceDepot");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "oneNetworkRequester");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  -[MapsSuggestionsEngineBuilder resourceDepot](self, "resourceDepot");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "oneFlightUpdater");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  -[MapsSuggestionsEngineBuilder resourceDepot](self, "resourceDepot");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "oneVirtualGarage");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = -[MapsSuggestionsManager initWithStrategy:locationUpdater:network:flightUpdater:ETARequirements:virtualGarage:](v131, "initWithStrategy:locationUpdater:network:flightUpdater:ETARequirements:virtualGarage:", v132, v133, v135, v137, v166, v139);

  -[MapsSuggestionsEngineBuilder resourceDepot](self, "resourceDepot");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "setOneSourceDelegate:", v140);

  v175 = 0u;
  v176 = 0u;
  v173 = 0u;
  v174 = 0u;
  -[MapsSuggestionsEngineBuilder titleFormatters](self, "titleFormatters");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = objc_msgSend(v142, "countByEnumeratingWithState:objects:count:", &v173, v205, 16);
  if (v143)
  {
    v144 = *(_QWORD *)v174;
    do
    {
      for (jj = 0; jj != v143; ++jj)
      {
        if (*(_QWORD *)v174 != v144)
          objc_enumerationMutation(v142);
        v146 = *(void **)(*((_QWORD *)&v173 + 1) + 8 * jj);
        -[MapsSuggestionsEngineBuilder titleFormatters](self, "titleFormatters", v166);
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v147, "objectForKeyedSubscript:", v146);
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        -[MapsSuggestionsManager setTitleFormatter:forType:](v140, v148, (void *)objc_msgSend(v146, "unsignedIntValue"));

      }
      v143 = objc_msgSend(v142, "countByEnumeratingWithState:objects:count:", &v173, v205, 16);
    }
    while (v143);
  }

  v167 = v140;
  v169 = 0u;
  v170 = 0u;
  v171 = 0u;
  v172 = 0u;
  -[MapsSuggestionsEngineBuilder sourceClasses](self, "sourceClasses");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  obj = v149;
  v150 = objc_msgSend(v149, "countByEnumeratingWithState:objects:count:", &v169, v204, 16);
  p_super = &v167->super;
  if (v150)
  {
    v152 = *(_QWORD *)v170;
    p_super = &v167->super;
LABEL_63:
    v153 = 0;
    while (1)
    {
      if (*(_QWORD *)v170 != v152)
        objc_enumerationMutation(obj);
      v154 = *(void **)(*((_QWORD *)&v169 + 1) + 8 * v153);
      if ((objc_msgSend(v154, "conformsToProtocol:", &unk_1EE71B5B8, v166) & 1) == 0)
      {
        GEOFindOrCreateLog();
        v164 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v164, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446978;
          *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEngineBuilder.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 568;
          *(_WORD *)&buf[18] = 2082;
          *(_QWORD *)&buf[20] = "-[MapsSuggestionsEngineBuilder build]";
          v202 = 2082;
          v203 = "NO == [sourceClass conformsToProtocol:@protocol(MapsSuggestionsSource)]";
          _os_log_impl(&dword_1A427D000, v164, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. This is not really a Source", buf, 0x26u);
        }

        v163 = 0;
        v162 = obj;
        goto LABEL_80;
      }
      if ((objc_msgSend(v154, "isEnabled") & 1) == 0)
        break;
      v155 = objc_alloc((Class)v154);
      -[MapsSuggestionsEngineBuilder resourceDepot](self, "resourceDepot");
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v154, "description");
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      v158 = objc_msgSend(v155, "initFromResourceDepot:name:", v156, v157);

      -[NSObject attachSource:](p_super, "attachSource:", v158);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v158 = v158;
        v159 = p_super;
        p_super = v158;
LABEL_73:

      }
      if (v150 == ++v153)
      {
        v149 = obj;
        v150 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v169, v204, 16);
        if (v150)
          goto LABEL_63;
        goto LABEL_76;
      }
    }
    GEOFindOrCreateLog();
    v159 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v159, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v154, "description");
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v160;
      _os_log_impl(&dword_1A427D000, v159, OS_LOG_TYPE_DEBUG, "Source %@ is disabled", buf, 0xCu);

    }
    v158 = v159;
    goto LABEL_73;
  }
LABEL_76:

  v161 = [MapsSuggestionsEngine alloc];
  -[MapsSuggestionsEngineBuilder resourceDepot](self, "resourceDepot");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  v163 = -[MapsSuggestionsEngine initWithEntryManager:resourceDepot:](v161, "initWithEntryManager:resourceDepot:", v167, v162);
LABEL_80:

  return v163;
}

+ (id)simpleStrategy
{
  MapsSuggestionsSimpleStrategy *v2;
  MapsSuggestionsUnknownFilter *v3;
  MapsSuggestionsServerSideFilter *v4;
  MapsSuggestionsTooFewVisitsFilter *v5;
  MapsSuggestionsNoAddressFilter *v6;
  MapsSuggestionsAppConnectionFilter *v7;
  MapsSuggestionsExpiredFilter *v8;
  MapsSuggestionsCoarseLocationFilter *v9;
  MapsSuggestionsFlightDeparturesOnlyFilter *v10;
  MapsSuggestionsFlightTooFarFilter *v11;
  MapsSuggestionsAppConnectionImprover *v12;
  MapsSuggestionsSinkRankImprover *v13;
  MapsSuggestionsDeleteSupportImprover *v14;
  MapsSuggestionsHomeWorkImprover *v15;
  MapsSuggestionsFavoritesImprover *v16;
  MapsSuggestionsResumeRouteImprover *v17;
  MapsSuggestionsCalendarEventImprover *v18;
  MapsSuggestionsFrequentLocationImprover *v19;
  MapsSuggestionsParkedCarImprover *v20;
  MapsSuggestionsReservationImprover *v21;
  MapsSuggestionsLockscreenImprover *v22;
  MapsSuggestionsHotelImprover *v23;
  MapsSuggestionsCarRentalImprover *v24;
  MapsSuggestionsTravelFlightImprover *v25;
  MapsSuggestionsTicketedEventImprover *v26;
  MapsSuggestionsRecentHistoryImprover *v27;
  MapsSuggestionsPortraitImprover *v28;
  MapsSuggestionsPinnedPlaceImprover *v29;
  MapsSuggestionsVirtualGarageImprover *v30;
  MapsSuggestionsRatingRequestImprover *v31;
  _TtC15MapsSuggestions38MapsSuggestionsContactActivityImprover *v32;
  MapsSuggestionsOrderStatusImprover *v33;
  MapsSuggestionsShortcutDeduper *v34;
  MapsSuggestionsOrderStatusDeduper *v35;
  _TtC15MapsSuggestions37MapsSuggestionsContactActivityDeduper *v36;
  MapsSuggestionsUniqueIdentifierDeduper *v37;
  MapsSuggestionsUniqueIdentifierDeduper *v38;
  MapsSuggestionsUniqueIdentifierDeduper *v39;
  MapsSuggestionsUniqueIdentifierDeduper *v40;
  MapsSuggestionsUniqueIdentifierDeduper *v41;
  MapsSuggestionsUniqueIdentifierDeduper *v42;
  MapsSuggestionsUniqueIdentifierDeduper *v43;
  MapsSuggestionsUniqueIdentifierDeduper *v44;
  MapsSuggestionsUniqueIdentifierDeduper *v45;
  MapsSuggestionsShortcutAtMapItemDeduper *v46;
  _QWORD *v47;
  MapsSuggestionsShortcutAtMapItemDeduper *v48;
  MapsSuggestionsSameRidesharingRideDeduper *v49;
  MapsSuggestionsHomeWorkSchoolDeduper *v50;
  MapsSuggestionsFrequentLocationDeduper *v51;
  MapsSuggestionsParkedCarDeduper *v52;
  MapsSuggestionsRecentHistoryDeduper *v53;
  MapsSuggestionsAppConnectionDeduper *v54;
  MapsSuggestionsAppConnectionAndRecentsDeduper *v55;
  MapsSuggestionsRideBookingAppConnectionDeduper *v56;
  MapsSuggestionsCalendarEventDeduper *v57;
  MapsSuggestionsReservationDeduper *v58;
  MapsSuggestionsResumeRouteDeduper *v59;
  MapsSuggestionsResumeRouteAndRestaurantDeduper *v60;
  MapsSuggestionsUniqueIdentifierDeduper *v61;
  MapsSuggestionsUniqueIdentifierDeduper *v62;
  MapsSuggestionsUniqueIdentifierDeduper *v63;
  MapsSuggestionsFlightDeduper *v64;
  MapsSuggestionsVehicleSetupResumeRouteDeduper *v65;
  MapsSuggestionsUniqueIdentifierDeduper *v66;
  MapsSuggestionsUniqueIdentifierDeduper *v67;
  MapsSuggestionsGEOMapItemDeduper *v68;
  MapsSuggestionsGEOMapItemDeduper *v69;
  MapsSuggestionsGEOMapItemDeduper *v70;
  MapsSuggestionsGEOMapItemDeduper *v71;
  MapsSuggestionsGEOMapItemDeduper *v72;
  MapsSuggestionsGEOMapItemDeduper *v73;
  MapsSuggestionsGEOMapItemDeduper *v74;
  MapsSuggestionsGEOMapItemDeduper *v75;
  MapsSuggestionsGEOMapItemDeduper *v76;
  MapsSuggestionsDeletedFilter *v77;
  MapsSuggestionsTooEarlyFilter *v78;
  MapsSuggestionsNoTitleFilter *v79;
  MapsSuggestionsAlreadyThereFilter *v80;
  MapsSuggestionsTooFarFilter *v81;
  void *__p;
  void *v84;
  char *v85;

  v2 = objc_alloc_init(MapsSuggestionsSimpleStrategy);
  v3 = objc_alloc_init(MapsSuggestionsUnknownFilter);
  -[MapsSuggestionsSimpleStrategy addPreFilter:](v2, "addPreFilter:", v3);

  v4 = objc_alloc_init(MapsSuggestionsServerSideFilter);
  -[MapsSuggestionsSimpleStrategy addPreFilter:](v2, "addPreFilter:", v4);

  v5 = objc_alloc_init(MapsSuggestionsTooFewVisitsFilter);
  -[MapsSuggestionsSimpleStrategy addPreFilter:](v2, "addPreFilter:", v5);

  v6 = objc_alloc_init(MapsSuggestionsNoAddressFilter);
  -[MapsSuggestionsSimpleStrategy addPreFilter:](v2, "addPreFilter:", v6);

  v7 = objc_alloc_init(MapsSuggestionsAppConnectionFilter);
  -[MapsSuggestionsSimpleStrategy addPreFilter:](v2, "addPreFilter:", v7);

  v8 = objc_alloc_init(MapsSuggestionsExpiredFilter);
  -[MapsSuggestionsSimpleStrategy addPreFilter:](v2, "addPreFilter:", v8);

  v9 = objc_alloc_init(MapsSuggestionsCoarseLocationFilter);
  -[MapsSuggestionsSimpleStrategy addPreFilter:](v2, "addPreFilter:", v9);

  v10 = objc_alloc_init(MapsSuggestionsFlightDeparturesOnlyFilter);
  -[MapsSuggestionsSimpleStrategy addPreFilter:](v2, "addPreFilter:", v10);

  v11 = objc_alloc_init(MapsSuggestionsFlightTooFarFilter);
  -[MapsSuggestionsSimpleStrategy addPreFilter:](v2, "addPreFilter:", v11);

  v12 = objc_alloc_init(MapsSuggestionsAppConnectionImprover);
  -[MapsSuggestionsSimpleStrategy addImprover:](v2, "addImprover:", v12);

  v13 = objc_alloc_init(MapsSuggestionsSinkRankImprover);
  -[MapsSuggestionsSimpleStrategy addImprover:](v2, "addImprover:", v13);

  v14 = objc_alloc_init(MapsSuggestionsDeleteSupportImprover);
  -[MapsSuggestionsSimpleStrategy addImprover:](v2, "addImprover:", v14);

  v15 = objc_alloc_init(MapsSuggestionsHomeWorkImprover);
  -[MapsSuggestionsSimpleStrategy addImprover:](v2, "addImprover:", v15);

  v16 = objc_alloc_init(MapsSuggestionsFavoritesImprover);
  -[MapsSuggestionsSimpleStrategy addImprover:](v2, "addImprover:", v16);

  v17 = objc_alloc_init(MapsSuggestionsResumeRouteImprover);
  -[MapsSuggestionsSimpleStrategy addImprover:](v2, "addImprover:", v17);

  v18 = objc_alloc_init(MapsSuggestionsCalendarEventImprover);
  -[MapsSuggestionsSimpleStrategy addImprover:](v2, "addImprover:", v18);

  v19 = objc_alloc_init(MapsSuggestionsFrequentLocationImprover);
  -[MapsSuggestionsSimpleStrategy addImprover:](v2, "addImprover:", v19);

  v20 = objc_alloc_init(MapsSuggestionsParkedCarImprover);
  -[MapsSuggestionsSimpleStrategy addImprover:](v2, "addImprover:", v20);

  v21 = objc_alloc_init(MapsSuggestionsReservationImprover);
  -[MapsSuggestionsSimpleStrategy addImprover:](v2, "addImprover:", v21);

  v22 = objc_alloc_init(MapsSuggestionsLockscreenImprover);
  -[MapsSuggestionsSimpleStrategy addImprover:](v2, "addImprover:", v22);

  v23 = objc_alloc_init(MapsSuggestionsHotelImprover);
  -[MapsSuggestionsSimpleStrategy addImprover:](v2, "addImprover:", v23);

  v24 = objc_alloc_init(MapsSuggestionsCarRentalImprover);
  -[MapsSuggestionsSimpleStrategy addImprover:](v2, "addImprover:", v24);

  v25 = objc_alloc_init(MapsSuggestionsTravelFlightImprover);
  -[MapsSuggestionsSimpleStrategy addImprover:](v2, "addImprover:", v25);

  v26 = objc_alloc_init(MapsSuggestionsTicketedEventImprover);
  -[MapsSuggestionsSimpleStrategy addImprover:](v2, "addImprover:", v26);

  v27 = objc_alloc_init(MapsSuggestionsRecentHistoryImprover);
  -[MapsSuggestionsSimpleStrategy addImprover:](v2, "addImprover:", v27);

  v28 = objc_alloc_init(MapsSuggestionsPortraitImprover);
  -[MapsSuggestionsSimpleStrategy addImprover:](v2, "addImprover:", v28);

  v29 = objc_alloc_init(MapsSuggestionsPinnedPlaceImprover);
  -[MapsSuggestionsSimpleStrategy addImprover:](v2, "addImprover:", v29);

  v30 = objc_alloc_init(MapsSuggestionsVirtualGarageImprover);
  -[MapsSuggestionsSimpleStrategy addImprover:](v2, "addImprover:", v30);

  v31 = objc_alloc_init(MapsSuggestionsRatingRequestImprover);
  -[MapsSuggestionsSimpleStrategy addImprover:](v2, "addImprover:", v31);

  v32 = objc_alloc_init(_TtC15MapsSuggestions38MapsSuggestionsContactActivityImprover);
  -[MapsSuggestionsSimpleStrategy addImprover:](v2, "addImprover:", v32);

  v33 = objc_alloc_init(MapsSuggestionsOrderStatusImprover);
  -[MapsSuggestionsSimpleStrategy addImprover:](v2, "addImprover:", v33);

  v34 = objc_alloc_init(MapsSuggestionsShortcutDeduper);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v2, "addDeduper:", v34);

  v35 = objc_alloc_init(MapsSuggestionsOrderStatusDeduper);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v2, "addDeduper:", v35);

  v36 = objc_alloc_init(_TtC15MapsSuggestions37MapsSuggestionsContactActivityDeduper);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v2, "addDeduper:", v36);

  v37 = -[MapsSuggestionsUniqueIdentifierDeduper initWithType:]([MapsSuggestionsUniqueIdentifierDeduper alloc], "initWithType:", 1);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v2, "addDeduper:", v37);

  v38 = -[MapsSuggestionsUniqueIdentifierDeduper initWithType:]([MapsSuggestionsUniqueIdentifierDeduper alloc], "initWithType:", 2);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v2, "addDeduper:", v38);

  v39 = -[MapsSuggestionsUniqueIdentifierDeduper initWithType:]([MapsSuggestionsUniqueIdentifierDeduper alloc], "initWithType:", 19);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v2, "addDeduper:", v39);

  v40 = -[MapsSuggestionsUniqueIdentifierDeduper initWithType:]([MapsSuggestionsUniqueIdentifierDeduper alloc], "initWithType:", 17);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v2, "addDeduper:", v40);

  v41 = -[MapsSuggestionsUniqueIdentifierDeduper initWithType:]([MapsSuggestionsUniqueIdentifierDeduper alloc], "initWithType:", 8);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v2, "addDeduper:", v41);

  v42 = -[MapsSuggestionsUniqueIdentifierDeduper initWithType:]([MapsSuggestionsUniqueIdentifierDeduper alloc], "initWithType:", 20);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v2, "addDeduper:", v42);

  v43 = -[MapsSuggestionsUniqueIdentifierDeduper initWithType:]([MapsSuggestionsUniqueIdentifierDeduper alloc], "initWithType:", 21);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v2, "addDeduper:", v43);

  v44 = -[MapsSuggestionsUniqueIdentifierDeduper initWithType:]([MapsSuggestionsUniqueIdentifierDeduper alloc], "initWithType:", 22);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v2, "addDeduper:", v44);

  v45 = -[MapsSuggestionsUniqueIdentifierDeduper initWithType:]([MapsSuggestionsUniqueIdentifierDeduper alloc], "initWithType:", 24);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v2, "addDeduper:", v45);

  v46 = [MapsSuggestionsShortcutAtMapItemDeduper alloc];
  v47 = operator new(0x18uLL);
  v84 = v47 + 3;
  v85 = (char *)(v47 + 3);
  v47[2] = 12;
  *(_OWORD *)v47 = xmmword_1A43B3798;
  __p = v47;
  v48 = -[MapsSuggestionsShortcutAtMapItemDeduper initWithSacrificedTypes:](v46, "initWithSacrificedTypes:", &__p);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v2, "addDeduper:", v48);

  if (__p)
  {
    v84 = __p;
    operator delete(__p);
  }
  v49 = objc_alloc_init(MapsSuggestionsSameRidesharingRideDeduper);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v2, "addDeduper:", v49);

  v50 = objc_alloc_init(MapsSuggestionsHomeWorkSchoolDeduper);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v2, "addDeduper:", v50);

  v51 = objc_alloc_init(MapsSuggestionsFrequentLocationDeduper);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v2, "addDeduper:", v51);

  v52 = objc_alloc_init(MapsSuggestionsParkedCarDeduper);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v2, "addDeduper:", v52);

  v53 = objc_alloc_init(MapsSuggestionsRecentHistoryDeduper);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v2, "addDeduper:", v53);

  v54 = objc_alloc_init(MapsSuggestionsAppConnectionDeduper);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v2, "addDeduper:", v54);

  v55 = objc_alloc_init(MapsSuggestionsAppConnectionAndRecentsDeduper);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v2, "addDeduper:", v55);

  v56 = objc_alloc_init(MapsSuggestionsRideBookingAppConnectionDeduper);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v2, "addDeduper:", v56);

  v57 = objc_alloc_init(MapsSuggestionsCalendarEventDeduper);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v2, "addDeduper:", v57);

  v58 = objc_alloc_init(MapsSuggestionsReservationDeduper);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v2, "addDeduper:", v58);

  v59 = objc_alloc_init(MapsSuggestionsResumeRouteDeduper);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v2, "addDeduper:", v59);

  v60 = objc_alloc_init(MapsSuggestionsResumeRouteAndRestaurantDeduper);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v2, "addDeduper:", v60);

  v61 = -[MapsSuggestionsUniqueIdentifierDeduper initWithType:]([MapsSuggestionsUniqueIdentifierDeduper alloc], "initWithType:", 10);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v2, "addDeduper:", v61);

  v62 = -[MapsSuggestionsUniqueIdentifierDeduper initWithType:]([MapsSuggestionsUniqueIdentifierDeduper alloc], "initWithType:", 6);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v2, "addDeduper:", v62);

  v63 = -[MapsSuggestionsUniqueIdentifierDeduper initWithType:]([MapsSuggestionsUniqueIdentifierDeduper alloc], "initWithType:", 13);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v2, "addDeduper:", v63);

  v64 = objc_alloc_init(MapsSuggestionsFlightDeduper);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v2, "addDeduper:", v64);

  v65 = objc_alloc_init(MapsSuggestionsVehicleSetupResumeRouteDeduper);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v2, "addDeduper:", v65);

  v66 = -[MapsSuggestionsUniqueIdentifierDeduper initWithType:]([MapsSuggestionsUniqueIdentifierDeduper alloc], "initWithType:", 14);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v2, "addDeduper:", v66);

  v67 = -[MapsSuggestionsUniqueIdentifierDeduper initWithType:]([MapsSuggestionsUniqueIdentifierDeduper alloc], "initWithType:", 16);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v2, "addDeduper:", v67);

  v68 = -[MapsSuggestionsGEOMapItemDeduper initWithSacrificedType:]([MapsSuggestionsGEOMapItemDeduper alloc], "initWithSacrificedType:", 13);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v2, "addDeduper:", v68);

  v69 = -[MapsSuggestionsGEOMapItemDeduper initWithSacrificedType:]([MapsSuggestionsGEOMapItemDeduper alloc], "initWithSacrificedType:", 17);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v2, "addDeduper:", v69);

  v70 = -[MapsSuggestionsGEOMapItemDeduper initWithSacrificedType:]([MapsSuggestionsGEOMapItemDeduper alloc], "initWithSacrificedType:", 5);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v2, "addDeduper:", v70);

  v71 = -[MapsSuggestionsGEOMapItemDeduper initWithSacrificedType:]([MapsSuggestionsGEOMapItemDeduper alloc], "initWithSacrificedType:", 12);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v2, "addDeduper:", v71);

  v72 = -[MapsSuggestionsGEOMapItemDeduper initWithSacrificedType:]([MapsSuggestionsGEOMapItemDeduper alloc], "initWithSacrificedType:", 4);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v2, "addDeduper:", v72);

  v73 = -[MapsSuggestionsGEOMapItemDeduper initWithSacrificedType:]([MapsSuggestionsGEOMapItemDeduper alloc], "initWithSacrificedType:", 23);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v2, "addDeduper:", v73);

  v74 = -[MapsSuggestionsGEOMapItemDeduper initWithSacrificedType:]([MapsSuggestionsGEOMapItemDeduper alloc], "initWithSacrificedType:", 3);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v2, "addDeduper:", v74);

  v75 = -[MapsSuggestionsGEOMapItemDeduper initWithSacrificedType:]([MapsSuggestionsGEOMapItemDeduper alloc], "initWithSacrificedType:", 2);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v2, "addDeduper:", v75);

  v76 = -[MapsSuggestionsGEOMapItemDeduper initWithSacrificedType:]([MapsSuggestionsGEOMapItemDeduper alloc], "initWithSacrificedType:", 1);
  -[MapsSuggestionsSimpleStrategy addDeduper:](v2, "addDeduper:", v76);

  v77 = objc_alloc_init(MapsSuggestionsDeletedFilter);
  -[MapsSuggestionsSimpleStrategy addPostFilter:](v2, "addPostFilter:", v77);

  v78 = objc_alloc_init(MapsSuggestionsTooEarlyFilter);
  -[MapsSuggestionsSimpleStrategy addPostFilter:](v2, "addPostFilter:", v78);

  v79 = objc_alloc_init(MapsSuggestionsNoTitleFilter);
  -[MapsSuggestionsSimpleStrategy addPostFilter:](v2, "addPostFilter:", v79);

  v80 = objc_alloc_init(MapsSuggestionsAlreadyThereFilter);
  -[MapsSuggestionsSimpleStrategy addPostFilter:](v2, "addPostFilter:", v80);

  v81 = objc_alloc_init(MapsSuggestionsTooFarFilter);
  -[MapsSuggestionsSimpleStrategy addPostFilter:](v2, "addPostFilter:", v81);

  return v2;
}

- (MapsSuggestionsStrategy)strategy
{
  return self->_strategy;
}

- (void)setStrategy:(id)a3
{
  objc_storeStrong((id *)&self->_strategy, a3);
}

- (MapsSuggestionsLocationUpdater)locationUpdater
{
  return self->_locationUpdater;
}

- (void)setLocationUpdater:(id)a3
{
  objc_storeStrong((id *)&self->_locationUpdater, a3);
}

- (BOOL)hasTracker
{
  return self->_hasTracker;
}

- (void)setHasTracker:(BOOL)a3
{
  self->_hasTracker = a3;
}

- (NSMutableArray)sourceClasses
{
  return self->_sourceClasses;
}

- (void)setSourceClasses:(id)a3
{
  objc_storeStrong((id *)&self->_sourceClasses, a3);
}

- (NSMutableSet)includePreFilters
{
  return self->_includePreFilters;
}

- (void)setIncludePreFilters:(id)a3
{
  objc_storeStrong((id *)&self->_includePreFilters, a3);
}

- (NSMutableSet)includePostFilters
{
  return self->_includePostFilters;
}

- (void)setIncludePostFilters:(id)a3
{
  objc_storeStrong((id *)&self->_includePostFilters, a3);
}

- (NSMutableArray)includeImprovers
{
  return self->_includeImprovers;
}

- (void)setIncludeImprovers:(id)a3
{
  objc_storeStrong((id *)&self->_includeImprovers, a3);
}

- (NSMutableArray)includeDedupers
{
  return self->_includeDedupers;
}

- (void)setIncludeDedupers:(id)a3
{
  objc_storeStrong((id *)&self->_includeDedupers, a3);
}

- (NSMutableSet)excludePreFilters
{
  return self->_excludePreFilters;
}

- (void)setExcludePreFilters:(id)a3
{
  objc_storeStrong((id *)&self->_excludePreFilters, a3);
}

- (NSMutableSet)excludePostFilters
{
  return self->_excludePostFilters;
}

- (void)setExcludePostFilters:(id)a3
{
  objc_storeStrong((id *)&self->_excludePostFilters, a3);
}

- (NSMutableArray)excludeImprovers
{
  return self->_excludeImprovers;
}

- (void)setExcludeImprovers:(id)a3
{
  objc_storeStrong((id *)&self->_excludeImprovers, a3);
}

- (NSMutableArray)excludeDedupers
{
  return self->_excludeDedupers;
}

- (void)setExcludeDedupers:(id)a3
{
  objc_storeStrong((id *)&self->_excludeDedupers, a3);
}

- (NSMutableDictionary)titleFormatters
{
  return self->_titleFormatters;
}

- (void)setTitleFormatters:(id)a3
{
  objc_storeStrong((id *)&self->_titleFormatters, a3);
}

- (MapsSuggestionsFullResourceDepot)resourceDepot
{
  return self->_resourceDepot;
}

- (void)setResourceDepot:(id)a3
{
  objc_storeStrong((id *)&self->_resourceDepot, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceDepot, 0);
  objc_storeStrong((id *)&self->_titleFormatters, 0);
  objc_storeStrong((id *)&self->_excludeDedupers, 0);
  objc_storeStrong((id *)&self->_excludeImprovers, 0);
  objc_storeStrong((id *)&self->_excludePostFilters, 0);
  objc_storeStrong((id *)&self->_excludePreFilters, 0);
  objc_storeStrong((id *)&self->_includeDedupers, 0);
  objc_storeStrong((id *)&self->_includeImprovers, 0);
  objc_storeStrong((id *)&self->_includePostFilters, 0);
  objc_storeStrong((id *)&self->_includePreFilters, 0);
  objc_storeStrong((id *)&self->_sourceClasses, 0);
  objc_storeStrong((id *)&self->_locationUpdater, 0);
  objc_storeStrong((id *)&self->_strategy, 0);
}

@end
