@implementation ATXSpotlightClientResponse

- (void)dealloc
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t signpostId;
  objc_super v6;
  uint8_t buf[16];

  __atxlog_handle_metrics();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  signpostId = self->_signpostId;
  if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A49EF000, v4, OS_SIGNPOST_INTERVAL_END, signpostId, "ATXSpotlightClientResponse", " enableTelemetry=YES ", buf, 2u);
  }

  v6.receiver = self;
  v6.super_class = (Class)ATXSpotlightClientResponse;
  -[ATXSpotlightClientResponse dealloc](&v6, sel_dealloc);
}

- (ATXSpotlightClientResponse)initWithTopics:(id)a3 scores:(id)a4 sections:(id)a5
{
  id v9;
  id v10;
  id v11;
  ATXSpotlightClientResponse *v12;
  ATXSpotlightClientResponse *v13;
  NSMutableArray *v14;
  NSMutableArray *codePathIdTriggers;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t signpostId;
  uint8_t v21[16];
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)ATXSpotlightClientResponse;
  v12 = -[ATXSpotlightClientResponse init](&v22, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_topics, a3);
    objc_storeStrong((id *)&v13->_scores, a4);
    objc_storeStrong((id *)&v13->_sections, a5);
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    codePathIdTriggers = v13->_codePathIdTriggers;
    v13->_codePathIdTriggers = v14;

    __atxlog_handle_metrics();
    v16 = objc_claimAutoreleasedReturnValue();
    v13->_signpostId = os_signpost_id_generate(v16);

    if (!-[NSArray count](v13->_topics, "count"))
      v13->_signpostId = 0;
    __atxlog_handle_metrics();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    signpostId = v13->_signpostId;
    if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)v21 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A49EF000, v18, OS_SIGNPOST_INTERVAL_BEGIN, signpostId, "ATXSpotlightClientResponse", " enableTelemetry=YES ", v21, 2u);
    }

  }
  return v13;
}

- (NSArray)topics
{
  return self->_topics;
}

- (NSArray)sections
{
  return self->_sections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_topics, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_codePathIdTriggers, 0);
  objc_storeStrong((id *)&self->_scores, 0);
}

- (id)createSectionsFromServerResults:(id)a3
{
  return -[ATXSpotlightClientResponse _createSectionsFromServerResults:limit:](self, "_createSectionsFromServerResults:limit:", a3, 10);
}

- (id)_createSectionsFromServerResults:(id)a3 limit:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t signpostId;
  NSObject *v10;
  NSUInteger v11;
  NSUInteger v12;
  uint64_t v13;
  NSUInteger v14;
  NSUInteger v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  ATXSpotlightHidingUIController *v20;
  ATXSpotlightHidingUIController *controller;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSUInteger v33;
  NSUInteger v34;
  uint64_t v35;
  NSUInteger v36;
  NSUInteger v37;
  uint64_t v38;
  int v39;
  NSUInteger v40;
  __int16 v41;
  NSUInteger v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  __atxlog_handle_metrics();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  signpostId = self->_signpostId;
  if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v39) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A49EF000, v8, OS_SIGNPOST_INTERVAL_END, signpostId, "ATXSpotlightClientResponse", " enableTelemetry=YES ", (uint8_t *)&v39, 2u);
  }

  self->_signpostId = 0;
  __atxlog_handle_ui();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = -[NSArray count](self->_topics, "count");
    v12 = -[NSArray count](self->_scores, "count");
    v13 = objc_msgSend(v6, "count");
    v39 = 134218496;
    v40 = v11;
    v41 = 2048;
    v42 = v12;
    v43 = 2048;
    v44 = v13;
    _os_log_impl(&dword_1A49EF000, v10, OS_LOG_TYPE_DEFAULT, "ZKW Server Result: Create sections from server response - topics: %lu, scores: %lu, received: %lu", (uint8_t *)&v39, 0x20u);
  }

  v14 = -[NSArray count](self->_topics, "count");
  if (v14 != -[NSArray count](self->_scores, "count")
    || (v15 = -[NSArray count](self->_topics, "count"), v15 != objc_msgSend(v6, "count")))
  {
    __atxlog_handle_ui();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
    {
      v36 = -[NSArray count](self->_topics, "count");
      v37 = -[NSArray count](self->_scores, "count");
      v38 = objc_msgSend(v6, "count");
      v39 = 134218496;
      v40 = v36;
      v41 = 2048;
      v42 = v37;
      v43 = 2048;
      v44 = v38;
      _os_log_fault_impl(&dword_1A49EF000, v31, OS_LOG_TYPE_FAULT, "ZKW Server Result: Server did not send back same count. Sent topics: %lu, scores: %lu Received: %lu", (uint8_t *)&v39, 0x20u);
    }
    goto LABEL_20;
  }
  if (!-[NSArray count](self->_topics, "count"))
  {
    __atxlog_handle_ui();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v33 = -[NSArray count](self->_topics, "count");
      v34 = -[NSArray count](self->_scores, "count");
      v35 = objc_msgSend(v6, "count");
      v39 = 134218496;
      v40 = v33;
      v41 = 2048;
      v42 = v34;
      v43 = 2048;
      v44 = v35;
      _os_log_impl(&dword_1A49EF000, v31, OS_LOG_TYPE_DEFAULT, "ZKW Server Result: Requested no topics, returning. Sent topics: %lu, scores: %lu Received: %lu", (uint8_t *)&v39, 0x20u);
    }
LABEL_20:

    v30 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_21;
  }
  objc_msgSend((id)objc_opt_class(), "_logWeatherResponsesWithTopics:serverResults:", self->_topics, v6);
  -[ATXSpotlightClientResponse _replaceMissingWithError:](self, "_replaceMissingWithError:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_removeDuplicates:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXSpotlightClientResponse _updateSectionBundleIdentifiersWithServerResults:](self, "_updateSectionBundleIdentifiersWithServerResults:", v17);
  -[ATXSpotlightClientResponse _addIdentifiersFromTopics:serverTopics:](self, "_addIdentifiersFromTopics:serverTopics:", self->_topics, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend(MEMORY[0x1E0CF94B0], "isZKWHideContextsEnabled");
  self->_isZKWHideContextsEnabled = v19;
  if (v19)
  {
    v20 = (ATXSpotlightHidingUIController *)objc_opt_new();
    controller = self->_controller;
    self->_controller = v20;

    -[ATXSpotlightClientResponse _removeHidden:](self, "_removeHidden:", v18);
    v22 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v22;
  }
  -[ATXSpotlightClientResponse _removeDuplicateTopics:](self, "_removeDuplicateTopics:", v18);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_msgSend((id)objc_opt_class(), "_indexOfFirstSpotlightRecentInServerResults:withSections:", v23, self->_sections);
  __atxlog_handle_ui();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v39 = 134217984;
    v40 = v24;
    _os_log_impl(&dword_1A49EF000, v25, OS_LOG_TYPE_DEFAULT, "ZKW Server Result: Index of first spotlight recent: %lu", (uint8_t *)&v39, 0xCu);
  }

  objc_msgSend(v23, "indexesOfObjectsPassingTest:", &__block_literal_global_69);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "count");

  if (v27 >= 5)
  {
    +[ATXSpotlightZKWTrialClientWrapper sharedInstance](ATXSpotlightZKWTrialClientWrapper, "sharedInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v28, "matchesSuggestionsMaxCount"))
    {
      objc_msgSend(v28, "codePathIdForSuggestionsMaxCount");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXSpotlightClientResponse addCodePathId:](self, "addCodePathId:", v29);

    }
  }
  objc_msgSend((id)objc_opt_class(), "_limitingResults:scores:spotlightRecentIndex:limit:", v23, self->_scores, v24, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[ATXSpotlightClientResponse _createSectionsFromServerResults:](self, "_createSectionsFromServerResults:", v6);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:

  return v30;
}

BOOL __69__ATXSpotlightClientResponse__createSectionsFromServerResults_limit___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "results");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 != 0;
}

- (NSUUID)codePathIdTrigger
{
  return (NSUUID *)-[NSMutableArray firstObject](self->_codePathIdTriggers, "firstObject");
}

- (void)addCodePathId:(id)a3
{
  -[NSMutableArray addObject:](self->_codePathIdTriggers, "addObject:", a3);
}

- (NSArray)codePathIdTriggers
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_codePathIdTriggers, "copy");
}

+ (id)createSectionWithTitle:(id)a3 sectionBundleIdentifier:(id)a4 resultCount:(unint64_t)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;

  v8 = (objc_class *)MEMORY[0x1E0D8C650];
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(v8);
  objc_msgSend(v11, "setSubtitle:", v10);

  objc_msgSend(v11, "setBundleIdentifier:", v9);
  objc_msgSend(a1, "_createEmptyResultsWithCount:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setResults:", v12);

  return v11;
}

+ (id)_createEmptyResultsWithCount:(unint64_t)a3
{
  id i;
  id v5;
  void *v6;

  for (i = objc_alloc_init(MEMORY[0x1E0C99DE8]); a3; --a3)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0D8C6A8]);
    objc_msgSend(i, "addObject:", v5);

  }
  v6 = (void *)objc_msgSend(i, "copy");

  return v6;
}

- (void)_updateSectionBundleIdentifiersWithServerResults:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  NSArray *obj;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = self->_sections;
  v21 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v21)
  {
    v5 = 0;
    v20 = *(_QWORD *)v29;
    v23 = v4;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v29 != v20)
          objc_enumerationMutation(obj);
        v22 = v6;
        v7 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v6);
        objc_msgSend(v7, "results");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "count"))
        {
          v9 = 0;
          while (1)
          {
            v10 = objc_msgSend(v4, "count");

            if (v5 >= v10)
              break;
            objc_msgSend(v4, "objectAtIndexedSubscript:", v5);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = 0u;
            v25 = 0u;
            v26 = 0u;
            v27 = 0u;
            objc_msgSend(v11, "results");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            if (v13)
            {
              v14 = v13;
              v15 = *(_QWORD *)v25;
              do
              {
                for (i = 0; i != v14; ++i)
                {
                  if (*(_QWORD *)v25 != v15)
                    objc_enumerationMutation(v12);
                  v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
                  objc_msgSend(v7, "bundleIdentifier");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "setSectionBundleIdentifier:", v18);

                }
                v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
              }
              while (v14);
            }
            ++v5;

            ++v9;
            objc_msgSend(v7, "results");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            v4 = v23;
            if (v9 >= objc_msgSend(v8, "count"))
              goto LABEL_17;
          }
        }
        else
        {
LABEL_17:

        }
        v6 = v22 + 1;
      }
      while (v22 + 1 != v21);
      v21 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v21);
  }

}

- (id)_addIdentifiersFromTopics:(id)a3 serverTopics:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__ATXSpotlightClientResponse__addIdentifiersFromTopics_serverTopics___block_invoke;
  v9[3] = &unk_1E4D5B198;
  v10 = v5;
  v6 = v5;
  objc_msgSend(a4, "_pas_mappedArrayWithIndexedTransform:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __69__ATXSpotlightClientResponse__addIdentifiersFromTopics_serverTopics___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "results");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__ATXSpotlightClientResponse__addIdentifiersFromTopics_serverTopics___block_invoke_2;
  v11[3] = &unk_1E4D5B170;
  v12 = v6;
  v8 = v6;
  objc_msgSend(v7, "_pas_mappedArrayWithTransform:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setResults:", v9);
  return v5;
}

ATXSuggestionSearchResult *__69__ATXSpotlightClientResponse__addIdentifiersFromTopics_serverTopics___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL4 v5;
  NSObject *v6;
  const char *v7;
  ATXSuggestionSearchResult *v8;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_10;
  objc_msgSend(v3, "sectionBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[ATXSpotlightContextAdapter isSpotlightRecentSectionIdentifier:](ATXSpotlightContextAdapter, "isSpotlightRecentSectionIdentifier:", v4);

  if (v5)
  {
    __atxlog_handle_ui();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v30) = 0;
      v7 = "ZKW Server Id: Skip recents";
LABEL_8:
      _os_log_impl(&dword_1A49EF000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v30, 2u);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    __atxlog_handle_ui();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v30) = 0;
      v7 = "ZKW Server Id: Skip contacts";
      goto LABEL_8;
    }
LABEL_9:

LABEL_10:
    v8 = (ATXSuggestionSearchResult *)v3;
    goto LABEL_11;
  }
  if (!*(_QWORD *)(a1 + 32))
  {
    __atxlog_handle_ui();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __69__ATXSpotlightClientResponse__addIdentifiersFromTopics_serverTopics___block_invoke_2_cold_1(v6, v23, v24, v25, v26, v27, v28, v29);
    goto LABEL_9;
  }
  v10 = objc_alloc(MEMORY[0x1E0D81138]);
  v11 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "sectionBundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithTopic:sectionBundleIdentifier:", v11, v12);

  if (!v13)
  {
    __atxlog_handle_ui();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __69__ATXSpotlightClientResponse__addIdentifiersFromTopics_serverTopics___block_invoke_2_cold_2(v14, v15, v16, v17, v18, v19, v20, v21);

  }
  v8 = -[ATXSuggestionSearchResult initWithSearchResult:]([ATXSuggestionSearchResult alloc], "initWithSearchResult:", v3);
  -[ATXSuggestionSearchResult setContextActionIdentifier:](v8, "setContextActionIdentifier:", v13);
  __atxlog_handle_ui();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v30 = 138412290;
    v31 = v13;
    _os_log_impl(&dword_1A49EF000, v22, OS_LOG_TYPE_DEFAULT, "ZKW Server Id: Converting %@", (uint8_t *)&v30, 0xCu);
  }

LABEL_11:
  return v8;
}

+ (id)_removeDuplicates:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD v7[5];
  __int128 buf;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  __atxlog_handle_ui();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_DEFAULT, "ZKW Server Result: Removing duplicates in %lu serverResults", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__13;
  v11 = __Block_byref_object_dispose__13;
  v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__ATXSpotlightClientResponse__removeDuplicates___block_invoke;
  v7[3] = &unk_1E4D5B1E8;
  v7[4] = &buf;
  objc_msgSend(v3, "_pas_mappedArrayWithTransform:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&buf, 8);

  return v5;
}

id __48__ATXSpotlightClientResponse__removeDuplicates___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  v3 = a2;
  objc_msgSend(v3, "results");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__ATXSpotlightClientResponse__removeDuplicates___block_invoke_2;
  v7[3] = &unk_1E4D5B1C0;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "_pas_filteredArrayWithTest:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setResults:", v5);
  return v3;
}

uint64_t __48__ATXSpotlightClientResponse__removeDuplicates___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  uint8_t v8[16];
  uint8_t buf[16];

  v3 = a2;
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "containsObject:", v3);
  __atxlog_handle_ui();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "ZKW Server Result: - Removing duplicate", buf, 2u);
    }

  }
  else
  {
    if (v6)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "ZKW Server Result: - Keeping", v8, 2u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);
  }

  return v4 ^ 1u;
}

- (id)_removeHidden:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v8[5];
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_ui();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v10 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "ZKW Server Result: Removing hidden in %lu results", buf, 0xCu);
  }

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__ATXSpotlightClientResponse__removeHidden___block_invoke;
  v8[3] = &unk_1E4D5B238;
  v8[4] = self;
  objc_msgSend(v4, "_pas_mappedArrayWithTransform:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __44__ATXSpotlightClientResponse__removeHidden___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  v3 = a2;
  objc_msgSend(v3, "results");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__ATXSpotlightClientResponse__removeHidden___block_invoke_2;
  v7[3] = &unk_1E4D5B210;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "_pas_filteredArrayWithTest:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setResults:", v5);
  return v3;
}

uint64_t __44__ATXSpotlightClientResponse__removeHidden___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "shouldHideSearchResult:", a2) ^ 1;
}

- (id)_removeDuplicateTopics:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  id v21;
  void *v22;
  NSArray *obj;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v30;
  unint64_t v31;
  void *v32;
  uint64_t v33;
  _QWORD v34[4];
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint8_t v45[128];
  uint8_t buf[4];
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  __atxlog_handle_ui();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v47 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_DEFAULT, "ZKW Server Result: _removeDuplicateTopics in %lu results", buf, 0xCu);
  }

  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = self->_sections;
  v26 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v26)
  {
    v7 = 0;
    v25 = *(_QWORD *)v41;
    v28 = v3;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v41 != v25)
          objc_enumerationMutation(obj);
        v27 = v8;
        v30 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v8);
        objc_msgSend(v30, "results");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "count"))
        {
          v10 = 0;
          while (1)
          {
            v11 = objc_msgSend(v3, "count");

            if (v7 >= v11)
              break;
            v33 = v10;
            -[NSArray objectAtIndexedSubscript:](self->_topics, "objectAtIndexedSubscript:", v7);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "objectAtIndexedSubscript:", v7);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = 0u;
            v37 = 0u;
            v38 = 0u;
            v39 = 0u;
            v32 = v13;
            objc_msgSend(v13, "results");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
            if (v15)
            {
              v16 = v15;
              v31 = v7;
              v17 = 0;
              v18 = *(_QWORD *)v37;
              do
              {
                for (i = 0; i != v16; ++i)
                {
                  if (*(_QWORD *)v37 != v18)
                    objc_enumerationMutation(v14);
                  v20 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
                  if (+[ATXSpotlightClient topic:isDuplicateComparingTopics:](ATXSpotlightClient, "topic:isDuplicateComparingTopics:", v12, v5))
                  {
                    objc_msgSend(v6, "addObject:", v20);
                  }
                  else
                  {
                    v17 = 1;
                  }
                }
                v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
              }
              while (v16);

              v3 = v28;
              v7 = v31;
              if ((v17 & 1) != 0)
                objc_msgSend(v5, "addObject:", v12);
            }
            else
            {

            }
            ++v7;

            v10 = v33 + 1;
            objc_msgSend(v30, "results");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            if (v33 + 1 >= (unint64_t)objc_msgSend(v9, "count"))
              goto LABEL_25;
          }
        }
        else
        {
LABEL_25:

        }
        v8 = v27 + 1;
      }
      while (v27 + 1 != v26);
      v26 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v26);
  }

  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __53__ATXSpotlightClientResponse__removeDuplicateTopics___block_invoke;
  v34[3] = &unk_1E4D5B238;
  v35 = v6;
  v21 = v6;
  objc_msgSend(v3, "_pas_mappedArrayWithTransform:", v34);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

id __53__ATXSpotlightClientResponse__removeDuplicateTopics___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  objc_msgSend(v3, "results");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__ATXSpotlightClientResponse__removeDuplicateTopics___block_invoke_2;
  v7[3] = &unk_1E4D5B210;
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v4, "_pas_filteredArrayWithTest:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setResults:", v5);
  return v3;
}

uint64_t __53__ATXSpotlightClientResponse__removeDuplicateTopics___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

+ (unint64_t)_indexOfFirstSpotlightRecentInServerResults:(id)a3 withSections:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  id v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v28;
    v26 = *(_QWORD *)v28;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v11);
        objc_msgSend(v12, "bundleIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqual:", CFSTR("com.apple.spotlight.dec.zkw.recents"));

        objc_msgSend(v12, "results");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "count");
        if (v14)
        {
          if (v16)
          {
            v17 = v6;
            v18 = 0;
            while (1)
            {
              v19 = objc_msgSend(v5, "count");

              if (v9 + v18 >= v19)
              {
                v9 += v18;
                v6 = v17;
                v10 = v26;
                goto LABEL_15;
              }
              objc_msgSend(v5, "objectAtIndexedSubscript:", v9 + v18);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "results");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "firstObject");
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              if (v22)
                break;
              ++v18;
              objc_msgSend(v12, "results");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (v18 >= objc_msgSend(v15, "count"))
              {
                v9 += v18;
                v6 = v17;
                v10 = v26;
                goto LABEL_14;
              }
            }
            v24 = v9 + v18;
            v6 = v17;
            goto LABEL_22;
          }
        }
        else
        {
          v9 += v16;
        }
LABEL_14:

LABEL_15:
        ++v11;
      }
      while (v11 != v8);
      v23 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      v8 = v23;
      v24 = 0x7FFFFFFFFFFFFFFFLL;
      if (v23)
        continue;
      break;
    }
  }
  else
  {
    v24 = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_22:

  return v24;
}

+ (id)_limitingResults:(id)a3 scores:(id)a4 spotlightRecentIndex:(unint64_t)a5 limit:(unint64_t)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  unint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD *v32;
  _QWORD *v33;
  unint64_t v34;
  unint64_t v35;
  _QWORD v36[3];
  BOOL v37;
  _QWORD v38[4];
  _QWORD v39[4];
  id v40;
  Boolean keyExistsAndHasValidFormat[4];
  unint64_t v42;
  __int16 v43;
  id v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  _QWORD v49[4];

  v49[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  keyExistsAndHasValidFormat[0] = 0;
  if (CFPreferencesGetAppBooleanValue(CFSTR("zkwShowAllContexts"), (CFStringRef)*MEMORY[0x1E0CF9510], keyExistsAndHasValidFormat))
  {
    __atxlog_handle_ui();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)keyExistsAndHasValidFormat = 0;
    }

    v13 = v10;
  }
  else
  {
    v14 = objc_msgSend(a1, "_trialSuggestionsMaxCountWithDefault:", a6);
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __81__ATXSpotlightClientResponse__limitingResults_scores_spotlightRecentIndex_limit___block_invoke;
    v39[3] = &unk_1E4D5B260;
    v15 = v10;
    v40 = v15;
    objc_msgSend(v11, "_pas_mappedArrayWithIndexedTransform:", v39);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("self"), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "sortedArrayUsingDescriptors:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_msgSend(v18, "count");
    if (v14 >= v19)
      v20 = v19;
    else
      v20 = v14;
    v21 = v20 - (a5 != 0x7FFFFFFFFFFFFFFFLL);
    v22 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v18, "subarrayWithRange:", 0, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setWithArray:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x2020000000;
    v38[3] = 0;
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x2020000000;
    v37 = a5 != 0x7FFFFFFFFFFFFFFFLL;
    __atxlog_handle_ui();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)keyExistsAndHasValidFormat = 134218754;
      v42 = v21;
      v43 = 2112;
      v44 = v11;
      v45 = 2112;
      v46 = v28;
      v47 = 2112;
      v48 = v24;
      _os_log_impl(&dword_1A49EF000, v25, OS_LOG_TYPE_DEFAULT, "ZKW Server Limit: Fill slots %lu, scores: %@, omit empty: %@, allowed: %@", keyExistsAndHasValidFormat, 0x2Au);
    }

    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __81__ATXSpotlightClientResponse__limitingResults_scores_spotlightRecentIndex_limit___block_invoke_40;
    v29[3] = &unk_1E4D5B288;
    v30 = v11;
    v32 = v38;
    v34 = v14;
    v35 = a5;
    v33 = v36;
    v26 = v24;
    v31 = v26;
    objc_msgSend(v15, "_pas_mappedArrayWithIndexedTransform:", v29);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(v36, 8);
    _Block_object_dispose(v38, 8);

  }
  return v13;
}

id __81__ATXSpotlightClientResponse__limitingResults_scores_spotlightRecentIndex_limit___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "results");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = v5;
  else
    v9 = &unk_1E4DC1770;

  return v9;
}

id __81__ATXSpotlightClientResponse__limitingResults_scores_spotlightRecentIndex_limit___block_invoke_40(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  int v21;
  unint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_ui();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 134218242;
    v22 = a3;
    v23 = 2112;
    v24 = v6;
    _os_log_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEFAULT, "ZKW Server Limit: Consider result %lu with score: %@", (uint8_t *)&v21, 0x16u);
  }

  objc_msgSend(v5, "results");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) >= *(_QWORD *)(a1 + 64))
    {
      objc_msgSend(v5, "setResults:", MEMORY[0x1E0C9AA60]);
      __atxlog_handle_ui();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        goto LABEL_26;
      v16 = *(void **)(a1 + 64);
      v21 = 134218240;
      v22 = a3;
      v23 = 2048;
      v24 = v16;
      v13 = "ZKW Server Limit: Remove %lu. Already included limit of %lu";
    }
    else
    {
      if (*(_QWORD *)(a1 + 72) <= a3)
      {
        __atxlog_handle_ui();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v21 = 134217984;
          v22 = a3;
          _os_log_impl(&dword_1A49EF000, v17, OS_LOG_TYPE_DEFAULT, "ZKW Server Limit: Found Spotlight Recent %lu", (uint8_t *)&v21, 0xCu);
        }

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
        __atxlog_handle_ui();
        v12 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          goto LABEL_26;
      }
      else
      {
        if ((objc_msgSend(*(id *)(a1 + 40), "containsObject:", v6) & 1) == 0)
        {
          objc_msgSend(v5, "setResults:", MEMORY[0x1E0C9AA60]);
          __atxlog_handle_ui();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            v18 = *(_QWORD *)(a1 + 40);
            v21 = 134218498;
            v22 = a3;
            v23 = 2112;
            v24 = v6;
            v25 = 2112;
            v26 = v18;
            v13 = "ZKW Server Limit: Remove %lu, score %@ isn't high enough, %@";
            v14 = v12;
            v15 = 32;
            goto LABEL_25;
          }
          goto LABEL_26;
        }
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v11 = *(_QWORD *)(v10 + 24) + 1;
        if (v11 == *(_QWORD *)(a1 + 64) && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
        {
          objc_msgSend(v5, "setResults:", MEMORY[0x1E0C9AA60]);
          __atxlog_handle_ui();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            v21 = 134217984;
            v22 = a3;
            v13 = "ZKW Server Limit: Remove %lu. One slot left and need to add Spotlight Recent";
LABEL_13:
            v14 = v12;
            v15 = 12;
LABEL_25:
            _os_log_impl(&dword_1A49EF000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v21, v15);
            goto LABEL_26;
          }
          goto LABEL_26;
        }
        *(_QWORD *)(v10 + 24) = v11;
        __atxlog_handle_ui();
        v12 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          goto LABEL_26;
      }
      v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      v21 = 134218240;
      v22 = a3;
      v23 = 2048;
      v24 = v19;
      v13 = "ZKW Server Limit: Added %lu. Count is now %lu";
    }
    v14 = v12;
    v15 = 22;
    goto LABEL_25;
  }
  objc_msgSend(v5, "setResults:", MEMORY[0x1E0C9AA60]);
  __atxlog_handle_ui();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 134217984;
    v22 = a3;
    v13 = "ZKW Server Limit: Remove %lu, result is nil";
    goto LABEL_13;
  }
LABEL_26:

  return v5;
}

- (id)_createSectionsFromServerResults:(id)a3
{
  id v4;
  __int128 v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  __int128 v39;
  NSArray *obj;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  ATXSpotlightClientResponse *v45;
  id v46;
  void *v47;
  void *v48;
  uint64_t v49;
  unint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  uint64_t v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = self->_sections;
  v43 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
  if (v43)
  {
    v6 = 0;
    v42 = *(_QWORD *)v56;
    *(_QWORD *)&v5 = 134217984;
    v39 = v5;
    v45 = self;
    v46 = v4;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v56 != v42)
          objc_enumerationMutation(obj);
        v44 = v7;
        v8 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v7);
        __atxlog_handle_ui();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v8, "subtitle");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "hash");
          *(_DWORD *)buf = v39;
          v60 = v11;
          _os_log_impl(&dword_1A49EF000, v9, OS_LOG_TYPE_DEFAULT, "ZKW Server Result: Section considered with title.hash %lu", buf, 0xCu);

        }
        v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v8, "results");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "count"))
        {
          v14 = 0;
          v47 = v8;
          while (1)
          {
            v15 = objc_msgSend(v4, "count", v39);

            if (v6 >= v15)
              break;
            v49 = v14;
            -[NSArray objectAtIndexedSubscript:](self->_topics, "objectAtIndexedSubscript:", v6);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "objectAtIndexedSubscript:", v6);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = v6 + 1;
            v51 = 0u;
            v52 = 0u;
            v53 = 0u;
            v54 = 0u;
            v48 = v17;
            objc_msgSend(v17, "results");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
            if (v19)
            {
              v20 = v19;
              v21 = *(_QWORD *)v52;
              do
              {
                for (i = 0; i != v20; ++i)
                {
                  if (*(_QWORD *)v52 != v21)
                    objc_enumerationMutation(v18);
                  v23 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
                  __atxlog_handle_ui();
                  v24 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
                  {
                    v25 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v25);
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v16, "identifier");
                    v27 = v12;
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 134218499;
                    v60 = v50;
                    v61 = 2112;
                    v62 = v26;
                    v63 = 2117;
                    v64 = v28;
                    _os_log_impl(&dword_1A49EF000, v24, OS_LOG_TYPE_DEFAULT, "ZKW Server Result: Result %lu added: %@ %{sensitive}@", buf, 0x20u);

                    v12 = v27;
                  }

                  objc_msgSend(v12, "addObject:", v23);
                }
                v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
              }
              while (v20);
            }

            objc_msgSend(v48, "results");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "firstObject");
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            v6 = v50;
            v8 = v47;
            if (!v30)
            {
              __atxlog_handle_ui();
              v31 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                v32 = (objc_class *)objc_opt_class();
                NSStringFromClass(v32);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "identifier");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 134218499;
                v60 = v50;
                v61 = 2112;
                v62 = v33;
                v63 = 2117;
                v64 = v34;
                _os_log_impl(&dword_1A49EF000, v31, OS_LOG_TYPE_DEFAULT, "ZKW Server Result: Result %lu empty: %@ %{sensitive}@", buf, 0x20u);

              }
            }

            v14 = v49 + 1;
            objc_msgSend(v47, "results");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            self = v45;
            v4 = v46;
            if (v49 + 1 >= (unint64_t)objc_msgSend(v13, "count"))
              goto LABEL_25;
          }
        }
        else
        {
LABEL_25:

        }
        if (objc_msgSend(v12, "count", v39))
        {
          v35 = objc_msgSend(v8, "copy");
          v36 = (void *)objc_msgSend(v12, "copy");
          -[NSObject setResults:](v35, "setResults:", v36);

          objc_msgSend(v41, "addObject:", v35);
        }
        else
        {
          __atxlog_handle_ui();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A49EF000, v35, OS_LOG_TYPE_DEFAULT, "ZKW Server Result: Section not added", buf, 2u);
          }
        }

        v7 = v44 + 1;
      }
      while (v44 + 1 != v43);
      v43 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
    }
    while (v43);
  }

  if (self->_isZKWHideContextsEnabled)
  {
    -[ATXSpotlightHidingUIController addHidingPreviewButtonItemsToServerResultSections:](self->_controller, "addHidingPreviewButtonItemsToServerResultSections:", v41);
  }
  else
  {
    __atxlog_handle_ui();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
    }

  }
  return v41;
}

+ (void)_logWeatherResponsesWithTopics:(id)a3 serverResults:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__ATXSpotlightClientResponse__logWeatherResponsesWithTopics_serverResults___block_invoke;
  v7[3] = &unk_1E4D5B2B0;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v7);

}

void __75__ATXSpotlightClientResponse__logWeatherResponsesWithTopics_serverResults___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  NSObject *v39;
  os_signpost_id_t v40;
  NSObject *v41;
  NSObject *v42;
  os_signpost_id_t v43;
  NSObject *v44;
  NSObject *v45;
  os_signpost_id_t v46;
  NSObject *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  NSObject *v58;
  _BOOL4 v59;
  NSObject *v60;
  NSObject *v61;
  NSObject *v62;
  NSObject *v63;
  os_signpost_id_t v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  int v83;
  uint64_t v84;
  __int16 v85;
  void *v86;
  __int16 v87;
  void *v88;
  __int16 v89;
  uint64_t v90;
  __int16 v91;
  uint64_t v92;
  __int16 v93;
  uint64_t v94;
  __int16 v95;
  uint64_t v96;
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "results");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      __atxlog_handle_ui();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v83) = 0;
        _os_log_impl(&dword_1A49EF000, v41, OS_LOG_TYPE_DEFAULT, "ZKW Weather: Weather response empty", (uint8_t *)&v83, 2u);
      }

      __atxlog_handle_metrics();
      v10 = objc_claimAutoreleasedReturnValue();
      __atxlog_handle_metrics();
      v42 = objc_claimAutoreleasedReturnValue();
      v43 = os_signpost_id_generate(v42);

      if (v43 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
      {
        v83 = 134349056;
        v84 = 1;
        _os_signpost_emit_with_name_impl(&dword_1A49EF000, v10, OS_SIGNPOST_EVENT, v43, "ATXSpotlightWeatherResponse", "result=%{public, signpost.telemetry:number1}lu enableTelemetry=YES ", (uint8_t *)&v83, 0xCu);
      }
      goto LABEL_43;
    }
    objc_msgSend(v9, "normalizedTopic");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __atxlog_handle_ui();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
        __75__ATXSpotlightClientResponse__logWeatherResponsesWithTopics_serverResults___block_invoke_cold_1((uint64_t)v10, v44);

      __atxlog_handle_metrics();
      v17 = objc_claimAutoreleasedReturnValue();
      __atxlog_handle_metrics();
      v45 = objc_claimAutoreleasedReturnValue();
      v46 = os_signpost_id_generate(v45);

      if (v46 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
      {
        v83 = 134349056;
        v84 = 2;
        _os_signpost_emit_with_name_impl(&dword_1A49EF000, v17, OS_SIGNPOST_EVENT, v46, "ATXSpotlightWeatherResponse", "result=%{public, signpost.telemetry:number1}lu enableTelemetry=YES ", (uint8_t *)&v83, 0xCu);
      }
      goto LABEL_42;
    }
    v11 = objc_alloc(MEMORY[0x1E0C9E3B8]);
    objc_msgSend(v6, "location");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lat");
    v14 = v13;
    objc_msgSend(v6, "location");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lng");
    v17 = objc_msgSend(v11, "initWithLatitude:longitude:", v14, v16);

    v18 = v10;
    v19 = objc_alloc(MEMORY[0x1E0C9E3B8]);
    -[NSObject location](v18, "location");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "lat");
    v22 = v21;
    -[NSObject location](v18, "location");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "lng");
    v25 = (void *)objc_msgSend(v19, "initWithLatitude:longitude:", v22, v24);

    objc_msgSend(v25, "distanceFromLocation:", v17);
    v27 = v26;
    if (v26 >= 1000.0)
    {
      if (v26 >= 8000.0)
      {
        __atxlog_handle_ui();
        v58 = objc_claimAutoreleasedReturnValue();
        v59 = os_log_type_enabled(v58, OS_LOG_TYPE_FAULT);
        if (v27 >= 24000.0)
        {
          if (v59)
          {
            objc_msgSend(v6, "query");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject query](v18, "query");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject coordinate](v17, "coordinate");
            v77 = v76;
            -[NSObject coordinate](v17, "coordinate");
            v79 = v78;
            objc_msgSend(v25, "coordinate");
            v81 = v80;
            objc_msgSend(v25, "coordinate");
            v83 = 134219523;
            *(double *)&v84 = v27 / 1000.0;
            v85 = 2112;
            v86 = v74;
            v87 = 2112;
            v88 = v75;
            v89 = 2049;
            v90 = v77;
            v91 = 2049;
            v92 = v79;
            v93 = 2049;
            v94 = v81;
            v95 = 2049;
            v96 = v82;
            _os_log_fault_impl(&dword_1A49EF000, v58, OS_LOG_TYPE_FAULT, "ZKW Weather: Weather response fail.far: %.2f km (%@ -> %@) (%{private}f, %{private}f) -> (%{private}f, %{private}f)", (uint8_t *)&v83, 0x48u);

          }
          __atxlog_handle_metrics();
          v38 = objc_claimAutoreleasedReturnValue();
          __atxlog_handle_metrics();
          v61 = objc_claimAutoreleasedReturnValue();
          v40 = os_signpost_id_generate(v61);

          if (v40 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v38))
            goto LABEL_38;
          v83 = 134349056;
          v84 = 6;
        }
        else
        {
          if (v59)
          {
            objc_msgSend(v6, "query");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject query](v18, "query");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject coordinate](v17, "coordinate");
            v68 = v67;
            -[NSObject coordinate](v17, "coordinate");
            v70 = v69;
            objc_msgSend(v25, "coordinate");
            v72 = v71;
            objc_msgSend(v25, "coordinate");
            v83 = 134219523;
            *(double *)&v84 = v27 / 1000.0;
            v85 = 2112;
            v86 = v65;
            v87 = 2112;
            v88 = v66;
            v89 = 2049;
            v90 = v68;
            v91 = 2049;
            v92 = v70;
            v93 = 2049;
            v94 = v72;
            v95 = 2049;
            v96 = v73;
            _os_log_fault_impl(&dword_1A49EF000, v58, OS_LOG_TYPE_FAULT, "ZKW Weather: Weather response fail.near: %.2f km (%@ -> %@) (%{private}f, %{private}f) -> (%{private}f, %{private}f)", (uint8_t *)&v83, 0x48u);

          }
          __atxlog_handle_metrics();
          v38 = objc_claimAutoreleasedReturnValue();
          __atxlog_handle_metrics();
          v60 = objc_claimAutoreleasedReturnValue();
          v40 = os_signpost_id_generate(v60);

          if (v40 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v38))
            goto LABEL_38;
          v83 = 134349056;
          v84 = 5;
        }
      }
      else
      {
        __atxlog_handle_ui();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v6, "query");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject query](v18, "query");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject coordinate](v17, "coordinate");
          v51 = v50;
          -[NSObject coordinate](v17, "coordinate");
          v53 = v52;
          objc_msgSend(v25, "coordinate");
          v55 = v54;
          objc_msgSend(v25, "coordinate");
          v83 = 134219523;
          *(double *)&v84 = v27 / 1000.0;
          v85 = 2112;
          v86 = v48;
          v87 = 2112;
          v88 = v49;
          v89 = 2049;
          v90 = v51;
          v91 = 2049;
          v92 = v53;
          v93 = 2049;
          v94 = v55;
          v95 = 2049;
          v96 = v56;
          _os_log_impl(&dword_1A49EF000, v47, OS_LOG_TYPE_DEFAULT, "ZKW Weather: Weather response pass.far: %.2f km (%@ -> %@) (%{private}f, %{private}f) -> (%{private}f, %{private}f)", (uint8_t *)&v83, 0x48u);

        }
        __atxlog_handle_metrics();
        v38 = objc_claimAutoreleasedReturnValue();
        __atxlog_handle_metrics();
        v57 = objc_claimAutoreleasedReturnValue();
        v40 = os_signpost_id_generate(v57);

        if (v40 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v38))
          goto LABEL_38;
        v83 = 134349056;
        v84 = 4;
      }
    }
    else
    {
      __atxlog_handle_ui();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "query");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject query](v18, "query");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject coordinate](v17, "coordinate");
        v32 = v31;
        -[NSObject coordinate](v17, "coordinate");
        v34 = v33;
        objc_msgSend(v25, "coordinate");
        v36 = v35;
        objc_msgSend(v25, "coordinate");
        v83 = 134219523;
        *(double *)&v84 = v27;
        v85 = 2112;
        v86 = v29;
        v87 = 2112;
        v88 = v30;
        v89 = 2049;
        v90 = v32;
        v91 = 2049;
        v92 = v34;
        v93 = 2049;
        v94 = v36;
        v95 = 2049;
        v96 = v37;
        _os_log_impl(&dword_1A49EF000, v28, OS_LOG_TYPE_DEFAULT, "ZKW Weather: Weather response pass.near: %.2f m (%@ -> %@) (%{private}f, %{private}f) -> (%{private}f, %{private}f)", (uint8_t *)&v83, 0x48u);

      }
      __atxlog_handle_metrics();
      v38 = objc_claimAutoreleasedReturnValue();
      __atxlog_handle_metrics();
      v39 = objc_claimAutoreleasedReturnValue();
      v40 = os_signpost_id_generate(v39);

      if (v40 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v38))
        goto LABEL_38;
      v83 = 134349056;
      v84 = 3;
    }
    _os_signpost_emit_with_name_impl(&dword_1A49EF000, v38, OS_SIGNPOST_EVENT, v40, "ATXSpotlightWeatherResponse", "result=%{public, signpost.telemetry:number1}lu enableTelemetry=YES ", (uint8_t *)&v83, 0xCu);
LABEL_38:

    __atxlog_handle_metrics();
    v62 = objc_claimAutoreleasedReturnValue();
    __atxlog_handle_metrics();
    v63 = objc_claimAutoreleasedReturnValue();
    v64 = os_signpost_id_generate(v63);

    if (v64 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v62))
    {
      v83 = 134349056;
      *(double *)&v84 = v27;
      _os_signpost_emit_with_name_impl(&dword_1A49EF000, v62, OS_SIGNPOST_EVENT, v64, "ATXSpotlightWeatherResponse", "distance=%{public, signpost.telemetry:number2}.0f enableTelemetry=YES ", (uint8_t *)&v83, 0xCu);
    }

LABEL_42:
LABEL_43:

  }
}

- (id)_replaceMissingWithError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  Boolean keyExistsAndHasValidFormat[16];

  v4 = a3;
  keyExistsAndHasValidFormat[0] = 0;
  if (CFPreferencesGetAppBooleanValue(CFSTR("zkwShowErrorTopicResponse"), (CFStringRef)*MEMORY[0x1E0CF9510], keyExistsAndHasValidFormat))
  {
    __atxlog_handle_ui();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)keyExistsAndHasValidFormat = 0;
      _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "ZKW Server Result: Debug: Replacing empty response with debug ui", keyExistsAndHasValidFormat, 2u);
    }

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __55__ATXSpotlightClientResponse__replaceMissingWithError___block_invoke;
    v9[3] = &unk_1E4D5B198;
    v9[4] = self;
    objc_msgSend(v4, "_pas_mappedArrayWithIndexedTransform:", v9);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v4;
  }
  v7 = v6;

  return v7;
}

id __55__ATXSpotlightClientResponse__replaceMissingWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  id v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  id v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "results");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "normalizedTopic");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("Missing: %@"), v14);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v8, "identifier");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v16)
      v18 = (const __CFString *)v16;
    else
      v18 = CFSTR("nil");
    objc_msgSend(v15, "addObject:", v18);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = v8;
      objc_msgSend(v19, "query");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v20;
      if (v20)
        v22 = (const __CFString *)v20;
      else
        v22 = CFSTR("nil");
      objc_msgSend(v15, "addObject:", v22);

      v23 = (void *)MEMORY[0x1E0CB3940];
      v24 = objc_msgSend(v19, "queryType");

      objc_msgSend(v23, "stringWithFormat:", CFSTR("%d"), v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v25);

    }
    objc_msgSend(v11, "identifier");
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v26;
    if (v26)
      v28 = (const __CFString *)v26;
    else
      v28 = CFSTR("nil");
    objc_msgSend(v15, "addObject:", v28);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = v11;
      objc_msgSend(v29, "query");
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = (void *)v30;
      if (v30)
        v32 = (const __CFString *)v30;
      else
        v32 = CFSTR("nil");
      objc_msgSend(v15, "addObject:", v32);

      v33 = (void *)MEMORY[0x1E0CB3940];
      v34 = objc_msgSend(v29, "queryType");

      objc_msgSend(v33, "stringWithFormat:", CFSTR("%d"), v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v35);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v36 = v8;
      if (objc_msgSend(v36, "queryType") == 2 || objc_msgSend(v36, "queryType") == 3)
      {
        objc_msgSend(v36, "identifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v36, "queryType") == 1)
      {
        v42 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v36, "identifier");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (void *)objc_msgSend(v42, "initWithFormat:", CFSTR("%@ site:music.apple.com"), v43);

      }
      else
      {
        v37 = 0;
      }

    }
    else
    {
      v37 = 0;
    }
    __atxlog_handle_ui();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v47 = a3;
      v48 = 2112;
      v49 = v15;
      _os_log_impl(&dword_1A49EF000, v38, OS_LOG_TYPE_DEFAULT, "ZKW Server Result: Debug: [%lu] %@", buf, 0x16u);
    }

    objc_msgSend((id)objc_opt_class(), "_resultForError:subtitles:searchString:", v44, v15, v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v39;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setResults:", v40);

  }
  return v5;
}

+ (id)_resultForError:(id)a3 subtitles:(id)a4 searchString:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v25 = a5;
  v9 = objc_alloc_init(MEMORY[0x1E0D8C6A8]);
  objc_msgSend(v9, "setResultBundleId:", &stru_1E4D5DB30);
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setText:", v7);
  objc_msgSend(v9, "setTitle:", v10);
  objc_msgSend(v9, "setCompletion:", v7);
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setSymbolName:", CFSTR("exclamationmark.triangle.fill"));
  objc_msgSend(v11, "setPunchThroughBackground:", 0);
  objc_msgSend(v11, "setPrimaryColor:", 5);
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setShouldUseCompactDisplay:", 1);
  objc_msgSend(v12, "setThumbnail:", v11);
  v26 = v7;
  objc_msgSend(MEMORY[0x1E0D8C660], "textWithString:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTitle:", v13);

  v14 = (void *)objc_opt_new();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v15 = v8;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v28 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(MEMORY[0x1E0D8C660], "textWithString:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v20);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v17);
  }

  objc_msgSend(v12, "setDescriptions:", v14);
  if (v25)
  {
    v21 = objc_alloc_init(MEMORY[0x1E0D8C6C8]);
    objc_msgSend(v21, "setSearchString:", v25);
    objc_msgSend(v12, "setCommand:", v21);

  }
  v22 = (void *)objc_opt_new();
  v31 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCardSections:", v23);

  objc_msgSend(v9, "setInlineCard:", v22);
  return v9;
}

+ (unint64_t)_trialSuggestionsMaxCountWithDefault:(unint64_t)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  int v9;
  unint64_t v10;
  __int16 v11;
  const __CFString *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC09C8], "clientWithIdentifier:", 232);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "levelForFactor:withNamespaceName:", CFSTR("ZKWSuggestionsMaxCount"), CFSTR("SPOTLIGHT_UI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_ui();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412802;
    v10 = (unint64_t)v5;
    v11 = 2112;
    v12 = CFSTR("ZKWSuggestionsMaxCount");
    v13 = 2048;
    v14 = objc_msgSend(v5, "longValue");
    _os_log_impl(&dword_1A49EF000, v6, OS_LOG_TYPE_DEFAULT, "+[ATXSpotlightClientResponse _trialSuggestionsMaxCount]: level(%@)=%@ level.longValue=%lld", (uint8_t *)&v9, 0x20u);
  }

  if (v5)
  {
    a3 = objc_msgSend(v5, "longValue");
  }
  else
  {
    __atxlog_handle_ui();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134217984;
      v10 = a3;
      _os_log_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEFAULT, "+[ATXSpotlightClientResponse _trialSuggestionsMaxCount]: level is null. returning default value of %lu", (uint8_t *)&v9, 0xCu);
    }

  }
  return a3;
}

void __69__ATXSpotlightClientResponse__addIdentifiersFromTopics_serverTopics___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A49EF000, a1, a3, "ZKW Server Id: Skip requestedTopic nil", a5, a6, a7, a8, 0);
}

void __69__ATXSpotlightClientResponse__addIdentifiersFromTopics_serverTopics___block_invoke_2_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A49EF000, a1, a3, "ZKW Server Id: Skip identifier nil", a5, a6, a7, a8, 0);
}

void __75__ATXSpotlightClientResponse__logWeatherResponsesWithTopics_serverResults___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_fault_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_FAULT, "ZKW Weather: Weather response mismatch: %@", (uint8_t *)&v5, 0xCu);

}

@end
