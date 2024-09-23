@implementation MapsSuggestionsPortrait

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "description");
}

- (id)initFromResourceDepot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MapsSuggestionsPortrait *v12;
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
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v16 = 136446978;
    v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPortrait.m";
    v18 = 1024;
    v19 = 83;
    v20 = 2082;
    v21 = "-[MapsSuggestionsPortrait initFromResourceDepot:]";
    v22 = 2082;
    v23 = "nil == (resourceDepot)";
    v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to build from!";
LABEL_14:
    _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v16, 0x26u);
    goto LABEL_15;
  }
  objc_msgSend(v4, "onePortraitConnector");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v16 = 136446978;
    v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPortrait.m";
    v18 = 1024;
    v19 = 84;
    v20 = 2082;
    v21 = "-[MapsSuggestionsPortrait initFromResourceDepot:]";
    v22 = 2082;
    v23 = "nil == (resourceDepot.onePortraitConnector)";
    v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires One PortraitConnector!";
    goto LABEL_14;
  }
  objc_msgSend(v5, "oneNetworkRequester");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v16 = 136446978;
    v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPortrait.m";
    v18 = 1024;
    v19 = 85;
    v20 = 2082;
    v21 = "-[MapsSuggestionsPortrait initFromResourceDepot:]";
    v22 = 2082;
    v23 = "nil == (resourceDepot.oneNetworkRequester)";
    v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires One Network!";
    goto LABEL_14;
  }
  objc_msgSend(v5, "oneContacts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v16 = 136446978;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPortrait.m";
      v18 = 1024;
      v19 = 86;
      v20 = 2082;
      v21 = "-[MapsSuggestionsPortrait initFromResourceDepot:]";
      v22 = 2082;
      v23 = "nil == (resourceDepot.oneContacts)";
      v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires One Contacts!";
      goto LABEL_14;
    }
LABEL_15:

    v12 = 0;
    goto LABEL_16;
  }
  objc_msgSend(v5, "onePortraitConnector");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "oneNetworkRequester");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "oneContacts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[MapsSuggestionsPortrait initWithPortraitConnector:networkRequester:contacts:](self, "initWithPortraitConnector:networkRequester:contacts:", v9, v10, v11);

  v12 = self;
LABEL_16:

  return v12;
}

- (MapsSuggestionsPortrait)initWithPortraitConnector:(id)a3 networkRequester:(id)a4 contacts:(id)a5
{
  id v9;
  id v10;
  id v11;
  MapsSuggestionsPortrait *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *queue;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  PPConnectionsCriteria *criteria;
  NSString *cachedKey;
  GEOMapItemStorage *cachedMapItem;
  NSNumber *cachedMapItemOrigin;
  MapsSuggestionsPortrait *v24;
  NSObject *v25;
  const char *v26;
  objc_super v28;
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
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    GEOFindOrCreateLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v30 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPortrait.m";
      v31 = 1024;
      v32 = 100;
      v33 = 2082;
      v34 = "-[MapsSuggestionsPortrait initWithPortraitConnector:networkRequester:contacts:]";
      v35 = 2082;
      v36 = "nil == (portraitConnector)";
      v26 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a RoutineInterface";
LABEL_10:
      _os_log_impl(&dword_1A427D000, v25, OS_LOG_TYPE_ERROR, v26, buf, 0x26u);
    }
LABEL_11:

    v24 = 0;
    goto LABEL_12;
  }
  if (!v10)
  {
    GEOFindOrCreateLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v30 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPortrait.m";
      v31 = 1024;
      v32 = 101;
      v33 = 2082;
      v34 = "-[MapsSuggestionsPortrait initWithPortraitConnector:networkRequester:contacts:]";
      v35 = 2082;
      v36 = "nil == (networkRequester)";
      v26 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a NetworkRequester";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v28.receiver = self;
  v28.super_class = (Class)MapsSuggestionsPortrait;
  v12 = -[MapsSuggestionsPortrait init](&v28, sel_init);
  if (v12)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("MapsSuggestionsPortraitQueue", v13);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v12->_connector, a3);
    objc_storeStrong((id *)&v12->_networkRequester, a4);
    v16 = objc_alloc(MEMORY[0x1E0D70AE8]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bundleIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v16, "initWithLocationField:bundleIdentifier:", 1, v18);
    criteria = v12->_criteria;
    v12->_criteria = (PPConnectionsCriteria *)v19;

    cachedKey = v12->_cachedKey;
    v12->_cachedKey = 0;

    cachedMapItem = v12->_cachedMapItem;
    v12->_cachedMapItem = 0;

    cachedMapItemOrigin = v12->_cachedMapItemOrigin;
    v12->_cachedMapItemOrigin = 0;

    objc_storeStrong((id *)&v12->_contacts, a5);
  }
  self = v12;
  v24 = self;
LABEL_12:

  return v24;
}

- (BOOL)fetchLocationEntriesForTray:(BOOL)a3 currentLocation:(id)a4 queue:(id)a5 handler:(id)a6
{
  _BOOL4 v8;
  NSObject *v10;
  id v11;
  double v12;
  NSObject *v13;
  uint64_t v14;
  dispatch_group_t v15;
  id v16;
  NSObject *v17;
  MapsSuggestionsPortraitConnector *connector;
  uint64_t v19;
  id v20;
  NSObject *v21;
  id v22;
  id v23;
  NSObject *v24;
  void *v26;
  id v27;
  _QWORD block[4];
  id v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  NSObject *v34;
  id v35;
  _BYTE *v36;
  id v37;
  BOOL v38;
  id v39;
  id buf;
  _QWORD v41[4];
  NSObject *v42;
  _BYTE v43[28];
  __int16 v44;
  const char *v45;
  uint64_t v46;

  v8 = a3;
  v46 = *MEMORY[0x1E0C80C00];
  v27 = a4;
  v10 = a5;
  v11 = a6;
  if (v11)
  {
    if (+[MapsSuggestionsSiri isEnabled](MapsSuggestionsSiri, "isEnabled"))
    {
      GEOConfigGetDouble();
      MapsSuggestionsNowWithOffset(-v12);
      v13 = objc_claimAutoreleasedReturnValue();
      if (v8)
        v14 = 1;
      else
        v14 = 2;
      -[MapsSuggestionsPortraitConnector locationQuery:fromDate:consumerType:](self->_connector, "locationQuery:fromDate:consumerType:", GEOConfigGetInteger(), v13, v14);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = dispatch_group_create();
      v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      *(_QWORD *)v43 = 0;
      *(_QWORD *)&v43[8] = v43;
      *(_QWORD *)&v43[16] = 0x2020000000;
      *(_DWORD *)&v43[24] = 0;
      GEOFindOrCreateLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1A427D000, v17, OS_LOG_TYPE_DEBUG, "Locations from Portrait:", (uint8_t *)&buf, 2u);
      }

      objc_initWeak(&buf, self);
      connector = self->_connector;
      v39 = 0;
      v19 = MEMORY[0x1E0C809B0];
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __85__MapsSuggestionsPortrait_fetchLocationEntriesForTray_currentLocation_queue_handler___block_invoke_155;
      v32[3] = &unk_1E4BCF3A0;
      v36 = v43;
      v20 = v16;
      v33 = v20;
      objc_copyWeak(&v37, &buf);
      v21 = v15;
      v34 = v21;
      v35 = v27;
      v38 = v8;
      -[MapsSuggestionsPortraitConnector iterRankedLocationsWithQuery:error:block:](connector, "iterRankedLocationsWithQuery:error:block:", v26, &v39, v32);
      block[0] = v19;
      block[1] = 3221225472;
      block[2] = __85__MapsSuggestionsPortrait_fetchLocationEntriesForTray_currentLocation_queue_handler___block_invoke_163;
      block[3] = &unk_1E4BCF3C8;
      v30 = v39;
      v31 = v11;
      v29 = v20;
      v22 = v30;
      v23 = v20;
      dispatch_group_notify(v21, v10, block);

      objc_destroyWeak(&v37);
      objc_destroyWeak(&buf);
      _Block_object_dispose(v43, 8);

    }
    else
    {
      GEOFindOrCreateLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v43 = 0;
        _os_log_impl(&dword_1A427D000, v24, OS_LOG_TYPE_DEBUG, "User turned off Siri Suggestions for maps", v43, 2u);
      }

      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __85__MapsSuggestionsPortrait_fetchLocationEntriesForTray_currentLocation_queue_handler___block_invoke;
      v41[3] = &unk_1E4BCED88;
      v42 = v11;
      dispatch_async(v10, v41);
      v13 = v42;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v43 = 136446978;
      *(_QWORD *)&v43[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPortrait.m";
      *(_WORD *)&v43[12] = 1024;
      *(_DWORD *)&v43[14] = 124;
      *(_WORD *)&v43[18] = 2082;
      *(_QWORD *)&v43[20] = "-[MapsSuggestionsPortrait fetchLocationEntriesForTray:currentLocation:queue:handler:]";
      v44 = 2082;
      v45 = "nil == (handler)";
      _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. handler cannot be nil", v43, 0x26u);
    }
  }

  return v11 != 0;
}

uint64_t __85__MapsSuggestionsPortrait_fetchLocationEntriesForTray_currentLocation_queue_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __85__MapsSuggestionsPortrait_fetchLocationEntriesForTray_currentLocation_queue_handler___block_invoke_155(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  char *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  MapsSuggestionsEntry *v16;
  void *v17;
  MapsSuggestionsEntry *v18;
  void *v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  objc_class *v48;
  id v49;
  id v50;
  void *v51;
  NSObject *v52;
  void *v53;
  _QWORD *WeakRetained;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  _QWORD v60[4];
  NSObject *v61;
  MapsSuggestionsEntry *v62;
  id v63;
  id v64;
  id v65;
  char v66;
  _BYTE buf[18];
  __int16 v68;
  const char *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  GEOFindOrCreateLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v6 = *(_DWORD *)(v5 + 24) + 1;
    *(_DWORD *)(v5 + 24) = v6;
    objc_msgSend(v3, "location");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "placemark");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "location");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromPPLocationCategory(objc_msgSend(v9, "category"));
    v10 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)&buf[4] = v6;
    *(_WORD *)&buf[8] = 2112;
    *(_QWORD *)&buf[10] = v8;
    v68 = 2112;
    v69 = v10;
    _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "%d. %@, Category: %@", buf, 0x1Cu);

  }
  v11 = v3;
  objc_msgSend(v11, "location");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "placemark");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "location");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    GEOFindOrCreateLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v13, "name");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v53;
      _os_log_impl(&dword_1A427D000, v20, OS_LOG_TYPE_DEBUG, "%@ did not have placemark location. Dropping it.", buf, 0xCu);

    }
    goto LABEL_22;
  }
  objc_msgSend(v13, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    GEOFindOrCreateLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A427D000, v20, OS_LOG_TYPE_DEBUG, "Portrait entry did not have placemark name. Dropping it.", buf, 2u);
    }
LABEL_22:
    v18 = 0;
    goto LABEL_26;
  }
  v59 = a1;
  v16 = [MapsSuggestionsEntry alloc];
  objc_msgSend(v13, "name");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[MapsSuggestionsEntry initWithType:title:](v16, "initWithType:title:", 17, v17);

  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKey:", *MEMORY[0x1E0C997E8]);
  v20 = objc_claimAutoreleasedReturnValue();

  v21 = objc_alloc(MEMORY[0x1E0D26EC8]);
  objc_msgSend(v13, "postalAddress");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27008], "sharedConfiguration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "countryCode");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v21, "initWithCNPostalAddress:language:country:phoneticLocale:", v22, v20, v24, v20);

  v58 = v25;
  objc_msgSend(v25, "shortAddress");
  v26 = objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
      dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
    if (s_verbose)
    {
      GEOFindOrCreateLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v26;
        _os_log_impl(&dword_1A427D000, v27, OS_LOG_TYPE_DEBUG, "Converted Address: %@", buf, 0xCu);
      }

    }
  }
  v57 = (void *)v26;
  -[MapsSuggestionsEntry setString:forKey:](v18, "setString:forKey:", v26, CFSTR("MapsSuggestionsDestinationAddressKey"));
  objc_msgSend(v13, "name");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[MapsSuggestionsEntry setString:forKey:](v18, "setString:forKey:", v28, CFSTR("MapsSuggestionsSearchStringKey"));

  objc_msgSend(v13, "_geoMapItem");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend(v13, "_geoMapItem");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    MapsSuggestionsMapItemConvertIfNeeded(v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[MapsSuggestionsEntry setGeoMapItem:](v18, "setGeoMapItem:", v31);

    -[MapsSuggestionsEntry setNumber:forKey:](v18, "setNumber:forKey:", &unk_1E4C09848, CFSTR("MapsSuggestionsGEOMapItemOriginKey"));
  }
  v32 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[MapsSuggestionsEntry title](v18, "title");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v32, "initWithFormat:", CFSTR("Portrait %@"), v33);
  -[MapsSuggestionsEntry setString:forKey:](v18, "setString:forKey:", v34, CFSTR("MapsSuggestionsPortraitPK"));

  -[MapsSuggestionsEntry setString:forKey:](v18, "setString:forKey:", CFSTR("MapsSuggestionsPortraitPK"), CFSTR("MapsSuggestionsPrimaryKey"));
  GEOConfigGetDouble();
  MapsSuggestionsNowWithOffset(v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[MapsSuggestionsEntry setExpires:](v18, "setExpires:", v36);

  GEOConfigGetDouble();
  v38 = v37;
  objc_msgSend(v11, "score");
  -[MapsSuggestionsEntry setWeight:](v18, "setWeight:", v38 * v39);
  if (MapsSuggestionsIsValidLocation(v14))
  {
    v40 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v14, "coordinate");
    objc_msgSend(v40, "numberWithDouble:");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[MapsSuggestionsEntry setNumber:forKey:](v18, "setNumber:forKey:", v41, CFSTR("MapsSuggestionsLatitudeKey"));

    v42 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v14, "coordinate");
    objc_msgSend(v42, "numberWithDouble:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[MapsSuggestionsEntry setNumber:forKey:](v18, "setNumber:forKey:", v44, CFSTR("MapsSuggestionsLongitudeKey"));

  }
  objc_msgSend(v12, "mostRelevantRecord");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "source");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "bundleId");
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    -[MapsSuggestionsEntry setString:forKey:](v18, "setString:forKey:", v47, CFSTR("MapsSuggestionsOriginBundleIDKey"));
    v48 = (objc_class *)MEMORY[0x1E0CA5870];
    v49 = v47;
    v50 = [v48 alloc];
    *(_QWORD *)buf = 0;
    v51 = (void *)objc_msgSend(v50, "initWithBundleIdentifier:allowPlaceholder:error:", v49, 0, buf);

    objc_msgSend(v51, "localizedName");
    v52 = objc_claimAutoreleasedReturnValue();

    -[MapsSuggestionsEntry setString:forKey:](v18, "setString:forKey:", v52, CFSTR("MapsSuggestionsOriginatingAppName"));
  }
  else
  {
    GEOFindOrCreateLog();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A427D000, v52, OS_LOG_TYPE_ERROR, "nil originatingBundleID", buf, 2u);
    }
  }

  a1 = v59;
LABEL_26:

  if (v18)
  {
    if (-[MapsSuggestionsEntry containsKey:](v18, "containsKey:", CFSTR("MapsSuggestionsGEOMapItemOriginKey")))
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v18);
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
      if (WeakRetained)
      {
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
        v55 = (void *)WeakRetained[2];
        v60[0] = MEMORY[0x1E0C809B0];
        v60[1] = 3221225472;
        v60[2] = __85__MapsSuggestionsPortrait_fetchLocationEntriesForTray_currentLocation_queue_handler___block_invoke_156;
        v60[3] = &unk_1E4BCF378;
        v61 = *(id *)(a1 + 40);
        v62 = v18;
        v63 = v11;
        v64 = *(id *)(a1 + 48);
        v66 = *(_BYTE *)(a1 + 72);
        v65 = *(id *)(a1 + 32);
        if ((GEOMapItemsFromMapsSuggestionsEntry(v62, v55, 1, v60) & 1) == 0)
          dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

        v56 = v61;
      }
      else
      {
        GEOFindOrCreateLog();
        v56 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          *(_QWORD *)&buf[4] = "MapsSuggestionsPortrait.m";
          *(_WORD *)&buf[12] = 1026;
          *(_DWORD *)&buf[14] = 167;
          v68 = 2082;
          v69 = "-[MapsSuggestionsPortrait fetchLocationEntriesForTray:currentLocation:queue:handler:]_block_invoke";
          _os_log_impl(&dword_1A427D000, v56, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
        }

      }
    }
  }

}

void __85__MapsSuggestionsPortrait_fetchLocationEntriesForTray_currentLocation_queue_handler___block_invoke_156(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  char *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  __objc2_class *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  const char *v36;
  double v37;
  double v38;
  double v39;
  int v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  __CFString *v45;
  int v46;
  void *v47;
  NSObject *v48;
  id v49;
  __objc2_class *v50;
  NSObject *v51;
  NSObject *v52;
  int v53;
  id v54;
  NSObject *v55;
  void *v57;
  void *v58;
  void *v59;
  const __CFString *v60;
  void *v61;
  uint64_t v62;
  id v63;
  id v64;
  id v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  id obj;
  uint64_t v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint8_t v75[4];
  void *v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  int v80;
  __int16 v81;
  __CFString *v82;
  uint8_t buf[4];
  const char *v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
LABEL_5:

      goto LABEL_77;
    }
    objc_msgSend(v6, "localizedDescription");
    v8 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v84 = v8;
    v9 = "Error while creating mapItem from MSgEntry: %@";
    v10 = v7;
    v11 = OS_LOG_TYPE_ERROR;
LABEL_4:
    _os_log_impl(&dword_1A427D000, v10, v11, v9, buf, 0xCu);

    goto LABEL_5;
  }
  v61 = 0;
  v62 = a1;
  v12 = *(void **)(a1 + 48);
  v13 = *(void **)(a1 + 56);
  v63 = v5;
  v14 = v5;
  v64 = v12;
  v15 = v13;
  GEOFindOrCreateLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v84 = "MapsSuggestionsMapItem *_relevantGEOMapItem(NSArray<MapsSuggestionsMapItem *> *__strong, PPScoredLocation *__s"
          "trong, CLLocation *__strong)";
    _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  objc_msgSend(v64, "location");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  obj = v14;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, buf, 16);
  if (!v18)
  {

    a1 = v62;
    v6 = 0;
    goto LABEL_50;
  }
  v19 = v18;
  v20 = 0;
  v68 = 0;
  v21 = &OBJC_METACLASS___MapsSuggestionsRatingRequestImprover;
  v70 = *(_QWORD *)v72;
  v65 = v15;
  while (2)
  {
    v22 = 0;
    v66 = v19;
    do
    {
      if (*(_QWORD *)v72 != v70)
        objc_enumerationMutation(obj);
      v23 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v22);
      if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
        dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
      if (LOBYTE(v21[89].info))
      {
        GEOFindOrCreateLog();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v23, "name");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v75 = 138412290;
          v76 = v25;
          _os_log_impl(&dword_1A427D000, v24, OS_LOG_TYPE_DEBUG, "Processing mapItem: %@", v75, 0xCu);

        }
      }
      if (v15)
      {
        v26 = objc_alloc(MEMORY[0x1E0C9E3B8]);
        objc_msgSend(v23, "coordinate");
        v28 = v27;
        objc_msgSend(v23, "coordinate");
        v29 = (void *)objc_msgSend(v26, "initWithLatitude:longitude:", v28);
        GEOConfigGetDouble();
        v31 = v30;
        objc_msgSend(v15, "distanceFromLocation:", v29);
        if (v31 < v32)
        {
          GEOFindOrCreateLog();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v23, "name");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v75 = 138412290;
            v76 = v34;
            v35 = v33;
            v36 = "Retrieved GEOMapItem (%@) is not within PortraitMaxValidDistance. Moving on to the next GEOMapItem";
LABEL_26:
            _os_log_impl(&dword_1A427D000, v35, OS_LOG_TYPE_DEBUG, v36, v75, 0xCu);

            goto LABEL_27;
          }
          goto LABEL_27;
        }
        GEOConfigGetDouble();
        v38 = v37;
        objc_msgSend(v15, "distanceFromLocation:", v29);
        if (v38 > v39)
        {
          GEOFindOrCreateLog();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v23, "name");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v75 = 138412290;
            v76 = v34;
            v35 = v33;
            v36 = "Retrieved GEOMapItem (%@) is within PortraitMinValidDistance. Moving on to the next GEOMapItem";
            goto LABEL_26;
          }
LABEL_27:

          goto LABEL_44;
        }

      }
      if (GEOConfigGetBOOL())
      {
        v50 = v21;
        v54 = v20;
        if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
          dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
        a1 = v62;
        v5 = v63;
        v6 = v61;
        if (LOBYTE(v50[89].info))
        {
          GEOFindOrCreateLog();
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)v75 = 0;
            _os_log_impl(&dword_1A427D000, v51, OS_LOG_TYPE_DEBUG, "MapsSuggestionsDisableGEOMapItemCategoryChecker turned on. Skipping matching on geoMapItem.", v75, 2u);
          }

        }
        v49 = v23;
        goto LABEL_71;
      }
      v40 = objc_msgSend(v23, "_placeType");
      if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
        dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
      if (LOBYTE(v21[89].info))
      {
        GEOFindOrCreateLog();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v17, "placemark");
          v67 = v20;
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "name");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromPPLocationCategory(objc_msgSend(v17, "category"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = off_1E4BCF570[v40];
          *(_DWORD *)v75 = 138413058;
          v76 = v43;
          v77 = 2112;
          v78 = v44;
          v79 = 1024;
          v80 = v68;
          v81 = 2112;
          v82 = v45;
          _os_log_impl(&dword_1A427D000, v41, OS_LOG_TYPE_DEBUG, "Name: %@; Portrait Category: %@; %d GEOMapItem Category: %@",
            v75,
            0x26u);

          v20 = v67;
          v21 = &OBJC_METACLASS___MapsSuggestionsRatingRequestImprover;
          v19 = v66;

          v15 = v65;
          LODWORD(v68) = v68 + 1;
        }

      }
      v46 = objc_msgSend(v17, "category", v61, v62, v63);
      if ((v46 - 1) < 2)
      {
        if (v40 != 10)
          goto LABEL_45;
        if ((v68 & 0x100000000) != 0)
        {
          v54 = v20;
          GEOFindOrCreateLog();
          v55 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
            goto LABEL_68;
          goto LABEL_69;
        }
      }
      else
      {
        if ((v46 - 3) >= 2)
        {
          v54 = v20;
          if (!v46)
            goto LABEL_70;
          GEOFindOrCreateLog();
          v52 = objc_claimAutoreleasedReturnValue();
          a1 = v62;
          v5 = v63;
          v6 = v61;
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          {
            v53 = objc_msgSend(v17, "category");
            *(_DWORD *)v75 = 67109120;
            LODWORD(v76) = v53;
            _os_log_impl(&dword_1A427D000, v52, OS_LOG_TYPE_ERROR, "Location Category %d not in our switch!", v75, 8u);
          }

          v49 = 0;
LABEL_71:

          v47 = v54;
          goto LABEL_72;
        }
        if ((v40 & 0xFFFFFFFD) != 8)
          goto LABEL_45;
        if ((v68 & 0x100000000) != 0)
        {
          v54 = v20;
          GEOFindOrCreateLog();
          v55 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
          {
LABEL_68:
            objc_msgSend(v17, "placemark");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "name");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v75 = 138412290;
            v76 = v58;
            _os_log_impl(&dword_1A427D000, v55, OS_LOG_TYPE_DEBUG, "Dropping Portrait Entry %@. More than 1 matching GEOMapItem's found", v75, 0xCu);

          }
LABEL_69:

LABEL_70:
          v49 = 0;
          a1 = v62;
          v5 = v63;
          v6 = v61;
          goto LABEL_71;
        }
      }
      v29 = v20;
      BYTE4(v68) = 1;
      v20 = v23;
LABEL_44:

LABEL_45:
      ++v22;
    }
    while (v19 != v22);
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, buf, 16);
    if (v19)
      continue;
    break;
  }
  v47 = v20;

  a1 = v62;
  v5 = v63;
  v6 = v61;
  if (!v20)
  {
LABEL_50:
    GEOFindOrCreateLog();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v75 = 0;
      _os_log_impl(&dword_1A427D000, v48, OS_LOG_TYPE_DEBUG, "No matching category mapItem found", v75, 2u);
    }

    v47 = 0;
  }
  v49 = (id)objc_msgSend(v47, "copy", v61, v62, v63);
LABEL_72:

  objc_msgSend(*(id *)(a1 + 40), "setGeoMapItem:", v49);
  objc_msgSend(*(id *)(a1 + 40), "geoMapItem");
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v59)
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      goto LABEL_5;
    objc_msgSend(*(id *)(a1 + 40), "title");
    v8 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v84 = v8;
    v9 = "nil mapItem. Dropping entry %@";
    v10 = v7;
    v11 = OS_LOG_TYPE_DEBUG;
    goto LABEL_4;
  }
  if (*(_BYTE *)(a1 + 72))
    v60 = CFSTR("mapstray");
  else
    v60 = CFSTR("mapspoi");
  objc_msgSend(*(id *)(a1 + 40), "setString:forKey:", v60, CFSTR("MapsSuggestionsPortraitClientIdentifier"), v61, v62, v63);
  objc_msgSend(*(id *)(a1 + 64), "addObject:", *(_QWORD *)(a1 + 40));
LABEL_77:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __85__MapsSuggestionsPortrait_fetchLocationEntriesForTray_currentLocation_queue_handler___block_invoke_163(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (BOOL)currentTripsWithHandler:(id)a3
{
  void (**v4)(id, void *, void *);
  NSArray *v5;
  NSArray *currentTrips;
  void *v7;
  void *v8;

  v4 = (void (**)(id, void *, void *))a3;
  v5 = self->_currentTrips;
  objc_sync_enter(v5);
  currentTrips = self->_currentTrips;
  if (currentTrips)
  {
    v7 = 0;
  }
  else
  {
    -[MapsSuggestionsPortrait _populateFutureAndCurrentTrips](self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    currentTrips = self->_currentTrips;
  }
  v8 = (void *)-[NSArray copy](currentTrips, "copy");
  v4[2](v4, v8, v7);

  objc_sync_exit(v5);
  return 1;
}

- (_QWORD)_populateFutureAndCurrentTrips
{
  _QWORD *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[6];
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v1 = a1;
  if (a1)
  {
    v2 = (void *)objc_opt_new();
    MapsSuggestionsNowWithOffset(-604800.0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setFromDate:", v3);

    MapsSuggestionsNowWithOffset(259200.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setToDate:", v4);

    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__6;
    v24 = __Block_byref_object_dispose__6;
    v25 = (id)objc_opt_new();
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__6;
    v18 = __Block_byref_object_dispose__6;
    v19 = (id)objc_opt_new();
    v5 = (void *)v1[1];
    v13 = 0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __57__MapsSuggestionsPortrait__populateFutureAndCurrentTrips__block_invoke;
    v12[3] = &unk_1E4BCF3F0;
    v12[4] = &v20;
    v12[5] = &v14;
    objc_msgSend(v5, "iterScoredEventsWithQuery:error:block:", v2, &v13, v12);
    v6 = v13;
    v7 = objc_msgSend((id)v21[5], "copy");
    v8 = (void *)v1[8];
    v1[8] = v7;

    v9 = objc_msgSend((id)v15[5], "copy");
    v10 = (void *)v1[9];
    v1[9] = v9;

    v1 = v6;
    _Block_object_dispose(&v14, 8);

    _Block_object_dispose(&v20, 8);
  }
  return v1;
}

- (BOOL)futureTripsWithHandler:(id)a3
{
  void (**v4)(id, void *, void *);
  NSArray *v5;
  NSArray *futureTrips;
  void *v7;
  void *v8;

  v4 = (void (**)(id, void *, void *))a3;
  v5 = self->_futureTrips;
  objc_sync_enter(v5);
  futureTrips = self->_futureTrips;
  if (futureTrips)
  {
    v7 = 0;
  }
  else
  {
    -[MapsSuggestionsPortrait _populateFutureAndCurrentTrips](self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    futureTrips = self->_futureTrips;
  }
  v8 = (void *)-[NSArray copy](futureTrips, "copy");
  v4[2](v4, v8, v7);

  objc_sync_exit(v5);
  return 1;
}

void __57__MapsSuggestionsPortrait__populateFutureAndCurrentTrips__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  MapsSuggestionsTrip *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  MapsSuggestionsTrip *v21;
  const char *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  _BOOL4 v29;
  NSObject *v30;
  uint8_t v31[24];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  GEOFindOrCreateLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v31 = 138412290;
    *(_QWORD *)&v31[4] = v3;
    _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_INFO, "Treating potential trip event: %@", v31, 0xCu);
  }

  v5 = v3;
  objc_msgSend(v5, "startDate");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6
    || (v7 = (void *)v6,
        objc_msgSend(v5, "endDate"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        !v8))
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
LABEL_12:
      v21 = 0;
      goto LABEL_17;
    }
    *(_DWORD *)v31 = 138412290;
    *(_QWORD *)&v31[4] = v5;
    v22 = "Trip event is missing both start and end date: %@";
LABEL_11:
    _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_INFO, v22, v31, 0xCu);
    goto LABEL_12;
  }
  objc_msgSend(v5, "tripParts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (!v10)
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      goto LABEL_12;
    *(_DWORD *)v31 = 138412290;
    *(_QWORD *)&v31[4] = v5;
    v22 = "Trip event %@ has no parts";
    goto LABEL_11;
  }
  objc_msgSend(v5, "tripParts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = objc_claimAutoreleasedReturnValue();

  -[NSObject mainLocation](v12, "mainLocation");
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
    goto LABEL_13;
  v14 = (void *)v13;
  -[NSObject mainLocation](v12, "mainLocation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "location");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = [MapsSuggestionsTrip alloc];
    -[NSObject mainLocation](v12, "mainLocation");
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[MapsSuggestionsTrip initWithPlacemark:startDate:endDate:](v17, "initWithPlacemark:startDate:endDate:", v18, v19, v20);

  }
  else
  {
LABEL_13:
    GEOFindOrCreateLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v31 = 138412290;
      *(_QWORD *)&v31[4] = v5;
      _os_log_impl(&dword_1A427D000, v18, OS_LOG_TYPE_INFO, "Trip event %@ does not have a valid location", v31, 0xCu);
    }
    v21 = 0;
  }

LABEL_17:
  if (v21)
  {
    -[MapsSuggestionsTrip startDate](v21, "startDate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (MapsSuggestionsIsInThePast(v23))
    {
      -[MapsSuggestionsTrip endDate](v21, "endDate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = MapsSuggestionsIsInTheFuture(v24);

      if (v25)
      {
        GEOFindOrCreateLog();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v31 = 138412290;
          *(_QWORD *)&v31[4] = v21;
          _os_log_impl(&dword_1A427D000, v26, OS_LOG_TYPE_INFO, "Trip event started before current time and ends after: %@", v31, 0xCu);
        }

        v27 = *(_QWORD *)(a1 + 32);
LABEL_28:
        objc_msgSend(*(id *)(*(_QWORD *)(v27 + 8) + 40), "addObject:", v21, *(_OWORD *)v31);
        goto LABEL_29;
      }
    }
    else
    {

    }
    -[MapsSuggestionsTrip startDate](v21, "startDate", *(_OWORD *)v31);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = MapsSuggestionsIsInTheFuture(v28);

    if (v29)
    {
      GEOFindOrCreateLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v31 = 138412290;
        *(_QWORD *)&v31[4] = v21;
        _os_log_impl(&dword_1A427D000, v30, OS_LOG_TYPE_INFO, "Trip event will start in future: %@", v31, 0xCu);
      }

      v27 = *(_QWORD *)(a1 + 40);
      goto LABEL_28;
    }
  }
LABEL_29:

}

- (void)sendFeedbackforClientID:(id)a3 storeType:(int64_t)a4 explicitlyEngagedStrings:(id)a5 explicitlyRejectedStrings:(id)a6 implicitlyEngagedStrings:(id)a7 implicitlyRejectedStrings:(id)a8
{
  objc_class *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;

  v20 = a3;
  v14 = (objc_class *)MEMORY[0x1E0D70B58];
  v15 = a8;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = (void *)objc_msgSend([v14 alloc], "initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:", v18, v17, v16, v15);

  if (a4)
  {
    if (a4 == 2)
    {
      -[MapsSuggestionsPortraitConnector connectionsStore_registerFeedback:clientIdentifier:completion:](self->_connector, "connectionsStore_registerFeedback:clientIdentifier:completion:", v19, v20, &__block_literal_global_169);
    }
    else if (a4 == 1)
    {
      -[MapsSuggestionsPortraitConnector locationStore_registerFeedback:clientIdentifier:completion:](self->_connector, "locationStore_registerFeedback:clientIdentifier:completion:", v19, v20, &__block_literal_global_12);
    }
  }
  else
  {
    -[MapsSuggestionsPortraitConnector namedEntityStore_registerFeedback:clientIdentifier:completion:](self->_connector, "namedEntityStore_registerFeedback:clientIdentifier:completion:", v19, v20, &__block_literal_global_171);
  }

}

void __163__MapsSuggestionsPortrait_sendFeedbackforClientID_storeType_explicitlyEngagedStrings_explicitlyRejectedStrings_implicitlyEngagedStrings_implicitlyRejectedStrings___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4 || (a2 & 1) == 0)
  {
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "received error in sending feedback to Location Store %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

void __163__MapsSuggestionsPortrait_sendFeedbackforClientID_storeType_explicitlyEngagedStrings_explicitlyRejectedStrings_implicitlyEngagedStrings_implicitlyRejectedStrings___block_invoke_168(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4 || (a2 & 1) == 0)
  {
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "received error in sending feedback to Connections store %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

void __163__MapsSuggestionsPortrait_sendFeedbackforClientID_storeType_explicitlyEngagedStrings_explicitlyRejectedStrings_implicitlyEngagedStrings_implicitlyRejectedStrings___block_invoke_170(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4 || (a2 & 1) == 0)
  {
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "received error in sending feedback to Named Entity store %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (BOOL)fetchConnectionEntriesWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *queue;
  id *v9;
  id *v10;
  id v11;
  _QWORD *v12;
  NSObject *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  id location;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_initWeak(&location, self);
  GEOFindOrCreateLog();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsPortrait uniqueName](self, "uniqueName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v24 = v6;
    v25 = 2080;
    v26 = "fetchConnectionEntriesWithHandler";
    _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

  }
  GEOFindOrCreateLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "fetchConnectionEntriesWithHandler", ", buf, 2u);
  }

  if (+[MapsSuggestionsSiri isEnabled](MapsSuggestionsSiri, "isEnabled"))
  {
    queue = self->_queue;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __61__MapsSuggestionsPortrait_fetchConnectionEntriesWithHandler___block_invoke_231;
    v16[3] = &unk_1E4BCEB98;
    v9 = &v18;
    objc_copyWeak(&v18, &location);
    v10 = &v17;
    v17 = v4;
    v11 = v4;
    v12 = v16;
  }
  else
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_DEBUG, "User turned off Siri: we're not using our suggestions", buf, 2u);
    }

    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__MapsSuggestionsPortrait_fetchConnectionEntriesWithHandler___block_invoke;
    block[3] = &unk_1E4BCEB98;
    v9 = &v21;
    objc_copyWeak(&v21, &location);
    v10 = &v20;
    v20 = v4;
    v14 = v4;
    v12 = block;
  }
  dispatch_async(queue, v12);

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
  return 1;
}

void __61__MapsSuggestionsPortrait_fetchConnectionEntriesWithHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  NSObject *v4;
  char *v5;
  NSObject *v6;
  int v7;
  char *v8;
  __int16 v9;
  _WORD v10[17];

  *(_QWORD *)&v10[13] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "BUGHUNT 0x", (uint8_t *)&v7, 2u);
    }

    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(WeakRetained, "uniqueName");
      v5 = (char *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = v5;
      v9 = 2080;
      *(_QWORD *)v10 = "fetchConnectionEntriesWithHandler";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v7, 0x16u);

    }
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v6))
    {
      LOWORD(v7) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "fetchConnectionEntriesWithHandler", ", (uint8_t *)&v7, 2u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 136446722;
      v8 = "MapsSuggestionsPortrait.m";
      v9 = 1026;
      *(_DWORD *)v10 = 553;
      v10[2] = 2082;
      *(_QWORD *)&v10[3] = "-[MapsSuggestionsPortrait fetchConnectionEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v7, 0x1Cu);
    }

  }
}

void __61__MapsSuggestionsPortrait_fetchConnectionEntriesWithHandler___block_invoke_231(uint64_t a1)
{
  id *v2;
  _QWORD *WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t Integer;
  uint64_t v8;
  char v9;
  id v10;
  double v11;
  double v12;
  NSObject *v13;
  NSObject *v14;
  char v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  int v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  double v41;
  NSObject *v42;
  const char *v43;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  NSObject *v47;
  os_log_type_t v48;
  double v49;
  int v50;
  void *v51;
  NSObject *v52;
  NSObject *v53;
  void *v54;
  NSObject *v55;
  _QWORD v56[4];
  id v57;
  id v58;
  _QWORD v59[6];
  id v60;
  uint8_t v61[8];
  uint64_t v62;
  _BYTE buf[12];
  __int16 v64;
  const char *v65;
  _BYTE v66[32];
  void (*v67)(uint64_t);
  id v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    *(_QWORD *)v66 = 0;
    *(_QWORD *)&v66[8] = v66;
    *(_QWORD *)&v66[16] = 0x3032000000;
    *(_QWORD *)&v66[24] = __Block_byref_object_copy__6;
    v67 = __Block_byref_object_dispose__6;
    v68 = 0;
    MapsSuggestionsNow();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)WeakRetained[1];
    v6 = WeakRetained[3];
    Integer = GEOConfigGetInteger();
    v60 = 0;
    v8 = MEMORY[0x1E0C809B0];
    v59[0] = MEMORY[0x1E0C809B0];
    v59[1] = 3221225472;
    v59[2] = __61__MapsSuggestionsPortrait_fetchConnectionEntriesWithHandler___block_invoke_234;
    v59[3] = &unk_1E4BCF498;
    v59[4] = WeakRetained;
    v59[5] = v66;
    v9 = objc_msgSend(v5, "iterRecentLocationsForConsumer:criteria:limit:client:error:block:", 2, v6, Integer, CFSTR("MapsSuggestions"), &v60, v59);
    v10 = v60;
    v11 = MapsSuggestionsSecondsSince(v4);
    GEOConfigGetDouble();
    if (v11 > v12)
    {
      GEOFindOrCreateLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(double *)&buf[4] = v11;
        _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_FAULT, "AppConnection SPI took too long to call back %.3f", buf, 0xCu);
      }

    }
    GEOFindOrCreateLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_DEBUG, "BUGHUNT 1", buf, 2u);
    }

    if (v10)
      v15 = 0;
    else
      v15 = v9;
    if ((v15 & 1) != 0)
    {
      GEOFindOrCreateLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_DEBUG, "BUGHUNT 2", buf, 2u);
      }

      if (*(_QWORD *)(*(_QWORD *)&v66[8] + 40))
      {
        GEOFindOrCreateLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A427D000, v17, OS_LOG_TYPE_DEBUG, "BUGHUNT 3", buf, 2u);
        }

        objc_msgSend(*(id *)(*(_QWORD *)&v66[8] + 40), "stringForKey:", CFSTR("MapsSuggestionsAppConnectionOriginatingURLString"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18)
        {
          v20 = v18;
        }
        else
        {
          objc_msgSend(*(id *)(*(_QWORD *)&v66[8] + 40), "uniqueIdentifier");
          v20 = objc_claimAutoreleasedReturnValue();
        }
        v25 = v20;

        if (WeakRetained[4] && WeakRetained[5])
          v30 = -[NSObject isEqualToString:](v25, "isEqualToString:");
        else
          v30 = 0;
        GEOFindOrCreateLog();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A427D000, v31, OS_LOG_TYPE_DEBUG, "BUGHUNT 4", buf, 2u);
        }

        if (!v30)
        {
          GEOFindOrCreateLog();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A427D000, v44, OS_LOG_TYPE_DEBUG, "BUGHUNT 5", buf, 2u);
          }

          v45 = *(void **)(*(_QWORD *)&v66[8] + 40);
          v56[0] = v8;
          v56[1] = 3221225472;
          v56[2] = __61__MapsSuggestionsPortrait_fetchConnectionEntriesWithHandler___block_invoke_239;
          v56[3] = &unk_1E4BCF4C0;
          objc_copyWeak(&v58, v2);
          v57 = *(id *)(a1 + 32);
          -[MapsSuggestionsPortrait _geoMapItemsFromMapsSuggestionsEntry:handle:](WeakRetained, v45, v56);
          GEOFindOrCreateLog();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A427D000, v46, OS_LOG_TYPE_DEBUG, "BUGHUNT 6", buf, 2u);
          }

          objc_destroyWeak(&v58);
          goto LABEL_77;
        }
        GEOFindOrCreateLog();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A427D000, v32, OS_LOG_TYPE_DEBUG, "Using cached MapItem", buf, 2u);
        }

        objc_msgSend(*(id *)(*(_QWORD *)&v66[8] + 40), "setGeoMapItem:", WeakRetained[5]);
        objc_msgSend(*(id *)(*(_QWORD *)&v66[8] + 40), "stringForKey:", CFSTR("MapsSuggestionsAppConnectionValueKey"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "isEqualToString:", &stru_1E4BDFC28);

        if (v34)
        {
          v35 = *(void **)(*(_QWORD *)&v66[8] + 40);
          objc_msgSend(v35, "geoMapItem");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "name");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setString:forKey:", v37, CFSTR("MapsSuggestionsAppConnectionValueKey"));

        }
        objc_msgSend(*(id *)(*(_QWORD *)&v66[8] + 40), "setNumber:forKey:", WeakRetained[6], CFSTR("MapsSuggestionsGEOMapItemOriginKey"));
        v38 = *(_QWORD *)(a1 + 32);
        v39 = *(id *)(*(_QWORD *)&v66[8] + 40);
        if (!v39)
          goto LABEL_67;
        v40 = v39;
        *(_QWORD *)buf = 0;
        if (MapsSuggestionsDistanceFromHereToEntry(v39, buf))
        {
          GEOConfigGetDouble();
          if (v41 >= *(double *)buf)
          {
            GEOConfigGetDouble();
            if (v49 <= *(double *)buf)
            {

              v62 = *(_QWORD *)(*(_QWORD *)&v66[8] + 40);
              v50 = 1;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v62, 1);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_68;
            }
            GEOFindOrCreateLog();
            v42 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
              goto LABEL_66;
            *(_WORD *)v61 = 0;
            v43 = "Entry is within AppConnectionMinValidDistance. Moving on to the next GEOMapItem";
            goto LABEL_64;
          }
          GEOFindOrCreateLog();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)v61 = 0;
            v43 = "Entry is not within AppConnectionMaxValidDistance. Moving on to the next GEOMapItem";
LABEL_64:
            v47 = v42;
            v48 = OS_LOG_TYPE_DEBUG;
            goto LABEL_65;
          }
        }
        else
        {
          GEOFindOrCreateLog();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v61 = 0;
            v43 = "Entry has no distance available";
            v47 = v42;
            v48 = OS_LOG_TYPE_ERROR;
LABEL_65:
            _os_log_impl(&dword_1A427D000, v47, v48, v43, v61, 2u);
          }
        }
LABEL_66:

LABEL_67:
        v50 = 0;
        v51 = (void *)MEMORY[0x1E0C9AA60];
LABEL_68:
        (*(void (**)(uint64_t, void *, _QWORD))(v38 + 16))(v38, v51, 0);
        if (v50)

        GEOFindOrCreateLog();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A427D000, v52, OS_LOG_TYPE_DEBUG, "BUGHUNT 4x", buf, 2u);
        }

        GEOFindOrCreateLog();
        v53 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(WeakRetained, "uniqueName");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v54;
          v64 = 2080;
          v65 = "fetchConnectionEntriesWithHandler";
          _os_log_impl(&dword_1A427D000, v53, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);

        }
        GEOFindOrCreateLog();
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v55))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A427D000, v55, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "fetchConnectionEntriesWithHandler", ", buf, 2u);
        }

        goto LABEL_77;
      }
      GEOFindOrCreateLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A427D000, v26, OS_LOG_TYPE_DEBUG, "No entries to make out of AppConnection.", buf, 2u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      GEOFindOrCreateLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A427D000, v27, OS_LOG_TYPE_DEBUG, "BUGHUNT 2x", buf, 2u);
      }

      GEOFindOrCreateLog();
      v28 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(WeakRetained, "uniqueName");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v29;
        v64 = 2080;
        v65 = "fetchConnectionEntriesWithHandler";
        _os_log_impl(&dword_1A427D000, v28, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);

      }
      GEOFindOrCreateLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (!os_signpost_enabled(v25))
        goto LABEL_77;
      *(_WORD *)buf = 0;
    }
    else
    {
      GEOFindOrCreateLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v10;
        _os_log_impl(&dword_1A427D000, v22, OS_LOG_TYPE_ERROR, "Error receiving locations from AppConnection %@.", buf, 0xCu);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      GEOFindOrCreateLog();
      v23 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(WeakRetained, "uniqueName");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v24;
        v64 = 2080;
        v65 = "fetchConnectionEntriesWithHandler";
        _os_log_impl(&dword_1A427D000, v23, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);

      }
      GEOFindOrCreateLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (!os_signpost_enabled(v25))
        goto LABEL_77;
      *(_WORD *)buf = 0;
    }
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v25, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "fetchConnectionEntriesWithHandler", ", buf, 2u);
LABEL_77:

    _Block_object_dispose(v66, 8);
    goto LABEL_78;
  }
  GEOFindOrCreateLog();
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v66 = 136446722;
    *(_QWORD *)&v66[4] = "MapsSuggestionsPortrait.m";
    *(_WORD *)&v66[12] = 1026;
    *(_DWORD *)&v66[14] = 562;
    *(_WORD *)&v66[18] = 2082;
    *(_QWORD *)&v66[20] = "-[MapsSuggestionsPortrait fetchConnectionEntriesWithHandler:]_block_invoke";
    _os_log_impl(&dword_1A427D000, v21, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", v66, 0x1Cu);
  }

LABEL_78:
}

void __61__MapsSuggestionsPortrait_fetchConnectionEntriesWithHandler___block_invoke_234(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __CFString *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  const __CFString *v41;
  void *v42;
  id v43;
  NSObject *v44;
  id v45;
  __CFString *v46;
  const __CFString *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  NSObject *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  NSObject *v67;
  NSObject *v68;
  uint64_t v69;
  __CFString *v70;
  NSObject *v71;
  const char *v72;
  uint64_t v73;
  const __CFString *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  __CFString *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t j;
  void *v84;
  uint64_t v85;
  const __CFString *v86;
  void *v87;
  id v88;
  NSObject *v89;
  id v90;
  __CFString *v91;
  const __CFString *v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  BOOL v102;
  void *v103;
  NSObject *v104;
  void *v105;
  void *v106;
  void *v107;
  NSObject *v108;
  void *v109;
  double v110;
  double v111;
  void *v112;
  void *v113;
  void *v114;
  double v115;
  void *v116;
  NSObject *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  NSObject *v122;
  void *v123;
  void *v124;
  void *v125;
  NSObject *v126;
  void *v127;
  NSObject *v128;
  uint64_t v129;
  void *v130;
  NSObject *v131;
  int v132;
  void *v133;
  void *v134;
  void *v135;
  NSObject *v136;
  void *v137;
  void *v138;
  void *v139;
  id v140;
  void *v141;
  void *v142;
  double v143;
  double v144;
  double v145;
  void *v146;
  NSObject *v147;
  double v148;
  double v149;
  MapsSuggestionsEntry *v150;
  uint64_t v151;
  void *v152;
  const __CFString *v153;
  MapsSuggestionsEntry *v154;
  NSObject *v155;
  uint64_t v156;
  void *v157;
  void *v158;
  void *v159;
  id v160;
  void *v161;
  NSObject *v162;
  uint64_t v163;
  void *v164;
  void *v165;
  void *v166;
  NSObject *v167;
  __CFString *v168;
  void *v169;
  uint64_t v170;
  uint64_t v171;
  _BYTE *v172;
  _BYTE *v173;
  uint64_t v174;
  void *v175;
  void *v176;
  void *v177;
  const __CFString *v178;
  const __CFString *v179;
  const __CFString *v180;
  const __CFString *v181;
  const __CFString *v182;
  const __CFString *v183;
  const __CFString *v184;
  const __CFString *v185;
  const __CFString *v186;
  const __CFString *v187;
  const __CFString *v188;
  void *v189;
  const __CFString *v190;
  const __CFString *v191;
  _BYTE buf[12];
  __int16 v193;
  _BYTE v194[14];
  __int16 v195;
  const char *v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  uint64_t v201;

  v201 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  GEOFindOrCreateLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v5, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v7;
    v193 = 2112;
    *(_QWORD *)v194 = v8;
    _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_DEBUG, "Received a new Location from AppConnection: Name %@, Value:%@", buf, 0x16u);

  }
  v9 = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v174 = v9;
  if (!v9)
  {
    v39 = 0;
    goto LABEL_170;
  }
  v11 = (void *)MEMORY[0x1A859CDD8]();
  v12 = v10;
  objc_msgSend(v12, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v177 = v12;
  if (v13)
  {
    GEOConfigGetDouble();
    v15 = v14;
    objc_msgSend(v12, "createdAt");
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lifetime");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "doubleValue");
    v19 = v18;

    v175 = v13;
    if (v19 == 0.0)
    {
      GEOConfigGetDouble();
      v19 = v20;
    }
    v167 = v16;
    v163 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeInterval:sinceDate:", v16, v19);
    v178 = CFSTR("MapsSuggestionsOriginBundleIDKey");
    objc_msgSend(v12, "originatingBundleID");
    v21 = objc_claimAutoreleasedReturnValue();
    v165 = (void *)v21;
    if (v21)
      v22 = (const __CFString *)v21;
    else
      v22 = &stru_1E4BDFC28;
    v185 = v22;
    v179 = CFSTR("MapsSuggestionsAppConnectionValueKey");
    objc_msgSend(v12, "value");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    if (!v23)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v158, "UUIDString");
      v23 = objc_claimAutoreleasedReturnValue();
    }
    v169 = v11;
    v159 = (void *)v23;
    v186 = (const __CFString *)v23;
    v180 = CFSTR("MapsSuggestionsDestinationAddressKey");
    objc_msgSend(v12, "value");
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v25;
    if (v25)
      v27 = (const __CFString *)v25;
    else
      v27 = &stru_1E4BDFC28;
    v187 = v27;
    v188 = CFSTR("MapsSuggestionsAppConnectionValueKey");
    v181 = CFSTR("MapsSuggestionsPrimaryKey");
    v182 = CFSTR("MapsSuggestionsAppConnectionIdentifierKey");
    objc_msgSend(v12, "identifier");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    v189 = v161;
    v183 = CFSTR("MapsSuggestionsAppConnectionOriginatingWebsiteName");
    objc_msgSend(v12, "originatingWebsiteURL");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    v170 = a1;
    v172 = a3;
    if (v28)
    {
      objc_msgSend(v28, "host");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v30;
      if (v30)
      {
        v32 = v30;
        v197 = 0u;
        v198 = 0u;
        v199 = 0u;
        v200 = 0u;
        v33 = objc_msgSend(&unk_1E4C09F48, "countByEnumeratingWithState:objects:count:", &v197, buf, 16);
        if (v33)
        {
          v34 = v33;
          v35 = *(_QWORD *)v198;
          while (2)
          {
            for (i = 0; i != v34; ++i)
            {
              if (*(_QWORD *)v198 != v35)
                objc_enumerationMutation(&unk_1E4C09F48);
              v37 = *(void **)(*((_QWORD *)&v197 + 1) + 8 * i);
              if (-[__CFString hasPrefix:](v32, "hasPrefix:", v37))
              {
                -[__CFString substringFromIndex:](v32, "substringFromIndex:", objc_msgSend(v37, "length"));
                v40 = objc_claimAutoreleasedReturnValue();

                v32 = (__CFString *)v40;
                goto LABEL_32;
              }
            }
            v34 = objc_msgSend(&unk_1E4C09F48, "countByEnumeratingWithState:objects:count:", &v197, buf, 16);
            if (v34)
              continue;
            break;
          }
        }
      }
      else
      {
        v32 = 0;
      }
LABEL_32:

    }
    else
    {
      v32 = 0;
    }

    if (v32)
      v41 = v32;
    else
      v41 = &stru_1E4BDFC28;
    v190 = v41;
    v184 = CFSTR("MapsSuggestionsOriginatingAppName");
    objc_msgSend(v177, "originatingBundleID");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (v42)
    {
      v43 = objc_alloc(MEMORY[0x1E0CA5870]);
      *(_QWORD *)buf = 0;
      v44 = objc_msgSend(v43, "initWithBundleIdentifier:allowPlaceholder:error:", v42, 0, buf);
      v45 = *(id *)buf;
      -[NSObject localizedName](v44, "localizedName");
      v46 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      GEOFindOrCreateLog();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPortrait.m";
        v193 = 1024;
        *(_DWORD *)v194 = 972;
        *(_WORD *)&v194[4] = 2082;
        *(_QWORD *)&v194[6] = "NSString *_appName(NSString *__strong)";
        v195 = 2082;
        v196 = "nil == (appId)";
        _os_log_impl(&dword_1A427D000, v44, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an appId", buf, 0x26u);
      }
      v46 = 0;
    }

    if (v46)
      v47 = v46;
    else
      v47 = &stru_1E4BDFC28;
    v191 = v47;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v185, &v178, 7);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)objc_msgSend(v48, "mutableCopy");

    if (!v24)
    {

    }
    objc_msgSend(v177, "contactHandles");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v50, "count"))
    {
      v51 = *(void **)(v174 + 56);
      objc_msgSend(v50, "objectAtIndexedSubscript:", 0);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "contactNameForIdentifier:", v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v53 = 0;
    }
    objc_msgSend(v177, "originatingBundleID");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v54, "isEqualToString:", MapsSuggestionsMessagesAppBundleID))
    {
      if (!v53)
      {

LABEL_60:
        GEOFindOrCreateLog();
        v60 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A427D000, v60, OS_LOG_TYPE_ERROR, "Dropping entry because we did not get this AppConnection from a known contact", buf, 2u);
        }

        v39 = 0;
        v12 = v177;
        v59 = (void *)v163;
LABEL_63:

        v13 = v175;
        v38 = v167;
        a3 = v172;
        v11 = v169;
        a1 = v170;
        goto LABEL_64;
      }
      v55 = objc_msgSend(v53, "length");

      if (!v55)
        goto LABEL_60;
    }
    else
    {

    }
    GEOFindOrCreateLog();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v53;
      _os_log_impl(&dword_1A427D000, v56, OS_LOG_TYPE_DEBUG, "Received a message from %@", buf, 0xCu);
    }

    v12 = v177;
    objc_msgSend(v177, "mapItemURL");
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (v57)
    {
      objc_msgSend(v177, "mapItemURL");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setObject:forKeyedSubscript:", v58, CFSTR("MapsSuggestionsAppConnectionMapItemURL"));

    }
    v59 = (void *)v163;
    +[MapsSuggestionsEntry entryWithType:title:subtitle:weight:expires:sourceSpecificInfo:](MapsSuggestionsEntry, "entryWithType:title:subtitle:weight:expires:sourceSpecificInfo:", 12, v175, 0, v163, v49, v15);
    v39 = objc_claimAutoreleasedReturnValue();
    goto LABEL_63;
  }
  GEOFindOrCreateLog();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A427D000, v38, OS_LOG_TYPE_DEBUG, "App Connection location has no title", buf, 2u);
  }
  v39 = 0;
LABEL_64:

  if (!v39)
  {
    v160 = v10;
    objc_msgSend(v12, "mapItemURL");
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v61)
    {
      GEOFindOrCreateLog();
      v62 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A427D000, v62, OS_LOG_TYPE_DEBUG, "Missing mapItemURL in PPConnectionsLocation, returning nil.", buf, 2u);
      }
      v39 = 0;
      goto LABEL_168;
    }
    objc_msgSend(v12, "mapItemURL");
    v62 = objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
    {
      -[NSObject absoluteString](v62, "absoluteString");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v64;
      _os_log_impl(&dword_1A427D000, v63, OS_LOG_TYPE_DEBUG, "url = %@", buf, 0xCu);

    }
    objc_msgSend(v12, "originatingBundleID");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v65, "caseInsensitiveCompare:", MapsSuggestionsMessagesAppBundleID))
    {
      GEOFindOrCreateLog();
      v66 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A427D000, v66, OS_LOG_TYPE_DEBUG, "App Connection URL's originating Bundle ID was NOT MobileSMS, so kicking it out", buf, 2u);
      }
      v39 = 0;
      goto LABEL_167;
    }
    objc_msgSend(v12, "originatingBundleID");
    v67 = objc_claimAutoreleasedReturnValue();
    v66 = v67;
    v176 = v65;
    if (v67)
    {
      if (-[NSObject caseInsensitiveCompare:](v67, "caseInsensitiveCompare:", CFSTR("com.apple.Maps")))
      {

        v66 = objc_msgSend(objc_alloc(MEMORY[0x1E0D27230]), "initWithURL:", v62);
        -[NSObject parseIncludingCustomParameters:](v66, "parseIncludingCustomParameters:", 1);
        GEOFindOrCreateLog();
        v68 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
        {
          v69 = -[NSObject transportType](v66, "transportType");
          if (v69 >= 7)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v69);
            v70 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v70 = off_1E4BCF618[(int)v69];
          }
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v70;
          _os_log_impl(&dword_1A427D000, v68, OS_LOG_TYPE_DEBUG, "urlParser.transportType:%@", buf, 0xCu);

        }
        v171 = a1;
        v173 = a3;

        v178 = CFSTR("MapsSuggestionsPrimaryKey");
        v179 = CFSTR("MapsSuggestionsAppConnectionValueKey");
        v185 = CFSTR("MapsSuggestionsAppConnectionValueKey");
        v186 = &stru_1E4BDFC28;
        v180 = CFSTR("MapsSuggestionsAppConnectionOriginatingURLString");
        -[NSObject absoluteString](v62, "absoluteString");
        v168 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v187 = v168;
        v181 = CFSTR("MapsSuggestionsOriginBundleIDKey");
        objc_msgSend(v12, "originatingBundleID");
        v73 = objc_claimAutoreleasedReturnValue();
        v166 = (void *)v73;
        if (v73)
          v74 = (const __CFString *)v73;
        else
          v74 = &stru_1E4BDFC28;
        v188 = v74;
        v182 = CFSTR("MapsSuggestionsAppConnectionIdentifierKey");
        objc_msgSend(v12, "identifier");
        v164 = (void *)objc_claimAutoreleasedReturnValue();
        v189 = v164;
        v183 = CFSTR("MapsSuggestionsAppConnectionOriginatingWebsiteName");
        objc_msgSend(v12, "originatingWebsiteURL");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = v75;
        if (v75)
        {
          objc_msgSend(v75, "host");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = v77;
          if (v77)
          {
            v79 = v77;
            v197 = 0u;
            v198 = 0u;
            v199 = 0u;
            v200 = 0u;
            v80 = objc_msgSend(&unk_1E4C09F48, "countByEnumeratingWithState:objects:count:", &v197, buf, 16);
            if (v80)
            {
              v81 = v80;
              v162 = v62;
              v82 = *(_QWORD *)v198;
              while (2)
              {
                for (j = 0; j != v81; ++j)
                {
                  if (*(_QWORD *)v198 != v82)
                    objc_enumerationMutation(&unk_1E4C09F48);
                  v84 = *(void **)(*((_QWORD *)&v197 + 1) + 8 * j);
                  if (-[__CFString hasPrefix:](v79, "hasPrefix:", v84))
                  {
                    -[__CFString substringFromIndex:](v79, "substringFromIndex:", objc_msgSend(v84, "length"));
                    v85 = objc_claimAutoreleasedReturnValue();

                    v79 = (__CFString *)v85;
                    goto LABEL_104;
                  }
                }
                v81 = objc_msgSend(&unk_1E4C09F48, "countByEnumeratingWithState:objects:count:", &v197, buf, 16);
                if (v81)
                  continue;
                break;
              }
LABEL_104:
              v62 = v162;
            }
          }
          else
          {
            v79 = 0;
          }

        }
        else
        {
          v79 = 0;
        }

        if (v79)
          v86 = v79;
        else
          v86 = &stru_1E4BDFC28;
        v190 = v86;
        v184 = CFSTR("MapsSuggestionsOriginatingAppName");
        objc_msgSend(v177, "originatingBundleID");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        if (v87)
        {
          v88 = objc_alloc(MEMORY[0x1E0CA5870]);
          *(_QWORD *)buf = 0;
          v89 = objc_msgSend(v88, "initWithBundleIdentifier:allowPlaceholder:error:", v87, 0, buf);
          v90 = *(id *)buf;
          -[NSObject localizedName](v89, "localizedName");
          v91 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          GEOFindOrCreateLog();
          v89 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446978;
            *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPortrait.m";
            v193 = 1024;
            *(_DWORD *)v194 = 972;
            *(_WORD *)&v194[4] = 2082;
            *(_QWORD *)&v194[6] = "NSString *_appName(NSString *__strong)";
            v195 = 2082;
            v196 = "nil == (appId)";
            _os_log_impl(&dword_1A427D000, v89, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an appId", buf, 0x26u);
          }
          v91 = 0;
        }

        if (v91)
          v92 = v91;
        else
          v92 = &stru_1E4BDFC28;
        v191 = v92;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v185, &v178, 7);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = (void *)objc_msgSend(v93, "mutableCopy");

        objc_msgSend(v177, "originatingBundleID");
        v95 = (void *)objc_claimAutoreleasedReturnValue();

        if (v95)
        {
          v96 = objc_alloc(MEMORY[0x1E0C99E60]);
          objc_msgSend(v177, "originatingBundleID");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&v197 = v97;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v197, 1);
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          v99 = (void *)objc_msgSend(v96, "initWithArray:", v98);

          objc_msgSend(0, "setSet:forKey:", v99, CFSTR("MapsSuggestionsAssociatedBundleIDsKey"));
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[NSObject transportType](v66, "transportType"));
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "setObject:forKey:", v100, CFSTR("MapsSuggestionsTransportTypeKey"));

        -[NSObject addressString](v66, "addressString");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        v102 = v101 != 0;

        a3 = v173;
        if (v101)
        {
          -[NSObject addressString](v66, "addressString");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "setObject:forKey:", v103, CFSTR("MapsSuggestionsDestinationAddressKey"));

          GEOFindOrCreateLog();
          v104 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v104, OS_LOG_TYPE_DEBUG))
          {
            -[NSObject addressString](v66, "addressString");
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v105;
            _os_log_impl(&dword_1A427D000, v104, OS_LOG_TYPE_DEBUG, "urlParser.addressString: %@", buf, 0xCu);

          }
        }
        -[NSObject directionsDestinationAddressString](v66, "directionsDestinationAddressString");
        v106 = (void *)objc_claimAutoreleasedReturnValue();

        if (v106)
        {
          -[NSObject directionsDestinationAddressString](v66, "directionsDestinationAddressString");
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "setObject:forKey:", v107, CFSTR("MapsSuggestionsDestinationAddressKey"));

          GEOFindOrCreateLog();
          v108 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v108, OS_LOG_TYPE_DEBUG))
          {
            -[NSObject directionsDestinationAddressString](v66, "directionsDestinationAddressString");
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v109;
            _os_log_impl(&dword_1A427D000, v108, OS_LOG_TYPE_DEBUG, "urlParser.directionsDestinationAddressString: %@", buf, 0xCu);

          }
          v102 = 1;
        }
        -[NSObject centerCoordinate](v66, "centerCoordinate");
        if (v111 >= -180.0 && v111 <= 180.0 && v110 >= -90.0 && v110 <= 90.0)
        {
          v112 = (void *)MEMORY[0x1E0CB37E8];
          -[NSObject centerCoordinate](v66, "centerCoordinate");
          objc_msgSend(v112, "numberWithDouble:");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "setObject:forKey:", v113, CFSTR("MapsSuggestionsLatitudeKey"));

          v114 = (void *)MEMORY[0x1E0CB37E8];
          -[NSObject centerCoordinate](v66, "centerCoordinate");
          objc_msgSend(v114, "numberWithDouble:", v115);
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "setObject:forKey:", v116, CFSTR("MapsSuggestionsLongitudeKey"));

          GEOFindOrCreateLog();
          v117 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v117, OS_LOG_TYPE_DEBUG))
          {
            -[NSObject centerCoordinate](v66, "centerCoordinate");
            v119 = v118;
            -[NSObject centerCoordinate](v66, "centerCoordinate");
            *(_DWORD *)buf = 134218240;
            *(_QWORD *)&buf[4] = v119;
            v193 = 2048;
            *(_QWORD *)v194 = v120;
            _os_log_impl(&dword_1A427D000, v117, OS_LOG_TYPE_DEBUG, "urlParser.coordinate: %f;%f", buf, 0x16u);
          }

          if (!v102)
          {
            objc_msgSend(v94, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("MapsSuggestionsAppConnectionIsCoordinateOnlyURL"));
            objc_msgSend(v177, "contactHandles");
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v121, "count") == 1)
            {
              GEOFindOrCreateLog();
              v122 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v122, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v121;
                _os_log_impl(&dword_1A427D000, v122, OS_LOG_TYPE_DEBUG, "Sender Contact Handle is %@", buf, 0xCu);
              }

              v123 = *(void **)(v174 + 56);
              objc_msgSend(v121, "objectAtIndexedSubscript:", 0);
              v124 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v123, "contactNameForIdentifier:", v124);
              v125 = (void *)objc_claimAutoreleasedReturnValue();

              GEOFindOrCreateLog();
              v126 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v126, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v125;
                _os_log_impl(&dword_1A427D000, v126, OS_LOG_TYPE_DEBUG, "Sender Contact Name is %@", buf, 0xCu);
              }

              if (v125)
                objc_msgSend(v94, "setObject:forKey:", v125, CFSTR("MapsSuggestionsAppConnectionMessageSenderContactName"));

            }
          }
          v102 = 1;
        }
        if (-[NSObject searchUID](v66, "searchUID"))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[NSObject searchUID](v66, "searchUID"));
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "setObject:forKey:", v127, CFSTR("MapsSuggestionsMUIDKey"));

          GEOFindOrCreateLog();
          v128 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v128, OS_LOG_TYPE_DEBUG))
          {
            v129 = -[NSObject searchUID](v66, "searchUID");
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)&buf[4] = v129;
            _os_log_impl(&dword_1A427D000, v128, OS_LOG_TYPE_DEBUG, "urlParser.searchUID: %llu", buf, 0xCu);
          }

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[NSObject searchProviderID](v66, "searchProviderID"));
          v130 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "setObject:forKey:", v130, CFSTR("MapsSuggestionsProviderIDKey"));

          GEOFindOrCreateLog();
          v131 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v131, OS_LOG_TYPE_DEBUG))
          {
            v132 = -[NSObject searchProviderID](v66, "searchProviderID");
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v132;
            _os_log_impl(&dword_1A427D000, v131, OS_LOG_TYPE_DEBUG, "UrlParser has searchProviderID: %d", buf, 8u);
          }

          -[NSObject searchQuery](v66, "searchQuery");
          v133 = (void *)objc_claimAutoreleasedReturnValue();

          v134 = v177;
          if (v133)
          {
            -[NSObject searchQuery](v66, "searchQuery");
            v135 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v94, "setObject:forKey:", v135, CFSTR("MapsSuggestionsEntryTitleNameKey"));

            GEOFindOrCreateLog();
            v136 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v136, OS_LOG_TYPE_DEBUG))
            {
              -[NSObject searchQuery](v66, "searchQuery");
              v137 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v137;
              _os_log_impl(&dword_1A427D000, v136, OS_LOG_TYPE_DEBUG, "urlParser.searchQuery: %@", buf, 0xCu);

            }
          }
        }
        else
        {
          v134 = v177;
          if (!v102)
          {
            GEOFindOrCreateLog();
            v155 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v155, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v62;
              _os_log_impl(&dword_1A427D000, v155, OS_LOG_TYPE_ERROR, "Could not process URL: %@", buf, 0xCu);
            }
            v39 = 0;
            goto LABEL_166;
          }
        }
        objc_msgSend(v134, "createdAt");
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        v139 = v138;
        if (v138)
        {
          v140 = v138;
        }
        else
        {
          MapsSuggestionsNow();
          v140 = (id)objc_claimAutoreleasedReturnValue();
        }
        v141 = v140;

        objc_msgSend(v134, "lifetime");
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v142, "doubleValue");
        v144 = v143;

        if (v144 == 0.0)
        {
          GEOConfigGetDouble();
          v144 = v145;
        }
        v146 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeInterval:sinceDate:", v141, v144);
        GEOFindOrCreateLog();
        v147 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v147, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v146;
          _os_log_impl(&dword_1A427D000, v147, OS_LOG_TYPE_DEBUG, "Expiry %@", buf, 0xCu);
        }

        GEOConfigGetDouble();
        v149 = v148;
        v150 = [MapsSuggestionsEntry alloc];
        -[NSObject searchQuery](v66, "searchQuery");
        v151 = objc_claimAutoreleasedReturnValue();
        v152 = (void *)v151;
        if (v151)
          v153 = (const __CFString *)v151;
        else
          v153 = &stru_1E4BDFC28;
        v154 = -[MapsSuggestionsEntry initWithType:title:subtitle:weight:expires:geoMapItem:sourceSpecificInfo:](v150, "initWithType:title:subtitle:weight:expires:geoMapItem:sourceSpecificInfo:", 12, v153, 0, v146, 0, v94, v149);

        v155 = v154;
        v39 = (uint64_t)v155;
LABEL_166:
        v65 = v176;

        a1 = v171;
        goto LABEL_167;
      }
      GEOFindOrCreateLog();
      v71 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        v72 = "App Connection originating Bundle ID was Maps, so kicking it out";
        goto LABEL_84;
      }
    }
    else
    {
      GEOFindOrCreateLog();
      v71 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        v72 = "App Connection originating bundle ID is nil, so kicking it out";
LABEL_84:
        _os_log_impl(&dword_1A427D000, v71, OS_LOG_TYPE_DEBUG, v72, buf, 2u);
      }
    }

    v39 = 0;
    v65 = v176;
LABEL_167:

LABEL_168:
    v10 = v160;
  }
  objc_autoreleasePoolPop(v11);
LABEL_170:

  v156 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v157 = *(void **)(v156 + 40);
  *(_QWORD *)(v156 + 40) = v39;

  *a3 = 1;
}

void __61__MapsSuggestionsPortrait_fetchConnectionEntriesWithHandler___block_invoke_239(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char *v6;
  id WeakRetained;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  char *v14;
  id v15;
  uint8_t buf[4];
  char *v17;
  __int16 v18;
  _WORD v19[17];

  *(_QWORD *)&v19[13] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v6)
    {
      GEOFindOrCreateLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v6;
        _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "Error getting MapItem for Entry: %@", buf, 0xCu);
      }

    }
    v9 = *(_QWORD *)(a1 + 32);
    if (v5)
    {
      v15 = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v9 + 16))(v9, v10, 0);

    }
    else
    {
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v9 + 16))(v9, MEMORY[0x1E0C9AA60], 0);
    }
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_DEBUG, "BUGHUNT 5x", buf, 2u);
    }

    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(WeakRetained, "uniqueName");
      v14 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v17 = v14;
      v18 = 2080;
      *(_QWORD *)v19 = "fetchConnectionEntriesWithHandler";
      _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);

    }
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "fetchConnectionEntriesWithHandler", ", buf, 2u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v17 = "MapsSuggestionsPortrait.m";
      v18 = 1026;
      *(_DWORD *)v19 = 632;
      v19[2] = 2082;
      *(_QWORD *)&v19[3] = "-[MapsSuggestionsPortrait fetchConnectionEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelfEnd went away in %{public}s", buf, 0x1Cu);
    }

  }
}

- (void)_geoMapItemsFromMapsSuggestionsEntry:(void *)a3 handle:
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  char *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  char *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(id *, void *, void *);
  void *v23;
  id v24;
  id v25;
  id v26;
  id location;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  _BYTE v31[14];
  __int16 v32;
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  GEOFindOrCreateLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(a1, "uniqueName");
      v9 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v29 = v9;
      v30 = 2080;
      *(_QWORD *)v31 = "_geoMapItemsFromMapsSuggestionsEntry";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

    }
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_geoMapItemsFromMapsSuggestionsEntry", ", buf, 2u);
    }

    objc_initWeak(&location, a1);
    v11 = (void *)a1[2];
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __71__MapsSuggestionsPortrait__geoMapItemsFromMapsSuggestionsEntry_handle___block_invoke;
    v23 = &unk_1E4BCF510;
    objc_copyWeak(&v26, &location);
    v24 = v5;
    v12 = v6;
    v25 = v12;
    if ((GEOMapItemsFromMapsSuggestionsEntry(v24, v11, 1, &v20) & 1) == 0)
    {
      v13 = (void *)a1[5];
      a1[5] = 0;

      v14 = (void *)a1[4];
      a1[4] = 0;

      v15 = (void *)a1[6];
      a1[6] = 0;

      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -12, CFSTR("The input was wrong"), v20, v21, v22, v23, v24);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v12 + 2))(v12, 0, v16);

      GEOFindOrCreateLog();
      v17 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(a1, "uniqueName");
        v18 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v29 = v18;
        v30 = 2080;
        *(_QWORD *)v31 = "_geoMapItemsFromMapsSuggestionsEntry";
        _os_log_impl(&dword_1A427D000, v17, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);

      }
      GEOFindOrCreateLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v19))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A427D000, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_geoMapItemsFromMapsSuggestionsEntry", ", buf, 2u);
      }

    }
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v29 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPortrait.m";
      v30 = 1024;
      *(_DWORD *)v31 = 791;
      *(_WORD *)&v31[4] = 2082;
      *(_QWORD *)&v31[6] = "-[MapsSuggestionsPortrait _geoMapItemsFromMapsSuggestionsEntry:handle:]";
      v32 = 2082;
      v33 = "nil == (handle)";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a handle", buf, 0x26u);
    }

  }
}

void __71__MapsSuggestionsPortrait__geoMapItemsFromMapsSuggestionsEntry_handle___block_invoke(id *a1, void *a2, void *a3)
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
  WeakRetained = (NSObject **)objc_loadWeakRetained(a1 + 6);
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained[10];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __71__MapsSuggestionsPortrait__geoMapItemsFromMapsSuggestionsEntry_handle___block_invoke_249;
    v11[3] = &unk_1E4BCF4E8;
    objc_copyWeak(&v15, a1 + 6);
    v12 = v6;
    v13 = a1[4];
    v14 = a1[5];
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
      v17 = "MapsSuggestionsPortrait.m";
      v18 = 1026;
      v19 = 801;
      v20 = 2082;
      v21 = "-[MapsSuggestionsPortrait _geoMapItemsFromMapsSuggestionsEntry:handle:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: outerStrongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __71__MapsSuggestionsPortrait__geoMapItemsFromMapsSuggestionsEntry_handle___block_invoke_249(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  double v34;
  NSObject *v35;
  const char *v36;
  NSObject *v37;
  os_log_type_t v38;
  double v39;
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  NSObject *v45;
  void *v46;
  NSObject *v47;
  NSObject *v48;
  void *v49;
  NSObject *v50;
  uint8_t v51[16];
  _BYTE buf[12];
  __int16 v53;
  _WORD v54[17];

  *(_QWORD *)&v54[13] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (!*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(*(id *)(a1 + 40), "geoMapItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        v9 = objc_msgSend(*(id *)(a1 + 40), "integerForKey:", CFSTR("MapsSuggestionsGEOMapItemOriginKey"));
        objc_msgSend(*(id *)(a1 + 40), "geoMapItem");
        v7 = objc_claimAutoreleasedReturnValue();
        v10 = -[NSObject _muid](v7, "_muid");
        objc_msgSend(*(id *)(a1 + 40), "stringForKey:", CFSTR("MapsSuggestionsAppConnectionValueKey"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", &stru_1E4BDFC28);

        if (v12)
        {
          v13 = *(void **)(a1 + 40);
          -[NSObject name](v7, "name");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setString:forKey:", v14, CFSTR("MapsSuggestionsAppConnectionValueKey"));

        }
        -[NSObject _firstRelatedPlaceListForType:](v7, "_firstRelatedPlaceListForType:", 2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v10)
          goto LABEL_14;
        objc_msgSend(v15, "mapIdentifiers");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "count");

        if (v21 == 1)
        {
          objc_msgSend(v16, "mapIdentifiers");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "firstObject");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v23, "muid");

          if (v10)
          {
LABEL_14:
            if ((v9 & 0xFFFFFFFFFFFFFFFELL) == 2)
            {
              GEOFindOrCreateLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A427D000, v17, OS_LOG_TYPE_DEBUG, "Trying second pass at getting a better MapItem", buf, 2u);
              }

              objc_msgSend(*(id *)(a1 + 40), "setInteger:forKey:", 0, CFSTR("MapsSuggestionsGEOMapItemOriginKey"));
              v18 = *(void **)(a1 + 40);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v10);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "setNumber:forKey:", v19, CFSTR("MapsSuggestionsMUIDKey"));

              -[MapsSuggestionsPortrait _geoMapItemsFromMapsSuggestionsEntry:handle:](WeakRetained, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
LABEL_42:

              goto LABEL_43;
            }
          }
        }
        objc_msgSend(*(id *)(a1 + 40), "stringForKey:", CFSTR("MapsSuggestionsAppConnectionOriginatingURLString"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v24;
        if (v24)
        {
          v26 = v24;
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
          v26 = (id)objc_claimAutoreleasedReturnValue();
        }
        v27 = (void *)WeakRetained[4];
        WeakRetained[4] = v26;

        objc_msgSend(*(id *)(a1 + 40), "geoMapItem");
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = (void *)WeakRetained[5];
        WeakRetained[5] = v28;

        objc_msgSend(*(id *)(a1 + 40), "numberForKey:", CFSTR("MapsSuggestionsGEOMapItemOriginKey"));
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = (void *)WeakRetained[6];
        WeakRetained[6] = v30;

        v32 = *(id *)(a1 + 40);
        if (!v32)
        {
LABEL_37:
          v40 = objc_alloc(MEMORY[0x1E0CB3940]);
          MapsSuggestionsCurrentBestLocation();
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = (void *)objc_msgSend(v40, "initWithFormat:", CFSTR("The MapItem is not relevant for location %@"), v41);

          v43 = *(_QWORD *)(a1 + 48);
          objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -8, v42);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, _QWORD, void *))(v43 + 16))(v43, 0, v44);

          GEOFindOrCreateLog();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(WeakRetained, "uniqueName");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v46;
            v53 = 2080;
            *(_QWORD *)v54 = "_geoMapItemsFromMapsSuggestionsEntry";
            _os_log_impl(&dword_1A427D000, v45, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);

          }
          GEOFindOrCreateLog();
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_signpost_enabled(v47))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1A427D000, v47, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_geoMapItemsFromMapsSuggestionsEntry", ", buf, 2u);
          }

          goto LABEL_42;
        }
        v33 = v32;
        *(_QWORD *)buf = 0;
        if (MapsSuggestionsDistanceFromHereToEntry(v32, buf))
        {
          GEOConfigGetDouble();
          if (v34 >= *(double *)buf)
          {
            GEOConfigGetDouble();
            if (v39 <= *(double *)buf)
            {

              (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
              GEOFindOrCreateLog();
              v48 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(WeakRetained, "uniqueName");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)&buf[4] = v49;
                v53 = 2080;
                *(_QWORD *)v54 = "_geoMapItemsFromMapsSuggestionsEntry";
                _os_log_impl(&dword_1A427D000, v48, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);

              }
              GEOFindOrCreateLog();
              v50 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v50))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_1A427D000, v50, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_geoMapItemsFromMapsSuggestionsEntry", ", buf, 2u);
              }

              goto LABEL_42;
            }
            GEOFindOrCreateLog();
            v35 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
              goto LABEL_36;
            *(_WORD *)v51 = 0;
            v36 = "Entry is within AppConnectionMinValidDistance. Moving on to the next GEOMapItem";
            goto LABEL_34;
          }
          GEOFindOrCreateLog();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)v51 = 0;
            v36 = "Entry is not within AppConnectionMaxValidDistance. Moving on to the next GEOMapItem";
LABEL_34:
            v37 = v35;
            v38 = OS_LOG_TYPE_DEBUG;
            goto LABEL_35;
          }
        }
        else
        {
          GEOFindOrCreateLog();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v51 = 0;
            v36 = "Entry has no distance available";
            v37 = v35;
            v38 = OS_LOG_TYPE_ERROR;
LABEL_35:
            _os_log_impl(&dword_1A427D000, v37, v38, v36, v51, 2u);
          }
        }
LABEL_36:

        goto LABEL_37;
      }
    }
    v3 = (void *)WeakRetained[5];
    WeakRetained[5] = 0;

    v4 = (void *)WeakRetained[4];
    WeakRetained[4] = 0;

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(WeakRetained, "uniqueName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v6;
      v53 = 2080;
      *(_QWORD *)v54 = "_geoMapItemsFromMapsSuggestionsEntry";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);

    }
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_geoMapItemsFromMapsSuggestionsEntry", ", buf, 2u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)&buf[4] = "MapsSuggestionsPortrait.m";
      v53 = 1026;
      *(_DWORD *)v54 = 803;
      v54[2] = 2082;
      *(_QWORD *)&v54[3] = "-[MapsSuggestionsPortrait _geoMapItemsFromMapsSuggestionsEntry:handle:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
LABEL_43:

}

- (id)fetchNamedEntitiesFromDate:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  MapsSuggestionsPortraitConnector *connector;
  void *v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint32_t v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  MapsSuggestionsPortraitData *v34;
  void *v35;
  void *v36;
  MapsSuggestionsPortraitData *v37;
  NSObject *v38;
  int v39;
  void *v41;
  void *v42;
  id obj;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id v48;
  uint8_t buf[4];
  id v50;
  __int16 v51;
  void *v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  -[MapsSuggestionsPortraitConnector namedEntityQuery:fromDate:consumerType:](self->_connector, "namedEntityQuery:fromDate:consumerType:", 0x7FFFFFFFFFFFFFFFLL, a3, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "Calling Portrait SPI", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D272A8], "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEnabledForSubTestWithName:", CFSTR("MSGPPTTest_Insights_ACRanking_PortraitCall"));

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:", CFSTR("MSGPPTTest_Insights_ACRanking_PortraitCallBEGIN"), 0);

  }
  connector = self->_connector;
  v48 = 0;
  -[MapsSuggestionsPortraitConnector rankedNamedEntitiesWihQuery:error:](connector, "rankedNamedEntitiesWihQuery:error:", v4, &v48);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v48;
  objc_msgSend(MEMORY[0x1E0D272A8], "sharedManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEnabledForSubTestWithName:", CFSTR("MSGPPTTest_Insights_ACRanking_PortraitCall"));

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "postNotificationName:object:", CFSTR("MSGPPTTest_Insights_ACRanking_PortraitCallEND"), 0);

  }
  if (v11)
  {
    GEOFindOrCreateLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_11:
      v20 = (id)MEMORY[0x1E0C9AA60];
      goto LABEL_35;
    }
    *(_DWORD *)buf = 138412290;
    v50 = v11;
    v16 = "Iterator over EntityRecords for Siri Portrait returned error:%@";
    v17 = v15;
    v18 = OS_LOG_TYPE_ERROR;
    v19 = 12;
LABEL_10:
    _os_log_impl(&dword_1A427D000, v17, v18, v16, buf, v19);
    goto LABEL_11;
  }
  if (!objc_msgSend(v10, "count"))
  {
    GEOFindOrCreateLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      goto LABEL_11;
    *(_WORD *)buf = 0;
    v16 = "Portrait returned no entries";
    v17 = v15;
    v18 = OS_LOG_TYPE_DEBUG;
    v19 = 2;
    goto LABEL_10;
  }
  v42 = v4;
  if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
    dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
  if (s_verbose)
  {
    GEOFindOrCreateLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A427D000, v21, OS_LOG_TYPE_DEBUG, "Received portrait named entities are:", buf, 2u);
    }

  }
  v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v10, "count"));
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v41 = v10;
  obj = v10;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v45;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v45 != v24)
          objc_enumerationMutation(obj);
        v26 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v25);
        objc_msgSend(v26, "item");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "mostRelevantRecord");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "source");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "date");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
          dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
        if (s_verbose)
        {
          GEOFindOrCreateLog();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v26, "item");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "name");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v50 = v33;
            v51 = 2112;
            v52 = v30;
            _os_log_impl(&dword_1A427D000, v31, OS_LOG_TYPE_DEBUG, "Name & Date: %@ %@", buf, 0x16u);

          }
        }
        v34 = [MapsSuggestionsPortraitData alloc];
        objc_msgSend(v26, "item");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "name");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = -[MapsSuggestionsPortraitData initWithName:lastInteractionTime:](v34, "initWithName:lastInteractionTime:", v36, v30);

        -[NSObject addObject:](v15, "addObject:", v37);
        ++v25;
      }
      while (v23 != v25);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    }
    while (v23);
  }

  GEOFindOrCreateLog();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
  {
    v39 = -[NSObject count](v15, "count");
    *(_DWORD *)buf = 67109120;
    LODWORD(v50) = v39;
    _os_log_impl(&dword_1A427D000, v38, OS_LOG_TYPE_DEBUG, "We got %u items from Portrait", buf, 8u);
  }

  v20 = -[NSObject copy](v15, "copy");
  v10 = v41;
  v4 = v42;
  v11 = 0;
LABEL_35:

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_futureTrips, 0);
  objc_storeStrong((id *)&self->_currentTrips, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_cachedMapItemOrigin, 0);
  objc_storeStrong((id *)&self->_cachedMapItem, 0);
  objc_storeStrong((id *)&self->_cachedKey, 0);
  objc_storeStrong((id *)&self->_criteria, 0);
  objc_storeStrong((id *)&self->_networkRequester, 0);
  objc_storeStrong((id *)&self->_connector, 0);
}

@end
