@implementation ATXContextHeuristicsServer

+ (id)sharedInstance
{
  NSObject *v2;
  uint8_t v4[16];

  __atxlog_handle_context_heuristic();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_DEFAULT, "ATXContextHeuristicsServer: sharedInstance", v4, 2u);
  }

  if (sharedInstance__pasOnceToken7_0 != -1)
    dispatch_once(&sharedInstance__pasOnceToken7_0, &__block_literal_global_246);
  return (id)sharedInstance__pasExprOnceResult_54;
}

void __44__ATXContextHeuristicsServer_sharedInstance__block_invoke()
{
  void *v0;
  ATXContextHeuristicsServer *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = [ATXContextHeuristicsServer alloc];
  v2 = objc_alloc(MEMORY[0x1E0CF4F20]);
  objc_msgSend(MEMORY[0x1E0D80DC8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithLocationManager:", v3);
  v5 = -[ATXContextHeuristicsServer initWithHeuristics:](v1, "initWithHeuristics:", v4);
  v6 = (void *)sharedInstance__pasExprOnceResult_54;
  sharedInstance__pasExprOnceResult_54 = v5;

  objc_autoreleasePoolPop(v0);
}

- (ATXContextHeuristicsServer)initWithHeuristics:(id)a3
{
  id v5;
  ATXContextHeuristicsServer *v6;
  id *p_isa;
  ATXContextHeuristicsScheduler *v8;
  id v9;
  NSObject *v10;
  ATXContextHeuristicsServer *v11;
  int v12;
  NSObject *v13;
  _BOOL4 v14;
  uint8_t v16[16];
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ATXContextHeuristicsServer;
  v6 = -[ATXContextHeuristicsServer init](&v17, sel_init);
  p_isa = (id *)&v6->super.isa;
  if (!v6)
  {
LABEL_13:
    v11 = p_isa;
    goto LABEL_14;
  }
  objc_storeStrong((id *)&v6->_heuristics, a3);
  objc_msgSend(p_isa[1], "setDelegate:", p_isa);
  v8 = -[ATXContextHeuristicsScheduler initWithContextHeuristics:]([ATXContextHeuristicsScheduler alloc], "initWithContextHeuristics:", p_isa[1]);
  v9 = p_isa[2];
  p_isa[2] = v8;

  if (!objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked"))
  {
    objc_msgSend(p_isa[1], "refreshResultsForAllHeuristicsPendingRefreshWithCompletionHandler:", &__block_literal_global_9_6);
    v12 = objc_msgSend(MEMORY[0x1E0CF94B0], "isSportsEnabled");
    __atxlog_handle_context_heuristic();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v14)
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_DEFAULT, "ATXContextHeuristicsServer: starting sports scheduler.", v16, 2u);
      }

      objc_msgSend(p_isa[2], "start");
    }
    else
    {
      if (v14)
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_DEFAULT, "ATXContextHeuristicsServer: sports feature flag disabled, not starting.", v16, 2u);
      }

    }
    goto LABEL_13;
  }
  __atxlog_handle_context_heuristic();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    -[ATXContextHeuristicsServer initWithHeuristics:].cold.1(v10);

  v11 = 0;
LABEL_14:

  return v11;
}

void __49__ATXContextHeuristicsServer_initWithHeuristics___block_invoke(uint64_t a1, char a2)
{
  NSObject *v2;

  if ((a2 & 1) == 0)
  {
    __atxlog_handle_context_heuristic();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __49__ATXContextHeuristicsServer_initWithHeuristics___block_invoke_cold_1(v2);

  }
}

- (void)_updateBlendingLayerWithSuggestionsFromContextHeuristics:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ATXContextHeuristicsServer _contextHeuristicsClientModel](self, "_contextHeuristicsClientModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_context_heuristic();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134217984;
    v8 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "ATXContextHeuristicsServer: updateBlendingLayer context heuristics total: %lu", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(v5, "updateSuggestions:completionHandler:", v4, &__block_literal_global_12_9);
}

void __87__ATXContextHeuristicsServer__updateBlendingLayerWithSuggestionsFromContextHeuristics___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  if ((a2 & 1) == 0)
  {
    __atxlog_handle_context_heuristic();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __87__ATXContextHeuristicsServer__updateBlendingLayerWithSuggestionsFromContextHeuristics___block_invoke_cold_1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

  }
}

- (void)_updateBlendingLayerWithSuggestionsFromSpotlightRecents:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 46);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0D81198]);
  +[ATXClientModelSuggestionReceiver sharedInstance](ATXClientModelSuggestionReceiver, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "blendingLayerServer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithClientModelId:blendingLayerServer:", v4, v7);

  __atxlog_handle_context_heuristic();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134217984;
    v11 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_DEFAULT, "ATXContextHeuristicsServer: updateBlendingLayer spotlight recents total: %lu", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend(v8, "updateSuggestions:completionHandler:", v3, &__block_literal_global_15_0);
}

void __86__ATXContextHeuristicsServer__updateBlendingLayerWithSuggestionsFromSpotlightRecents___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  if ((a2 & 1) == 0)
  {
    __atxlog_handle_context_heuristic();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __86__ATXContextHeuristicsServer__updateBlendingLayerWithSuggestionsFromSpotlightRecents___block_invoke_cold_1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

  }
}

- (void)contextHeuristics:(id)a3 didUpdateSuggestions:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  __atxlog_handle_context_heuristic();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "ATXContextHeuristicsServer: updateBlendingLayer Context heuristics %@", (uint8_t *)&v8, 0xCu);
  }

  -[ATXContextHeuristicsServer _retrieveOldContextHeuristicsSuggestions](self, "_retrieveOldContextHeuristicsSuggestions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXContextHeuristicsServer _updateBlendingLayerWithSuggestionsFromContextHeuristics:](self, "_updateBlendingLayerWithSuggestionsFromContextHeuristics:", v5);
  -[ATXContextHeuristicsServer _updateContextHeuristicsBiomeStreamWithNewSuggestions:oldSuggestions:](self, "_updateContextHeuristicsBiomeStreamWithNewSuggestions:oldSuggestions:", v5, v7);

}

- (void)contextHeuristics:(id)a3 didUpdateSpotlightRecents:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  __atxlog_handle_context_heuristic();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "ATXContextHeuristicsServer: updateBlendingLayer Spotlight recents %@", (uint8_t *)&v7, 0xCu);
  }

  -[ATXContextHeuristicsServer _updateBlendingLayerWithSuggestionsFromSpotlightRecents:](self, "_updateBlendingLayerWithSuggestionsFromSpotlightRecents:", v5);
}

- (id)_retrieveOldContextHeuristicsSuggestions
{
  void *v2;
  dispatch_semaphore_t v3;
  NSObject *v4;
  id v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *);
  void *v10;
  NSObject *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  -[ATXContextHeuristicsServer _contextHeuristicsClientModel](self, "_contextHeuristicsClientModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__104;
  v17 = __Block_byref_object_dispose__104;
  v18 = 0;
  v3 = dispatch_semaphore_create(0);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __70__ATXContextHeuristicsServer__retrieveOldContextHeuristicsSuggestions__block_invoke;
  v10 = &unk_1E82DC280;
  v12 = &v13;
  v4 = v3;
  v11 = v4;
  objc_msgSend(v2, "retrieveCurrentSuggestionsWithReply:", &v7);
  objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v4, 1.0, v7, v8, v9, v10);
  v5 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v5;
}

void __70__ATXContextHeuristicsServer__retrieveOldContextHeuristicsSuggestions__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)_updateContextHeuristicsBiomeStreamWithNewSuggestions:(id)a3 oldSuggestions:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  ATXContextHeuristicsEvent *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  ATXContextHeuristicsEvent *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[ATXContextHeuristicsServer _cachedContextsFromSuggestions:](self, "_cachedContextsFromSuggestions:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v6;
  -[ATXContextHeuristicsServer _cachedContextsFromSuggestions:](self, "_cachedContextsFromSuggestions:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v32 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        if ((objc_msgSend(v8, "containsObject:", v15) & 1) == 0)
        {
          v16 = -[ATXContextHeuristicsEvent initWithContextName:contextType:isStart:]([ATXContextHeuristicsEvent alloc], "initWithContextName:contextType:isStart:", &stru_1E82FDC98, v15, 0);
          objc_msgSend(v9, "source");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "sendEvent:", v16);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v12);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v18 = v8;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(v18);
        v23 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j);
        if ((objc_msgSend(v10, "containsObject:", v23) & 1) == 0)
        {
          v24 = -[ATXContextHeuristicsEvent initWithContextName:contextType:isStart:]([ATXContextHeuristicsEvent alloc], "initWithContextName:contextType:isStart:", &stru_1E82FDC98, v23, 1);
          objc_msgSend(v9, "source");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "sendEvent:", v24);

        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v20);
  }

}

- (id)_contextHeuristicsClientModel
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 44);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0D81198]);
  +[ATXClientModelSuggestionReceiver sharedInstance](ATXClientModelSuggestionReceiver, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "blendingLayerServer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithClientModelId:blendingLayerServer:", v2, v5);

  return v6;
}

- (id)_cachedContextsFromSuggestions:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id obj;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v15 = 0;
        v16 = &v15;
        v17 = 0x3032000000;
        v18 = __Block_byref_object_copy__104;
        v19 = __Block_byref_object_dispose__104;
        v20 = (id)objc_opt_new();
        objc_msgSend(v8, "uiSpecification");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "predictionReasons");

        if (v10)
        {
          objc_msgSend(v8, "uiSpecification");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "predictionReasons");
          ATXSuggestionPredictionReasonEnumerateReasonCodes();

        }
        objc_msgSend(v4, "addObject:", v16[5]);
        _Block_object_dispose(&v15, 8);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v5);
  }

  v12 = (void *)objc_msgSend(v4, "copy");
  return v12;
}

void __61__ATXContextHeuristicsServer__cachedContextsFromSuggestions___block_invoke(uint64_t a1)
{
  id v2;

  stringForATXSuggestionPredictionReasonCode();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "appendString:", v2);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sportsScheduler, 0);
  objc_storeStrong((id *)&self->_heuristics, 0);
}

- (void)initWithHeuristics:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_FAULT, "ATXContextHeuristicsServer: must be class C unlocked.", v1, 2u);
}

void __49__ATXContextHeuristicsServer_initWithHeuristics___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "ATXContextHeuristicsServer: context heuristics failed to refresh at intialization.", v1, 2u);
}

void __87__ATXContextHeuristicsServer__updateBlendingLayerWithSuggestionsFromContextHeuristics___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "ATXContextHeuristicsServer: Blending update context heuristics failed due to error %{public}@", a5, a6, a7, a8, 2u);
}

void __86__ATXContextHeuristicsServer__updateBlendingLayerWithSuggestionsFromSpotlightRecents___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "ATXContextHeuristicsServer: Blending update spotlight recents failed due to error %{public}@", a5, a6, a7, a8, 2u);
}

@end
