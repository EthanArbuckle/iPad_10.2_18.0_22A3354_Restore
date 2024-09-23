@implementation ATXTimelineRelevanceFilter

+ (id)filteredAndSortedTimelineEntriesForWidget:(id)a3 entries:(id)a4 withTimelineEntryDelegate:(id)a5 abuseControlConfig:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  id v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  NSObject *v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v35;
  _QWORD v36[4];
  id v37;
  void *v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  unint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v9, "atxTimelineIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "extensionIdentity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "containerBundleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v11, "countOfInfoSuggestionsForBundleId:", v16);

  if (v17 > objc_msgSend(v12, "timelineUpdateLimitPerAppBundleId"))
  {
    __atxlog_handle_timeline();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "extensionIdentity");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "containerBundleIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v40 = (uint64_t)v20;
      v41 = 2048;
      v42 = v17;
      v43 = 2048;
      v44 = objc_msgSend(v12, "timelineUpdateLimitPerAppBundleId");
      _os_log_impl(&dword_1C9A3B000, v18, OS_LOG_TYPE_DEFAULT, "ATXInfoTimelineEntryFilter: Filtering out timeline update since the total number of entries for bundleId %@: %llu has exceeded limit (%lu)", buf, 0x20u);

    }
LABEL_7:

    v22 = v13;
    goto LABEL_15;
  }
  v21 = objc_msgSend(v11, "countOfInfoSuggestionsForSourceId:", v14);
  if (v21 > objc_msgSend(v12, "timelineUpdateLimitPerSource"))
  {
    __atxlog_handle_timeline();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v40 = (uint64_t)v14;
      v41 = 2048;
      v42 = v21;
      v43 = 2048;
      v44 = objc_msgSend(v12, "timelineUpdateLimitPerSource");
      _os_log_impl(&dword_1C9A3B000, v18, OS_LOG_TYPE_DEFAULT, "ATXInfoTimelineEntryFilter: Filtering out timeline update since the total number of entries for sourceId %@: %llu has exceeded limit (%lu)", buf, 0x20u);
    }
    goto LABEL_7;
  }
  objc_msgSend(v11, "latestUpdateDateForSourceId:", v14);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23
    && (objc_msgSend(MEMORY[0x1E0C99D68], "now"),
        v24 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v24, "timeIntervalSinceDate:", v23),
        v26 = v25,
        v27 = (double)(unint64_t)objc_msgSend(v12, "minimumSecondsBetweenMetadataUpdatesPerSource"),
        v24,
        v26 < v27))
  {
    __atxlog_handle_timeline();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v35 = objc_msgSend(v12, "minimumSecondsBetweenMetadataUpdatesPerSource");
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "timeIntervalSinceDate:", v23);
      *(_DWORD *)buf = 134218498;
      v40 = v35;
      v41 = 2112;
      v42 = (unint64_t)v14;
      v43 = 1024;
      LODWORD(v44) = (int)v30;
      _os_log_impl(&dword_1C9A3B000, v28, OS_LOG_TYPE_DEFAULT, "ATXInfoTimelineEntryFilter: Rate limiting limits reloads to one per %lu seconds. Filtering out timeline update for source %@ since the last update was %d seconds ago", buf, 0x1Cu);

    }
    v22 = v13;
  }
  else
  {
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("date"), 1);
    v38 = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sortedArrayUsingDescriptors:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __125__ATXTimelineRelevanceFilter_filteredAndSortedTimelineEntriesForWidget_entries_withTimelineEntryDelegate_abuseControlConfig___block_invoke;
    v36[3] = &unk_1E82E39B0;
    v37 = v9;
    objc_msgSend(v33, "_pas_filteredArrayWithTest:", v36);
    v22 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_15:

  return v22;
}

BOOL __125__ATXTimelineRelevanceFilter_filteredAndSortedTimelineEntriesForWidget_entries_withTimelineEntryDelegate_abuseControlConfig___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  NSObject *v13;

  v3 = a2;
  objc_msgSend(v3, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v6 = v5;
  objc_msgSend(v3, "relevance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "duration");
  v9 = v6 + v8;

  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceReferenceDate");
  v12 = vabdd_f64(v9, v11);

  if (v12 < 1.0)
  {
    __atxlog_handle_timeline();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __125__ATXTimelineRelevanceFilter_filteredAndSortedTimelineEntriesForWidget_entries_withTimelineEntryDelegate_abuseControlConfig___block_invoke_cold_1(a1, v13);

  }
  return v12 >= 1.0;
}

+ (id)applyLimitsToTimelineSuggestions:(id)a3 forWidget:(id)a4 withTimelineEntryDelegate:(id)a5 abuseControlConfig:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t);
  void *v26;
  id v27;
  id v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD v31[3];
  uint64_t v32;
  _QWORD v33[3];
  uint64_t v34;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v10, "atxTimelineIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v34 = 0;
  objc_msgSend(v10, "extensionIdentity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "containerBundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v11, "countOfInfoSuggestionsForBundleId:", v15);

  v34 = v16;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v32 = 0;
  v32 = objc_msgSend(v11, "countOfInfoSuggestionsForSourceId:", v13);
  v17 = (void *)MEMORY[0x1E0CB3880];
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __118__ATXTimelineRelevanceFilter_applyLimitsToTimelineSuggestions_forWidget_withTimelineEntryDelegate_abuseControlConfig___block_invoke;
  v26 = &unk_1E82E39D8;
  v29 = v33;
  v30 = v31;
  v18 = v12;
  v27 = v18;
  v19 = v13;
  v28 = v19;
  objc_msgSend(v17, "predicateWithBlock:", &v23);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "filteredArrayUsingPredicate:", v20, v23, v24, v25, v26);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v33, 8);

  return v21;
}

uint64_t __118__ATXTimelineRelevanceFilter_applyLimitsToTimelineSuggestions_forWidget_withTimelineEntryDelegate_abuseControlConfig___block_invoke(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v2 <= objc_msgSend(*(id *)(a1 + 32), "timelineUpdateLimitPerAppBundleId"))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    if (v3 <= objc_msgSend(*(id *)(a1 + 32), "timelineUpdateLimitPerSource"))
      return 1;
  }
  __atxlog_handle_timeline();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = objc_msgSend(*(id *)(a1 + 32), "timelineUpdateLimitPerSource");
    v7 = objc_msgSend(*(id *)(a1 + 32), "timelineUpdateLimitPerAppBundleId");
    v9 = 138412802;
    v10 = v5;
    v11 = 2048;
    v12 = v6;
    v13 = 2048;
    v14 = v7;
    _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "ATXInfoTimelineEntryFilter: Filtering out timeline update for source %@ since the total number of entries has exceeded limit for source (%lu) or limit for appBundleId (%lu)", (uint8_t *)&v9, 0x20u);
  }

  return 0;
}

void __125__ATXTimelineRelevanceFilter_filteredAndSortedTimelineEntriesForWidget_entries_withTimelineEntryDelegate_abuseControlConfig___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "extensionIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extensionBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "ATXInfoTimelineEntryFilter: Filtered timeline entry expiring in the distant future from: %@", (uint8_t *)&v5, 0xCu);

}

@end
