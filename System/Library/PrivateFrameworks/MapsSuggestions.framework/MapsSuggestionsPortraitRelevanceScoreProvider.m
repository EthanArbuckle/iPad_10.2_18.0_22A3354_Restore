@implementation MapsSuggestionsPortraitRelevanceScoreProvider

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "description");
}

- (MapsSuggestionsPortraitRelevanceScoreProvider)initWithPortrait:(id)a3
{
  id v5;
  MapsSuggestionsPortraitRelevanceScoreProvider *v6;
  double v7;
  uint64_t v8;
  NSDate *fetchEntriesFromDate;
  NSArray *portraitData;
  void *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *innerQueue;
  NSString *v14;
  NSString *name;
  uint64_t v16;
  NSLocale *currentLocale;
  uint64_t v18;
  NSString *languageCode;
  void *v20;
  uint64_t v21;
  NSString *currentCountryCode;
  dispatch_queue_t v24;
  NSString *v25;
  objc_super v26;

  v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)MapsSuggestionsPortraitRelevanceScoreProvider;
  v6 = -[MapsSuggestionsPortraitRelevanceScoreProvider init](&v26, sel_init);
  if (v6)
  {
    GEOConfigGetDouble();
    MapsSuggestionsNowWithOffset(-v7);
    v8 = objc_claimAutoreleasedReturnValue();
    fetchEntriesFromDate = v6->_fetchEntriesFromDate;
    v6->_fetchEntriesFromDate = (NSDate *)v8;

    portraitData = v6->_portraitData;
    v6->_portraitData = (NSArray *)MEMORY[0x1E0C9AA60];

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    MSg::Queue::Queue(&v24, CFSTR("MapsSuggestionsPortraitRelevanceScoreProviderQueue"), v11);
    v12 = v24;
    v24 = 0;
    innerQueue = v6->_queue._innerQueue;
    v6->_queue._innerQueue = (OS_dispatch_queue *)v12;

    v14 = v25;
    v25 = 0;
    name = v6->_queue._name;
    v6->_queue._name = v14;

    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v16 = objc_claimAutoreleasedReturnValue();
    currentLocale = v6->_currentLocale;
    v6->_currentLocale = (NSLocale *)v16;

    -[NSLocale objectForKey:](v6->_currentLocale, "objectForKey:", *MEMORY[0x1E0C997E8]);
    v18 = objc_claimAutoreleasedReturnValue();
    languageCode = v6->_languageCode;
    v6->_languageCode = (NSString *)v18;

    objc_msgSend(MEMORY[0x1E0D27008], "sharedConfiguration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "countryCode");
    v21 = objc_claimAutoreleasedReturnValue();
    currentCountryCode = v6->_currentCountryCode;
    v6->_currentCountryCode = (NSString *)v21;

    objc_storeStrong((id *)&v6->_portrait, a3);
  }

  return v6;
}

- (char)relevanceScoreForNames:(id)a3 addresses:(id)a4 mapItems:(id)a5 completion:(id)a6
{
  NSObject *v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  char v18;
  uint64_t v20;
  id v21;
  _QWORD v22[4];
  NSObject *v23;
  MapsSuggestionsPortraitRelevanceScoreProvider *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint8_t buf[4];
  const char *v29;
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
  v11 = a6;
  if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
    dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
  if (s_verbose)
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v29 = "-[MapsSuggestionsPortraitRelevanceScoreProvider relevanceScoreForNames:addresses:mapItems:completion:]";
      _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
    }

  }
  if (!v11)
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v29 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPortraitRelevanceScoreProvider.mm";
      v30 = 1024;
      v31 = 81;
      v32 = 2082;
      v33 = "-[MapsSuggestionsPortraitRelevanceScoreProvider relevanceScoreForNames:addresses:mapItems:completion:]";
      v34 = 2082;
      v35 = "nil == (completion)";
      _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. nil completion", buf, 0x26u);
    }
    goto LABEL_27;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      GEOFindOrCreateLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v29 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPortraitRelevanceScoreProvider.mm";
        v30 = 1024;
        v31 = 83;
        v32 = 2082;
        v33 = "-[MapsSuggestionsPortraitRelevanceScoreProvider relevanceScoreForNames:addresses:mapItems:completion:]";
        v34 = 2082;
        v35 = "[addresses isKindOfClass:[NSMutableArray class]]";
        _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Passing a mutable array for addresses results in undefined behaviour", buf, 0x26u);
      }
      goto LABEL_27;
    }
    if (!+[MapsSuggestionsSiri isEnabled](MapsSuggestionsSiri, "isEnabled"))
    {
      GEOFindOrCreateLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_DEBUG, "User turned off Siri: we're not using Siri Portrait", buf, 2u);
      }
      goto LABEL_27;
    }
    v14 = -[NSObject copy](v9, "copy");

    v15 = (void *)objc_msgSend(v10, "copy");
    if (v15)
    {
      v16 = -[NSObject count](v14, "count");
      if (v16 != objc_msgSend(v15, "count"))
      {
        GEOFindOrCreateLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446978;
          v29 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPortraitRelevanceScoreProvider.mm";
          v30 = 1024;
          v31 = 96;
          v32 = 2082;
          v33 = "-[MapsSuggestionsPortraitRelevanceScoreProvider relevanceScoreForNames:addresses:mapItems:completion:]";
          v34 = 2082;
          v35 = "[names count] != [addresses count]";
          _os_log_impl(&dword_1A427D000, v17, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Inconsistent array counts for name and address", buf, 0x26u);
        }
        goto LABEL_35;
      }
    }
    else if (!v14)
    {
      GEOFindOrCreateLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v29 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPortraitRelevanceScoreProvider.mm";
        v30 = 1024;
        v31 = 98;
        v32 = 2082;
        v33 = "-[MapsSuggestionsPortraitRelevanceScoreProvider relevanceScoreForNames:addresses:mapItems:completion:]";
        v34 = 2082;
        v35 = "(nil == names) && (nil == addresses)";
        _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. names and addresses can't both be nil", buf, 0x26u);
      }
      goto LABEL_28;
    }
    v20 = -[NSObject count](v14, "count");
    if (v20)
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __102__MapsSuggestionsPortraitRelevanceScoreProvider_relevanceScoreForNames_addresses_mapItems_completion___block_invoke;
      v22[3] = &unk_1E4BDF5E0;
      v27 = v20;
      v23 = v14;
      v24 = self;
      v25 = v15;
      v26 = v11;
      v21 = v15;
      v9 = v14;
      MSg::Queue::async<MapsSuggestionsPortraitRelevanceScoreProvider>((NSObject **)&self->_queue, self, v22);

      v18 = 1;
      goto LABEL_29;
    }
    GEOFindOrCreateLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A427D000, v17, OS_LOG_TYPE_DEBUG, "0 names passed", buf, 2u);
    }
LABEL_35:

    v18 = 0;
    v9 = v14;
    goto LABEL_29;
  }
  GEOFindOrCreateLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    v29 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPortraitRelevanceScoreProvider.mm";
    v30 = 1024;
    v31 = 82;
    v32 = 2082;
    v33 = "-[MapsSuggestionsPortraitRelevanceScoreProvider relevanceScoreForNames:addresses:mapItems:completion:]";
    v34 = 2082;
    v35 = "[names isKindOfClass:[NSMutableArray class]]";
    _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Passing a mutable array for names results in undefined behaviour", buf, 0x26u);
  }
LABEL_27:

LABEL_28:
  v18 = 0;
LABEL_29:

  return v18;
}

void __102__MapsSuggestionsPortraitRelevanceScoreProvider_relevanceScoreForNames_addresses_mapItems_completion___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  char *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  unint64_t v18;
  MapsSuggestionsRelevanceScore *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  char *v27;
  NSObject *v28;
  void *v29;
  double v30;
  unint64_t v31;
  MapsSuggestionsRelevanceScore *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  MapsSuggestionsRelevanceScore *v36;
  id obj;
  uint64_t v38;
  void *v40;
  id *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  _BYTE v57[14];
  __int16 v58;
  const char *v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v41 = a2;
  v36 = objc_alloc_init(MapsSuggestionsRelevanceScore);
  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a1[8]);
  v2 = -1;
  while ((unint64_t)++v2 < a1[8])
    objc_msgSend(v40, "addObject:", v36);
  if (!objc_msgSend(v41[2], "count"))
    goto LABEL_54;
  if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
    dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
  if (s_verbose)
  {
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "User Portrait Data:", buf, 2u);
    }

  }
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v4 = v41[2];
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v51;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v51 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v7);
        if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
          dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
        if (s_verbose)
        {
          GEOFindOrCreateLog();
          v9 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v8, "name");
            v10 = (char *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "lastInteractionTime");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v55 = v10;
            v56 = 2112;
            *(_QWORD *)v57 = v11;
            _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_DEBUG, "%@, %@\n", buf, 0x16u);

          }
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
    }
    while (v5);
  }

  v12 = (void *)a1[4];
  if (v12)
  {
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v46, v61, 16);
    if (v14)
    {
      v15 = 0;
      v16 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v47 != v16)
            objc_enumerationMutation(v13);
          v18 = -[MapsSuggestionsPortraitRelevanceScoreProvider _searchForName:]((uint64_t)v41, *(void **)(*((_QWORD *)&v46 + 1) + 8 * i));
          if (v18 <= 0x7FFFFFFFFFFFFFFELL)
          {
            v19 = -[MapsSuggestionsRelevanceScore initWithConfidence:]([MapsSuggestionsRelevanceScore alloc], "initWithConfidence:", MapsSuggestionsConfidenceDefinitelyTrue());
            objc_msgSend(*(id *)(a1[5] + 16), "objectAtIndexedSubscript:", v18);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "lastInteractionTime");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[MapsSuggestionsRelevanceScore setLastInteractionTime:](v19, "setLastInteractionTime:", v21);

            objc_msgSend(v40, "setObject:atIndexedSubscript:", v19, v15 + i);
          }
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v46, v61, 16);
        v15 += i;
      }
      while (v14);
    }

  }
  v22 = (void *)a1[6];
  if (v22)
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    obj = v22;
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v60, 16);
    if (v23)
    {
      v24 = 0;
      v38 = *(_QWORD *)v43;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v43 != v38)
            objc_enumerationMutation(obj);
          v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D26EC8]), "initWithCNPostalAddress:language:country:phoneticLocale:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v25), v41[6], v41[7], v41[6]);
          objc_msgSend(v26, "shortAddress");
          v27 = (char *)objc_claimAutoreleasedReturnValue();
          if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
            dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
          if (s_verbose)
          {
            GEOFindOrCreateLog();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v55 = v27;
              _os_log_impl(&dword_1A427D000, v28, OS_LOG_TYPE_DEBUG, "Converted Address is %@", buf, 0xCu);
            }

          }
          objc_msgSend(v40, "objectAtIndexedSubscript:", v24 + v25);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "confidence");
          if (v30 < MapsSuggestionsConfidenceDefinitelyTrue())
          {
            v31 = -[MapsSuggestionsPortraitRelevanceScoreProvider _searchForName:](a1[5], v27);
            if (v31 <= 0x7FFFFFFFFFFFFFFELL)
            {
              v32 = -[MapsSuggestionsRelevanceScore initWithConfidence:]([MapsSuggestionsRelevanceScore alloc], "initWithConfidence:", MapsSuggestionsConfidenceDefinitelyTrue());
              objc_msgSend(*(id *)(a1[5] + 16), "objectAtIndexedSubscript:", v31);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "lastInteractionTime");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              -[MapsSuggestionsRelevanceScore setLastInteractionTime:](v32, "setLastInteractionTime:", v34);

              objc_msgSend(v40, "setObject:atIndexedSubscript:", v32, v24 + v25);
            }
          }

          ++v25;
        }
        while (v23 != v25);
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v60, 16);
        v24 += v25;
      }
      while (v23);
    }

  }
  if (objc_msgSend(v40, "count") != a1[8])
  {
    GEOFindOrCreateLog();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v55 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPortraitRelevanceScoreProvider.mm";
      v56 = 1024;
      *(_DWORD *)v57 = 166;
      *(_WORD *)&v57[4] = 2082;
      *(_QWORD *)&v57[6] = "-[MapsSuggestionsPortraitRelevanceScoreProvider relevanceScoreForNames:addresses:mapItems:com"
                           "pletion:]_block_invoke";
      v58 = 2082;
      v59 = "[confidences count] != count";
      _os_log_impl(&dword_1A427D000, v35, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Return count must be same as input count!", buf, 0x26u);
    }

  }
  else
  {
LABEL_54:
    (*(void (**)(void))(a1[7] + 16))();
  }

}

- (uint64_t)_searchForName:(uint64_t)a1
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  NSObject *v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!a1)
  {
    v17 = 0;
    goto LABEL_28;
  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v3)
  {
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      goto LABEL_26;
    *(_WORD *)buf = 0;
    v13 = "Search String null";
LABEL_24:
    v14 = v5;
    v15 = 2;
    goto LABEL_25;
  }
  if (!objc_msgSend(*(id *)(a1 + 16), "count"))
  {
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      goto LABEL_26;
    *(_WORD *)buf = 0;
    v13 = "No portrait data";
    goto LABEL_24;
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = *(id *)(a1 + 16);
  v6 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v6)
  {
    v7 = 0;
    v8 = *(_QWORD *)v20;
    while (2)
    {
      v9 = 0;
      v10 = v6 + v7;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v9), "name", (_QWORD)v19);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "caseInsensitiveCompare:", v3) == 0;

        if (v12)
        {
          GEOFindOrCreateLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v24 = v3;
            _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_DEBUG, "String %@ was found in Portrait. Setting High Confidence", buf, 0xCu);
          }

          v17 = v7 + v9;
          goto LABEL_27;
        }
        ++v9;
      }
      while (v6 != v9);
      v6 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      v7 = v10;
      if (v6)
        continue;
      break;
    }
  }

  if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
    dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
  if (!s_verbose)
  {
    v17 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_28;
  }
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v3;
    v13 = "String %@ was not found in Portrait";
    v14 = v5;
    v15 = 12;
LABEL_25:
    _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_DEBUG, v13, buf, v15);
  }
LABEL_26:
  v17 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_27:

LABEL_28:
  return v17;
}

- (void)preLoad
{
  NSObject *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
    dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
  if (s_verbose)
  {
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v5 = 136315138;
      v6 = "-[MapsSuggestionsPortraitRelevanceScoreProvider preLoad]";
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v5, 0xCu);
    }

  }
  if (self)
  {
    if (+[MapsSuggestionsSiri isEnabled](MapsSuggestionsSiri, "isEnabled"))
    {
      MSg::Queue::async<MapsSuggestionsPortraitRelevanceScoreProvider>((NSObject **)&self->_queue, self, &__block_literal_global_42);
    }
    else
    {
      GEOFindOrCreateLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v5) = 0;
        _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "User turned off Siri: we're not using Siri Portrait", (uint8_t *)&v5, 2u);
      }

    }
  }
}

void __74__MapsSuggestionsPortraitRelevanceScoreProvider__fetchStringsFromPortrait__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  id *v4;

  v4 = a2;
  objc_msgSend(v4[8], "fetchNamedEntitiesFromDate:", v4[1]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v4[2];
  v4[2] = (id)v2;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portrait, 0);
  objc_storeStrong((id *)&self->_currentCountryCode, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_currentLocale, 0);

  objc_storeStrong((id *)&self->_portraitData, 0);
  objc_storeStrong((id *)&self->_fetchEntriesFromDate, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end
