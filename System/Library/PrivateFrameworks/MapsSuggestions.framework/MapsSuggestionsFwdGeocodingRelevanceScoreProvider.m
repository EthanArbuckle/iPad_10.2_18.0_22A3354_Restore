@implementation MapsSuggestionsFwdGeocodingRelevanceScoreProvider

- (id)initDecoratingRelevanceScoreProvider:(id)a3 networkRequester:(id)a4
{
  id v7;
  id v8;
  MapsSuggestionsFwdGeocodingRelevanceScoreProvider *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MapsSuggestionsFwdGeocodingRelevanceScoreProvider;
  v9 = -[MapsSuggestionsFwdGeocodingRelevanceScoreProvider init](&v12, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_networkRequester, a4);
    objc_storeStrong(p_isa + 2, a3);
  }

  return p_isa;
}

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "description");
}

- (BOOL)relevanceScoreForNames:(id)a3 addresses:(id)a4 mapItems:(id)a5 completion:(id)a6
{
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  char v15;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  MapsSuggestionsNetworkRequester *networkRequester;
  double v27;
  dispatch_time_t v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  NSObject *v38;
  uint64_t *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  uint8_t v48[128];
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  int v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  const char *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v13)
  {
    GEOFindOrCreateLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v50 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFwdGeocodingRelevanceScoreProvider.m";
      v51 = 1024;
      v52 = 55;
      v53 = 2082;
      v54 = "-[MapsSuggestionsFwdGeocodingRelevanceScoreProvider relevanceScoreForNames:addresses:mapItems:completion:]";
      v55 = 2082;
      v56 = "nil == (completion)";
      _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. nil completion", buf, 0x26u);
    }
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      GEOFindOrCreateLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v50 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFwdGeocodingRelevanceScoreProvider.m";
        v51 = 1024;
        v52 = 57;
        v53 = 2082;
        v54 = "-[MapsSuggestionsFwdGeocodingRelevanceScoreProvider relevanceScoreForNames:addresses:mapItems:completion:]";
        v55 = 2082;
        v56 = "[addresses isKindOfClass:[NSMutableArray class]]";
        _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Passing a mutable array for addresses results in undefined behaviour", buf, 0x26u);
      }
      goto LABEL_16;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      GEOFindOrCreateLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v50 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFwdGeocodingRelevanceScoreProvider.m";
        v51 = 1024;
        v52 = 58;
        v53 = 2082;
        v54 = "-[MapsSuggestionsFwdGeocodingRelevanceScoreProvider relevanceScoreForNames:addresses:mapItems:completion:]";
        v55 = 2082;
        v56 = "[mapItems isKindOfClass:[NSMutableArray class]]";
        _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Passing a mutable array for mapItems results in undefined behaviour", buf, 0x26u);
      }
      goto LABEL_16;
    }
    v17 = (void *)objc_msgSend(v10, "copy");

    v18 = -[NSObject copy](v11, "copy");
    v19 = -[NSObject copy](v12, "copy");

    if (v19)
    {
      v15 = -[MapsSuggestionsRelevanceScoreProvider relevanceScoreForNames:addresses:mapItems:completion:](self->_wrappedScoreProvider, "relevanceScoreForNames:addresses:mapItems:completion:", v17, v18, v19, v13);
      v12 = v19;
LABEL_37:
      v11 = v18;
      v10 = v17;
      goto LABEL_17;
    }
    v20 = objc_msgSend(v17, "count");
    if (v20 != -[NSObject count](v18, "count"))
    {
      GEOFindOrCreateLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v50 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFwdGeocodingRelevanceScoreProvider.m";
        v51 = 1024;
        v52 = 72;
        v53 = 2082;
        v54 = "-[MapsSuggestionsFwdGeocodingRelevanceScoreProvider relevanceScoreForNames:addresses:mapItems:completion:]";
        v55 = 2082;
        v56 = "[names count] != [addresses count]";
        _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Name and Address count did not match.", buf, 0x26u);
      }
      v15 = 0;
      goto LABEL_37;
    }
    v34 = v17;
    v21 = dispatch_group_create();
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSObject count](v18, "count"));
    v44 = 0;
    v45 = &v44;
    v46 = 0x2020000000;
    v47 = 0;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v11 = v18;
    v22 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v41;
      while (2)
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v41 != v23)
            objc_enumerationMutation(v11);
          v25 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            GEOFindOrCreateLog();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446978;
              v50 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFwdGeocodingRelevanceScoreProvider.m";
              v51 = 1024;
              v52 = 78;
              v53 = 2082;
              v54 = "-[MapsSuggestionsFwdGeocodingRelevanceScoreProvider relevanceScoreForNames:addresses:mapItems:completion:]";
              v55 = 2082;
              v56 = "! [address isKindOfClass:[CNPostalAddress class]]";
              _os_log_impl(&dword_1A427D000, v31, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Address is not of type CNPostalAddress!", buf, 0x26u);
            }

            v32 = v11;
            goto LABEL_41;
          }
          dispatch_group_enter(v21);
          networkRequester = self->_networkRequester;
          v36[0] = MEMORY[0x1E0C809B0];
          v36[1] = 3221225472;
          v36[2] = __106__MapsSuggestionsFwdGeocodingRelevanceScoreProvider_relevanceScoreForNames_addresses_mapItems_completion___block_invoke;
          v36[3] = &unk_1E4BCFF68;
          v37 = v35;
          v38 = v21;
          v39 = &v44;
          -[MapsSuggestionsNetworkRequester forwardGeocodePostalAddress:completion:](networkRequester, "forwardGeocodePostalAddress:completion:", v25, v36);

        }
        v22 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
        if (v22)
          continue;
        break;
      }
    }

    GEOConfigGetDouble();
    v28 = dispatch_time(0, (uint64_t)(v27 * 1000000000.0));
    if (dispatch_group_wait(v21, v28))
    {
      GEOFindOrCreateLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A427D000, v29, OS_LOG_TYPE_ERROR, "Timeout on getting mapItems from Fwd Geo", buf, 2u);
      }

      v12 = 0;
      *((_BYTE *)v45 + 24) = 0;
      v30 = v34;
    }
    else
    {
      v30 = v34;
      if (*((_BYTE *)v45 + 24))
      {
        v33 = objc_msgSend(v35, "count");
        if (v33 != objc_msgSend(v34, "count"))
        {
          GEOFindOrCreateLog();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446978;
            v50 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFwdGeocodingRelevanceScoreProvider.m";
            v51 = 1024;
            v52 = 111;
            v53 = 2082;
            v54 = "-[MapsSuggestionsFwdGeocodingRelevanceScoreProvider relevanceScoreForNames:addresses:mapItems:completion:]";
            v55 = 2082;
            v56 = "[mutablemapItems count] != [names count]";
            _os_log_impl(&dword_1A427D000, v32, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Count of mapItems is not the same as input", buf, 0x26u);
          }
LABEL_41:

          v12 = 0;
          v15 = 0;
          goto LABEL_42;
        }
        v12 = objc_msgSend(v35, "copy");
      }
      else
      {
        v12 = 0;
      }
    }
    v15 = -[MapsSuggestionsRelevanceScoreProvider relevanceScoreForNames:addresses:mapItems:completion:](self->_wrappedScoreProvider, "relevanceScoreForNames:addresses:mapItems:completion:", v30, v11, v12, v13);
LABEL_42:
    _Block_object_dispose(&v44, 8);

    v10 = v34;
    goto LABEL_17;
  }
  GEOFindOrCreateLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    v50 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFwdGeocodingRelevanceScoreProvider.m";
    v51 = 1024;
    v52 = 56;
    v53 = 2082;
    v54 = "-[MapsSuggestionsFwdGeocodingRelevanceScoreProvider relevanceScoreForNames:addresses:mapItems:completion:]";
    v55 = 2082;
    v56 = "[names isKindOfClass:[NSMutableArray class]]";
    _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Passing a mutable array for names results in undefined behaviour", buf, 0x26u);
  }
LABEL_16:

  v15 = 0;
LABEL_17:

  return v15;
}

void __106__MapsSuggestionsFwdGeocodingRelevanceScoreProvider_relevanceScoreForNames_addresses_mapItems_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v15 = 138412290;
      v16 = v6;
      v8 = "Error in forwardGeocodePostalAddress:%@";
      v9 = v7;
      v10 = 12;
LABEL_4:
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v15, v10);
    }
  }
  else
  {
    if (objc_msgSend(v5, "count"))
    {
      v13 = *(void **)(a1 + 32);
      objc_msgSend(v5, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v14);

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      goto LABEL_8;
    }
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v15) = 0;
      v8 = "Recieved 0 mapItems in forwardGeocodePostalAddress";
      v9 = v7;
      v10 = 2;
      goto LABEL_4;
    }
  }

  v11 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v12);

LABEL_8:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

- (void)preLoad
{
  -[MapsSuggestionsRelevanceScoreProvider preLoad](self->_wrappedScoreProvider, "preLoad");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedScoreProvider, 0);
  objc_storeStrong((id *)&self->_networkRequester, 0);
}

@end
