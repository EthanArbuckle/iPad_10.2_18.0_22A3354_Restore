@implementation ATXHomeScreenFocusSuggestionLogger

- (ATXHomeScreenFocusSuggestionLogger)init
{
  ATXHomeScreenFocusSuggestionLogger *v2;
  uint64_t v3;
  ATXBiomeSuggestedHomePageStream *stream;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXHomeScreenFocusSuggestionLogger;
  v2 = -[ATXHomeScreenFocusSuggestionLogger init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    stream = v2->_stream;
    v2->_stream = (ATXBiomeSuggestedHomePageStream *)v3;

  }
  return v2;
}

- (id)generateSuggestedHomePageStreamBookmarkURLPath
{
  NSURL *suggestedHomePageStreamBookmarkURLPath;
  NSURL *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  suggestedHomePageStreamBookmarkURLPath = self->_suggestedHomePageStreamBookmarkURLPath;
  if (suggestedHomePageStreamBookmarkURLPath)
  {
    v3 = suggestedHomePageStreamBookmarkURLPath;
  }
  else
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CF94D8], "metricsRootDirectory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x1E0C99E98]);
    objc_msgSend(v6, "stringByAppendingPathComponent:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (NSURL *)objc_msgSend(v7, "initFileURLWithPath:", v8);

  }
  return v3;
}

- (id)generateSuggestedHomePageStreamBookmark
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CF94A0];
  -[ATXHomeScreenFocusSuggestionLogger generateSuggestedHomePageStreamBookmarkURLPath](self, "generateSuggestedHomePageStreamBookmarkURLPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bookmarkFromURLPath:maxFileSize:versionNumber:", v4, 3000000, &unk_1E83CDF90);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0CF94A0]);
    -[ATXHomeScreenFocusSuggestionLogger generateSuggestedHomePageStreamBookmarkURLPath](self, "generateSuggestedHomePageStreamBookmarkURLPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v6, "initWithURLPath:versionNumber:bookmark:metadata:", v7, &unk_1E83CDF90, 0, 0);

  }
  return v5;
}

- (void)writeBookmarkToFile:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;

  v6 = 0;
  objc_msgSend(a3, "saveBookmarkWithError:", &v6);
  v4 = v6;
  if (v4)
  {
    __atxlog_handle_modes();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[ATXModeSetupExperienceMetricsLogger writeBookmarkToFile:].cold.1((uint64_t)self, (uint64_t)v4, v5);

  }
}

- (void)logHomeScreenFocusSuggestionMetrics
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  _BOOL8 v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  id obj;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  _QWORD v44[4];
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[4];
  id v53;
  ATXHomeScreenFocusSuggestionLogger *v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[ATXHomeScreenFocusSuggestionLogger generateSuggestedHomePageStreamBookmark](self, "generateSuggestedHomePageStreamBookmark");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHomeScreenFocusSuggestionLogger stream](self, "stream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "publisherFromStartTime:", 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bookmark");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __73__ATXHomeScreenFocusSuggestionLogger_logHomeScreenFocusSuggestionMetrics__block_invoke;
  v52[3] = &unk_1E82E6280;
  v39 = v4;
  v53 = v39;
  v54 = self;
  v50[0] = v8;
  v50[1] = 3221225472;
  v50[2] = __73__ATXHomeScreenFocusSuggestionLogger_logHomeScreenFocusSuggestionMetrics__block_invoke_9;
  v50[3] = &unk_1E82DB0C8;
  v9 = v3;
  v51 = v9;
  v10 = (id)objc_msgSend(v6, "sinkWithBookmark:completion:receiveInput:", v7, v52, v50);

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v42 = v9;
  objc_msgSend(v9, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
  v43 = v11;
  if (v11)
  {
    v41 = *(_QWORD *)v47;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v47 != v41)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v12);
        v14 = (void *)MEMORY[0x1CAA48B6C](v11);
        v15 = (void *)objc_opt_new();
        objc_msgSend(v42, "objectForKeyedSubscript:", v13, v39);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");
        v18 = v17 - 1;
        if (v17 < 1)
        {
          v22 = 0;
        }
        else
        {
          do
          {
            objc_msgSend(v16, "objectAtIndexedSubscript:", --v17);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "eventBody");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "action");

            v22 = v21 != 2;
            if (v21 != 2)
            {
              v18 = v17;
              goto LABEL_12;
            }
          }
          while (v17 >= 1);
          v18 = -1;
        }
LABEL_12:
        +[ATXSuggestedPagesUtils semanticTypeForSuggestedPageType:](ATXSuggestedPagesUtils, "semanticTypeForSuggestedPageType:", objc_msgSend(v13, "integerValue"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "integerValue");
        DNDModeSemanticTypeToString();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setModeSemanticType:", v24);

        if (v22
          && (objc_msgSend(v16, "objectAtIndexedSubscript:", v18),
              v25 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v25, "eventBody"),
              v26 = (void *)objc_claimAutoreleasedReturnValue(),
              v27 = objc_msgSend(v26, "action"),
              v26,
              v25,
              v27 == 1))
        {
          objc_msgSend(v16, "objectAtIndexedSubscript:", v18);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v44[0] = MEMORY[0x1E0C809B0];
          v44[1] = 3221225472;
          v44[2] = __73__ATXHomeScreenFocusSuggestionLogger_logHomeScreenFocusSuggestionMetrics__block_invoke_2;
          v44[3] = &unk_1E82DF748;
          v29 = v28;
          v45 = v29;
          objc_msgSend(v16, "_pas_filteredArrayWithTest:", v44);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "firstObject");
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          v35 = 0;
          if (v31)
          {
            objc_msgSend(v31, "timestamp");
            v33 = v32;
            objc_msgSend(v29, "timestamp");
            if (v33 - v34 < 86400.0)
              v35 = 1;
          }
          objc_msgSend(v15, "setOutcome:", v35);

        }
        else
        {
          objc_msgSend(v16, "_pas_filteredArrayWithTest:", &__block_literal_global_224);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "count");

          if (v37)
            v38 = 2;
          else
            v38 = 3;
          objc_msgSend(v15, "setOutcome:", v38);
        }
        objc_msgSend(v15, "logToCoreAnalytics");

        objc_autoreleasePoolPop(v14);
        ++v12;
      }
      while (v12 != v43);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
      v43 = v11;
    }
    while (v11);
  }

}

void __73__ATXHomeScreenFocusSuggestionLogger_logHomeScreenFocusSuggestionMetrics__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

  }
  else if (!objc_msgSend(v5, "state"))
  {
    goto LABEL_7;
  }
  __atxlog_handle_modes();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    __49__ATXModeSetupExperienceMetricsLogger_logMetrics__block_invoke_2_cold_1(v5, v8);

LABEL_7:
  objc_msgSend(*(id *)(a1 + 32), "setBookmark:", v6);
  objc_msgSend(*(id *)(a1 + 40), "writeBookmarkToFile:", *(_QWORD *)(a1 + 32));

}

void __73__ATXHomeScreenFocusSuggestionLogger_logHomeScreenFocusSuggestionMetrics__block_invoke_9(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "pageType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "addObject:", v9);
  }
  else
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "addObject:", v9);
    v7 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "pageType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

  }
}

BOOL __73__ATXHomeScreenFocusSuggestionLogger_logHomeScreenFocusSuggestionMetrics__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;

  v3 = a2;
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "eventBody");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v7))
  {
    objc_msgSend(v3, "eventBody");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "action") == 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

BOOL __73__ATXHomeScreenFocusSuggestionLogger_logHomeScreenFocusSuggestionMetrics__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "eventBody");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "action") == 2;

  return v3;
}

- (ATXBiomeSuggestedHomePageStream)stream
{
  return self->_stream;
}

- (void)setStream:(id)a3
{
  objc_storeStrong((id *)&self->_stream, a3);
}

- (NSURL)suggestedHomePageStreamBookmarkURLPath
{
  return self->_suggestedHomePageStreamBookmarkURLPath;
}

- (void)setSuggestedHomePageStreamBookmarkURLPath:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedHomePageStreamBookmarkURLPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedHomePageStreamBookmarkURLPath, 0);
  objc_storeStrong((id *)&self->_stream, 0);
}

@end
