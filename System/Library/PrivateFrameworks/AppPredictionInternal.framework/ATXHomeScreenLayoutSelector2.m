@implementation ATXHomeScreenLayoutSelector2

- (ATXHomeScreenLayoutSelector2)init
{
  void *v3;
  ATXHomeScreenLayoutSelector2 *v4;

  objc_msgSend(MEMORY[0x1E0D80CD0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ATXHomeScreenLayoutSelector2 initWithBlendingLayerHyperParameters:](self, "initWithBlendingLayerHyperParameters:", v3);

  return v4;
}

- (ATXHomeScreenLayoutSelector2)initWithBlendingLayerHyperParameters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  ATXHomeScreenLayoutSelector2 *v14;
  uint64_t v16;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CF8DF8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  +[ATXStackStateTracker sharedInstance](ATXStackStateTracker, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CF8EC8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v11 = (void *)objc_msgSend(v10, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  +[ATXSuggestionModeFilter sharedInstance](ATXSuggestionModeFilter, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_opt_new();
  LOBYTE(v16) = objc_msgSend(MEMORY[0x1E0D81588], "isiPad");
  v14 = -[ATXHomeScreenLayoutSelector2 initWithHomeScreenPageConfigurations:blendingLayerHyperParameters:suggestionDeduplicator:engagementRecordManager:widgetDismissManager:stackStateTracker:store:defaults:modeFilter:chronoService:isiPad:](self, "initWithHomeScreenPageConfigurations:blendingLayerHyperParameters:suggestionDeduplicator:engagementRecordManager:widgetDismissManager:stackStateTracker:store:defaults:modeFilter:chronoService:isiPad:", 0, v4, v5, v6, v7, v8, v9, v11, v12, v13, v16);

  return v14;
}

- (ATXHomeScreenLayoutSelector2)initWithHomeScreenPageConfigurations:(id)a3 blendingLayerHyperParameters:(id)a4 suggestionDeduplicator:(id)a5 engagementRecordManager:(id)a6 widgetDismissManager:(id)a7 stackStateTracker:(id)a8 store:(id)a9 defaults:(id)a10 modeFilter:(id)a11 chronoService:(id)a12 isiPad:(BOOL)a13
{
  id v19;
  id v20;
  ATXHomeScreenLayoutSelector2 *v21;
  ATXHomeScreenLayoutSelector2 *v22;
  _ATXHomeScreenTimelineRelevanceFilter *v23;
  _ATXHomeScreenTimelineRelevanceFilter *timelineRelevanceFilter;
  uint64_t v25;
  ATXWidgetDescriptorCache *descriptorCache;
  id obj;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  objc_super v38;

  v36 = a3;
  obj = a4;
  v35 = a4;
  v34 = a5;
  v33 = a6;
  v32 = a7;
  v31 = a8;
  v37 = a9;
  v30 = a10;
  v19 = a11;
  v20 = a12;
  v38.receiver = self;
  v38.super_class = (Class)ATXHomeScreenLayoutSelector2;
  v21 = -[ATXHomeScreenLayoutSelector2 init](&v38, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_homeScreenPageConfigs, a3);
    objc_storeStrong((id *)&v22->_hyperParameters, obj);
    objc_storeStrong((id *)&v22->_suggestionDeduplicator, a5);
    objc_storeStrong((id *)&v22->_engagementRecordManager, a6);
    objc_storeStrong((id *)&v22->_widgetDismissManager, a7);
    objc_storeStrong((id *)&v22->_stackStateTracker, a8);
    objc_storeStrong((id *)&v22->_store, a9);
    objc_storeStrong((id *)&v22->_defaults, a10);
    objc_storeStrong((id *)&v22->_modeFilter, a11);
    objc_storeStrong((id *)&v22->_chronoService, a12);
    v23 = -[_ATXHomeScreenTimelineRelevanceFilter initWithTimelineRelevanceStore:]([_ATXHomeScreenTimelineRelevanceFilter alloc], "initWithTimelineRelevanceStore:", v37);
    timelineRelevanceFilter = v22->_timelineRelevanceFilter;
    v22->_timelineRelevanceFilter = v23;

    v22->_isiPad = a13;
    objc_msgSend(MEMORY[0x1E0CF9210], "sharedInstance");
    v25 = objc_claimAutoreleasedReturnValue();
    descriptorCache = v22->_descriptorCache;
    v22->_descriptorCache = (ATXWidgetDescriptorCache *)v25;

  }
  return v22;
}

- (id)selectedLayoutForConsumerSubType:(unsigned __int8)a3 rankedSuggestions:(id)a4
{
  int v4;
  id v6;
  NSObject *v7;
  void *v8;
  ATXStackStateTracker *stackStateTracker;
  void *v10;
  NSSet *v11;
  NSSet *dismissedSuggestionsForSuggestionsWidget;
  NSSet *v13;
  NSSet *dismissedSuggestionsForAppPredictionPanels;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint8_t v23[16];
  uint8_t buf[16];

  v4 = a3;
  v6 = a4;
  __atxlog_handle_blending();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "----- HSLS REFRESH START -----", buf, 2u);
  }

  if (v4 == 34)
  {
    -[ATXStackStateTracker updateStackRotationEvents](self->_stackStateTracker, "updateStackRotationEvents");
    -[ATXHomeScreenLayoutSelector2 _loadHomeScreenState:](self, "_loadHomeScreenState:", self->_homeScreenPageConfigs);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    stackStateTracker = self->_stackStateTracker;
    objc_msgSend(v8, "sortedPagesByUserLastVisit");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXStackStateTracker cleanupOldDataWithHomeScreenPages:](stackStateTracker, "cleanupOldDataWithHomeScreenPages:", v10);

    -[ATXEngagementRecordManager engagedExecutablesOfType:queryOptions:](self->_engagementRecordManager, "engagedExecutablesOfType:queryOptions:", 8, 0);
    v11 = (NSSet *)objc_claimAutoreleasedReturnValue();
    dismissedSuggestionsForSuggestionsWidget = self->_dismissedSuggestionsForSuggestionsWidget;
    self->_dismissedSuggestionsForSuggestionsWidget = v11;

    -[ATXEngagementRecordManager engagedExecutablesOfType:queryOptions:](self->_engagementRecordManager, "engagedExecutablesOfType:queryOptions:", 16, 0);
    v13 = (NSSet *)objc_claimAutoreleasedReturnValue();
    dismissedSuggestionsForAppPredictionPanels = self->_dismissedSuggestionsForAppPredictionPanels;
    self->_dismissedSuggestionsForAppPredictionPanels = v13;

    -[ATXHomeScreenLayoutSelector2 _filterRankedSuggestions:homeScreenState:](self, "_filterRankedSuggestions:homeScreenState:", v6, v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXHomeScreenLayoutSelector2 _assignSuggestionsForExistingSuggestedWidgets:homeScreenState:](self, "_assignSuggestionsForExistingSuggestedWidgets:homeScreenState:", v15, v8);
    -[ATXHomeScreenLayoutSelector2 _suggestionsWidgetPreviewsFromRankedSuggestions:](self, "_suggestionsWidgetPreviewsFromRankedSuggestions:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXHomeScreenLayoutSelector2 _appPredictionPanelPreviewFromRankedSuggestions:](self, "_appPredictionPanelPreviewFromRankedSuggestions:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    self->_thresholdConfidenceForSuggestedSG = -[ATXHomeScreenLayoutSelector2 _thresholdConfidenceForSuggestedSG](self, "_thresholdConfidenceForSuggestedSG");
    -[ATXHomeScreenLayoutSelector2 setWidgetSuggestionReloadBudgetByStackId:](self, "setWidgetSuggestionReloadBudgetByStackId:", 0);
    -[ATXHomeScreenLayoutSelector2 setHasAskedChronoAboutReloadBudget:](self, "setHasAskedChronoAboutReloadBudget:", 0);
    self->_shouldLimitWidgetSuggestionPowerCost = -[ATXHomeScreenLayoutSelector2 _shouldLimitWidgetSuggestionPowerCost](self, "_shouldLimitWidgetSuggestionPowerCost");
    self->_numSuggestedWidgetInPastDay = -[ATXInformationStore numberOfSuggestedWidgetsInPastDay](self->_store, "numberOfSuggestedWidgetsInPastDay");
    self->_numWidgetReloadForSuggestionInPastDay = -[ATXInformationStore numberOfWidgetReloadForSuggestionInPastDay](self->_store, "numberOfWidgetReloadForSuggestionInPastDay");
    -[ATXHomeScreenLayoutSelector2 _performSuggestionAllocationWithRankedSuggestions:homeScreenState:](self, "_performSuggestionAllocationWithRankedSuggestions:homeScreenState:", v15, v8);
    -[ATXHomeScreenLayoutSelector2 _rotateAwayFromPreviousSystemInitiatedRotationIfNecessary:homeScreenState:](self, "_rotateAwayFromPreviousSystemInitiatedRotationIfNecessary:homeScreenState:", v15, v8);
    -[ATXHomeScreenLayoutSelector2 _preservePreviousAppSuggestionPositionsWithHomeScreenState:](self, "_preservePreviousAppSuggestionPositionsWithHomeScreenState:", v8);
    -[ATXHomeScreenLayoutSelector2 _removeSuggestedWidgetWhereNecessaryWithHomeScreenState:](self, "_removeSuggestedWidgetWhereNecessaryWithHomeScreenState:", v8);
    -[ATXHomeScreenLayoutSelector2 _fallbackSuggestions:homeScreenState:](self, "_fallbackSuggestions:homeScreenState:", v15, v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_opt_new();
    -[ATXHomeScreenLayoutSelector2 _homeScreenCachedSuggestionsFromHomeScreenState:sortedFallbackSuggestions:suggestionsWidgetPreviews:appPredictionPanelPreview:withUUID:](self, "_homeScreenCachedSuggestionsFromHomeScreenState:sortedFallbackSuggestions:suggestionsWidgetPreviews:appPredictionPanelPreview:withUUID:", v8, v18, v16, v17, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    __atxlog_handle_blending();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_1C9A3B000, v21, OS_LOG_TYPE_DEFAULT, "----- HSLS REFRESH END -----", v23, 2u);
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)_performSuggestionAllocationWithRankedSuggestions:(id)a3 homeScreenState:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id obj;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[4];
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  void *v46;
  void *v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[ATXHomeScreenLayoutSelector2 _shortcutConversionOriginalActionSuggestionIndices:](self, "_shortcutConversionOriginalActionSuggestionIndices:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectsAtIndexes:", v8);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "mutableCopy");
  v31 = (void *)v8;
  objc_msgSend(v9, "removeObjectsAtIndexes:", v8);
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  objc_msgSend(v7, "sortedPagesByUserLastVisit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v43 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
        -[ATXHomeScreenLayoutSelector2 _assignPinnedSuggestionsWidgetForPage:suggestions:homeScreenState:](self, "_assignPinnedSuggestionsWidgetForPage:suggestions:homeScreenState:", v15, v9, v7);
        -[ATXHomeScreenLayoutSelector2 _assignWidgetForTopOfStack:suggestions:homeScreenState:](self, "_assignWidgetForTopOfStack:suggestions:homeScreenState:", v15, v9, v7);
        -[ATXHomeScreenLayoutSelector2 _assignPinnedAPPWidgetForPage:suggestions:homeScreenState:](self, "_assignPinnedAPPWidgetForPage:suggestions:homeScreenState:", v15, v9, v7);
        -[ATXHomeScreenLayoutSelector2 _assignUnfilledSGWidgetForPage:suggestions:homeScreenState:](self, "_assignUnfilledSGWidgetForPage:suggestions:homeScreenState:", v15, v9, v7);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
    }
    while (v12);
  }

  v16 = (void *)objc_opt_new();
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __98__ATXHomeScreenLayoutSelector2__performSuggestionAllocationWithRankedSuggestions_homeScreenState___block_invoke;
  v40[3] = &unk_1E82DDF00;
  v29 = v16;
  v41 = v29;
  v32 = v6;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v40);
  v33 = (void *)objc_opt_new();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(v7, "sortedPagesByUserLastVisit");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
  if (v17)
  {
    v18 = v17;
    v35 = 0;
    v19 = *(_QWORD *)v37;
    v20 = *MEMORY[0x1E0CF9338];
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v37 != v19)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
        objc_msgSend(v22, "config");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "pageIndex");

        if (v24 == v20)
        {
          v25 = v22;

          v35 = v25;
        }
        else
        {
          objc_msgSend(v33, "addObject:", v22);
        }
      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
    }
    while (v18);
  }
  else
  {
    v35 = 0;
  }

  v26 = (void *)objc_msgSend(v9, "mutableCopy");
  -[ATXHomeScreenLayoutSelector2 _assignExistingSuggestedSGWidgetsOnPages:withSuggestions:suggestionToRankingIndex:](self, "_assignExistingSuggestedSGWidgetsOnPages:withSuggestions:suggestionToRankingIndex:", v33, v9, v29);
  -[ATXHomeScreenLayoutSelector2 _assignNewSuggestedWidgetsForPages:rankedSuggestions:suggestionToRankingIndex:homeScreenState:](self, "_assignNewSuggestedWidgetsForPages:rankedSuggestions:suggestionToRankingIndex:homeScreenState:", v33, v9, v29, v7);
  if (v35)
  {
    v47 = v35;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXHomeScreenLayoutSelector2 _assignExistingSuggestedSGWidgetsOnPages:withSuggestions:suggestionToRankingIndex:](self, "_assignExistingSuggestedSGWidgetsOnPages:withSuggestions:suggestionToRankingIndex:", v27, v26, v29);

    v46 = v35;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXHomeScreenLayoutSelector2 _assignNewSuggestedWidgetsForPages:rankedSuggestions:suggestionToRankingIndex:homeScreenState:](self, "_assignNewSuggestedWidgetsForPages:rankedSuggestions:suggestionToRankingIndex:homeScreenState:", v28, v26, v29, v7);

  }
  -[ATXHomeScreenLayoutSelector2 _updateSuggestionsWidgetLayoutIfNecessaryWithRankedShortcutSuggestions:suggestionToRankingIndex:homeScreenState:](self, "_updateSuggestionsWidgetLayoutIfNecessaryWithRankedShortcutSuggestions:suggestionToRankingIndex:homeScreenState:", v30, v29, v7);

}

void __98__ATXHomeScreenLayoutSelector2__performSuggestionAllocationWithRankedSuggestions_homeScreenState___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a2;
  objc_msgSend(v5, "numberWithUnsignedInteger:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

}

- (id)_shortcutConversionOriginalActionSuggestionIndices:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v3 = a3;
  objc_msgSend(v3, "_pas_filteredArrayWithTest:", &__block_literal_global_49);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __83__ATXHomeScreenLayoutSelector2__shortcutConversionOriginalActionSuggestionIndices___block_invoke_2;
  v11[3] = &unk_1E82DDF68;
  v12 = v4;
  v6 = v5;
  v13 = v6;
  v7 = v4;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v11);

  v8 = v13;
  v9 = v6;

  return v9;
}

uint64_t __83__ATXHomeScreenLayoutSelector2__shortcutConversionOriginalActionSuggestionIndices___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D81198];
  objc_msgSend(a2, "clientModelSpecification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientModelId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "clientModelTypeFromClientModelId:", v4);

  return objc_msgSend(MEMORY[0x1E0D81198], "clientModelTypeIsShortcutConversion:", v5);
}

void __83__ATXHomeScreenLayoutSelector2__shortcutConversionOriginalActionSuggestionIndices___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "executableSpecification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "executableType");

  objc_msgSend(v5, "executableSpecification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 == 2)
  {
    objc_msgSend(v8, "executableObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "intent");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = objc_msgSend(v8, "executableType");

    if (v12 != 10)
      goto LABEL_19;
    objc_msgSend(v5, "linkActionExecutableObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cachedAppIntent");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v11;

  if (v13)
  {
    v23 = a1;
    v24 = a3;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v14 = *(id *)(a1 + 32);
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v26;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v26 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "executableSpecification", v23, v24, (_QWORD)v25);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "executableObject");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v20, "intent");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v19) = +[ATXActionToWidgetConverter isWidgetIntent:validConversionFromActionIntent:](ATXActionToWidgetConverter, "isWidgetIntent:validConversionFromActionIntent:", v21, v13);

          if ((_DWORD)v19)
          {
            __atxlog_handle_blending();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v30 = v5;
              _os_log_impl(&dword_1C9A3B000, v22, OS_LOG_TYPE_DEFAULT, "HSLS: Temporarily filtering out action suggestion because there is a converted widget suggestion for it.\n%@", buf, 0xCu);
            }

            objc_msgSend(*(id *)(v23 + 40), "addIndex:", v24);
            goto LABEL_18;
          }

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
        if (v16)
          continue;
        break;
      }
    }
LABEL_18:

  }
LABEL_19:

}

- (void)_assignPinnedSuggestionsWidgetForPage:(id)a3 suggestions:(id)a4 homeScreenState:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  id obj;
  void *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v32 = a4;
  v9 = a5;
  __atxlog_handle_blending();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "config");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134217984;
    v44 = objc_msgSend(v11, "pageIndex");
    _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_DEFAULT, "HSLS [assignPinnedSG]: considering pinned SG widgets on page %lu", buf, 0xCu);

  }
  v28 = v8;
  objc_msgSend(v8, "pinnedSGWidgets");
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
  if (v33)
  {
    v31 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v39 != v31)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        __atxlog_handle_blending();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v13, "config");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "widgets");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "firstObject");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "widgetUniqueId");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "config");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v44 = (uint64_t)v17;
          v45 = 2114;
          v46 = v19;
          _os_log_impl(&dword_1C9A3B000, v14, OS_LOG_TYPE_DEFAULT, "  HSLS [assignPinnedSG]: considering pinned SG widget %{public}@ in stack %{public}@", buf, 0x16u);

        }
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        v20 = v32;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v35;
          while (2)
          {
            for (j = 0; j != v22; ++j)
            {
              if (*(_QWORD *)v35 != v23)
                objc_enumerationMutation(v20);
              v25 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j);
              if (!-[ATXHomeScreenLayoutSelector2 _isSuggestionStillNeededForTopOfStack:](self, "_isSuggestionStillNeededForTopOfStack:", v13))
              {
                __atxlog_handle_blending();
                v27 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1C9A3B000, v27, OS_LOG_TYPE_DEFAULT, "    HSLS [assignPinnedSG]: pinned SG widget no longer needs suggestion", buf, 2u);
                }

                goto LABEL_27;
              }
              if (-[ATXHomeScreenLayoutSelector2 _isSuggestionACandidate:forStack:dedupeAppSuggestionsByWidgets:ignoreDuplicatesInSGWidget:ignoreDuplicatesInPanels:homeScreenState:](self, "_isSuggestionACandidate:forStack:dedupeAppSuggestionsByWidgets:ignoreDuplicatesInSGWidget:ignoreDuplicatesInPanels:homeScreenState:", v25, v13, 1, 0, 1, v9)&& -[ATXHomeScreenLayoutSelector2 _hasEligiblePinnedWidgetStacksForSuggestionsWidget:forCandidateStack:](self, "_hasEligiblePinnedWidgetStacksForSuggestionsWidget:forCandidateStack:", v25, v13))
              {
                __atxlog_handle_blending();
                v26 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v44 = v25;
                  _os_log_impl(&dword_1C9A3B000, v26, OS_LOG_TYPE_DEFAULT, "    HSLS [assignPinnedSG]: ASSIGNING suggestion %@", buf, 0xCu);
                }

                -[ATXHomeScreenLayoutSelector2 _assignSuggestion:toTopOfStack:](self, "_assignSuggestion:toTopOfStack:", v25, v13);
              }
            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
            if (v22)
              continue;
            break;
          }
        }
LABEL_27:

      }
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    }
    while (v33);
  }

}

- (void)_assignPinnedAPPWidgetForPage:(id)a3 suggestions:(id)a4 homeScreenState:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  id obj;
  void *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v32 = a4;
  v9 = a5;
  __atxlog_handle_blending();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "config");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134217984;
    v44 = objc_msgSend(v11, "pageIndex");
    _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_DEFAULT, "HSLS [assignPinnedAPP]: considering App Prediction Panels on page %lu", buf, 0xCu);

  }
  v28 = v8;
  objc_msgSend(v8, "pinnedAPPs");
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
  if (v33)
  {
    v31 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v39 != v31)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        __atxlog_handle_blending();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v13, "config");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "widgets");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "firstObject");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "widgetUniqueId");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "config");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v44 = (uint64_t)v17;
          v45 = 2114;
          v46 = v19;
          _os_log_impl(&dword_1C9A3B000, v14, OS_LOG_TYPE_DEFAULT, "  HSLS [assignPinnedAPP]: considering App Prediction Panel %{public}@ in stack %{public}@", buf, 0x16u);

        }
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        v20 = v32;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v35;
          while (2)
          {
            for (j = 0; j != v22; ++j)
            {
              if (*(_QWORD *)v35 != v23)
                objc_enumerationMutation(v20);
              v25 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j);
              if (!-[ATXHomeScreenLayoutSelector2 _isSuggestionStillNeededForTopOfStack:](self, "_isSuggestionStillNeededForTopOfStack:", v13))
              {
                __atxlog_handle_blending();
                v27 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1C9A3B000, v27, OS_LOG_TYPE_DEFAULT, "    HSLS [assignPinnedAPP]: App Prediction Panel no longer needs suggestion", buf, 2u);
                }

                goto LABEL_27;
              }
              if (-[ATXHomeScreenLayoutSelector2 _isSuggestionACandidate:forStack:dedupeAppSuggestionsByWidgets:ignoreDuplicatesInSGWidget:ignoreDuplicatesInPanels:homeScreenState:](self, "_isSuggestionACandidate:forStack:dedupeAppSuggestionsByWidgets:ignoreDuplicatesInSGWidget:ignoreDuplicatesInPanels:homeScreenState:", v25, v13, 0, 1, 0, v9)&& -[ATXHomeScreenLayoutSelector2 _hasEligiblePinnedWidgetStacksForAPPWidget:forCandidateStack:](self, "_hasEligiblePinnedWidgetStacksForAPPWidget:forCandidateStack:", v25, v13))
              {
                __atxlog_handle_blending();
                v26 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v44 = v25;
                  _os_log_impl(&dword_1C9A3B000, v26, OS_LOG_TYPE_DEFAULT, "    HSLS [assignPinnedAPP]: ASSIGNING suggestion %@", buf, 0xCu);
                }

                -[ATXHomeScreenLayoutSelector2 _assignSuggestion:toTopOfStack:](self, "_assignSuggestion:toTopOfStack:", v25, v13);
              }
            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
            if (v22)
              continue;
            break;
          }
        }
LABEL_27:

      }
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    }
    while (v33);
  }

}

- (void)_assignWidgetForTopOfStack:(id)a3 suggestions:(id)a4 homeScreenState:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  const __CFString *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  const __CFString *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v34 = a4;
  v9 = a5;
  __atxlog_handle_blending();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "config");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134217984;
    v47 = objc_msgSend(v11, "pageIndex");
    _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_DEFAULT, "HSLS [assignSmartRotate]: considering Smart Rotate on page %lu", buf, 0xCu);

  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v32 = v8;
  objc_msgSend(v8, "stacks");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v42;
    v33 = *(_QWORD *)v42;
    do
    {
      v15 = 0;
      v35 = v13;
      do
      {
        if (*(_QWORD *)v42 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v15);
        objc_msgSend(v16, "config");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "allowsSmartRotate");

        if (v18)
        {
          __atxlog_handle_blending();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v16, "config");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "identifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v16, "isStale");
            *(_DWORD *)buf = 138543618;
            v23 = CFSTR("NO");
            if (v22)
              v23 = CFSTR("YES");
            v47 = (uint64_t)v21;
            v48 = 2112;
            v49 = v23;
            _os_log_impl(&dword_1C9A3B000, v19, OS_LOG_TYPE_DEFAULT, "  HSLS [assignSmartRotate]: considering Smart Rotate for stack %{public}@ (isStale == %@)", buf, 0x16u);

          }
          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          v24 = v34;
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
          if (v25)
          {
            v26 = v25;
            v27 = *(_QWORD *)v38;
            while (2)
            {
              for (i = 0; i != v26; ++i)
              {
                if (*(_QWORD *)v38 != v27)
                  objc_enumerationMutation(v24);
                v29 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
                if (!-[ATXHomeScreenLayoutSelector2 _isSuggestionStillNeededForTopOfStack:](self, "_isSuggestionStillNeededForTopOfStack:", v16))
                {
                  __atxlog_handle_blending();
                  v31 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1C9A3B000, v31, OS_LOG_TYPE_DEFAULT, "    HSLS [assignSmartRotate]: stack no longer needs suggestion", buf, 2u);
                  }

                  goto LABEL_30;
                }
                if (-[ATXHomeScreenLayoutSelector2 _isSuggestionACandidate:forStack:dedupeAppSuggestionsByWidgets:ignoreDuplicatesInSGWidget:ignoreDuplicatesInPanels:homeScreenState:](self, "_isSuggestionACandidate:forStack:dedupeAppSuggestionsByWidgets:ignoreDuplicatesInSGWidget:ignoreDuplicatesInPanels:homeScreenState:", v29, v16, 1, 0, 1, v9)&& -[ATXHomeScreenLayoutSelector2 _isStackEligibleForSmartRotate:stack:](self, "_isStackEligibleForSmartRotate:stack:", v29, v16))
                {
                  __atxlog_handle_blending();
                  v30 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v47 = v29;
                    _os_log_impl(&dword_1C9A3B000, v30, OS_LOG_TYPE_DEFAULT, "    HSLS [assignSmartRotate]: ASSIGNING suggestion %@", buf, 0xCu);
                  }

                  -[ATXHomeScreenLayoutSelector2 _assignSuggestion:toTopOfStack:](self, "_assignSuggestion:toTopOfStack:", v29, v16);
                }
              }
              v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
              if (v26)
                continue;
              break;
            }
          }
LABEL_30:

          v14 = v33;
          v13 = v35;
        }
        ++v15;
      }
      while (v15 != v13);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    }
    while (v13);
  }

}

- (void)_assignUnfilledSGWidgetForPage:(id)a3 suggestions:(id)a4 homeScreenState:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  ATXHomeScreenLayoutSelector2 *v27;
  void *v28;
  NSObject *v29;
  id obj;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  uint64_t v36;
  _QWORD v37[6];
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[16];
  _BYTE v49[128];
  uint8_t v50[128];
  uint8_t buf[4];
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  __atxlog_handle_blending();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "config");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134217984;
    v52 = objc_msgSend(v12, "pageIndex");
    _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, "HSLS [assignUnfilledSG]: considering user-added unfilled SG widgets on page %lu", buf, 0xCu);

  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  objc_msgSend(v8, "stacks");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v32)
  {
    v31 = *(_QWORD *)v45;
    v13 = MEMORY[0x1E0C809B0];
    v34 = v8;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v45 != v31)
          objc_enumerationMutation(obj);
        v33 = v14;
        v15 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v14);
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        objc_msgSend(v15, "suggestionsWidgetSuggestionsByWidgetUniqueId");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "allValues");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v35 = v17;
        v36 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
        if (v36)
        {
          v18 = *(_QWORD *)v41;
          do
          {
            v19 = 0;
            do
            {
              if (*(_QWORD *)v41 != v18)
                objc_enumerationMutation(v35);
              v20 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v19);
              __atxlog_handle_blending();
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v20, "widget");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "widgetUniqueId");
                v23 = v18;
                v24 = v13;
                v25 = v10;
                v26 = v9;
                v27 = self;
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v52 = (uint64_t)v28;
                _os_log_impl(&dword_1C9A3B000, v21, OS_LOG_TYPE_DEFAULT, "  HSLS [assignUnfilledSG]: considering SG widget %{public}@", buf, 0xCu);

                self = v27;
                v9 = v26;
                v10 = v25;
                v13 = v24;
                v18 = v23;

                v8 = v34;
              }

              v37[0] = v13;
              v37[1] = 3221225472;
              v37[2] = __91__ATXHomeScreenLayoutSelector2__assignUnfilledSGWidgetForPage_suggestions_homeScreenState___block_invoke;
              v37[3] = &unk_1E82DDF90;
              v37[4] = v20;
              v37[5] = self;
              v38 = v10;
              v39 = v8;
              objc_msgSend(v9, "enumerateObjectsUsingBlock:", v37);
              if ((objc_msgSend(v20, "isLayoutComplete") & 1) == 0)
              {
                __atxlog_handle_blending();
                v29 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                  -[ATXHomeScreenLayoutSelector2 _assignUnfilledSGWidgetForPage:suggestions:homeScreenState:].cold.1((uint64_t)v48, (uint64_t)v20);

              }
              ++v19;
            }
            while (v36 != v19);
            v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
          }
          while (v36);
        }

        v14 = v33 + 1;
      }
      while (v33 + 1 != v32);
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    }
    while (v32);
  }

}

void __91__ATXHomeScreenLayoutSelector2__assignUnfilledSGWidgetForPage_suggestions_homeScreenState___block_invoke(id *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  const char *v21;
  const char *v22;
  id v23;
  void *v24;
  int v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  if (!objc_msgSend(a1[4], "isLayoutComplete"))
  {
    if (!objc_msgSend(a1[5], "_shouldConsiderSuggestionForSuggestionsWidget:", v6))
      goto LABEL_34;
    objc_msgSend(v6, "executableSpecification");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "executableType");

    if (v14 == 2)
    {
      objc_msgSend(v6, "atxActionExecutableObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "intent");
      v7 = objc_claimAutoreleasedReturnValue();

      if (v7 && objc_msgSend(a1[6], "containsWidgetForIntent:", v7))
      {
        __atxlog_handle_blending();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v25 = 138412290;
          v26 = v6;
          _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "    HSLS [assignUnfilledSG]: action suggestion not eligible because there is already a widget showing the same intent %@", (uint8_t *)&v25, 0xCu);
        }
        goto LABEL_5;
      }
      goto LABEL_26;
    }
    objc_msgSend(v6, "executableSpecification");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "executableType");

    if (v17 != 10)
    {
LABEL_27:
      if (!objc_msgSend(a1[7], "isShowingDuplicatedContentForSuggestion:considerUnderStackContents:dedupeAppSuggestionsByWidgets:ignoreDuplicatesInSGWidget:ignoreDuplicatesInPanels:", v6, 1, 1, 0, 1))
      {
        v23 = a1[4];
        objc_msgSend(v23, "mainSuggestionInLayout");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v23) = objc_msgSend(v23, "addSuggestion:asMainSuggestion:", v6, v24 == 0);

        if (!(_DWORD)v23)
          goto LABEL_34;
        __atxlog_handle_blending();
        v7 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          goto LABEL_6;
        objc_msgSend(a1[4], "widget");
        v8 = objc_claimAutoreleasedReturnValue();
        -[NSObject widgetUniqueId](v8, "widgetUniqueId");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138412546;
        v26 = v9;
        v27 = 2112;
        v28 = v6;
        v10 = "    HSLS [assignUnfilledSG]: ASSIGNED SW %@ with suggestion:\n%@";
        v11 = v7;
        v12 = 22;
        goto LABEL_4;
      }
      __atxlog_handle_blending();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        goto LABEL_6;
      v25 = 138412290;
      v26 = v6;
      v22 = "    HSLS [assignUnfilledSG]: suggestion not eligible due to duplicates on page %@";
LABEL_30:
      _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v25, 0xCu);
      goto LABEL_6;
    }
    objc_msgSend(v6, "linkActionExecutableObject");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      __atxlog_handle_blending();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        goto LABEL_6;
      v25 = 138412290;
      v26 = v6;
      v22 = "    HSLS [assignUnfilledSG]: Link action suggestion not eligible because the action container couldn't be deserialized %@";
      goto LABEL_30;
    }
    v7 = v18;
    -[NSObject cachedAppIntent](v18, "cachedAppIntent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      if (!objc_msgSend(a1[6], "containsWidgetForIntent:", v19))
      {

LABEL_26:
        goto LABEL_27;
      }
      __atxlog_handle_blending();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v25 = 138412290;
        v26 = v6;
        v21 = "    HSLS [assignUnfilledSG]: Link action suggestion not eligible because there is already a widget showing"
              " the same app intent %@";
LABEL_23:
        _os_log_impl(&dword_1C9A3B000, v20, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v25, 0xCu);
      }
    }
    else
    {
      __atxlog_handle_blending();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v25 = 138412290;
        v26 = v6;
        v21 = "    HSLS [assignUnfilledSG]: Link action suggestion not eligible because cached app intent is nil %@";
        goto LABEL_23;
      }
    }

    goto LABEL_6;
  }
  *a4 = 1;
  __atxlog_handle_blending();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1[4], "widget");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject widgetUniqueId](v8, "widgetUniqueId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543362;
    v26 = v9;
    v10 = "    HSLS [assignUnfilledSG]: SG widget %{public}@ is layout-complete";
    v11 = v7;
    v12 = 12;
LABEL_4:
    _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v25, v12);

LABEL_5:
  }
LABEL_6:

LABEL_34:
}

- (id)_suggestionsEligibleForSuggestedSGWidgetOnPages:(id)a3 amongSuggestions:(id)a4
{
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  __int128 v23;
  void *v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v6 = a4;
  v25 = (id)objc_opt_new();
  v24 = (void *)objc_opt_new();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v35;
    *(_QWORD *)&v8 = 138412290;
    v23 = v8;
    v26 = *(_QWORD *)v35;
    do
    {
      v11 = 0;
      v28 = v9;
      do
      {
        if (*(_QWORD *)v35 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v11);
        if (!-[ATXHomeScreenLayoutSelector2 _shouldConsiderSuggestionForSuggestionsWidget:](self, "_shouldConsiderSuggestionForSuggestionsWidget:", v12, v23))goto LABEL_27;
        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        v13 = v27;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
        if (!v14)
          goto LABEL_20;
        v15 = v14;
        v16 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v31 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
            objc_msgSend(v12, "executableSpecification");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v19, "executableType") == 1)
            {
              v20 = objc_msgSend(v18, "isSeldomVisited");

              if (v20)
              {
                if ((objc_msgSend(v18, "suggestionsWidgetOnPageIsShowingDuplicatedContentForSuggestion:", v12) & 1) != 0)
                  goto LABEL_26;
                continue;
              }
            }
            else
            {

            }
            if ((objc_msgSend(v18, "isShowingDuplicatedContentForSuggestion:considerUnderStackContents:dedupeAppSuggestionsByWidgets:ignoreDuplicatesInSGWidget:ignoreDuplicatesInPanels:", v12, 1, 1, 0, 1) & 1) != 0)goto LABEL_26;
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
        }
        while (v15);
LABEL_20:

        +[ATXSuggestionPreprocessor bundleIdAssociatedWithSuggestion:](ATXSuggestionPreprocessor, "bundleIdAssociatedWithSuggestion:", v12);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        if (!v13)
          goto LABEL_23;
        if ((objc_msgSend(v24, "containsObject:", v13) & 1) == 0)
        {
          objc_msgSend(v24, "addObject:", v13);
LABEL_23:
          __atxlog_handle_blending();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v23;
            v39 = v12;
            _os_log_impl(&dword_1C9A3B000, v21, OS_LOG_TYPE_DEFAULT, "HSLS [assignExistingSuggestedSG]: Found suggestion eligible for suggested SG %@", buf, 0xCu);
          }

          objc_msgSend(v25, "addObject:", v12);
        }
LABEL_26:
        v10 = v26;
        v9 = v28;

LABEL_27:
        ++v11;
      }
      while (v11 != v9);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
    }
    while (v9);
  }

  return v25;
}

- (void)_fillSuggestedSGWidgetIfLayoutNotComplete:(id)a3 withSuggestions:(id)a4 updatingUsedSuggestionIndexSet:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, uint64_t, _BYTE *);
  void *v15;
  id v16;
  id v17;

  v7 = a3;
  v8 = a5;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __121__ATXHomeScreenLayoutSelector2__fillSuggestedSGWidgetIfLayoutNotComplete_withSuggestions_updatingUsedSuggestionIndexSet___block_invoke;
  v15 = &unk_1E82DDF68;
  v9 = v7;
  v16 = v9;
  v17 = v8;
  v10 = v8;
  objc_msgSend(a4, "enumerateObjectsUsingBlock:", &v12);
  if ((objc_msgSend(v9, "isLayoutComplete", v12, v13, v14, v15) & 1) == 0)
  {
    __atxlog_handle_blending();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[ATXHomeScreenLayoutSelector2 _fillSuggestedSGWidgetIfLayoutNotComplete:withSuggestions:updatingUsedSuggestionIndexSet:].cold.1(v9, v11);

  }
}

void __121__ATXHomeScreenLayoutSelector2__fillSuggestedSGWidgetIfLayoutNotComplete_withSuggestions_updatingUsedSuggestionIndexSet___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  id *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = (id *)(a1 + 32);
  if (objc_msgSend(*(id *)(a1 + 32), "isLayoutComplete"))
  {
    *a4 = 1;
  }
  else if ((objc_msgSend(*(id *)(a1 + 40), "containsIndex:", a3) & 1) == 0)
  {
    __atxlog_handle_blending();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*v8, "widget");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "widgetUniqueId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v11;
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_DEFAULT, "HSLS [fillIncompleteSuggestedSG]: ASSIGNING new suggestion to suggested SG %{public}@ %@", (uint8_t *)&v15, 0x16u);

    }
    v12 = *v8;
    objc_msgSend(*v8, "mainSuggestionInLayout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = objc_msgSend(v12, "addSuggestion:asMainSuggestion:", v7, v13 == 0);

    if ((_DWORD)v12)
    {
      objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
    }
    else
    {
      __atxlog_handle_blending();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        __121__ATXHomeScreenLayoutSelector2__fillSuggestedSGWidgetIfLayoutNotComplete_withSuggestions_updatingUsedSuggestionIndexSet___block_invoke_cold_1((id *)(a1 + 32));

    }
  }

}

- (void)_assignExistingSuggestedSGWidgetsOnPages:(id)a3 withSuggestions:(id)a4 suggestionToRankingIndex:(id)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  uint64_t v20;
  int64_t thresholdConfidenceForSuggestedSG;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  int v33;
  BOOL v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  ATXWidgetSuggestionDismissManager *widgetDismissManager;
  void *v42;
  NSObject *v43;
  unint64_t v44;
  NSObject *v45;
  _BOOL4 v46;
  void *v47;
  void *v48;
  _ATXSuggestionsWidgetSuggestion *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  int64_t v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t k;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  int v75;
  void *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t m;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  NSObject *v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  NSObject *v93;
  void *v94;
  void *v95;
  NSObject *v96;
  const char *v97;
  uint32_t v98;
  void *v99;
  void *v100;
  void *v101;
  int64_t v102;
  void *v103;
  void *v104;
  id v105;
  id v106;
  id v107;
  id v108;
  uint64_t v109;
  uint64_t v110;
  id v111;
  id obj;
  uint64_t v113;
  void *v114;
  id v115;
  NSObject *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  id v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  unint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  NSObject *v130;
  ATXHomeScreenLayoutSelector2 *v131;
  uint64_t v132;
  id v133;
  uint64_t v134;
  uint64_t v135;
  _QWORD v136[4];
  id v137;
  id v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  _QWORD v151[4];
  id v152;
  id v153;
  id v154;
  uint64_t v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  _BYTE v176[128];
  _BYTE v177[128];
  uint8_t v178[128];
  uint8_t buf[4];
  uint64_t v180;
  __int16 v181;
  unint64_t v182;
  __int16 v183;
  unint64_t v184;
  __int16 v185;
  uint64_t v186;
  _BYTE v187[128];
  _BYTE v188[128];
  _BYTE v189[128];
  _BYTE v190[128];
  _BYTE v191[128];
  uint64_t v192;

  v192 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v107 = a4;
  v115 = a5;
  v114 = (void *)objc_opt_new();
  v172 = 0u;
  v173 = 0u;
  v174 = 0u;
  v175 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v172, v191, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v173;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v173 != v11)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v172 + 1) + 8 * i), "config");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v114, "appendFormat:", CFSTR("%lu "), objc_msgSend(v13, "pageIndex"));

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v172, v191, 16);
    }
    while (v10);
  }

  __atxlog_handle_blending();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v180 = (uint64_t)v114;
    _os_log_impl(&dword_1C9A3B000, v14, OS_LOG_TYPE_DEFAULT, "HSLS [assignExistingSuggestedSG]: considering previously suggested SG widgets on pages %{public}@", buf, 0xCu);
  }

  -[ATXHomeScreenLayoutSelector2 _suggestionsEligibleForSuggestedSGWidgetOnPages:amongSuggestions:](self, "_suggestionsEligibleForSuggestedSGWidgetOnPages:amongSuggestions:", obj, v107);
  v168 = 0u;
  v169 = 0u;
  v170 = 0u;
  v171 = 0u;
  v111 = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v168, v190, 16);
  if (!v15)
    goto LABEL_70;
  v16 = v15;
  v134 = 0;
  v17 = *(_QWORD *)v169;
  do
  {
    for (j = 0; j != v16; ++j)
    {
      if (*(_QWORD *)v169 != v17)
        objc_enumerationMutation(v111);
      objc_msgSend(*(id *)(*((_QWORD *)&v168 + 1) + 8 * j), "scoreSpecification");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "suggestedConfidenceCategory");
      thresholdConfidenceForSuggestedSG = self->_thresholdConfidenceForSuggestedSG;

      v22 = v134;
      if (v20 >= thresholdConfidenceForSuggestedSG)
        v22 = v134 + 1;
      v134 = v22;
    }
    v16 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v168, v190, 16);
  }
  while (v16);
  if (v134)
  {
    v23 = objc_msgSend(v111, "count");
    v122 = (void *)objc_opt_new();
    v120 = (void *)objc_opt_new();
    v164 = 0u;
    v165 = 0u;
    v166 = 0u;
    v167 = 0u;
    v108 = obj;
    v131 = self;
    v110 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v164, v189, 16);
    if (v110)
    {
      v129 = 0;
      v109 = *(_QWORD *)v165;
      v24 = *MEMORY[0x1E0CF9480];
      v127 = *MEMORY[0x1E0CF9480];
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v165 != v109)
            objc_enumerationMutation(v108);
          v113 = v25;
          v26 = *(void **)(*((_QWORD *)&v164 + 1) + 8 * v25);
          if (objc_msgSend(v26, "isSeldomVisited"))
          {
            __atxlog_handle_blending();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v26, "config");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v28, "pageIndex");
              *(_DWORD *)buf = 134217984;
              v180 = v29;
              _os_log_impl(&dword_1C9A3B000, v27, OS_LOG_TYPE_DEFAULT, "HSLS [assignExistingSuggestedSG]: skipping page %lu because it's seldom visited", buf, 0xCu);

            }
          }
          else
          {
            v162 = 0u;
            v163 = 0u;
            v160 = 0u;
            v161 = 0u;
            objc_msgSend(v26, "stacks");
            v27 = objc_claimAutoreleasedReturnValue();
            v118 = -[NSObject countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v160, v188, 16);
            if (v118)
            {
              v116 = v27;
              v117 = *(_QWORD *)v161;
              do
              {
                v30 = 0;
                do
                {
                  if (*(_QWORD *)v161 != v117)
                    objc_enumerationMutation(v27);
                  v119 = v30;
                  v31 = *(void **)(*((_QWORD *)&v160 + 1) + 8 * v30);
                  objc_msgSend(v31, "config");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  v33 = objc_msgSend(v32, "allowsNewWidget");

                  if (v33)
                    v34 = v134 < 1;
                  else
                    v34 = 1;
                  if (!v34)
                  {
                    v158 = 0u;
                    v159 = 0u;
                    v156 = 0u;
                    v157 = 0u;
                    objc_msgSend(v31, "previousSuggestedWidgets");
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v156, v187, 16);
                    if (v36)
                    {
                      v37 = v36;
                      v125 = v31;
                      v38 = *(_QWORD *)v157;
                      v124 = v35;
                      do
                      {
                        v39 = 0;
                        v132 = v37;
                        do
                        {
                          if (*(_QWORD *)v157 != v38)
                            objc_enumerationMutation(v35);
                          v40 = *(void **)(*((_QWORD *)&v156 + 1) + 8 * v39);
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            widgetDismissManager = self->_widgetDismissManager;
                            ATXSpecialWidgetKindSiriSuggestions();
                            v42 = (void *)objc_claimAutoreleasedReturnValue();
                            LODWORD(widgetDismissManager) = -[ATXWidgetSuggestionDismissManager shouldBlockWidgetSuggestionBecauseOfPreviousDismiss:kind:intent:](widgetDismissManager, "shouldBlockWidgetSuggestionBecauseOfPreviousDismiss:kind:intent:", v24, v42, 0);

                            if ((_DWORD)widgetDismissManager)
                            {
                              __atxlog_handle_blending();
                              v43 = objc_claimAutoreleasedReturnValue();
                              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                              {
                                *(_WORD *)buf = 0;
                                _os_log_impl(&dword_1C9A3B000, v43, OS_LOG_TYPE_DEFAULT, "HSLS [assignExistingSuggestedSG]: considered existing suggestions widget but the widget has been dismissed", buf, 2u);
                              }
                              v37 = v132;
                            }
                            else
                            {
                              v43 = v40;
                              if (-[NSObject layoutType](v43, "layoutType") == 5)
                              {
                                v44 = 1;
                              }
                              else if (-[NSObject layoutType](v43, "layoutType") == 9)
                              {
                                v44 = 2;
                              }
                              else
                              {
                                v44 = 4 * (-[NSObject layoutType](v43, "layoutType") == 11);
                              }
                              __atxlog_handle_blending();
                              v45 = objc_claimAutoreleasedReturnValue();
                              v46 = os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT);
                              if (v23 < v44 || v134 <= 0)
                              {
                                if (v46)
                                {
                                  -[NSObject widget](v43, "widget");
                                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v55, "widgetUniqueId");
                                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                                  *(_DWORD *)buf = 138544130;
                                  v180 = (uint64_t)v56;
                                  v181 = 2048;
                                  v182 = v44;
                                  v183 = 2048;
                                  v184 = v23;
                                  v185 = 2048;
                                  v186 = v134;
                                  _os_log_impl(&dword_1C9A3B000, v45, OS_LOG_TYPE_DEFAULT, "HSLS [assignExistingSuggestedSG]: not populating previously suggested SG %{public}@: numSuggestionsNeeded %lu, remaining numSuggestions %lu, remaining numSuggestionsAboveConfidenceThreshold %lu", buf, 0x2Au);

                                  self = v131;
                                }
                                v24 = v127;
                              }
                              else
                              {
                                v126 = v23 - v44;
                                if (v46)
                                {
                                  -[NSObject widget](v43, "widget");
                                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v47, "widgetUniqueId");
                                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                                  *(_DWORD *)buf = 138544130;
                                  v180 = (uint64_t)v48;
                                  v181 = 2048;
                                  v182 = v44;
                                  v183 = 2048;
                                  v184 = v23;
                                  v185 = 2048;
                                  v186 = v134;
                                  _os_log_impl(&dword_1C9A3B000, v45, OS_LOG_TYPE_DEFAULT, "HSLS [assignExistingSuggestedSG]: creating placeholder for previously suggested SG %{public}@: numSuggestionsNeeded %lu, remaining numSuggestions %lu, remaining numSuggestionsAboveConfidenceThreshold %lu", buf, 0x2Au);

                                  self = v131;
                                }

                                v49 = [_ATXSuggestionsWidgetSuggestion alloc];
                                -[NSObject widget](v43, "widget");
                                v50 = (void *)objc_claimAutoreleasedReturnValue();
                                v45 = -[_ATXSuggestionsWidgetSuggestion initWithSuggestionsWidget:containingStack:suggestionDeduplicator:hyperParameters:](v49, "initWithSuggestionsWidget:containingStack:suggestionDeduplicator:hyperParameters:", v50, v125, self->_suggestionDeduplicator, self->_hyperParameters);

                                objc_msgSend(v125, "suggestionsWidgetSuggestionsByWidgetUniqueId");
                                v51 = (void *)objc_claimAutoreleasedReturnValue();
                                -[NSObject widget](v43, "widget");
                                v52 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v52, "widgetUniqueId");
                                v53 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v51, "setObject:forKeyedSubscript:", v45, v53);

                                self = v131;
                                objc_msgSend(v125, "suggestedWidgets");
                                v54 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v54, "addObject:", v45);

                                objc_msgSend(v122, "addObject:", v45);
                                objc_msgSend(v120, "addObject:", v43);
                                v24 = v127;
                                v129 += v44;
                                v134 -= v44;
                                v23 = v126;
                                v35 = v124;
                              }
                              v37 = v132;

                            }
                          }
                          ++v39;
                        }
                        while (v37 != v39);
                        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v156, v187, 16);
                      }
                      while (v37);
                    }

                    v27 = v116;
                  }
                  v30 = v119 + 1;
                }
                while (v119 + 1 != v118);
                v118 = -[NSObject countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v160, v188, 16);
              }
              while (v118);
            }
          }

          v25 = v113 + 1;
        }
        while (v113 + 1 != v110);
        v110 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v164, v189, 16);
      }
      while (v110);
    }
    else
    {
      v129 = 0;
    }

    v60 = (void *)objc_opt_new();
    v151[0] = MEMORY[0x1E0C809B0];
    v151[1] = 3221225472;
    v151[2] = __114__ATXHomeScreenLayoutSelector2__assignExistingSuggestedSGWidgetsOnPages_withSuggestions_suggestionToRankingIndex___block_invoke;
    v151[3] = &unk_1E82DDFE0;
    v121 = v120;
    v152 = v121;
    v61 = v111;
    v153 = v61;
    v155 = v129;
    v62 = v60;
    v154 = v62;
    objc_msgSend(v122, "enumerateObjectsUsingBlock:", v151);
    v149 = 0u;
    v150 = 0u;
    v147 = 0u;
    v148 = 0u;
    v63 = v122;
    v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v147, v178, 16);
    if (v64)
    {
      v65 = v64;
      v66 = *(_QWORD *)v148;
      do
      {
        for (k = 0; k != v65; ++k)
        {
          if (*(_QWORD *)v148 != v66)
            objc_enumerationMutation(v63);
          -[ATXHomeScreenLayoutSelector2 _fillSuggestedSGWidgetIfLayoutNotComplete:withSuggestions:updatingUsedSuggestionIndexSet:](self, "_fillSuggestedSGWidgetIfLayoutNotComplete:withSuggestions:updatingUsedSuggestionIndexSet:", *(_QWORD *)(*((_QWORD *)&v147 + 1) + 8 * k), v61, v62);
        }
        v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v147, v178, 16);
      }
      while (v65);
    }
    v123 = v61;

    v145 = 0u;
    v146 = 0u;
    v143 = 0u;
    v144 = 0u;
    v57 = v63;
    v68 = -[NSObject countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v143, v177, 16);
    if (v68)
    {
      v69 = v68;
      v70 = *(_QWORD *)v144;
      v133 = v62;
      v128 = *(_QWORD *)v144;
      v130 = v57;
      do
      {
        v71 = 0;
        v135 = v69;
        do
        {
          if (*(_QWORD *)v144 != v70)
            objc_enumerationMutation(v57);
          v72 = *(void **)(*((_QWORD *)&v143 + 1) + 8 * v71);
          if (objc_msgSend(v72, "isLayoutComplete"))
          {
            objc_msgSend(v72, "stack");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "config");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            v75 = objc_msgSend(v74, "allowsSmartRotate");

            if (v75)
            {
              v141 = 0u;
              v142 = 0u;
              v139 = 0u;
              v140 = 0u;
              objc_msgSend(v72, "suggestionLayout");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v76, "allSuggestionsInLayout");
              v77 = (void *)objc_claimAutoreleasedReturnValue();

              v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v139, v176, 16);
              if (v78)
              {
                v79 = v78;
                v80 = 0;
                v81 = *(_QWORD *)v140;
                do
                {
                  for (m = 0; m != v79; ++m)
                  {
                    if (*(_QWORD *)v140 != v81)
                      objc_enumerationMutation(v77);
                    v83 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * m);
                    objc_msgSend(v83, "scoreSpecification");
                    v84 = (void *)objc_claimAutoreleasedReturnValue();
                    v85 = objc_msgSend(v84, "suggestedConfidenceCategory");

                    if (v85 > v80)
                    {
                      objc_msgSend(v83, "scoreSpecification");
                      v86 = (void *)objc_claimAutoreleasedReturnValue();
                      v80 = objc_msgSend(v86, "suggestedConfidenceCategory");

                      objc_msgSend(v115, "objectForKeyedSubscript:", v83);
                      v87 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v87, "unsignedIntegerValue");

                    }
                  }
                  v79 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v139, v176, 16);
                }
                while (v79);
              }
              else
              {
                v80 = 0;
              }

              if (v80 < v131->_thresholdConfidenceForSuggestedSG)
              {
                __atxlog_handle_blending();
                v88 = objc_claimAutoreleasedReturnValue();
                v69 = v135;
                if (os_log_type_enabled(v88, OS_LOG_TYPE_FAULT))
                {
                  objc_msgSend(v72, "widget");
                  v100 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v100, "widgetUniqueId");
                  v101 = (void *)objc_claimAutoreleasedReturnValue();
                  v102 = v131->_thresholdConfidenceForSuggestedSG;
                  objc_msgSend(v72, "suggestionLayout");
                  v103 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  v180 = (uint64_t)v101;
                  v181 = 2048;
                  v182 = v102;
                  v183 = 2112;
                  v184 = (unint64_t)v103;
                  _os_log_fault_impl(&dword_1C9A3B000, v88, OS_LOG_TYPE_FAULT, "HSLS [assignExistingSuggestedSG]: newly created layout for previously suggested SG %{public}@ does not have >=1 suggestion with confidence >= %ld: %@", buf, 0x20u);

                }
                v62 = v133;
                v57 = v130;
                goto LABEL_111;
              }
              objc_msgSend(v72, "stack");
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v89, "topOfStackSuggestion");
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v90, "mainSuggestionInLayout");
              v88 = objc_claimAutoreleasedReturnValue();

              v69 = v135;
              if (v88)
              {
                objc_msgSend(v115, "objectForKeyedSubscript:", v88);
                v91 = (void *)objc_claimAutoreleasedReturnValue();
                v92 = objc_msgSend(v91, "unsignedIntegerValue");

                v62 = v133;
                v57 = v130;
                if (v92)
                {
                  __atxlog_handle_blending();
                  v93 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v72, "widget");
                    v94 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v94, "widgetUniqueId");
                    v95 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    v180 = (uint64_t)v95;
                    v181 = 2112;
                    v182 = (unint64_t)v88;
                    v96 = v93;
                    v97 = "HSLS [assignExistingSuggestedSG]: Smart Rotate to existing suggested SG %{public}@, overriding"
                          " inferior topOfStackSuggestion %@";
                    v98 = 22;
                    goto LABEL_109;
                  }
                  goto LABEL_110;
                }
              }
              else
              {
                __atxlog_handle_blending();
                v93 = objc_claimAutoreleasedReturnValue();
                v62 = v133;
                v57 = v130;
                if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v72, "widget");
                  v94 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v94, "widgetUniqueId");
                  v95 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v180 = (uint64_t)v95;
                  v96 = v93;
                  v97 = "HSLS [assignExistingSuggestedSG]: Smart Rotate to existing suggested SG %{public}@, because ther"
                        "e is no topOfStackSuggestion for the stack yet";
                  v98 = 12;
LABEL_109:
                  _os_log_impl(&dword_1C9A3B000, v96, OS_LOG_TYPE_DEFAULT, v97, buf, v98);

                }
LABEL_110:

                objc_msgSend(v72, "stack");
                v99 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v99, "setTopOfStackSuggestion:", v72);

              }
LABEL_111:
              v70 = v128;

            }
          }
          ++v71;
        }
        while (v71 != v69);
        v69 = -[NSObject countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v143, v177, 16);
      }
      while (v69);
    }

    objc_msgSend(v123, "objectsAtIndexes:", v62);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "removeAllIndexes");
    v136[0] = MEMORY[0x1E0C809B0];
    v136[1] = 3221225472;
    v136[2] = __114__ATXHomeScreenLayoutSelector2__assignExistingSuggestedSGWidgetsOnPages_withSuggestions_suggestionToRankingIndex___block_invoke_39;
    v136[3] = &unk_1E82DDF68;
    v137 = v104;
    v138 = v62;
    v105 = v62;
    v106 = v104;
    v59 = v107;
    objc_msgSend(v107, "enumerateObjectsUsingBlock:", v136);
    objc_msgSend(v107, "removeObjectsAtIndexes:", v105);

  }
  else
  {
LABEL_70:
    __atxlog_handle_blending();
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      v58 = self->_thresholdConfidenceForSuggestedSG;
      *(_DWORD *)buf = 134217984;
      v180 = v58;
      _os_log_impl(&dword_1C9A3B000, v57, OS_LOG_TYPE_DEFAULT, "HSLS [assignExistingSuggestedSG]: not populating any previously suggested SG because there is no suggestions above confidence threshold %ld", buf, 0xCu);
    }
    v59 = v107;
  }

}

void __114__ATXHomeScreenLayoutSelector2__assignExistingSuggestedSGWidgetsOnPages_withSuggestions_suggestionToRankingIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  uint64_t v14;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __114__ATXHomeScreenLayoutSelector2__assignExistingSuggestedSGWidgetsOnPages_withSuggestions_suggestionToRankingIndex___block_invoke_2;
  v10[3] = &unk_1E82DDFB8;
  v14 = *(_QWORD *)(a1 + 56);
  v11 = v5;
  v7 = *(void **)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  v13 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);

}

void __114__ATXHomeScreenLayoutSelector2__assignExistingSuggestedSGWidgetsOnPages_withSuggestions_suggestionToRankingIndex___block_invoke_2(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  id v7;
  id *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  if (*(_QWORD *)(a1 + 56) <= a3
    || (v8 = (id *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "isLayoutComplete")))
  {
    *a4 = 1;
  }
  else if ((objc_msgSend(*(id *)(a1 + 40), "containsIndex:", a3) & 1) == 0
         && objc_msgSend(*(id *)(a1 + 48), "containsIdenticalContentOfSuggestion:", v7))
  {
    __atxlog_handle_blending();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*v8, "widget");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "widgetUniqueId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v11;
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_DEFAULT, "HSLS [assignExistingSuggestedSG]: ASSIGNING previously existing suggestion to suggested SG %{public}@ %@", (uint8_t *)&v15, 0x16u);

    }
    v12 = *v8;
    objc_msgSend(*v8, "mainSuggestionInLayout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = objc_msgSend(v12, "addSuggestion:asMainSuggestion:", v7, v13 == 0);

    if ((_DWORD)v12)
    {
      objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
    }
    else
    {
      __atxlog_handle_blending();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        __114__ATXHomeScreenLayoutSelector2__assignExistingSuggestedSGWidgetsOnPages_withSuggestions_suggestionToRankingIndex___block_invoke_2_cold_1((id *)(a1 + 32));

    }
  }

}

void __114__ATXHomeScreenLayoutSelector2__assignExistingSuggestedSGWidgetsOnPages_withSuggestions_suggestionToRankingIndex___block_invoke_39(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSObject *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  id v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = *(id *)(a1 + 32);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        if (*(id *)(*((_QWORD *)&v12 + 1) + 8 * i) == v5)
        {
          objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3, (_QWORD)v12);
          __atxlog_handle_blending();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v17 = v5;
            _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, "HSLS [assignExistingSuggestedSG]: removing used suggestion %@", buf, 0xCu);
          }

          goto LABEL_13;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_13:

}

- (void)_assignNewSuggestedWidgetsForPages:(id)a3 rankedSuggestions:(id)a4 suggestionToRankingIndex:(id)a5 homeScreenState:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  NSObject *v19;
  void *v20;
  const __CFString *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  char v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  BOOL v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  BOOL v50;
  void *v51;
  NSObject *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  NSObject *v57;
  const char *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  NSObject *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  unint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  unint64_t v79;
  NSObject *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  NSObject *v85;
  uint64_t v86;
  int v87;
  NSObject *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t j;
  void *v93;
  void *v94;
  void *v95;
  int v96;
  void *v97;
  char v98;
  NSObject *v99;
  void *v100;
  void *v101;
  void *v102;
  uint64_t v103;
  NSObject *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  uint64_t v109;
  NSObject *v110;
  void *v111;
  void *v112;
  uint64_t v113;
  NSObject *v114;
  void *v115;
  NSObject *v116;
  const char *v117;
  NSObject *v118;
  NSObject *v119;
  void *v120;
  void *v121;
  void *v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  NSObject *v126;
  NSObject *v127;
  void *v128;
  uint64_t v129;
  void *v130;
  uint64_t v131;
  void *v132;
  void *v133;
  void *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t k;
  void *v139;
  void *v140;
  char v141;
  void *v142;
  void *v143;
  id v144;
  const __CFString *applicationID;
  uint64_t v146;
  uint64_t v147;
  id obj;
  void *v149;
  uint64_t v150;
  uint64_t v151;
  void *v152;
  uint64_t v153;
  int AppBooleanValue;
  void *v155;
  id v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  void *v160;
  id v161;
  unint64_t v162;
  NSObject *v163;
  id v164;
  NSObject *v165;
  uint64_t v166;
  NSObject *v167;
  uint64_t v168;
  uint64_t v169;
  _BOOL4 v170;
  id v171;
  void *v172;
  uint64_t v173;
  int v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  _QWORD v206[5];
  id v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  _BYTE v212[128];
  _BYTE v213[128];
  uint8_t v214[128];
  uint8_t buf[4];
  uint64_t v216;
  __int16 v217;
  uint64_t v218;
  __int16 v219;
  void *v220;
  _BYTE v221[128];
  _BYTE v222[128];
  _BYTE v223[128];
  _BYTE v224[128];
  _BYTE v225[128];
  uint64_t v226;

  v226 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v144 = a4;
  v11 = a5;
  v161 = a6;
  v12 = (void *)objc_opt_new();
  v208 = 0u;
  v209 = 0u;
  v210 = 0u;
  v211 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v208, v225, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v209;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v209 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v208 + 1) + 8 * i), "config");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "appendFormat:", CFSTR("%lu "), objc_msgSend(v18, "pageIndex"));

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v208, v225, 16);
    }
    while (v15);
  }

  __atxlog_handle_blending();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v216 = (uint64_t)v12;
    _os_log_impl(&dword_1C9A3B000, v19, OS_LOG_TYPE_DEFAULT, "HSLS [assignNewWidgetSuggestion]: considering making new Widget Suggestion for pages %{public}@", buf, 0xCu);
  }

  v206[0] = MEMORY[0x1E0C809B0];
  v206[1] = 3221225472;
  v206[2] = __126__ATXHomeScreenLayoutSelector2__assignNewSuggestedWidgetsForPages_rankedSuggestions_suggestionToRankingIndex_homeScreenState___block_invoke;
  v206[3] = &unk_1E82DE008;
  v206[4] = self;
  v156 = v13;
  v207 = v156;
  objc_msgSend(v144, "_pas_filteredArrayWithTest:", v206);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v20, "count"))
  {
    v125 = v20;
    __atxlog_handle_blending();
    v126 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v126, OS_LOG_TYPE_DEFAULT, "HSLS [assignNewWidgetSuggestion]: not making any new Widget Suggestion because there isn't any eligible suggestion", buf, 2u);
    }
    goto LABEL_173;
  }
  v21 = (const __CFString *)*MEMORY[0x1E0CF9548];
  buf[0] = 0;
  applicationID = (const __CFString *)*MEMORY[0x1E0CF9510];
  AppBooleanValue = CFPreferencesGetAppBooleanValue(v21, (CFStringRef)*MEMORY[0x1E0CF9510], buf);
  v202 = 0u;
  v203 = 0u;
  v204 = 0u;
  v205 = 0u;
  v142 = v20;
  obj = v20;
  v159 = v11;
  v143 = v12;
  v153 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v202, v224, 16);
  if (!v153)
    goto LABEL_147;
  v151 = *(_QWORD *)v203;
LABEL_13:
  v22 = 0;
LABEL_14:
  if (*(_QWORD *)v203 != v151)
    objc_enumerationMutation(obj);
  v23 = *(void **)(*((_QWORD *)&v202 + 1) + 8 * v22);
  objc_msgSend(v23, "executableSpecification");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "executableType");

  if (v25 != 3)
  {
    v27 = 0;
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x1E0D81150], "infoSuggestionFromProactiveSuggestion:", v23);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (!v26)
  {
LABEL_22:
    v29 = 0;
    goto LABEL_26;
  }
  objc_msgSend(v26, "widgetBundleIdentifier");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  if (CFPreferencesGetAppBooleanValue(CFSTR("widgetKitDeveloperModeEnabled"), CFSTR("com.apple.duetexpertd"), 0))
  {
    buf[0] = 0;
    if (CFPreferencesGetAppBooleanValue(CFSTR("ATXWidgetKitDeveloperModeSkipEntitlementCheck"), applicationID, buf))
      v29 = 1;
    else
      v29 = objc_msgSend(MEMORY[0x1E0CF8CE0], "isDebuggingAllowedForExtensionBundleId:", v28);
  }
  else
  {
    v29 = 0;
  }

LABEL_26:
  if (AppBooleanValue || (v29 & 1) != 0 || self->_numSuggestedWidgetInPastDay < 0x14)
  {
    __atxlog_handle_blending();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v216 = (uint64_t)v23;
      _os_log_impl(&dword_1C9A3B000, v30, OS_LOG_TYPE_DEFAULT, "HSLS [assignNewWidgetSuggestion]: considering making new Widget Suggestion with suggestion %@", buf, 0xCu);
    }

    objc_msgSend(v23, "executableSpecification");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "executableType");

    v33 = v32 != 3 || v27 == 0;
    v160 = v23;
    if (v33)
    {
      v174 = 0;
      goto LABEL_37;
    }
    v158 = v22;
    v200 = 0u;
    v201 = 0u;
    v198 = 0u;
    v199 = 0u;
    v88 = v156;
    v89 = -[NSObject countByEnumeratingWithState:objects:count:](v88, "countByEnumeratingWithState:objects:count:", &v198, v223, 16);
    if (v89)
    {
      v90 = v89;
      v91 = *(_QWORD *)v199;
      do
      {
        for (j = 0; j != v90; ++j)
        {
          if (*(_QWORD *)v199 != v91)
            objc_enumerationMutation(v88);
          v93 = *(void **)(*((_QWORD *)&v198 + 1) + 8 * j);
          v94 = v27;
          objc_msgSend(v27, "appBundleIdentifier");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          v96 = objc_msgSend(v93, "containsSuggestedWidgetForApp:", v95);

          if (v96)
          {
            __atxlog_handle_blending();
            v110 = objc_claimAutoreleasedReturnValue();
            v27 = v94;
            if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v94, "appBundleIdentifier");
              v111 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v93, "config");
              v112 = (void *)objc_claimAutoreleasedReturnValue();
              v113 = objc_msgSend(v112, "pageIndex");
              *(_DWORD *)buf = 138412546;
              v216 = (uint64_t)v111;
              v217 = 2048;
              v218 = v113;
              _os_log_impl(&dword_1C9A3B000, v110, OS_LOG_TYPE_DEFAULT, "HSLS [assignNewWidgetSuggestion]: Found existing suggested widget under the same bundleId %@ on page %lu, so skipping this suggestion", buf, 0x16u);

            }
            v22 = v158;
            goto LABEL_125;
          }
          v27 = v94;
        }
        v90 = -[NSObject countByEnumeratingWithState:objects:count:](v88, "countByEnumeratingWithState:objects:count:", &v198, v223, 16);
      }
      while (v90);
    }

    objc_msgSend(v27, "widgetBundleIdentifier");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = ATXBundleIdIsSpecialWidgetExtensionBundleId() | v29;

    if ((v98 & 1) != 0)
    {
      v174 = 0;
      v22 = v158;
LABEL_103:
      v23 = v160;
      goto LABEL_37;
    }
    v22 = v158;
    if (self->_shouldLimitWidgetSuggestionPowerCost)
    {
      __atxlog_handle_blending();
      v88 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
        goto LABEL_125;
      objc_msgSend(v27, "widgetBundleIdentifier");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v216 = (uint64_t)v115;
      v116 = v88;
      v117 = "HSLS [assignNewWidgetSuggestion]: Not considering making new Widget Suggestion for %@ to save power in the "
             "first week after Sky upgrade.";
    }
    else
    {
      if (AppBooleanValue)
      {
        v174 = 1;
        goto LABEL_103;
      }
      v23 = v160;
      if (self->_numWidgetReloadForSuggestionInPastDay < 0x14)
      {
        v174 = 1;
LABEL_37:
        objc_msgSend(v159, "objectForKeyedSubscript:", v23);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v162 = objc_msgSend(v34, "unsignedIntegerValue");

        v170 = -[ATXHomeScreenLayoutSelector2 _shouldConsiderSuggestionForSuggestionsWidget:](self, "_shouldConsiderSuggestionForSuggestionsWidget:", v23);
        v194 = 0u;
        v195 = 0u;
        v196 = 0u;
        v197 = 0u;
        v35 = v156;
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v194, v222, 16);
        if (!v36)
        {

          v167 = 0;
          goto LABEL_121;
        }
        v37 = v36;
        v167 = 0;
        v163 = 0;
        v38 = *(_QWORD *)v195;
        v149 = v35;
        v157 = v22;
        v152 = v27;
        v146 = *(_QWORD *)v195;
LABEL_39:
        v39 = 0;
        v147 = v37;
        while (1)
        {
          if (*(_QWORD *)v195 != v38)
            objc_enumerationMutation(v35);
          v40 = *(void **)(*((_QWORD *)&v194 + 1) + 8 * v39);
          if (v170 && objc_msgSend(*(id *)(*((_QWORD *)&v194 + 1) + 8 * v39), "containsSGWidget"))
          {
            __atxlog_handle_blending();
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v40, "config");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = objc_msgSend(v42, "pageIndex");
              *(_DWORD *)buf = 134218242;
              v216 = v43;
              v217 = 2112;
              v218 = (uint64_t)v23;
              _os_log_impl(&dword_1C9A3B000, v41, OS_LOG_TYPE_DEFAULT, "HSLS [assignNewWidgetSuggestion]: page %lu is not eligible to surface SG widget suggestion as Widget Suggestion because it already contains a pinned or suggested SG widget: %@", buf, 0x16u);

            }
          }
          else
          {
            v150 = v39;
            v192 = 0u;
            v193 = 0u;
            v190 = 0u;
            v191 = 0u;
            v172 = v40;
            objc_msgSend(v40, "stacks");
            v41 = objc_claimAutoreleasedReturnValue();
            v44 = -[NSObject countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v190, v221, 16);
            if (v44)
            {
              v45 = v44;
              v176 = *(_QWORD *)v191;
              v46 = v159;
              v165 = v41;
              while (2)
              {
                v47 = 0;
LABEL_49:
                if (*(_QWORD *)v191 != v176)
                  objc_enumerationMutation(v41);
                v88 = *(NSObject **)(*((_QWORD *)&v190 + 1) + 8 * v47);
                if (!-[ATXHomeScreenLayoutSelector2 _isStack:eligibleToShowSuggestionViaWidgetSuggestion:](self, "_isStack:eligibleToShowSuggestionViaWidgetSuggestion:", v88, v23))
                {
                  __atxlog_handle_blending();
                  v52 = objc_claimAutoreleasedReturnValue();
                  if (!os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
                    goto LABEL_83;
                  -[NSObject config](v88, "config");
                  v53 = objc_claimAutoreleasedReturnValue();
                  -[NSObject identifier](v53, "identifier");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v172, "config");
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  v56 = objc_msgSend(v55, "pageIndex");
                  *(_DWORD *)buf = 138543874;
                  v216 = (uint64_t)v54;
                  v217 = 2048;
                  v218 = v56;
                  v219 = 2112;
                  v220 = v23;
                  v57 = v52;
                  v58 = "HSLS [assignNewWidgetSuggestion]: stack %{public}@ on page %lu is not eligible to surface sugges"
                        "tion as Widget Suggestion: %@";
                  goto LABEL_59;
                }
                if (v174)
                {
                  -[NSObject config](v88, "config");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v48, "identifier");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  v50 = -[ATXHomeScreenLayoutSelector2 _stackHasRemainingReloadBudgetForWidgetSuggestion:homeScreenState:](self, "_stackHasRemainingReloadBudgetForWidgetSuggestion:homeScreenState:", v49, v161);

                  if (!v50)
                  {
                    __atxlog_handle_blending();
                    v52 = objc_claimAutoreleasedReturnValue();
                    if (!os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
                      goto LABEL_83;
                    -[NSObject config](v88, "config");
                    v53 = objc_claimAutoreleasedReturnValue();
                    -[NSObject identifier](v53, "identifier");
                    v54 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v172, "config");
                    v55 = (void *)objc_claimAutoreleasedReturnValue();
                    v68 = objc_msgSend(v55, "pageIndex");
                    *(_DWORD *)buf = 138543874;
                    v216 = (uint64_t)v54;
                    v217 = 2048;
                    v218 = v68;
                    v219 = 2112;
                    v220 = v23;
                    v57 = v52;
                    v58 = "HSLS [assignNewWidgetSuggestion]: stack %{public}@ on page %lu is not eligible to surface Widg"
                          "et Suggestion because it has depleted reload budget: %@";
LABEL_59:
                    _os_log_impl(&dword_1C9A3B000, v57, OS_LOG_TYPE_DEFAULT, v58, buf, 0x20u);

LABEL_82:
                    goto LABEL_83;
                  }
                }
                -[NSObject topOfStackSuggestion](v88, "topOfStackSuggestion");
                v51 = (void *)objc_claimAutoreleasedReturnValue();

                if (v51)
                {
                  -[NSObject topOfStackSuggestion](v88, "topOfStackSuggestion");
                  v52 = objc_claimAutoreleasedReturnValue();
                  if (!v52)
                    goto LABEL_104;
                }
                else
                {
                  -[NSObject suggestedWidgets](v88, "suggestedWidgets");
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  v60 = objc_msgSend(v59, "count");

                  if (!v60
                    || (-[NSObject suggestedWidgets](v88, "suggestedWidgets"),
                        v61 = (void *)objc_claimAutoreleasedReturnValue(),
                        objc_msgSend(v61, "firstObject"),
                        v52 = objc_claimAutoreleasedReturnValue(),
                        v61,
                        !v52))
                  {
LABEL_104:
                    v99 = v88;

                    __atxlog_handle_blending();
                    v62 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
                    {
                      -[NSObject config](v99, "config");
                      v100 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v100, "identifier");
                      v101 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v172, "config");
                      v102 = (void *)objc_claimAutoreleasedReturnValue();
                      v103 = objc_msgSend(v102, "pageIndex");
                      *(_DWORD *)buf = 138543618;
                      v216 = (uint64_t)v101;
                      v217 = 2048;
                      v218 = v103;
                      _os_log_impl(&dword_1C9A3B000, v62, OS_LOG_TYPE_DEFAULT, "HSLS [assignNewWidgetSuggestion]: found target stack %{public}@ on page %lu -- stack does not yet have an existingSuggestion", buf, 0x16u);

                      v41 = v165;
                    }
                    v87 = 1;
                    goto LABEL_107;
                  }
                }
                if (!v170 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                {
LABEL_72:
                  -[NSObject mainSuggestionInLayout](v52, "mainSuggestionInLayout");
                  v69 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v46, "objectForKeyedSubscript:", v69);
                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                  v71 = objc_msgSend(v70, "unsignedIntegerValue");

                  if (v71 >= v162)
                  {
                    if (v163)
                    {
                      -[NSObject mainSuggestionInLayout](v167, "mainSuggestionInLayout");
                      v77 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v46, "objectForKeyedSubscript:", v77);
                      v78 = (void *)objc_claimAutoreleasedReturnValue();
                      v79 = objc_msgSend(v78, "unsignedIntegerValue");

                      if (v71 <= v79)
                      {
                        v23 = v160;
                        v41 = v165;
                        goto LABEL_83;
                      }
                      __atxlog_handle_blending();
                      v80 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
                      {
                        -[NSObject config](v88, "config");
                        v155 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v155, "identifier");
                        v81 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v172, "config");
                        v82 = (void *)objc_claimAutoreleasedReturnValue();
                        v83 = objc_msgSend(v82, "pageIndex");
                        -[NSObject suggestionLayout](v52, "suggestionLayout");
                        v84 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138543874;
                        v216 = (uint64_t)v81;
                        v217 = 2048;
                        v218 = v83;
                        v46 = v159;
                        v219 = 2112;
                        v220 = v84;
                        _os_log_impl(&dword_1C9A3B000, v80, OS_LOG_TYPE_DEFAULT, "HSLS [assignNewWidgetSuggestion]: found a better target stack %{public}@ on page %lu with inferior existingSuggestion %@", buf, 0x20u);

                      }
                      v85 = v88;

                      v53 = v167;
                      v167 = v52;
                      v163 = v85;
                      v23 = v160;
                    }
                    else
                    {
                      v163 = v88;
                      v53 = v167;
                      v167 = v52;
                    }
                  }
                  else
                  {
                    __atxlog_handle_blending();
                    v53 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
                    {
                      -[NSObject config](v88, "config");
                      v72 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v72, "identifier");
                      v73 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v172, "config");
                      v74 = (void *)objc_claimAutoreleasedReturnValue();
                      v75 = objc_msgSend(v74, "pageIndex");
                      -[NSObject suggestionLayout](v52, "suggestionLayout");
                      v76 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543874;
                      v216 = (uint64_t)v73;
                      v217 = 2048;
                      v218 = v75;
                      v46 = v159;
                      v219 = 2112;
                      v220 = v76;
                      _os_log_impl(&dword_1C9A3B000, v53, OS_LOG_TYPE_DEFAULT, "HSLS [assignNewWidgetSuggestion]: can't assign to stack %{public}@ on page %lu -- superior existingSuggestion %@", buf, 0x20u);

                      v23 = v160;
                    }
                  }
                  v41 = v165;
                  goto LABEL_82;
                }
                v62 = v52;
                if (-[NSObject isLayoutComplete](v62, "isLayoutComplete"))
                {
                  __atxlog_handle_blending();
                  v63 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
                  {
                    -[NSObject config](v88, "config");
                    v64 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v64, "identifier");
                    v65 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v172, "config");
                    v66 = (void *)objc_claimAutoreleasedReturnValue();
                    v67 = objc_msgSend(v66, "pageIndex");
                    *(_DWORD *)buf = 138543618;
                    v216 = (uint64_t)v65;
                    v217 = 2048;
                    v218 = v67;
                    _os_log_impl(&dword_1C9A3B000, v63, OS_LOG_TYPE_DEFAULT, "HSLS [assignNewWidgetSuggestion]: stack %{public}@ on page %lu is not eligible to surface suggestion because it already contains an existing suggested SG widget with a complete layout.", buf, 0x16u);

                    v41 = v165;
                  }

                  v52 = v62;
LABEL_83:

                  if (v45 == ++v47)
                  {
                    v86 = -[NSObject countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v190, v221, 16);
                    v45 = v86;
                    if (!v86)
                    {
                      v27 = v152;
                      v35 = v149;
                      v38 = v146;
                      v37 = v147;
                      goto LABEL_89;
                    }
                    continue;
                  }
                  goto LABEL_49;
                }
                break;
              }
              if (!-[NSObject canAddSuggestion:](v62, "canAddSuggestion:", v23))
              {

                goto LABEL_72;
              }
              v118 = v88;

              __atxlog_handle_blending();
              v119 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
              {
                -[NSObject config](v118, "config");
                v120 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v120, "identifier");
                v121 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v172, "config");
                v122 = (void *)objc_claimAutoreleasedReturnValue();
                v123 = objc_msgSend(v122, "pageIndex");
                *(_DWORD *)buf = 138543618;
                v216 = (uint64_t)v121;
                v217 = 2048;
                v218 = v123;
                _os_log_impl(&dword_1C9A3B000, v119, OS_LOG_TYPE_DEFAULT, "HSLS [assignNewWidgetSuggestion]: found target stack %{public}@ on page %lu -- existingSuggestion is SG widget with empty slot", buf, 0x16u);

                v41 = v165;
              }

              v87 = 0;
              v167 = v62;
LABEL_107:
              v27 = v152;

LABEL_108:
              if (v88)
              {
                __atxlog_handle_blending();
                v104 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
                {
                  -[NSObject config](v88, "config");
                  v105 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v105, "identifier");
                  v106 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSObject page](v88, "page");
                  v107 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v107, "config");
                  v108 = (void *)objc_claimAutoreleasedReturnValue();
                  v109 = objc_msgSend(v108, "pageIndex");
                  *(_DWORD *)buf = 138543874;
                  v216 = (uint64_t)v106;
                  v217 = 2048;
                  v218 = v109;
                  v219 = 2112;
                  v220 = v23;
                  _os_log_impl(&dword_1C9A3B000, v104, OS_LOG_TYPE_DEFAULT, "HSLS [assignNewWidgetSuggestion]: ASSIGNING suggestion to target stack %{public}@ on page %lu as new Widget Suggestion: %@", buf, 0x20u);

                }
                -[ATXHomeScreenLayoutSelector2 _assignSuggestion:toTopOfStack:](self, "_assignSuggestion:toTopOfStack:", v23, v88);
                if (v87)
                  ++self->_numSuggestedWidgetInPastDay;
                if (v174)
                  ++self->_numWidgetReloadForSuggestionInPastDay;
                v22 = v157;
                goto LABEL_124;
              }
              v22 = v157;
LABEL_121:
              __atxlog_handle_blending();
              v114 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v216 = (uint64_t)v23;
                _os_log_impl(&dword_1C9A3B000, v114, OS_LOG_TYPE_DEFAULT, "HSLS [assignNewWidgetSuggestion]: Unable to find suitable target stack for suggestion %@", buf, 0xCu);
              }

              v88 = 0;
LABEL_124:

LABEL_125:
              if (++v22 == v153)
              {
                v124 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v202, v224, 16);
                v153 = v124;
                if (!v124)
                  goto LABEL_147;
                goto LABEL_13;
              }
              goto LABEL_14;
            }
            v27 = v152;
LABEL_89:
            v39 = v150;
          }

          if (++v39 == v37)
          {
            v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v194, v222, 16);
            if (!v37)
            {
              v87 = 1;
              v88 = v163;
              goto LABEL_108;
            }
            goto LABEL_39;
          }
        }
      }
      __atxlog_handle_blending();
      v88 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
        goto LABEL_125;
      objc_msgSend(v27, "widgetBundleIdentifier");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v216 = (uint64_t)v115;
      v116 = v88;
      v117 = "HSLS [assignNewWidgetSuggestion]: Not considering making new Widget Suggestion for %@, because we have reac"
             "hed our reload budget.";
    }
    _os_log_impl(&dword_1C9A3B000, v116, OS_LOG_TYPE_DEFAULT, v117, buf, 0xCu);

    goto LABEL_125;
  }
  __atxlog_handle_blending();
  v127 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v127, OS_LOG_TYPE_DEFAULT, "HSLS [assignNewWidgetSuggestion]: Not considering making new Widget Suggestion, because we have reached our budget.", buf, 2u);
  }

LABEL_147:
  -[ATXHomeScreenLayoutSelector2 _suggestionsEligibleForSuggestedSGWidgetOnPages:amongSuggestions:](self, "_suggestionsEligibleForSuggestedSGWidgetOnPages:amongSuggestions:", v156, v144);
  v126 = objc_claimAutoreleasedReturnValue();
  v128 = (void *)objc_opt_new();
  v186 = 0u;
  v187 = 0u;
  v188 = 0u;
  v189 = 0u;
  v164 = v156;
  v168 = objc_msgSend(v164, "countByEnumeratingWithState:objects:count:", &v186, v214, 16);
  if (v168)
  {
    v166 = *(_QWORD *)v187;
    do
    {
      v129 = 0;
      do
      {
        if (*(_QWORD *)v187 != v166)
          objc_enumerationMutation(v164);
        v169 = v129;
        v130 = *(void **)(*((_QWORD *)&v186 + 1) + 8 * v129);
        v182 = 0u;
        v183 = 0u;
        v184 = 0u;
        v185 = 0u;
        objc_msgSend(v130, "stacks");
        v171 = (id)objc_claimAutoreleasedReturnValue();
        v175 = objc_msgSend(v171, "countByEnumeratingWithState:objects:count:", &v182, v213, 16);
        if (v175)
        {
          v173 = *(_QWORD *)v183;
          do
          {
            v131 = 0;
            do
            {
              if (*(_QWORD *)v183 != v173)
                objc_enumerationMutation(v171);
              v177 = v131;
              v132 = *(void **)(*((_QWORD *)&v182 + 1) + 8 * v131);
              v178 = 0u;
              v179 = 0u;
              v180 = 0u;
              v181 = 0u;
              objc_msgSend(v132, "suggestionsWidgetSuggestionsByWidgetUniqueId");
              v133 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v133, "allValues");
              v134 = (void *)objc_claimAutoreleasedReturnValue();

              v135 = objc_msgSend(v134, "countByEnumeratingWithState:objects:count:", &v178, v212, 16);
              if (v135)
              {
                v136 = v135;
                v137 = *(_QWORD *)v179;
                do
                {
                  for (k = 0; k != v136; ++k)
                  {
                    if (*(_QWORD *)v179 != v137)
                      objc_enumerationMutation(v134);
                    v139 = *(void **)(*((_QWORD *)&v178 + 1) + 8 * k);
                    objc_msgSend(v139, "widget");
                    v140 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v140, "isSuggestedWidget"))
                    {
                      v141 = objc_msgSend(v139, "isLayoutComplete");

                      if ((v141 & 1) == 0)
                        -[ATXHomeScreenLayoutSelector2 _fillSuggestedSGWidgetIfLayoutNotComplete:withSuggestions:updatingUsedSuggestionIndexSet:](self, "_fillSuggestedSGWidgetIfLayoutNotComplete:withSuggestions:updatingUsedSuggestionIndexSet:", v139, v126, v128);
                    }
                    else
                    {

                    }
                  }
                  v136 = objc_msgSend(v134, "countByEnumeratingWithState:objects:count:", &v178, v212, 16);
                }
                while (v136);
              }

              v131 = v177 + 1;
            }
            while (v177 + 1 != v175);
            v175 = objc_msgSend(v171, "countByEnumeratingWithState:objects:count:", &v182, v213, 16);
          }
          while (v175);
        }

        v129 = v169 + 1;
      }
      while (v169 + 1 != v168);
      v168 = objc_msgSend(v164, "countByEnumeratingWithState:objects:count:", &v186, v214, 16);
    }
    while (v168);
  }

  v11 = v159;
  v125 = v142;
  v12 = v143;
LABEL_173:

}

uint64_t __126__ATXHomeScreenLayoutSelector2__assignNewSuggestedWidgetsForPages_rankedSuggestions_suggestionToRankingIndex_homeScreenState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "_hasEligibleWidgetSuggestionsStacksForSuggestion:onPages:ignoreDuplicatesInSGWidget:ignoreDuplicatesInPanels:", v3, *(_QWORD *)(a1 + 40), 0, 1);
  if ((_DWORD)v4)
  {
    __atxlog_handle_blending();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "HSLS [assignNewWidgetSuggestion]: Found suggestion eligible for making new Widget Suggestion %@", (uint8_t *)&v7, 0xCu);
    }

  }
  return v4;
}

- (BOOL)_stackHasRemainingReloadBudgetForWidgetSuggestion:(id)a3 homeScreenState:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  dispatch_semaphore_t v26;
  CHSProactiveService *chronoService;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  ATXHomeScreenLayoutSelector2 *v39;
  id v40;
  id v41;
  id obj;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD v46[5];
  NSObject *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
    goto LABEL_31;
  if (CFPreferencesGetAppBooleanValue(CFSTR("widgetKitDeveloperModeEnabled"), CFSTR("com.apple.duetexpertd"), 0))
  {
    v8 = 1;
    goto LABEL_34;
  }
  -[ATXHomeScreenLayoutSelector2 widgetSuggestionReloadBudgetByStackId](self, "widgetSuggestionReloadBudgetByStackId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    goto LABEL_5;
  if (-[ATXHomeScreenLayoutSelector2 hasAskedChronoAboutReloadBudget](self, "hasAskedChronoAboutReloadBudget"))
    goto LABEL_31;
  v39 = self;
  v41 = v6;
  v12 = (void *)objc_opt_new();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v40 = v7;
  objc_msgSend(v7, "sortedPagesByUserLastVisit");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
  if (!v44)
    goto LABEL_26;
  v43 = *(_QWORD *)v53;
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v53 != v43)
        objc_enumerationMutation(obj);
      v45 = v13;
      v14 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v13);
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      objc_msgSend(v14, "stacks");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v49;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v49 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
            objc_msgSend(v20, "config");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v21, "allowsNewWidget"))
            {
              objc_msgSend(v20, "config");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "widgets");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v23, "count");

              if (v24 < 2)
                continue;
              objc_msgSend(v20, "config");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "identifier");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "addObject:", v25);

            }
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
        }
        while (v17);
      }

      v13 = v45 + 1;
    }
    while (v45 + 1 != v44);
    v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
  }
  while (v44);
LABEL_26:

  v26 = dispatch_semaphore_create(0);
  self = v39;
  chronoService = v39->_chronoService;
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __98__ATXHomeScreenLayoutSelector2__stackHasRemainingReloadBudgetForWidgetSuggestion_homeScreenState___block_invoke;
  v46[3] = &unk_1E82DE030;
  v46[4] = v39;
  v28 = v26;
  v47 = v28;
  -[CHSProactiveService suggestionBudgetsForStackIdentifiers:completion:](chronoService, "suggestionBudgetsForStackIdentifiers:completion:", v12, v46);
  if (objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v28, 2.0) == 1)
  {
    __atxlog_handle_blending();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[ATXHomeScreenLayoutSelector2 _stackHasRemainingReloadBudgetForWidgetSuggestion:homeScreenState:].cold.1(v29, v30, v31, v32, v33, v34, v35, v36);

  }
  -[ATXHomeScreenLayoutSelector2 setHasAskedChronoAboutReloadBudget:](v39, "setHasAskedChronoAboutReloadBudget:", 1);
  -[ATXHomeScreenLayoutSelector2 widgetSuggestionReloadBudgetByStackId](v39, "widgetSuggestionReloadBudgetByStackId");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v40;
  v6 = v41;
  if (!v37)
  {
LABEL_31:
    v8 = 0;
    goto LABEL_34;
  }
LABEL_5:
  -[ATXHomeScreenLayoutSelector2 widgetSuggestionReloadBudgetByStackId](self, "widgetSuggestionReloadBudgetByStackId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    v8 = objc_msgSend(v11, "integerValue") > 0;
  else
    v8 = 1;

LABEL_34:
  return v8;
}

void __98__ATXHomeScreenLayoutSelector2__stackHasRemainingReloadBudgetForWidgetSuggestion_homeScreenState___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    __atxlog_handle_blending();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __98__ATXHomeScreenLayoutSelector2__stackHasRemainingReloadBudgetForWidgetSuggestion_homeScreenState___block_invoke_cold_1();

  }
  __atxlog_handle_blending();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = v5;
  }

  objc_msgSend(*(id *)(a1 + 32), "setWidgetSuggestionReloadBudgetByStackId:", v5);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (void)_updateSuggestionsWidgetLayoutIfNecessaryWithRankedShortcutSuggestions:(id)a3 suggestionToRankingIndex:(id)a4 homeScreenState:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  unint64_t v37;
  id v38;
  void *v39;
  unint64_t v40;
  NSObject *v41;
  void *v42;
  void *v43;
  _ATXSuggestionsWidgetSuggestion *v44;
  void *v45;
  _ATXSuggestionsWidgetSuggestion *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t j;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id obj;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  uint64_t v74;
  id v75;
  uint64_t v76;
  ATXHomeScreenLayoutSelector2 *v77;
  uint64_t v78;
  void *v79;
  id v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _QWORD v101[4];
  id v102;
  _BYTE v103[128];
  uint8_t v104[128];
  uint8_t buf[4];
  void *v106;
  __int16 v107;
  void *v108;
  _BYTE v109[128];
  _BYTE v110[128];
  _BYTE v111[128];
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  v80 = a4;
  v8 = a5;
  v101[0] = MEMORY[0x1E0C809B0];
  v101[1] = 3221225472;
  v101[2] = __144__ATXHomeScreenLayoutSelector2__updateSuggestionsWidgetLayoutIfNecessaryWithRankedShortcutSuggestions_suggestionToRankingIndex_homeScreenState___block_invoke;
  v101[3] = &unk_1E82DE058;
  v9 = v8;
  v102 = v9;
  objc_msgSend(a3, "_pas_filteredArrayWithTest:", v101);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  v62 = v9;
  objc_msgSend(v9, "sortedPagesByUserLastVisit");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v111, 16);
  if (v65)
  {
    v64 = *(_QWORD *)v98;
    v77 = self;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v98 != v64)
          objc_enumerationMutation(obj);
        v66 = v10;
        v11 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * v10);
        -[ATXHomeScreenLayoutSelector2 _suggestionsWidgetSuggestionsByPriorityOnPage:](self, "_suggestionsWidgetSuggestionsByPriorityOnPage:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v93 = 0u;
        v94 = 0u;
        v95 = 0u;
        v96 = 0u;
        v69 = v12;
        v70 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v93, v110, 16);
        if (v70)
        {
          v13 = *(_QWORD *)v94;
          v73 = v11;
          v68 = *(_QWORD *)v94;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v94 != v13)
                objc_enumerationMutation(v69);
              v71 = v14;
              v15 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * v14);
              objc_msgSend(v15, "widget");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "isSuggestedWidget");

              if ((v17 & 1) == 0)
              {
                objc_msgSend(v15, "stack");
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                v89 = 0u;
                v90 = 0u;
                v91 = 0u;
                v92 = 0u;
                v18 = v67;
                v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v89, v109, 16);
                if (v19)
                {
                  v20 = v19;
                  v21 = *(_QWORD *)v90;
                  v74 = *(_QWORD *)v90;
                  v75 = v18;
                  while (2)
                  {
                    v22 = 0;
                    v76 = v20;
                    do
                    {
                      if (*(_QWORD *)v90 != v21)
                        objc_enumerationMutation(v18);
                      v23 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * v22);
                      if (-[ATXHomeScreenLayoutSelector2 _shouldConsiderSuggestionForSuggestionsWidget:](self, "_shouldConsiderSuggestionForSuggestionsWidget:", v23)&& (objc_msgSend(v11, "isShowingDuplicatedContentForSuggestion:considerUnderStackContents:dedupeAppSuggestionsByWidgets:ignoreDuplicatesInSGWidget:ignoreDuplicatesInPanels:", v23, 1, 1, 0, 1) & 1) == 0)
                      {
                        v79 = v23;
                        if ((objc_msgSend(v15, "isLayoutComplete") & 1) != 0)
                        {
                          v78 = v22;
                          v24 = v15;
                          objc_msgSend(v15, "suggestionLayout");
                          v25 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v25, "allSuggestionsInLayout");
                          v26 = (void *)objc_claimAutoreleasedReturnValue();

                          objc_msgSend(v26, "firstObject");
                          v27 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v80, "objectForKeyedSubscript:", v27);
                          v28 = (void *)objc_claimAutoreleasedReturnValue();
                          v29 = objc_msgSend(v28, "unsignedIntegerValue");

                          v87 = 0u;
                          v88 = 0u;
                          v85 = 0u;
                          v86 = 0u;
                          v30 = v26;
                          v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v85, v104, 16);
                          if (v31)
                          {
                            v32 = v31;
                            v33 = *(_QWORD *)v86;
                            do
                            {
                              for (i = 0; i != v32; ++i)
                              {
                                if (*(_QWORD *)v86 != v33)
                                  objc_enumerationMutation(v30);
                                v35 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
                                objc_msgSend(v80, "objectForKeyedSubscript:", v35);
                                v36 = (void *)objc_claimAutoreleasedReturnValue();
                                v37 = objc_msgSend(v36, "unsignedIntegerValue");

                                if (v29 < v37)
                                {
                                  v38 = v35;

                                  v29 = v37;
                                  v27 = v38;
                                }
                              }
                              v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v85, v104, 16);
                            }
                            while (v32);
                          }

                          objc_msgSend(v80, "objectForKeyedSubscript:", v79);
                          v39 = (void *)objc_claimAutoreleasedReturnValue();
                          v40 = objc_msgSend(v39, "unsignedIntegerValue");

                          self = v77;
                          if (v29 >= v40)
                          {
                            __atxlog_handle_blending();
                            v41 = objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                            {
                              objc_msgSend(v24, "widget");
                              v42 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v42, "widgetUniqueId");
                              v43 = (void *)objc_claimAutoreleasedReturnValue();
                              *(_DWORD *)buf = 138543618;
                              v106 = v43;
                              v107 = 2112;
                              v108 = v79;
                              _os_log_impl(&dword_1C9A3B000, v41, OS_LOG_TYPE_DEFAULT, "HSLS [updateSGLayoutWithUnusedConvertableShortcut]: updating SG %{public}@ layout, because we have a better unused convertable shortcut suggestion %@", buf, 0x16u);

                            }
                            v44 = [_ATXSuggestionsWidgetSuggestion alloc];
                            objc_msgSend(v24, "widget");
                            v45 = (void *)objc_claimAutoreleasedReturnValue();
                            v46 = -[_ATXSuggestionsWidgetSuggestion initWithSuggestionsWidget:containingStack:suggestionDeduplicator:hyperParameters:](v44, "initWithSuggestionsWidget:containingStack:suggestionDeduplicator:hyperParameters:", v45, v72, v77->_suggestionDeduplicator, v77->_hyperParameters);

                            v83 = 0u;
                            v84 = 0u;
                            v81 = 0u;
                            v82 = 0u;
                            v47 = v30;
                            v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v81, v103, 16);
                            if (v48)
                            {
                              v49 = v48;
                              v50 = *(_QWORD *)v82;
                              do
                              {
                                for (j = 0; j != v49; ++j)
                                {
                                  if (*(_QWORD *)v82 != v50)
                                    objc_enumerationMutation(v47);
                                  v52 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * j);
                                  objc_msgSend(v24, "mainSuggestionInLayout");
                                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                                  if (v52 == v27)
                                    v54 = v79;
                                  else
                                    v54 = v52;
                                  -[_ATXCompositeLayoutWidgetSuggestionBase addSuggestion:asMainSuggestion:](v46, "addSuggestion:asMainSuggestion:", v54, v53 == 0);

                                }
                                v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v81, v103, 16);
                              }
                              while (v49);
                            }

                            if (-[_ATXCompositeLayoutWidgetSuggestionBase isLayoutComplete](v46, "isLayoutComplete"))
                            {
                              objc_msgSend(v72, "suggestionsWidgetSuggestionsByWidgetUniqueId");
                              v59 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v24, "widget");
                              v60 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v60, "widgetUniqueId");
                              v61 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v59, "setObject:forKeyedSubscript:", v46, v61);

                              self = v77;
                              -[ATXHomeScreenLayoutSelector2 _rotateStackToUpdatedSGSuggestionIfNecessary:suggestionToRankingIndex:](v77, "_rotateStackToUpdatedSGSuggestionIfNecessary:suggestionToRankingIndex:", v46, v80);

                              v11 = v73;
                              v18 = v75;
                              goto LABEL_53;
                            }

                            self = v77;
                          }

                          v18 = v75;
                          v20 = v76;
                          v15 = v24;
                          v11 = v73;
                          v21 = v74;
                          v22 = v78;
                        }
                        else
                        {
                          __atxlog_handle_blending();
                          v55 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
                          {
                            objc_msgSend(v15, "widget");
                            v56 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v56, "widgetUniqueId");
                            v57 = (void *)objc_claimAutoreleasedReturnValue();
                            *(_DWORD *)buf = 138543618;
                            v106 = v57;
                            v107 = 2112;
                            v108 = v79;
                            _os_log_impl(&dword_1C9A3B000, v55, OS_LOG_TYPE_DEFAULT, "HSLS [updateSGLayoutWithUnusedConvertableShortcut]: ASSIGNING suggestion to unfilled SG %{public}@: %@", buf, 0x16u);

                          }
                          objc_msgSend(v15, "mainSuggestionInLayout");
                          v58 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v15, "addSuggestion:asMainSuggestion:", v79, v58 == 0);

                          if (objc_msgSend(v15, "isLayoutComplete"))
                          {
                            -[ATXHomeScreenLayoutSelector2 _rotateStackToUpdatedSGSuggestionIfNecessary:suggestionToRankingIndex:](self, "_rotateStackToUpdatedSGSuggestionIfNecessary:suggestionToRankingIndex:", v15, v80);
                            goto LABEL_53;
                          }
                        }
                      }
                      ++v22;
                    }
                    while (v22 != v20);
                    v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v89, v109, 16);
                    if (v20)
                      continue;
                    break;
                  }
                }
LABEL_53:

                v13 = v68;
              }
              v14 = v71 + 1;
            }
            while (v71 + 1 != v70);
            v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v93, v110, 16);
          }
          while (v70);
        }

        v10 = v66 + 1;
      }
      while (v66 + 1 != v65);
      v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v111, 16);
    }
    while (v65);
  }

}

uint64_t __144__ATXHomeScreenLayoutSelector2__updateSuggestionsWidgetLayoutIfNecessaryWithRankedShortcutSuggestions_suggestionToRankingIndex_homeScreenState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a2;
  objc_msgSend(v3, "executableSpecification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "executableType");

  if (v5 == 2)
  {
    objc_msgSend(v3, "atxActionExecutableObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "intent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v3, "executableSpecification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "executableType");

  if (v9 == 10)
  {
    objc_msgSend(v3, "linkActionExecutableObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cachedAppIntent");
    v11 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v11;
  }
  if (v7)
    v12 = objc_msgSend(*(id *)(a1 + 32), "containsWidgetForIntent:", v7) ^ 1;
  else
    v12 = 1;

  return v12;
}

- (void)_rotateStackToUpdatedSGSuggestionIfNecessary:(id)a3 suggestionToRankingIndex:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  unint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isLayoutComplete"))
  {
    objc_msgSend(v5, "stack");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "config");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "allowsSmartRotate");

    if (v9)
    {
      v35 = v7;
      v36 = v5;
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      objc_msgSend(v5, "suggestionLayout");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "allSuggestionsInLayout");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
      if (v12)
      {
        v13 = v12;
        v14 = 0;
        v15 = *(_QWORD *)v38;
        v16 = -1;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v38 != v15)
              objc_enumerationMutation(v11);
            v18 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
            objc_msgSend(v6, "objectForKeyedSubscript:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "unsignedIntegerValue");

            if (v20 < v16)
            {
              v21 = v18;

              v16 = v20;
              v14 = v21;
            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
        }
        while (v13);
      }
      else
      {
        v14 = 0;
        v16 = -1;
      }

      objc_msgSend(v14, "scoreSpecification");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "suggestedConfidenceCategory");

      v7 = v35;
      v5 = v36;
      if (v23 >= 3)
      {
        objc_msgSend(v35, "topOfStackSuggestion");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          objc_msgSend(v35, "topOfStackSuggestion");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "mainSuggestionInLayout");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "objectForKeyedSubscript:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "unsignedIntegerValue");

        }
        else
        {
          v28 = -1;
        }
        if (v16 < v28)
        {
          __atxlog_handle_default();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v35, "config");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "identifier");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "widget");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "widgetUniqueId");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "topOfStackSuggestion");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v42 = v31;
            v43 = 2114;
            v44 = v33;
            v45 = 2112;
            v46 = v34;
            _os_log_impl(&dword_1C9A3B000, v29, OS_LOG_TYPE_DEFAULT, "HSLS [updateSGLayoutWithUnusedConvertableShortcut]: rotating stack %{public}@ to SG widget %{public}@, because old topOfStackSuggestion is inferior: %@", buf, 0x20u);

          }
          objc_msgSend(v35, "setTopOfStackSuggestion:", v36);
        }
      }

    }
  }

}

- (id)_suggestionsWidgetSuggestionsByPriorityOnPage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v29 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v26 = v3;
  objc_msgSend(v3, "stacks");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v36;
    v27 = *(_QWORD *)v36;
    do
    {
      v9 = 0;
      v28 = v7;
      do
      {
        if (*(_QWORD *)v36 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v9);
        objc_msgSend(v10, "topOfStackSuggestion");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v10, "config");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isPinnedSuggestionsWidget");

          objc_msgSend(v10, "topOfStackSuggestion");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            v16 = v4;
          else
            v16 = v29;
          objc_msgSend(v16, "addObject:", v15);
        }
        else
        {
          v33 = 0u;
          v34 = 0u;
          v31 = 0u;
          v32 = 0u;
          objc_msgSend(v10, "suggestionsWidgetSuggestionsByWidgetUniqueId");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "allValues");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v18 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
          if (v18)
          {
            v19 = v18;
            v20 = v4;
            v21 = *(_QWORD *)v32;
            do
            {
              for (i = 0; i != v19; ++i)
              {
                if (*(_QWORD *)v32 != v21)
                  objc_enumerationMutation(v15);
                v23 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
                objc_msgSend(v10, "topOfStackSuggestion");
                v24 = (void *)objc_claimAutoreleasedReturnValue();

                if (v23 != v24)
                  objc_msgSend(v5, "addObject:", v23);
              }
              v19 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
            }
            while (v19);
            v4 = v20;
            v8 = v27;
            v7 = v28;
          }
        }

        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "addObjectsFromArray:", v29);
  objc_msgSend(v4, "addObjectsFromArray:", v5);

  return v4;
}

- (id)_filterRankedSuggestions:(id)a3 homeScreenState:(id)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  const char *v23;
  void *v24;
  _BOOL4 v25;
  NSObject *v26;
  ATXWidgetSuggestionDismissManager *widgetDismissManager;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t k;
  void *v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  id obj;
  uint64_t v65;
  _QWORD v66[8];
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  uint8_t buf[4];
  uint64_t v96;
  __int16 v97;
  uint64_t v98;
  __int16 v99;
  uint64_t v100;
  __int16 v101;
  uint64_t v102;
  __int16 v103;
  uint64_t v104;
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v62 = a4;
  v61 = (void *)objc_opt_new();
  v63 = (void *)objc_opt_new();
  v7 = 5;
  do
  {
    --v7;
    v8 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setObject:forKeyedSubscript:", v8, v9);

    v10 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setObject:forKeyedSubscript:", v10, v11);

  }
  while (v7 > 1);
  -[ATXEngagementRecordManager engagedExecutablesOfType:queryOptions:](self->_engagementRecordManager, "engagedExecutablesOfType:queryOptions:", 4, 0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  obj = v6;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v107, 16);
  if (!v12)
    goto LABEL_39;
  v65 = *(_QWORD *)v92;
  do
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v92 != v65)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * i);
      v15 = (void *)MEMORY[0x1CAA48B6C]();
      if ((-[ATXBlendingLayerHyperParameters uiSupportsSuggestion:consumerSubType:](self->_hyperParameters, "uiSupportsSuggestion:consumerSubType:", v14, 34) & 1) != 0|| (-[ATXBlendingLayerHyperParameters uiSupportsSuggestion:consumerSubType:](self->_hyperParameters, "uiSupportsSuggestion:consumerSubType:", v14, 37) & 1) != 0|| -[ATXBlendingLayerHyperParameters uiSupportsSuggestion:consumerSubType:](self->_hyperParameters, "uiSupportsSuggestion:consumerSubType:", v14, 36))
      {
        objc_msgSend(v14, "executableSpecification", v60);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "executableType") == 2;

        if (v17)
        {
          objc_msgSend(v14, "atxActionExecutableObject");
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (!v18)
          {
            __atxlog_handle_blending();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v96 = (uint64_t)v14;
              _os_log_error_impl(&dword_1C9A3B000, v19, OS_LOG_TYPE_ERROR, "HSLS [preprocess]: Removing action suggestion, couldn't get ATXAction: %@", buf, 0xCu);
            }
            goto LABEL_36;
          }
          -[NSObject intent](v18, "intent");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            if (objc_msgSend(v62, "containsWidgetForIntent:", v20))
            {
              __atxlog_handle_blending();
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v96 = (uint64_t)v14;
                v22 = v21;
                v23 = "HSLS [preprocess]: Removing action suggestion due to intent duplication with widget on screen \n"
                      "%@";
                goto LABEL_27;
              }
              goto LABEL_28;
            }
            if (-[ATXWidgetSuggestionDismissManager shouldBlockSuggestionWithIntent:](self->_widgetDismissManager, "shouldBlockSuggestionWithIntent:", v20))
            {
              __atxlog_handle_blending();
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v96 = (uint64_t)v14;
                v22 = v21;
                v23 = "HSLS [preprocess]: Removing action suggestion due to previous suggested widget dismiss with same u"
                      "nderlying intent \n"
                      "%@";
LABEL_27:
                _os_log_impl(&dword_1C9A3B000, v22, OS_LOG_TYPE_DEFAULT, v23, buf, 0xCu);
              }
LABEL_28:

LABEL_36:
              goto LABEL_37;
            }
          }

LABEL_30:
        }
        else
        {
          objc_msgSend(v14, "executableSpecification");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "executableType") == 3;

          if (v25)
          {
            objc_msgSend(MEMORY[0x1E0D81150], "infoSuggestionFromProactiveSuggestion:", v14);
            v26 = objc_claimAutoreleasedReturnValue();
            v19 = v26;
            if (!v26)
              goto LABEL_20;
            widgetDismissManager = self->_widgetDismissManager;
            -[NSObject widgetBundleIdentifier](v26, "widgetBundleIdentifier");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject widgetKind](v19, "widgetKind");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject intent](v19, "intent");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(widgetDismissManager) = -[ATXWidgetSuggestionDismissManager shouldBlockWidgetSuggestionBecauseOfPreviousDismiss:kind:intent:](widgetDismissManager, "shouldBlockWidgetSuggestionBecauseOfPreviousDismiss:kind:intent:", v28, v29, v30);

            if (!(_DWORD)widgetDismissManager)
            {
              if (!objc_msgSend(v60, "count")
                || (-[ATXEngagementRecordManager hasEngagedWithSuggestion:engagedExecutables:](self->_engagementRecordManager, "hasEngagedWithSuggestion:engagedExecutables:", v14, v60) & 1) != 0)
              {
                goto LABEL_30;
              }
              v35 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v14, "scoreSpecification");
              v31 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "numberWithInteger:", -[NSObject suggestedConfidenceCategory](v31, "suggestedConfidenceCategory"));
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "objectForKeyedSubscript:", v36);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "addObject:", v14);

            }
            else
            {
LABEL_20:
              __atxlog_handle_blending();
              v31 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v96 = (uint64_t)v14;
                _os_log_impl(&dword_1C9A3B000, v31, OS_LOG_TYPE_DEFAULT, "HSLS [preprocess]: Removing widget suggestion due to previous dismiss \n%@", buf, 0xCu);
              }
            }

            goto LABEL_36;
          }
        }
        v32 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v14, "scoreSpecification");
        v19 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "numberWithInteger:", -[NSObject suggestedConfidenceCategory](v19, "suggestedConfidenceCategory"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "objectForKeyedSubscript:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "addObject:", v14);

        goto LABEL_36;
      }
LABEL_37:
      objc_autoreleasePoolPop(v15);
    }
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v107, 16);
  }
  while (v12);
LABEL_39:

  v38 = (void *)objc_opt_new();
  v39 = 4;
  do
  {
    v40 = (void *)MEMORY[0x1CAA48B6C]();
    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v39);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "objectForKeyedSubscript:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v87, v106, 16);
    if (v43)
    {
      v44 = *(_QWORD *)v88;
      do
      {
        for (j = 0; j != v43; ++j)
        {
          if (*(_QWORD *)v88 != v44)
            objc_enumerationMutation(v42);
          objc_msgSend(v38, "addObject:", *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * j), v60);
        }
        v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v87, v106, 16);
      }
      while (v43);
    }

    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v39);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "objectForKeyedSubscript:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v83, v105, 16);
    if (v48)
    {
      v49 = *(_QWORD *)v84;
      do
      {
        for (k = 0; k != v48; ++k)
        {
          if (*(_QWORD *)v84 != v49)
            objc_enumerationMutation(v47);
          objc_msgSend(v38, "addObject:", *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * k), v60);
        }
        v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v83, v105, 16);
      }
      while (v48);
    }

    objc_autoreleasePoolPop(v40);
  }
  while (v39-- > 1);
  -[_ATXHomeScreenTimelineRelevanceFilter scheduleBlendingRefreshAtNextTimelineRelevanceChangeRelatedToSuggestions:](self->_timelineRelevanceFilter, "scheduleBlendingRefreshAtNextTimelineRelevanceChangeRelatedToSuggestions:", v38);
  -[_ATXHomeScreenTimelineRelevanceFilter removeSuggestionsByTimelineRelevanceIfNecessary:homeScreenState:](self->_timelineRelevanceFilter, "removeSuggestionsByTimelineRelevanceIfNecessary:homeScreenState:", v38, v62);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  v79 = 0;
  v80 = &v79;
  v81 = 0x2020000000;
  v82 = 0;
  v75 = 0;
  v76 = &v75;
  v77 = 0x2020000000;
  v78 = 0;
  v71 = 0;
  v72 = &v71;
  v73 = 0x2020000000;
  v74 = 0;
  v67 = 0;
  v68 = &v67;
  v69 = 0x2020000000;
  v70 = 0;
  v66[0] = MEMORY[0x1E0C809B0];
  v66[1] = 3221225472;
  v66[2] = __73__ATXHomeScreenLayoutSelector2__filterRankedSuggestions_homeScreenState___block_invoke;
  v66[3] = &unk_1E82DE080;
  v66[4] = &v79;
  v66[5] = &v71;
  v66[6] = &v75;
  v66[7] = &v67;
  objc_msgSend(v52, "enumerateObjectsUsingBlock:", v66);
  __atxlog_handle_blending();
  v53 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    v54 = objc_msgSend(v52, "count");
    v55 = v80[3];
    v56 = v72[3];
    v57 = v76[3];
    v58 = v68[3];
    *(_DWORD *)buf = 134219008;
    v96 = v54;
    v97 = 2048;
    v98 = v55;
    v99 = 2048;
    v100 = v56;
    v101 = 2048;
    v102 = v57;
    v103 = 2048;
    v104 = v58;
    _os_log_impl(&dword_1C9A3B000, v53, OS_LOG_TYPE_DEFAULT, "HSLS [preprocess]: filterRankedSuggestions result count = %lu (%ld widget, %ld action, %ld apps, %ld Link actions)", buf, 0x34u);
  }

  _Block_object_dispose(&v67, 8);
  _Block_object_dispose(&v71, 8);
  _Block_object_dispose(&v75, 8);
  _Block_object_dispose(&v79, 8);

  return v52;
}

void __73__ATXHomeScreenLayoutSelector2__filterRankedSuggestions_homeScreenState___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  int v30;
  uint64_t v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "executableSpecification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "executableType");

  if (v7 == 3)
  {
    if (*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) < 3uLL
      || (objc_msgSend(v5, "scoreSpecification"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "suggestedConfidenceCategory"),
          v8,
          v9 >= 3))
    {
      __atxlog_handle_blending();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v30 = 134218242;
        v31 = a3;
        v32 = 2112;
        v33 = v5;
        _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_DEFAULT, "HSLS [preprocess]: Widget Suggestion at index %lu:\n%@", (uint8_t *)&v30, 0x16u);
      }

    }
    v11 = a1[4];
LABEL_29:
    ++*(_QWORD *)(*(_QWORD *)(v11 + 8) + 24);
    goto LABEL_30;
  }
  objc_msgSend(v5, "executableSpecification");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "executableType");

  if (v13 == 2)
  {
    if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) < 3uLL
      || (objc_msgSend(v5, "scoreSpecification"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend(v14, "suggestedConfidenceCategory"),
          v14,
          v15 >= 3))
    {
      __atxlog_handle_blending();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v30 = 134218242;
        v31 = a3;
        v32 = 2112;
        v33 = v5;
        _os_log_impl(&dword_1C9A3B000, v16, OS_LOG_TYPE_DEFAULT, "HSLS [preprocess]: Action Suggestion at index %lu:\n%@", (uint8_t *)&v30, 0x16u);
      }

    }
    v11 = a1[5];
    goto LABEL_29;
  }
  objc_msgSend(v5, "executableSpecification");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "executableType");

  if (v18 == 1)
  {
    if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) < 3uLL
      || (objc_msgSend(v5, "scoreSpecification"),
          v19 = (void *)objc_claimAutoreleasedReturnValue(),
          v20 = objc_msgSend(v19, "suggestedConfidenceCategory"),
          v19,
          v20 >= 3))
    {
      __atxlog_handle_blending();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v30 = 134218242;
        v31 = a3;
        v32 = 2112;
        v33 = v5;
        _os_log_impl(&dword_1C9A3B000, v21, OS_LOG_TYPE_DEFAULT, "HSLS [preprocess]: App suggestion at index %lu:\n%@", (uint8_t *)&v30, 0x16u);
      }

    }
    v11 = a1[6];
    goto LABEL_29;
  }
  objc_msgSend(v5, "executableSpecification");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "executableType");

  if (v23 == 10)
  {
    if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) < 3uLL
      || (objc_msgSend(v5, "scoreSpecification"),
          v24 = (void *)objc_claimAutoreleasedReturnValue(),
          v25 = objc_msgSend(v24, "suggestedConfidenceCategory"),
          v24,
          v25 >= 3))
    {
      __atxlog_handle_blending();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v30 = 134218242;
        v31 = a3;
        v32 = 2112;
        v33 = v5;
        _os_log_impl(&dword_1C9A3B000, v26, OS_LOG_TYPE_DEFAULT, "HSLS [preprocess]: Link action Suggestion at index %lu:\n%@", (uint8_t *)&v30, 0x16u);
      }

    }
    v11 = a1[7];
    goto LABEL_29;
  }
  objc_msgSend(v5, "scoreSpecification");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "suggestedConfidenceCategory");

  if (v28 >= 3)
  {
    __atxlog_handle_blending();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = 134218242;
      v31 = a3;
      v32 = 2112;
      v33 = v5;
      _os_log_impl(&dword_1C9A3B000, v29, OS_LOG_TYPE_DEFAULT, "HSLS [preprocess]: Suggestion at index %lu:\n%@", (uint8_t *)&v30, 0x16u);
    }

  }
LABEL_30:

}

- (void)_assignSuggestionsForExistingSuggestedWidgets:(id)a3 homeScreenState:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  id v22;
  id v23;
  id obj;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  id v32;
  _QWORD v33[6];
  id v34;
  void *v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v6 = a4;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  objc_msgSend(v6, "sortedPagesByUserLastVisit");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
  if (v26)
  {
    v25 = *(_QWORD *)v47;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v47 != v25)
          objc_enumerationMutation(obj);
        v27 = v7;
        v8 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v7);
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        objc_msgSend(v8, "stacks");
        v30 = (id)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v43;
          v28 = *(_QWORD *)v43;
          do
          {
            v12 = 0;
            v29 = v10;
            do
            {
              if (*(_QWORD *)v43 != v11)
                objc_enumerationMutation(v30);
              v13 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v12);
              objc_msgSend(v13, "config");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "allowsNewWidget");

              if (v15)
              {
                v31 = v12;
                v40 = 0u;
                v41 = 0u;
                v38 = 0u;
                v39 = 0u;
                objc_msgSend(v13, "previousSuggestedWidgets");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
                if (v17)
                {
                  v18 = v17;
                  v19 = *(_QWORD *)v39;
                  do
                  {
                    for (i = 0; i != v18; ++i)
                    {
                      if (*(_QWORD *)v39 != v19)
                        objc_enumerationMutation(v16);
                      v21 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v22 = v21;
                        v33[0] = MEMORY[0x1E0C809B0];
                        v33[1] = 3221225472;
                        v33[2] = __94__ATXHomeScreenLayoutSelector2__assignSuggestionsForExistingSuggestedWidgets_homeScreenState___block_invoke;
                        v33[3] = &unk_1E82DE0A8;
                        v33[4] = self;
                        v33[5] = v13;
                        v34 = v22;
                        v35 = v8;
                        v36 = v6;
                        v37 = v22;
                        v23 = v22;
                        objc_msgSend(v32, "enumerateObjectsUsingBlock:", v33);

                      }
                    }
                    v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
                  }
                  while (v18);
                }

                v11 = v28;
                v10 = v29;
                v12 = v31;
              }
              ++v12;
            }
            while (v12 != v10);
            v10 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
          }
          while (v10);
        }

        v7 = v27 + 1;
      }
      while (v27 + 1 != v26);
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    }
    while (v26);
  }

}

void __94__ATXHomeScreenLayoutSelector2__assignSuggestionsForExistingSuggestedWidgets_homeScreenState___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  _ATXSimpleWidgetSuggestion *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _ATXSimpleWidgetSuggestion *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  objc_msgSend(v6, "executableSpecification");
  v7 = (_ATXSimpleWidgetSuggestion *)objc_claimAutoreleasedReturnValue();
  if (-[_ATXSimpleWidgetSuggestion executableType](v7, "executableType") != 3
    || !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "currentModeConfigurationAllowsSuggestion:", v6)|| !objc_msgSend(*(id *)(a1 + 40), "sizeIsCompatibleWithWidgetSuggestion:", v6))
  {
LABEL_19:

    goto LABEL_20;
  }
  v8 = objc_msgSend(*(id *)(a1 + 48), "containsIdenticalContentOfSuggestion:", v6);

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 56), "config");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "pageIndex");
    v11 = *MEMORY[0x1E0CF9338];

    if (v10 == v11)
    {
      if ((objc_msgSend(*(id *)(a1 + 56), "isShowingDuplicatedContentForSuggestion:considerUnderStackContents:dedupeAppSuggestionsByWidgets:ignoreDuplicatesInSGWidget:ignoreDuplicatesInPanels:", v6, 1, 1, 0, 0) & 1) != 0)goto LABEL_20;
LABEL_9:
      objc_msgSend(v6, "scoreSpecification");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "suggestedConfidenceCategory");

      if (v13 <= 2)
      {
        v14 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
        objc_msgSend(*(id *)(a1 + 72), "widget");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "widgetUniqueId");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "firstAppearDateOfSuggestedWidgetWithUniqueId:", v16);
        v7 = (_ATXSimpleWidgetSuggestion *)objc_claimAutoreleasedReturnValue();

        if (!v7 || (-[_ATXSimpleWidgetSuggestion timeIntervalSinceNow](v7, "timeIntervalSinceNow"), v17 < -10800.0))
        {
          __atxlog_handle_blending();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*(id *)(a1 + 72), "widget");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "compactDescription");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 72), "widget");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "widgetUniqueId");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "config");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "identifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = 138412802;
            v36 = v20;
            v37 = 2114;
            v38 = v22;
            v39 = 2114;
            v40 = v24;
            _os_log_impl(&dword_1C9A3B000, v18, OS_LOG_TYPE_DEFAULT, "HSLS [assignExistingSuggestedWidgets]: Not assigning low conf suggestion for exisiting suggested widget %@ (uniqueID %{public}@) for stack %{public}@ because it first appeared more than 3 hrs ago.", (uint8_t *)&v35, 0x20u);

          }
          goto LABEL_19;
        }

      }
      v25 = [_ATXSimpleWidgetSuggestion alloc];
      objc_msgSend(*(id *)(a1 + 48), "widget");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[_ATXSimpleWidgetSuggestion initWithWidget:suggestion:stack:suggestionDeduplicator:](v25, "initWithWidget:suggestion:stack:suggestionDeduplicator:", v26, v6, *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));

      objc_msgSend(*(id *)(a1 + 40), "suggestedWidgets");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addObject:", v7);

      __atxlog_handle_blending();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        -[_ATXSimpleWidgetSuggestion widget](v7, "widget");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "compactDescription");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[_ATXSimpleWidgetSuggestion widget](v7, "widget");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "widgetUniqueId");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "config");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "identifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 138413058;
        v36 = v30;
        v37 = 2114;
        v38 = v32;
        v39 = 2114;
        v40 = v34;
        v41 = 2112;
        v42 = v6;
        _os_log_impl(&dword_1C9A3B000, v28, OS_LOG_TYPE_DEFAULT, "HSLS [assignExistingSuggestedWidgets]: Kept existing suggested widget %@ (uniqueID %{public}@) for stack %{public}@ by suggestion:\n%@", (uint8_t *)&v35, 0x2Au);

      }
      *a4 = 1;
      goto LABEL_19;
    }
    if ((objc_msgSend(*(id *)(a1 + 64), "isShowingDuplicatedContentForSuggestion:considerUnderStackContents:dedupeAppSuggestionsByWidgets:ignoreDuplicatesInSGWidget:ignoreDuplicatesInPanels:ignoreTodayPage:", v6, 1, 1, 0, 0, 1) & 1) == 0)goto LABEL_9;
  }
LABEL_20:

}

- (void)_rotateAwayFromPreviousSystemInitiatedRotationIfNecessary:(id)a3 homeScreenState:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id obj;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  ATXHomeScreenLayoutSelector2 *v42;
  id v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  id v47;
  void *v48;
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
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t v65[128];
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  void *v69;
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  objc_msgSend(a4, "sortedPagesByUserLastVisit");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
  if (v40)
  {
    v39 = *(_QWORD *)v62;
    v42 = self;
    v43 = v6;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v62 != v39)
          objc_enumerationMutation(obj);
        v41 = v7;
        v8 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v7);
        v57 = 0u;
        v58 = 0u;
        v59 = 0u;
        v60 = 0u;
        v48 = v8;
        objc_msgSend(v8, "stacks");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v57, v71, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v58;
          v44 = *(_QWORD *)v58;
          v45 = v9;
          do
          {
            v13 = 0;
            v46 = v11;
            do
            {
              if (*(_QWORD *)v58 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v13);
              objc_msgSend(v14, "config");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend(v15, "allowsSmartRotate"))
                goto LABEL_14;
              objc_msgSend(v14, "topOfStackSuggestion");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (v16)
                goto LABEL_13;
              v17 = objc_msgSend(v14, "mostRecentRotationOfStackIsSystemInitiated");

              if (v17)
              {
                objc_msgSend(v14, "previousTopWidget");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                if (v15)
                {
                  v55 = 0u;
                  v56 = 0u;
                  v53 = 0u;
                  v54 = 0u;
                  v18 = v6;
                  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v53, v70, 16);
                  v47 = v18;
                  if (v19)
                  {
                    v20 = v19;
                    v21 = *(_QWORD *)v54;
LABEL_21:
                    v22 = 0;
                    while (1)
                    {
                      if (*(_QWORD *)v54 != v21)
                        objc_enumerationMutation(v47);
                      if ((-[ATXSuggestionDeduplicatorProtocol isWidget:showingIdenticalContentOfSuggestion:](self->_suggestionDeduplicator, "isWidget:showingIdenticalContentOfSuggestion:", v15, *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * v22)) & 1) != 0)break;
                      if (v20 == ++v22)
                      {
                        v18 = v47;
                        v20 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v53, v70, 16);
                        if (v20)
                          goto LABEL_21;
                        goto LABEL_27;
                      }
                    }
                  }
                  else
                  {
LABEL_27:

                    __atxlog_handle_blending();
                    v23 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                    {
                      objc_msgSend(v14, "config");
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v24, "identifier");
                      v25 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412546;
                      v67 = v15;
                      v68 = 2114;
                      v69 = v25;
                      _os_log_impl(&dword_1C9A3B000, v23, OS_LOG_TYPE_DEFAULT, "HSLS [rotateAwayFromIrrelevantWidget]: Previous system rotation to widget %@ in stack %{public}@ is no longer relevant, attempting to make a fresh rotation...", buf, 0x16u);

                      v18 = v47;
                    }

                    v51 = 0u;
                    v52 = 0u;
                    v49 = 0u;
                    v50 = 0u;
                    v26 = v18;
                    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
                    if (v27)
                    {
                      v28 = v27;
                      v29 = *(_QWORD *)v50;
                      while (2)
                      {
                        for (i = 0; i != v28; ++i)
                        {
                          if (*(_QWORD *)v50 != v29)
                            objc_enumerationMutation(v26);
                          v31 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
                          objc_msgSend(v31, "executableSpecification");
                          v32 = (void *)objc_claimAutoreleasedReturnValue();
                          if (objc_msgSend(v32, "executableType") == 3
                            && !objc_msgSend(v48, "isShowingDuplicatedContentForSuggestion:considerUnderStackContents:dedupeAppSuggestionsByWidgets:ignoreDuplicatesInSGWidget:ignoreDuplicatesInPanels:", v31, 0, 1, 0, 0))
                          {
                            objc_msgSend(v14, "widgetForSuggestion:considerSuggestedWidgets:", v31, 1);
                            v33 = (void *)objc_claimAutoreleasedReturnValue();

                            if (v33)
                            {
                              __atxlog_handle_blending();
                              v34 = objc_claimAutoreleasedReturnValue();
                              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                              {
                                objc_msgSend(v14, "config");
                                v35 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v35, "identifier");
                                v36 = (void *)objc_claimAutoreleasedReturnValue();
                                *(_DWORD *)buf = 138543618;
                                v67 = v36;
                                v68 = 2112;
                                v69 = v31;
                                _os_log_impl(&dword_1C9A3B000, v34, OS_LOG_TYPE_DEFAULT, "HSLS [rotateAwayFromIrrelevantWidget]: ASSIGNING a new top widget for stack %{public}@ by suggestion: \n%@", buf, 0x16u);

                              }
                              self = v42;
                              -[ATXHomeScreenLayoutSelector2 _assignSuggestion:toTopOfStack:](v42, "_assignSuggestion:toTopOfStack:", v31, v14);
                              v6 = v43;
                              goto LABEL_44;
                            }
                          }
                          else
                          {

                          }
                        }
                        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
                        if (v28)
                          continue;
                        break;
                      }
                      self = v42;
                      v6 = v43;
LABEL_44:
                      v12 = v44;
                      v9 = v45;
                    }
                  }
                  v11 = v46;
                  v16 = v47;
LABEL_13:

                }
LABEL_14:

              }
              ++v13;
            }
            while (v13 != v11);
            v37 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v57, v71, 16);
            v11 = v37;
          }
          while (v37);
        }

        v7 = v41 + 1;
      }
      while (v41 + 1 != v40);
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
    }
    while (v40);
  }

}

- (void)_preservePreviousAppSuggestionPositionsWithHomeScreenState:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id obj;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(a3, "sortedPagesByUserLastVisit");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v42, 16);
  if (v25)
  {
    v24 = *(_QWORD *)v32;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v32 != v24)
          objc_enumerationMutation(obj);
        v26 = v3;
        v4 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v3);
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        objc_msgSend(v4, "stacks");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v41, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v28;
          do
          {
            for (i = 0; i != v7; ++i)
            {
              if (*(_QWORD *)v28 != v8)
                objc_enumerationMutation(v5);
              v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
              objc_msgSend(v10, "config");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = objc_msgSend(v11, "isAppPredictionPanel");

              if (v12)
              {
                objc_msgSend(v10, "previousTopOfStackSuggestion");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "suggestionLayout");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "oneByOneSuggestions");
                v15 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v10, "topOfStackSuggestion");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "suggestionLayout");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "oneByOneSuggestions");
                v18 = (void *)objc_claimAutoreleasedReturnValue();

                if (v15)
                  v19 = v18 == 0;
                else
                  v19 = 1;
                if (!v19)
                {
                  +[ATXStaticSuggestionsManager preservePreviousAppPositionsForPreviousSuggestions:newSuggestions:uiLimit:](ATXStaticSuggestionsManager, "preservePreviousAppPositionsForPreviousSuggestions:newSuggestions:uiLimit:", v15, v18, objc_msgSend(v18, "count"));
                  v20 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "topOfStackSuggestion");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "suggestionLayout");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "setOneByOneSuggestions:", v20);
                  goto LABEL_19;
                }
                __atxlog_handle_blending();
                v20 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v10, "config");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "identifier");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  v36 = v22;
                  v37 = 2112;
                  v38 = v15;
                  v39 = 2112;
                  v40 = v18;
                  _os_log_error_impl(&dword_1C9A3B000, v20, OS_LOG_TYPE_ERROR, "HSLS [APPStablization]: Can't preserve App suggestion positions for panel in stack %{public}@ - previousSuggestions %@, newSuggestions %@", buf, 0x20u);
LABEL_19:

                }
                continue;
              }
            }
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v41, 16);
          }
          while (v7);
        }

        v3 = v26 + 1;
      }
      while (v26 + 1 != v25);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v42, 16);
    }
    while (v25);
  }

}

- (id)_fallbackSuggestions:(id)a3 homeScreenState:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  BOOL v18;
  NSObject *v21;
  NSObject *v22;
  __int128 v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v26 = (id)objc_opt_new();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v8)
  {
    v10 = v8;
    v11 = 0;
    v12 = 0;
    v13 = *(_QWORD *)v28;
    *(_QWORD *)&v9 = 138412290;
    v25 = v9;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v13)
        objc_enumerationMutation(v7);
      v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v14);
      objc_msgSend(v15, "executableSpecification", v25);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "executableType");

      v18 = v17 > 0xA || ((1 << v17) & 0x406) == 0;
      if (!v18
        && (objc_msgSend(v6, "isShowingDuplicatedContentForSuggestion:considerUnderStackContents:dedupeAppSuggestionsByWidgets:ignoreDuplicatesInSGWidget:ignoreDuplicatesInPanels:ignoreTodayPage:", v15, 1, 1, 0, 0, 0) & 1) == 0)
      {
        if (v17 != 1 || v12 > 2)
        {
          if ((v17 & 0xFFFFFFFFFFFFFFF7) == 2 && v11 <= 2)
          {
            __atxlog_handle_blending();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v25;
              v32 = v15;
              _os_log_impl(&dword_1C9A3B000, v21, OS_LOG_TYPE_DEFAULT, "HSLS [fallbackGeneration]: Adding fallback action suggestion:\n%@", buf, 0xCu);
            }

            objc_msgSend(v26, "addObject:", v15);
            ++v11;
          }
        }
        else
        {
          __atxlog_handle_blending();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v25;
            v32 = v15;
            _os_log_impl(&dword_1C9A3B000, v22, OS_LOG_TYPE_DEFAULT, "HSLS [fallbackGeneration]: Adding fallback app suggestion:\n%@", buf, 0xCu);
          }

          objc_msgSend(v26, "addObject:", v15);
          ++v12;
        }
        if (v12 == 3 && v11 == 3)
          break;
      }
      if (v10 == ++v14)
      {
        v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

  return v26;
}

- (void)_removeSuggestedWidgetWhereNecessaryWithHomeScreenState:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id obj;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[6];
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
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(a3, "sortedPagesByUserLastVisit");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v20)
  {
    v19 = *(_QWORD *)v29;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v29 != v19)
          objc_enumerationMutation(obj);
        v21 = v4;
        v5 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v4);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        objc_msgSend(v5, "stacks");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v25;
          do
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v25 != v9)
                objc_enumerationMutation(v6);
              v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
              objc_msgSend(v11, "suggestedWidgets");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = objc_msgSend(v12, "count");

              if (v13)
              {
                v14 = (void *)objc_opt_new();
                objc_msgSend(v11, "suggestedWidgets");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                v22[0] = MEMORY[0x1E0C809B0];
                v22[1] = 3221225472;
                v22[2] = __88__ATXHomeScreenLayoutSelector2__removeSuggestedWidgetWhereNecessaryWithHomeScreenState___block_invoke;
                v22[3] = &unk_1E82DE0D0;
                v22[4] = v11;
                v22[5] = self;
                v23 = v14;
                v16 = v14;
                objc_msgSend(v15, "enumerateObjectsUsingBlock:", v22);

                objc_msgSend(v11, "suggestedWidgets");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "removeObjectsAtIndexes:", v16);

              }
            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v8);
        }

        v4 = v21 + 1;
      }
      while (v21 + 1 != v20);
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v20);
  }

}

void __88__ATXHomeScreenLayoutSelector2__removeSuggestedWidgetWhereNecessaryWithHomeScreenState___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint8_t buf[4];
  void *v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  uint64_t v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "topOfStackSuggestion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(void **)(a1 + 32);
  if (v6)
  {
    objc_msgSend(v7, "topOfStackSuggestion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "widget");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "widgetUniqueId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "widget");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "widgetUniqueId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "isEqualToString:", v12);

    if ((v13 & 1) != 0)
      goto LABEL_7;
  }
  else
  {
    objc_msgSend(v7, "previousTopWidget");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(*(id *)(a1 + 32), "previousTopWidget");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "widgetUniqueId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "widget");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "widgetUniqueId");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v16, "isEqualToString:", v18);

      if ((v19 & 1) != 0)
        goto LABEL_7;
    }
  }
  v20 = *(void **)(*(_QWORD *)(a1 + 40) + 56);
  objc_msgSend(v5, "widget");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "mostRecentEngagementOfWidget:ofType:", v21, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    __atxlog_handle_blending();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "widget");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "widgetUniqueId");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stack");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "config");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "identifier");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v72 = v42;
      v73 = 2114;
      v74 = v45;
      _os_log_impl(&dword_1C9A3B000, v40, OS_LOG_TYPE_DEFAULT, "HSLS [suggestedWidgetRemoval]: Removing suggested widget %{public}@ from stack %{public}@, since it hasn't been seen by the user.", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "topOfStackSuggestion");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "widget");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "widgetUniqueId");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "widget");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "widgetUniqueId");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v48, "isEqualToString:", v50);

    if (v51)
      objc_msgSend(*(id *)(a1 + 32), "setTopOfStackSuggestion:", 0);
    objc_msgSend(*(id *)(a1 + 48), "addIndex:", a3);
    goto LABEL_32;
  }
LABEL_7:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v23 = v5;
    if ((objc_msgSend(v23, "isLayoutComplete") & 1) != 0)
    {
      v66 = a3;
      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      objc_msgSend(v23, "suggestionLayout");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "allSuggestionsInLayout");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v68;
        while (2)
        {
          v29 = 0;
          do
          {
            if (*(_QWORD *)v68 != v28)
              objc_enumerationMutation(v25);
            objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * v29), "scoreSpecification");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v30, "suggestedConfidenceCategory");
            v32 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 136);

            if (v31 >= v32)
            {

              goto LABEL_31;
            }
            ++v29;
          }
          while (v27 != v29);
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
          if (v27)
            continue;
          break;
        }
      }

      __atxlog_handle_blending();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v23, "widget");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "widgetUniqueId");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stack");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "config");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "identifier");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 136);
        *(_DWORD *)buf = 138543874;
        v72 = v35;
        v73 = 2114;
        v74 = v38;
        v75 = 2048;
        v76 = v39;
        _os_log_impl(&dword_1C9A3B000, v33, OS_LOG_TYPE_DEFAULT, "HSLS [suggestedWidgetRemoval]: Removing suggested SW %{public}@ from stack %{public}@, because it does not have at least 1 suggestion with confidence >= %ld", buf, 0x20u);

      }
      a3 = v66;
    }
    else
    {
      __atxlog_handle_blending();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v23, "widget");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "widgetUniqueId");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stack");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "config");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "identifier");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v72 = v53;
        v73 = 2114;
        v74 = v56;
        _os_log_impl(&dword_1C9A3B000, v33, OS_LOG_TYPE_DEFAULT, "HSLS [suggestedWidgetRemoval]: Removing suggested SG %{public}@ from stack %{public}@, because it does not have a complete layout", buf, 0x16u);

      }
    }

    objc_msgSend(*(id *)(a1 + 32), "topOfStackSuggestion");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "widget");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "widgetUniqueId");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "widget");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "widgetUniqueId");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v59, "isEqualToString:", v61);

    if (v62)
      objc_msgSend(*(id *)(a1 + 32), "setTopOfStackSuggestion:", 0);
    objc_msgSend(*(id *)(a1 + 32), "suggestionsWidgetSuggestionsByWidgetUniqueId");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "widget");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "widgetUniqueId");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "removeObjectForKey:", v65);

    objc_msgSend(*(id *)(a1 + 48), "addIndex:", a3);
LABEL_31:

  }
LABEL_32:

}

- (BOOL)_isSuggestionStillNeededForTopOfStack:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  char v13;

  v3 = a3;
  objc_msgSend(v3, "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "allowsSmartRotate") & 1) != 0)
    goto LABEL_6;
  objc_msgSend(v3, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "allowsNewWidget") & 1) != 0)
  {
LABEL_5:

LABEL_6:
    goto LABEL_7;
  }
  objc_msgSend(v3, "config");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isPinnedSuggestionsWidget"))
  {

    goto LABEL_5;
  }
  objc_msgSend(v3, "config");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isAppPredictionPanel");

  if ((v13 & 1) == 0)
    goto LABEL_12;
LABEL_7:
  objc_msgSend(v3, "topOfStackSuggestion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    LOBYTE(v11) = 1;
    goto LABEL_13;
  }
  objc_msgSend(v3, "topOfStackSuggestion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "conformsToProtocol:", &unk_1EF94F6D8);

  if (!v9)
  {
LABEL_12:
    LOBYTE(v11) = 0;
    goto LABEL_13;
  }
  objc_msgSend(v3, "topOfStackSuggestion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isLayoutComplete") ^ 1;

LABEL_13:
  return v11;
}

- (void)_assignSuggestion:(id)a3 toTopOfStack:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  _ATXSimpleWidgetSuggestion *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  _ATXAppPredictionPanelSuggestion *v16;
  void *v17;
  void *v18;
  void *v19;
  _ATXSuggestionsWidgetSuggestion *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "executableSpecification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "executableType");

  if (v9 == 3)
  {
    v10 = -[_ATXSimpleWidgetSuggestion initWithSuggestion:stack:suggestionDeduplicator:]([_ATXSimpleWidgetSuggestion alloc], "initWithSuggestion:stack:suggestionDeduplicator:", v6, v7, self->_suggestionDeduplicator);
    if (v10)
      objc_msgSend(v7, "setTopOfStackSuggestion:", v10);
    goto LABEL_6;
  }
  objc_msgSend(v7, "topOfStackSuggestion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "conformsToProtocol:", &unk_1EF94F6D8);

  if (v12)
  {
    objc_msgSend(v7, "topOfStackSuggestion");
    v10 = (_ATXSimpleWidgetSuggestion *)objc_claimAutoreleasedReturnValue();
    -[_ATXSimpleWidgetSuggestion mainSuggestionInLayout](v10, "mainSuggestionInLayout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ATXSimpleWidgetSuggestion addSuggestion:asMainSuggestion:](v10, "addSuggestion:asMainSuggestion:", v6, v13 == 0);

LABEL_6:
    goto LABEL_28;
  }
  objc_msgSend(v7, "config");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isAppPredictionPanel");

  if (v15)
  {
    v16 = [_ATXAppPredictionPanelSuggestion alloc];
    objc_msgSend(v7, "config");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "widgets");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[_ATXAppPredictionPanelSuggestion initWithAppPredictionPanel:containingStack:suggestionDeduplicator:hyperParameters:](v16, "initWithAppPredictionPanel:containingStack:suggestionDeduplicator:hyperParameters:", v19, v7, self->_suggestionDeduplicator, self->_hyperParameters);

  }
  else
  {
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    objc_msgSend(v7, "suggestionsWidgetSuggestionsByWidgetUniqueId", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "allValues");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v44;
LABEL_11:
      v26 = 0;
      while (1)
      {
        if (*(_QWORD *)v44 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v26);
        if (objc_msgSend(v27, "canAddSuggestion:", v6))
          break;
        if (v24 == ++v26)
        {
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
          if (v24)
            goto LABEL_11;
          goto LABEL_17;
        }
      }
      v20 = v27;
      __atxlog_handle_blending();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        -[_ATXCompositeLayoutWidgetSuggestionBase widget](v20, "widget");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "compactDescription");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[_ATXCompositeLayoutWidgetSuggestionBase widget](v20, "widget");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "widgetUniqueId");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v48 = v30;
        v49 = 2114;
        v50 = v32;
        _os_log_impl(&dword_1C9A3B000, v28, OS_LOG_TYPE_DEFAULT, "HSLS [topOfStackAssignment]: Setting topOfStackSuggestion to existing SuggestionsWidgetSuggestion (widget %@, uniqueID %{public}@) and add suggestion", buf, 0x16u);

      }
      if (v20)
        goto LABEL_25;
    }
    else
    {
LABEL_17:

    }
    v17 = (void *)objc_opt_new();
    v33 = *MEMORY[0x1E0CF9480];
    objc_msgSend(v17, "setAppBundleId:", *MEMORY[0x1E0CF9480]);
    objc_msgSend(v17, "setExtensionBundleId:", v33);
    ATXSpecialWidgetKindSiriSuggestions();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setWidgetKind:", v34);

    objc_msgSend(v7, "config");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setSize:", objc_msgSend(v35, "stackLayoutSize"));

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "UUIDString");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setWidgetUniqueId:", v37);

    objc_msgSend(v17, "setSuggestedWidget:", 1);
    v20 = -[_ATXSuggestionsWidgetSuggestion initWithSuggestionsWidget:containingStack:suggestionDeduplicator:hyperParameters:]([_ATXSuggestionsWidgetSuggestion alloc], "initWithSuggestionsWidget:containingStack:suggestionDeduplicator:hyperParameters:", v17, v7, self->_suggestionDeduplicator, self->_hyperParameters);
    __atxlog_handle_blending();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      -[_ATXCompositeLayoutWidgetSuggestionBase widget](v20, "widget");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "compactDescription");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ATXCompositeLayoutWidgetSuggestionBase widget](v20, "widget");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "widgetUniqueId");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v48 = v40;
      v49 = 2114;
      v50 = v42;
      _os_log_impl(&dword_1C9A3B000, v38, OS_LOG_TYPE_DEFAULT, "HSLS [topOfStackAssignment]: Setting topOfStackSuggestion to new SuggestionsWidgetSuggestion (widget %@, uniqueID %{public}@) and add suggestion", buf, 0x16u);

    }
  }

LABEL_25:
  if (-[_ATXCompositeLayoutWidgetSuggestionBase addSuggestion:asMainSuggestion:](v20, "addSuggestion:asMainSuggestion:", v6, 1))
  {
    objc_msgSend(v7, "setTopOfStackSuggestion:", v20);
  }

LABEL_28:
}

- (id)_suggestionsWidgetPreviewsFromRankedSuggestions:(id)a3
{
  void *v3;
  uint64_t i;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  NSObject *v16;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[16];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v3 = (void *)objc_opt_new();
  for (i = 0; i != 3; ++i)
  {
    v5 = -[_ATXSuggestionsWidgetSuggestion initForPreviewOfSize:hyperParameters:]([_ATXSuggestionsWidgetSuggestion alloc], "initForPreviewOfSize:hyperParameters:", i, self->_hyperParameters);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = v18;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v21;
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v10);
        objc_msgSend(v11, "executableSpecification");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "executableType");

        if ((v13 & 0xFFFFFFFFFFFFFFF7) == 2)
        {
          objc_msgSend(v5, "mainSuggestionInLayout");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v5, "addSuggestion:asMainSuggestion:", v11, v14 == 0);

          if (v15)
          {
            if ((objc_msgSend(v5, "isLayoutComplete") & 1) != 0)
              break;
          }
        }
        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
          if (v8)
            goto LABEL_4;
          break;
        }
      }
    }

    if ((objc_msgSend(v5, "isLayoutComplete") & 1) == 0)
    {
      __atxlog_handle_blending();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[ATXHomeScreenLayoutSelector2 _suggestionsWidgetPreviewsFromRankedSuggestions:].cold.1((uint64_t)v24, (uint64_t)v5);

    }
    objc_msgSend(v3, "addObject:", v5);

  }
  return v3;
}

- (id)_appPredictionPanelPreviewFromRankedSuggestions:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  NSObject *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_ATXAppPredictionPanelSuggestion initForPreviewWithHyperParameters:]([_ATXAppPredictionPanelSuggestion alloc], "initForPreviewWithHyperParameters:", self->_hyperParameters);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v10);
      objc_msgSend(v11, "executableSpecification", (_QWORD)v18);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "executableType");

      if (v13 == 1)
      {
        objc_msgSend(v5, "mainSuggestionInLayout");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v5, "addSuggestion:asMainSuggestion:", v11, v14 == 0);

        if (v15)
        {
          if ((objc_msgSend(v5, "isLayoutComplete") & 1) != 0)
            break;
        }
      }
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v8)
          goto LABEL_3;
        break;
      }
    }
  }

  if ((objc_msgSend(v5, "isLayoutComplete") & 1) == 0)
  {
    __atxlog_handle_blending();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[ATXHomeScreenLayoutSelector2 _appPredictionPanelPreviewFromRankedSuggestions:].cold.1(v5, v16);

  }
  return v5;
}

- (BOOL)_isSuggestionACandidate:(id)a3 forStack:(id)a4 dedupeAppSuggestionsByWidgets:(BOOL)a5 ignoreDuplicatesInSGWidget:(BOOL)a6 ignoreDuplicatesInPanels:(BOOL)a7 homeScreenState:(id)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL8 v11;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  const char *v25;
  void *v26;
  int v27;
  void *v28;
  BOOL v29;
  void *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _UNKNOWN **v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _UNKNOWN **v48;
  uint64_t v49;
  id v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t i;
  void *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  _BOOL4 v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v73;
  void *v74;
  id v75;
  NSObject *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  int v81;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  uint8_t v91[128];
  uint8_t buf[4];
  uint64_t v93;
  __int16 v94;
  id v95;
  __int16 v96;
  id v97;
  _BYTE v98[128];
  uint64_t v99;

  v9 = a7;
  v10 = a6;
  v11 = a5;
  v99 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a8;
  objc_msgSend(v13, "executableSpecification");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "executableType");

  if (v17 == 2)
  {
    objc_msgSend(v13, "atxActionExecutableObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "intent");
    v19 = objc_claimAutoreleasedReturnValue();

    if (v19 && objc_msgSend(v15, "containsWidgetForIntent:", v19))
    {
      __atxlog_handle_blending();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v93 = (uint64_t)v13;
        _os_log_impl(&dword_1C9A3B000, v20, OS_LOG_TYPE_DEFAULT, "    HSLS: suggestion not eligible - home screen contains widget for action; suggestion %@",
          buf,
          0xCu);
      }
      goto LABEL_20;
    }

  }
  objc_msgSend(v13, "executableSpecification");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "executableType");

  if (v22 == 10)
  {
    objc_msgSend(v13, "linkActionExecutableObject");
    v19 = objc_claimAutoreleasedReturnValue();
    -[NSObject cachedAppIntent](v19, "cachedAppIntent");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      __atxlog_handle_blending();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v93 = (uint64_t)v13;
        v25 = "    HSLS: suggestion not eligible - link action doesn't contain cached app intent; suggestion %@";
        goto LABEL_14;
      }
LABEL_15:

      goto LABEL_21;
    }
    if (objc_msgSend(v15, "containsWidgetForIntent:", v23))
    {
      __atxlog_handle_blending();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v93 = (uint64_t)v13;
        v25 = "    HSLS: suggestion not eligible - home screen contains widget for link action app intent; suggestion %@";
LABEL_14:
        _os_log_impl(&dword_1C9A3B000, v24, OS_LOG_TYPE_DEFAULT, v25, buf, 0xCu);
        goto LABEL_15;
      }
      goto LABEL_15;
    }

  }
  objc_msgSend(v14, "page");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "isShowingDuplicatedContentForSuggestion:considerUnderStackContents:dedupeAppSuggestionsByWidgets:ignoreDuplicatesInSGWidget:ignoreDuplicatesInPanels:", v13, 0, v11, v10, v9);

  if (v27)
  {
    __atxlog_handle_blending();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v14, "page");
      v20 = objc_claimAutoreleasedReturnValue();
      -[NSObject config](v20, "config");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v93 = objc_msgSend(v28, "pageIndex");
      v94 = 2112;
      v95 = v13;
      _os_log_impl(&dword_1C9A3B000, v19, OS_LOG_TYPE_DEFAULT, "    HSLS: suggestion not eligible for page %lu - duplicated content on page; suggestion %@",
        buf,
        0x16u);

LABEL_20:
    }
LABEL_21:
    v29 = 0;
    goto LABEL_68;
  }
  v75 = v15;
  v82 = v13;
  v76 = objc_opt_new();
  v79 = (void *)objc_opt_new();
  v30 = (void *)objc_opt_new();
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v77 = v14;
  objc_msgSend(v14, "page");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "stacks");
  v32 = objc_claimAutoreleasedReturnValue();

  v33 = -[NSObject countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v87, v98, 16);
  if (!v33)
    goto LABEL_50;
  v34 = v33;
  v35 = *(_QWORD *)v88;
  v36 = &off_1E82D9000;
  while (2)
  {
    v37 = 0;
    v78 = v34;
    do
    {
      if (*(_QWORD *)v88 != v35)
        objc_enumerationMutation(v32);
      v38 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * v37);
      objc_msgSend(v38, "topOfStackSuggestion");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (v39 || (objc_msgSend(v38, "previousTopWidget"), (v39 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {

      }
      else if (objc_msgSend(v38, "containsIdenticalContentOfSuggestion:ignoreDuplicatesInSGWidget:ignoreDuplicatesInPanels:", v13, 0, 0))
      {
        __atxlog_handle_blending();
        v65 = objc_claimAutoreleasedReturnValue();
        v66 = os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT);
        v14 = v77;
        if (v66)
        {
          objc_msgSend(v77, "page");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "config");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = objc_msgSend(v68, "pageIndex");
          objc_msgSend(v38, "config");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "identifier");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218498;
          v93 = v69;
          v94 = 2114;
          v95 = v71;
          v96 = 2112;
          v97 = v13;
          _os_log_impl(&dword_1C9A3B000, v65, OS_LOG_TYPE_DEFAULT, "    HSLS: suggestion not eligible for page %lu - contained in a stack %{public}@ whose topWidget is unknown; suggestion %@",
            buf,
            0x20u);

        }
        v15 = v75;
        v19 = v76;
        goto LABEL_66;
      }
      objc_msgSend(v13, "executableSpecification");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v40, "executableType") != 3)
      {

LABEL_36:
        objc_msgSend(v38, "topOfStackSuggestion");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        if (v45)
        {

        }
        else if (objc_msgSend(v38, "previousTopWidgetWasShowingIdenticalContentOfSuggestion:", v13))
        {
          objc_msgSend(v38, "previousTopOfStackSuggestion");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v38, "previousTopOfStackSuggestion");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "widget");
            v48 = v36;
            v49 = v35;
            v50 = v13;
            v51 = v32;
            v52 = v30;
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v81 = objc_msgSend(v53, "isSuggestedWidget");

            v30 = v52;
            v32 = v51;
            v13 = v50;
            v35 = v49;
            v36 = v48;
            v34 = v78;

            if (v81)
              goto LABEL_41;
          }
          else
          {

          }
          v54 = v79;
          goto LABEL_42;
        }
LABEL_41:
        v54 = v30;
LABEL_42:
        objc_msgSend(v54, "addObject:", v38);
        goto LABEL_43;
      }
      v41 = objc_msgSend(v38, "sizeIsCompatibleWithWidgetSuggestion:", v13);

      if ((v41 & 1) != 0)
        goto LABEL_36;
      __atxlog_handle_blending();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v38, "config");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "identifier");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v93 = (uint64_t)v44;
        v94 = 2112;
        v95 = v13;
        _os_log_impl(&dword_1C9A3B000, v42, OS_LOG_TYPE_DEFAULT, "    HSLS: suggestion not eligible for stack %{public}@ - widget suggestion size not compatible; suggestion %@",
          buf,
          0x16u);

      }
LABEL_43:
      ++v37;
    }
    while (v34 != v37);
    v55 = -[NSObject countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v87, v98, 16);
    v34 = v55;
    if (v55)
      continue;
    break;
  }
LABEL_50:

  v56 = v30;
  if (objc_msgSend(v79, "count"))
  {
    v80 = v30;
    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    v56 = v79;
    v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
    if (v57)
    {
      v58 = v57;
      v59 = *(_QWORD *)v84;
      do
      {
        for (i = 0; i != v58; ++i)
        {
          if (*(_QWORD *)v84 != v59)
            objc_enumerationMutation(v56);
          v61 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
          __atxlog_handle_blending();
          v62 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v61, "config");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "identifier");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v93 = (uint64_t)v64;
            v94 = 2112;
            v95 = v82;
            _os_log_impl(&dword_1C9A3B000, v62, OS_LOG_TYPE_DEFAULT, "    HSLS: stack %{public}@ was previously showing suggestion and it's still not assigned yet; suggestion %@",
              buf,
              0x16u);

          }
        }
        v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
      }
      while (v58);
    }

    v13 = v82;
    v30 = v80;
  }
  v19 = v76;
  -[NSObject addObjectsFromArray:](v76, "addObjectsFromArray:", v56);
  v14 = v77;
  if ((-[NSObject containsObject:](v76, "containsObject:", v77) & 1) != 0)
  {
    v29 = 1;
    v15 = v75;
  }
  else
  {
    __atxlog_handle_blending();
    v32 = objc_claimAutoreleasedReturnValue();
    v15 = v75;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v77, "config");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "identifier");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v93 = (uint64_t)v74;
      v94 = 2112;
      v95 = v13;
      _os_log_impl(&dword_1C9A3B000, v32, OS_LOG_TYPE_DEFAULT, "    HSLS: suggestion not eligible for stack %{public}@ - not in the list of candidate stacks; suggestion %@",
        buf,
        0x16u);

    }
LABEL_66:

    v29 = 0;
  }

LABEL_68:
  return v29;
}

- (BOOL)_hasEligiblePinnedWidgetStacksForSuggestionsWidget:(id)a3 forCandidateStack:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  BOOL v14;

  v6 = a3;
  v7 = a4;
  if (!-[ATXHomeScreenLayoutSelector2 _shouldConsiderSuggestionForSuggestionsWidget:](self, "_shouldConsiderSuggestionForSuggestionsWidget:", v6))goto LABEL_6;
  objc_msgSend(v7, "config");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isPinnedSuggestionsWidget");

  if (!v9)
    goto LABEL_6;
  objc_msgSend(v7, "topOfStackSuggestion");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10
    || (v11 = (void *)v10,
        objc_msgSend(v7, "topOfStackSuggestion"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "canAddSuggestion:", v6),
        v12,
        v11,
        (v13 & 1) != 0))
  {
    v14 = 1;
  }
  else
  {
LABEL_6:
    v14 = 0;
  }

  return v14;
}

- (BOOL)_hasEligiblePinnedWidgetStacksForAPPWidget:(id)a3 forCandidateStack:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  BOOL v14;

  v6 = a3;
  v7 = a4;
  if (!-[ATXHomeScreenLayoutSelector2 _shouldConsiderSuggestionForAppPredictionPanel:](self, "_shouldConsiderSuggestionForAppPredictionPanel:", v6))goto LABEL_6;
  objc_msgSend(v7, "config");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isAppPredictionPanel");

  if (!v9)
    goto LABEL_6;
  objc_msgSend(v7, "topOfStackSuggestion");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10
    || (v11 = (void *)v10,
        objc_msgSend(v7, "topOfStackSuggestion"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "canAddSuggestion:", v6),
        v12,
        v11,
        (v13 & 1) != 0))
  {
    v14 = 1;
  }
  else
  {
LABEL_6:
    v14 = 0;
  }

  return v14;
}

- (BOOL)_isStackEligibleForSmartRotate:(id)a3 stack:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  const char *v17;
  BOOL v18;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  const char *v32;
  int v33;
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "config");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "allowsSmartRotate");

  if ((v9 & 1) != 0)
  {
    if (!-[ATXHomeScreenLayoutSelector2 _isSuggestionStillNeededForTopOfStack:](self, "_isSuggestionStillNeededForTopOfStack:", v7))
    {
      __atxlog_handle_blending();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "config");
        v15 = objc_claimAutoreleasedReturnValue();
        -[NSObject identifier](v15, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138543618;
        v34 = v16;
        v35 = 2112;
        v36 = v6;
        v17 = "    HSLS [assignSmartRotate]: Suggestion cannot smart rotate stack %{public}@ - stack no longer needs top "
              "of stack suggestion; %@";
        goto LABEL_11;
      }
      goto LABEL_14;
    }
    objc_msgSend(v7, "topOfStackSuggestion");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      objc_msgSend(v6, "executableSpecification");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "executableType");

      if (v13 == 3)
      {
        __atxlog_handle_blending();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v7, "config");
          v15 = objc_claimAutoreleasedReturnValue();
          -[NSObject identifier](v15, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 138543618;
          v34 = v16;
          v35 = 2112;
          v36 = v6;
          v17 = "    HSLS [assignSmartRotate]: Suggestion cannot smart rotate stack %{public}@ - cannot assign widget sug"
                "gestion to composite layout; %@";
LABEL_11:
          _os_log_impl(&dword_1C9A3B000, v14, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v33, 0x16u);
LABEL_12:

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
    }
    objc_msgSend(v6, "scoreSpecification");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "suggestedConfidenceCategory");

    if (v21 <= 2)
    {
      if (!-[ATXHomeScreenLayoutSelector2 _isStackStale:](self, "_isStackStale:", v7))
      {
        __atxlog_handle_blending();
        v14 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          goto LABEL_14;
        objc_msgSend(v7, "config");
        v15 = objc_claimAutoreleasedReturnValue();
        -[NSObject identifier](v15, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138543618;
        v34 = v16;
        v35 = 2112;
        v36 = v6;
        v17 = "    HSLS [assignSmartRotate]: Suggestion cannot smart rotate stack %{public}@ - low conf suggestion and st"
              "ack is not stale; %@";
        goto LABEL_11;
      }
      objc_msgSend(v6, "executableSpecification");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "executableType");

      if (v23 != 3)
      {
        __atxlog_handle_blending();
        v14 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          goto LABEL_14;
        objc_msgSend(v7, "config");
        v15 = objc_claimAutoreleasedReturnValue();
        -[NSObject identifier](v15, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138543618;
        v34 = v16;
        v35 = 2112;
        v36 = v6;
        v17 = "    HSLS [assignSmartRotate]: Suggestion cannot smart rotate stack %{public}@ - low conf and type is not widget; %@";
        goto LABEL_11;
      }
      if (objc_msgSend(v7, "previousTopWidgetWasShowingIdenticalContentOfSuggestion:", v6))
      {
        __atxlog_handle_blending();
        v14 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          goto LABEL_14;
        objc_msgSend(v7, "config");
        v15 = objc_claimAutoreleasedReturnValue();
        -[NSObject identifier](v15, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138543618;
        v34 = v16;
        v35 = 2112;
        v36 = v6;
        v17 = "    HSLS [assignSmartRotate]: Suggestion cannot smart rotate stack %{public}@ - low conf and same as exist"
              "ing top widget; %@";
        goto LABEL_11;
      }
    }
    objc_msgSend(v7, "config");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "widgetForSuggestion:considerSuggestedWidgets:", v6, objc_msgSend(v24, "allowsNewWidget"));
    v14 = objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[NSObject extensionBundleId](v14, "extensionBundleId");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isEqualToString:", *MEMORY[0x1E0CF9480]);

      if (!v26)
      {
LABEL_27:
        v18 = 1;
        goto LABEL_15;
      }
      if (-[ATXHomeScreenLayoutSelector2 _shouldConsiderSuggestionForSuggestionsWidget:](self, "_shouldConsiderSuggestionForSuggestionsWidget:", v6))
      {
        objc_msgSend(v7, "topOfStackSuggestion");
        v27 = objc_claimAutoreleasedReturnValue();
        if (!v27)
          goto LABEL_27;
        v28 = (void *)v27;
        objc_msgSend(v7, "topOfStackSuggestion");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "canAddSuggestion:", v6);

        if ((v30 & 1) != 0)
          goto LABEL_27;
        __atxlog_handle_blending();
        v15 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          goto LABEL_13;
        objc_msgSend(v7, "config");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "identifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138543618;
        v34 = v31;
        v35 = 2112;
        v36 = v6;
        v32 = "    HSLS [assignSmartRotate]: Suggestion cannot smart rotate stack %{public}@ - cannot add to existing layout; %@";
      }
      else
      {
        __atxlog_handle_blending();
        v15 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          goto LABEL_13;
        objc_msgSend(v7, "config");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "identifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138543618;
        v34 = v31;
        v35 = 2112;
        v36 = v6;
        v32 = "    HSLS [assignSmartRotate]: Suggestion cannot smart rotate stack %{public}@ - can't be surfaced in SG widget; %@";
      }
    }
    else
    {
      __atxlog_handle_blending();
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      objc_msgSend(v7, "config");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "identifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138543618;
      v34 = v31;
      v35 = 2112;
      v36 = v6;
      v32 = "    HSLS [assignSmartRotate]: Suggestion cannot smart rotate stack %{public}@ - widget not found in stack; %@";
    }
    _os_log_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_DEFAULT, v32, (uint8_t *)&v33, 0x16u);

    goto LABEL_12;
  }
  __atxlog_handle_blending();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "config");
    v15 = objc_claimAutoreleasedReturnValue();
    -[NSObject identifier](v15, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 138543618;
    v34 = v16;
    v35 = 2112;
    v36 = v6;
    v17 = "    HSLS [assignSmartRotate]: Suggestion cannot smart rotate stack %{public}@ - smart rotate off; %@";
    goto LABEL_11;
  }
LABEL_14:
  v18 = 0;
LABEL_15:

  return v18;
}

- (BOOL)_hasEligibleWidgetSuggestionsStacksForSuggestion:(id)a3 onPages:(id)a4 ignoreDuplicatesInSGWidget:(BOOL)a5 ignoreDuplicatesInPanels:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  BOOL v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  ATXWidgetSuggestionsDenyList *v32;
  ATXWidgetSuggestionsDenyList *widgetSuggestionDenyList;
  NSObject *v34;
  const char *v35;
  int64_t thresholdConfidenceForSuggestedSG;
  ATXWidgetSuggestionDismissManager *widgetDismissManager;
  uint64_t v38;
  void *v39;
  void *v41;
  const __CFString *v42;
  const __CFString *v43;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t i;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t j;
  id v65;
  void *v66;
  _BOOL4 v67;
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
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  _BYTE v85[128];
  uint8_t v86[128];
  uint8_t buf[4];
  NSObject *v88;
  _BYTE v89[128];
  uint64_t v90;

  v67 = a6;
  v6 = a5;
  v90 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (!-[ATXSuggestionModeFilter currentModeConfigurationAllowsSuggestion:](self->_modeFilter, "currentModeConfigurationAllowsSuggestion:", v9))goto LABEL_27;
  objc_msgSend(v9, "executableSpecification");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "executableType");

  objc_msgSend(v9, "scoreSpecification");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suggestedConfidenceCategory");
  if (v12 != 3)
  {
    thresholdConfidenceForSuggestedSG = self->_thresholdConfidenceForSuggestedSG;

    if (v14 >= thresholdConfidenceForSuggestedSG
      && -[ATXHomeScreenLayoutSelector2 _shouldConsiderSuggestionForSuggestionsWidget:](self, "_shouldConsiderSuggestionForSuggestionsWidget:", v9))
    {
      widgetDismissManager = self->_widgetDismissManager;
      v38 = *MEMORY[0x1E0CF9480];
      ATXSpecialWidgetKindSiriSuggestions();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(widgetDismissManager) = -[ATXWidgetSuggestionDismissManager shouldBlockWidgetSuggestionBecauseOfPreviousDismiss:kind:intent:](widgetDismissManager, "shouldBlockWidgetSuggestionBecauseOfPreviousDismiss:kind:intent:", v38, v39, 0);

      if ((_DWORD)widgetDismissManager)
      {
        __atxlog_handle_blending();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C9A3B000, v20, OS_LOG_TYPE_DEFAULT, "HSLS: considered suggestion for suggestions widget but the widget has been dismissed", buf, 2u);
        }
        goto LABEL_77;
      }
LABEL_42:
      v78 = 0u;
      v79 = 0u;
      v76 = 0u;
      v77 = 0u;
      v65 = v10;
      v20 = v10;
      v48 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v76, v86, 16);
      if (!v48)
      {
LABEL_55:

        v74 = 0u;
        v75 = 0u;
        v72 = 0u;
        v73 = 0u;
        v20 = v20;
        v55 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
        if (v55)
        {
          v56 = v55;
          v57 = *(_QWORD *)v73;
          do
          {
            for (i = 0; i != v56; ++i)
            {
              if (*(_QWORD *)v73 != v57)
                objc_enumerationMutation(v20);
              v59 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
              v68 = 0u;
              v69 = 0u;
              v70 = 0u;
              v71 = 0u;
              objc_msgSend(v59, "stacks", v65);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
              if (v61)
              {
                v62 = v61;
                v63 = *(_QWORD *)v69;
                while (2)
                {
                  for (j = 0; j != v62; ++j)
                  {
                    if (*(_QWORD *)v69 != v63)
                      objc_enumerationMutation(v60);
                    if (-[ATXHomeScreenLayoutSelector2 _isStack:eligibleToShowSuggestionViaWidgetSuggestion:](self, "_isStack:eligibleToShowSuggestionViaWidgetSuggestion:", *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * j), v9))
                    {

                      v19 = 1;
                      goto LABEL_31;
                    }
                  }
                  v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
                  if (v62)
                    continue;
                  break;
                }
              }

            }
            v56 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
          }
          while (v56);
        }
LABEL_30:
        v19 = 0;
LABEL_31:
        v10 = v65;
        goto LABEL_78;
      }
      v49 = v48;
      v50 = *(_QWORD *)v77;
LABEL_44:
      v51 = 0;
      while (1)
      {
        if (*(_QWORD *)v77 != v50)
          objc_enumerationMutation(v20);
        v52 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v51);
        objc_msgSend(v9, "executableSpecification", v65);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v53, "executableType") != 1)
          break;
        v54 = objc_msgSend(v52, "isSeldomVisited");

        if (!v54)
          goto LABEL_52;
        if ((objc_msgSend(v52, "suggestionsWidgetOnPageIsShowingDuplicatedContentForSuggestion:", v9) & 1) != 0)
          goto LABEL_30;
LABEL_53:
        if (v49 == ++v51)
        {
          v49 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v76, v86, 16);
          if (!v49)
            goto LABEL_55;
          goto LABEL_44;
        }
      }

LABEL_52:
      if ((objc_msgSend(v52, "isShowingDuplicatedContentForSuggestion:considerUnderStackContents:dedupeAppSuggestionsByWidgets:ignoreDuplicatesInSGWidget:ignoreDuplicatesInPanels:", v9, 1, 1, v6, v67) & 1) != 0)goto LABEL_30;
      goto LABEL_53;
    }
    goto LABEL_27;
  }

  if (v14 < 3)
  {
LABEL_27:
    v19 = 0;
    goto LABEL_28;
  }
  v15 = (void *)MEMORY[0x1E0D81198];
  objc_msgSend(v9, "clientModelSpecification");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "clientModelId");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v15, "clientModelTypeFromClientModelId:", v17);

  v19 = 0;
  if (v18 <= 0x2F && ((1 << v18) & 0x800000141114) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D81150], "infoSuggestionFromProactiveSuggestion:", v9);
    v20 = objc_claimAutoreleasedReturnValue();
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v65 = v10;
    v21 = v10;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v80, v89, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v81;
LABEL_8:
      v25 = 0;
      while (1)
      {
        if (*(_QWORD *)v81 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * v25);
        -[NSObject appBundleIdentifier](v20, "appBundleIdentifier", v65);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v26) = objc_msgSend(v26, "containsSuggestedWidgetForApp:", v27);

        if ((v26 & 1) != 0)
          break;
        if (v23 == ++v25)
        {
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v80, v89, 16);
          if (!v23)
            goto LABEL_14;
          goto LABEL_8;
        }
      }

      goto LABEL_30;
    }
LABEL_14:

    v28 = objc_alloc(MEMORY[0x1E0D14520]);
    -[NSObject widgetBundleIdentifier](v20, "widgetBundleIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject appBundleIdentifier](v20, "appBundleIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v28, "initWithExtensionBundleIdentifier:containerBundleIdentifier:", v29, v30);

    if (objc_msgSend(v31, "widgetWantsLocation")
      && (objc_msgSend(v31, "isContainerAuthorizedForWidgetUpdates") & 1) == 0)
    {
      __atxlog_handle_blending();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v88 = v20;
        v35 = "HSLS: The widget wants location but its container is not authorized for widget updates: %@";
        goto LABEL_38;
      }
LABEL_39:
      v10 = v65;

LABEL_76:
LABEL_77:
      v19 = 0;
LABEL_78:

      goto LABEL_28;
    }
    if (!self->_widgetSuggestionDenyList)
    {
      v32 = (ATXWidgetSuggestionsDenyList *)objc_opt_new();
      widgetSuggestionDenyList = self->_widgetSuggestionDenyList;
      self->_widgetSuggestionDenyList = v32;

    }
    if (v20
      && -[ATXWidgetSuggestionsDenyList containsInfoSuggestion:](self->_widgetSuggestionDenyList, "containsInfoSuggestion:", v20))
    {
      __atxlog_handle_blending();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v88 = v20;
        v35 = "HSLS: The info suggestion is on the Widget Suggestions deny list: %@";
LABEL_38:
        _os_log_impl(&dword_1C9A3B000, v34, OS_LOG_TYPE_DEFAULT, v35, buf, 0xCu);
        goto LABEL_39;
      }
      goto LABEL_39;
    }
    -[NSObject appBundleIdentifier](v20, "appBundleIdentifier", v65);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v66;
    if (objc_msgSend(v41, "length"))
    {
      v42 = (const __CFString *)*MEMORY[0x1E0C9B260];
      v43 = (const __CFString *)*MEMORY[0x1E0C9B230];
      v44 = v41;
      v45 = (void *)CFPreferencesCopyValue(CFSTR("SBSearchDisabledShortcuts"), CFSTR("com.apple.spotlightui"), v42, v43);
      LODWORD(v42) = objc_msgSend(v45, "containsObject:", v44);

      if ((_DWORD)v42)
      {
        __atxlog_handle_blending();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v88 = v44;
          v47 = "HSLS: 'Show on Home Screen' is off for %@";
LABEL_74:
          _os_log_impl(&dword_1C9A3B000, v46, OS_LOG_TYPE_DEFAULT, v47, buf, 0xCu);
          goto LABEL_75;
        }
        goto LABEL_75;
      }
      if (!-[ATXHomeScreenLayoutSelector2 _isBackgroundAppRefreshAllowedForAppBundleId:](self, "_isBackgroundAppRefreshAllowedForAppBundleId:", v44))
      {
        __atxlog_handle_blending();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v88 = v44;
          v47 = "HSLS: background app refresh is off for %@";
          goto LABEL_74;
        }
LABEL_75:

        goto LABEL_76;
      }
    }

    goto LABEL_42;
  }
LABEL_28:

  return v19;
}

- (BOOL)_isStack:(id)a3 eligibleToShowSuggestionViaWidgetSuggestion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  ATXWidgetDescriptorCache *descriptorCache;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  const char *v22;
  void *v23;
  uint64_t v24;
  BOOL v25;
  int v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "config");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "allowsNewWidget");

  if (!v9)
    goto LABEL_19;
  objc_msgSend(v6, "page");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isSeldomVisited");

  if ((v11 & 1) != 0)
    goto LABEL_19;
  objc_msgSend(v7, "executableSpecification");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "executableType");

  if (v13 != 3)
  {
    objc_msgSend(v6, "config");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "stackLayoutSize");

    if (v24 != 4)
      goto LABEL_11;
LABEL_19:
    v25 = 0;
    goto LABEL_20;
  }
  if (!objc_msgSend(v6, "sizeIsCompatibleWithWidgetSuggestion:", v7))
    goto LABEL_19;
  objc_msgSend(v7, "atxInfoSuggestionExecutableObject");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    __atxlog_handle_blending();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 138412546;
      v28 = v6;
      v29 = 2112;
      v30 = v7;
      _os_log_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_DEFAULT, "HSLS: stack ineligible to show widget suggestion, no info suggestion: stack: %@, suggestion: %@", (uint8_t *)&v27, 0x16u);
    }
    goto LABEL_18;
  }
  v15 = v14;
  descriptorCache = self->_descriptorCache;
  -[NSObject widgetBundleIdentifier](v14, "widgetBundleIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject widgetKind](v15, "widgetKind");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXWidgetDescriptorCache homeScreenDescriptorForExtensionBundleId:kind:](descriptorCache, "homeScreenDescriptorForExtensionBundleId:kind:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    __atxlog_handle_blending();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 138412546;
      v28 = v6;
      v29 = 2112;
      v30 = v7;
      v22 = "HSLS: stack ineligible to show widget suggestion, descriptor not found: stack: %@, suggestion: %@";
      goto LABEL_16;
    }
LABEL_17:

LABEL_18:
    goto LABEL_19;
  }
  objc_msgSend(v6, "config");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stackLayoutSize");
  CHSWidgetFamilyFromATXStackLayoutSize();

  objc_msgSend(v19, "disfavoredFamiliesForLocation:", 0);
  if (CHSWidgetFamilyMaskContainsFamily())
  {
    __atxlog_handle_blending();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 138412546;
      v28 = v6;
      v29 = 2112;
      v30 = v7;
      v22 = "HSLS: stack ineligible to show widget suggestion, stack family is disfavored by widget: stack: %@, suggestion: %@";
LABEL_16:
      _os_log_impl(&dword_1C9A3B000, v21, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v27, 0x16u);
      goto LABEL_17;
    }
    goto LABEL_17;
  }

LABEL_11:
  v25 = 1;
LABEL_20:

  return v25;
}

- (BOOL)_shouldConsiderSuggestionForSuggestionsWidget:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  if (-[ATXBlendingLayerHyperParameters isSuggestionEligibleForSuggestionsWidget:](self->_hyperParameters, "isSuggestionEligibleForSuggestionsWidget:", v4))v5 = -[ATXEngagementRecordManager hasEngagedWithSuggestion:engagedExecutables:](self->_engagementRecordManager, "hasEngagedWithSuggestion:engagedExecutables:", v4, self->_dismissedSuggestionsForSuggestionsWidget) ^ 1;
  else
    LOBYTE(v5) = 0;

  return v5;
}

- (BOOL)_shouldConsiderSuggestionForAppPredictionPanel:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  if (-[ATXBlendingLayerHyperParameters isSuggestionEligibleForAppPredictionPanel:](self->_hyperParameters, "isSuggestionEligibleForAppPredictionPanel:", v4))v5 = -[ATXEngagementRecordManager hasEngagedWithSuggestion:engagedExecutables:](self->_engagementRecordManager, "hasEngagedWithSuggestion:engagedExecutables:", v4, self->_dismissedSuggestionsForAppPredictionPanels) ^ 1;
  else
    LOBYTE(v5) = 0;

  return v5;
}

- (BOOL)_isBackgroundAppRefreshAllowedForAppBundleId:(id)a3
{
  id v3;
  dispatch_semaphore_t v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_time_t v8;
  intptr_t v9;
  NSObject *v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD v16[4];
  NSObject *v17;
  uint64_t *v18;
  uint64_t v19;
  _QWORD v20[2];
  char v21;

  v3 = a3;
  if (v3)
  {
    v4 = dispatch_semaphore_create(0);
    objc_msgSend(MEMORY[0x1E0D1D928], "sharedScheduler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v20[0] = &v19;
    v20[1] = 0x2020000000;
    v21 = 1;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __77__ATXHomeScreenLayoutSelector2__isBackgroundAppRefreshAllowedForAppBundleId___block_invoke;
    v16[3] = &unk_1E82DE0F8;
    v18 = &v19;
    v6 = v4;
    v17 = v6;
    objc_msgSend(v5, "backgroundAppRefreshEnabledForApp:withHandler:", v3, v16);
    v7 = v6;
    v8 = dispatch_time(0, 100000000);
    v9 = dispatch_semaphore_wait(v7, v8);

    if (v9)
    {
      __atxlog_handle_blending();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[ATXHomeScreenLayoutSelector2 _isBackgroundAppRefreshAllowedForAppBundleId:].cold.3();

      v11 = 1;
    }
    else
    {
      __atxlog_handle_blending();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[ATXHomeScreenLayoutSelector2 _isBackgroundAppRefreshAllowedForAppBundleId:].cold.2((uint64_t)v20, (uint64_t)v3, v14);

      v11 = *(_BYTE *)(v20[0] + 24) != 0;
    }

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    __atxlog_handle_blending();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[ATXHomeScreenLayoutSelector2 _isBackgroundAppRefreshAllowedForAppBundleId:].cold.1(v7, v12, v13);
    v11 = 1;
  }

  return v11;
}

intptr_t __77__ATXHomeScreenLayoutSelector2__isBackgroundAppRefreshAllowedForAppBundleId___block_invoke(uint64_t a1, char a2, char a3)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2 & a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (int64_t)_thresholdConfidenceForSuggestedSG
{
  int64_t v3;
  NSObject *v4;
  int v6;
  int64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (-[NSUserDefaults integerForKey:](self->_defaults, "integerForKey:", *MEMORY[0x1E0CF9570]) < 10
    || -[NSUserDefaults integerForKey:](self->_defaults, "integerForKey:", *MEMORY[0x1E0CF9578]))
  {
    if ((unint64_t)-[ATXWidgetSuggestionDismissManager userDismissCountForWidgetSuggestionWithBundleId:](self->_widgetDismissManager, "userDismissCountForWidgetSuggestionWithBundleId:", *MEMORY[0x1E0CF9480]) <= 1)v3 = 3;
    else
      v3 = 4;
  }
  else
  {
    v3 = 4;
  }
  __atxlog_handle_blending();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = v3;
    _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "HSLS: threshold confidence for suggested SG = %ld", (uint8_t *)&v6, 0xCu);
  }

  return v3;
}

- (BOOL)_shouldLimitWidgetSuggestionPowerCost
{
  BOOL v3;
  void *v5;
  double v6;
  double v7;
  double v8;

  if (self->_isiPad || (objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild") & 1) != 0)
    return 0;
  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", *MEMORY[0x1E0CF9588]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v7 = v6;
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    v3 = v7 - v8 < 604800.0;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_loadHomeScreenState:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  id v35;
  NSObject *v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _ATXHomeScreenState *v45;
  void *v47;
  void *v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  id v62;
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = v4;
  v47 = v6;
  if (!v6)
  {
    v62 = 0;
    objc_msgSend(v5, "loadHomeScreenAndTodayPageConfigurationsWithError:", &v62);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = v62;
    if (v7)
    {
      __atxlog_handle_blending();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[ATXHomeScreenLayoutSelector2 _loadHomeScreenState:].cold.4();

    }
    if (!v6)
    {
      __atxlog_handle_blending();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[ATXHomeScreenLayoutSelector2 _loadHomeScreenState:].cold.3(v9, v10, v11, v12, v13, v14, v15, v16);

      v6 = (id)MEMORY[0x1E0C9AA60];
    }

  }
  v48 = v5;
  -[ATXHomeScreenLayoutSelector2 _sortedPagesByMostRecentUserVisit:](self, "_sortedPagesByMostRecentUserVisit:", v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v18 = v17;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v59 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        objc_msgSend(v23, "stacks");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v55;
          do
          {
            for (j = 0; j != v26; ++j)
            {
              if (*(_QWORD *)v55 != v27)
                objc_enumerationMutation(v24);
              -[ATXHomeScreenLayoutSelector2 _logStackDetail:](self, "_logStackDetail:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * j));
            }
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
          }
          while (v26);
        }

        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        objc_msgSend(v23, "panels");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
        if (v30)
        {
          v31 = v30;
          v32 = *(_QWORD *)v51;
          do
          {
            for (k = 0; k != v31; ++k)
            {
              if (*(_QWORD *)v51 != v32)
                objc_enumerationMutation(v29);
              -[ATXHomeScreenLayoutSelector2 _logStackDetail:](self, "_logStackDetail:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * k));
            }
            v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
          }
          while (v31);
        }

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
    }
    while (v20);
  }

  v49 = 0;
  objc_msgSend(v48, "loadDockAppListWithError:", &v49);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v49;
  if (v35)
  {
    __atxlog_handle_blending();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      -[ATXHomeScreenLayoutSelector2 _loadHomeScreenState:].cold.2();

  }
  if (!v34)
  {
    __atxlog_handle_blending();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      -[ATXHomeScreenLayoutSelector2 _loadHomeScreenState:].cold.1(v37, v38, v39, v40, v41, v42, v43, v44);

    v34 = (void *)objc_opt_new();
  }
  v45 = -[_ATXHomeScreenState initWithSortedHomeScreenPagesByUserLastVisit:appsOnDock:stackStateTracker:suggestionDeduplicator:hyperParameters:]([_ATXHomeScreenState alloc], "initWithSortedHomeScreenPagesByUserLastVisit:appsOnDock:stackStateTracker:suggestionDeduplicator:hyperParameters:", v18, v34, self->_stackStateTracker, self->_suggestionDeduplicator, self->_hyperParameters);

  return v45;
}

- (void)_logStackDetail:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  _BYTE v29[10];
  _QWORD v30[5];

  *(_QWORD *)((char *)&v30[2] + 6) = *MEMORY[0x1E0C80C00];
  v3 = a3;
  __atxlog_handle_blending();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "page");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v25 = v5;
    v26 = 2048;
    v27 = objc_msgSend(v6, "pageIndex");
    v28 = 1024;
    *(_DWORD *)v29 = objc_msgSend(v3, "allowsSmartRotate");
    *(_WORD *)&v29[4] = 1024;
    *(_DWORD *)&v29[6] = objc_msgSend(v3, "allowsNewWidget");
    LOWORD(v30[0]) = 2048;
    *(_QWORD *)((char *)v30 + 2) = objc_msgSend(v3, "stackLayoutSize");
    _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "HSLS [loadHSState]: stack %{public}@ page=%lu rotatation=%d N+1=%d size=%lu widgets:", buf, 0x2Cu);

  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v18 = v3;
  objc_msgSend(v3, "widgets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        __atxlog_handle_blending();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v12, "widgetUniqueId");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "extensionBundleId");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "widgetKind");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "intent");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v25 = v14;
          v26 = 2112;
          v27 = (uint64_t)v15;
          v28 = 2112;
          *(_QWORD *)v29 = v16;
          *(_WORD *)&v29[8] = 2112;
          v30[0] = v17;
          _os_log_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_DEFAULT, "  HSLS [loadHSState]: %@ : %@ : %@ : %@", buf, 0x2Au);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

}

- (id)_sortedPagesByMostRecentUserVisit:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id obj;
  _QWORD v21[4];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        -[ATXStackStateTracker lastThreeUserVisitDatesOfPage:](self->_stackStateTracker, "lastThreeUserVisitDatesOfPage:", objc_msgSend(v10, "pageIndex"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          v14 = v12;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
          v14 = (id)objc_claimAutoreleasedReturnValue();
        }
        v15 = v14;

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "pageIndex"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, v16);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v7);
  }

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __66__ATXHomeScreenLayoutSelector2__sortedPagesByMostRecentUserVisit___block_invoke;
  v21[3] = &unk_1E82DE120;
  v22 = v5;
  v17 = v5;
  objc_msgSend(obj, "sortedArrayUsingComparator:", v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

uint64_t __66__ATXHomeScreenLayoutSelector2__sortedPagesByMostRecentUserVisit___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v5 = *(void **)(a1 + 32);
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(a2, "pageIndex"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *(void **)(a1 + 32);
  v11 = (void *)MEMORY[0x1E0CB37E8];
  v12 = objc_msgSend(v7, "pageIndex");

  objc_msgSend(v11, "numberWithUnsignedInteger:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "compare:", v9);
  return v15;
}

- (id)_homeScreenCachedSuggestionsFromHomeScreenState:(id)a3 sortedFallbackSuggestions:(id)a4 suggestionsWidgetPreviews:(id)a5 appPredictionPanelPreview:(id)a6 withUUID:(id)a7
{
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t k;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v56;
  id v57;
  id v58;
  void *v59;
  id obj;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v58 = a4;
  v56 = a5;
  v57 = a6;
  v13 = a7;
  v72 = (void *)objc_opt_new();
  v66 = (void *)objc_opt_new();
  v65 = (void *)objc_opt_new();
  v67 = (void *)objc_opt_new();
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v59 = v12;
  objc_msgSend(v12, "sortedPagesByUserLastVisit");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
  if (v62)
  {
    v61 = *(_QWORD *)v90;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v90 != v61)
          objc_enumerationMutation(obj);
        v63 = v14;
        v15 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * v14);
        v85 = 0u;
        v86 = 0u;
        v87 = 0u;
        v88 = 0u;
        objc_msgSend(v15, "stacks");
        v64 = (id)objc_claimAutoreleasedReturnValue();
        v69 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v85, v96, 16);
        if (v69)
        {
          v68 = *(_QWORD *)v86;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v86 != v68)
                objc_enumerationMutation(v64);
              v71 = v16;
              v17 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * v16);
              objc_msgSend(v17, "topOfStackSuggestion");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              -[ATXHomeScreenLayoutSelector2 _processedSuggestionLayoutFromWidgetSuggestion:stack:blendingUpdateUUID:](self, "_processedSuggestionLayoutFromWidgetSuggestion:stack:blendingUpdateUUID:", v18, v17, v13);
              v19 = objc_claimAutoreleasedReturnValue();

              if (v19)
              {
                objc_msgSend(v17, "config");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = objc_msgSend(v20, "isAppPredictionPanel");

                objc_msgSend(v17, "config");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "identifier");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                if (v21)
                  v24 = v66;
                else
                  v24 = v65;
                objc_msgSend(v24, "setObject:forKeyedSubscript:", v19, v23);

              }
              v70 = (void *)v19;
              v83 = 0u;
              v84 = 0u;
              v81 = 0u;
              v82 = 0u;
              objc_msgSend(v17, "suggestionsWidgetSuggestionsByWidgetUniqueId");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "allValues");
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v81, v95, 16);
              if (v27)
              {
                v28 = v27;
                v29 = *(_QWORD *)v82;
                do
                {
                  for (i = 0; i != v28; ++i)
                  {
                    if (*(_QWORD *)v82 != v29)
                      objc_enumerationMutation(v26);
                    v31 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
                    -[ATXHomeScreenLayoutSelector2 _processedSuggestionLayoutFromWidgetSuggestion:stack:blendingUpdateUUID:](self, "_processedSuggestionLayoutFromWidgetSuggestion:stack:blendingUpdateUUID:", v31, v17, v13);
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v32)
                    {
                      objc_msgSend(v31, "widget");
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v33, "widgetUniqueId");
                      v34 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v72, "setObject:forKeyedSubscript:", v32, v34);

                    }
                  }
                  v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v81, v95, 16);
                }
                while (v28);
              }

              v35 = (void *)objc_opt_new();
              v77 = 0u;
              v78 = 0u;
              v79 = 0u;
              v80 = 0u;
              objc_msgSend(v17, "suggestedWidgets");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v77, v94, 16);
              if (v37)
              {
                v38 = v37;
                v39 = *(_QWORD *)v78;
                do
                {
                  for (j = 0; j != v38; ++j)
                  {
                    if (*(_QWORD *)v78 != v39)
                      objc_enumerationMutation(v36);
                    -[ATXHomeScreenLayoutSelector2 _processedSuggestionLayoutFromWidgetSuggestion:stack:blendingUpdateUUID:](self, "_processedSuggestionLayoutFromWidgetSuggestion:stack:blendingUpdateUUID:", *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * j), v17, v13);
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v41)
                      objc_msgSend(v35, "addObject:", v41);

                  }
                  v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v77, v94, 16);
                }
                while (v38);
              }

              objc_msgSend(v17, "config");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "identifier");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "setObject:forKeyedSubscript:", v35, v43);

              v16 = v71 + 1;
            }
            while (v71 + 1 != v69);
            v69 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v85, v96, 16);
          }
          while (v69);
        }

        v14 = v63 + 1;
      }
      while (v63 + 1 != v62);
      v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
    }
    while (v62);
  }

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v44 = v56;
  v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v73, v93, 16);
  if (v45)
  {
    v46 = v45;
    v47 = *(_QWORD *)v74;
    do
    {
      for (k = 0; k != v46; ++k)
      {
        if (*(_QWORD *)v74 != v47)
          objc_enumerationMutation(v44);
        v49 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * k);
        -[ATXHomeScreenLayoutSelector2 _processedSuggestionLayoutFromWidgetSuggestion:stack:blendingUpdateUUID:](self, "_processedSuggestionLayoutFromWidgetSuggestion:stack:blendingUpdateUUID:", v49, 0, v13);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        if (v50)
        {
          objc_msgSend(v49, "widget");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "widgetUniqueId");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "setObject:forKeyedSubscript:", v50, v52);

        }
      }
      v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v73, v93, 16);
    }
    while (v46);
  }

  -[ATXHomeScreenLayoutSelector2 _processedSuggestionLayoutFromWidgetSuggestion:stack:blendingUpdateUUID:](self, "_processedSuggestionLayoutFromWidgetSuggestion:stack:blendingUpdateUUID:", v57, 0, v13);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (v53)
    objc_msgSend(v66, "setObject:forKeyedSubscript:", v53, *MEMORY[0x1E0CF9390]);
  v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81148]), "initWithUUID:suggestionWidgetLayouts:appPredictionPanelLayouts:topOfStackLayouts:suggestedWidgetLayouts:fallbackSuggestions:", v13, v72, v66, v65, v67, v58);

  return v54;
}

- (id)_processedSuggestionLayoutFromWidgetSuggestion:(id)a3 stack:(id)a4 blendingUpdateUUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "suggestionLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v8, "suggestionLayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "widget");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mainSuggestionInLayout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scoreSpecification");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "suggestedConfidenceCategory");

    objc_msgSend(v11, "setUuid:", v10);
    objc_msgSend(v8, "mainSuggestionInLayout");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setUuidOfHighestConfidenceSuggestion:", v17);

    objc_msgSend(v12, "extensionBundleId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0CF9480]))
    {
      objc_msgSend(v11, "setIsValidForSuggestionsWidget:", 1);
    }
    else
    {
      objc_msgSend(v12, "extensionBundleId");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setIsValidForSuggestionsWidget:", objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0CF89A8]));

    }
    objc_msgSend(v12, "widgetUniqueId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWidgetUniqueId:", v20);

    objc_msgSend(v11, "setIsLowConfidenceStackRotationForStaleStack:", v15 < 3);
    objc_msgSend(v9, "config");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "widgets");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setNumWidgetsInStack:", objc_msgSend(v22, "count"));

    -[ATXHomeScreenLayoutSelector2 _computeScoreForLayout:](self, "_computeScoreForLayout:", v11);
    objc_msgSend(v11, "setLayoutScore:");
    objc_msgSend(v9, "suggestedWidgets");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setIsNPlusOne:", objc_msgSend(v23, "containsObject:", v8));

  }
  return v11;
}

- (double)_computeScoreForLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  unint64_t v33;
  void *v34;
  uint64_t v35;
  unint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  unint64_t v42;
  void *v43;
  uint64_t v44;
  unint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  void *v50;
  unint64_t v51;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D81220], "minSuggestionLayoutTypesForUILayoutType:", objc_msgSend(v4, "layoutType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E83CC0B8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  if (v7)
  {
    v8 = 0;
    v9 = 0.0;
    do
    {
      objc_msgSend(v4, "oneByOneSuggestions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "scoreSpecification");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXHomeScreenLayoutSelector2 _weightForConfidenceCategory:](self, "_weightForConfidenceCategory:", objc_msgSend(v12, "suggestedConfidenceCategory"));
      v9 = v9 + v13;

      ++v8;
      objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E83CC0B8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "unsignedIntegerValue");

    }
    while (v8 < v15);
  }
  else
  {
    v9 = 0.0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E83CC0D0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "unsignedIntegerValue");

  if (v17)
  {
    v18 = 0;
    do
    {
      objc_msgSend(v4, "oneByTwoSuggestions");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectAtIndexedSubscript:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "scoreSpecification");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXHomeScreenLayoutSelector2 _weightForConfidenceCategory:](self, "_weightForConfidenceCategory:", objc_msgSend(v21, "suggestedConfidenceCategory"));
      v9 = v9 + v22;

      ++v18;
      objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E83CC0D0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "unsignedIntegerValue");

    }
    while (v18 < v24);
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E83CC0E8);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "unsignedIntegerValue");

  if (v26)
  {
    v27 = 0;
    do
    {
      objc_msgSend(v4, "twoByTwoSuggestions");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectAtIndexedSubscript:", v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v29, "scoreSpecification");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXHomeScreenLayoutSelector2 _weightForConfidenceCategory:](self, "_weightForConfidenceCategory:", objc_msgSend(v30, "suggestedConfidenceCategory"));
      v9 = v9 + v31;

      ++v27;
      objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E83CC0E8);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "unsignedIntegerValue");

    }
    while (v27 < v33);
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E83CC100);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "unsignedIntegerValue");

  if (v35)
  {
    v36 = 0;
    do
    {
      objc_msgSend(v4, "oneByFourSuggestions");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "objectAtIndexedSubscript:", v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v38, "scoreSpecification");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXHomeScreenLayoutSelector2 _weightForConfidenceCategory:](self, "_weightForConfidenceCategory:", objc_msgSend(v39, "suggestedConfidenceCategory"));
      v9 = v9 + v40;

      ++v36;
      objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E83CC100);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "unsignedIntegerValue");

    }
    while (v36 < v42);
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E83CC118);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "unsignedIntegerValue");

  if (v44)
  {
    v45 = 0;
    do
    {
      objc_msgSend(v4, "twoByFourSuggestions");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "objectAtIndexedSubscript:", v45);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v47, "scoreSpecification");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXHomeScreenLayoutSelector2 _weightForConfidenceCategory:](self, "_weightForConfidenceCategory:", objc_msgSend(v48, "suggestedConfidenceCategory"));
      v9 = v9 + v49;

      ++v45;
      objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E83CC118);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v50, "unsignedIntegerValue");

    }
    while (v45 < v51);
  }

  return v9;
}

- (double)_weightForConfidenceCategory:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return 100.0;
  else
    return dbl_1C9E7EE28[a3];
}

- (BOOL)_isStackStale:(id)a3
{
  return objc_msgSend(a3, "isStale");
}

- (NSDictionary)widgetSuggestionReloadBudgetByStackId
{
  return (NSDictionary *)objc_getProperty(self, a2, 176, 1);
}

- (void)setWidgetSuggestionReloadBudgetByStackId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (BOOL)hasAskedChronoAboutReloadBudget
{
  return self->_hasAskedChronoAboutReloadBudget;
}

- (void)setHasAskedChronoAboutReloadBudget:(BOOL)a3
{
  self->_hasAskedChronoAboutReloadBudget = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetSuggestionReloadBudgetByStackId, 0);
  objc_storeStrong((id *)&self->_dismissedSuggestionsForAppPredictionPanels, 0);
  objc_storeStrong((id *)&self->_dismissedSuggestionsForSuggestionsWidget, 0);
  objc_storeStrong((id *)&self->_widgetSuggestionDenyList, 0);
  objc_storeStrong((id *)&self->_timelineRelevanceFilter, 0);
  objc_storeStrong((id *)&self->_descriptorCache, 0);
  objc_storeStrong((id *)&self->_chronoService, 0);
  objc_storeStrong((id *)&self->_modeFilter, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_stackStateTracker, 0);
  objc_storeStrong((id *)&self->_widgetDismissManager, 0);
  objc_storeStrong((id *)&self->_engagementRecordManager, 0);
  objc_storeStrong((id *)&self->_suggestionDeduplicator, 0);
  objc_storeStrong((id *)&self->_hyperParameters, 0);
  objc_storeStrong((id *)&self->_homeScreenPageConfigs, 0);
}

- (void)_assignUnfilledSGWidgetForPage:(uint64_t)a1 suggestions:(uint64_t)a2 homeScreenState:.cold.1(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  _QWORD *v3;
  uint8_t *v4;
  void *v5;
  void *v6;

  objc_msgSend((id)OUTLINED_FUNCTION_2_2(a1, a2), "widget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "widgetUniqueId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)v4 = 138412290;
  *v3 = v6;
  OUTLINED_FUNCTION_3_7(&dword_1C9A3B000, v2, OS_LOG_TYPE_ERROR, "  HSLS [assignUnfilledSG]: Not enough suggestions to fill layouts of SW %@", v4);

  OUTLINED_FUNCTION_8_0();
}

- (void)_fillSuggestedSGWidgetIfLayoutNotComplete:(void *)a1 withSuggestions:(NSObject *)a2 updatingUsedSuggestionIndexSet:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "widget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "widgetUniqueId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9_0(&dword_1C9A3B000, a2, v5, "HSLS [fillIncompleteSuggestedSG]: unable to fill layout for suggested SG widget %{public}@", v6);

  OUTLINED_FUNCTION_1_1();
}

void __121__ATXHomeScreenLayoutSelector2__fillSuggestedSGWidgetIfLayoutNotComplete_withSuggestions_updatingUsedSuggestionIndexSet___block_invoke_cold_1(id *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(*a1, "widget");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "widgetUniqueId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0_6(&dword_1C9A3B000, v3, v4, "HSLS [fillIncompleteSuggestedSG]: Failure to add suggestion to existing suggested SG widget %{public}@, suggestion %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_1();
}

void __114__ATXHomeScreenLayoutSelector2__assignExistingSuggestedSGWidgetsOnPages_withSuggestions_suggestionToRankingIndex___block_invoke_2_cold_1(id *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(*a1, "widget");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "widgetUniqueId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0_6(&dword_1C9A3B000, v3, v4, "HSLS [assignExistingSuggestedSG]: Failure to add suggestion to existing suggested SG widget %{public}@, suggestion %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_1();
}

- (void)_stackHasRemainingReloadBudgetForWidgetSuggestion:(uint64_t)a3 homeScreenState:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4();
}

void __98__ATXHomeScreenLayoutSelector2__stackHasRemainingReloadBudgetForWidgetSuggestion_homeScreenState___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0();
}

- (void)_suggestionsWidgetPreviewsFromRankedSuggestions:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  _QWORD *v3;
  uint8_t *v4;
  void *v5;
  void *v6;

  objc_msgSend((id)OUTLINED_FUNCTION_2_2(a1, a2), "widget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "widgetUniqueId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)v4 = 138412290;
  *v3 = v6;
  OUTLINED_FUNCTION_3_7(&dword_1C9A3B000, v2, OS_LOG_TYPE_ERROR, "HSLS [SWPreviewGeneration]: Not enough suggestion to generate preview %@", v4);

  OUTLINED_FUNCTION_8_0();
}

- (void)_appPredictionPanelPreviewFromRankedSuggestions:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "widget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "widgetUniqueId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_7(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "HSLS [APPPreviewGeneration]: Not enough suggestion to generate preview %@", v5);

  OUTLINED_FUNCTION_1_1();
}

- (void)_isBackgroundAppRefreshAllowedForAppBundleId:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = 0;
  OUTLINED_FUNCTION_9_0(&dword_1C9A3B000, a1, a3, "HSLS: Attempting to consider suggestion with no app bundle identifier: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

- (void)_isBackgroundAppRefreshAllowedForAppBundleId:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  _DWORD v4[2];
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *(unsigned __int8 *)(*(_QWORD *)a1 + 24);
  v4[0] = 67109378;
  v4[1] = v3;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_DEBUG, "HSLS: Background app refresh is allowed %{BOOL}d for %@", (uint8_t *)v4, 0x12u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_isBackgroundAppRefreshAllowedForAppBundleId:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "HSLS: Attempting to query background app refresh state but the request timed out; assuming YES for %@",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_loadHomeScreenState:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, a1, a3, "HSLS [loadHSState]: Found nil dock apps", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)_loadHomeScreenState:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "HSLS [loadHSState]: Error loading dock apps - %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_loadHomeScreenState:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, a1, a3, "HSLS [loadHSState]: Found nil HomeScreenConfigs", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)_loadHomeScreenState:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "HSLS [loadHSState]: Error loading HomeScreenConfigs - %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
