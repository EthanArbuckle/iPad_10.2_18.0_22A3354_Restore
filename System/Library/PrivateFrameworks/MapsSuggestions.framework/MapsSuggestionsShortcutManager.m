@implementation MapsSuggestionsShortcutManager

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
  void *v12;
  void *v13;
  void *v14;
  MapsSuggestionsShortcutManager *v15;
  NSObject *v16;
  int v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v18 = 136446978;
      v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      v20 = 1024;
      v21 = 104;
      v22 = 2082;
      v23 = "-[MapsSuggestionsShortcutManager initFromResourceDepot:]";
      v24 = 2082;
      v25 = "nil == (resourceDepot)";
      _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to build from!", (uint8_t *)&v18, 0x26u);
    }
    goto LABEL_21;
  }
  objc_msgSend(v4, "oneFavoritesStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v18 = 136446978;
      v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      v20 = 1024;
      v21 = 105;
      v22 = 2082;
      v23 = "-[MapsSuggestionsShortcutManager initFromResourceDepot:]";
      v24 = 2082;
      v25 = "nil == (resourceDepot.oneFavoritesStorage)";
      _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one FavouritesStorage!", (uint8_t *)&v18, 0x26u);
    }
    goto LABEL_21;
  }
  objc_msgSend(v5, "oneFavoritesSuggestor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v18 = 136446978;
      v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      v20 = 1024;
      v21 = 106;
      v22 = 2082;
      v23 = "-[MapsSuggestionsShortcutManager initFromResourceDepot:]";
      v24 = 2082;
      v25 = "nil == (resourceDepot.oneFavoritesSuggestor)";
      _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one FavouritesSuggestor!", (uint8_t *)&v18, 0x26u);
    }
    goto LABEL_21;
  }
  objc_msgSend(v5, "oneContacts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v18 = 136446978;
      v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      v20 = 1024;
      v21 = 107;
      v22 = 2082;
      v23 = "-[MapsSuggestionsShortcutManager initFromResourceDepot:]";
      v24 = 2082;
      v25 = "nil == (resourceDepot.oneContacts)";
      _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one Contacts!", (uint8_t *)&v18, 0x26u);
    }
    goto LABEL_21;
  }
  objc_msgSend(v5, "oneRoutine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v18 = 136446978;
      v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      v20 = 1024;
      v21 = 108;
      v22 = 2082;
      v23 = "-[MapsSuggestionsShortcutManager initFromResourceDepot:]";
      v24 = 2082;
      v25 = "nil == (resourceDepot.oneRoutine)";
      _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one Routine!", (uint8_t *)&v18, 0x26u);
    }
LABEL_21:

    v15 = 0;
    goto LABEL_22;
  }
  objc_msgSend(v5, "oneFavoritesStorage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "oneFavoritesSuggestor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "oneContacts");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "oneRoutine");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "oneMapsSync");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[MapsSuggestionsShortcutManager initWithStorage:suggestor:contacts:routine:mapsSync:usingMyPlaces:](self, "initWithStorage:suggestor:contacts:routine:mapsSync:usingMyPlaces:", v10, v11, v12, v13, v14, 1);

  v15 = self;
LABEL_22:

  return v15;
}

- (MapsSuggestionsShortcutManager)initWithStorage:(id)a3 suggestor:(id)a4 contacts:(id)a5 routine:(id)a6 mapsSync:(id)a7 usingMyPlaces:(BOOL)a8
{
  MapsSuggestionsShortcutManager *v15;
  MapsSuggestionsShortcutManager *v16;
  void *v17;
  OS_dispatch_queue *v18;
  OS_dispatch_queue *innerQueue;
  NSString *v20;
  NSString *name;
  id *p_storage;
  NSMutableArray *v23;
  NSMutableArray *hiddenShortcuts;
  MapsSuggestionsMeCard *rawMeCard;
  NSArray *rawHomeAddressStrings;
  NSArray *rawWorkAddressStrings;
  NSArray *rawSchoolAddressStrings;
  MapsSuggestionsMeCard *currCorrectedMeCard;
  NSObject *v30;
  void *v31;
  MapsSuggestionsShortcutStorage *storage;
  MapsSuggestionsObservers *v33;
  OS_dispatch_queue *v34;
  uint64_t v35;
  MapsSuggestionsObservers *meCardObservers;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  objc_super v45;
  __int128 buf;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  v39 = a4;
  v40 = a5;
  v41 = a6;
  v42 = a7;
  v45.receiver = self;
  v45.super_class = (Class)MapsSuggestionsShortcutManager;
  v15 = -[MapsSuggestionsShortcutManager init](&v45, sel_init);
  v16 = v15;
  if (v15)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    MSg::Queue::Queue((dispatch_queue_t *)&buf, CFSTR("MapsSuggestionsShortcutManagerQueue"), v17);
    v18 = (OS_dispatch_queue *)buf;
    *(_QWORD *)&buf = 0;
    innerQueue = v15->_queue._innerQueue;
    v15->_queue._innerQueue = v18;

    v20 = (NSString *)*((_QWORD *)&buf + 1);
    *((_QWORD *)&buf + 1) = 0;
    name = v15->_queue._name;
    v15->_queue._name = v20;

    p_storage = (id *)&v15->_storage;
    objc_storeStrong((id *)&v15->_storage, a3);
    objc_storeStrong((id *)&v15->_suggestor, a4);
    objc_storeStrong((id *)&v15->_contacts, a5);
    objc_storeStrong((id *)&v15->_routine, a6);
    objc_storeStrong((id *)&v15->_mapsSync, a7);
    v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    hiddenShortcuts = v15->_hiddenShortcuts;
    v15->_hiddenShortcuts = v23;

    rawMeCard = v15->_rawMeCard;
    v15->_rawMeCard = 0;

    rawHomeAddressStrings = v15->_rawHomeAddressStrings;
    v15->_rawHomeAddressStrings = 0;

    rawWorkAddressStrings = v15->_rawWorkAddressStrings;
    v15->_rawWorkAddressStrings = 0;

    rawSchoolAddressStrings = v15->_rawSchoolAddressStrings;
    v15->_rawSchoolAddressStrings = 0;

    currCorrectedMeCard = v15->_currCorrectedMeCard;
    v15->_currCorrectedMeCard = 0;

    v15->_usingMyPlaces = a8;
    GEOFindOrCreateLog();
    v30 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*p_storage, "uniqueName", v38, v39, v40, v41);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v31;
      _os_log_impl(&dword_1A427D000, v30, OS_LOG_TYPE_DEBUG, "Using %@", (uint8_t *)&buf, 0xCu);

    }
    if (-[MapsSuggestionsShortcutManager usingMyPlaces]((_BOOL8)v16))
    {
      -[MapsSuggestionsMapsSync addMapsSyncObserver:forContentType:](v16->_mapsSync, "addMapsSyncObserver:forContentType:", v16, 3);
    }
    else
    {
      -[MapsSuggestionsContacts registerMeCardObserver:](v16->_contacts, "registerMeCardObserver:", v16);
      objc_initWeak((id *)&buf, v16);
      storage = v16->_storage;
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __100__MapsSuggestionsShortcutManager_initWithStorage_suggestor_contacts_routine_mapsSync_usingMyPlaces___block_invoke;
      v43[3] = &unk_1E4BCDDF8;
      objc_copyWeak(&v44, (id *)&buf);
      -[MapsSuggestionsShortcutStorage setChangeHandler:](storage, "setChangeHandler:", v43);
      objc_destroyWeak(&v44);
      objc_destroyWeak((id *)&buf);
    }
    v33 = [MapsSuggestionsObservers alloc];
    v34 = v16->_queue._innerQueue;
    v35 = -[MapsSuggestionsObservers initWithCallbackQueue:name:strong:](v33, "initWithCallbackQueue:name:strong:", v34, CFSTR("MapsSuggestionsMeCardReaderObservers"), 0);
    meCardObservers = v16->_meCardObservers;
    v16->_meCardObservers = (MapsSuggestionsObservers *)v35;

  }
  return v16;
}

void __100__MapsSuggestionsShortcutManager_initWithStorage_suggestor_contacts_routine_mapsSync_usingMyPlaces___block_invoke(uint64_t a1)
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
    objc_msgSend(WeakRetained, "readMeCardWithHandler:", &__block_literal_global_8);
  }
  else
  {
    GEOFindOrCreateLog();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136446722;
      v5 = "MapsSuggestionsShortcutManager.mm";
      v6 = 1026;
      v7 = 147;
      v8 = 2082;
      v9 = "-[MapsSuggestionsShortcutManager initWithStorage:suggestor:contacts:routine:mapsSync:usingMyPlaces:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }

  }
}

void __100__MapsSuggestionsShortcutManager_initWithStorage_suggestor_contacts_routine_mapsSync_usingMyPlaces___block_invoke_108(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  GEOFindOrCreateLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = 138412546;
    v8 = v4;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_DEBUG, "Storage resulted in auto-reload: %@ / error: %@", (uint8_t *)&v7, 0x16u);
  }

}

- (BOOL)usingMyPlaces
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    if (qword_1ED22EF60 != -1)
      dispatch_once(&qword_1ED22EF60, &__block_literal_global_284);
    return _MergedGlobals_35 && *(_BYTE *)(v1 + 72) != 0;
  }
  return result;
}

- (id)test_setUpPlaceholdersIfNeeded:(id)a3 overlays:(id)a4
{
  id v5;
  id v6;
  id v7;
  BOOL v8;
  void *v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  BOOL v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 buf;
  _QWORD v40[2];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v5;
  v29 = v6;
  v30 = v7;
  v8 = isAuthorizedToUseContacts();
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(v7, "shortcutsForAll");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = 0;
  v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v36 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        if (objc_msgSend(v15, "type", v29, v30) == 2)
          v11 = 1;
        else
          v10 |= objc_msgSend(v15, "type") == 3;
      }
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
    }
    while (v12);
  }
  v16 = v8;

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v17 = v29;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
  if (!v18)
  {

    v19 = 0;
    goto LABEL_36;
  }
  v19 = 0;
  v20 = 0;
  v21 = *(_QWORD *)v32;
  do
  {
    for (j = 0; j != v18; ++j)
    {
      if (*(_QWORD *)v32 != v21)
        objc_enumerationMutation(v17);
      v23 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
      if (objc_msgSend(v23, "type", v29) == 2)
      {
        if (!v20)
        {
          if ((objc_msgSend(v23, "isSetupPlaceholder") & 1) != 0)
          {
            v20 = v23;
LABEL_24:
            v24 = v23;
            continue;
          }
          v20 = 0;
        }
        v11 = 1;
      }
      else
      {
        if (objc_msgSend(v23, "type") != 3)
          continue;
        if (!v19)
        {
          if (objc_msgSend(v23, "isSetupPlaceholder"))
          {
            v19 = v23;
            goto LABEL_24;
          }
          v19 = 0;
        }
        v10 = 1;
      }
    }
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
  }
  while (v18);

  if (v20)
  {
    if (v19)
      goto LABEL_33;
LABEL_37:
    MapsSuggestionsSetupShortcutForType(3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v11 & 1) != 0)
      goto LABEL_38;
    goto LABEL_39;
  }
LABEL_36:
  MapsSuggestionsSetupShortcutForType(2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
    goto LABEL_37;
LABEL_33:
  if ((v11 & 1) != 0)
LABEL_38:
    objc_msgSend(v20, "setIsHidden:", 1, v29);
LABEL_39:
  if ((v10 & 1) != 0)
    objc_msgSend(v19, "setIsHidden:", 1);
  if (!v16)
  {
    if (GEOConfigGetInteger() == 1)
    {
      objc_msgSend(v20, "setIsHidden:", 1);
      objc_msgSend(v19, "setIsHidden:", 1);
    }
    if (GEOConfigGetInteger() == 2)
    {
      objc_msgSend(v20, "setIsHidden:", 0);
      objc_msgSend(v19, "setIsHidden:", 0);
    }
  }
  GEOFindOrCreateLog();
  v25 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    v40[0] = v20;
    v40[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v26;
    _os_log_impl(&dword_1A427D000, v25, OS_LOG_TYPE_DEBUG, "Placeholders: %@", (uint8_t *)&buf, 0xCu);

  }
  *(_QWORD *)&buf = v20;
  *((_QWORD *)&buf + 1) = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &buf, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (void)test_sortMapsSuggestionsShortcuts:(id)a3
{
  objc_msgSend(a3, "sortUsingComparator:", &__block_literal_global_286);
}

void __73__MapsSuggestionsShortcutManager__mergeShortcuts_toMeCardAndCallHandler___block_invoke(id *a1, char a2)
{
  char *v3;
  NSObject *v4;
  NSObject **WeakRetained;
  NSObject *v6;
  _QWORD v7[4];
  NSObject *v8;
  char *v9;
  id v10;
  uint8_t buf[4];
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -17, CFSTR("Could not write to Storage!"));
    v3 = (char *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v3;
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "Error during addOrUpdateShortcuts: %@", buf, 0xCu);
    }

  }
  WeakRetained = (NSObject **)objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __73__MapsSuggestionsShortcutManager__mergeShortcuts_toMeCardAndCallHandler___block_invoke_119;
    v7[3] = &unk_1E4BCEEC0;
    v8 = a1[4];
    v10 = a1[5];
    v9 = v3;
    MSg::Queue::async<MapsSuggestionsShortcutManager>(WeakRetained + 1, WeakRetained, v7);

    v6 = v8;
  }
  else
  {
    GEOFindOrCreateLog();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v12 = "MapsSuggestionsShortcutManager.mm";
      v13 = 1026;
      v14 = 419;
      v15 = 2082;
      v16 = "-[MapsSuggestionsShortcutManager _mergeShortcuts:toMeCardAndCallHandler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: outerStrongSelfUpdate went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __73__MapsSuggestionsShortcutManager__mergeShortcuts_toMeCardAndCallHandler___block_invoke_119(uint64_t a1, void *a2)
{
  id *v3;
  void *v4;
  void *v5;
  MapsSuggestionsMeCard *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  _QWORD v14[4];
  id *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_msgSend(v3[12], "copy");
  v5 = (void *)objc_msgSend(v3[8], "mutableCopy");
  objc_msgSend(v5, "addObjectsFromArray:", *(_QWORD *)(a1 + 32));
  v6 = [MapsSuggestionsMeCard alloc];
  objc_msgSend(v3[10], "shortcutsPerCNPostalAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MapsSuggestionsMeCard initWithShortcuts:perCNPostalAddress:hasCorrected:hasGeocoded:](v6, "initWithShortcuts:perCNPostalAddress:hasCorrected:hasGeocoded:", v5, v7, objc_msgSend(*(id *)(a1 + 32), "count") != 0, objc_msgSend(v3[10], "hasGeocoded"));
  v9 = v3[12];
  v3[12] = (id)v8;

  v10 = (void *)objc_msgSend(v3[12], "copy");
  GEOFindOrCreateLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v10;
    _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_DEBUG, "Calling handler with merged Shortcuts: %@", buf, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  if ((objc_msgSend(v10, "isEqualToMeCard:", v4) & 1) == 0)
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v10;
      _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_DEBUG, "New MeCard detected: %@", buf, 0xCu);
    }

    v13 = v3[11];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __73__MapsSuggestionsShortcutManager__mergeShortcuts_toMeCardAndCallHandler___block_invoke_121;
    v14[3] = &unk_1E4BCE250;
    v15 = v3;
    v16 = v10;
    objc_msgSend(v13, "callBlock:", v14);

  }
}

void __73__MapsSuggestionsShortcutManager__mergeShortcuts_toMeCardAndCallHandler___block_invoke_121(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  GEOFindOrCreateLog();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v3, "uniqueName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "Calling observer '%@'", (uint8_t *)&v6, 0xCu);

  }
  objc_msgSend(v3, "meCardReader:didUpdateMeCard:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __67__MapsSuggestionsShortcutManager___loadCorrectedMeCardWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char *v6;
  char *v7;
  void *v8;
  uint64_t v9;
  id WeakRetained;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v15[4];
  NSObject *v16;
  id v17;
  _QWORD v18[4];
  NSObject *v19;
  uint8_t buf[4];
  char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    GEOFindOrCreateLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v7;
      _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_ERROR, "Error loading from MeCard: %@", buf, 0xCu);
    }
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    v9 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __67__MapsSuggestionsShortcutManager___loadCorrectedMeCardWithHandler___block_invoke_125;
    v18[3] = &unk_1E4BCEF10;
    v19 = v5;
    MSg::Queue::async<MapsSuggestionsShortcutManager>((NSObject **)(a1 + 56), v8, v18);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v11 = WeakRetained;
    if (WeakRetained)
    {
      v12 = (void *)*((_QWORD *)WeakRetained + 3);
      v15[0] = v9;
      v15[1] = 3221225472;
      v15[2] = __67__MapsSuggestionsShortcutManager___loadCorrectedMeCardWithHandler___block_invoke_126;
      v15[3] = &unk_1E4BCEF60;
      v16 = *(id *)(a1 + 40);
      objc_copyWeak(&v17, (id *)(a1 + 48));
      objc_msgSend(v12, "loadAllShortcutsWithHandler:", v15);
      objc_destroyWeak(&v17);
      v13 = v16;
    }
    else
    {
      GEOFindOrCreateLog();
      v13 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v21 = "MapsSuggestionsShortcutManager.mm";
        v22 = 1026;
        v23 = 478;
        v24 = 2082;
        v25 = "-[MapsSuggestionsShortcutManager __loadCorrectedMeCardWithHandler:]_block_invoke_2";
        _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelfMeCard went away in %{public}s", buf, 0x1Cu);
      }

    }
    v14 = v19;
  }

}

void __67__MapsSuggestionsShortcutManager___loadCorrectedMeCardWithHandler___block_invoke_125(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  _QWORD *v5;

  v5 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v4 = (void *)v5[10];
  v5[10] = v3;

}

void __67__MapsSuggestionsShortcutManager___loadCorrectedMeCardWithHandler___block_invoke_126(uint64_t a1, void *a2, void *a3)
{
  char *v5;
  char *v6;
  char *v7;
  NSObject *v8;
  dispatch_queue_t *WeakRetained;
  NSObject *v10;
  NSObject *v11;
  _QWORD block[4];
  char *v13;
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
  v7 = v6;
  if (!v5 || v6)
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v7;
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "Error loading from Storage (MapsSync): %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v5;
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "Loaded Shortcuts from storage: %@", buf, 0xCu);
    }

    WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __67__MapsSuggestionsShortcutManager___loadCorrectedMeCardWithHandler___block_invoke_127;
      block[3] = &unk_1E4BCE780;
      objc_copyWeak(&v15, (id *)(a1 + 40));
      v13 = v5;
      v14 = *(id *)(a1 + 32);
      dispatch_async(WeakRetained[1], block);

      objc_destroyWeak(&v15);
    }
    else
    {
      GEOFindOrCreateLog();
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v17 = "MapsSuggestionsShortcutManager.mm";
        v18 = 1026;
        v19 = 492;
        v20 = 2082;
        v21 = "-[MapsSuggestionsShortcutManager __loadCorrectedMeCardWithHandler:]_block_invoke";
        _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelfLoadStorage went away in %{public}s", buf, 0x1Cu);
      }

    }
  }

}

void __67__MapsSuggestionsShortcutManager___loadCorrectedMeCardWithHandler___block_invoke_127(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  BOOL v9;
  void *v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t n;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t ii;
  void *v54;
  int v55;
  id v56;
  NSObject *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t jj;
  void *v62;
  void *v63;
  NSObject *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t kk;
  void *v69;
  NSObject *v70;
  id v71;
  void *v72;
  NSObject *v73;
  char *v74;
  NSObject *v75;
  char *v76;
  void *v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t mm;
  void *v82;
  NSObject *v83;
  NSObject *v84;
  id v85;
  id v86;
  void *v87;
  id v88;
  void *v89;
  id v90;
  id *val;
  id v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  void *v97;
  id obj;
  uint64_t m;
  id v100;
  uint64_t v101;
  id v102;
  id v103;
  id v104;
  id v105;
  _QWORD v106[5];
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  id location;
  __int128 v116;
  void (*v117)(id *, char);
  void *v118;
  id v119;
  id v120;
  id v121[2];
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  _BYTE v130[128];
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  uint8_t buf[4];
  char *v136;
  __int16 v137;
  int v138;
  __int16 v139;
  const char *v140;
  __int16 v141;
  const char *v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  uint64_t v147;

  v147 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  val = WeakRetained;
  if (!WeakRetained)
  {
    GEOFindOrCreateLog();
    v24 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v136 = "MapsSuggestionsShortcutManager.mm";
      v137 = 1026;
      v138 = 503;
      v139 = 2082;
      v140 = "-[MapsSuggestionsShortcutManager __loadCorrectedMeCardWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v24, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelfMerge went away in %{public}s", buf, 0x1Cu);
    }

    goto LABEL_158;
  }
  v3 = WeakRetained;
  v4 = *(void **)(a1 + 32);
  v106[0] = MEMORY[0x1E0C809B0];
  v106[1] = 3221225472;
  v106[2] = __67__MapsSuggestionsShortcutManager___loadCorrectedMeCardWithHandler___block_invoke_128;
  v106[3] = &unk_1E4BCEF38;
  v106[4] = v3;
  objc_msgSend(v4, "MSg_copyIf:", v106);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 40);
  v90 = v5;
  v88 = v6;
  if (!v88)
  {
    GEOFindOrCreateLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v136 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      v137 = 1024;
      v138 = 320;
      v139 = 2082;
      v140 = "-[MapsSuggestionsShortcutManager _mergeShortcuts:toMeCardAndCallHandler:]";
      v141 = 2082;
      v142 = "nil == (handler)";
      _os_log_impl(&dword_1A427D000, v25, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
    }

    goto LABEL_157;
  }
  v7 = val[1];
  dispatch_assert_queue_V2(v7);

  objc_initWeak(&location, val);
  v8 = val[10];
  v105 = v90;
  v9 = isAuthorizedToUseContacts();
  v128 = 0u;
  v129 = 0u;
  v126 = 0u;
  v127 = 0u;
  objc_msgSend(v8, "shortcutsForAll");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = 0;
  v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v126, buf, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v127;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v127 != v14)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * i);
        if (objc_msgSend(v16, "type") == 2)
          v12 = 1;
        else
          v11 |= objc_msgSend(v16, "type") == 3;
      }
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v126, buf, 16);
    }
    while (v13);
  }

  v124 = 0u;
  v125 = 0u;
  v122 = 0u;
  v123 = 0u;
  obj = v105;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v122, v130, 16);
  if (!v17)
  {

    v18 = 0;
    goto LABEL_44;
  }
  v18 = 0;
  v19 = 0;
  v20 = *(_QWORD *)v123;
  do
  {
    for (j = 0; j != v17; ++j)
    {
      if (*(_QWORD *)v123 != v20)
        objc_enumerationMutation(obj);
      v22 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * j);
      if (objc_msgSend(v22, "type") == 2)
      {
        if (!v19)
        {
          if ((objc_msgSend(v22, "isSetupPlaceholder") & 1) != 0)
          {
            v19 = v22;
LABEL_26:
            v23 = v22;
            continue;
          }
          v19 = 0;
        }
        v12 = 1;
      }
      else
      {
        if (objc_msgSend(v22, "type") != 3)
          continue;
        if (!v18)
        {
          if (objc_msgSend(v22, "isSetupPlaceholder"))
          {
            v18 = v22;
            goto LABEL_26;
          }
          v18 = 0;
        }
        v11 = 1;
      }
    }
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v122, v130, 16);
  }
  while (v17);

  if (v19)
  {
    if (v18)
      goto LABEL_35;
LABEL_45:
    MapsSuggestionsSetupShortcutForType(3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v12 & 1) != 0)
      goto LABEL_46;
    goto LABEL_47;
  }
LABEL_44:
  MapsSuggestionsSetupShortcutForType(2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
    goto LABEL_45;
LABEL_35:
  if ((v12 & 1) != 0)
LABEL_46:
    objc_msgSend(v19, "setIsHidden:", 1);
LABEL_47:
  if ((v11 & 1) != 0)
    objc_msgSend(v18, "setIsHidden:", 1);
  if (!v9)
  {
    if (GEOConfigGetInteger() == 1)
    {
      objc_msgSend(v19, "setIsHidden:", 1);
      objc_msgSend(v18, "setIsHidden:", 1);
    }
    if (GEOConfigGetInteger() == 2)
    {
      objc_msgSend(v19, "setIsHidden:", 0);
      objc_msgSend(v18, "setIsHidden:", 0);
    }
  }
  GEOFindOrCreateLog();
  v26 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    *(_QWORD *)&v143 = v19;
    *((_QWORD *)&v143 + 1) = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v143, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v131) = 138412290;
    *(_QWORD *)((char *)&v131 + 4) = v27;
    _os_log_impl(&dword_1A427D000, v26, OS_LOG_TYPE_DEBUG, "Placeholders: %@", (uint8_t *)&v131, 0xCu);

  }
  *(_QWORD *)&v131 = v19;
  *((_QWORD *)&v131 + 1) = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v131, 2);
  v87 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(val[10], "shortcutsForAll");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v87, "count");
  v29 = objc_msgSend(v89, "count");
  v30 = objc_msgSend(obj, "count");
  v96 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v29 + v28 + v30);
  v97 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v89, "count"));
  v113 = 0u;
  v114 = 0u;
  v111 = 0u;
  v112 = 0u;
  v93 = v87;
  v31 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v111, &v126, 16);
  if (v31)
  {
    v32 = *(_QWORD *)v112;
    do
    {
      for (k = 0; k != v31; ++k)
      {
        if (*(_QWORD *)v112 != v32)
          objc_enumerationMutation(v93);
        v34 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * k);
        if ((objc_msgSend(v34, "isHidden") & 1) == 0)
          objc_msgSend(v96, "addObject:", v34);
      }
      v31 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v111, &v126, 16);
    }
    while (v31);
  }

  objc_msgSend(val[8], "removeAllObjects");
  v109 = 0u;
  v110 = 0u;
  v107 = 0u;
  v108 = 0u;
  v92 = v89;
  v95 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v107, &v122, 16);
  if (v95)
  {
    v94 = *(_QWORD *)v108;
    do
    {
      for (m = 0; m != v95; ++m)
      {
        if (*(_QWORD *)v108 != v94)
          objc_enumerationMutation(v92);
        v35 = *(id *)(*((_QWORD *)&v107 + 1) + 8 * m);
        v36 = obj;
        v143 = 0u;
        v144 = 0u;
        v145 = 0u;
        v146 = 0u;
        v100 = v36;
        v37 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v143, buf, 16);
        if (v37)
        {
          v101 = *(_QWORD *)v144;
          while (2)
          {
            for (n = 0; n != v37; ++n)
            {
              if (*(_QWORD *)v144 != v101)
                objc_enumerationMutation(v100);
              v39 = *(void **)(*((_QWORD *)&v143 + 1) + 8 * n);
              objc_msgSend(v39, "originatingAddressString");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = v105;
              if (v40)
              {
                objc_msgSend(v39, "originatingAddressString");
                v103 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "originatingAddressString");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v103, "isEqualToString:", v41))
                {

LABEL_90:
                  objc_msgSend(v39, "identifier");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v35, "setIdentifier:", v47);

                  objc_msgSend(v39, "customName");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v35, "setCustomName:", v48);

                  objc_msgSend(v39, "geoMapItem");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v35, "setGeoMapItem:", v49);

                  objc_msgSend(v35, "setIsHidden:", objc_msgSend(v39, "isHidden"));
                  v133 = 0u;
                  v134 = 0u;
                  v131 = 0u;
                  v132 = 0u;
                  objc_msgSend(v39, "contacts");
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v131, v130, 16);
                  if (v51)
                  {
                    v52 = *(_QWORD *)v132;
                    do
                    {
                      for (ii = 0; ii != v51; ++ii)
                      {
                        if (*(_QWORD *)v132 != v52)
                          objc_enumerationMutation(v50);
                        objc_msgSend(v35, "addContact:", *(_QWORD *)(*((_QWORD *)&v131 + 1) + 8 * ii));
                      }
                      v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v131, v130, 16);
                    }
                    while (v51);
                  }

                  goto LABEL_98;
                }
              }
              objc_msgSend(v39, "identifier");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v105 = v41;
              if (v42)
              {
                objc_msgSend(v39, "identifier");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "identifier");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                v45 = objc_msgSend(v43, "isEqualToString:", v44);

                if (v40)
                {

                  if ((v45 & 1) != 0)
                    goto LABEL_90;
                }
                else if (v45)
                {
                  goto LABEL_90;
                }
              }
              else if (v40)
              {

              }
            }
            v37 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v143, buf, 16);
            if (v37)
              continue;
            break;
          }
        }

        objc_msgSend(v35, "setDerivedFromMeCard:", 1);
        GEOFindOrCreateLog();
        v46 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v136 = (char *)v35;
          _os_log_impl(&dword_1A427D000, v46, OS_LOG_TYPE_DEBUG, "Found a brand new Shortcut in the raw MeCard: %@", buf, 0xCu);
        }

LABEL_98:
        objc_msgSend(v35, "identifier");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        if (v54)
        {
          if ((objc_msgSend(v97, "containsObject:", v54) & 1) == 0)
          {
            objc_msgSend(v97, "addObject:", v54);
            v55 = objc_msgSend(v35, "isHidden");
            v56 = v96;
            if (v55)
              v56 = val[8];
            objc_msgSend(v56, "addObject:", v35);
          }
        }
        else
        {
          GEOFindOrCreateLog();
          v57 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v136 = (char *)v35;
            _os_log_impl(&dword_1A427D000, v57, OS_LOG_TYPE_DEBUG, "Found Shortcut in MeCard without identifier: %@", buf, 0xCu);
          }

        }
      }
      v95 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v107, &v122, 16);
    }
    while (v95);
  }

  v133 = 0u;
  v134 = 0u;
  v131 = 0u;
  v132 = 0u;
  v58 = obj;
  v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v131, v130, 16);
  if (v59)
  {
    v60 = *(_QWORD *)v132;
    do
    {
      for (jj = 0; jj != v59; ++jj)
      {
        if (*(_QWORD *)v132 != v60)
          objc_enumerationMutation(v58);
        v62 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * jj);
        objc_msgSend(v62, "identifier");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        if (v63)
        {
          if ((objc_msgSend(v97, "containsObject:", v63) & 1) == 0
            && (objc_msgSend(v62, "isSetupPlaceholder") & 1) == 0)
          {
            objc_msgSend(v97, "addObject:", v63);
            if ((objc_msgSend(v62, "isHidden") & 1) == 0)
              objc_msgSend(v96, "addObject:", v62);
          }
        }
        else
        {
          GEOFindOrCreateLog();
          v64 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v136 = (char *)v62;
            _os_log_impl(&dword_1A427D000, v64, OS_LOG_TYPE_DEBUG, "Found Shortcut in storage without identifier: %@", buf, 0xCu);
          }

        }
      }
      v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v131, v130, 16);
    }
    while (v59);
  }

  v102 = v96;
  v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v102, "count"));
  v145 = 0u;
  v146 = 0u;
  v143 = 0u;
  v144 = 0u;
  v104 = v102;
  v66 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v143, buf, 16);
  if (v66)
  {
    v67 = *(_QWORD *)v144;
    do
    {
      for (kk = 0; kk != v66; ++kk)
      {
        if (*(_QWORD *)v144 != v67)
          objc_enumerationMutation(v104);
        v69 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v143 + 1) + 8 * kk), "copy");
        objc_msgSend(v69, "identifier");
        v70 = objc_claimAutoreleasedReturnValue();
        if (!v70)
        {
          if ((objc_msgSend(v69, "isBackedPlaceholder") & 1) != 0)
          {
            v70 = 0;
          }
          else
          {
            if ((objc_msgSend(v69, "isSetupPlaceholder") & 1) != 0)
              goto LABEL_136;
            v71 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
            objc_msgSend(v71, "UUIDString");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "setIdentifier:", v72);

            GEOFindOrCreateLog();
            v70 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
            {
              LODWORD(v116) = 138412290;
              *(_QWORD *)((char *)&v116 + 4) = v69;
              _os_log_impl(&dword_1A427D000, v70, OS_LOG_TYPE_DEBUG, "Set fake identifier on Shortcut: %@", (uint8_t *)&v116, 0xCu);
            }

          }
        }

LABEL_136:
        GEOFindOrCreateLog();
        v73 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(v116) = 138412290;
          *(_QWORD *)((char *)&v116 + 4) = v69;
          _os_log_impl(&dword_1A427D000, v73, OS_LOG_TYPE_DEBUG, "Will store Shortcut: %@", (uint8_t *)&v116, 0xCu);
        }

        objc_msgSend(v65, "addObject:", v69);
      }
      v66 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v143, buf, 16);
    }
    while (v66);
  }

  v74 = (char *)objc_msgSend(v65, "copy");
  GEOFindOrCreateLog();
  v75 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v136 = v74;
    _os_log_impl(&dword_1A427D000, v75, OS_LOG_TYPE_DEBUG, "Shortcuts to store (unclean): %@", buf, 0xCu);
  }

  v76 = v74;
  v77 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v76, "count"));
  v145 = 0u;
  v146 = 0u;
  v143 = 0u;
  v144 = 0u;
  v78 = v76;
  v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v143, buf, 16);
  if (v79)
  {
    v80 = *(_QWORD *)v144;
    do
    {
      for (mm = 0; mm != v79; ++mm)
      {
        if (*(_QWORD *)v144 != v80)
          objc_enumerationMutation(v78);
        v82 = *(void **)(*((_QWORD *)&v143 + 1) + 8 * mm);
        if ((objc_msgSend(v58, "containsObject:", v82) & 1) == 0 && (objc_msgSend(v82, "isSetupPlaceholder") & 1) == 0)
          objc_msgSend(v77, "addObject:", v82);
      }
      v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v143, buf, 16);
    }
    while (v79);
  }

  GEOFindOrCreateLog();
  v83 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(v116) = 138412290;
    *(_QWORD *)((char *)&v116 + 4) = v104;
    _os_log_impl(&dword_1A427D000, v83, OS_LOG_TYPE_DEBUG, "All known Shortcuts: %@", (uint8_t *)&v116, 0xCu);
  }

  GEOFindOrCreateLog();
  v84 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(v116) = 138412290;
    *(_QWORD *)((char *)&v116 + 4) = v78;
    _os_log_impl(&dword_1A427D000, v84, OS_LOG_TYPE_DEBUG, "Storing changed Shortcuts: %@", (uint8_t *)&v116, 0xCu);
  }

  v85 = val[3];
  *(_QWORD *)&v116 = MEMORY[0x1E0C809B0];
  *((_QWORD *)&v116 + 1) = 3221225472;
  v117 = __73__MapsSuggestionsShortcutManager__mergeShortcuts_toMeCardAndCallHandler___block_invoke;
  v118 = &unk_1E4BCEEE8;
  objc_copyWeak(v121, &location);
  v86 = v104;
  v119 = v86;
  v120 = v88;
  objc_msgSend(v85, "addOrUpdateShortcuts:handler:", v77, &v116);

  objc_destroyWeak(v121);
  objc_destroyWeak(&location);
LABEL_157:

LABEL_158:
}

uint64_t __67__MapsSuggestionsShortcutManager___loadCorrectedMeCardWithHandler___block_invoke_128(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  v4 = 0;
  switch(objc_msgSend(v3, "type"))
  {
    case 1:
    case 6:
      v4 = 1;
      break;
    case 2:
      v5 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
      objc_msgSend(v3, "originatingAddressString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v5, "containsObject:", v6) & 1) != 0)
        goto LABEL_8;
      goto LABEL_9;
    case 3:
      v7 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
      objc_msgSend(v3, "originatingAddressString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "containsObject:", v6) & 1) == 0)
        goto LABEL_9;
      goto LABEL_8;
    case 5:
      v8 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
      objc_msgSend(v3, "originatingAddressString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "containsObject:", v6) & 1) != 0)
LABEL_8:
        v4 = 1;
      else
LABEL_9:
        v4 = objc_msgSend(v3, "isSetupPlaceholder");

      break;
    default:
      break;
  }

  return v4;
}

- (uint64_t)_loadCorrectedMeCardWithHandler:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  _BYTE location[12];
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!a1)
  {
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  if (!v3)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      v19 = 1024;
      v20 = 533;
      v21 = 2082;
      v22 = "-[MapsSuggestionsShortcutManager _loadCorrectedMeCardWithHandler:]";
      v23 = 2082;
      v24 = "nil == (handler)";
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", location, 0x26u);
    }

    goto LABEL_7;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  objc_initWeak((id *)location, (id)a1);
  v5 = *(id *)(a1 + 8);
  v6 = *(id *)(a1 + 16);
  v7 = *(void **)(a1 + 48);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3321888768;
  v13[2] = __66__MapsSuggestionsShortcutManager__loadCorrectedMeCardWithHandler___block_invoke;
  v13[3] = &unk_1E4BCEFE8;
  v8 = v5;
  v16 = v8;
  v9 = v6;
  v17 = v9;
  objc_copyWeak(&v15, (id *)location);
  v14 = v4;
  v10 = objc_msgSend(v7, "readMeCardAddressStringsWithHandler:", v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)location);
LABEL_8:

  return v10;
}

void __66__MapsSuggestionsShortcutManager__loadCorrectedMeCardWithHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v12)
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v12;
      _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_ERROR, "Error reading raw address strings: %@", buf, 0xCu);
    }

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__MapsSuggestionsShortcutManager__loadCorrectedMeCardWithHandler___block_invoke_131;
  block[3] = &unk_1E4BCEFC0;
  objc_copyWeak(&v23, (id *)(a1 + 40));
  v19 = v9;
  v20 = v10;
  v21 = v11;
  v22 = *(id *)(a1 + 32);
  v14 = *(NSObject **)(a1 + 48);
  v15 = v11;
  v16 = v10;
  v17 = v9;
  dispatch_async(v14, block);

  objc_destroyWeak(&v23);
}

void __66__MapsSuggestionsShortcutManager__loadCorrectedMeCardWithHandler___block_invoke_131(id *a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  id location;
  _BYTE buf[40];
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(a1 + 8);
  if (WeakRetained)
  {
    v3 = objc_msgSend(a1[4], "copy");
    v4 = (void *)*((_QWORD *)WeakRetained + 13);
    *((_QWORD *)WeakRetained + 13) = v3;

    v5 = objc_msgSend(a1[5], "copy");
    v6 = (void *)*((_QWORD *)WeakRetained + 14);
    *((_QWORD *)WeakRetained + 14) = v5;

    v7 = objc_msgSend(a1[6], "copy");
    v8 = (void *)*((_QWORD *)WeakRetained + 15);
    *((_QWORD *)WeakRetained + 15) = v7;

    v9 = a1[7];
    if (v9)
    {
      dispatch_assert_queue_V2(*((dispatch_queue_t *)WeakRetained + 1));
      objc_initWeak(&location, WeakRetained);
      v10 = *((id *)WeakRetained + 1);
      v11 = *((id *)WeakRetained + 2);
      v12 = (void *)*((_QWORD *)WeakRetained + 6);
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3321888768;
      *(_QWORD *)&buf[16] = __67__MapsSuggestionsShortcutManager___loadCorrectedMeCardWithHandler___block_invoke;
      *(_QWORD *)&buf[24] = &unk_1E4BCEF88;
      v13 = v10;
      v21 = v13;
      v14 = v11;
      v22 = v14;
      *(_QWORD *)&buf[32] = WeakRetained;
      objc_copyWeak(&v20, &location);
      v19 = v9;
      objc_msgSend(v12, "readMeCardWithHandler:", buf);

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
    else
    {
      GEOFindOrCreateLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 453;
        *(_WORD *)&buf[18] = 2082;
        *(_QWORD *)&buf[20] = "-[MapsSuggestionsShortcutManager __loadCorrectedMeCardWithHandler:]";
        *(_WORD *)&buf[28] = 2082;
        *(_QWORD *)&buf[30] = "nil == (handler)";
        _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
      }

    }
  }
  else
  {
    GEOFindOrCreateLog();
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)&buf[4] = "MapsSuggestionsShortcutManager.mm";
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = 551;
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "-[MapsSuggestionsShortcutManager _loadCorrectedMeCardWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v15, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

- (char)loadAllShortcutsWithHandler:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  _QWORD v9[5];
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
    v9[2] = __62__MapsSuggestionsShortcutManager_loadAllShortcutsWithHandler___block_invoke;
    v9[3] = &unk_1E4BCF0C0;
    v9[4] = self;
    v10 = v4;
    MSg::Queue::async<MapsSuggestionsShortcutManager>((NSObject **)&self->_queue, self, v9);

    v6 = 1;
  }
  else
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      v13 = 1024;
      v14 = 563;
      v15 = 2082;
      v16 = "-[MapsSuggestionsShortcutManager loadAllShortcutsWithHandler:]";
      v17 = 2082;
      v18 = "nil == (handler)";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
    }

    v6 = 0;
  }

  return v6;
}

void __62__MapsSuggestionsShortcutManager_loadAllShortcutsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  id *v7;
  id *v8;
  void *v9;
  id v10;
  id *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  id v15;
  _QWORD v16[6];
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[6];
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[8];
  id location;

  v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  GEOFindOrCreateLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "Loading Shortcuts", buf, 2u);
  }

  if (-[MapsSuggestionsShortcutManager usingMyPlaces](*(_QWORD *)(a1 + 32)))
  {
    v5 = (void *)v3[7];
    v6 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __62__MapsSuggestionsShortcutManager_loadAllShortcutsWithHandler___block_invoke_134;
    v21[3] = &unk_1E4BCF048;
    v7 = &v23;
    objc_copyWeak(&v23, &location);
    v22 = *(id *)(a1 + 40);
    v8 = &v22;
    if (!objc_msgSend(v5, "shortcutsFromFavoritesWithHandler:", v21))
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MapsSuggestionError"), -1, &unk_1E4C09EF8);
      v20[0] = v6;
      v20[1] = 3221225472;
      v20[2] = __62__MapsSuggestionsShortcutManager_loadAllShortcutsWithHandler___block_invoke_2;
      v20[3] = &unk_1E4BCF070;
      v10 = *(id *)(a1 + 40);
      v20[4] = v9;
      v20[5] = v10;
      v11 = (id *)v20;
LABEL_8:
      v14 = v3[1];
      v15 = v9;
      dispatch_async(v14, v11);

    }
  }
  else
  {
    v12 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __62__MapsSuggestionsShortcutManager_loadAllShortcutsWithHandler___block_invoke_3;
    v17[3] = &unk_1E4BCF098;
    v7 = &v19;
    objc_copyWeak(&v19, &location);
    v18 = *(id *)(a1 + 40);
    v8 = &v18;
    if (!-[MapsSuggestionsShortcutManager _loadCorrectedMeCardWithHandler:]((uint64_t)v3, v17))
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MapsSuggestionError"), -1, &unk_1E4C09F20);
      v16[0] = v12;
      v16[1] = 3221225472;
      v16[2] = __62__MapsSuggestionsShortcutManager_loadAllShortcutsWithHandler___block_invoke_2_149;
      v16[3] = &unk_1E4BCF070;
      v13 = *(id *)(a1 + 40);
      v16[4] = v9;
      v16[5] = v13;
      v11 = (id *)v16;
      goto LABEL_8;
    }
  }

  objc_destroyWeak(v7);
  objc_destroyWeak(&location);

}

void __62__MapsSuggestionsShortcutManager_loadAllShortcutsWithHandler___block_invoke_134(uint64_t a1, void *a2, void *a3)
{
  char *v5;
  id v6;
  dispatch_queue_t *WeakRetained;
  NSObject *v8;
  NSObject *v9;
  _QWORD block[4];
  char *v11;
  id v12;
  NSObject *v13;
  uint8_t buf[4];
  char *v15;
  __int16 v16;
  _WORD v17[17];

  *(_QWORD *)&v17[13] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v15 = v5;
      v16 = 2112;
      *(_QWORD *)v17 = v6;
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "Loaded new Shortcuts: %@ (%@)", buf, 0x16u);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__MapsSuggestionsShortcutManager_loadAllShortcutsWithHandler___block_invoke_135;
    block[3] = &unk_1E4BCF020;
    v13 = *(id *)(a1 + 32);
    v11 = v5;
    v12 = v6;
    dispatch_async(WeakRetained[1], block);

    v9 = v13;
  }
  else
  {
    GEOFindOrCreateLog();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v15 = "MapsSuggestionsShortcutManager.mm";
      v16 = 1026;
      *(_DWORD *)v17 = 569;
      v17[2] = 2082;
      *(_QWORD *)&v17[3] = "-[MapsSuggestionsShortcutManager loadAllShortcutsWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", buf, 0x1Cu);
    }

  }
}

uint64_t __62__MapsSuggestionsShortcutManager_loadAllShortcutsWithHandler___block_invoke_135(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __62__MapsSuggestionsShortcutManager_loadAllShortcutsWithHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), MEMORY[0x1E0C9AA60], *(_QWORD *)(a1 + 32));
}

void __62__MapsSuggestionsShortcutManager_loadAllShortcutsWithHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  dispatch_queue_t *WeakRetained;
  NSObject *v8;
  char *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13;
  NSObject *v14;
  uint8_t buf[4];
  char *v16;
  __int16 v17;
  _WORD v18[17];

  *(_QWORD *)&v18[13] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    GEOFindOrCreateLog();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v5, "shortcutsForAll");
      v9 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v16 = v9;
      v17 = 2112;
      *(_QWORD *)v18 = v6;
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "Loaded Shortcuts: %@ (%@)", buf, 0x16u);

    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__MapsSuggestionsShortcutManager_loadAllShortcutsWithHandler___block_invoke_143;
    block[3] = &unk_1E4BCF020;
    v14 = *(id *)(a1 + 32);
    v12 = v5;
    v13 = v6;
    dispatch_async(WeakRetained[1], block);

    v10 = v14;
  }
  else
  {
    GEOFindOrCreateLog();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v16 = "MapsSuggestionsShortcutManager.mm";
      v17 = 1026;
      *(_DWORD *)v18 = 583;
      v18[2] = 2082;
      *(_QWORD *)&v18[3] = "-[MapsSuggestionsShortcutManager loadAllShortcutsWithHandler:]_block_invoke_3";
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __62__MapsSuggestionsShortcutManager_loadAllShortcutsWithHandler___block_invoke_143(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "shortcutsForAll");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v1 + 16))(v1);

}

uint64_t __62__MapsSuggestionsShortcutManager_loadAllShortcutsWithHandler___block_invoke_2_149(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), MEMORY[0x1E0C9AA60], *(_QWORD *)(a1 + 32));
}

- (char)addOrUpdateShortcuts:(id)a3 handler:(id)a4
{
  char *v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  char v11;
  const char *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = (char *)a3;
  v7 = a4;
  if (!v7)
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      v19 = 1024;
      v20 = 604;
      v21 = 2082;
      v22 = "-[MapsSuggestionsShortcutManager addOrUpdateShortcuts:handler:]";
      v23 = 2082;
      v24 = "nil == (handler)";
      v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_10:
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, v12, buf, 0x26u);
    }
LABEL_11:
    v11 = 0;
    goto LABEL_12;
  }
  if (!v6)
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      v19 = 1024;
      v20 = 605;
      v21 = 2082;
      v22 = "-[MapsSuggestionsShortcutManager addOrUpdateShortcuts:handler:]";
      v23 = 2082;
      v24 = "nil == (shortcuts)";
      v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires shortcuts";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  GEOFindOrCreateLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v6;
    _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "Storing Shortcuts: %@", buf, 0xCu);
  }

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v6, 1);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __63__MapsSuggestionsShortcutManager_addOrUpdateShortcuts_handler___block_invoke;
  v14[3] = &unk_1E4BCF0C0;
  v15 = v9;
  v16 = v7;
  v10 = v9;
  MSg::Queue::async<MapsSuggestionsShortcutManager>((NSObject **)&self->_queue, self, v14);

  v11 = 1;
LABEL_12:

  return v11;
}

void __63__MapsSuggestionsShortcutManager_addOrUpdateShortcuts_handler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  id *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  uint8_t v24[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v16 = a1;
  v17 = a2;
  v2 = *(id *)(v16 + 32);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v2, "count"));
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v19;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v4);
        v8 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v7), "copy", v16);
        objc_msgSend(v8, "identifier");
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
          goto LABEL_9;
        if ((objc_msgSend(v8, "isBackedPlaceholder") & 1) != 0)
        {
          v9 = 0;
LABEL_9:

          goto LABEL_10;
        }
        if ((objc_msgSend(v8, "isSetupPlaceholder") & 1) == 0)
        {
          v11 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
          objc_msgSend(v11, "UUIDString");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setIdentifier:", v12);

          GEOFindOrCreateLog();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v23 = v8;
            _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_DEBUG, "Set fake identifier on Shortcut: %@", buf, 0xCu);
          }
          goto LABEL_9;
        }
LABEL_10:
        GEOFindOrCreateLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v23 = v8;
          _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_DEBUG, "Will store Shortcut: %@", buf, 0xCu);
        }

        objc_msgSend(v8, "setDerivedFromMeCard:", 0);
        objc_msgSend(v3, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v13 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      v5 = v13;
    }
    while (v13);
  }

  v14 = (void *)objc_msgSend(v3, "copy");
  GEOFindOrCreateLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v24 = 138412290;
    v25 = v14;
    _os_log_impl(&dword_1A427D000, v15, OS_LOG_TYPE_DEBUG, "Shortcuts to store (cleaned): %@", v24, 0xCu);
  }

  objc_msgSend(v17[3], "addOrUpdateShortcuts:handler:", v14, *(_QWORD *)(v16 + 40));
}

- (char)removeShortcuts:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  MapsSuggestionsShortcutStorage *v8;
  NSObject *innerQueue;
  NSObject *v10;
  char v11;
  const char *v12;
  _QWORD block[4];
  id v15;
  MapsSuggestionsShortcutStorage *v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      v20 = 1024;
      v21 = 625;
      v22 = 2082;
      v23 = "-[MapsSuggestionsShortcutManager removeShortcuts:handler:]";
      v24 = 2082;
      v25 = "nil == (handler)";
      v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_8:
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, v12, buf, 0x26u);
    }
LABEL_9:
    v11 = 0;
    goto LABEL_10;
  }
  if (!v6)
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      v20 = 1024;
      v21 = 626;
      v22 = 2082;
      v23 = "-[MapsSuggestionsShortcutManager removeShortcuts:handler:]";
      v24 = 2082;
      v25 = "nil == (shortcuts)";
      v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires shortcuts";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v8 = self->_storage;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__MapsSuggestionsShortcutManager_removeShortcuts_handler___block_invoke;
  block[3] = &unk_1E4BCE478;
  v15 = v6;
  v16 = v8;
  v17 = v7;
  innerQueue = self->_queue._innerQueue;
  v10 = v8;
  dispatch_async(innerQueue, block);

  v11 = 1;
LABEL_10:

  return v11;
}

void __58__MapsSuggestionsShortcutManager_removeShortcuts_handler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v12 = a1;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "type");
        if (v9 <= 6)
        {
          if (((1 << v9) & 0x2C) != 0)
          {
            objc_msgSend(v8, "setIsHidden:", 1);
            v11 = v2;
LABEL_11:
            objc_msgSend(v11, "addObject:", v8);
            continue;
          }
          v10 = 1 << v9;
          v11 = v3;
          if ((v10 & 0x43) != 0)
            goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  if (objc_msgSend(v2, "count"))
    objc_msgSend(*(id *)(v12 + 40), "addOrUpdateShortcuts:handler:", v2, *(_QWORD *)(v12 + 48));
  if (objc_msgSend(v3, "count"))
    objc_msgSend(*(id *)(v12 + 40), "removeShortcuts:handler:", v3, *(_QWORD *)(v12 + 48));

}

- (char)moveShortcut:(id)a3 toIndex:(int64_t)a4 withSnapshot:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  unint64_t i;
  void *v14;
  char v15;
  NSObject *v16;
  char v17;
  void *v18;
  unint64_t v19;
  id *v20;
  Queue *p_queue;
  id *v22;
  id *v23;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD block[4];
  id v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  const char *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (!v12)
  {
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v43 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      v44 = 1024;
      v45 = 665;
      v46 = 2082;
      v47 = "-[MapsSuggestionsShortcutManager moveShortcut:toIndex:withSnapshot:handler:]";
      v48 = 2082;
      v49 = "nil == (handler)";
      _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
    }
    goto LABEL_16;
  }
  if (!v10)
  {
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v43 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      v44 = 1024;
      v45 = 666;
      v46 = 2082;
      v47 = "-[MapsSuggestionsShortcutManager moveShortcut:toIndex:withSnapshot:handler:]";
      v48 = 2082;
      v49 = "nil == (shortcut)";
      _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires shortcuts", buf, 0x26u);
    }
    goto LABEL_16;
  }
  if (a4 < 0)
  {
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v43 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      v44 = 1024;
      v45 = 667;
      v46 = 2082;
      v47 = "-[MapsSuggestionsShortcutManager moveShortcut:toIndex:withSnapshot:handler:]";
      v48 = 2082;
      v49 = "index < 0";
      _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires index >= 0", buf, 0x26u);
    }
LABEL_16:

    v17 = 0;
    goto LABEL_31;
  }
  for (i = 0; i < objc_msgSend(v11, "count"); ++i)
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", i);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToShortcut:", v10);

    if ((v15 & 1) != 0)
      goto LABEL_18;
  }
  i = -1;
LABEL_18:
  if (i == a4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__MapsSuggestionsShortcutManager_moveShortcut_toIndex_withSnapshot_handler___block_invoke;
    block[3] = &unk_1E4BCE348;
    v41 = v12;
    dispatch_async((dispatch_queue_t)self->_queue._innerQueue, block);

  }
  else if (i >= objc_msgSend(v11, "count"))
  {
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __76__MapsSuggestionsShortcutManager_moveShortcut_toIndex_withSnapshot_handler___block_invoke_2;
    v38[3] = &unk_1E4BCE348;
    v39 = v12;
    dispatch_async((dispatch_queue_t)self->_queue._innerQueue, v38);

  }
  else
  {
    objc_initWeak((id *)buf, self);
    if (a4 <= 0)
    {
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __76__MapsSuggestionsShortcutManager_moveShortcut_toIndex_withSnapshot_handler___block_invoke_3;
      v34[3] = &unk_1E4BCE780;
      objc_copyWeak(&v37, (id *)buf);
      v35 = v10;
      v36 = v12;
      dispatch_async((dispatch_queue_t)self->_queue._innerQueue, v34);

      objc_destroyWeak(&v37);
    }
    else
    {
      objc_msgSend(v11, "objectAtIndex:", a4 - (i >= a4));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "type");
      if (v19 <= 5 && ((1 << v19) & 0x2C) != 0)
      {
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __76__MapsSuggestionsShortcutManager_moveShortcut_toIndex_withSnapshot_handler___block_invoke_154;
        v30[3] = &unk_1E4BCE780;
        v20 = &v33;
        objc_copyWeak(&v33, (id *)buf);
        p_queue = &self->_queue;
        v22 = &v31;
        v31 = v10;
        v23 = &v32;
        v32 = v12;
        dispatch_async((dispatch_queue_t)p_queue->_innerQueue, v30);
      }
      else
      {
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __76__MapsSuggestionsShortcutManager_moveShortcut_toIndex_withSnapshot_handler___block_invoke_155;
        v25[3] = &unk_1E4BCE7F8;
        v20 = &v29;
        objc_copyWeak(&v29, (id *)buf);
        v26 = v10;
        v27 = v18;
        v28 = v12;
        dispatch_async((dispatch_queue_t)self->_queue._innerQueue, v25);

        v22 = &v26;
        v23 = &v27;
      }

      objc_destroyWeak(v20);
    }
    objc_destroyWeak((id *)buf);
  }
  v17 = 1;
LABEL_31:

  return v17;
}

uint64_t __76__MapsSuggestionsShortcutManager_moveShortcut_toIndex_withSnapshot_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __76__MapsSuggestionsShortcutManager_moveShortcut_toIndex_withSnapshot_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __76__MapsSuggestionsShortcutManager_moveShortcut_toIndex_withSnapshot_handler___block_invoke_3(uint64_t a1)
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
    objc_msgSend(WeakRetained[3], "moveShortcutToFront:handler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136446722;
      v6 = "MapsSuggestionsShortcutManager.mm";
      v7 = 1026;
      v8 = 700;
      v9 = 2082;
      v10 = "-[MapsSuggestionsShortcutManager moveShortcut:toIndex:withSnapshot:handler:]_block_invoke_3";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }

  }
}

void __76__MapsSuggestionsShortcutManager_moveShortcut_toIndex_withSnapshot_handler___block_invoke_154(uint64_t a1)
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
    objc_msgSend(WeakRetained[3], "moveShortcutToFront:handler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136446722;
      v6 = "MapsSuggestionsShortcutManager.mm";
      v7 = 1026;
      v8 = 719;
      v9 = 2082;
      v10 = "-[MapsSuggestionsShortcutManager moveShortcut:toIndex:withSnapshot:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }

  }
}

void __76__MapsSuggestionsShortcutManager_moveShortcut_toIndex_withSnapshot_handler___block_invoke_155(uint64_t a1)
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
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[3], "moveShortcut:afterShortcut:handler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136446722;
      v6 = "MapsSuggestionsShortcutManager.mm";
      v7 = 1026;
      v8 = 727;
      v9 = 2082;
      v10 = "-[MapsSuggestionsShortcutManager moveShortcut:toIndex:withSnapshot:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }

  }
}

- (char)moveShortcut:(id)a3 beforeShortcut:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  char v11;
  NSObject *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  _BYTE location[12];
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      v20 = 1024;
      v21 = 737;
      v22 = 2082;
      v23 = "-[MapsSuggestionsShortcutManager moveShortcut:beforeShortcut:handler:]";
      v24 = 2082;
      v25 = "nil == (handler)";
      _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", location, 0x26u);
    }
    goto LABEL_13;
  }
  if (!v8)
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      v20 = 1024;
      v21 = 738;
      v22 = 2082;
      v23 = "-[MapsSuggestionsShortcutManager moveShortcut:beforeShortcut:handler:]";
      v24 = 2082;
      v25 = "nil == (shortcut)";
      _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires shortcuts", location, 0x26u);
    }
    goto LABEL_13;
  }
  if (!v9)
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      v20 = 1024;
      v21 = 739;
      v22 = 2082;
      v23 = "-[MapsSuggestionsShortcutManager moveShortcut:beforeShortcut:handler:]";
      v24 = 2082;
      v25 = "nil == (other)";
      _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires shortcuts", location, 0x26u);
    }
LABEL_13:

    v11 = 0;
    goto LABEL_14;
  }
  objc_initWeak((id *)location, self);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __70__MapsSuggestionsShortcutManager_moveShortcut_beforeShortcut_handler___block_invoke;
  v14[3] = &unk_1E4BCE7F8;
  objc_copyWeak(&v18, (id *)location);
  v15 = v8;
  v16 = v9;
  v17 = v10;
  dispatch_async((dispatch_queue_t)self->_queue._innerQueue, v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)location);
  v11 = 1;
LABEL_14:

  return v11;
}

void __70__MapsSuggestionsShortcutManager_moveShortcut_beforeShortcut_handler___block_invoke(uint64_t a1)
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
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[3], "moveShortcut:beforeShortcut:handler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136446722;
      v6 = "MapsSuggestionsShortcutManager.mm";
      v7 = 1026;
      v8 = 745;
      v9 = 2082;
      v10 = "-[MapsSuggestionsShortcutManager moveShortcut:beforeShortcut:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }

  }
}

- (char)moveShortcut:(id)a3 afterShortcut:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  char v11;
  NSObject *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  _BYTE location[12];
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      v20 = 1024;
      v21 = 757;
      v22 = 2082;
      v23 = "-[MapsSuggestionsShortcutManager moveShortcut:afterShortcut:handler:]";
      v24 = 2082;
      v25 = "nil == (handler)";
      _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", location, 0x26u);
    }
    goto LABEL_13;
  }
  if (!v8)
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      v20 = 1024;
      v21 = 758;
      v22 = 2082;
      v23 = "-[MapsSuggestionsShortcutManager moveShortcut:afterShortcut:handler:]";
      v24 = 2082;
      v25 = "nil == (shortcut)";
      _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires shortcuts", location, 0x26u);
    }
    goto LABEL_13;
  }
  if (!v9)
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      v20 = 1024;
      v21 = 759;
      v22 = 2082;
      v23 = "-[MapsSuggestionsShortcutManager moveShortcut:afterShortcut:handler:]";
      v24 = 2082;
      v25 = "nil == (other)";
      _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires shortcuts", location, 0x26u);
    }
LABEL_13:

    v11 = 0;
    goto LABEL_14;
  }
  objc_initWeak((id *)location, self);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69__MapsSuggestionsShortcutManager_moveShortcut_afterShortcut_handler___block_invoke;
  v14[3] = &unk_1E4BCE7F8;
  objc_copyWeak(&v18, (id *)location);
  v15 = v8;
  v16 = v9;
  v17 = v10;
  dispatch_async((dispatch_queue_t)self->_queue._innerQueue, v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)location);
  v11 = 1;
LABEL_14:

  return v11;
}

void __69__MapsSuggestionsShortcutManager_moveShortcut_afterShortcut_handler___block_invoke(uint64_t a1)
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
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[3], "moveShortcut:afterShortcut:handler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136446722;
      v6 = "MapsSuggestionsShortcutManager.mm";
      v7 = 1026;
      v8 = 765;
      v9 = 2082;
      v10 = "-[MapsSuggestionsShortcutManager moveShortcut:afterShortcut:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }

  }
}

- (char)moveShortcutToFront:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  char v8;
  NSObject *v9;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  _BYTE location[12];
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      v16 = 1024;
      v17 = 776;
      v18 = 2082;
      v19 = "-[MapsSuggestionsShortcutManager moveShortcutToFront:handler:]";
      v20 = 2082;
      v21 = "nil == (handler)";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", location, 0x26u);
    }
    goto LABEL_9;
  }
  if (!v6)
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      v16 = 1024;
      v17 = 777;
      v18 = 2082;
      v19 = "-[MapsSuggestionsShortcutManager moveShortcutToFront:handler:]";
      v20 = 2082;
      v21 = "nil == (shortcut)";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires shortcuts", location, 0x26u);
    }
LABEL_9:

    v8 = 0;
    goto LABEL_10;
  }
  objc_initWeak((id *)location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__MapsSuggestionsShortcutManager_moveShortcutToFront_handler___block_invoke;
  block[3] = &unk_1E4BCE780;
  objc_copyWeak(&v14, (id *)location);
  v12 = v6;
  v13 = v7;
  dispatch_async((dispatch_queue_t)self->_queue._innerQueue, block);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)location);
  v8 = 1;
LABEL_10:

  return v8;
}

void __62__MapsSuggestionsShortcutManager_moveShortcutToFront_handler___block_invoke(uint64_t a1)
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
    objc_msgSend(WeakRetained[3], "moveShortcutToFront:handler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136446722;
      v6 = "MapsSuggestionsShortcutManager.mm";
      v7 = 1026;
      v8 = 783;
      v9 = 2082;
      v10 = "-[MapsSuggestionsShortcutManager moveShortcutToFront:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }

  }
}

- (char)moveShortcutToBack:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  char v8;
  NSObject *v9;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  _BYTE location[12];
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      v16 = 1024;
      v17 = 794;
      v18 = 2082;
      v19 = "-[MapsSuggestionsShortcutManager moveShortcutToBack:handler:]";
      v20 = 2082;
      v21 = "nil == (handler)";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", location, 0x26u);
    }
    goto LABEL_9;
  }
  if (!v6)
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      v16 = 1024;
      v17 = 795;
      v18 = 2082;
      v19 = "-[MapsSuggestionsShortcutManager moveShortcutToBack:handler:]";
      v20 = 2082;
      v21 = "nil == (shortcut)";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires shortcuts", location, 0x26u);
    }
LABEL_9:

    v8 = 0;
    goto LABEL_10;
  }
  objc_initWeak((id *)location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__MapsSuggestionsShortcutManager_moveShortcutToBack_handler___block_invoke;
  block[3] = &unk_1E4BCE780;
  objc_copyWeak(&v14, (id *)location);
  v12 = v6;
  v13 = v7;
  dispatch_async((dispatch_queue_t)self->_queue._innerQueue, block);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)location);
  v8 = 1;
LABEL_10:

  return v8;
}

void __61__MapsSuggestionsShortcutManager_moveShortcutToBack_handler___block_invoke(uint64_t a1)
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
    objc_msgSend(WeakRetained[3], "moveShortcutToBack:handler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136446722;
      v6 = "MapsSuggestionsShortcutManager.mm";
      v7 = 1026;
      v8 = 801;
      v9 = 2082;
      v10 = "-[MapsSuggestionsShortcutManager moveShortcutToBack:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }

  }
}

- (char)proposeAdditionalShortcutsOfType:(int64_t)a3 handler:(id)a4
{
  id v6;
  NSObject *v7;
  char *v8;
  char v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  NSObject *v16;
  int64_t v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6)
  {
    GEOFindOrCreateLog();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromMapsSuggestionsShortcutType(a3);
      v8 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v8;
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "proposeAdditionalShortcutsOfType:%@", buf, 0xCu);

    }
    if (+[MapsSuggestionsSiri isEnabled](MapsSuggestionsSiri, "isEnabled"))
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __75__MapsSuggestionsShortcutManager_proposeAdditionalShortcutsOfType_handler___block_invoke;
      v15[3] = &unk_1E4BCF110;
      v16 = v6;
      v17 = a3;
      MSg::Queue::async<MapsSuggestionsShortcutManager>((NSObject **)&self->_queue, self, v15);
      v9 = 1;
      v10 = v16;
    }
    else
    {
      GEOFindOrCreateLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_DEBUG, "User turned off Siri Suggestions for Maps. Showing nothing in proposed shortcuts", buf, 2u);
      }

      v12 = (void *)MEMORY[0x1E0CB35C8];
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("User turned off Siri Suggestions for Maps"));
      objc_msgSend(v12, "GEOErrorWithCode:reason:", -8, v13);
      v10 = objc_claimAutoreleasedReturnValue();

      (*((void (**)(id, _QWORD, NSObject *))v6 + 2))(v6, 0, v10);
      v9 = 1;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      v20 = 1024;
      v21 = 900;
      v22 = 2082;
      v23 = "-[MapsSuggestionsShortcutManager proposeAdditionalShortcutsOfType:handler:]";
      v24 = 2082;
      v25 = "nil == (handler)";
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
    }
    v9 = 0;
  }

  return v9;
}

void __75__MapsSuggestionsShortcutManager_proposeAdditionalShortcutsOfType_handler___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD aBlock[4];
  id v21;
  id v22;
  id *v23;
  id v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3[8], "count"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3[8], "count"));
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = v3[8];
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v27;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v6);
        v10 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v9), "copy");
        if (objc_msgSend(v10, "isSetupPlaceholder"))
          v11 = v5;
        else
          v11 = v4;
        objc_msgSend(v11, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v7);
  }

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__MapsSuggestionsShortcutManager_proposeAdditionalShortcutsOfType_handler___block_invoke_2;
  aBlock[3] = &unk_1E4BCF0E8;
  v12 = *(id *)(a1 + 32);
  v13 = *(_QWORD *)(a1 + 40);
  v24 = v12;
  v25 = v13;
  v14 = v4;
  v21 = v14;
  v15 = v5;
  v22 = v15;
  v16 = v3;
  v23 = v16;
  v17 = _Block_copy(aBlock);
  if (!objc_msgSend(v16[3], "loadAllShortcutsWithHandler:", v17))
  {
    v18 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -12, CFSTR("Could not call loadAllShortcutsWithHandler:"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v18 + 16))(v18, 0, v19);

  }
}

void __75__MapsSuggestionsShortcutManager_proposeAdditionalShortcutsOfType_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _QWORD aBlock[4];
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v6;
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "Error loading existing Shortcuts: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 2 * objc_msgSend(v5, "count"));
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v32 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          if ((objc_msgSend(v13, "isHidden") & 1) == 0)
          {
            objc_msgSend(v13, "identifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = v14 == 0;

            if (!v15)
            {
              objc_msgSend(v13, "identifier");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "addObject:", v16);

            }
            objc_msgSend(v13, "geoMapItem");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "shortAddress");
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (v18)
              objc_msgSend(v8, "addObject:", v18);

          }
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v10);
    }

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __75__MapsSuggestionsShortcutManager_proposeAdditionalShortcutsOfType_handler___block_invoke_161;
    aBlock[3] = &unk_1E4BCF0E8;
    v19 = *(id *)(a1 + 56);
    v20 = *(_QWORD *)(a1 + 64);
    v29 = v19;
    v30 = v20;
    v21 = v8;
    v26 = v21;
    v27 = *(id *)(a1 + 32);
    v28 = *(id *)(a1 + 40);
    v22 = _Block_copy(aBlock);
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 32), "suggestShortcutsOfType:handler:", *(_QWORD *)(a1 + 64), v22))
    {
      v23 = *(_QWORD *)(a1 + 56);
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -12, CFSTR("Could not call suggestShortcutsOfType:handler:"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v23 + 16))(v23, 0, v24);

    }
  }

}

void __75__MapsSuggestionsShortcutManager_proposeAdditionalShortcutsOfType_handler___block_invoke_161(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  const char *v40;
  void *v41;
  _BOOL4 v42;
  void *v43;
  NSObject *v44;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  id v48;
  void *context;
  MapsSuggestionsShortcut *v50;
  void *v51;
  _QWORD *v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  void *v57;
  void *v58;
  id obj;
  id obja;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  MapsSuggestionsShortcut *v65;
  uint8_t v66[4];
  void *v67;
  uint8_t buf[4];
  id v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v53 = v5;
  v54 = a3;
  if (v54)
  {
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v69 = v54;
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "Error loading suggested Shortcuts: %@", buf, 0xCu);
    }

    v7 = v54;
    (*(void (**)(void))(a1[7] + 16))();
    goto LABEL_81;
  }
  context = (void *)MEMORY[0x1A859CDD8]();
  v8 = a1[8];
  v52 = a1;
  v9 = (void *)a1[4];
  v10 = v5;
  v11 = v9;
  v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v10, "count"));
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = v10;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, buf, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v62 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
        if (!v8 || objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * i), "type") == v8)
        {
          objc_msgSend(v15, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16 && objc_msgSend(v11, "containsObject:", v16))
          {
            GEOFindOrCreateLog();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v66 = 138412290;
              v67 = v15;
              v18 = v17;
              v19 = "Already had Shortcut (by ID): %@";
              goto LABEL_29;
            }
          }
          else if (objc_msgSend(v15, "type") != 6
                 && (objc_msgSend(v15, "geoMapItem"),
                     v20 = (void *)objc_claimAutoreleasedReturnValue(),
                     v21 = v20 == 0,
                     v20,
                     v21))
          {
            GEOFindOrCreateLog();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v66 = 138412290;
              v67 = v15;
              v18 = v17;
              v19 = "Shortcut had no MapItem: %@";
LABEL_29:
              _os_log_impl(&dword_1A427D000, v18, OS_LOG_TYPE_DEBUG, v19, v66, 0xCu);
            }
          }
          else
          {
            objc_msgSend(v15, "geoMapItem");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "shortAddress");
            v17 = objc_claimAutoreleasedReturnValue();

            if (v17 && objc_msgSend(v11, "containsObject:", v17))
            {
              GEOFindOrCreateLog();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)v66 = 138412290;
                v67 = v15;
                _os_log_impl(&dword_1A427D000, v23, OS_LOG_TYPE_DEBUG, "Already had Shortcut (by address): %@", v66, 0xCu);
              }

            }
            else
            {
              objc_msgSend(v57, "addObject:", v15);
              if (v16)
                objc_msgSend(v11, "addObject:", v16);
              if (v17)
                objc_msgSend(v11, "addObject:", v17);
            }
          }

          continue;
        }
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, buf, 16);
    }
    while (v12);
  }

  v51 = (void *)objc_msgSend(v57, "copy");
  objc_msgSend((id)v52[5], "arrayByAddingObjectsFromArray:", v51);
  v55 = (id)objc_claimAutoreleasedReturnValue();
  if (GEOConfigGetBOOL())
  {
    objc_msgSend((id)v52[6], "arrayByAddingObjectsFromArray:", v55);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v24 = v55;
  }
  v25 = v24;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v56 = v25;
  v26 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v61, buf, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v62;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v62 != v27)
          objc_enumerationMutation(v56);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * j), "type") == 6)
        {

          goto LABEL_77;
        }
      }
      v26 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v61, buf, 16);
    }
    while (v26);
  }

  v50 = -[MapsSuggestionsShortcut initWithType:geoMapItem:customName:]([MapsSuggestionsShortcut alloc], "initWithType:geoMapItem:customName:", 6, 0, CFSTR("NearbyTransit"));
  -[MapsSuggestionsShortcut setIdentifier:](v50, "setIdentifier:", CFSTR("NearbyTransit"));

  if (!v50)
  {
LABEL_77:
    v50 = 0;
    goto LABEL_78;
  }
  v65 = v50;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v65, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v52[8];
  v31 = (void *)v52[4];
  v48 = v29;
  v32 = v31;
  v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v48, "count"));
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  obja = v48;
  v33 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v61, buf, 16);
  if (!v33)
    goto LABEL_73;
  v34 = *(_QWORD *)v62;
  do
  {
    for (k = 0; k != v33; ++k)
    {
      if (*(_QWORD *)v62 != v34)
        objc_enumerationMutation(obja);
      v36 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * k);
      if (!v30 || objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * k), "type") == v30)
      {
        objc_msgSend(v36, "identifier", v48, context);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (v37 && objc_msgSend(v32, "containsObject:", v37))
        {
          GEOFindOrCreateLog();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v66 = 138412290;
            v67 = v36;
            v39 = v38;
            v40 = "Already had Shortcut (by ID): %@";
            goto LABEL_69;
          }
        }
        else if (objc_msgSend(v36, "type") != 6
               && (objc_msgSend(v36, "geoMapItem"),
                   v41 = (void *)objc_claimAutoreleasedReturnValue(),
                   v42 = v41 == 0,
                   v41,
                   v42))
        {
          GEOFindOrCreateLog();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v66 = 138412290;
            v67 = v36;
            v39 = v38;
            v40 = "Shortcut had no MapItem: %@";
LABEL_69:
            _os_log_impl(&dword_1A427D000, v39, OS_LOG_TYPE_DEBUG, v40, v66, 0xCu);
          }
        }
        else
        {
          objc_msgSend(v36, "geoMapItem");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "shortAddress");
          v38 = objc_claimAutoreleasedReturnValue();

          if (v38 && objc_msgSend(v32, "containsObject:", v38))
          {
            GEOFindOrCreateLog();
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v66 = 138412290;
              v67 = v36;
              _os_log_impl(&dword_1A427D000, v44, OS_LOG_TYPE_DEBUG, "Already had Shortcut (by address): %@", v66, 0xCu);
            }

          }
          else
          {
            objc_msgSend(v58, "addObject:", v36);
            if (v37)
              objc_msgSend(v32, "addObject:", v37);
            if (v38)
              objc_msgSend(v32, "addObject:", v38);
          }
        }

        continue;
      }
    }
    v33 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v61, buf, 16);
  }
  while (v33);
LABEL_73:

  v45 = (void *)objc_msgSend(v58, "copy");
  if (objc_msgSend(v45, "count"))
  {
    objc_msgSend(v45, "arrayByAddingObjectsFromArray:", v56);
    v46 = objc_claimAutoreleasedReturnValue();

    v56 = (id)v46;
  }

LABEL_78:
  GEOFindOrCreateLog();
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v69 = v56;
    _os_log_impl(&dword_1A427D000, v47, OS_LOG_TYPE_DEBUG, "Proposing Shortcuts: %@", buf, 0xCu);
  }

  (*(void (**)(void))(v52[7] + 16))();
  v7 = 0;
  objc_autoreleasePoolPop(context);
LABEL_81:

}

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "description");
}

- (void)meCardReader:(id)a3 didUpdateMeCard:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  GEOFindOrCreateLog();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "uniqueName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v9;
    _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "Received MeCard update from %@", buf, 0xCu);

  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__MapsSuggestionsShortcutManager_meCardReader_didUpdateMeCard___block_invoke;
  v11[3] = &unk_1E4BCEF10;
  v10 = v7;
  v12 = v10;
  MSg::Queue::async<MapsSuggestionsShortcutManager>((NSObject **)&self->_queue, self, v11);

}

void __63__MapsSuggestionsShortcutManager_meCardReader_didUpdateMeCard___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  _QWORD *v5;

  v5 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v4 = (void *)v5[10];
  v5[10] = v3;

  -[MapsSuggestionsShortcutManager _loadCorrectedMeCardWithHandler:]((uint64_t)v5, &__block_literal_global_166);
}

void __63__MapsSuggestionsShortcutManager_meCardReader_didUpdateMeCard___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  GEOFindOrCreateLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = 138412546;
    v8 = v4;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_DEBUG, "Contacts resulted in auto-reload: %@ / error: %@", (uint8_t *)&v7, 0x16u);
  }

}

- (void)mapsSync:(id)a3 didChangeForContentType:(int64_t)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  GEOFindOrCreateLog();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v5, "uniqueName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v10 = v7;
    _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_DEBUG, "Received MapsSync update from %@", buf, 0xCu);

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__MapsSuggestionsShortcutManager_mapsSync_didChangeForContentType___block_invoke;
  v8[3] = &unk_1E4BCEF10;
  v8[4] = self;
  MSg::Queue::async<MapsSuggestionsShortcutManager>((NSObject **)&self->_queue, self, v8);

}

void __67__MapsSuggestionsShortcutManager_mapsSync_didChangeForContentType___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  void *v4;
  _QWORD *v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v4 = (void *)v3[7];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__MapsSuggestionsShortcutManager_mapsSync_didChangeForContentType___block_invoke_2;
  v6[3] = &unk_1E4BCF158;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "shortcutsFromFavoritesWithHandler:", v6);

}

void __67__MapsSuggestionsShortcutManager_mapsSync_didChangeForContentType___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  MapsSuggestionsMeCard *v6;
  MapsSuggestionsMeCard *v7;
  NSObject *v8;
  _QWORD *v9;
  void *v10;
  MapsSuggestionsMeCard *v11;
  _QWORD v12[4];
  _QWORD *v13;
  MapsSuggestionsMeCard *v14;
  uint8_t buf[4];
  MapsSuggestionsMeCard *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6 || !objc_msgSend(v5, "count"))
  {
    GEOFindOrCreateLog();
    v7 = (MapsSuggestionsMeCard *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v6;
      _os_log_impl(&dword_1A427D000, &v7->super, OS_LOG_TYPE_DEBUG, "MapsSync returned no shortcuts or an error: %@", buf, 0xCu);
    }
  }
  else
  {
    v7 = -[MapsSuggestionsMeCard initWithShortcuts:hasCorrected:hasGeocoded:]([MapsSuggestionsMeCard alloc], "initWithShortcuts:hasCorrected:hasGeocoded:", v5, 0, 0);
    if (!-[MapsSuggestionsMeCard isEqualToMeCard:](v7, "isEqualToMeCard:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96)))
    {
      GEOFindOrCreateLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v7;
        _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "New MapsSync derived MeCard detected: %@", buf, 0xCu);
      }

      v9 = *(_QWORD **)(a1 + 40);
      v10 = (void *)v9[11];
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __67__MapsSuggestionsShortcutManager_mapsSync_didChangeForContentType___block_invoke_167;
      v12[3] = &unk_1E4BCE250;
      v13 = v9;
      v11 = v7;
      v14 = v11;
      objc_msgSend(v10, "callBlock:", v12);

      v7 = v11;
    }
  }

}

void __67__MapsSuggestionsShortcutManager_mapsSync_didChangeForContentType___block_invoke_167(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  GEOFindOrCreateLog();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v3, "uniqueName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "Calling observer '%@'", (uint8_t *)&v6, 0xCu);

  }
  objc_msgSend(v3, "meCardReader:didUpdateMeCard:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (char)readMeCardWithHandler:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  _QWORD v9[5];
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
    v9[2] = __56__MapsSuggestionsShortcutManager_readMeCardWithHandler___block_invoke;
    v9[3] = &unk_1E4BCF0C0;
    v9[4] = self;
    v10 = v4;
    MSg::Queue::async<MapsSuggestionsShortcutManager>((NSObject **)&self->_queue, self, v9);

    v6 = 1;
  }
  else
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      v13 = 1024;
      v14 = 1045;
      v15 = 2082;
      v16 = "-[MapsSuggestionsShortcutManager readMeCardWithHandler:]";
      v17 = 2082;
      v18 = "nil == (handler)";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a callback handler", buf, 0x26u);
    }

    v6 = 0;
  }

  return v6;
}

void __56__MapsSuggestionsShortcutManager_readMeCardWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  if (-[MapsSuggestionsShortcutManager usingMyPlaces](*(_QWORD *)(a1 + 32)))
  {
    v4 = (void *)*((_QWORD *)v3 + 7);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __56__MapsSuggestionsShortcutManager_readMeCardWithHandler___block_invoke_2;
    v7[3] = &unk_1E4BCF048;
    objc_copyWeak(&v9, &location);
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v4, "shortcutsFromFavoritesWithHandler:", v7);

    objc_destroyWeak(&v9);
  }
  else if (!-[MapsSuggestionsShortcutManager _loadCorrectedMeCardWithHandler:]((uint64_t)v3, *(void **)(a1 + 40)))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __56__MapsSuggestionsShortcutManager_readMeCardWithHandler___block_invoke_3;
    v5[3] = &unk_1E4BCE348;
    v6 = *(id *)(a1 + 40);
    dispatch_async(*((dispatch_queue_t *)v3 + 1), v5);

  }
  objc_destroyWeak(&location);

}

void __56__MapsSuggestionsShortcutManager_readMeCardWithHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  MapsSuggestionsMeCard *v9;
  id v10;
  NSObject *v11;
  _QWORD v12[4];
  MapsSuggestionsMeCard *v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  NSObject *v18;
  uint8_t buf[4];
  char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v6 || !objc_msgSend(v5, "count"))
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __56__MapsSuggestionsShortcutManager_readMeCardWithHandler___block_invoke_168;
      block[3] = &unk_1E4BCF070;
      v18 = *(id *)(a1 + 32);
      v17 = v6;
      dispatch_async(*((dispatch_queue_t *)WeakRetained + 1), block);

      v8 = v18;
    }
    else
    {
      v9 = -[MapsSuggestionsMeCard initWithShortcuts:hasCorrected:hasGeocoded:]([MapsSuggestionsMeCard alloc], "initWithShortcuts:hasCorrected:hasGeocoded:", v5, 1, 1);
      objc_storeStrong((id *)WeakRetained + 12, v9);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __56__MapsSuggestionsShortcutManager_readMeCardWithHandler___block_invoke_2_169;
      v12[3] = &unk_1E4BCF020;
      v10 = *(id *)(a1 + 32);
      v14 = 0;
      v15 = v10;
      v13 = v9;
      v11 = *((_QWORD *)WeakRetained + 1);
      v8 = v9;
      dispatch_async(v11, v12);

    }
  }
  else
  {
    GEOFindOrCreateLog();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v20 = "MapsSuggestionsShortcutManager.mm";
      v21 = 1026;
      v22 = 1051;
      v23 = 2082;
      v24 = "-[MapsSuggestionsShortcutManager readMeCardWithHandler:]_block_invoke_2";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", buf, 0x1Cu);
    }

  }
}

uint64_t __56__MapsSuggestionsShortcutManager_readMeCardWithHandler___block_invoke_168(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __56__MapsSuggestionsShortcutManager_readMeCardWithHandler___block_invoke_2_169(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __56__MapsSuggestionsShortcutManager_readMeCardWithHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)registerMeCardObserver:(id)a3
{
  -[MapsSuggestionsObservers registerObserver:handler:](self->_meCardObservers, "registerObserver:handler:", a3, 0);
}

- (void)unregisterMeCardObserver:(id)a3
{
  -[MapsSuggestionsObservers unregisterObserver:handler:](self->_meCardObservers, "unregisterObserver:handler:", a3, 0);
}

- (id)storage
{
  return self->_storage;
}

- (id)suggestor
{
  return self->_suggestor;
}

- (id)routine
{
  return self->_routine;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawSchoolAddressStrings, 0);
  objc_storeStrong((id *)&self->_rawWorkAddressStrings, 0);
  objc_storeStrong((id *)&self->_rawHomeAddressStrings, 0);
  objc_storeStrong((id *)&self->_currCorrectedMeCard, 0);
  objc_storeStrong((id *)&self->_meCardObservers, 0);
  objc_storeStrong((id *)&self->_rawMeCard, 0);
  objc_storeStrong((id *)&self->_hiddenShortcuts, 0);
  objc_storeStrong((id *)&self->_mapsSync, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_routine, 0);
  objc_storeStrong((id *)&self->_suggestor, 0);
  objc_storeStrong((id *)&self->_storage, 0);

}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
