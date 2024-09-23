@implementation ATXActionBlendingUpdater

+ (id)clientModelIdForConsumerSubType:(unsigned __int8)a3
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v5 = a3;
  v6 = 0;
  if ((int)a3 > 37)
  {
    if (a3 == 46)
    {
      v7 = 48;
    }
    else
    {
      if (a3 != 38)
        return v6;
      v7 = 7;
    }
LABEL_9:
    objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", v7, v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    return v6;
  }
  v7 = 6;
  if ((v5 - 18) < 4 || v5 == 16)
    goto LABEL_9;
  return v6;
}

+ (void)updateBlendingLayerWithRecentShortcuts:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D81198]);
  +[ATXClientModelSuggestionReceiver sharedInstance](ATXClientModelSuggestionReceiver, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "blendingLayerServer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithClientModelId:blendingLayerServer:", v3, v6);

  objc_msgSend(v7, "updateSuggestions:", v8);
}

+ (void)updateBlendingLayerWithBehavioralPredictions:(id)a3 feedbackMetadata:(id)a4 consumerSubType:(unsigned __int8)a5
{
  uint64_t v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  char v19;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXActionBlendingUpdater clientModelIdForConsumerSubType:](ATXActionBlendingUpdater, "clientModelIdForConsumerSubType:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v9, "actionPredictionBlendingModelVersion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc(MEMORY[0x1E0D81198]);
    +[ATXClientModelSuggestionReceiver sharedInstance](ATXClientModelSuggestionReceiver, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "blendingLayerServer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v12, "initWithClientModelId:blendingLayerServer:", v10, v14);

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811A0]), "initWithClientModelId:clientModelVersion:engagementResetPolicy:", v10, v11, 0);
    +[ATXProactiveSuggestionBuilder proactiveSuggestionsFromActionResults:clientModelSpec:](ATXProactiveSuggestionBuilder, "proactiveSuggestionsFromActionResults:clientModelSpec:", v7, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __106__ATXActionBlendingUpdater_updateBlendingLayerWithBehavioralPredictions_feedbackMetadata_consumerSubType___block_invoke;
    v18[3] = &__block_descriptor_33_e20_v20__0B8__NSError_12l;
    v19 = v5;
    objc_msgSend(v15, "updateSuggestions:feedbackMetadata:completionHandler:", v17, v8, v18);

  }
}

void __106__ATXActionBlendingUpdater_updateBlendingLayerWithBehavioralPredictions_feedbackMetadata_consumerSubType___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    __atxlog_handle_default();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", *(unsigned __int8 *)(a1 + 32));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "Successfully updated blending for %@", (uint8_t *)&v9, 0xCu);

    }
  }
  else
  {
    __atxlog_handle_default();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", *(unsigned __int8 *)(a1 + 32));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      __106__ATXActionBlendingUpdater_updateBlendingLayerWithBehavioralPredictions_feedbackMetadata_consumerSubType___block_invoke_cold_1(v8, (uint64_t)v5, (uint8_t *)&v9, v6);
    }
  }

}

+ (void)updateBlendingLayerWithHeuristicPredictions:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "heuristicPredictionBlendingModelVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0D81198]);
  +[ATXClientModelSuggestionReceiver sharedInstance](ATXClientModelSuggestionReceiver, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "blendingLayerServer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithClientModelId:blendingLayerServer:", v4, v8);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811A0]), "initWithClientModelId:clientModelVersion:engagementResetPolicy:", v4, v5, 1);
  +[ATXProactiveSuggestionBuilder proactiveSuggestionsFromHeuristicActionResults:clientModelSpec:](ATXProactiveSuggestionBuilder, "proactiveSuggestionsFromHeuristicActionResults:clientModelSpec:", v12, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateSuggestions:", v11);

}

+ (void)updateBlendingLayerWithFallbackActions
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 10);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc(MEMORY[0x1E0D81198]);
  +[ATXClientModelSuggestionReceiver sharedInstance](ATXClientModelSuggestionReceiver, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "blendingLayerServer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v2, "initWithClientModelId:blendingLayerServer:", v25, v4);

  objc_msgSend(v26, "actionFallbacksBlendingModelVersion");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811A0]), "initWithClientModelId:clientModelVersion:engagementResetPolicy:", v25, v23, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8E30]), "initWithClientModelSpec:", v24);
  v6 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v26, "penalizedFallbackActions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v29 = (void *)objc_opt_new();
  objc_msgSend(v26, "enabledFallbackActions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(v8);
        v12 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v5, "suggestionforSpecifiedFallbackActionType:", objc_msgSend(MEMORY[0x1E0CF8E30], "fallbackActionTypeForString:", v12, v22));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          objc_msgSend(v13, "executableSpecification");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "executableObject");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "actionKey");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "generateScoreForFallbackActionKey:fallbackAction:penalizedFallbackActions:", v17, v12, v28);
          v19 = v18;
          objc_msgSend(v14, "scoreSpecification");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setRawScore:", v19);

          objc_msgSend(v29, "addObject:", v14);
        }

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v9);
  }

  objc_msgSend(v29, "sortUsingComparator:", &__block_literal_global_247);
  v21 = (void *)objc_msgSend(v29, "copy");
  objc_msgSend(v22, "updateSuggestions:", v21);

}

uint64_t __66__ATXActionBlendingUpdater_updateBlendingLayerWithFallbackActions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a2;
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a3, "scoreSpecification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rawScore");
  objc_msgSend(v5, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "scoreSpecification");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rawScore");
  objc_msgSend(v8, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "compare:", v10);

  return v11;
}

+ (double)generateScoreForFallbackActionKey:(id)a3 fallbackAction:(id)a4 penalizedFallbackActions:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXAppLaunchHistogramManager sharedInstance](_ATXAppLaunchHistogramManager, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "histogramForLaunchType:", 90);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "histogramForLaunchType:", 91);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "totalLaunchesForBundleIds:", v14);
  v16 = v15;

  v26 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "totalLaunchesForBundleIds:", v17);
  v19 = v18;

  objc_msgSend(v12, "totalLaunches");
  v21 = v20;
  objc_msgSend(v13, "totalLaunches");
  +[_ATXActionUtils computeNormalizedBetaDistEngagementScoreWithPriorAlpha:priorBeta:confirms:rejects:totalConfirms:totalRejects:](_ATXActionUtils, "computeNormalizedBetaDistEngagementScoreWithPriorAlpha:priorBeta:confirms:rejects:totalConfirms:totalRejects:", objc_msgSend(v10, "fallbackActionsEngagementPriorAlpha"), objc_msgSend(v10, "fallbackActionsEngagementPriorBeta"), v16, v19, v21, v22);
  v24 = v23;
  if (objc_msgSend(v9, "containsObject:", v8))
    v24 = v24 + -10000.0;

  return v24;
}

+ (void)updateBlendingLayerWithLockscreenActions:(id)a3 feedbackMetadata:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0D81198]);
  +[ATXClientModelSuggestionReceiver sharedInstance](ATXClientModelSuggestionReceiver, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "blendingLayerServer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithClientModelId:blendingLayerServer:", v8, v11);

  objc_msgSend(v7, "actionPredictionBlendingModelVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811A0]), "initWithClientModelId:clientModelVersion:engagementResetPolicy:", v8, v13, 0);
  __atxlog_handle_blending();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138412290;
    v19 = v5;
    _os_log_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_DEFAULT, "lockscreen: converting actions to proactive suggestions: %@", (uint8_t *)&v18, 0xCu);
  }

  +[ATXProactiveSuggestionBuilder proactiveSuggestionsForLockscreenActions:clientModelSpec:](ATXProactiveSuggestionBuilder, "proactiveSuggestionsForLockscreenActions:clientModelSpec:", v5, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_blending();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138412290;
    v19 = v16;
    _os_log_impl(&dword_1C9A3B000, v17, OS_LOG_TYPE_DEFAULT, "lockscreen: Sending suggestions to blending: %@", (uint8_t *)&v18, 0xCu);
  }

  objc_msgSend(v12, "updateSuggestions:feedbackMetadata:completionHandler:", v16, v6, &__block_literal_global_24_4);
}

void __86__ATXActionBlendingUpdater_updateBlendingLayerWithLockscreenActions_feedbackMetadata___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (a2)
  {
    __atxlog_handle_blending();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "lockscreen: successfully updated blending for lockscreen action predictions", v6, 2u);
    }
  }
  else
  {
    __atxlog_handle_blending();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __86__ATXActionBlendingUpdater_updateBlendingLayerWithLockscreenActions_feedbackMetadata___block_invoke_cold_1((uint64_t)v4, v5);
  }

}

void __106__ATXActionBlendingUpdater_updateBlendingLayerWithBehavioralPredictions_feedbackMetadata_consumerSubType___block_invoke_cold_1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "Error updating blending for %@ with error: %@", buf, 0x16u);

}

void __86__ATXActionBlendingUpdater_updateBlendingLayerWithLockscreenActions_feedbackMetadata___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "lockscreen: error updating blending with error: %@", (uint8_t *)&v2, 0xCu);
}

@end
