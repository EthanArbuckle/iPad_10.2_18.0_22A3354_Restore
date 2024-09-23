@implementation _ATXHomeScreenTimelineRelevanceFilter

- (_ATXHomeScreenTimelineRelevanceFilter)initWithTimelineRelevanceStore:(id)a3
{
  id v5;
  _ATXHomeScreenTimelineRelevanceFilter *v6;
  _ATXHomeScreenTimelineRelevanceFilter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_ATXHomeScreenTimelineRelevanceFilter;
  v6 = -[_ATXHomeScreenTimelineRelevanceFilter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_timelineRelevanceStore, a3);

  return v7;
}

- (void)scheduleBlendingRefreshAtNextTimelineRelevanceChangeRelatedToSuggestions:(id)a3
{
  uint64_t v4;
  id v5;

  -[_ATXHomeScreenTimelineRelevanceFilter _nextTimelineRelevanceChangeDateRelatedToSuggestions:](self, "_nextTimelineRelevanceChangeDateRelatedToSuggestions:", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (id)v4;
  if (v4)
    -[_ATXHomeScreenTimelineRelevanceFilter _scheduleBlendingRefreshAtDate:reason:](self, "_scheduleBlendingRefreshAtDate:reason:", v4, CFSTR("Timeline relevance change"));
  else
    -[_ATXHomeScreenTimelineRelevanceFilter _cancelAnyExistingScheduledRefresh](self, "_cancelAnyExistingScheduledRefresh");

}

- (id)removeSuggestionsByTimelineRelevanceIfNecessary:(id)a3 homeScreenState:(id)a4
{
  id v6;
  id v7;
  _ATXHomeScreenTimelineRelevanceFilter *v8;
  void *v9;
  id v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  ATXInformationStore *timelineRelevanceStore;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  const char *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  __int128 v44;
  _ATXHomeScreenTimelineRelevanceFilter *v45;
  id v46;
  void *v47;
  id v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  void *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self;
  v48 = v7;
  v9 = (void *)objc_opt_new();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v51;
    *(_QWORD *)&v12 = 134218498;
    v44 = v12;
    v46 = v10;
    v47 = v9;
    v45 = self;
    v49 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v51 != v14)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        objc_msgSend(v16, "executableSpecification", v44);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "executableType");

        if (v18 != 3)
        {
          objc_msgSend(v9, "addObject:", v16);
          continue;
        }
        objc_msgSend(MEMORY[0x1E0D81150], "infoSuggestionFromProactiveSuggestion:", v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          if (!-[_ATXHomeScreenTimelineRelevanceFilter _widgetExistsOnScreen:homeScreenState:](v8, "_widgetExistsOnScreen:homeScreenState:", v19, v48))
          {
            timelineRelevanceStore = v8->_timelineRelevanceStore;
            objc_msgSend(v19, "widgetBundleIdentifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "widgetKind");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "intent");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -1800.0);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(timelineRelevanceStore) = -[ATXInformationStore didMostRecentReloadFailForExtension:kind:intent:cutoffDate:](timelineRelevanceStore, "didMostRecentReloadFailForExtension:kind:intent:cutoffDate:", v24, v25, v26, v27);

            if (!(_DWORD)timelineRelevanceStore)
            {
              v9 = v47;
              objc_msgSend(v47, "addObject:", v16);
LABEL_38:
              v10 = v46;
              v14 = v49;
              goto LABEL_39;
            }
            __atxlog_handle_blending();
            v28 = objc_claimAutoreleasedReturnValue();
            v10 = v46;
            v9 = v47;
            v14 = v49;
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v55 = (uint64_t)v16;
              v29 = v28;
              v30 = "HSLS [preprocess]: Removing suggestion due to recent reload failure:\n%@";
              goto LABEL_29;
            }
LABEL_30:

            goto LABEL_39;
          }
          objc_msgSend(v19, "intent");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "atx_indexingHash");

          if ((objc_msgSend(v19, "layouts") & 8) != 0)
          {
            if (-[_ATXHomeScreenTimelineRelevanceFilter _isCurrentTimelineRelevanceScoreZeroForSuggestion:family:intentIndexingHash:](v8, "_isCurrentTimelineRelevanceScoreZeroForSuggestion:family:intentIndexingHash:", v19, 1, v21))
            {
              v22 = 0;
            }
            else
            {
              v22 = 8;
            }
          }
          else
          {
            v22 = 0;
          }
          v14 = v49;
          if ((objc_msgSend(v19, "layouts") & 0x10) != 0
            && !-[_ATXHomeScreenTimelineRelevanceFilter _isCurrentTimelineRelevanceScoreZeroForSuggestion:family:intentIndexingHash:](v8, "_isCurrentTimelineRelevanceScoreZeroForSuggestion:family:intentIndexingHash:", v19, 2, v21))
          {
            v22 |= 0x10uLL;
          }
          if ((objc_msgSend(v19, "layouts") & 0x40) != 0
            && !-[_ATXHomeScreenTimelineRelevanceFilter _isCurrentTimelineRelevanceScoreZeroForSuggestion:family:intentIndexingHash:](v8, "_isCurrentTimelineRelevanceScoreZeroForSuggestion:family:intentIndexingHash:", v19, 3, v21))
          {
            v22 |= 0x40uLL;
          }
          if ((objc_msgSend(v19, "layouts") & 0x80) != 0
            && !-[_ATXHomeScreenTimelineRelevanceFilter _isCurrentTimelineRelevanceScoreZeroForSuggestion:family:intentIndexingHash:](v8, "_isCurrentTimelineRelevanceScoreZeroForSuggestion:family:intentIndexingHash:", v19, 4, v21))
          {
            v22 |= 0x80uLL;
          }
          else if (!v22)
          {
            __atxlog_handle_blending();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v55 = (uint64_t)v16;
              v29 = v28;
              v30 = "HSLS [preprocess]: Removing suggestion due to zero timeline relevance score:\n%@";
LABEL_29:
              _os_log_impl(&dword_1C9A3B000, v29, OS_LOG_TYPE_DEFAULT, v30, buf, 0xCu);
            }
            goto LABEL_30;
          }
          if (v22 != objc_msgSend(v19, "layouts"))
          {
            __atxlog_handle_blending();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              v32 = objc_msgSend(v19, "layouts");
              *(_DWORD *)buf = v44;
              v55 = v32;
              v56 = 2048;
              v57 = v22;
              v58 = 2112;
              v59 = v16;
              _os_log_impl(&dword_1C9A3B000, v31, OS_LOG_TYPE_DEFAULT, "HSLS [preprocess]: Upating suggestion eligibleLayoutOptions (old %lu, new %lu) due to zero timeline relevance score:\n%@", buf, 0x20u);
            }

            objc_msgSend(v19, "setLayouts:", v22);
            v33 = (void *)MEMORY[0x1E0D81150];
            objc_msgSend(v16, "clientModelSpecification");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "clientModelId");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "clientModelSpecification");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "clientModelVersion");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "scoreSpecification");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "rawScore");
            v40 = v39;
            objc_msgSend(v16, "scoreSpecification");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "proactiveSuggestionForInfoSuggestion:withClientModelId:clientModelVersion:rawScore:confidenceCategory:", v19, v35, v37, objc_msgSend(v41, "suggestedConfidenceCategory"), v40);
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            v9 = v47;
            objc_msgSend(v47, "addObject:", v42);

            v8 = v45;
            goto LABEL_38;
          }
          objc_msgSend(v9, "addObject:", v16);
        }
LABEL_39:

      }
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
    }
    while (v13);
  }

  return v9;
}

- (void)_cancelAnyExistingScheduledRefresh
{
  xpc_activity_unregister("com.apple.duetexpertd.HomeScreenTimelineRelevance");
}

- (void)_scheduleBlendingRefreshAtDate:(id)a3 reason:(id)a4
{
  id v5;
  id v6;
  xpc_object_t v7;
  const char *v8;
  double v9;
  double v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  v6 = a3;
  v7 = xpc_dictionary_create(0, 0, 0);
  v8 = (const char *)*MEMORY[0x1E0C80760];
  objc_msgSend(v6, "timeIntervalSinceNow");
  v10 = v9;

  xpc_dictionary_set_int64(v7, v8, (uint64_t)v10);
  xpc_dictionary_set_int64(v7, (const char *)*MEMORY[0x1E0C80790], 300);
  xpc_dictionary_set_BOOL(v7, (const char *)*MEMORY[0x1E0C808B8], 1);
  xpc_dictionary_set_BOOL(v7, (const char *)*MEMORY[0x1E0C80738], 1);
  xpc_dictionary_set_BOOL(v7, (const char *)*MEMORY[0x1E0C80898], 0);
  xpc_dictionary_set_string(v7, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80888]);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __79___ATXHomeScreenTimelineRelevanceFilter__scheduleBlendingRefreshAtDate_reason___block_invoke;
  v12[3] = &unk_1E82DA770;
  v13 = v5;
  v11 = v5;
  atxRegisterCTSJobHandler("com.apple.duetexpertd.HomeScreenTimelineRelevance", v7, v12);

}

- (id)_nextTimelineRelevanceChangeDateRelatedToSuggestions:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  NSObject *v26;
  id v27;
  void *v28;
  NSObject *v29;
  void *v31;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v5 = v3;
  v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v6)
  {
    v31 = 0;
    v7 = *(_QWORD *)v35;
    v8 = v4;
    do
    {
      v9 = 0;
      v33 = v6;
      do
      {
        if (*(_QWORD *)v35 != v7)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v9);
        objc_msgSend(v10, "executableSpecification");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "executableType");

        if (v12 == 3)
        {
          v13 = v5;
          v14 = (void *)MEMORY[0x1E0D81150];
          v15 = v4;
          v16 = v4;
          objc_msgSend(v14, "infoSuggestionFromProactiveSuggestion:", v10);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[_ATXHomeScreenTimelineRelevanceFilter _nextRefreshDateForSuggestion:familyMask:](self, "_nextRefreshDateForSuggestion:familyMask:", v17, ((unint64_t)objc_msgSend(v17, "layouts") >> 2) & 4 | ((unint64_t)objc_msgSend(v17, "layouts") >> 2) & 2 | ((unint64_t)objc_msgSend(v17, "layouts") >> 3) & 8 | ((unint64_t)objc_msgSend(v17, "layouts") >> 3) & 0x10);
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = (void *)v18;
          if (v18)
            v20 = (void *)v18;
          else
            v20 = v16;
          v21 = v20;

          objc_msgSend(v16, "earlierDate:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v8, "earlierDate:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22 == v23)
          {
            v24 = v22;

            v25 = v10;
            v31 = v25;
            v8 = v24;
          }

          v4 = v15;
          v5 = v13;
          v6 = v33;
        }
        v9 = (char *)v9 + 1;
      }
      while (v6 != v9);
      v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v6);

    if (v8 != v4)
    {
      __atxlog_handle_blending();
      v26 = objc_claimAutoreleasedReturnValue();
      v6 = v31;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v39 = v8;
        v40 = 2112;
        v41 = v31;
        _os_log_impl(&dword_1C9A3B000, v26, OS_LOG_TYPE_DEFAULT, "HSLS [preprocess]: Scheduling Blending refresh at %{public}@ due to future zero timeline relevance score of suggestion:\n%@", buf, 0x16u);
      }

      v27 = v8;
      v28 = v27;
      goto LABEL_24;
    }
    v6 = v31;
  }
  else
  {

  }
  __atxlog_handle_blending();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v29, OS_LOG_TYPE_DEFAULT, "HSLS [preprocess]: No future zero timeline relevance score found related to suggestions.", buf, 2u);
  }

  v28 = 0;
  v27 = v4;
LABEL_24:

  return v28;
}

- (id)_nextRefreshDateForSuggestion:(id)a3 familyMask:(unint64_t)a4
{
  ATXInformationStore *timelineRelevanceStore;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  timelineRelevanceStore = self->_timelineRelevanceStore;
  v6 = a3;
  objc_msgSend(v6, "widgetBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "widgetKind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "intent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXInformationStore upcomingDateThatTimelineScoreChangesToOrFromZeroForWidget:kind:familyMask:intent:](timelineRelevanceStore, "upcomingDateThatTimelineScoreChangesToOrFromZeroForWidget:kind:familyMask:intent:", v7, v8, a4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)_isCurrentTimelineRelevanceScoreZeroForSuggestion:(id)a3 family:(int64_t)a4 intentIndexingHash:(int64_t)a5
{
  id v8;
  ATXInformationStore *timelineRelevanceStore;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  NSObject *v17;
  BOOL v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  double v28;

  v8 = a3;
  timelineRelevanceStore = self->_timelineRelevanceStore;
  objc_msgSend(v8, "widgetBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "widgetKind");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXInformationStore mostRecentTimelineEntryWithScoreForWidget:kind:family:intentIndexingHash:](timelineRelevanceStore, "mostRecentTimelineEntryWithScoreForWidget:kind:family:intentIndexingHash:", v10, v11, a4, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "relevance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v12, "relevance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "duration");
    v16 = v15;

    if (v16 >= 0.0)
    {
      objc_msgSend(v12, "relevance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "duration");
      v21 = v20;

      if (v21 == 0.0)
      {
        objc_msgSend(v12, "relevance");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "score");
        v18 = v23 <= 0.0;
      }
      else
      {
        objc_msgSend(v12, "date");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "relevance");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "duration");
        objc_msgSend(v24, "dateByAddingTimeInterval:");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "timeIntervalSinceNow");
        if (v26 <= 0.0)
        {
          v18 = 0;
        }
        else
        {
          objc_msgSend(v12, "relevance");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "score");
          v18 = v28 <= 0.0;

        }
      }

    }
    else
    {
      __atxlog_handle_blending();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[_ATXHomeScreenTimelineRelevanceFilter _isCurrentTimelineRelevanceScoreZeroForSuggestion:family:intentIndexingHash:].cold.1((uint64_t)v8, v17);

      v18 = 1;
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)_widgetExistsOnScreen:(id)a3 homeScreenState:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  uint64_t v35;
  BOOL v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id obj;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  objc_msgSend(a4, "sortedPagesByUserLastVisit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v56;
    v44 = v6;
    v39 = *(_QWORD *)v56;
    do
    {
      v9 = 0;
      v38 = v7;
      do
      {
        if (*(_QWORD *)v56 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v9);
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        objc_msgSend(v10, "stacks");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
        if (v42)
        {
          v12 = *(_QWORD *)v52;
          v40 = *(_QWORD *)v52;
          v41 = v9;
          v45 = v11;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v52 != v12)
                objc_enumerationMutation(v11);
              v43 = v13;
              v14 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v13);
              v47 = 0u;
              v48 = 0u;
              v49 = 0u;
              v50 = 0u;
              objc_msgSend(v14, "config");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "widgets");
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              obj = v16;
              v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
              if (v17)
              {
                v18 = v17;
                v19 = *(_QWORD *)v48;
                do
                {
                  v20 = 0;
                  do
                  {
                    if (*(_QWORD *)v48 != v19)
                      objc_enumerationMutation(obj);
                    v21 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v20);
                    objc_msgSend(v21, "extensionBundleId");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v5, "widgetBundleIdentifier");
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((objc_msgSend(v22, "isEqualToString:", v23) & 1) != 0)
                    {
                      objc_msgSend(v21, "widgetKind");
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v5, "widgetKind");
                      v25 = (void *)objc_claimAutoreleasedReturnValue();
                      v26 = objc_msgSend(v24, "isEqualToString:", v25);

                      if (v26)
                      {
                        objc_msgSend(v21, "intent");
                        v27 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v27)
                        {

                        }
                        else
                        {
                          objc_msgSend(v5, "intent");
                          v28 = (void *)objc_claimAutoreleasedReturnValue();

                          if (!v28)
                            goto LABEL_34;
                        }
                        objc_msgSend(v21, "intent");
                        v29 = objc_claimAutoreleasedReturnValue();
                        if (v29)
                        {
                          v30 = (void *)v29;
                          objc_msgSend(v5, "intent");
                          v31 = (void *)objc_claimAutoreleasedReturnValue();

                          if (v31)
                          {
                            objc_msgSend(v21, "intent");
                            v32 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v5, "intent");
                            v33 = (void *)objc_claimAutoreleasedReturnValue();
                            v34 = objc_msgSend(v32, "atx_isEqualToIntent:", v33);

                            if ((v34 & 1) != 0)
                            {
LABEL_34:

                              v36 = 1;
                              v6 = v44;
                              goto LABEL_36;
                            }
                          }
                        }
                      }
                    }
                    else
                    {

                    }
                    ++v20;
                  }
                  while (v18 != v20);
                  v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
                  v18 = v35;
                }
                while (v35);
              }

              v13 = v43 + 1;
              v6 = v44;
              v11 = v45;
              v12 = v40;
              v9 = v41;
            }
            while (v43 + 1 != v42);
            v42 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
          }
          while (v42);
        }

        ++v9;
        v8 = v39;
      }
      while (v9 != v38);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
      v8 = v39;
      v36 = 0;
    }
    while (v7);
  }
  else
  {
    v36 = 0;
  }
LABEL_36:

  return v36;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timelineRelevanceStore, 0);
}

- (void)_isCurrentTimelineRelevanceScoreZeroForSuggestion:(uint64_t)a1 family:(NSObject *)a2 intentIndexingHash:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "_ATXHomeScreenTimelineRelevanceFilter: Unexpectedly found TimelineEntry with negative duration for suggestion %@", (uint8_t *)&v2, 0xCu);
}

@end
