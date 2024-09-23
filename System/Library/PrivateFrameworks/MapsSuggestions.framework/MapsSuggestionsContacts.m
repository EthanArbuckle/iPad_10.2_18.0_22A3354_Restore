@implementation MapsSuggestionsContacts

- (MapsSuggestionsContacts)initWithConnector:(id)a3 networkRequester:(id)a4
{
  id v7;
  id v8;
  void *v9;
  MapsSuggestionsContacts *v10;
  void *v11;
  OS_dispatch_queue *v12;
  OS_dispatch_queue *innerQueue;
  NSString *v14;
  NSString *name;
  MapsSuggestionsLimitedDictionary *v16;
  MapsSuggestionsLimitedDictionary *cache;
  MapsSuggestionsObservers *v18;
  OS_dispatch_queue *v19;
  uint64_t v20;
  MapsSuggestionsObservers *meCardObservers;
  MapsSuggestionsMeCard *currMeCard;
  MapsSuggestionsLocaleChangedTrigger *v23;
  MapsSuggestionsLocaleChangedTrigger *localeChangedTrigger;
  MapsSuggestionsDarwinNotificationTrigger *v25;
  uint64_t v26;
  MapsSuggestionsDarwinNotificationTrigger *geoActiveTileGroupChangedTrigger;
  MapsSuggestionsContacts *v28;
  NSObject *v29;
  objc_super v31;
  _BYTE buf[18];
  __int16 v33;
  const char *v34;
  __int16 v35;
  const char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    GEOFindOrCreateLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsContacts.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 101;
      v33 = 2082;
      v34 = "-[MapsSuggestionsContacts initWithConnector:networkRequester:]";
      v35 = 2082;
      v36 = "nil == (connector)";
      _os_log_impl(&dword_1A427D000, v29, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires Contacts connector", buf, 0x26u);
    }
    goto LABEL_11;
  }
  if (!v8)
  {
    GEOFindOrCreateLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsContacts.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 102;
      v33 = 2082;
      v34 = "-[MapsSuggestionsContacts initWithConnector:networkRequester:]";
      v35 = 2082;
      v36 = "nil == (networkRequester)";
      _os_log_impl(&dword_1A427D000, v29, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires network requester", buf, 0x26u);
    }
LABEL_11:

    v28 = 0;
    goto LABEL_12;
  }
  v31.receiver = self;
  v31.super_class = (Class)MapsSuggestionsContacts;
  v10 = -[MapsSuggestionsContacts init](&v31, sel_init);
  if (v10)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    MSg::Queue::Queue((dispatch_queue_t *)buf, CFSTR("MapsSuggestionsContacts"), v11);
    v12 = *(OS_dispatch_queue **)buf;
    *(_QWORD *)buf = 0;
    innerQueue = v10->_queue._innerQueue;
    v10->_queue._innerQueue = v12;

    v14 = *(NSString **)&buf[8];
    *(_QWORD *)&buf[8] = 0;
    name = v10->_queue._name;
    v10->_queue._name = v14;

    objc_storeStrong((id *)&v10->_connector, a3);
    -[MapsSuggestionsContactsConnector setDelegate:](v10->_connector, "setDelegate:", v10);
    objc_storeStrong((id *)&v10->_networkRequester, a4);
    v16 = -[MapsSuggestionsLimitedDictionary initWithMaximumCapacity:]([MapsSuggestionsLimitedDictionary alloc], "initWithMaximumCapacity:", GEOConfigGetInteger());
    cache = v10->_cache;
    v10->_cache = v16;

    v18 = [MapsSuggestionsObservers alloc];
    v19 = v10->_queue._innerQueue;
    v20 = -[MapsSuggestionsObservers initWithCallbackQueue:name:strong:](v18, "initWithCallbackQueue:name:strong:", v19, CFSTR("MapsSuggestionsMeCardReaderObservers"), 0);
    meCardObservers = v10->_meCardObservers;
    v10->_meCardObservers = (MapsSuggestionsObservers *)v20;

    currMeCard = v10->_currMeCard;
    v10->_currMeCard = 0;

    v23 = objc_alloc_init(MapsSuggestionsLocaleChangedTrigger);
    localeChangedTrigger = v10->_localeChangedTrigger;
    v10->_localeChangedTrigger = v23;

    -[MapsSuggestionsBaseTrigger registerObserver:](v10->_localeChangedTrigger, "registerObserver:", v10->_cache);
    v25 = [MapsSuggestionsDarwinNotificationTrigger alloc];
    v26 = -[MapsSuggestionsDarwinNotificationTrigger initWithNotificationName:](v25, "initWithNotificationName:", *MEMORY[0x1E0D26408]);
    geoActiveTileGroupChangedTrigger = v10->_geoActiveTileGroupChangedTrigger;
    v10->_geoActiveTileGroupChangedTrigger = (MapsSuggestionsDarwinNotificationTrigger *)v26;

    -[MapsSuggestionsBaseTrigger registerObserver:](v10->_geoActiveTileGroupChangedTrigger, "registerObserver:", v10->_cache);
  }
  self = v10;
  v28 = self;
LABEL_12:

  return v28;
}

- (id)initFromResourceDepot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MapsSuggestionsContacts *v9;
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
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsContacts.mm";
      v14 = 1024;
      v15 = 126;
      v16 = 2082;
      v17 = "-[MapsSuggestionsContacts initFromResourceDepot:]";
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
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsContacts.mm";
      v14 = 1024;
      v15 = 127;
      v16 = 2082;
      v17 = "-[MapsSuggestionsContacts initFromResourceDepot:]";
      v18 = 2082;
      v19 = "nil == (resourceDepot.oneNetworkRequester)";
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires One Network!", (uint8_t *)&v12, 0x26u);
    }
LABEL_9:

    v9 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v5, "oneContactsConnector");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "oneNetworkRequester");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[MapsSuggestionsContacts initWithConnector:networkRequester:](self, "initWithConnector:networkRequester:", v7, v8);

  v9 = self;
LABEL_10:

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  if (self)
    -[MapsSuggestionsContactsConnector stopListeningForChanges](self->_connector, "stopListeningForChanges");
  v3.receiver = self;
  v3.super_class = (Class)MapsSuggestionsContacts;
  -[MapsSuggestionsContacts dealloc](&v3, sel_dealloc);
}

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "description");
}

void __60__MapsSuggestionsContacts__fetchMeCardShortcutsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  const char *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (v4)
    {
      objc_msgSend(v3, "label");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C96FF8]) & 1) != 0)
      {

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "singleLineStringFromPostalAddress:addCountryName:", v4, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[MapsSuggestionsShortcut initBackedPlaceholderWithType:identifier:originatingAddress:customName:]([MapsSuggestionsShortcut alloc], "initBackedPlaceholderWithType:identifier:originatingAddress:customName:", 2, CFSTR("{TEMP}"), v7, 0);
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
      }
      else if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C97070]) & 1) != 0)
      {

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "singleLineStringFromPostalAddress:addCountryName:", v4, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[MapsSuggestionsShortcut initBackedPlaceholderWithType:identifier:originatingAddress:customName:]([MapsSuggestionsShortcut alloc], "initBackedPlaceholderWithType:identifier:originatingAddress:customName:", 3, CFSTR("{TEMP}"), v7, 0);
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v8);
      }
      else
      {
        v10 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C97060]);

        if ((v10 & 1) == 0)
        {
          GEOFindOrCreateLog();
          v18 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v3, "label");
            v23 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v31 = v23;
            _os_log_impl(&dword_1A427D000, v18, OS_LOG_TYPE_DEBUG, "Skipping CNLabel '%@'", buf, 0xCu);

          }
          v8 = v18;
          goto LABEL_18;
        }
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "singleLineStringFromPostalAddress:addCountryName:", v4, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[MapsSuggestionsShortcut initBackedPlaceholderWithType:identifier:originatingAddress:customName:]([MapsSuggestionsShortcut alloc], "initBackedPlaceholderWithType:identifier:originatingAddress:customName:", 5, CFSTR("{TEMP}"), v7, 0);
        objc_msgSend(*(id *)(a1 + 56), "addObject:", v8);
      }

      objc_msgSend(*(id *)(a1 + 64), "setObject:forKey:", v8, v5);
      v11 = v4;
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 100);
      objc_msgSend(v11, "street");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "appendString:", v13);

      objc_msgSend(v11, "subLocality");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "appendString:", v14);

      objc_msgSend(v11, "city");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "appendString:", v15);

      objc_msgSend(v11, "state");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "appendString:", v16);

      objc_msgSend(v11, "ISOCountryCode");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "appendString:", v17);

      objc_msgSend(v12, "appendString:", CFSTR("MeCard"));
      v18 = objc_msgSend(v12, "copy");

      objc_msgSend(*(id *)(a1 + 72), "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        -[NSObject setGeoMapItem:](v8, "setGeoMapItem:", v19);
        MapsSuggestionsShortcutUniqueIdentifier(v8);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setIdentifier:](v8, "setIdentifier:", v20);

        MapsSuggestionsShortcutIdentifierForStorage(v8);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setStorageIdentifier:](v8, "setStorageIdentifier:", v21);

      }
      else
      {
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 80));
        v22 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __60__MapsSuggestionsContacts__fetchMeCardShortcutsWithHandler___block_invoke_30;
        v24[3] = &unk_1E4BCE160;
        v25 = *(id *)(a1 + 80);
        v26 = v11;
        v27 = v8;
        v28 = *(id *)(a1 + 72);
        v29 = v18;
        objc_msgSend(v22, "canonicalLocalSearchPostalAddress:completion:", v26, v24);

      }
LABEL_18:

      goto LABEL_19;
    }
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v31 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsContacts.mm";
      v32 = 1024;
      v33 = 216;
      v34 = 2082;
      v35 = "-[MapsSuggestionsContacts _fetchMeCardShortcutsWithHandler:]_block_invoke";
      v36 = 2082;
      v37 = "nil == (postalAddressValue)";
      v9 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a CNLabeledValue<CNPostalAddress>.value";
      goto LABEL_9;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v31 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsContacts.mm";
      v32 = 1024;
      v33 = 215;
      v34 = 2082;
      v35 = "-[MapsSuggestionsContacts _fetchMeCardShortcutsWithHandler:]_block_invoke";
      v36 = 2082;
      v37 = "nil == (postalAddressIdentifier)";
      v9 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a CNLabeledValue<CNPostalAddress>.identifier";
LABEL_9:
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, v9, buf, 0x26u);
    }
  }
LABEL_19:

}

void __60__MapsSuggestionsContacts__fetchMeCardShortcutsWithHandler___block_invoke_30(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(id *)(a1 + 32);
  if (v6 || !objc_msgSend(v5, "count"))
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v15 = 138412546;
      v16 = v9;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "Didn't find postalAddress %@: %@", (uint8_t *)&v15, 0x16u);
    }

  }
  else
  {
    objc_msgSend(v5, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    MapsSuggestionsMapItemConvertIfNeeded(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setGeoMapItem:", v11);

    MapsSuggestionsShortcutUniqueIdentifier(*(void **)(a1 + 48));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setIdentifier:", v12);

    objc_msgSend(*(id *)(a1 + 48), "geoMapItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v13, *(_QWORD *)(a1 + 64));

    MapsSuggestionsShortcutIdentifierForStorage(*(void **)(a1 + 48));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setStorageIdentifier:", v14);

  }
  dispatch_group_leave(v7);

}

void __60__MapsSuggestionsContacts__fetchMeCardShortcutsWithHandler___block_invoke_33(id *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void (**v27)(id, void *, void *, _QWORD);
  void *v28;
  void *v29;
  id *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a1[5], "count") + objc_msgSend(a1[4], "count") + objc_msgSend(a1[6], "count"));
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v30 = a1;
  v3 = a1[4];
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v40 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v7, "geoMapItem");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          objc_msgSend(v7, "identifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("{TEMP}"));

          if ((v10 & 1) == 0)
            objc_msgSend(v2, "addObject:", v7);
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    }
    while (v4);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v11 = v30[5];
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v36 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
        objc_msgSend(v15, "geoMapItem");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          objc_msgSend(v15, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("{TEMP}"));

          if ((v18 & 1) == 0)
            objc_msgSend(v2, "addObject:", v15);
        }
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    }
    while (v12);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v19 = v30[6];
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v32;
    do
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v32 != v21)
          objc_enumerationMutation(v19);
        v23 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * k);
        objc_msgSend(v23, "geoMapItem");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          objc_msgSend(v23, "identifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("{TEMP}"));

          if ((v26 & 1) == 0)
            objc_msgSend(v2, "addObject:", v23);
        }
      }
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
    }
    while (v20);
  }

  v27 = (void (**)(id, void *, void *, _QWORD))v30[8];
  v28 = (void *)objc_msgSend(v2, "copy");
  v29 = (void *)objc_msgSend(v30[7], "copy");
  v27[2](v27, v28, v29, 0);

}

- (void)registerMeCardObserver:(id)a3
{
  id v4;
  MapsSuggestionsObservers *meCardObservers;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  meCardObservers = self->_meCardObservers;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__MapsSuggestionsContacts_registerMeCardObserver___block_invoke;
  v10[3] = &unk_1E4BCE1D8;
  objc_copyWeak(&v11, &location);
  -[MapsSuggestionsObservers registerObserver:handler:](meCardObservers, "registerObserver:handler:", v4, v10);
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __50__MapsSuggestionsContacts_registerMeCardObserver___block_invoke_36;
  v8[3] = &unk_1E4BCE200;
  v7 = v4;
  v9 = v7;
  MSg::Queue::async<MapsSuggestionsContacts>((NSObject **)&self->_queue, self, v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __50__MapsSuggestionsContacts_registerMeCardObserver___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
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
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v3 = (id *)WeakRetained;
    if (WeakRetained)
    {
      dispatch_assert_queue_V2(*((dispatch_queue_t *)WeakRetained + 1));
      objc_msgSend(v3[3], "startListeningForChanges");
    }
    else
    {
      GEOFindOrCreateLog();
      v4 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = 136446722;
        v6 = "MapsSuggestionsContacts.mm";
        v7 = 1026;
        v8 = 308;
        v9 = 2082;
        v10 = "-[MapsSuggestionsContacts registerMeCardObserver:]_block_invoke";
        _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
      }

    }
  }
}

void __50__MapsSuggestionsContacts_registerMeCardObserver___block_invoke_36(uint64_t a1, void *a2)
{
  _QWORD *v3;

  v3 = a2;
  if (v3[7])
    objc_msgSend(*(id *)(a1 + 32), "meCardReader:didUpdateMeCard:", v3);

}

- (void)unregisterMeCardObserver:(id)a3
{
  id v4;
  MapsSuggestionsObservers *meCardObservers;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  meCardObservers = self->_meCardObservers;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__MapsSuggestionsContacts_unregisterMeCardObserver___block_invoke;
  v6[3] = &unk_1E4BCE1D8;
  objc_copyWeak(&v7, &location);
  -[MapsSuggestionsObservers unregisterObserver:handler:](meCardObservers, "unregisterObserver:handler:", v4, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __52__MapsSuggestionsContacts_unregisterMeCardObserver___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
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
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v3 = (id *)WeakRetained;
    if (WeakRetained)
    {
      dispatch_assert_queue_V2(*((dispatch_queue_t *)WeakRetained + 1));
      objc_msgSend(v3[3], "stopListeningForChanges");
    }
    else
    {
      GEOFindOrCreateLog();
      v4 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = 136446722;
        v6 = "MapsSuggestionsContacts.mm";
        v7 = 1026;
        v8 = 329;
        v9 = 2082;
        v10 = "-[MapsSuggestionsContacts unregisterMeCardObserver:]_block_invoke";
        _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
      }

    }
  }
}

- (char)readMeCardWithHandler:(id)a3
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
    v9[2] = __49__MapsSuggestionsContacts_readMeCardWithHandler___block_invoke;
    v9[3] = &unk_1E4BCE228;
    v10 = v4;
    MSg::Queue::async<MapsSuggestionsContacts>((NSObject **)&self->_queue, self, v9);

    v6 = 1;
  }
  else
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsContacts.mm";
      v13 = 1024;
      v14 = 338;
      v15 = 2082;
      v16 = "-[MapsSuggestionsContacts readMeCardWithHandler:]";
      v17 = 2082;
      v18 = "nil == (handler)";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
    }

    v6 = 0;
  }

  return v6;
}

void __49__MapsSuggestionsContacts_readMeCardWithHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  -[MapsSuggestionsContacts _q_reloadWithHandler:](a2, *(void **)(a1 + 32));
}

- (void)_q_reloadWithHandler:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  dispatch_group_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  _QWORD v37[2];
  void (*v38)(uint64_t, void *, void *, void *);
  void *v39;
  id v40;
  id v41;
  id location;
  _QWORD block[4];
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  _BYTE buf[40];
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  dispatch_group_t v56;
  _QWORD v57[4];

  v57[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (v3)
    {
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
      objc_initWeak(&location, (id)a1);
      v5 = MEMORY[0x1E0C809B0];
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v38 = __48__MapsSuggestionsContacts__q_reloadWithHandler___block_invoke;
      v39 = &unk_1E4BCE278;
      objc_copyWeak(&v41, &location);
      v40 = v4;
      v6 = v37;
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
      if ((unint64_t)(objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0) - 3) >= 2)
      {
        GEOFindOrCreateLog();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = "-[MapsSuggestionsContacts _fetchMeCardShortcutsWithHandler:]";
          _os_log_impl(&dword_1A427D000, v28, OS_LOG_TYPE_DEBUG, "%s :Not Allowed to use Contacts", buf, 0xCu);
        }

        v29 = objc_alloc_init(MEMORY[0x1E0C99D80]);
        v38((uint64_t)v6, (void *)MEMORY[0x1E0C9AA60], v29, 0);
      }
      else
      {
        v7 = *(void **)(a1 + 24);
        v57[0] = *MEMORY[0x1E0C967F0];
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = 0;
        objc_msgSend(v7, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v8, &v49);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v49;

        if (!v9 || v35)
        {
          v38((uint64_t)v6, 0, 0, v35);
        }
        else
        {
          v34 = v9;
          objc_msgSend(v9, "postalAddresses");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v36, "count"));
          v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v36, "count"));
          v33 = v6;
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v36, "count"));
          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v36, "count"));
          v14 = *(id *)(a1 + 40);
          v15 = dispatch_group_create();
          *(_QWORD *)buf = v5;
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __60__MapsSuggestionsContacts__fetchMeCardShortcutsWithHandler___block_invoke;
          *(_QWORD *)&buf[24] = &unk_1E4BCE188;
          *(_QWORD *)&buf[32] = a1;
          v30 = v10;
          v16 = v10;
          v51 = v16;
          v17 = v11;
          v52 = v17;
          v18 = v12;
          v53 = v18;
          v19 = v13;
          v54 = v19;
          v55 = v14;
          v56 = v15;
          v20 = v15;
          v32 = v14;
          objc_msgSend(v36, "enumerateObjectsUsingBlock:", buf, v30);
          v21 = *(NSObject **)(a1 + 8);
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __60__MapsSuggestionsContacts__fetchMeCardShortcutsWithHandler___block_invoke_33;
          block[3] = &unk_1E4BCE1B0;
          v44 = v16;
          v45 = v17;
          v46 = v18;
          v22 = v33;
          v47 = v19;
          v48 = v22;
          v23 = v19;
          v24 = v18;
          v6 = v33;
          v25 = v24;
          v26 = v17;
          v31 = v16;
          dispatch_group_notify(v20, v21, block);

          v9 = v34;
        }

        v29 = v35;
      }

      objc_destroyWeak(&v41);
      objc_destroyWeak(&location);
    }
    else
    {
      GEOFindOrCreateLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsContacts.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 349;
        *(_WORD *)&buf[18] = 2082;
        *(_QWORD *)&buf[20] = "-[MapsSuggestionsContacts _q_reloadWithHandler:]";
        *(_WORD *)&buf[28] = 2082;
        *(_QWORD *)&buf[30] = "nil == (handler)";
        _os_log_impl(&dword_1A427D000, v27, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
      }

    }
  }

}

void __48__MapsSuggestionsContacts__q_reloadWithHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  char *v9;
  id *WeakRetained;
  NSObject *v11;
  char *v12;
  uint64_t v13;
  void *v14;
  char v15;
  NSObject *v16;
  MapsSuggestionsMeCard *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  _QWORD v23[5];
  NSObject *v24;
  uint8_t buf[4];
  char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    GEOFindOrCreateLog();
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v26 = "MapsSuggestionsContacts.mm";
      v27 = 1026;
      v28 = 355;
      v29 = 2082;
      v30 = "-[MapsSuggestionsContacts _q_reloadWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v19, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
    v16 = v19;
    goto LABEL_20;
  }
  if (!v7 || v9)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v9;
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "Error loading Shortcuts from MeCard: %@", buf, 0xCu);
    }

    v12 = v9;
    v13 = objc_msgSend(v12, "code");
    if (v13 == 100 || v13 == 103 || v13 == 200)
    {
      objc_msgSend(v12, "domain");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0C968C8]);

      if ((v15 & 1) != 0)
      {

        v7 = (id)MEMORY[0x1E0C9AA60];
        goto LABEL_11;
      }
    }
    else
    {

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    goto LABEL_21;
  }
LABEL_11:
  v16 = WeakRetained[7];
  v17 = -[MapsSuggestionsMeCard initWithShortcuts:perCNPostalAddress:hasCorrected:hasGeocoded:]([MapsSuggestionsMeCard alloc], "initWithShortcuts:perCNPostalAddress:hasCorrected:hasGeocoded:", v7, v8, 0, 1);
  v18 = WeakRetained[7];
  WeakRetained[7] = v17;

  v19 = objc_msgSend(WeakRetained[7], "copy");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (-[NSObject hasHomeOrWorkOrSchool](v19, "hasHomeOrWorkOrSchool"))
    MapsSuggestionsSawHomeOrWorkOnThisDevice();
  if ((-[NSObject isEqualToMeCard:](v19, "isEqualToMeCard:", v16) & 1) == 0)
  {
    GEOFindOrCreateLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v26 = (char *)v19;
      _os_log_impl(&dword_1A427D000, v20, OS_LOG_TYPE_DEBUG, "New MeCard detected: %@", buf, 0xCu);
    }

    v21 = WeakRetained[6];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __48__MapsSuggestionsContacts__q_reloadWithHandler___block_invoke_40;
    v23[3] = &unk_1E4BCE250;
    v23[4] = WeakRetained;
    v22 = v19;
    v24 = v22;
    objc_msgSend(v21, "callBlock:", v23);

    v19 = v22;
  }
LABEL_20:

LABEL_21:
}

void __48__MapsSuggestionsContacts__q_reloadWithHandler___block_invoke_40(uint64_t a1, void *a2)
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

- (void)contactsDidUpdate
{
  MSg::Queue::async<MapsSuggestionsContacts>((NSObject **)&self->_queue, self, &__block_literal_global_1);
}

void __44__MapsSuggestionsContacts_contactsDidUpdate__block_invoke(uint64_t a1, uint64_t a2)
{
  -[MapsSuggestionsContacts _q_reloadWithHandler:](a2, &__block_literal_global_44);
}

void __66__MapsSuggestionsContacts__q_readMeCardAddressStringsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  char v7;
  NSObject *v8;
  char *v9;
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
  v3 = a2;
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "label");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C96FF8]) & 1) != 0)
    {

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "singleLineStringFromPostalAddress:addCountryName:", v4, 1);
      v6 = objc_claimAutoreleasedReturnValue();
      if (v6)
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
    }
    else if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C97070]) & 1) != 0)
    {

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "singleLineStringFromPostalAddress:addCountryName:", v4, 1);
      v6 = objc_claimAutoreleasedReturnValue();
      if (v6)
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);
    }
    else
    {
      v7 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C97060]);

      if ((v7 & 1) != 0)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "singleLineStringFromPostalAddress:addCountryName:", v4, 1);
        v6 = objc_claimAutoreleasedReturnValue();
        if (v6)
          objc_msgSend(*(id *)(a1 + 56), "addObject:", v6);
      }
      else
      {
        GEOFindOrCreateLog();
        v8 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v3, "label");
          v9 = (char *)objc_claimAutoreleasedReturnValue();
          v10 = 138412290;
          v11 = v9;
          _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "Skipping CNLabel '%@'", (uint8_t *)&v10, 0xCu);

        }
        v6 = 0;
      }
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v10 = 136446978;
      v11 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsContacts.mm";
      v12 = 1024;
      v13 = 417;
      v14 = 2082;
      v15 = "-[MapsSuggestionsContacts _q_readMeCardAddressStringsWithHandler:]_block_invoke";
      v16 = 2082;
      v17 = "nil == (postalAddressValue)";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a CNLabeledValue<CNPostalAddress>.value", (uint8_t *)&v10, 0x26u);
    }
  }

}

- (char)readMeCardAddressStringsWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  char v6;
  _QWORD v8[4];
  id v9;
  _QWORD block[4];
  id v11;
  uint8_t buf[4];
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
  if (v4)
  {
    if ((unint64_t)(objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0) - 3) >= 2)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __63__MapsSuggestionsContacts_readMeCardAddressStringsWithHandler___block_invoke;
      block[3] = &unk_1E4BCE348;
      v11 = v4;
      dispatch_async((dispatch_queue_t)self->_queue._innerQueue, block);

    }
    else
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __63__MapsSuggestionsContacts_readMeCardAddressStringsWithHandler___block_invoke_45;
      v8[3] = &unk_1E4BCE228;
      v9 = v4;
      MSg::Queue::async<MapsSuggestionsContacts>((NSObject **)&self->_queue, self, v8);

    }
    v6 = 1;
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsContacts.mm";
      v14 = 1024;
      v15 = 461;
      v16 = 2082;
      v17 = "-[MapsSuggestionsContacts readMeCardAddressStringsWithHandler:]";
      v18 = 2082;
      v19 = "nil == (handler)";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
    }

    v6 = 0;
  }

  return v6;
}

uint64_t __63__MapsSuggestionsContacts_readMeCardAddressStringsWithHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v4 = 136315138;
    v5 = "-[MapsSuggestionsContacts readMeCardAddressStringsWithHandler:]_block_invoke";
    _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_DEBUG, "%s :Not Allowed to use Contacts", (uint8_t *)&v4, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__MapsSuggestionsContacts_readMeCardAddressStringsWithHandler___block_invoke_45(uint64_t a1, uint64_t a2)
{
  void (**v3)(id, id, id, id, id);
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, id, id, id, id))*(id *)(a1 + 32);
  if (a2)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a2 + 8));
    v4 = *(void **)(a2 + 24);
    v20[0] = *MEMORY[0x1E0C967F0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(v4, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v5, &v19);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v19;

    objc_msgSend(v6, "postalAddresses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __66__MapsSuggestionsContacts__q_readMeCardAddressStringsWithHandler___block_invoke;
    v15[3] = &unk_1E4BCE320;
    v15[4] = a2;
    v12 = v9;
    v16 = v12;
    v13 = v10;
    v17 = v13;
    v14 = v11;
    v18 = v14;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v15);
    v3[2](v3, v12, v13, v14, v7);

  }
}

- (id)contactNameForIdentifier:(id)a3
{
  char *v4;
  NSObject *v5;
  char *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint32_t v11;
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
  v4 = (char *)a3;
  if (!v4)
  {
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v13 = 136446978;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsContacts.mm";
      v15 = 1024;
      v16 = 478;
      v17 = 2082;
      v18 = "-[MapsSuggestionsContacts contactNameForIdentifier:]";
      v19 = 2082;
      v20 = "nil == (identifier)";
      v8 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an identifier";
      v9 = v5;
      v10 = OS_LOG_TYPE_ERROR;
      v11 = 38;
LABEL_10:
      _os_log_impl(&dword_1A427D000, v9, v10, v8, (uint8_t *)&v13, v11);
    }
LABEL_11:
    v6 = 0;
    goto LABEL_16;
  }
  if ((unint64_t)(objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0) - 3) >= 2)
  {
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v13 = 136315138;
      v14 = "-[MapsSuggestionsContacts contactNameForIdentifier:]";
      v8 = "%s :Not Allowed to use Contacts";
      v9 = v5;
      v10 = OS_LOG_TYPE_DEBUG;
      v11 = 12;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  -[MapsSuggestionsContactsConnector contactForIdentifier:](self->_connector, "contactForIdentifier:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v5, 0);
    v6 = (char *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v13 = 138412290;
      v14 = v6;
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "Formatted contact name : %@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v13 = 138412290;
      v14 = v4;
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "No contacts found for identifier %@", (uint8_t *)&v13, 0xCu);
    }
    v6 = 0;
  }

LABEL_16:
  return v6;
}

- (id)friendlyNameForIndentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char *v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint32_t v18;
  int v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v20 = 136446978;
      v21 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsContacts.mm";
      v22 = 1024;
      v23 = 496;
      v24 = 2082;
      v25 = "-[MapsSuggestionsContacts friendlyNameForIndentifier:]";
      v26 = 2082;
      v27 = "nil == (identifier)";
      v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an identifier";
      v16 = v5;
      v17 = OS_LOG_TYPE_ERROR;
      v18 = 38;
LABEL_11:
      _os_log_impl(&dword_1A427D000, v16, v17, v15, (uint8_t *)&v20, v18);
    }
LABEL_12:
    v13 = 0;
    goto LABEL_17;
  }
  if ((unint64_t)(objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0) - 3) >= 2)
  {
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v20 = 136315138;
      v21 = "-[MapsSuggestionsContacts friendlyNameForIndentifier:]";
      v15 = "%s :Not Allowed to use Contacts";
      v16 = v5;
      v17 = OS_LOG_TYPE_DEBUG;
      v18 = 12;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  -[MapsSuggestionsContactsConnector contactForIdentifier:](self->_connector, "contactForIdentifier:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0CB3850]);
    -[NSObject namePrefix](v5, "namePrefix");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setNamePrefix:](v6, "setNamePrefix:", v7);

    -[NSObject givenName](v5, "givenName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setGivenName:](v6, "setGivenName:", v8);

    -[NSObject middleName](v5, "middleName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setMiddleName:](v6, "setMiddleName:", v9);

    -[NSObject familyName](v5, "familyName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setFamilyName:](v6, "setFamilyName:", v10);

    -[NSObject nameSuffix](v5, "nameSuffix");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setNameSuffix:](v6, "setNameSuffix:", v11);

    -[NSObject nickname](v5, "nickname");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setNickname:](v6, "setNickname:", v12);

    objc_msgSend(MEMORY[0x1E0CB3858], "localizedStringFromPersonNameComponents:style:options:", v6, 1, 0);
    v13 = (char *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v20 = 138412290;
      v21 = v13;
      _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_DEBUG, "Proposed friendly name: %@", (uint8_t *)&v20, 0xCu);
    }

  }
  else
  {
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_DEBUG, "Trying to fetch a friendly contact name returned nil", (uint8_t *)&v20, 2u);
    }
    v13 = 0;
  }

LABEL_17:
  return v13;
}

- (id)profilePictureForIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
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
  if (!v4)
  {
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v12 = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsContacts.mm";
      v14 = 1024;
      v15 = 524;
      v16 = 2082;
      v17 = "-[MapsSuggestionsContacts profilePictureForIdentifier:]";
      v18 = 2082;
      v19 = "nil == (identifier)";
      v7 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an identifier";
      v8 = v6;
      v9 = OS_LOG_TYPE_ERROR;
      v10 = 38;
LABEL_8:
      _os_log_impl(&dword_1A427D000, v8, v9, v7, (uint8_t *)&v12, v10);
    }
LABEL_9:

    v5 = 0;
    goto LABEL_10;
  }
  if ((unint64_t)(objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0) - 3) >= 2)
  {
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v12 = 136315138;
      v13 = "-[MapsSuggestionsContacts profilePictureForIdentifier:]";
      v7 = "%s :Not Allowed to use Contacts";
      v8 = v6;
      v9 = OS_LOG_TYPE_DEBUG;
      v10 = 12;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  -[MapsSuggestionsContactsConnector imageDataForIdentifier:](self->_connector, "imageDataForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v5;
}

- (id)dataForContactWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
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
  if (!v4)
  {
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v12 = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsContacts.mm";
      v14 = 1024;
      v15 = 532;
      v16 = 2082;
      v17 = "-[MapsSuggestionsContacts dataForContactWithIdentifier:]";
      v18 = 2082;
      v19 = "nil == (identifier)";
      v7 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an identifier";
      v8 = v6;
      v9 = OS_LOG_TYPE_ERROR;
      v10 = 38;
LABEL_8:
      _os_log_impl(&dword_1A427D000, v8, v9, v7, (uint8_t *)&v12, v10);
    }
LABEL_9:

    v5 = 0;
    goto LABEL_10;
  }
  if ((unint64_t)(objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0) - 3) >= 2)
  {
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v12 = 136315138;
      v13 = "-[MapsSuggestionsContacts dataForContactWithIdentifier:]";
      v7 = "%s :Not Allowed to use Contacts";
      v8 = v6;
      v9 = OS_LOG_TYPE_DEBUG;
      v10 = 12;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  -[MapsSuggestionsContactsConnector dataForContactWithIdentifier:](self->_connector, "dataForContactWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v5;
}

- (void)awaitQueue
{
  dispatch_barrier_sync((dispatch_queue_t)self->_queue._innerQueue, &__block_literal_global_50);
}

void __37__MapsSuggestionsContacts_awaitQueue__block_invoke()
{
  NSLog(CFSTR("_queue ran"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoActiveTileGroupChangedTrigger, 0);
  objc_storeStrong((id *)&self->_localeChangedTrigger, 0);
  objc_storeStrong((id *)&self->_currMeCard, 0);
  objc_storeStrong((id *)&self->_meCardObservers, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_networkRequester, 0);
  objc_storeStrong((id *)&self->_connector, 0);

}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
