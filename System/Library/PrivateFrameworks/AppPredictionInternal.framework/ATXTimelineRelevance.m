@implementation ATXTimelineRelevance

- (ATXTimelineRelevance)initWithWidget:(id)a3 criterionRegistry:(id)a4 abuseControlConfig:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSString *v12;
  NSString *sourceId;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (self)
  {
    objc_storeStrong((id *)&self->_widget, a3);
    objc_storeStrong((id *)&self->_criterionRegistry, a4);
    objc_storeStrong((id *)&self->_abuseControlConfig, a5);
    objc_msgSend(v9, "atxTimelineIdentifier");
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    sourceId = self->_sourceId;
    self->_sourceId = v12;

    -[ATXTimelineRelevance standardizeWidgetSizes](self, "standardizeWidgetSizes");
  }

  return self;
}

- (void)standardizeWidgetSizes
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  CHSWidget *v7;
  CHSWidget *widget;
  id v9;

  if (-[CHSWidget family](self->_widget, "family") == 5)
  {
    v3 = objc_alloc(MEMORY[0x1E0D10148]);
    -[CHSWidget extensionIdentity](self->_widget, "extensionIdentity");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[CHSWidget kind](self->_widget, "kind");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CHSWidget intentReference](self->_widget, "intentReference");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "intent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (CHSWidget *)objc_msgSend(v3, "initWithExtensionIdentity:kind:family:intent:activityIdentifier:", v9, v4, 2, v6, 0);
    widget = self->_widget;
    self->_widget = v7;

  }
}

- (id)infoSuggestionsFromTimelineEntries:(id)a3 latestInfoSuggestionRelevantNow:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  ATXTimelineRelevance *v21;
  CHSWidget *widget;
  id WeakRetained;
  void *v24;
  void *v25;
  void *v26;
  CHSWidget *v27;
  id v28;
  void *v29;
  ATXTimelineRelevance *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  _BYTE v43[128];
  uint64_t v44;

  v31 = self;
  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v32 = a4;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v34 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v10, "relevance", v31);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        __atxlog_handle_timeline();
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
        if (v11)
        {
          if (v13)
          {
            objc_msgSend(v10, "date");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "relevance");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "score");
            v17 = v16;
            objc_msgSend(v10, "relevance");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "duration");
            *(_DWORD *)buf = 138412802;
            v38 = v14;
            v39 = 2048;
            v40 = v17;
            v41 = 2048;
            v42 = v19;
            _os_log_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_DEFAULT, "ATXTimelineRelevance: received timeline entry for date %@ with relevance %f and duration %f", buf, 0x20u);

          }
        }
        else if (v13)
        {
          objc_msgSend(v10, "date");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v38 = v20;
          _os_log_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_DEFAULT, "ATXTimelineRelevance: received timeline entry for date %@ with nil relevance", buf, 0xCu);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    }
    while (v7);
  }
  v21 = v31;
  if (-[ATXTimelineRelevance isWidgetFamilyEligibleForSuggestion](v31, "isWidgetFamilyEligibleForSuggestion", v31))
  {
    widget = v21->_widget;
    WeakRetained = objc_loadWeakRetained((id *)&v21->_delegate);
    +[ATXTimelineRelevanceFilter filteredAndSortedTimelineEntriesForWidget:entries:withTimelineEntryDelegate:abuseControlConfig:](ATXTimelineRelevanceFilter, "filteredAndSortedTimelineEntriesForWidget:entries:withTimelineEntryDelegate:abuseControlConfig:", widget, v5, WeakRetained, v21->_abuseControlConfig);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = v32;
    -[ATXTimelineRelevance generateSuggestionsWithTimelineEntries:latestInfoSuggestionRelevantNow:](v21, "generateSuggestionsWithTimelineEntries:latestInfoSuggestionRelevantNow:", v24, v32);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v21->_widget;
    v28 = objc_loadWeakRetained((id *)&v21->_delegate);
    +[ATXTimelineRelevanceFilter applyLimitsToTimelineSuggestions:forWidget:withTimelineEntryDelegate:abuseControlConfig:](ATXTimelineRelevanceFilter, "applyLimitsToTimelineSuggestions:forWidget:withTimelineEntryDelegate:abuseControlConfig:", v26, v27, v28, v21->_abuseControlConfig);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v29 = (void *)MEMORY[0x1E0C9AA60];
    v25 = v32;
  }

  return v29;
}

- (id)generateSuggestionsWithTimelineEntries:(id)a3 latestInfoSuggestionRelevantNow:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id WeakRetained;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  ATXTimelineRelevance *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = objc_opt_new();
  }
  v10 = (void *)v9;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("date"), 1);
  v23[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingDescriptors:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __95__ATXTimelineRelevance_generateSuggestionsWithTimelineEntries_latestInfoSuggestionRelevantNow___block_invoke;
  v19[3] = &unk_1E82EBE78;
  v20 = v8;
  v14 = v10;
  v21 = v14;
  v22 = self;
  v15 = v8;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v19);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "recordRecentTimelineEntries:forWidget:", v15, self->_widget);

  v17 = v14;
  return v17;
}

void __95__ATXTimelineRelevance_generateSuggestionsWithTimelineEntries_latestInfoSuggestionRelevantNow___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "relevance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "relevance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "score");
    v7 = v6;

    v8 = *(void **)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 32);
    if (v7 >= 2.22044605e-16)
    {
      objc_msgSend(v8, "processTimelineEntryWithPositiveScore:withPreviousInfoSuggestion:updatingTimelineEntryToSuggestionMapping:", v12, v4, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);

    }
    else
    {
      objc_msgSend(v8, "processTimelineEntryWithNonPositiveScore:withPreviousInfoSuggestion:updatingTimelineEntryToSuggestionMapping:", v12, v4, v9);
    }
  }
  else
  {
    v10 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0D81230], "entryMappingWithTimelineEntry:suggestionId:withSuggestionMappingReason:", v12, 0, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v4);
  }

}

- (void)processTimelineEntryWithNonPositiveScore:(id)a3 withPreviousInfoSuggestion:(id)a4 updatingTimelineEntryToSuggestionMapping:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v7 = a4;
  v8 = a5;
  if (v7)
  {
    objc_msgSend(v7, "endDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(v7, "setEndDate:", v10);

      v20 = (void *)MEMORY[0x1E0D81230];
      objc_msgSend(v7, "suggestionIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "entryMappingWithTimelineEntry:suggestionId:withSuggestionMappingReason:", v22, v19, 5);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v21);

      goto LABEL_9;
    }
    objc_msgSend(v7, "endDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "earlierDate:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 == v13)
    {
      objc_msgSend(v22, "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setEndDate:", v14);

      v15 = (void *)MEMORY[0x1E0D81230];
      objc_msgSend(v7, "suggestionIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "entryMappingWithTimelineEntry:suggestionId:withSuggestionMappingReason:", v22, v16, 4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v17);

    }
    v18 = (void *)MEMORY[0x1E0D81230];
  }
  else
  {
    v18 = (void *)MEMORY[0x1E0D81230];
  }
  objc_msgSend(v18, "entryMappingWithTimelineEntry:suggestionId:withSuggestionMappingReason:", v22, 0, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v19);
LABEL_9:

}

- (id)processTimelineEntryWithPositiveScore:(id)a3 withPreviousInfoSuggestion:(id)a4 updatingTimelineEntryToSuggestionMapping:(id)a5
{
  id v8;
  id v9;
  id v10;
  _BOOL4 v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v44;
  void *v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!-[ATXTimelineRelevance overlapExistsBetween:andTimelineEntry:](self, "overlapExistsBetween:andTimelineEntry:", v9, v8))
  {
LABEL_9:
    -[ATXTimelineRelevance infoSuggestionWithTimelineEntry:](self, "infoSuggestionWithTimelineEntry:", v8);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)MEMORY[0x1E0D81230];
    objc_msgSend(v30, "suggestionIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "entryMappingWithTimelineEntry:suggestionId:withSuggestionMappingReason:", v8, v28, 6);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v11 = -[ATXTimelineRelevance startDatesAreCloseEnoughToMerge:withTimelineEntry:](self, "startDatesAreCloseEnoughToMerge:withTimelineEntry:", v9, v8);
  __atxlog_handle_timeline();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (!v11)
  {
    if (v13)
    {
      objc_msgSend(v8, "date");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "relevance");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "duration");
      v34 = v33;
      objc_msgSend(v9, "startDate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "endDate");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "relevance");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "score");
      v44 = 138413314;
      v45 = v31;
      v46 = 2048;
      v47 = v34;
      v48 = 2112;
      v49 = v35;
      v50 = 2112;
      v51 = v36;
      v52 = 2048;
      v53 = v38;
      _os_log_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_INFO, "Creating new info suggestion for timeline relevance entry (startDate: %@, duration: %f) with previous entry (startDate: %@, endDate: %@). Both have a relevance score of %f", (uint8_t *)&v44, 0x34u);

    }
    objc_msgSend(v9, "endDate");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "date");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "earlierDate:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setEndDate:", v41);

    goto LABEL_9;
  }
  if (v13)
  {
    objc_msgSend(v8, "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "relevance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "duration");
    v17 = v16;
    objc_msgSend(v9, "startDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "endDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "relevance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "score");
    v44 = 138413314;
    v45 = v14;
    v46 = 2048;
    v47 = v17;
    v48 = 2112;
    v49 = v18;
    v50 = 2112;
    v51 = v19;
    v52 = 2048;
    v53 = v21;
    _os_log_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_INFO, "Merging timeline relevance entry (startDate: %@, duration: %f) with previous entry (startDate: %@, endDate: %@). Both have a relevance score of %f", (uint8_t *)&v44, 0x34u);

  }
  objc_msgSend(v9, "endDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "date");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "relevance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "duration");
  objc_msgSend(v23, "dateByAddingTimeInterval:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "laterDate:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEndDate:", v26);

  v27 = (void *)MEMORY[0x1E0D81230];
  objc_msgSend(v9, "suggestionIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "entryMappingWithTimelineEntry:suggestionId:withSuggestionMappingReason:", v8, v28, 3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
LABEL_10:
  objc_msgSend(v10, "addObject:", v29);

  return v30;
}

- (BOOL)startDatesAreCloseEnoughToMerge:(id)a3 withTimelineEntry:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  BOOL v9;

  if (!a3)
    return 0;
  v5 = a3;
  objc_msgSend(a4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "timeIntervalSinceDate:", v7);
  v9 = v8 < 3600.0;

  return v9;
}

- (BOOL)overlapExistsBetween:(id)a3 andTimelineEntry:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  void *v25;
  void *v26;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "relevance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "duration");
  objc_msgSend(v7, "dateByAddingTimeInterval:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "relevanceScore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v12 = v11;
    objc_msgSend(v6, "relevance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "score");
    if (vabdd_f64(v12, v14) >= 2.22044605e-16)
    {
      v18 = 0;
LABEL_14:

      goto LABEL_15;
    }
    objc_msgSend(v5, "startDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "compare:", v9);
    if (v16)
    {
      objc_msgSend(v5, "startDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "compare:", v9) != -1)
      {
        v18 = 0;
        goto LABEL_12;
      }
      v26 = v17;
    }
    objc_msgSend(v6, "date");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "compare:", v20))
    {
      objc_msgSend(v6, "date");
      v25 = v15;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "endDate");
      v24 = v16;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v21, "compare:", v22) == -1;

      v15 = v25;
      v17 = v26;
      if (!v24)
      {
LABEL_13:

        goto LABEL_14;
      }
    }
    else
    {

      v18 = 1;
      v17 = v26;
      if (!v16)
        goto LABEL_13;
    }
LABEL_12:

    goto LABEL_13;
  }
  v18 = 0;
LABEL_15:

  return v18;
}

- (id)infoSuggestionWithTimelineEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v4 = a3;
  objc_msgSend(v4, "date");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "relevance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "score");
  objc_msgSend(v5, "numberWithDouble:");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "relevance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "duration");
  v9 = v8;

  v29 = v4;
  if (v9 <= 300.0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 3153600000.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "relevance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "duration");
    objc_msgSend(v10, "dateByAddingTimeInterval:");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v26 = objc_alloc(MEMORY[0x1E0D81150]);
  -[CHSWidget extensionIdentity](self->_widget, "extensionIdentity");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "containerBundleIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = &stru_1E82FDC98;
  if (v12)
    v14 = (const __CFString *)v12;
  v25 = v14;
  -[CHSWidget extensionIdentity](self->_widget, "extensionIdentity");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "extensionBundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHSWidget kind](self->_widget, "kind");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = +[ATXTimelineRelevance suggestionLayoutOptionsForAvocadoSizeClass:](ATXTimelineRelevance, "suggestionLayoutOptionsForAvocadoSizeClass:", -[CHSWidget family](self->_widget, "family"));
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "UUIDString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHSWidget intentReference](self->_widget, "intentReference");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "intent");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v26, "initWithAppBundleIdentifier:widgetBundleIdentifier:widgetKind:criterion:applicableLayouts:suggestionIdentifier:startDate:endDate:intent:metadata:relevanceScore:", v25, v15, v16, CFSTR("ATXTimelineEntryImportantTimelineUpdate"), v17, v19, v32, v30, v21, 0, v31);

  objc_msgSend(v22, "setConfidenceLevel:", -[ATXInfoSuggestionCriterionRegistry confidenceLevelForCriterion:sourceIdentifier:](self->_criterionRegistry, "confidenceLevelForCriterion:sourceIdentifier:", CFSTR("ATXTimelineEntryImportantTimelineUpdate"), CFSTR("com.apple.proactive.timelineSuggestion")));
  objc_msgSend(v22, "setSourceIdentifier:", self->_sourceId);
  objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setClientModelId:", v23);

  return v22;
}

- (BOOL)isWidgetFamilyEligibleForSuggestion
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (-[CHSWidget family](self->_widget, "family") == 5)
    goto LABEL_6;
  v3 = -[CHSWidget family](self->_widget, "family");
  if (v3 != 1)
  {
    if (-[CHSWidget family](self->_widget, "family") == 2
      || -[CHSWidget family](self->_widget, "family") == 3
      || -[CHSWidget family](self->_widget, "family") == 4)
    {
LABEL_6:
      LOBYTE(v3) = 1;
      return v3;
    }
    __atxlog_handle_timeline();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = -[CHSWidget family](self->_widget, "family");
      v7 = 134217984;
      v8 = v5;
      _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "ATXTimelineRelevance: Widget family is not eligible for suggestion %lu", (uint8_t *)&v7, 0xCu);
    }

    LOBYTE(v3) = 0;
  }
  return v3;
}

+ (unint64_t)suggestionLayoutOptionsForAvocadoSizeClass:(int64_t)a3
{
  NSObject *v4;

  if ((unint64_t)(a3 - 1) < 5)
    return qword_1C9E80F58[a3 - 1];
  __atxlog_handle_timeline();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    +[ATXTimelineRelevance suggestionLayoutOptionsForAvocadoSizeClass:].cold.1(v4);

  return 16;
}

- (ATXTimelineRelevanceDelegate)delegate
{
  return (ATXTimelineRelevanceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)sourceId
{
  return self->_sourceId;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_abuseControlConfig, 0);
  objc_storeStrong((id *)&self->_criterionRegistry, 0);
  objc_storeStrong((id *)&self->_sourceId, 0);
  objc_storeStrong((id *)&self->_widget, 0);
}

+ (void)suggestionLayoutOptionsForAvocadoSizeClass:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_FAULT, "ATXTimelineRelevance: unexpected widgetFamily CHSWidgetFamilyUndefined. This should never happen.", v1, 2u);
}

@end
