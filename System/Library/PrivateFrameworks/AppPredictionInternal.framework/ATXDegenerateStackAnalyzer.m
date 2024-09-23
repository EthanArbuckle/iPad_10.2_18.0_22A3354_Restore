@implementation ATXDegenerateStackAnalyzer

- (ATXDegenerateStackAnalyzer)init
{
  void *v3;
  ATXDegenerateStackAnalyzer *v4;

  objc_msgSend(MEMORY[0x1E0CF8EC8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ATXDegenerateStackAnalyzer initWithInformationStore:](self, "initWithInformationStore:", v3);

  return v4;
}

- (ATXDegenerateStackAnalyzer)initWithInformationStore:(id)a3
{
  id v5;
  ATXDegenerateStackAnalyzer *v6;
  ATXDegenerateStackAnalyzer *v7;
  uint64_t v8;
  ATXSuggestionDeduplicator *deduplicator;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXDegenerateStackAnalyzer;
  v6 = -[ATXDegenerateStackAnalyzer init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_informationStore, a3);
    v8 = objc_opt_new();
    deduplicator = v7->_deduplicator;
    v7->_deduplicator = (ATXSuggestionDeduplicator *)v8;

  }
  return v7;
}

- (BOOL)_isWidgetEligibleForHeuristicFallback:(id)a3
{
  id v3;
  void *v4;
  char v5;
  char v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "appBundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.weather"));

  if ((v5 & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v3, "appBundleId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.gamecenter.widgets")))
    {
      objc_msgSend(v3, "widgetKind");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v8, "isEqualToString:", CFSTR("FriendsArePlayingWidget"));

    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (BOOL)_hasWidgetHadTimelineDonations:(id)a3 startDate:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  double v25;
  double v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "size");
  if (v8 > 4)
    v9 = 0;
  else
    v9 = qword_1C9E80D50[v8];
  v10 = objc_alloc(MEMORY[0x1E0D10148]);
  v11 = objc_alloc(MEMORY[0x1E0D10038]);
  objc_msgSend(v6, "extensionBundleId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appBundleId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:", v12, v13, 0);
  objc_msgSend(v6, "widgetKind");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
    v17 = (const __CFString *)v15;
  else
    v17 = &stru_1E82FDC98;
  v18 = (void *)objc_msgSend(v10, "initWithExtensionIdentity:kind:family:intent:activityIdentifier:", v14, v17, v9, 0, 0);

  -[ATXInformationStore fetchTimelineEntriesForWidget:sinceDate:](self->_informationStore, "fetchTimelineEntriesForWidget:sinceDate:", v18, v7);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v29 != v21)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "timelineEntry", (_QWORD)v28);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "relevance");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "score");
        v26 = v25;

        if (v26 > 0.00000011920929)
        {
          LOBYTE(v20) = 1;
          goto LABEL_17;
        }
      }
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v20)
        continue;
      break;
    }
  }
LABEL_17:

  return v20;
}

- (id)_simulatedInfoSuggestionForWidget:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;

  v3 = (objc_class *)MEMORY[0x1E0D81150];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "appBundleId");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (const __CFString *)v6;
  else
    v8 = &stru_1E82FDC98;
  objc_msgSend(v4, "extensionBundleId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widgetKind");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(v5, "initWithAppBundleIdentifier:widgetBundleIdentifier:widgetKind:criterion:applicableLayouts:suggestionIdentifier:startDate:endDate:intent:metadata:relevanceScore:", v8, v9, v10, CFSTR("criterion"), 24, 0, 0, 0, v11, 0, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811A8]), "initWithExecutableObject:executableDescription:executableIdentifier:suggestionExecutableType:", v12, CFSTR("description"), CFSTR("identifier"), 3);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811A0]), "initWithClientModelId:clientModelVersion:engagementResetPolicy:", CFSTR("simulated_suggestion"), CFSTR("1"), 1);
  v15 = objc_alloc(MEMORY[0x1E0D811D0]);
  LOWORD(v20) = 0;
  v16 = (void *)objc_msgSend(v15, "initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:", 0, 0, 0, MEMORY[0x1E0C9AA60], 0, 0, v20);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811C0]), "initWithRawScore:suggestedConfidenceCategory:", 0, 0.0);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81190]), "initWithClientModelSpecification:executableSpecification:uiSpecification:scoreSpecification:", v14, v13, v16, v17);

  return v18;
}

- (BOOL)_wouldBlendingDeduplicateWidget:(id)a3 inStack:(id)a4 againstOtherWidgetsOnPage:(id)a5
{
  id v8;
  id v9;
  void *v10;
  ATXSuggestionDeduplicator *deduplicator;
  void *v12;

  v8 = a5;
  v9 = a4;
  -[ATXDegenerateStackAnalyzer _simulatedInfoSuggestionForWidget:](self, "_simulatedInfoSuggestionForWidget:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  deduplicator = self->_deduplicator;
  objc_msgSend(v9, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v9) = -[ATXSuggestionDeduplicator widgetSuggestionIsPinned:homeScreenPage:excludingStackConfigId:](deduplicator, "widgetSuggestionIsPinned:homeScreenPage:excludingStackConfigId:", v10, v8, v12);
  return (char)v9;
}

- (BOOL)isSmartStackPossiblyDegenerate:(id)a3 onPage:(id)a4 usingTimelineEntriesSinceDate:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  BOOL v19;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v22 = a5;
  if ((objc_msgSend(v9, "allowsSmartRotate") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXDegenerateStackAnalyzer.m"), 130, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("stack.allowsSmartRotate"));

  }
  v11 = (void *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v9, "widgets");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        v18 = (void *)MEMORY[0x1CAA48B6C]();
        if (!-[ATXDegenerateStackAnalyzer _wouldBlendingDeduplicateWidget:inStack:againstOtherWidgetsOnPage:](self, "_wouldBlendingDeduplicateWidget:inStack:againstOtherWidgetsOnPage:", v17, v9, v10)&& (-[ATXDegenerateStackAnalyzer _isWidgetEligibleForHeuristicFallback:](self, "_isWidgetEligibleForHeuristicFallback:", v17)|| -[ATXDegenerateStackAnalyzer _hasWidgetHadTimelineDonations:startDate:](self, "_hasWidgetHadTimelineDonations:startDate:", v17, v22)))
        {
          objc_msgSend(v11, "addObject:", v17);
        }
        objc_autoreleasePoolPop(v18);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v14);
  }

  v19 = (unint64_t)objc_msgSend(v11, "count") < 2;
  return v19;
}

- (BOOL)areAllSmartStacksPossiblyDegenerateInPages:(id)a3 usingTimelineEntriesSinceDate:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  BOOL v18;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v8 = v6;
  v21 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v21)
  {
    v9 = *(_QWORD *)v27;
    v20 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v8);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        objc_msgSend(v11, "stacks", v20);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v23;
          while (2)
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v23 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
              if (objc_msgSend(v17, "allowsSmartRotate")
                && !-[ATXDegenerateStackAnalyzer isSmartStackPossiblyDegenerate:onPage:usingTimelineEntriesSinceDate:](self, "isSmartStackPossiblyDegenerate:onPage:usingTimelineEntriesSinceDate:", v17, v11, v7))
              {

                v18 = 0;
                goto LABEL_20;
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            if (v14)
              continue;
            break;
          }
        }

        v9 = v20;
      }
      v18 = 1;
      v21 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v21);
  }
  else
  {
    v18 = 1;
  }
LABEL_20:

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deduplicator, 0);
  objc_storeStrong((id *)&self->_informationStore, 0);
}

@end
