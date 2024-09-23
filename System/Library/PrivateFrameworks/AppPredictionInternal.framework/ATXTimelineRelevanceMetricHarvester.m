@implementation ATXTimelineRelevanceMetricHarvester

- (ATXTimelineRelevanceMetricHarvester)init
{
  NSObject *v3;
  ATXTimelineRelevanceMetricHarvester *v4;
  uint64_t v5;
  ATXInformationStore *informationStore;
  void *v7;
  void *v8;
  NSDate *v9;
  void *loggingStartDate;
  uint64_t v11;
  NSDate *v12;
  uint64_t v13;
  ATXTimelineAbuseControlConfig *abuseControlConfig;
  objc_super v16;
  uint8_t buf[16];

  __atxlog_handle_timeline();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "Initializing ATXTimelineRelevanceMetricHarvester.", buf, 2u);
  }

  v16.receiver = self;
  v16.super_class = (Class)ATXTimelineRelevanceMetricHarvester;
  v4 = -[ATXTimelineRelevanceMetricHarvester init](&v16, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CF8EC8], "sharedInstance");
    v5 = objc_claimAutoreleasedReturnValue();
    informationStore = v4->_informationStore;
    v4->_informationStore = (ATXInformationStore *)v5;

    -[ATXTimelineRelevanceMetricHarvester timeOfLatestMetricsSubmission](v4, "timeOfLatestMetricsSubmission");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
      loggingStartDate = v4->_loggingStartDate;
      v4->_loggingStartDate = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      loggingStartDate = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(loggingStartDate, "dateByAddingTimeInterval:", -604800.0);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v4->_loggingStartDate;
      v4->_loggingStartDate = (NSDate *)v11;

    }
    v13 = objc_opt_new();
    abuseControlConfig = v4->_abuseControlConfig;
    v4->_abuseControlConfig = (ATXTimelineAbuseControlConfig *)v13;

  }
  return v4;
}

- (ATXTimelineRelevanceMetricHarvester)initWithInformationStore:(id)a3
{
  id v5;
  ATXTimelineRelevanceMetricHarvester *v6;
  ATXTimelineRelevanceMetricHarvester *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXTimelineRelevanceMetricHarvester;
  v6 = -[ATXTimelineRelevanceMetricHarvester init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_informationStore, a3);

  return v7;
}

- (BOOL)isFirstParty:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("com.apple."));
}

- (id)widgetsForDataCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v11, "extensionIdentity");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "extensionBundleIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[ATXTimelineRelevanceMetricHarvester isFirstParty:](self, "isFirstParty:", v13);

        if (v14)
          v15 = v5;
        else
          v15 = v6;
        objc_msgSend(v15, "addObject:", v11);
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v8);
  }

  v16 = (void *)objc_opt_new();
  objc_msgSend(v5, "_pas_shuffledArrayUsingRng:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (unint64_t)objc_msgSend(v6, "count") >> 1;
  v19 = objc_msgSend(v5, "count");
  if (v18 >= v19)
    v18 = v19;
  objc_msgSend(v17, "subarrayWithRange:", 0, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v20);
  v21 = (void *)objc_opt_new();
  objc_msgSend(v6, "_pas_shuffledArrayUsingRng:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "subarrayWithRange:", v18, objc_msgSend(v17, "count") - v18);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "arrayByAddingObjectsFromArray:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (void)harvestWithActivity:(id)a3
{
  id v4;
  NSObject *v5;
  NSDate *loggingStartDate;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  ATXTimelineRelevanceMetricHarvester *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  ATXInformationStore *informationStore;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  NSObject *v55;
  uint64_t v56;
  ATXTimelineRelevanceMetricHarvester *v57;
  uint64_t v58;
  unint64_t v59;
  void *context;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t v65[128];
  uint8_t buf[4];
  uint64_t v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_timeline();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    loggingStartDate = self->_loggingStartDate;
    *(_DWORD *)buf = 138412290;
    v67 = (uint64_t)loggingStartDate;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_INFO, "ATXTimelineRelevanceMetricHarvester: fetching Timeline Relevance donations since last metric submission date: %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXInformationStore fetchDistinctWidgetsIgnoringIntentSinceDate:](self->_informationStore, "fetchDistinctWidgetsIgnoringIntentSinceDate:", self->_loggingStartDate);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXTimelineRelevanceMetricHarvester widgetsForDataCollection:](self, "widgetsForDataCollection:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "didDefer");
  __atxlog_handle_timeline();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_DEFAULT, "ATXTimelineRelevanceMetricHarvester: Deferring harvesting activity", buf, 2u);
    }
  }
  else
  {
    v53 = v7;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v13 = objc_msgSend(v8, "count");
      *(_DWORD *)buf = 134217984;
      v67 = v13;
      _os_log_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_INFO, "ATXTimelineRelevanceMetricHarvester: Logging metrics for %ld widget(s)", buf, 0xCu);
    }
    v52 = v8;

    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v51 = v9;
    v12 = v9;
    v58 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
    if (v58)
    {
      v14 = 0;
      v56 = *(_QWORD *)v62;
      v54 = v4;
      v55 = v12;
      v57 = self;
      while (2)
      {
        for (i = 0; i != v58; ++i)
        {
          if (*(_QWORD *)v62 != v56)
            objc_enumerationMutation(v12);
          v16 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
          context = (void *)MEMORY[0x1CAA48B6C]();
          v17 = (void *)objc_opt_new();
          objc_msgSend(v16, "extensionIdentity");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "extensionBundleIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setWidgetBundleId:", v19);

          objc_msgSend(v16, "kind");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setWidgetKind:", v20);

          objc_msgSend(v16, "extensionIdentity");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "containerBundleIdentifier");
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = (void *)v22;
          if (v22)
            v24 = (const __CFString *)v22;
          else
            v24 = &stru_1E82FDC98;
          objc_msgSend(v17, "setContainerBundleIdentifier:", v24, v51);

          objc_msgSend(v17, "setWidgetFamily:", objc_msgSend((id)objc_opt_class(), "PBWidgetFamilyFromCHSWidgetFamily:", objc_msgSend(v16, "family")));
          objc_msgSend(v17, "setTimelineDonationNilCount:", 0);
          objc_msgSend(v17, "setAtLeastOnePositiveTimelineRelevanceScore:", 0);
          -[ATXTimelineAbuseControlConfig timelineRelevanceABGroup](self->_abuseControlConfig, "timelineRelevanceABGroup");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setAbGroup:", v25);

          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "dateByAddingTimeInterval:", -604800.0);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "timeIntervalSinceReferenceDate");
          v29 = v28;

          v30 = (void *)objc_opt_new();
          if (-[ATXTimelineRelevanceMetricHarvester addTimelineRelevanceScoresToTimelineRelevanceContainer:forWidget:withDistributionsLogged:updatingDictionary:anonymizeTimestampsRelativeTo:](self, "addTimelineRelevanceScoresToTimelineRelevanceContainer:forWidget:withDistributionsLogged:updatingDictionary:anonymizeTimestampsRelativeTo:", v17, v16, v14, v30, v29))
          {
            v59 = v14;
            objc_msgSend(v16, "extensionIdentity");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "extensionBundleIdentifier");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "extensionIdentity");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "containerBundleIdentifier");
            v34 = self;
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "kind");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            -[ATXTimelineRelevanceMetricHarvester fetchStackConfigSummaryForWidgetBundleId:appBundleId:widgetKind:widgetSize:withPBTimelineRelevanceContainer:anonymizeTimestampsRelativeTo:](v34, "fetchStackConfigSummaryForWidgetBundleId:appBundleId:widgetKind:widgetSize:withPBTimelineRelevanceContainer:anonymizeTimestampsRelativeTo:", v32, v35, v36, objc_msgSend(v16, "family"), v17, v29);
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v37, "lastObject");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v38, "hasSmartStacksWithWidget") & 1) != 0)
            {
              v39 = 1;
            }
            else
            {
              objc_msgSend(v37, "lastObject");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = objc_msgSend(v40, "hasNonSmartStacksWithWidget");

            }
            self = v57;
            v12 = v55;
            v14 = v59;
            if (v39 && v59 <= 4)
            {
              objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
              objc_msgSend(v17, "setTimestamp:", (uint64_t)(v41 - v29));
              -[ATXTimelineRelevanceMetricHarvester addTimelineRelevanceSuggestionsToContainer:withTimelineEntries:anonymizeTimestampsRelativeTo:](v57, "addTimelineRelevanceSuggestionsToContainer:withTimelineEntries:anonymizeTimestampsRelativeTo:", v17, v30, v29);
              objc_msgSend(v16, "extensionIdentity");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "extensionBundleIdentifier");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "extensionIdentity");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "containerBundleIdentifier");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "kind");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              -[ATXTimelineRelevanceMetricHarvester _addRotationHistoryForWidgetBundleId:appBundleId:widgetKind:widgetSize:withPBTimelineRelevanceContainer:anonymizeTimestampsRelativeTo:](v57, "_addRotationHistoryForWidgetBundleId:appBundleId:widgetKind:widgetSize:withPBTimelineRelevanceContainer:anonymizeTimestampsRelativeTo:", v43, v45, v46, objc_msgSend(v16, "family"), v17, v29);

              v12 = v55;
              self = v57;

              -[ATXTimelineRelevanceMetricHarvester addStackConfigSummaryToTimelineRelevanceContainer:withStackConfigSummary:](v57, "addStackConfigSummaryToTimelineRelevanceContainer:withStackConfigSummary:", v17, v37);
              -[ATXTimelineRelevanceMetricHarvester addFeatureVectorToTimelineRelevanceContainer:](v57, "addFeatureVectorToTimelineRelevanceContainer:", v17);
              v14 = v59 + 1;
            }
            v4 = v54;
          }
          else
          {
            v37 = 0;
          }
          objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "logMessage:", v17);

          if (objc_msgSend(v4, "didDefer"))
          {
            __atxlog_handle_timeline();
            v50 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1C9A3B000, v50, OS_LOG_TYPE_INFO, "ATXTimelineRelevanceMetricHarvester: Asked to defer activity", buf, 2u);
            }

            v7 = v53;
            -[ATXTimelineRelevanceMetricHarvester _updateMetricsSubmissionDateTo:](self, "_updateMetricsSubmissionDateTo:", v53);

            objc_autoreleasePoolPop(context);
            goto LABEL_33;
          }

          objc_autoreleasePoolPop(context);
        }
        v58 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
        if (v58)
          continue;
        break;
      }
    }

    v7 = v53;
    -[ATXTimelineRelevanceMetricHarvester _updateMetricsSubmissionDateTo:](self, "_updateMetricsSubmissionDateTo:", v53);
    -[ATXInformationStore clearOldAbuseControlOutcomeData](self->_informationStore, "clearOldAbuseControlOutcomeData");
    -[ATXInformationStore deleteExpiredProactiveStackRotations](self->_informationStore, "deleteExpiredProactiveStackRotations");
    informationStore = self->_informationStore;
    objc_msgSend(MEMORY[0x1E0CF9228], "startDateOfDismissHistoryConsidered");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXInformationStore clearWidgetRemovalHistoryOlderThan:](informationStore, "clearWidgetRemovalHistoryOlderThan:", v49);

    __atxlog_handle_timeline();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_INFO, "ATXTimelineRelevanceMetricHarvester: Finished logging Timeline Relevance metrics.", buf, 2u);
    }
LABEL_33:
    v9 = v51;
    v8 = v52;
  }

}

- (BOOL)addTimelineRelevanceScoresToTimelineRelevanceContainer:(id)a3 forWidget:(id)a4 withDistributionsLogged:(unint64_t)a5 updatingDictionary:(id)a6 anonymizeTimestampsRelativeTo:(double)a7
{
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  void *v38;
  ATXTimelineRelevanceMetricHarvester *v39;
  id v40;
  char v41;
  id obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v39 = self;
  v40 = a6;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v38 = v13;
  -[ATXInformationStore fetchTimelineEntriesForWidget:sinceDate:](self->_informationStore, "fetchTimelineEntriesForWidget:sinceDate:", v13, self->_loggingStartDate);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v14)
  {
    v15 = v14;
    v41 = 0;
    v16 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v44 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        v19 = (void *)MEMORY[0x1CAA48B6C]();
        objc_msgSend(v18, "timelineEntry");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "relevance");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          v22 = (void *)objc_opt_new();
          objc_msgSend(v22, "setSuggestionMappingReason:", +[ATXTimelineRelevanceMetricHarvester PBTimelineEntrySuggestionMappingReasonFrom:](ATXTimelineRelevanceMetricHarvester, "PBTimelineEntrySuggestionMappingReasonFrom:", objc_msgSend(v18, "suggestionMappingReason")));
          objc_msgSend(v18, "timelineEntry");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "relevance");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "score");
          objc_msgSend(v22, "setRelevanceScore:");

          if ((objc_msgSend(v12, "atLeastOnePositiveTimelineRelevanceScore") & 1) == 0)
          {
            objc_msgSend(v18, "timelineEntry");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "relevance");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "score");
            v28 = v27;

            if (v28 > 0.0)
              objc_msgSend(v12, "setAtLeastOnePositiveTimelineRelevanceScore:", 1);
          }
          if (a5 <= 4)
          {
            objc_msgSend(v18, "timelineEntry");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "date");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "timeIntervalSinceReferenceDate");
            objc_msgSend(v22, "setTimestamp:", (uint64_t)(v31 - a7));

            objc_msgSend(v18, "timelineEntry");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "relevance");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "duration");
            objc_msgSend(v22, "setDuration:", (uint64_t)v34);

            objc_msgSend(v18, "suggestionId");
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            if (v35)
            {
              objc_msgSend(v18, "suggestionId");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              -[ATXTimelineRelevanceMetricHarvester _updateTimelineEntriesDictionaryWithEntries:withKey:withScoreEntry:](v39, "_updateTimelineEntriesDictionaryWithEntries:withKey:withScoreEntry:", v40, v36, v22);

            }
            v41 = 1;
          }

        }
        else
        {
          objc_msgSend(v12, "setTimelineDonationNilCount:", objc_msgSend(v12, "timelineDonationNilCount") + 1);
        }
        objc_autoreleasePoolPop(v19);
      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v15);
  }
  else
  {
    v41 = 0;
  }

  return v41 & 1;
}

- (void)addStackConfigSummaryToTimelineRelevanceContainer:(id)a3 withStackConfigSummary:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "addStackConfigSummary:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)addTimelineRelevanceSuggestionsToContainer:(id)a3 withTimelineEntries:(id)a4 anonymizeTimestampsRelativeTo:(double)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id obj;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  v7 = a4;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v7, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v28;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x1CAA48B6C]();
        v14 = (void *)objc_opt_new();
        -[ATXTimelineRelevanceMetricHarvester _addAbuseControlOutcomesForSuggestionId:withPBTimelineRelevanceSuggestion:anonymizeTimestampsRelativeTo:](self, "_addAbuseControlOutcomesForSuggestionId:withPBTimelineRelevanceSuggestion:anonymizeTimestampsRelativeTo:", v12, v14, a5);
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        objc_msgSend(v7, "objectForKeyedSubscript:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v24;
          do
          {
            v19 = 0;
            do
            {
              if (*(_QWORD *)v24 != v18)
                objc_enumerationMutation(v15);
              objc_msgSend(v14, "addTimelineRelevanceScoreEntry:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v19++));
            }
            while (v17 != v19);
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v17);
        }

        objc_msgSend(v22, "addTimelineRelevanceSuggestion:", v14);
        objc_autoreleasePoolPop(v13);
        ++v11;
      }
      while (v11 != v9);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v9);
  }

}

- (void)_addAbuseControlOutcomesForSuggestionId:(id)a3 withPBTimelineRelevanceSuggestion:(id)a4 anonymizeTimestampsRelativeTo:(double)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  unint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[ATXInformationStore fetchAbuseControlOutcomesForSuggestion:sinceDate:](self->_informationStore, "fetchAbuseControlOutcomesForSuggestion:sinceDate:", v8, self->_loggingStartDate);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v13)
        objc_enumerationMutation(v10);
      v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v14);
      v16 = (void *)MEMORY[0x1CAA48B6C]();
      v17 = (void *)objc_opt_new();
      objc_msgSend(v15, "timestamp");
      objc_msgSend(v17, "setTimestamp:", (uint64_t)(v18 - a5));
      objc_msgSend(v17, "setOutcomeType:", +[ATXTimelineRelevanceMetricHarvester PBTimelineRelevanceAbuseControlOutcomeTypeFrom:](ATXTimelineRelevanceMetricHarvester, "PBTimelineRelevanceAbuseControlOutcomeTypeFrom:", objc_msgSend(v15, "abuseControlOutcome")));
      objc_msgSend(v9, "addAbuseControlOutcome:", v17);
      v19 = objc_msgSend(v9, "abuseControlOutcomesCount");

      objc_autoreleasePoolPop(v16);
      if (v19 > 0x1F3)
        break;
      if (v12 == ++v14)
      {
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v12)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)addFeatureVectorToTimelineRelevanceContainer:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  NSString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "widgetBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "widgetKind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v3;
  objc_msgSend(v3, "containerBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v4;
  objc_msgSend(v4, "featurizeTimelineWithWidgetBundleId:widgetKind:appBundleIdentifier:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_opt_new();
  objc_msgSend(v8, "dictionaryRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        v15 = *(NSString **)(*((_QWORD *)&v21 + 1) + 8 * i);
        NSSelectorFromString(v15);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v16 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v10, "objectForKeyedSubscript:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          +[ATXTimelineRelevanceMetricHarvester roundNumber:toSignificantFigures:](ATXTimelineRelevanceMetricHarvester, "roundNumber:toSignificantFigures:", v17, 2);
          objc_msgSend(v16, "numberWithDouble:");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "setValue:forKey:", v18, v15);
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }
  objc_msgSend(v20, "setFeatureVector:", v9);

}

- (void)_updateTimelineEntriesDictionaryWithEntries:(id)a3 withKey:(id)a4 withScoreEntry:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend(v12, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, v7);

  }
  objc_msgSend(v12, "objectForKeyedSubscript:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v8);

}

- (id)_timeBasedMergePublisher:(id)a3 withOtherPublishers:(id)a4
{
  return (id)objc_msgSend(a3, "orderedMergeWithOthers:comparator:", a4, &__block_literal_global_211);
}

uint64_t __84__ATXTimelineRelevanceMetricHarvester__timeBasedMergePublisher_withOtherPublishers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "timestamp");
  v7 = v6;
  objc_msgSend(v5, "timestamp");
  if (v7 >= v8)
  {
    objc_msgSend(v4, "timestamp");
    v11 = v10;
    objc_msgSend(v5, "timestamp");
    v9 = v11 > v12;
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

- (void)_addRotationHistoryForWidgetBundleId:(id)a3 appBundleId:(id)a4 widgetKind:(id)a5 widgetSize:(int64_t)a6 withPBTimelineRelevanceContainer:(id)a7 anonymizeTimestampsRelativeTo:(double)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  double v25;
  double v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  BOOL v37;
  void *v38;
  _BOOL4 v39;
  id *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[4];
  id v53;
  uint64_t *v54;
  id v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  int64_t v60;
  _QWORD v61[5];
  id location;
  uint64_t v63;
  double *v64;
  uint64_t v65;
  uint64_t v66;
  _BYTE v67[128];
  _QWORD v68[3];

  v68[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v47 = a7;
  v63 = 0;
  v64 = (double *)&v63;
  v65 = 0x2020000000;
  v66 = 0;
  objc_initWeak(&location, self);
  v16 = (void *)objc_opt_new();
  -[NSDate timeIntervalSinceReferenceDate](self->_loggingStartDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v16, "genericEventPublisherFromStartTime:");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_opt_new();
  -[NSDate timeIntervalSinceReferenceDate](self->_loggingStartDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v17, "publisherFromStartTime:");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v68[0] = v43;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXTimelineRelevanceMetricHarvester _timeBasedMergePublisher:withOtherPublishers:](self, "_timeBasedMergePublisher:withOtherPublishers:", v44, v18);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)objc_opt_new();
  v20 = MEMORY[0x1E0C809B0];
  v61[0] = MEMORY[0x1E0C809B0];
  v61[1] = 3221225472;
  v61[2] = __173__ATXTimelineRelevanceMetricHarvester__addRotationHistoryForWidgetBundleId_appBundleId_widgetKind_widgetSize_withPBTimelineRelevanceContainer_anonymizeTimestampsRelativeTo___block_invoke;
  v61[3] = &unk_1E82DF748;
  v61[4] = self;
  objc_msgSend(v42, "filterWithIsIncluded:", v61);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v20;
  v56[1] = 3221225472;
  v56[2] = __173__ATXTimelineRelevanceMetricHarvester__addRotationHistoryForWidgetBundleId_appBundleId_widgetKind_widgetSize_withPBTimelineRelevanceContainer_anonymizeTimestampsRelativeTo___block_invoke_131;
  v56[3] = &unk_1E82E9488;
  v45 = v13;
  v57 = v45;
  v22 = v14;
  v58 = v22;
  v23 = v15;
  v59 = v23;
  v60 = a6;
  v52[0] = v20;
  v52[1] = 3221225472;
  v52[2] = __173__ATXTimelineRelevanceMetricHarvester__addRotationHistoryForWidgetBundleId_appBundleId_widgetKind_widgetSize_withPBTimelineRelevanceContainer_anonymizeTimestampsRelativeTo___block_invoke_133;
  v52[3] = &unk_1E82E94B0;
  v40 = &v55;
  objc_copyWeak(&v55, &location);
  v54 = &v63;
  v41 = v19;
  v53 = v41;
  v24 = (id)objc_msgSend(v21, "sinkWithCompletion:receiveInput:", v56, v52);

  v25 = v64[3];
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  if (v25 >= v26)
  {
    __atxlog_handle_home_screen();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[ATXTimelineRelevanceMetricHarvester _addRotationHistoryForWidgetBundleId:appBundleId:widgetKind:widgetSize:withPBTimelineRelevanceContainer:anonymizeTimestampsRelativeTo:].cold.2();
  }
  else
  {
    __atxlog_handle_home_screen();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      -[ATXTimelineRelevanceMetricHarvester _addRotationHistoryForWidgetBundleId:appBundleId:widgetKind:widgetSize:withPBTimelineRelevanceContainer:anonymizeTimestampsRelativeTo:].cold.1();

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    objc_msgSend(v41, "removeAndReturnCompletedSessions", &v55);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = -[NSObject countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v48, v67, 16);
    if (v29)
    {
      v30 = *(_QWORD *)v49;
LABEL_6:
      v31 = 0;
      while (1)
      {
        if (*(_QWORD *)v49 != v30)
          objc_enumerationMutation(v28);
        v32 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v31);
        objc_msgSend(v32, "sessionEndDate");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "timeIntervalSinceReferenceDate");
        v35 = v34;
        -[NSDate timeIntervalSinceReferenceDate](self->_loggingStartDate, "timeIntervalSinceReferenceDate");
        v37 = v35 < v36;

        if (v37)
          break;
        objc_msgSend(v32, "startingStackChangeEvent");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = -[ATXTimelineRelevanceMetricHarvester _shouldLogHomeScreenEvent:widgetBundleId:appBundleId:widgetKind:widgetFamily:](self, "_shouldLogHomeScreenEvent:widgetBundleId:appBundleId:widgetKind:widgetFamily:", v38, v45, v22, v23, a6);

        if (!v39)
          break;
        -[ATXTimelineRelevanceMetricHarvester addRotationsToContainer:withStackRotationSesssion:anonymizeTimestampsRelativeTo:](self, "addRotationsToContainer:withStackRotationSesssion:anonymizeTimestampsRelativeTo:", v47, v32, a8);
        if ((unint64_t)objc_msgSend(v47, "rotationsCount") > 0x1F3)
          break;
        if (v29 == ++v31)
        {
          v29 = -[NSObject countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v48, v67, 16);
          if (v29)
            goto LABEL_6;
          break;
        }
      }
    }
  }

  objc_destroyWeak(v40);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v63, 8);

}

uint64_t __173__ATXTimelineRelevanceMetricHarvester__addRotationHistoryForWidgetBundleId_appBundleId_widgetKind_widgetSize_withPBTimelineRelevanceContainer_anonymizeTimestampsRelativeTo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int v12;

  v3 = a2;
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "eventBody");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = *(void **)(a1 + 32);
      objc_msgSend(v3, "eventBody");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "_shouldProcessEvent:", v8);

    }
    else
    {
      objc_msgSend(v3, "eventBody");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "conformsToProtocol:", &unk_1EF9ED6C8);

      v9 = v12 ^ 1u;
    }
  }
  else
  {
    __atxlog_handle_timeline();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __173__ATXTimelineRelevanceMetricHarvester__addRotationHistoryForWidgetBundleId_appBundleId_widgetKind_widgetSize_withPBTimelineRelevanceContainer_anonymizeTimestampsRelativeTo___block_invoke_cold_1();

    v9 = 0;
  }

  return v9;
}

void __173__ATXTimelineRelevanceMetricHarvester__addRotationHistoryForWidgetBundleId_appBundleId_widgetKind_widgetSize_withPBTimelineRelevanceContainer_anonymizeTimestampsRelativeTo___block_invoke_131(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "state");
  __atxlog_handle_timeline();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __173__ATXTimelineRelevanceMetricHarvester__addRotationHistoryForWidgetBundleId_appBundleId_widgetKind_widgetSize_withPBTimelineRelevanceContainer_anonymizeTimestampsRelativeTo___block_invoke_131_cold_1(a1, v3, v6);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = a1[4];
    v8 = a1[5];
    v9 = a1[6];
    NSStringFromWidgetFamily();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138413058;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    v17 = 2112;
    v18 = v10;
    _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_INFO, "ATXTimelineRelevanceMetricHarvester: Successfully fetched rotation events from Biome for widgetBundleId: %@, appBundleId: %@, widgetKind: %@, widgetFamily: %@", (uint8_t *)&v11, 0x2Au);

  }
}

void __173__ATXTimelineRelevanceMetricHarvester__addRotationHistoryForWidgetBundleId_appBundleId_widgetKind_widgetSize_withPBTimelineRelevanceContainer_anonymizeTimestampsRelativeTo___block_invoke_133(uint64_t a1, void *a2)
{
  id WeakRetained;
  double v4;
  double v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    objc_msgSend(v14, "timestamp");
    if (v4 >= v5)
      v5 = v4;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5;
    objc_msgSend(v14, "eventBody");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v8 = *(void **)(a1 + 32);
      objc_msgSend(v14, "eventBody");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "updateWithUIEvent:", v9);

    }
    objc_msgSend(v14, "eventBody");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v11 = objc_opt_isKindOfClass();

    if ((v11 & 1) != 0)
    {
      v12 = *(void **)(a1 + 32);
      objc_msgSend(v14, "eventBody");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "updateWithBlendingUICacheUpdate:", v13);

    }
  }

}

- (void)addRotationsToContainer:(id)a3 withStackRotationSesssion:(id)a4 anonymizeTimestampsRelativeTo:(double)a5
{
  id v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
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
  id v28;

  v28 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v7, "sessionStartDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  objc_msgSend(v8, "setTimestamp:", (uint64_t)(v10 - a5));

  objc_msgSend(v7, "sessionEndDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  v13 = v12;
  objc_msgSend(v7, "sessionStartDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeIntervalSinceReferenceDate");
  objc_msgSend(v8, "setDuration:", (uint64_t)(v13 - v15));

  objc_msgSend(v8, "setEngagement:", objc_msgSend((id)objc_opt_class(), "PBTimelineRelevanceEngagementFromATXStackRotationEngagementStatus:", objc_msgSend(v7, "engagementStatus")));
  v16 = (void *)objc_opt_class();
  objc_msgSend(v7, "startingStackChangeEvent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "reason");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRotationEventType:", objc_msgSend(v16, "PBTimelineRelevanceRotationEventTypeFromReason:", v18));

  objc_msgSend(v7, "systemSuggestSuggestionLayout");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v7, "systemSuggestSuggestionLayout");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIsMediumOrHighConfidence:", objc_msgSend(v20, "isLowConfidenceStackRotationForStaleStack") ^ 1);

    objc_msgSend(v7, "systemSuggestSuggestionLayout");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "allSuggestionsInLayout");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v23, "clientModelSpecification");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        v25 = (void *)objc_opt_class();
        objc_msgSend(v23, "clientModelSpecification");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "clientModelId");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setClientModelId:", objc_msgSend(v25, "PBClientModelFromString:", v27));

      }
    }

  }
  objc_msgSend(v28, "addRotation:", v8);

}

- (BOOL)_shouldLogHomeScreenEvent:(id)a3 widgetBundleId:(id)a4 appBundleId:(id)a5 widgetKind:(id)a6 widgetFamily:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  BOOL v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11)
    goto LABEL_11;
  objc_msgSend(v11, "widgetBundleId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "isEqualToString:", v12))
  {
    v19 = 0;
LABEL_16:

    goto LABEL_17;
  }
  objc_msgSend(v11, "appBundleId");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v16, "isEqualToString:", v13))
  {
LABEL_14:
    v19 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v11, "widgetKind");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v17, "isEqualToString:", v14) & 1) == 0)
  {

    goto LABEL_14;
  }
  objc_msgSend(v11, "widgetSize");
  v18 = CHSWidgetFamilyFromATXStackLayoutSize();

  if (v18 == a7)
  {
    objc_msgSend(v11, "eventTypeString");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v16, "isEqualToString:", CFSTR("Unknown")) & 1) == 0
      && (objc_msgSend(v16, "isEqualToString:", CFSTR("HomeScreenPageShown")) & 1) == 0
      && (objc_msgSend(v16, "isEqualToString:", CFSTR("HomeScreenDisappeared")) & 1) == 0)
    {
      if ((objc_msgSend(v16, "isEqualToString:", CFSTR("StackChanged")) & 1) != 0)
      {
        v19 = 1;
        goto LABEL_10;
      }
      if ((objc_msgSend(v16, "isEqualToString:", CFSTR("WidgetTapped")) & 1) == 0
        && (objc_msgSend(v16, "isEqualToString:", CFSTR("WidgetLongLook")) & 1) == 0
        && (objc_msgSend(v16, "isEqualToString:", CFSTR("WidgetUserFeedback")) & 1) == 0
        && (objc_msgSend(v16, "isEqualToString:", CFSTR("UserStackConfigChanged")) & 1) == 0
        && (objc_msgSend(v16, "isEqualToString:", CFSTR("DeviceLocked")) & 1) == 0
        && (objc_msgSend(v16, "isEqualToString:", CFSTR("DeviceUnlocked")) & 1) == 0
        && (objc_msgSend(v16, "isEqualToString:", CFSTR("PinnedWidgetAdded")) & 1) == 0
        && (objc_msgSend(v16, "isEqualToString:", CFSTR("PinnedWidgetDeleted")) & 1) == 0
        && (objc_msgSend(v16, "isEqualToString:", CFSTR("SpecialPageAppeared")) & 1) == 0
        && (objc_msgSend(v16, "isEqualToString:", CFSTR("SpecialPageDisappeared")) & 1) == 0
        && (objc_msgSend(v16, "isEqualToString:", CFSTR("StackShown")) & 1) == 0
        && (objc_msgSend(v16, "isEqualToString:", CFSTR("StackDisappeared")) & 1) == 0
        && (objc_msgSend(v16, "isEqualToString:", CFSTR("StackCreated")) & 1) == 0
        && (objc_msgSend(v16, "isEqualToString:", CFSTR("StackDeleted")) & 1) == 0
        && (objc_msgSend(v16, "isEqualToString:", CFSTR("WidgetAddedToStack")) & 1) == 0
        && (objc_msgSend(v16, "isEqualToString:", CFSTR("WidgetRemovedFromStack")) & 1) == 0
        && (objc_msgSend(v16, "isEqualToString:", CFSTR("StackVisibilityChanged")) & 1) == 0
        && (objc_msgSend(v16, "isEqualToString:", CFSTR("AppAdded")) & 1) == 0)
      {
        objc_msgSend(v16, "isEqualToString:", CFSTR("AppRemoved"));
      }
    }
    v19 = 0;
LABEL_10:
    v15 = v16;
LABEL_15:

    goto LABEL_16;
  }
LABEL_11:
  v19 = 0;
LABEL_17:

  return v19;
}

- (id)fetchStackConfigSummaryForWidgetBundleId:(id)a3 appBundleId:(id)a4 widgetKind:(id)a5 widgetSize:(int64_t)a6 withPBTimelineRelevanceContainer:(id)a7 anonymizeTimestampsRelativeTo:(double)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = (void *)objc_opt_new();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v27 = v14;
  -[ATXInformationStore fetchStackConfigStatisticsForWidgetBundleId:widgetKind:containerBundleIdentifier:widgetFamily:](self->_informationStore, "fetchStackConfigStatisticsForWidgetBundleId:widgetKind:containerBundleIdentifier:widgetFamily:", v13, v15, v14, a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v29 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v23 = (void *)objc_opt_new();
        objc_msgSend(v22, "timestamp");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "timeIntervalSinceReferenceDate");
        objc_msgSend(v23, "setTimestamp:", (uint64_t)(v25 - a8));

        if (objc_msgSend(v22, "countOfSmartStacksWithWidget") >= 1)
          objc_msgSend(v23, "setSmartStacksWithWidget:", objc_msgSend(v22, "countOfSmartStacksWithWidget"));
        if (objc_msgSend(v22, "countOfNonSmartStacksWithWidget") >= 1)
          objc_msgSend(v23, "setNonSmartStacksWithWidget:", objc_msgSend(v22, "countOfNonSmartStacksWithWidget"));
        if (objc_msgSend(v22, "countOfStandaloneWidgets") >= 1)
          objc_msgSend(v23, "setStandaloneWidgets:", objc_msgSend(v22, "countOfStandaloneWidgets"));
        if (objc_msgSend(v22, "countOfWidgetsWithUnknownStackKind") >= 1)
          objc_msgSend(v23, "setWidgetsWithUnknownStackKind:", objc_msgSend(v22, "countOfWidgetsWithUnknownStackKind"));
        objc_msgSend(v16, "addObject:", v23);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v19);
  }

  return v16;
}

- (BOOL)_shouldProcessEvent:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;

  objc_msgSend(a3, "homeScreenEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v7 = v6;
  -[NSDate timeIntervalSinceReferenceDate](self->_loggingStartDate, "timeIntervalSinceReferenceDate");
  LOBYTE(self) = v7 > v8;

  return (char)self;
}

+ (double)roundNumber:(id)a3 toSignificantFigures:(unint64_t)a4
{
  id v5;
  double v6;
  long double v7;
  double v8;
  double v9;
  double v10;
  NSObject *v11;

  v5 = a3;
  v6 = 0.0;
  if ((objc_msgSend(v5, "isEqualToNumber:", &unk_1E83CDDB0) & 1) == 0)
  {
    if (a4)
    {
      objc_msgSend(v5, "doubleValue");
      v8 = log10(v7);
      v9 = __exp10((double)a4 - ceil(v8));
      objc_msgSend(v5, "doubleValue");
      v6 = round(v9 * v10) / v9;
    }
    else
    {
      __atxlog_handle_timeline();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        +[ATXTimelineRelevanceMetricHarvester roundNumber:toSignificantFigures:].cold.1();

    }
  }

  return v6;
}

+ (int)PBClientModelFromString:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  int v6;

  v3 = (void *)MEMORY[0x1E0D81198];
  v4 = a3;
  objc_msgSend(v3, "clientModelIdFromClientModelType:", 19);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6 ^ 1;
}

+ (int)PBTimelineRelevanceEngagementFromATXStackRotationEngagementStatus:(unint64_t)a3
{
  if (a3 > 4)
    return 1;
  else
    return dword_1C9E80A48[a3];
}

+ (int)PBWidgetFamilyFromCHSWidgetFamily:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4)
    return 0;
  else
    return dword_1C9E80A5C[a3 - 1];
}

+ (int)PBTimelineEntrySuggestionMappingReasonFrom:(int64_t)a3
{
  if ((unint64_t)a3 > 6)
    return 0;
  else
    return dword_1C9E80A70[a3];
}

+ (int)PBTimelineRelevanceRotationEventTypeFromReason:(id)a3
{
  id v3;
  int v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  int v20;

  v3 = a3;
  v4 = 1;
  NSStringForATXHomeScreenStackChangeReason();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    NSStringForATXHomeScreenStackChangeReason();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "isEqualToString:", v7);

    if ((v8 & 1) != 0)
    {
      v4 = 0;
    }
    else
    {
      NSStringForATXHomeScreenStackChangeReason();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v3, "isEqualToString:", v9);

      if ((v10 & 1) != 0)
      {
        v4 = 2;
      }
      else
      {
        NSStringForATXHomeScreenStackChangeReason();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v3, "isEqualToString:", v11);

        if ((v12 & 1) != 0)
        {
          v4 = 3;
        }
        else
        {
          NSStringForATXHomeScreenStackChangeReason();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v3, "isEqualToString:", v13);

          if ((v14 & 1) != 0)
          {
            v4 = 4;
          }
          else
          {
            NSStringForATXHomeScreenStackChangeReason();
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v3, "isEqualToString:", v15);

            if ((v16 & 1) != 0)
            {
              v4 = 5;
            }
            else
            {
              NSStringForATXHomeScreenStackChangeReason();
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v3, "isEqualToString:", v17);

              if ((v18 & 1) != 0)
              {
                v4 = 6;
              }
              else
              {
                NSStringForATXHomeScreenStackChangeReason();
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = objc_msgSend(v3, "isEqualToString:", v19);

                if (v20)
                  v4 = 7;
                else
                  v4 = 8;
              }
            }
          }
        }
      }
    }
  }

  return v4;
}

+ (int)PBTimelineRelevanceAbuseControlOutcomeTypeFrom:(int64_t)a3
{
  if ((unint64_t)a3 > 0x17)
    return 1;
  else
    return dword_1C9E80A8C[a3];
}

- (id)timeOfLatestMetricsSubmission
{
  id v3;
  NSUserDefaults *v4;
  NSUserDefaults *defaults;

  v3 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v4 = (NSUserDefaults *)objc_msgSend(v3, "initWithSuiteName:", *MEMORY[0x1E0CF9518]);
  defaults = self->_defaults;
  self->_defaults = v4;

  return -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("timeOfLatestMetricsSubmissionForTimelineRelevance"));
}

- (void)_updateMetricsSubmissionDateTo:(id)a3
{
  -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", a3, CFSTR("timeOfLatestMetricsSubmissionForTimelineRelevance"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_abuseControlConfig, 0);
  objc_storeStrong((id *)&self->_loggingStartDate, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_informationStore, 0);
}

- (void)_addRotationHistoryForWidgetBundleId:appBundleId:widgetKind:widgetSize:withPBTimelineRelevanceContainer:anonymizeTimestampsRelativeTo:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_7();
  _os_log_debug_impl(&dword_1C9A3B000, v0, OS_LOG_TYPE_DEBUG, "ATXHomeScreenLogUploader: Verified Biome timestamps, proceeding to upload", v1, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)_addRotationHistoryForWidgetBundleId:appBundleId:widgetKind:widgetSize:withPBTimelineRelevanceContainer:anonymizeTimestampsRelativeTo:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "ATXHomeScreenLogUploader: Malformed stream - there seem to be future events. Bailing on log upload", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __173__ATXTimelineRelevanceMetricHarvester__addRotationHistoryForWidgetBundleId_appBundleId_widgetKind_widgetSize_withPBTimelineRelevanceContainer_anonymizeTimestampsRelativeTo___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "ATXTimelineRelevanceMetricHarvester: Error BMStoreEvent.eventBody is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __173__ATXTimelineRelevanceMetricHarvester__addRotationHistoryForWidgetBundleId_appBundleId_widgetKind_widgetSize_withPBTimelineRelevanceContainer_anonymizeTimestampsRelativeTo___block_invoke_131_cold_1(_QWORD *a1, void *a2, NSObject *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a1[4];
  v6 = a1[5];
  v7 = a1[6];
  NSStringFromWidgetFamily();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138413314;
  v11 = v5;
  v12 = 2112;
  v13 = v6;
  v14 = 2112;
  v15 = v7;
  v16 = 2112;
  v17 = v8;
  v18 = 2112;
  v19 = v9;
  _os_log_error_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_ERROR, "ATXTimelineRelevanceMetricHarvester: Error encountered while fetching rotation events from Biome for widgetBundleId: %@, appBundleId: %@, widgetKind: %@, widgetFamily:%@: %@", (uint8_t *)&v10, 0x34u);

}

+ (void)roundNumber:toSignificantFigures:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "Error when calling roundNumber:toSignificantFigures: number of significant figures must be a positive integer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
