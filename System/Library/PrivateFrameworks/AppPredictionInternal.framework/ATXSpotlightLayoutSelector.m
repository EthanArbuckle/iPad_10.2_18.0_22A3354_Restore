@implementation ATXSpotlightLayoutSelector

- (ATXSpotlightLayoutSelector)initWithSuggestionDeduplicator:(id)a3 hyperParameters:(id)a4
{
  id v7;
  id v8;
  ATXSpotlightLayoutSelector *v9;
  ATXSpotlightLayoutSelector *v10;
  uint64_t v11;
  ATXSpotlightContextAdapter *adapter;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXSpotlightLayoutSelector;
  v9 = -[ATXSpotlightLayoutSelector init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_deduplicator, a3);
    objc_storeStrong((id *)&v10->_hyperParameters, a4);
    v11 = objc_opt_new();
    adapter = v10->_adapter;
    v10->_adapter = (ATXSpotlightContextAdapter *)v11;

  }
  return v10;
}

- (id)_rankedReasonCodes
{
  return &unk_1E83D0718;
}

- (unint64_t)_supportedContextReasons
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[ATXSpotlightLayoutSelector _rankedReasonCodes](self, "_rankedReasonCodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 |= 1 << objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "integerValue");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_isValidForReasons:(unint64_t)a3
{
  unint64_t v3;
  NSObject *v5;

  v3 = -[ATXSpotlightLayoutSelector _supportedContextReasons](self, "_supportedContextReasons") & a3;
  if (v3)
  {
    if ((v3 & (v3 - 1)) == 0)
      return 1;
    __atxlog_handle_blending();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[ATXSpotlightLayoutSelector _isValidForReasons:].cold.1();

  }
  return 0;
}

- (void)_indexSpotlightActions:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  const __CFString *v18;
  _QWORD v19[2];
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CA6B38], "isIndexingAvailable") & 1) != 0)
  {
    v4 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __53__ATXSpotlightLayoutSelector__indexSpotlightActions___block_invoke;
    v17[3] = &unk_1E82EA098;
    v18 = CFSTR("com.apple.duetexpertd.spotlightZKW");
    objc_msgSend(v3, "_pas_mappedArrayWithTransform:", v17);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_blending();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_msgSend(v5, "count");
      *(_DWORD *)buf = 134217984;
      v21 = v7;
      _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "[Index] %lu items to index", buf, 0xCu);
    }

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B38]), "initWithName:bundleIdentifier:", CFSTR("com.apple.duetexpertd.spotlightZKW"), CFSTR("com.apple.shortcuts"));
    __atxlog_handle_blending();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_DEFAULT, "indexSpotlightActions: Deleting", buf, 2u);
    }

    v19[0] = CFSTR("com.apple.duetexpertd.spotlightZKW");
    v19[1] = CFSTR("spotlightZKW");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v4;
    v14[1] = 3221225472;
    v14[2] = __53__ATXSpotlightLayoutSelector__indexSpotlightActions___block_invoke_71;
    v14[3] = &unk_1E82EA0E0;
    v15 = v5;
    v16 = v8;
    v11 = v8;
    v12 = v5;
    objc_msgSend(v11, "deleteSearchableItemsWithDomainIdentifiers:completionHandler:", v10, v14);

    v13 = v18;
  }
  else
  {
    __atxlog_handle_blending();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_DEFAULT, "[Index] Indexing is not available on this device", buf, 2u);
    }
  }

}

id __53__ATXSpotlightLayoutSelector__indexSpotlightActions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "atxShortcutsActionExecutableObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchableItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDomainIdentifier:", *(_QWORD *)(a1 + 32));
  __atxlog_handle_blending();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      objc_msgSend(v3, "uiSpecification");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "title");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v9;
      v16 = 2112;
      v17 = v5;
      v10 = "[Index] CSSearchableItem from suggestion %@ --> %@";
      v11 = v6;
      v12 = 22;
LABEL_6:
      _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v14, v12);

    }
  }
  else if (v7)
  {
    objc_msgSend(v3, "uiSpecification");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = v9;
    v10 = "[Index] No search item from suggestion %@";
    v11 = v6;
    v12 = 12;
    goto LABEL_6;
  }

  return v5;
}

void __53__ATXSpotlightLayoutSelector__indexSpotlightActions___block_invoke_71(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  _BOOL4 v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  __atxlog_handle_blending();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __53__ATXSpotlightLayoutSelector__indexSpotlightActions___block_invoke_71_cold_1();
LABEL_4:

    goto LABEL_11;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "[Index] Deleting finished", (uint8_t *)&v9, 2u);
  }

  v6 = objc_msgSend(*(id *)(a1 + 32), "count");
  __atxlog_handle_blending();
  v5 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (!v6)
  {
    if (v7)
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "[Index] No items to index", (uint8_t *)&v9, 2u);
    }
    goto LABEL_4;
  }
  if (v7)
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "[Index] Inserting %@", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "indexSearchableItems:completionHandler:", *(_QWORD *)(a1 + 32), &__block_literal_global_227);
LABEL_11:

}

void __53__ATXSpotlightLayoutSelector__indexSpotlightActions___block_invoke_72(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = a2;
  __atxlog_handle_blending();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __53__ATXSpotlightLayoutSelector__indexSpotlightActions___block_invoke_72_cold_1();
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "[Index] Inserting finished", v5, 2u);
  }

}

- (id)nsuaFilteredLayoutForConsumerSubType:(unsigned __int8)a3 rankedSuggestions:(id)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  unint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[5];
  uint8_t buf[16];
  _QWORD v27[2];

  v4 = a3;
  v27[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  __atxlog_handle_blending();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "SLS: ATXSpotlightLayoutSelector filtered nsua suggestions", buf, 2u);
  }

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81170]), "initWithSuggestionDeduplicator:hyperParameters:", self->_deduplicator, self->_hyperParameters);
  objc_msgSend(v8, "validLayoutsForConsumerSubType:rankedSuggestions:", v4, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "allSuggestionsInLayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __85__ATXSpotlightLayoutSelector_nsuaFilteredLayoutForConsumerSubType_rankedSuggestions___block_invoke;
    v25[3] = &unk_1E82DE058;
    v25[4] = self;
    objc_msgSend(v11, "_pas_filteredArrayWithTest:", v25);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "count"))
    {
      v13 = objc_msgSend(v12, "count");
      if (v13 >= 4)
        v14 = 4;
      else
        v14 = v13;
      objc_msgSend(v12, "subarrayWithRange:", 0, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (objc_msgSend(v15, "count"))
      {
        v17 = 0;
        do
        {
          objc_msgSend(v16, "addObject:", &unk_1E83CE350);
          ++v17;
        }
        while (objc_msgSend(v15, "count") > v17);
      }
      -[ATXSpotlightContextAdapter nsuaSectionIdentifier](self->_adapter, "nsuaSectionIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811F0]), "initWithSuggestions:contextTitle:sectionIdentifier:", v15, 0, v18);
      v20 = objc_alloc(MEMORY[0x1E0D811F8]);
      v27[0] = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v20, "initWithCollections:scores:uuid:", v21, v16, v22);

    }
    else
    {
      v23 = 0;
      v15 = v12;
    }

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

BOOL __85__ATXSpotlightLayoutSelector_nsuaFilteredLayoutForConsumerSubType_rankedSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a2;
  objc_msgSend(v3, "executableSpecification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "executableType");

  if (v5 == 5)
  {
    v6 = 1;
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v3, "uiSpecification");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v7) = objc_msgSend(v7, "_isValidForReasons:", objc_msgSend(v8, "predictionReasons"));

    if ((v7 & 1) != 0)
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend(v3, "executableSpecification");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v9, "executableType") == 2;

    }
  }

  return v6;
}

- (id)selectedLayoutForConsumerSubType:(unsigned __int8)a3 rankedSuggestions:(id)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  _QWORD v37[5];
  char v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v4 = a3;
  v43 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  __atxlog_handle_blending();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v40 = (uint64_t)v8;
    v41 = 2048;
    v42 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "SLS: ATXSpotlightLayoutSelector asked to provide the selected layout for %{public}@ and %lu rankedSuggestions", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CF9128], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  buf[0] = 0;
  v10 = (const __CFString *)*MEMORY[0x1E0CF9510];
  if (CFPreferencesGetAppBooleanValue(CFSTR("zkwShowNSUA"), (CFStringRef)*MEMORY[0x1E0CF9510], buf)
    || (buf[0] = 0, CFPreferencesGetAppBooleanValue(CFSTR("zkwShowNSUAApp"), v10, buf))
    || (objc_msgSend(v9, "nsuaSuggestions") & 1) != 0
    || objc_msgSend(v9, "showNSUASuggestionsAsAppLaunches"))
  {
    -[ATXSpotlightLayoutSelector nsuaFilteredLayoutForConsumerSubType:rankedSuggestions:](self, "nsuaFilteredLayoutForConsumerSubType:rankedSuggestions:", v4, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ATXSpotlightLayoutSelector _insertMediaSuggestion:consumerSubType:](self, "_insertMediaSuggestion:consumerSubType:", v6, v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[ATXSpotlightLayoutSelector _heroDataReducer:](self, "_heroDataReducer:", v13);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __81__ATXSpotlightLayoutSelector_selectedLayoutForConsumerSubType_rankedSuggestions___block_invoke;
    v37[3] = &unk_1E82E47B0;
    v37[4] = self;
    v38 = v4;
    objc_msgSend(v6, "_pas_filteredArrayWithTest:", v37);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_commuteWildcardReducer:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    __atxlog_handle_blending();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_msgSend(v15, "count");
      *(_DWORD *)buf = 134217984;
      v40 = v17;
      _os_log_impl(&dword_1C9A3B000, v16, OS_LOG_TYPE_DEFAULT, "SLS: ATXSpotlightLayoutSelector  %lu rankedSuggestions", buf, 0xCu);
    }

    -[ATXSpotlightLayoutSelector _indexSpotlightActions:](self, "_indexSpotlightActions:", v15);
    -[ATXSpotlightLayoutSelector _collectionsWithSuggestions:](self, "_collectionsWithSuggestions:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1CAA48B6C]();
    -[ATXSpotlightLayoutSelector _createTopAppShortcutSuggestions](self, "_createTopAppShortcutSuggestions");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v19);
    v21 = objc_msgSend(v20, "count");
    if (v21 >= 2)
      v22 = 2;
    else
      v22 = v21;
    objc_msgSend(v20, "subarrayWithRange:", 0, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[ATXSpotlightLayoutSelector _createTopAppShortcutCollectionsWithSuggestions:](self, "_createTopAppShortcutCollectionsWithSuggestions:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_blending();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = objc_msgSend(v23, "count");
      *(_DWORD *)buf = 134218242;
      v40 = v26;
      v41 = 2112;
      v42 = (uint64_t)v23;
      _os_log_impl(&dword_1C9A3B000, v25, OS_LOG_TYPE_DEFAULT, "SLS: [AppShortcut] Adding suggestions: %lu, %@", buf, 0x16u);
    }

    objc_msgSend(v24, "arrayByAddingObjectsFromArray:", v18);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXSpotlightLayoutSelector _scoresFlattenForCollections:](self, "_scoresFlattenForCollections:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_alloc(MEMORY[0x1E0D811F8]);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v29, "initWithCollections:scores:uuid:", v27, v28, v30);

    __atxlog_handle_blending();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "collections");
      v36 = v24;
      v32 = v15;
      v33 = v18;
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "count");
      *(_DWORD *)buf = 134217984;
      v40 = v35;
      _os_log_impl(&dword_1C9A3B000, v31, OS_LOG_TYPE_DEFAULT, "SLS: ATXSpotlightLayoutSelector %lu collections", buf, 0xCu);

      v18 = v33;
      v15 = v32;
      v24 = v36;
    }

  }
  return v11;
}

uint64_t __81__ATXSpotlightLayoutSelector_selectedLayoutForConsumerSubType_rankedSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "uiSupportsSuggestion:consumerSubType:", v3, *(unsigned __int8 *)(a1 + 40)))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "uiSpecification");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "_isValidForReasons:", objc_msgSend(v5, "predictionReasons"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (double)_adaptedScoreForSuggestion:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  double v15;

  v3 = a3;
  objc_msgSend(v3, "uiSpecification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "predictionReasons");

  if ((v5 & 0x800000) != 0)
  {
    *(double *)&v9 = 50.0;
LABEL_11:
    v8 = *(double *)&v9;
    goto LABEL_12;
  }
  objc_msgSend(v3, "uiSpecification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "predictionReasons") & 0x1E000000;

  if (v7)
  {
    v8 = 70.0;
    goto LABEL_12;
  }
  objc_msgSend(v3, "uiSpecification");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "predictionReasons");

  if ((v11 & 0x20000000) != 0
    || (objc_msgSend(v3, "uiSpecification"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "predictionReasons"),
        v12,
        (v13 & 0x40000000) != 0))
  {
    *(double *)&v9 = 40.0;
    goto LABEL_11;
  }
  v8 = 30.0;
  if ((objc_msgSend((id)objc_opt_class(), "_isCommuteMediaSuggestion:", v3) & 1) == 0
    && (objc_msgSend((id)objc_opt_class(), "_isCommuteWildCardSuggestion:", v3) & 1) == 0)
  {
    objc_msgSend(v3, "scoreSpecification");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "rawScore");
    v8 = v15;

  }
LABEL_12:

  return v8;
}

- (id)_collectionsWithSuggestions:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  unint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  NSObject *v57;
  uint64_t v58;
  uint64_t v59;
  void *v61;
  uint64_t v62;
  void *v63;
  id obj;
  id obja;
  id objb;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _QWORD v80[5];
  _BYTE v81[128];
  uint8_t v82[128];
  uint8_t buf[4];
  uint64_t v84;
  __int16 v85;
  uint64_t v86;
  __int16 v87;
  uint64_t v88;
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v80[0] = MEMORY[0x1E0C809B0];
  v80[1] = 3221225472;
  v80[2] = __58__ATXSpotlightLayoutSelector__collectionsWithSuggestions___block_invoke;
  v80[3] = &unk_1E82EA108;
  v80[4] = self;
  objc_msgSend(a3, "sortedArrayUsingComparator:", v80);
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v89, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v77;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v77 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
        __atxlog_handle_blending();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v7, "uiSpecification");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "title");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "hash");
          objc_msgSend(v7, "scoreSpecification");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "suggestedConfidenceCategory");
          -[ATXSpotlightLayoutSelector _adaptedScoreForSuggestion:](self, "_adaptedScoreForSuggestion:", v7);
          *(_DWORD *)buf = 134218496;
          v84 = v11;
          v85 = 2048;
          v86 = v13;
          v87 = 2048;
          v88 = v14;
          _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "SLS: _collectionsWithSuggestions rankedAndFilteredSuggestions [%lu] = %ld %f", buf, 0x20u);

        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v89, 16);
    }
    while (v4);
  }

  __atxlog_handle_blending();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = objc_msgSend(obj, "count");
    *(_DWORD *)buf = 134217984;
    v84 = v16;
    _os_log_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_DEFAULT, "SLS: _collectionsWithSuggestions %lu rankedAndFilteredSuggestions", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_blending();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = objc_msgSend(obj, "count");
    *(_DWORD *)buf = 134217984;
    v84 = v19;
    _os_log_impl(&dword_1C9A3B000, v18, OS_LOG_TYPE_DEFAULT, "SLS: ATXSpotlightLayoutSelector  %lu rankedAndFilteredSuggestions", buf, 0xCu);
  }

  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  obja = obj;
  v20 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v72, v82, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v73;
    v23 = 0x1E0CB3000uLL;
    do
    {
      v24 = 0;
      v62 = v21;
      do
      {
        if (*(_QWORD *)v73 != v22)
          objc_enumerationMutation(obja);
        v25 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v24);
        objc_msgSend(v25, "uiSpecification");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = -[ATXSpotlightLayoutSelector _contextReasonCodeWithPredictionReasons:](self, "_contextReasonCodeWithPredictionReasons:", objc_msgSend(v26, "predictionReasons"));

        __atxlog_handle_blending();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v25, "uiSpecification");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "title");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "uiSpecification");
          v31 = v22;
          v32 = v17;
          v33 = v23;
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "predictionReasons");
          *(_DWORD *)buf = 138412802;
          v84 = (uint64_t)v30;
          v85 = 2048;
          v86 = v27;
          v87 = 2048;
          v88 = v35;
          _os_log_impl(&dword_1C9A3B000, v28, OS_LOG_TYPE_DEFAULT, "SLS: ATXSpotlightLayoutSelector suggestion =[%@] contextCode found: %ld for reasons %llu", buf, 0x20u);

          v23 = v33;
          v17 = v32;
          v22 = v31;
          v21 = v62;

        }
        objc_msgSend(*(id *)(v23 + 2024), "numberWithInteger:", v27);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
        {
          objc_msgSend(v37, "addObject:", v25);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v25);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v23 + 2024), "numberWithInteger:", v27);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v37, v38);

        }
        ++v24;
      }
      while (v21 != v24);
      v21 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v72, v82, 16);
    }
    while (v21);
  }

  -[ATXSpotlightLayoutSelector _clearDuplicateContextsFromSuggestions:suggestionDict:](self, "_clearDuplicateContextsFromSuggestions:suggestionDict:", obja, v17);
  v39 = objc_claimAutoreleasedReturnValue();

  v61 = (void *)v39;
  -[ATXSpotlightLayoutSelector _dedupeSuggestions:suggestionDict:](self, "_dedupeSuggestions:suggestionDict:", v39, v17);
  v63 = (void *)objc_opt_new();
  -[ATXSpotlightLayoutSelector _rankedReasonCodes](self, "_rankedReasonCodes");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_blending();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v40, "componentsJoinedByString:", CFSTR(","));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v84 = (uint64_t)v42;
    _os_log_impl(&dword_1C9A3B000, v41, OS_LOG_TYPE_DEFAULT, "SLS: rankedReasonKeys = %@", buf, 0xCu);

  }
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  objb = v40;
  v43 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v68, v81, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v69;
    do
    {
      for (j = 0; j != v44; ++j)
      {
        if (*(_QWORD *)v69 != v45)
          objc_enumerationMutation(objb);
        v47 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
        objc_msgSend(v17, "objectForKeyedSubscript:", v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v48;
        if (v48 && objc_msgSend(v48, "count"))
        {
          -[ATXSpotlightLayoutSelector _titleForContextCode:suggestions:](self, "_titleForContextCode:suggestions:", objc_msgSend(v47, "integerValue"), v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          __atxlog_handle_blending();
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v17, "objectForKeyedSubscript:", v47);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = objc_msgSend(v52, "count");
            v54 = objc_msgSend(v50, "hash");
            *(_DWORD *)buf = 138412802;
            v84 = (uint64_t)v47;
            v85 = 2048;
            v86 = v53;
            v87 = 2048;
            v88 = v54;
            _os_log_impl(&dword_1C9A3B000, v51, OS_LOG_TYPE_DEFAULT, "SLS: _collectionsWithSuggestions reasonCode=%@ count=%lu contextTitle.hash=%lu", buf, 0x20u);

          }
          -[ATXSpotlightContextAdapter sectionIdentifierForContextCode:](self->_adapter, "sectionIdentifierForContextCode:", objc_msgSend(v47, "integerValue"));
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811F0]), "initWithSuggestions:contextTitle:sectionIdentifier:", v49, v50, v55);
          __atxlog_handle_blending();
          v57 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          {
            v58 = objc_msgSend(v50, "hash");
            v59 = objc_msgSend(v49, "count");
            *(_DWORD *)buf = 134218498;
            v84 = v58;
            v85 = 2112;
            v86 = (uint64_t)v55;
            v87 = 2048;
            v88 = v59;
            _os_log_impl(&dword_1C9A3B000, v57, OS_LOG_TYPE_DEFAULT, "SLS: _collectionsWithSuggestions collection created contextTitle.hash=%lu sectionIdentifier=%@ with %lu suggestions", buf, 0x20u);
          }

          objc_msgSend(v63, "addObject:", v56);
        }

      }
      v44 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v68, v81, 16);
    }
    while (v44);
  }

  return v63;
}

uint64_t __58__ATXSpotlightLayoutSelector__collectionsWithSuggestions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "scoreSpecification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v8, "suggestedConfidenceCategory"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "scoreSpecification");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithInteger:", objc_msgSend(v11, "suggestedConfidenceCategory"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v9, "compare:", v12);

  if (!v13)
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 32), "_adaptedScoreForSuggestion:", v6);
    objc_msgSend(v14, "numberWithDouble:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 32), "_adaptedScoreForSuggestion:", v5);
    objc_msgSend(v16, "numberWithDouble:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v15, "compare:", v17);

  }
  return v13;
}

- (id)_clearDuplicateContextsFromSuggestions:(id)a3 suggestionDict:(id)a4
{
  id v5;
  __int128 v6;
  uint64_t i;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t k;
  void *v46;
  void *v47;
  void *v48;
  char v49;
  void *v50;
  void *v51;
  __int128 v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id obj;
  void *v59;
  void *v60;
  uint64_t v61;
  id v62;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  uint8_t v82[128];
  uint8_t buf[4];
  _BYTE v84[10];
  _BYTE v85[10];
  __int16 v86;
  void *v87;
  _BYTE v88[128];
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v54 = (void *)objc_msgSend(a3, "mutableCopy");
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  obj = v5;
  v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
  if (v56)
  {
    v55 = *(_QWORD *)v78;
    *(_QWORD *)&v6 = 134217984;
    v53 = v6;
    do
    {
      for (i = 0; i != v56; ++i)
      {
        if (*(_QWORD *)v78 != v55)
          objc_enumerationMutation(obj);
        v60 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
        v8 = 1 << objc_msgSend(v60, "integerValue", v53);
        __atxlog_handle_blending();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)v84 = v60;
          *(_WORD *)&v84[8] = 1024;
          *(_DWORD *)v85 = (v8 & 0x700000) != 0;
          *(_WORD *)&v85[4] = 1024;
          *(_DWORD *)&v85[6] = (v8 & 0x380000000) != 0;
          _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_DEFAULT, "SLS: contextCode = %@ isEventContext= %{BOOL}i, isFlightContext= %{BOOL}i  ", buf, 0x18u);
        }

        if ((v8 & 0x380700000) != 0)
        {
          v57 = i;
          v10 = (void *)objc_opt_new();
          v73 = 0u;
          v74 = 0u;
          v75 = 0u;
          v76 = 0u;
          objc_msgSend(obj, "objectForKeyedSubscript:", v60);
          v62 = (id)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v73, v88, 16);
          v59 = v10;
          if (v11)
          {
            v12 = v11;
            v64 = *(_QWORD *)v74;
            do
            {
              v13 = 0;
              v61 = v12;
              do
              {
                if (*(_QWORD *)v74 != v64)
                  objc_enumerationMutation(v62);
                v14 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * v13);
                __atxlog_handle_blending();
                v15 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v14, "uiSpecification");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "title");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  *(_QWORD *)v84 = v60;
                  *(_WORD *)&v84[8] = 2112;
                  *(_QWORD *)v85 = v17;
                  _os_log_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_DEFAULT, "SLS: _collectionsWithSuggestions suggestionDict[%@] =[%@]", buf, 0x16u);

                }
                objc_msgSend(v14, "uiSpecification");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = objc_msgSend(v18, "predictionReasons") & 0x700000;

                objc_msgSend(v14, "uiSpecification");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = objc_msgSend(v20, "predictionReasons") & 0x380000000;

                objc_msgSend(v14, "atxActionCriteria");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "uiSpecification");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "reason");
                v24 = (void *)objc_claimAutoreleasedReturnValue();

                __atxlog_handle_blending();
                v25 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                {
                  v26 = objc_msgSend(v24, "hash");
                  -[ATXSpotlightLayoutSelector _intervalStringWithCriteria:](self, "_intervalStringWithCriteria:", v22);
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 67109890;
                  *(_DWORD *)v84 = v19 != 0;
                  v10 = v59;
                  *(_WORD *)&v84[4] = 1024;
                  *(_DWORD *)&v84[6] = v21 != 0;
                  *(_WORD *)v85 = 2048;
                  *(_QWORD *)&v85[2] = v26;
                  v86 = 2112;
                  v87 = v27;
                  _os_log_impl(&dword_1C9A3B000, v25, OS_LOG_TYPE_DEFAULT, "SLS: isSuggestionEventContext: %{BOOL}i isSuggestionFlightContext: %{BOOL}i  reason.hash=[%lu] criteria[%@]", buf, 0x22u);

                  v12 = v61;
                }

                if (objc_msgSend(v24, "length") && v19 | v21)
                  objc_msgSend(v10, "setObject:forKeyedSubscript:", v22, v24);

                ++v13;
              }
              while (v12 != v13);
              v12 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v73, v88, 16);
            }
            while (v12);
          }

          __atxlog_handle_blending();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            v29 = objc_msgSend(v10, "count");
            *(_DWORD *)buf = v53;
            *(_QWORD *)v84 = v29;
            _os_log_impl(&dword_1C9A3B000, v28, OS_LOG_TYPE_DEFAULT, "SLS: _cleanUpCollections %lu contexts", buf, 0xCu);
          }

          if ((unint64_t)objc_msgSend(v10, "count") >= 2)
          {
            v71 = 0u;
            v72 = 0u;
            v69 = 0u;
            v70 = 0u;
            v30 = v10;
            v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
            if (v31)
            {
              v32 = v31;
              v33 = *(_QWORD *)v70;
              do
              {
                for (j = 0; j != v32; ++j)
                {
                  if (*(_QWORD *)v70 != v33)
                    objc_enumerationMutation(v30);
                  v35 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * j);
                  __atxlog_handle_blending();
                  v36 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v30, "objectForKeyedSubscript:", v35);
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    -[ATXSpotlightLayoutSelector _intervalStringWithCriteria:](self, "_intervalStringWithCriteria:", v37);
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    *(_QWORD *)v84 = v35;
                    *(_WORD *)&v84[8] = 2112;
                    *(_QWORD *)v85 = v38;
                    _os_log_impl(&dword_1C9A3B000, v36, OS_LOG_TYPE_DEFAULT, "SLS: context=[%@] criteria[%@]", buf, 0x16u);

                  }
                }
                v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
              }
              while (v32);
            }

            -[ATXSpotlightLayoutSelector _preferredContextWithContextCode:contextCriteria:](self, "_preferredContextWithContextCode:contextCriteria:", v60, v30);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = (void *)objc_opt_new();
            v65 = 0u;
            v66 = 0u;
            v67 = 0u;
            v68 = 0u;
            objc_msgSend(obj, "objectForKeyedSubscript:", v60);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v65, v81, 16);
            if (v42)
            {
              v43 = v42;
              v44 = *(_QWORD *)v66;
              do
              {
                for (k = 0; k != v43; ++k)
                {
                  if (*(_QWORD *)v66 != v44)
                    objc_enumerationMutation(v41);
                  v46 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * k);
                  objc_msgSend(v46, "uiSpecification");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v47, "reason");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  v49 = objc_msgSend(v39, "isEqualToString:", v48);

                  if ((v49 & 1) == 0)
                    objc_msgSend(v40, "addObject:", v46);
                }
                v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v65, v81, 16);
              }
              while (v43);
            }

            objc_msgSend(obj, "objectForKeyedSubscript:", v60);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "removeObjectsInArray:", v40);

            objc_msgSend(v54, "removeObjectsInArray:", v40);
            v10 = v59;
          }

          i = v57;
        }
      }
      v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
    }
    while (v56);
  }

  v51 = (void *)objc_msgSend(v54, "copy");
  return v51;
}

- (id)_preferredContextWithContextCode:(id)a3 contextCriteria:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  id v49;
  id v50;
  NSObject *v51;
  void *v52;
  ATXSpotlightLayoutSelector *v54;
  id v55;
  id v56;
  NSObject *obj;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint8_t buf[4];
  void *v72;
  __int16 v73;
  void *v74;
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "integerValue");
  v9 = v8;
  if (v8 > 0x21)
    goto LABEL_41;
  if (((1 << v8) & 0x80100000) != 0)
  {
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    obj = v7;
    v24 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
    if (v24)
    {
      v54 = self;
      v55 = v7;
      v56 = v6;
      v58 = 0;
      v12 = 0;
      v25 = *(_QWORD *)v68;
      v26 = v24;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v68 != v25)
            objc_enumerationMutation(obj);
          v28 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
          -[NSObject objectForKeyedSubscript:](obj, "objectForKeyedSubscript:", v28, v54, v55, v56);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v12)
            goto LABEL_25;
          objc_msgSend(v58, "endDate");
          v30 = objc_claimAutoreleasedReturnValue();
          if (v30)
          {
            v31 = (void *)v30;
            objc_msgSend(v29, "startDate");
            v32 = v26;
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "startDate");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v33, "compare:", v34);

            v26 = v32;
            if (v35 == -1)
            {
LABEL_25:
              v36 = v28;

              v37 = v29;
              v58 = v37;
              v12 = v36;
            }
          }

        }
        v26 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
      }
      while (v26);
      goto LABEL_40;
    }
    goto LABEL_43;
  }
  if (((1 << v8) & 0x100200000) == 0)
  {
    if (((1 << v8) & 0x200400000) != 0)
    {
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      obj = v7;
      v10 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v63, v76, 16);
      if (v10)
      {
        v11 = v10;
        v54 = self;
        v55 = v7;
        v56 = v6;
        v58 = 0;
        v12 = 0;
        v13 = *(_QWORD *)v64;
        do
        {
          for (j = 0; j != v11; ++j)
          {
            if (*(_QWORD *)v64 != v13)
              objc_enumerationMutation(obj);
            v15 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * j);
            -[NSObject objectForKeyedSubscript:](obj, "objectForKeyedSubscript:", v15, v54, v55, v56);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v12)
              goto LABEL_13;
            objc_msgSend(v58, "endDate");
            v17 = objc_claimAutoreleasedReturnValue();
            if (v17)
            {
              v18 = (void *)v17;
              objc_msgSend(v16, "endDate");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "endDate");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = objc_msgSend(v19, "compare:", v20);

              if (v21 == 1)
              {
LABEL_13:
                v22 = v15;

                v23 = v16;
                v58 = v23;
                v12 = v22;
              }
            }

          }
          v11 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v63, v76, 16);
        }
        while (v11);
LABEL_40:
        v7 = v55;
        v6 = v56;
        self = v54;
        goto LABEL_44;
      }
      goto LABEL_43;
    }
LABEL_41:
    __atxlog_handle_blending();
    obj = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_FAULT))
      -[ATXSpotlightLayoutSelector _preferredContextWithContextCode:contextCriteria:].cold.1(v9, obj);
    goto LABEL_43;
  }
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  obj = v7;
  v38 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v59, v75, 16);
  if (v38)
  {
    v39 = v38;
    v54 = self;
    v55 = v7;
    v56 = v6;
    v58 = 0;
    v12 = 0;
    v40 = *(_QWORD *)v60;
    do
    {
      for (k = 0; k != v39; ++k)
      {
        if (*(_QWORD *)v60 != v40)
          objc_enumerationMutation(obj);
        v42 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * k);
        -[NSObject objectForKeyedSubscript:](obj, "objectForKeyedSubscript:", v42, v54, v55, v56);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
          goto LABEL_37;
        objc_msgSend(v58, "endDate");
        v44 = objc_claimAutoreleasedReturnValue();
        if (v44)
        {
          v45 = (void *)v44;
          objc_msgSend(v43, "endDate");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "endDate");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v46, "compare:", v47);

          if (v48 == 1)
          {
LABEL_37:
            v49 = v42;

            v50 = v43;
            v58 = v50;
            v12 = v49;
          }
        }

      }
      v39 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v59, v75, 16);
    }
    while (v39);
    goto LABEL_40;
  }
LABEL_43:
  v58 = 0;
  v12 = 0;
LABEL_44:

  __atxlog_handle_blending();
  v51 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    -[ATXSpotlightLayoutSelector _intervalStringWithCriteria:](self, "_intervalStringWithCriteria:", v58);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v72 = v12;
    v73 = 2112;
    v74 = v52;
    _os_log_impl(&dword_1C9A3B000, v51, OS_LOG_TYPE_DEFAULT, "SLS: preferredContext=[%@] preferredCriteria[%@]", buf, 0x16u);

  }
  return v12;
}

- (id)_intervalStringWithCriteria:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "startDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0CB3578];
      objc_msgSend(v4, "startDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringFromDate:dateStyle:timeStyle:", v7, 0, 1);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = CFSTR("no-date");
    }

    objc_msgSend(v4, "endDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)MEMORY[0x1E0CB3578];
      objc_msgSend(v4, "endDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringFromDate:dateStyle:timeStyle:", v12, 0, 1);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = CFSTR("no-date");
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v8, v13);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = CFSTR("no-criteria");
  }

  return v9;
}

- (id)_scoresFlattenForCollections:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id obj;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v7 = v6;
    v18 = *(_QWORD *)v24;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v8);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        objc_msgSend(v9, "suggestions");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v20;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v20 != v13)
                objc_enumerationMutation(v10);
              -[ATXSpotlightLayoutSelector _adaptedScoreForSuggestion:](self, "_adaptedScoreForSuggestion:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v14));
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "addObject:", v15);

              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v7);
  }

  return v5;
}

- (void)_dedupeSuggestions:(id)a3 suggestionDict:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  ATXSpotlightLayoutSelector *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  id v45;
  void *v46;
  id v47;
  uint64_t v48;
  id obj;
  uint64_t v50;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[5];
  id v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t v67[128];
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  uint64_t v71;
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v47 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v64;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v64 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
        objc_msgSend(v11, "uiSpecification");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "title");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v13, "length"))
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            v15 = v14;
            objc_msgSend(v14, "addObject:", v11);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v11);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, v13);
          }

        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
    }
    while (v8);
  }

  v16 = self;
  -[ATXSpotlightLayoutSelector _rankedReasonCodes](self, "_rankedReasonCodes");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v17 = v6;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v60;
    v44 = *(_QWORD *)v60;
    v45 = v17;
    do
    {
      v21 = 0;
      v48 = v19;
      do
      {
        if (*(_QWORD *)v60 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v21);
        __atxlog_handle_blending();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v17, "objectForKeyedSubscript:", v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "count");
          *(_DWORD *)buf = 138412546;
          v69 = v22;
          v70 = 2048;
          v71 = v25;
          _os_log_impl(&dword_1C9A3B000, v23, OS_LOG_TYPE_DEFAULT, "SLS: _collectionsWithSuggestions dedupSuggestionTable[%@] : %ld", buf, 0x16u);

        }
        objc_msgSend(v17, "objectForKeyedSubscript:", v22);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "count");

        if (v27 >= 2)
        {
          v50 = v21;
          objc_msgSend(v17, "objectForKeyedSubscript:", v22);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (void *)objc_msgSend(v28, "mutableCopy");

          v56[0] = MEMORY[0x1E0C809B0];
          v56[1] = 3221225472;
          v56[2] = __64__ATXSpotlightLayoutSelector__dedupeSuggestions_suggestionDict___block_invoke;
          v56[3] = &unk_1E82EA130;
          v56[4] = v16;
          v30 = v47;
          v57 = v30;
          v58 = v46;
          objc_msgSend(v29, "sortUsingComparator:", v56);
          objc_msgSend(v29, "removeLastObject");
          v54 = 0u;
          v55 = 0u;
          v52 = 0u;
          v53 = 0u;
          v31 = v29;
          v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v52, v67, 16);
          if (v32)
          {
            v33 = v32;
            v34 = *(_QWORD *)v53;
            do
            {
              for (j = 0; j != v33; ++j)
              {
                if (*(_QWORD *)v53 != v34)
                  objc_enumerationMutation(v31);
                v36 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * j);
                objc_msgSend(v36, "uiSpecification", v44, v45);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = -[ATXSpotlightLayoutSelector _contextReasonCodeWithPredictionReasons:](v16, "_contextReasonCodeWithPredictionReasons:", objc_msgSend(v37, "predictionReasons"));

                __atxlog_handle_blending();
                v39 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v36, "uiSpecification");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v40, "title");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v69 = v41;
                  v70 = 2048;
                  v71 = v38;

                  v16 = self;
                }

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v38);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "objectForKeyedSubscript:", v42);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "removeObject:", v36);

              }
              v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v52, v67, 16);
            }
            while (v33);
          }

          v20 = v44;
          v17 = v45;
          v19 = v48;
          v21 = v50;
        }
        ++v21;
      }
      while (v21 != v19);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
    }
    while (v19);
  }

}

uint64_t __64__ATXSpotlightLayoutSelector__dedupeSuggestions_suggestionDict___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;

  v5 = (void *)a1[4];
  v6 = a3;
  objc_msgSend(a2, "uiSpecification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "_contextReasonCodeWithPredictionReasons:", objc_msgSend(v7, "predictionReasons"));

  v9 = (void *)a1[4];
  objc_msgSend(v6, "uiSpecification");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v9, "_contextReasonCodeWithPredictionReasons:", objc_msgSend(v10, "predictionReasons"));
  v12 = (void *)a1[5];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  v16 = (void *)a1[5];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "compare:", v21);

  if (v22)
    return v22;
  v24 = (void *)a1[6];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v24, "indexOfObject:", v25);

  v27 = (void *)a1[6];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v27, "indexOfObject:", v28);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v26);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v30, "compare:", v31);

  return v32;
}

- (id)_createTopAppShortcutSuggestions
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  NSObject *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CF8D28], "clientForConsumerType:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "appPredictionsForConsumerSubType:blackList:limit:runningDiagnostics:", 9, v4, 8, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(MEMORY[0x1E0D44140]);
  objc_msgSend(v5, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    __atxlog_handle_blending();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "error");
      v9 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v9;
      _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "SLS: [AppShortcut] ATXResponse error: %@", buf, 0xCu);

    }
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v5, "predictedApps");
    v8 = objc_claimAutoreleasedReturnValue();
    __atxlog_handle_blending();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v8;
      _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, "SLS: [AppShortcut] Query top apps for auto shortcuts: %@", buf, 0xCu);
    }

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __62__ATXSpotlightLayoutSelector__createTopAppShortcutSuggestions__block_invoke;
    v13[3] = &unk_1E82EA158;
    v13[4] = self;
    v14 = v6;
    -[NSObject _pas_mappedArrayWithTransform:](v8, "_pas_mappedArrayWithTransform:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

id __62__ATXSpotlightLayoutSelector__createTopAppShortcutSuggestions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(*(id *)(a1 + 32), "_validAutoShortcutContextualActionsForBundleId:limit:provider:", v3, 1, *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v4);
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x1CAA48B6C]();
    objc_msgSend(*(id *)(a1 + 32), "_titleForParameterizedAutoShortcutContextualAction:provider:", v6, *(_QWORD *)(a1 + 40));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 32), "_suggestionFromAutoShortcutContextualAction:title:predictionReasons:", v6, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_blending();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "autoShortcut");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedAutoShortcutDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412802;
      v15 = v3;
      v16 = 2112;
      v17 = v12;
      v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_DEFAULT, "SLS: [AppShortcut] Created auto shortcut for bundle: %@ [%@] suggestion: %@", (uint8_t *)&v14, 0x20u);

    }
  }
  else
  {
    __atxlog_handle_blending();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v3;
      _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "SLS: [AppShortcut] No valid auto shortcuts found for bundle: %@", (uint8_t *)&v14, 0xCu);
    }
    v9 = 0;
  }

  return v9;
}

- (id)_createTopAppShortcutCollectionsWithSuggestions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[ATXSpotlightContextAdapter topAutoShortcutSectionIdentifier](self->_adapter, "topAutoShortcutSectionIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811F0]), "initWithSuggestions:contextTitle:sectionIdentifier:", v4, 0, v5);
    v9[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v7;
}

- (id)_titleForContextCode:(int64_t)a3 suggestions:(id)a4
{
  id v6;
  char *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  char *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  char v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  char *v34;
  id v35;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  int64_t v45;
  __int16 v46;
  int64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  stringForATXSuggestionPredictionReasonCode();
  v7 = (char *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_blending();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v43 = v7;
    v44 = 2048;
    v45 = a3;
    _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "SLS: ATXSpotlightLayoutSelector Section title requested for %@, code: %lu", buf, 0x16u);
  }

  if (-[ATXSpotlightLayoutSelector _hasNilTitleForContextCode:](self, "_hasNilTitleForContextCode:", a3))
  {
    __atxlog_handle_blending();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v43 = v7;
      v44 = 2048;
      v45 = a3;
      _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_DEFAULT, "SLS: ATXSpotlightLayoutSelector Section title is nil for %@, code: %lu", buf, 0x16u);
    }
    v10 = 0;
    goto LABEL_35;
  }
  -[ATXSpotlightLayoutSelector _staticTitleForContextCode:](self, "_staticTitleForContextCode:", a3);
  v9 = objc_claimAutoreleasedReturnValue();
  __atxlog_handle_blending();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (!v9)
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412546;
      v43 = v7;
      v44 = 2048;
      v45 = a3;
      _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, "SLS: ATXSpotlightLayoutSelector Section title dynamic, calculating: %@, code: %lu", buf, 0x16u);
    }

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v13 = v6;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v14)
    {
      v15 = v14;
      obj = v13;
      v34 = v7;
      v35 = v6;
      v10 = 0;
      v16 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v38 != v16)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          stringForATXSuggestionPredictionReasonCode();
          v19 = (char *)objc_claimAutoreleasedReturnValue();
          __atxlog_handle_blending();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v18, "uiSpecification");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "reason");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "hash");
            *(_DWORD *)buf = 138412546;
            v43 = v19;
            v44 = 2048;
            v45 = v23;
            _os_log_impl(&dword_1C9A3B000, v20, OS_LOG_TYPE_DEFAULT, "SLS: reasonKey:%@ suggestion.uiSpecification.reason.hash = %lu", buf, 0x16u);

          }
          if (v10
            && (objc_msgSend(v18, "uiSpecification"),
                v24 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v24, "reason"),
                v25 = (void *)objc_claimAutoreleasedReturnValue(),
                v26 = objc_msgSend(v10, "isEqualToString:", v25),
                v25,
                v24,
                (v26 & 1) == 0))
          {
            __atxlog_handle_blending();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
            {
              objc_msgSend(v18, "uiSpecification");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "reason");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136446722;
              v43 = "-[ATXSpotlightLayoutSelector _titleForContextCode:suggestions:]";
              v44 = 2112;
              v45 = (int64_t)v10;
              v46 = 2112;
              v47 = (int64_t)v30;
              _os_log_fault_impl(&dword_1C9A3B000, v27, OS_LOG_TYPE_FAULT, "SLS: %{public}s %@ and %@ are two different suggestion reason for the same context. The resulting title might be wrong", buf, 0x20u);

            }
          }
          else
          {
            objc_msgSend(v18, "uiSpecification");
            v27 = objc_claimAutoreleasedReturnValue();
            -[NSObject reason](v27, "reason");
            v28 = objc_claimAutoreleasedReturnValue();

            v10 = (void *)v28;
          }

        }
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v15);

      v7 = v34;
      v6 = v35;
      v9 = 0;
      if (v10)
      {
        __atxlog_handle_blending();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v32 = objc_msgSend(v10, "hash");
          *(_DWORD *)buf = 134218498;
          v43 = (const char *)v32;
          v44 = 2112;
          v45 = (int64_t)v34;
          v46 = 2048;
          v47 = a3;
          _os_log_impl(&dword_1C9A3B000, v31, OS_LOG_TYPE_DEFAULT, "SLS: ATXSpotlightLayoutSelector Section title is dynamic [%lu] for %@, code: %lu", buf, 0x20u);
        }
LABEL_34:

        goto LABEL_35;
      }
    }
    else
    {

    }
    __atxlog_handle_blending();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[ATXSpotlightLayoutSelector _titleForContextCode:suggestions:].cold.1();
    v10 = 0;
    goto LABEL_34;
  }
  if (v12)
  {
    *(_DWORD *)buf = 138412802;
    v43 = (const char *)v9;
    v44 = 2112;
    v45 = (int64_t)v7;
    v46 = 2048;
    v47 = a3;
    _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, "SLS: ATXSpotlightLayoutSelector Section title is static[%@] for %@, code: %lu", buf, 0x20u);
  }

  v9 = v9;
  v10 = v9;
LABEL_35:

  return v10;
}

- (id)_staticTitleForContextCode:(int64_t)a3
{
  void *v4;
  void *v5;
  __CFString *v6;
  const __CFString *v7;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = 0;
  switch(a3)
  {
    case 19:
      v7 = CFSTR("CONTEXT_TITLE_ONGOING_CALL");
      goto LABEL_16;
    case 23:
      v7 = CFSTR("CONTEXT_TITLE_NEARBY");
      goto LABEL_16;
    case 25:
      v7 = CFSTR("CONTEXT_TITLE_FROM_CLIPBOARD");
      goto LABEL_16;
    case 26:
      v7 = CFSTR("CONTEXT_TITLE_TRACKING_NUMBER_FROM_CLIPBOARD");
      goto LABEL_16;
    case 27:
      v7 = CFSTR("CONTEXT_TITLE_URL_FROM_CLIPBOARD");
      goto LABEL_16;
    case 28:
      v7 = CFSTR("CONTEXT_TITLE_PHONE_NUMBER_FROM_CLIPBOARD");
      goto LABEL_16;
    case 34:
      v7 = CFSTR("CONTEXT_TITLE_UPCOMING_MEDIA");
      goto LABEL_16;
    case 36:
      v7 = CFSTR("CONTEXT_TITLE_UPCOMING_TO_WORK_COMMUTE");
      goto LABEL_16;
    case 37:
      v7 = CFSTR("CONTEXT_TITLE_UPCOMING_FROM_WORK_COMMUTE");
      goto LABEL_16;
    case 38:
      v7 = CFSTR("CONTEXT_TITLE_UNUSUAL_EARLY_EVENT");
      goto LABEL_16;
    case 39:
      v6 = CFSTR("Debug");
      break;
    case 40:
      v7 = CFSTR("CONTEXT_TITLE_GOOD_MORNING");
      goto LABEL_16;
    case 41:
      v7 = CFSTR("CONTEXT_TITLE_WIND_DOWN");
      goto LABEL_16;
    case 42:
      v7 = CFSTR("CONTEXT_TITLE_SPORTS");
LABEL_16:
      objc_msgSend(v4, "localizedStringForKey:value:table:", v7, &stru_1E82FDC98, 0);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      break;
  }

  return v6;
}

- (BOOL)_hasNilTitleForContextCode:(int64_t)a3
{
  return ((unint64_t)a3 < 0x24) & (0x841000000uLL >> a3);
}

- (int64_t)_contextReasonCodeWithPredictionReasons:(unint64_t)a3
{
  int64_t v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  -[ATXSpotlightLayoutSelector _supportedContextReasons](self, "_supportedContextReasons");
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  ATXSuggestionPredictionReasonEnumerateReasonCodes();
  v3 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v3;
}

uint64_t __70__ATXSpotlightLayoutSelector__contextReasonCodeWithPredictionReasons___block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)_insertMediaSuggestion:(id)a3 consumerSubType:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  char isKindOfClass;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  int v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  id v49;
  void *v50;
  id obj;
  uint64_t v52;
  uint64_t v53;
  id v54;
  int v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  Boolean keyExistsAndHasValidFormat[4];
  _BYTE v61[18];
  _BYTE v62[128];
  uint64_t v63;

  v4 = a4;
  v63 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  keyExistsAndHasValidFormat[0] = 0;
  if (CFPreferencesGetAppBooleanValue(CFSTR("zkwHideOftenPlayed"), (CFStringRef)*MEMORY[0x1E0CF9510], keyExistsAndHasValidFormat))
  {
    __atxlog_handle_ui();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)keyExistsAndHasValidFormat = 0;
      _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "Debug: Don't suggest Upcoming media suggestion (Often played at this time)", keyExistsAndHasValidFormat, 2u);
    }

    v54 = v6;
  }
  else
  {
    v54 = (id)objc_opt_new();
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v49 = v6;
    obj = v6;
    v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
    if (v53)
    {
      v55 = 0;
      v8 = 0;
      v52 = *(_QWORD *)v57;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v57 != v52)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v9);
          v11 = v4;
          v12 = -[ATXUniversalBlendingLayerHyperParametersProtocol uiSupportsSuggestion:consumerSubType:](self->_hyperParameters, "uiSupportsSuggestion:consumerSubType:", v10, v4);
          objc_msgSend(v10, "uiSpecification");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = -[ATXSpotlightLayoutSelector _isValidForReasons:](self, "_isValidForReasons:", objc_msgSend(v13, "predictionReasons"));

          v15 = (void *)MEMORY[0x1E0D81198];
          objc_msgSend(v10, "clientModelSpecification");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "clientModelId");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v15, "clientModelTypeFromClientModelId:", v17);

          v19 = v12 ^ 1;
          if (v8)
            v19 = 1;
          if (!v19)
            v8 = 0;
          if ((v19 & 1) != 0 || v14)
          {
            v4 = v11;
          }
          else
          {
            objc_msgSend(v10, "atxActionExecutableObject");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "intent");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v21)
              goto LABEL_34;

            if (v18 != 1 && v55 > 2)
              goto LABEL_34;
            __atxlog_handle_blending();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v10, "uiSpecification");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "title");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "intent");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_opt_class();
              *(_DWORD *)keyExistsAndHasValidFormat = 138412546;
              *(_QWORD *)v61 = v24;
              *(_WORD *)&v61[8] = 2112;
              *(_QWORD *)&v61[10] = v26;
              _os_log_impl(&dword_1C9A3B000, v22, OS_LOG_TYPE_DEFAULT, "SLS: Checking suggestion '%@' for media intent. Intent of class%@", keyExistsAndHasValidFormat, 0x16u);

            }
            objc_msgSend(v20, "intent");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) != 0)
            {
              __atxlog_handle_blending();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)keyExistsAndHasValidFormat = 67109378;
                *(_DWORD *)v61 = v55;
                *(_WORD *)&v61[4] = 2112;
                *(_QWORD *)&v61[6] = v10;
                _os_log_impl(&dword_1C9A3B000, v29, OS_LOG_TYPE_DEFAULT, "SLS: Found media suggestion [%i]\n%@", keyExistsAndHasValidFormat, 0x12u);
              }

              objc_msgSend(MEMORY[0x1E0CF4F48], "suggestionWithAction:predictionReasons:localizedReason:score:dateInterval:", v20, 0x400000000, 0, 0, 20.0);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "executableSpecification");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "executableIdentifier");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v50 = v30;
              objc_msgSend(v30, "executableSpecification");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "executableIdentifier");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = objc_msgSend(v32, "isEqualToString:", v34);

              if ((v35 & 1) == 0)
              {
                __atxlog_handle_blending();
                v36 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
                {
                  objc_msgSend(v10, "executableSpecification");
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v43, "executableIdentifier");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v50, "executableSpecification");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v45, "executableIdentifier");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)keyExistsAndHasValidFormat = 138412546;
                  *(_QWORD *)v61 = v44;
                  *(_WORD *)&v61[8] = 2112;
                  *(_QWORD *)&v61[10] = v46;
                  _os_log_fault_impl(&dword_1C9A3B000, v36, OS_LOG_TYPE_FAULT, "SLS: [Upcoming Media] Replicated suggestion does not have the same exec identifier %@ -> %@", keyExistsAndHasValidFormat, 0x16u);

                }
              }
              objc_msgSend(v20, "routeInfo");
              v37 = objc_claimAutoreleasedReturnValue();
              if (v37
                && (v38 = (void *)v37,
                    objc_msgSend(v20, "routeInfo"),
                    v39 = (void *)objc_claimAutoreleasedReturnValue(),
                    v40 = objc_msgSend(v39, "isExternalRoute"),
                    v39,
                    v38,
                    v40))
              {
                __atxlog_handle_blending();
                v41 = objc_claimAutoreleasedReturnValue();
                v4 = v11;
                if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)keyExistsAndHasValidFormat = 0;
                  _os_log_impl(&dword_1C9A3B000, v41, OS_LOG_TYPE_DEFAULT, "SLS: [Upcoming Media] Media suggestion is external route (Airplay). Skipping suggestion", keyExistsAndHasValidFormat, 2u);
                }

                v8 = 0;
                v42 = v50;
              }
              else
              {
                v8 = v20;
                v42 = v50;
                objc_msgSend(v54, "addObject:", v50);
                v4 = v11;
              }

            }
            else
            {
LABEL_34:
              v8 = 0;
              v4 = v11;
            }
            ++v55;

          }
          objc_msgSend(v54, "addObject:", v10);
          ++v9;
        }
        while (v53 != v9);
        v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
        v53 = v47;
      }
      while (v47);
    }
    else
    {
      v8 = 0;
    }

    v6 = v49;
  }

  return v54;
}

+ (BOOL)_isCommuteWildCardSuggestion:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = a3;
  objc_msgSend(v3, "uiSpecification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "predictionReasons");

  objc_msgSend(v3, "uiSpecification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "predictionReasons");

  v8 = (void *)MEMORY[0x1E0D81198];
  objc_msgSend(v3, "clientModelSpecification");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "clientModelId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "clientModelTypeFromClientModelId:", v10);

  return v11 == 1 && (v5 & 0x1000000000 | v7 & 0x2000000000) != 0;
}

+ (BOOL)_isCommuteMediaSuggestion:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char isKindOfClass;

  v3 = a3;
  objc_msgSend(v3, "uiSpecification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "predictionReasons");

  objc_msgSend(v3, "uiSpecification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "predictionReasons");

  objc_msgSend(v3, "atxActionExecutableObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "intent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) != 0 && (v5 & 0x1000000000 | v7 & 0x2000000000) != 0;
}

+ (id)_commuteWildcardReducer:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  NSObject *v21;
  const char *v22;
  uint64_t v24;
  id obj;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[16];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26 = (id)objc_opt_new();
  __atxlog_handle_blending();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "SLS: [Wildcard] considering commute wildcard suggestions", buf, 2u);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v28;
    v24 = 1;
    v9 = 1;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (!objc_msgSend(a1, "_isCommuteMediaSuggestion:", v11))
        {
          if (!objc_msgSend(a1, "_isCommuteWildCardSuggestion:", v11))
          {
            objc_msgSend(v26, "addObject:", v11);
            continue;
          }
          if (v24 < 1)
          {
            __atxlog_handle_blending();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              v18 = v17;
              v19 = "SLS: [Wildcard] skipping other from anchor";
LABEL_23:
              _os_log_impl(&dword_1C9A3B000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 2u);
            }
          }
          else
          {
            objc_msgSend(v26, "addObject:", v11);
            __atxlog_handle_blending();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              v18 = v17;
              v19 = "SLS: [Wildcard] including wildcard from anchor";
              goto LABEL_23;
            }
          }

          v24 = 0;
          continue;
        }
        objc_msgSend(v11, "atxActionExecutableObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "intent");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "launchId");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.tv"));

        if (!v15)
        {
          if (v9 < 1)
          {
            __atxlog_handle_blending();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              v21 = v20;
              v22 = "SLS: [Wildcard] skipping media for commute";
LABEL_27:
              _os_log_impl(&dword_1C9A3B000, v21, OS_LOG_TYPE_DEFAULT, v22, buf, 2u);
            }
          }
          else
          {
            objc_msgSend(v26, "addObject:", v11);
            __atxlog_handle_blending();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              v21 = v20;
              v22 = "SLS: [Wildcard] including media for commute ";
              goto LABEL_27;
            }
          }

          v9 = 0;
          continue;
        }
        __atxlog_handle_blending();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C9A3B000, v16, OS_LOG_TYPE_DEFAULT, "SLS: [Wildcard] skipping media video", buf, 2u);
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v7);
  }

  return v26;
}

- (id)_heroDataReducer:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  __int128 v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  ATXSpotlightLayoutSelector *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  __int128 v40;
  void *v41;
  id v42;
  ATXSpotlightLayoutSelector *v43;
  uint64_t v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  unint64_t v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  uint64_t v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v47 = (void *)objc_opt_new();
  v48 = (void *)objc_opt_new();
  v5 = objc_alloc_init(MEMORY[0x1E0D44140]);
  v6 = (void *)objc_opt_new();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v7 = v4;
  v50 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
  if (v50)
  {
    v9 = 0;
    v10 = *(_QWORD *)v52;
    *(_QWORD *)&v8 = 138412290;
    v40 = v8;
    v42 = v7;
    v43 = self;
    v45 = v6;
    v46 = v5;
    v44 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v50; ++i)
      {
        if (*(_QWORD *)v52 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        objc_msgSend(v12, "uiSpecification", v40);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "allowedOnSpotlight");

        if ((v14 & 1) != 0)
        {
          -[ATXSpotlightLayoutSelector _poiMUIDFromHero:](self, "_poiMUIDFromHero:", v12);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            -[ATXSpotlightLayoutSelector _createPOISuggestionWithMUID:fromHeroSuggestion:](self, "_createPOISuggestionWithMUID:fromHeroSuggestion:", v15, v12);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            __atxlog_handle_blending();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              v18 = objc_msgSend(v15, "unsignedLongLongValue");
              *(_DWORD *)buf = 134218498;
              v56 = v18;
              v57 = 2112;
              v58 = v16;
              v59 = 2112;
              v60 = v12;
              _os_log_impl(&dword_1C9A3B000, v17, OS_LOG_TYPE_DEFAULT, "_heroDataReducer: Created POI [%llu] suggestion: %@, from hero suggestion: %@", buf, 0x20u);
            }

            objc_msgSend(v16, "clientModelSpecification");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "clientModelId");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v47, "objectForKeyedSubscript:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v21)
            {
              v22 = (void *)objc_opt_new();
              objc_msgSend(v47, "setObject:forKeyedSubscript:", v22, v20);

            }
            objc_msgSend(v47, "objectForKeyedSubscript:", v20);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "addObject:", v16);

            objc_msgSend(v6, "addObject:", v16);
            ++v9;
            objc_msgSend(v48, "addObject:", v12);

          }
          objc_msgSend(v6, "addObject:", v12);
          v49 = v9;
          if (v9 >= 2)
          {
            objc_msgSend(v6, "removeObjectsInArray:", v48);
            v24 = objc_opt_new();

            v48 = (void *)v24;
          }
          objc_msgSend(v12, "bundleIdExecutableObject");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 23);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
          {
            objc_msgSend(v12, "clientModelSpecification");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "clientModelId");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "isEqual:", v26);

            if (v29)
            {
              v30 = (void *)MEMORY[0x1CAA48B6C]();
              -[ATXSpotlightLayoutSelector _validAutoShortcutContextualActionsForBundleId:limit:provider:](self, "_validAutoShortcutContextualActionsForBundleId:limit:provider:", v25, 1, v46);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_autoreleasePoolPop(v30);
              objc_msgSend(v31, "firstObject");
              v32 = self;
              v33 = (void *)objc_claimAutoreleasedReturnValue();

              if (v33)
              {
                v34 = (void *)MEMORY[0x1CAA48B6C]();
                -[ATXSpotlightLayoutSelector _titleForParameterizedAutoShortcutContextualAction:provider:](v32, "_titleForParameterizedAutoShortcutContextualAction:provider:", v33, v46);
                v35 = objc_claimAutoreleasedReturnValue();
                objc_autoreleasePoolPop(v34);
                -[ATXSpotlightLayoutSelector _suggestionFromAutoShortcutContextualAction:title:predictionReasons:](v32, "_suggestionFromAutoShortcutContextualAction:title:predictionReasons:", v33, v35, 0x800000);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                __atxlog_handle_blending();
                v37 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v33, "autoShortcut");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v41, "localizedAutoShortcutDescription");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138413058;
                  v56 = (uint64_t)v25;
                  v57 = 2112;
                  v58 = v38;
                  v59 = 2112;
                  v60 = v36;
                  v61 = 2112;
                  v62 = v12;
                  _os_log_impl(&dword_1C9A3B000, v37, OS_LOG_TYPE_DEFAULT, "_heroDataReducer: Created auto shortcut for bundle: %@ [%@] suggestion: %@, from hero suggestion: %@", buf, 0x2Au);

                }
                if (v36)
                  objc_msgSend(v45, "addObject:", v36);

              }
              else
              {
                __atxlog_handle_blending();
                v35 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = v40;
                  v56 = (uint64_t)v25;
                  _os_log_impl(&dword_1C9A3B000, v35, OS_LOG_TYPE_DEFAULT, "_heroDataReducer: No auto shortcuts found for bundle: %@", buf, 0xCu);
                }
              }
              v7 = v42;

              self = v43;
            }
          }

          v6 = v45;
          v5 = v46;
          v9 = v49;
          v10 = v44;
        }
        else
        {
          objc_msgSend(v6, "addObject:", v12);
        }
      }
      v50 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
    }
    while (v50);
  }

  return v6;
}

- (id)_poiMUIDFromHero:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;

  objc_msgSend(a3, "appClipHeroAppPredictionExecutableObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "poiMuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(v4, "clipMetadata");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(v4, "clipMetadata");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "clipMapItemMUID");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        if (v5)
        {
          __atxlog_handle_hero();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
            -[ATXSpotlightLayoutSelector _poiMUIDFromHero:].cold.3(v5);
LABEL_15:

          goto LABEL_16;
        }
LABEL_12:
        __atxlog_handle_blending();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          -[ATXSpotlightLayoutSelector _poiMUIDFromHero:].cold.1(v9);
        v5 = 0;
        goto LABEL_15;
      }
    }
    __atxlog_handle_hero();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[ATXSpotlightLayoutSelector _poiMUIDFromHero:].cold.2(v5);

    if (!v5)
      goto LABEL_12;
  }
  else
  {
    v5 = 0;
  }
LABEL_16:

  return v5;
}

- (id)_createPOISuggestionWithMUID:(id)a3 fromHeroSuggestion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "appClipHeroAppPredictionExecutableObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleId");
  v8 = objc_claimAutoreleasedReturnValue();
  __atxlog_handle_blending();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend(v7, "adamId");
    objc_msgSend(v7, "bundleId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v5, "unsignedLongLongValue");
    objc_msgSend(v7, "clipMetadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "clipURLHash");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v35 = v10;
    v36 = 2112;
    v37 = v11;
    v38 = 2048;
    v39 = v12;
    v40 = 2112;
    v41 = v14;
    _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_DEFAULT, "_heroDataReducer: found POI adam: %lu, bundle: %@, muid: %llu, clipURLHash: %@, ", buf, 0x2Au);

  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF9108]), "initWithPOIName:muid:criteria:", v8, v5, 0);
  objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 44);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v5;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811A0]), "initWithClientModelId:clientModelVersion:engagementResetPolicy:", v31, CFSTR("1.0"), 1);
  v17 = objc_alloc(MEMORY[0x1E0D811A8]);
  objc_msgSend(v15, "actionDescription");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "actionIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v17, "initWithExecutableObject:executableDescription:executableIdentifier:suggestionExecutableType:", v15, v18, v19, 8);

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811B8]), "initWithApplicableSuggestionLayout:", 5);
  v33 = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v30) = 1;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811D0]), "initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:predictionReasons:", 0, 0, 0, v22, 0, 0, v30, 0x800000);
  objc_msgSend(v6, "scoreSpecification");
  v24 = v7;
  v25 = (void *)v8;
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = (void *)objc_msgSend(v26, "copy");
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81190]), "initWithClientModelSpecification:executableSpecification:uiSpecification:scoreSpecification:", v16, v20, v23, v27);

  return v28;
}

- (id)_validAutoShortcutContextualActionsForBundleId:(id)a3 limit:(unint64_t)a4 provider:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  id v30;
  NSObject *v31;
  NSObject *v33;
  id v34;
  id v35;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  id v43;
  uint8_t v44[128];
  uint8_t buf[4];
  id v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  NSObject *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  if ((objc_msgSend(MEMORY[0x1E0CF9110], "isAutoShortcutsEnabledForSpotlightForBundleId:", v7) & 1) != 0)
  {
    v34 = v8;
    -[ATXSpotlightLayoutSelector _autoShortcutsForBundleId:provider:](self, "_autoShortcutsForBundleId:provider:", v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    __atxlog_handle_blending();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412803;
      v46 = v7;
      v47 = 2048;
      v48 = -[NSObject count](v9, "count");
      v49 = 2117;
      v50 = v9;
      _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_INFO, "SLS: [AutoShortcut] list all for %@ [%lu] %{sensitive}@", buf, 0x20u);
    }

    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __92__ATXSpotlightLayoutSelector__validAutoShortcutContextualActionsForBundleId_limit_provider___block_invoke;
    v42[3] = &unk_1E82EA1A8;
    v35 = v7;
    v11 = v7;
    v43 = v11;
    v33 = v9;
    -[NSObject _pas_mappedArrayWithTransform:](v9, "_pas_mappedArrayWithTransform:", v42);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_pas_filteredArrayWithTest:", &__block_literal_global_157);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    obj = v13;
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v39;
LABEL_6:
      v18 = 0;
      while (1)
      {
        if (*(_QWORD *)v39 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v18);
        v20 = (void *)MEMORY[0x1E0CF9110];
        objc_msgSend(v19, "phrase");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "signature");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v20, "isAutoShortcutEnabledForSpotlightForBundleId:signature:", v11, v22);

        __atxlog_handle_blending();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = os_log_type_enabled(v24, OS_LOG_TYPE_INFO);
        if (v23)
        {
          if (v25)
          {
            objc_msgSend(v19, "autoShortcut");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138739971;
            v46 = v26;
            _os_log_impl(&dword_1C9A3B000, v24, OS_LOG_TYPE_INFO, "SLS: [AutoShortcut] enabled: %{sensitive}@", buf, 0xCu);

          }
          -[NSObject addObject:](v14, "addObject:", v19);
        }
        else
        {
          if (v25)
          {
            objc_msgSend(v19, "autoShortcut");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138739971;
            v46 = v27;
            _os_log_impl(&dword_1C9A3B000, v24, OS_LOG_TYPE_INFO, "SLS: [AutoShortcut] disabled: %{sensitive}@", buf, 0xCu);

          }
        }
        if (-[NSObject count](v14, "count") >= a4)
          break;
        if (v16 == ++v18)
        {
          v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
          if (v16)
            goto LABEL_6;
          break;
        }
      }
    }

    __atxlog_handle_blending();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = -[NSObject count](v14, "count");
      *(_DWORD *)buf = 138412803;
      v46 = v11;
      v47 = 2048;
      v48 = v29;
      v49 = 2117;
      v50 = v14;
      _os_log_impl(&dword_1C9A3B000, v28, OS_LOG_TYPE_DEFAULT, "SLS: [AutoShortcut] filtered for %@ [%lu] %{sensitive}@", buf, 0x20u);
    }

    v30 = -[NSObject copy](v14, "copy");
    v8 = v34;
    v7 = v35;
    v31 = v33;
  }
  else
  {
    __atxlog_handle_blending();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v46 = v7;
      _os_log_impl(&dword_1C9A3B000, v31, OS_LOG_TYPE_DEFAULT, "SLS: [AutoShortcut] Shortcuts setting off for bundle %@", buf, 0xCu);
    }
    v30 = (id)MEMORY[0x1E0C9AA60];
  }

  return v30;
}

id __92__ATXSpotlightLayoutSelector__validAutoShortcutContextualActionsForBundleId_limit_provider___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0DC79C0];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithAutoShortcut:bundleIdentifier:", v4, *(_QWORD *)(a1 + 32));

  return v5;
}

uint64_t __92__ATXSpotlightLayoutSelector__validAutoShortcutContextualActionsForBundleId_limit_provider___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x1E0DC79A8];
  objc_msgSend(a2, "autoShortcut");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "isAppShortcutDenyListed:inEnvironment:", v3, 2);

  return v2 ^ 1;
}

- (id)_autoShortcutsForBundleId:(id)a3 provider:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  dispatch_semaphore_t v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  _QWORD v18[4];
  id v19;
  NSObject *v20;
  __int128 *p_buf;
  uint8_t v22[4];
  id v23;
  __int16 v24;
  uint64_t v25;
  __int128 buf;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  __atxlog_handle_blending();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_DEFAULT, "SLS: [AutoShortcut] searching %@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__99;
  v29 = __Block_byref_object_dispose__99;
  v30 = objc_alloc_init(MEMORY[0x1E0C99D20]);
  v10 = dispatch_semaphore_create(0);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __65__ATXSpotlightLayoutSelector__autoShortcutsForBundleId_provider___block_invoke;
  v18[3] = &unk_1E82DDA78;
  v11 = v5;
  v19 = v11;
  p_buf = &buf;
  v12 = v10;
  v20 = v12;
  objc_msgSend(v6, "autoShortcutsForBundleIdentifier:localeIdentifier:completion:", v11, v8, v18);
  if (objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v12, 5.0) == 1)
  {
    __atxlog_handle_default();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ATXSpotlightLayoutSelector _autoShortcutsForBundleId:provider:].cold.1();

  }
  __atxlog_handle_blending();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    *(_DWORD *)v22 = 138412547;
    v23 = v11;
    v24 = 2117;
    v25 = v15;
    _os_log_impl(&dword_1C9A3B000, v14, OS_LOG_TYPE_DEFAULT, "SLS: [AutoShortcut] found for %@, %{sensitive}@", v22, 0x16u);
  }

  v16 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  return v16;
}

void __65__ATXSpotlightLayoutSelector__autoShortcutsForBundleId_provider___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    __atxlog_handle_default();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __65__ATXSpotlightLayoutSelector__autoShortcutsForBundleId_provider___block_invoke_cold_1(a1, (uint64_t)v7, v8);

  }
  else if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (id)_titleForParameterizedAutoShortcutContextualAction:(id)a3 provider:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "phrase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "parameterIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v29 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    objc_msgSend(v6, "propertiesForIdentifiers:error:", v9, &v28);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v28;

    if (v11)
    {
      __atxlog_handle_blending();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[ATXSpotlightLayoutSelector _titleForParameterizedAutoShortcutContextualAction:provider:].cold.1(v5, (uint64_t)v11, v12);
    }
    else
    {
      if (v10)
      {
        objc_msgSend(v10, "objectForKeyedSubscript:", v8);
        v16 = objc_claimAutoreleasedReturnValue();
        v12 = v16;
        if (v16)
        {
          -[NSObject value](v16, "value");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "displayRepresentation");
          v18 = objc_claimAutoreleasedReturnValue();

          -[NSObject title](v18, "title");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            -[NSObject title](v18, "title");
            v20 = objc_claimAutoreleasedReturnValue();
            -[NSObject atx_efficientLocalizedString](v20, "atx_efficientLocalizedString");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            __atxlog_handle_blending();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v5, "bundleIdentifier");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "actionIdentifier");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v31 = v25;
              v32 = 2112;
              v33 = v26;
              _os_log_impl(&dword_1C9A3B000, v20, OS_LOG_TYPE_DEFAULT, "SLS: [AutoShortcut] displayRepresentation or title nil for %@, %@", buf, 0x16u);

            }
            v13 = 0;
          }

        }
        else
        {
          __atxlog_handle_blending();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v5, "bundleIdentifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "actionIdentifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v31 = v23;
            v32 = 2112;
            v33 = v24;
            _os_log_impl(&dword_1C9A3B000, v18, OS_LOG_TYPE_DEFAULT, "SLS: [AutoShortcut] property nil for %@, %@", buf, 0x16u);

          }
          v13 = 0;
        }

        goto LABEL_23;
      }
      __atxlog_handle_blending();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "bundleIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "actionIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v31 = v21;
        v32 = 2112;
        v33 = v22;
        _os_log_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_DEFAULT, "SLS: [AutoShortcut] all properties nil for %@, %@", buf, 0x16u);

      }
    }
    v13 = 0;
LABEL_23:

    goto LABEL_24;
  }
  __atxlog_handle_blending();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "bundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "actionIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v31 = v14;
    v32 = 2112;
    v33 = v15;
    _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, "SLS: [AutoShortcut] not a phrase with parameters, use short title %@, %@", buf, 0x16u);

  }
  v13 = 0;
LABEL_24:

  return v13;
}

- (id)_suggestionFromAutoShortcutContextualAction:(id)a3 title:(id)a4 predictionReasons:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF90C0]), "initWithContextualAction:criteria:", v7, 0);
  if (!v8)
  {
    objc_msgSend(v7, "autoShortcut");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedShortTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      objc_msgSend(v7, "displayString");
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v13;

  }
  objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 44);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811A0]), "initWithClientModelId:clientModelVersion:engagementResetPolicy:", v14, CFSTR("1.0"), 1);
  v16 = objc_alloc(MEMORY[0x1E0D811A8]);
  objc_msgSend(v7, "displayString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v16, "initWithExecutableObject:executableDescription:executableIdentifier:suggestionExecutableType:", v9, v17, v18, 9);

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811B8]), "initWithApplicableSuggestionLayout:", 5);
  v27[0] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v26) = 1;
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811D0]), "initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:predictionReasons:", v8, 0, 0, v21, 0, 0, v26, a5);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811C0]), "initWithRawScore:suggestedConfidenceCategory:", 4, 15.0);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81190]), "initWithClientModelSpecification:executableSpecification:uiSpecification:scoreSpecification:", v15, v19, v22, v23);

  return v24;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adapter, 0);
  objc_storeStrong((id *)&self->_hyperParameters, 0);
  objc_storeStrong((id *)&self->_deduplicator, 0);
}

- (void)_isValidForReasons:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9_0(&dword_1C9A3B000, v0, v1, "SLS: ATXSpotlightLayoutSelector suggestion not valid: More than one Context set for reasons %llu", v2);
  OUTLINED_FUNCTION_1_0();
}

void __53__ATXSpotlightLayoutSelector__indexSpotlightActions___block_invoke_71_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "[Index] Deleting Error deleteSearchableItems: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __53__ATXSpotlightLayoutSelector__indexSpotlightActions___block_invoke_72_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "[Index] Inserting Error indexSearchableItems: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_preferredContextWithContextCode:(uint64_t)a1 contextCriteria:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  stringForATXSuggestionPredictionReasonCode();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9_0(&dword_1C9A3B000, a2, v4, "SLS: contextCode %@ is not an event context. We shouldn't be here", v5);

  OUTLINED_FUNCTION_1();
}

- (void)_titleForContextCode:suggestions:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_9(&dword_1C9A3B000, v0, v1, "SLS: ATXSpotlightLayoutSelector Section title is nil and should be dynamic: %@, code: %lu");
  OUTLINED_FUNCTION_1_0();
}

- (void)_poiMUIDFromHero:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "_heroDataReducer: ATXHeroData does not have poiMuid or clipMapItemMUID", v1, 2u);
}

- (void)_poiMUIDFromHero:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "stringValue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_0(&dword_1C9A3B000, v2, v3, "Got POI MUID from tile server: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)_poiMUIDFromHero:(void *)a1 .cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "stringValue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_0(&dword_1C9A3B000, v2, v3, "Got POI MUID from Clips Metadata: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)_autoShortcutsForBundleId:provider:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "SLS: [AutoShortcut] lookup timeout for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __65__ATXSpotlightLayoutSelector__autoShortcutsForBundleId_provider___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_2_9(&dword_1C9A3B000, a2, a3, "SLS: [AutoShortcut] lookup for %@ error: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1_0();
}

- (void)_titleForParameterizedAutoShortcutContextualAction:(NSObject *)a3 provider:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "actionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412802;
  v9 = v6;
  v10 = 2112;
  v11 = v7;
  v12 = 2112;
  v13 = a2;
  _os_log_error_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_ERROR, "SLS: [AutoShortcut] title lookup error for %@, %@: %@", (uint8_t *)&v8, 0x20u);

}

@end
