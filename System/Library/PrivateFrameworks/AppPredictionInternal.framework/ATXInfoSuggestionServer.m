@implementation ATXInfoSuggestionServer

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_36 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_36, &__block_literal_global_194);
  return (id)sharedInstance__pasExprOnceResult_47;
}

void __41__ATXInfoSuggestionServer_sharedInstance__block_invoke()
{
  void *v0;
  ATXInfoSuggestionServer *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = [ATXInfoSuggestionServer alloc];
  v2 = (void *)objc_opt_new();
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v6 = objc_alloc(MEMORY[0x1E0CB3B58]);
  v7 = (void *)objc_msgSend(v6, "initWithMachServiceName:", *MEMORY[0x1E0D81260]);
  v8 = -[ATXInfoSuggestionServer initWithInfoEngine:rsSuggestionProducer:infoHeuristics:criterionRegistry:xpcListener:](v1, "initWithInfoEngine:rsSuggestionProducer:infoHeuristics:criterionRegistry:xpcListener:", v2, v3, v4, v5, v7);
  v9 = (void *)sharedInstance__pasExprOnceResult_47;
  sharedInstance__pasExprOnceResult_47 = v8;

  objc_autoreleasePoolPop(v0);
}

- (ATXInfoSuggestionServer)initWithInfoEngine:(id)a3 rsSuggestionProducer:(id)a4 infoHeuristics:(id)a5 criterionRegistry:(id)a6 xpcListener:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  ATXInfoSuggestionServer *v17;
  ATXInfoSuggestionServer *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)ATXInfoSuggestionServer;
  v17 = -[ATXInfoSuggestionServer init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_xpcListener, a7);
    -[NSXPCListener setDelegate:](v18->_xpcListener, "setDelegate:", v18);
    -[NSXPCListener resume](v18->_xpcListener, "resume");
    objc_storeStrong((id *)&v18->_criterionRegistry, a6);
    objc_storeStrong((id *)&v18->_engine, a3);
    objc_storeStrong((id *)&v18->_relevantShortcutSuggestionProducer, a4);
    objc_storeStrong((id *)&v18->_informationHeuristics, a5);
    -[ATXInformationHeuristics setDelegate:](v18->_informationHeuristics, "setDelegate:", v18);
    -[ATXInformationHeuristics refreshResultsForAllHeuristicsPendingRefreshWithCompletionHandler:](v18->_informationHeuristics, "refreshResultsForAllHeuristicsPendingRefreshWithCompletionHandler:", &__block_literal_global_14_3);
  }

  return v18;
}

void __112__ATXInfoSuggestionServer_initWithInfoEngine_rsSuggestionProducer_infoHeuristics_criterionRegistry_xpcListener___block_invoke(uint64_t a1, char a2)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if ((a2 & 1) == 0)
  {
    __atxlog_handle_gi();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __112__ATXInfoSuggestionServer_initWithInfoEngine_rsSuggestionProducer_infoHeuristics_criterionRegistry_xpcListener___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  }
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCListener invalidate](self->_xpcListener, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)ATXInfoSuggestionServer;
  -[ATXInfoSuggestionServer dealloc](&v3, sel_dealloc);
}

- (void)refreshInfoSuggestionsWithCompletionHandler:(id)a3
{
  id v4;
  ATXInformationHeuristics *informationHeuristics;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  informationHeuristics = self->_informationHeuristics;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__ATXInfoSuggestionServer_refreshInfoSuggestionsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E82DF310;
  v8 = v4;
  v6 = v4;
  -[ATXInformationHeuristics refreshResultsForAllHeuristicsWithCompletionHandler:](informationHeuristics, "refreshResultsForAllHeuristicsWithCompletionHandler:", v7);

}

uint64_t __71__ATXInfoSuggestionServer_refreshInfoSuggestionsWithCompletionHandler___block_invoke(uint64_t a1, char a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((a2 & 1) == 0)
  {
    __atxlog_handle_gi();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __71__ATXInfoSuggestionServer_refreshInfoSuggestionsWithCompletionHandler___block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (ATXInformationEngine)infoEngine
{
  return self->_engine;
}

- (id)_processIncomingSuggestion:(id)a3 sourceIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  ATXInfoSuggestionCriterionRegistry *criterionRegistry;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_class *v14;
  id v15;
  id v16;
  void *v17;
  objc_class *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_class *v29;
  id v30;
  void *v31;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (-[ATXInfoSuggestionCriterionRegistry isSourceIdentifierRegistered:](self->_criterionRegistry, "isSourceIdentifierRegistered:", v9))
  {
    criterionRegistry = self->_criterionRegistry;
    objc_msgSend(v8, "criterion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[ATXInfoSuggestionCriterionRegistry confidenceLevelForCriterion:sourceIdentifier:](criterionRegistry, "confidenceLevelForCriterion:sourceIdentifier:", v11, v9);

    if ((unint64_t)(v12 + 1) <= 1)
    {
      if (a5)
      {
        objc_msgSend(v8, "criterion");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (objc_class *)MEMORY[0x1E0CB3940];
        v15 = v9;
        v16 = [v14 alloc];
        if (v12)
        {
          v17 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("criterion \"%@\" of \"%@\" is disabled"), v13, v15);

          v18 = (objc_class *)MEMORY[0x1E0CB35C8];
          v19 = v17;
          v20 = [v18 alloc];
          v33 = *MEMORY[0x1E0CB2D50];
          v34[0] = v19;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v22 = v20;
          v23 = -5;
        }
        else
        {
          v28 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("criterion \"%@\" of \"%@\" is invalid"), v13, v15);

          v29 = (objc_class *)MEMORY[0x1E0CB35C8];
          v19 = v28;
          v30 = [v29 alloc];
          v33 = *MEMORY[0x1E0CB2D50];
          v34[0] = v19;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v22 = v30;
          v23 = -2;
        }
        v31 = (void *)objc_msgSend(v22, "initWithDomain:code:userInfo:", CFSTR("ATXInfoSuggestionServerErrorDomain"), v23, v21);

        *a5 = v31;
      }
      goto LABEL_13;
    }
    objc_msgSend(v8, "setConfidenceLevel:", v12);
    objc_msgSend(v8, "setSourceIdentifier:", v9);
    objc_msgSend(v8, "suggestionIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "UUIDString");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setSuggestionIdentifier:", v27);

    }
    v24 = v8;
  }
  else
  {
    if (!a5)
    {
LABEL_13:
      v24 = 0;
      goto LABEL_14;
    }
    NSErrorForInvalidInfoSourceIdentifier(v9);
    v24 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_14:

  return v24;
}

- (id)_processIncomingSuggestions:(id)a3 sourceIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    while (2)
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        -[ATXInfoSuggestionServer _processIncomingSuggestion:sourceIdentifier:error:](self, "_processIncomingSuggestion:sourceIdentifier:error:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v15), v9, a5, (_QWORD)v20);
        v16 = objc_claimAutoreleasedReturnValue();
        if (!v16)
        {

          v18 = 0;
          goto LABEL_11;
        }
        v17 = (void *)v16;
        objc_msgSend(v10, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v13)
        continue;
      break;
    }
  }

  v18 = v10;
LABEL_11:

  return v18;
}

- (void)_addSuggestions:(id)a3 forSourceIdentifier:(id)a4 needReset:(BOOL)a5 errorHandler:(id)a6
{
  _BOOL4 v7;
  id v10;
  void (**v11)(id, id);
  void *v12;
  id v13;
  ATXInformationEngine *engine;
  NSObject *v15;
  id v16;

  v7 = a5;
  v10 = a4;
  v11 = (void (**)(id, id))a6;
  v16 = 0;
  -[ATXInfoSuggestionServer _processIncomingSuggestions:sourceIdentifier:error:](self, "_processIncomingSuggestions:sourceIdentifier:error:", a3, v10, &v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v16;
  if (v12)
  {
    engine = self->_engine;
    if (v7)
      -[ATXInformationEngine resetSuggestionsTo:forInfoSourceIdentifier:completionHandler:](engine, "resetSuggestionsTo:forInfoSourceIdentifier:completionHandler:", v12, v10, v11);
    else
      -[ATXInformationEngine insertSuggestions:forInfoSourceIdentifier:completionHandler:](engine, "insertSuggestions:forInfoSourceIdentifier:completionHandler:", v12, v10, v11);
  }
  else
  {
    __atxlog_handle_gi();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[ATXInfoSuggestionServer _addSuggestions:forSourceIdentifier:needReset:errorHandler:].cold.1();

    v11[2](v11, v13);
  }

}

- (void)insertSuggesions:(id)a3 forInfoSourceIdentifier:(id)a4 errorHandler:(id)a5
{
  -[ATXInfoSuggestionServer _addSuggestions:forSourceIdentifier:needReset:errorHandler:](self, "_addSuggestions:forSourceIdentifier:needReset:errorHandler:", a3, a4, 0, a5);
}

- (void)resetSuggestionsTo:(id)a3 forInfoSourceIdentifier:(id)a4 errorHandler:(id)a5
{
  -[ATXInfoSuggestionServer _addSuggestions:forSourceIdentifier:needReset:errorHandler:](self, "_addSuggestions:forSourceIdentifier:needReset:errorHandler:", a3, a4, 1, a5);
}

- (void)getSuggestionsForInfoSourceIdentifier:(id)a3 withReply:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  ATXInfoSuggestionCriterionRegistry *criterionRegistry;
  id v8;
  void *v9;
  NSObject *v10;

  v6 = (void (**)(id, _QWORD, void *))a4;
  criterionRegistry = self->_criterionRegistry;
  v8 = a3;
  if (-[ATXInfoSuggestionCriterionRegistry isSourceIdentifierRegistered:](criterionRegistry, "isSourceIdentifierRegistered:", v8))
  {
    -[ATXInformationEngine getSuggestionsForInfoSourceIdentifier:withReply:](self->_engine, "getSuggestionsForInfoSourceIdentifier:withReply:", v8, v6);
    v9 = v8;
  }
  else
  {
    NSErrorForInvalidInfoSourceIdentifier(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    __atxlog_handle_gi();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ATXInfoSuggestionServer getSuggestionsForInfoSourceIdentifier:withReply:].cold.1();

    v6[2](v6, 0, v9);
  }

}

- (void)clearSuggestionsForInfoSourceIdentifier:(id)a3 errorHandler:(id)a4
{
  void (**v6)(id, void *);
  ATXInfoSuggestionCriterionRegistry *criterionRegistry;
  id v8;
  void *v9;
  NSObject *v10;

  v6 = (void (**)(id, void *))a4;
  criterionRegistry = self->_criterionRegistry;
  v8 = a3;
  if (-[ATXInfoSuggestionCriterionRegistry isSourceIdentifierRegistered:](criterionRegistry, "isSourceIdentifierRegistered:", v8))
  {
    -[ATXInformationEngine clearSuggestionsForInfoSourceIdentifier:completionHandler:](self->_engine, "clearSuggestionsForInfoSourceIdentifier:completionHandler:", v8, v6);
    v9 = v8;
  }
  else
  {
    NSErrorForInvalidInfoSourceIdentifier(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    __atxlog_handle_gi();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ATXInfoSuggestionServer clearSuggestionsForInfoSourceIdentifier:errorHandler:].cold.1();

    v6[2](v6, v9);
  }

}

- (void)overwriteSuggestionsWithProactiveSuggestions:(id)a3 forClientModelIdentifier:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  ATXInformationEngine *engine;
  void *v24;
  objc_class *v25;
  id v26;
  void *v27;
  objc_class *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t v46[128];
  uint8_t buf[8];
  __int16 v48;
  id v49;
  _QWORD v50[3];

  v50[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v36 = a5;
  __atxlog_handle_gi();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = objc_msgSend(v7, "count");
    v48 = 2114;
    v49 = v8;
    _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_DEFAULT, "ATXInfoSuggestionServer: receive %d suggestion(s) from ATXClientModel %{public}@", buf, 0x12u);
  }

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v43;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v43 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        v17 = (void *)MEMORY[0x1CAA48B6C]();
        v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0D81150]), "initWithProactiveSuggestion:", v16);
        if (!v18)
        {
          v25 = (objc_class *)MEMORY[0x1E0CB3940];
          v26 = v16;
          v27 = (void *)objc_msgSend([v25 alloc], "initWithFormat:", CFSTR("Failed to convert ATXProactiveSuggestion to ATXInfoSuggestion: %@"), v26);

          v28 = (objc_class *)MEMORY[0x1E0CB35C8];
          v29 = v27;
          v30 = [v28 alloc];
          v50[0] = *MEMORY[0x1E0CB2D50];
          *(_QWORD *)buf = v29;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v50, 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          v32 = (void *)objc_msgSend(v30, "initWithDomain:code:userInfo:", CFSTR("ATXInfoSuggestionServerErrorDomain"), -4, v31);
          __atxlog_handle_gi();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
            -[ATXInfoSuggestionServer overwriteSuggestionsWithProactiveSuggestions:forClientModelIdentifier:completionHandler:].cold.2();

          v24 = v36;
          (*((void (**)(id, _QWORD, void *))v36 + 2))(v36, 0, v32);

          objc_autoreleasePoolPop(v17);
          v22 = v11;
          goto LABEL_20;
        }
        v19 = (void *)v18;
        objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setClientModelId:", v20);

        objc_msgSend(v10, "addObject:", v19);
        objc_autoreleasePoolPop(v17);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      if (v13)
        continue;
      break;
    }
  }

  v41 = 0;
  -[ATXInfoSuggestionServer _processIncomingSuggestions:sourceIdentifier:error:](self, "_processIncomingSuggestions:sourceIdentifier:error:", v10, v8, &v41);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v41;
  if (v21)
  {
    engine = self->_engine;
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __115__ATXInfoSuggestionServer_overwriteSuggestionsWithProactiveSuggestions_forClientModelIdentifier_completionHandler___block_invoke;
    v37[3] = &unk_1E82E84B0;
    v38 = v21;
    v39 = v8;
    v24 = v36;
    v40 = v36;
    -[ATXInformationEngine resetSuggestionsTo:forInfoSourceIdentifier:completionHandler:](engine, "resetSuggestionsTo:forInfoSourceIdentifier:completionHandler:", v38, v39, v37);

  }
  else
  {
    __atxlog_handle_gi();
    v34 = objc_claimAutoreleasedReturnValue();
    v24 = v36;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      -[ATXInfoSuggestionServer overwriteSuggestionsWithProactiveSuggestions:forClientModelIdentifier:completionHandler:].cold.1();

    (*((void (**)(id, _QWORD, id))v36 + 2))(v36, 0, v22);
  }

LABEL_20:
}

void __115__ATXInfoSuggestionServer_overwriteSuggestionsWithProactiveSuggestions_forClientModelIdentifier_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    (*(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0, a2);
  }
  else
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v4 = *(id *)(a1 + 32);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v20 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(MEMORY[0x1E0D81150], "proactiveSuggestionForInfoSuggestion:withClientModelId:clientModelVersion:rawScore:confidenceCategory:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), *(_QWORD *)(a1 + 40), CFSTR("1.0"), 0, 0.0, (_QWORD)v19);
          v9 = objc_claimAutoreleasedReturnValue();
          if (!v9)
          {
            __atxlog_handle_gi();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
              __115__ATXInfoSuggestionServer_overwriteSuggestionsWithProactiveSuggestions_forClientModelIdentifier_completionHandler___block_invoke_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);

            (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
            goto LABEL_15;
          }
          v10 = (void *)v9;
          objc_msgSend(v3, "addObject:", v9);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v6)
          continue;
        break;
      }
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_15:

  }
}

- (void)retrieveAvailableCriterionIdentifiersForSourceIdentifier:(id)a3 reply:(id)a4
{
  ATXInfoSuggestionCriterionRegistry *criterionRegistry;
  void (**v7)(id, id, _QWORD);
  id v8;
  void *v9;
  NSObject *v10;
  id v11;

  criterionRegistry = self->_criterionRegistry;
  v7 = (void (**)(id, id, _QWORD))a4;
  v8 = a3;
  if (-[ATXInfoSuggestionCriterionRegistry isSourceIdentifierRegistered:](criterionRegistry, "isSourceIdentifierRegistered:", v8))
  {
    -[ATXInfoSuggestionCriterionRegistry availableCriterionIdentifiersForSourceIdentifier:](self->_criterionRegistry, "availableCriterionIdentifiersForSourceIdentifier:", v8);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    v7[2](v7, v11, 0);
  }
  else
  {
    NSErrorForInvalidInfoSourceIdentifier(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    __atxlog_handle_gi();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ATXInfoSuggestionServer retrieveAvailableCriterionIdentifiersForSourceIdentifier:reply:].cold.1();

    ((void (**)(id, id, void *))v7)[2](v7, 0, v9);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  BOOL v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = *MEMORY[0x1E0D81260];
  objc_msgSend(v5, "valueForEntitlement:", *MEMORY[0x1E0D81260]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v7, "BOOLValue") & 1) != 0)
  {
    ATXInfoSuggestionXPCInterface();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setExportedInterface:", v8);

    objc_msgSend(v5, "setExportedObject:", self);
    objc_msgSend(v5, "setInterruptionHandler:", &__block_literal_global_26_1);
    objc_msgSend(v5, "setInvalidationHandler:", &__block_literal_global_28);
    objc_msgSend(v5, "resume");
    __atxlog_handle_gi();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543362;
      v13 = v5;
      _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_DEFAULT, "ATXInfoSuggestionServer: accepts XPC connection: %{public}@", (uint8_t *)&v12, 0xCu);
    }
    v10 = 1;
  }
  else
  {
    __atxlog_handle_gi();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ATXInfoSuggestionServer listener:shouldAcceptNewConnection:].cold.1((uint64_t)v5, v6, v9);
    v10 = 0;
  }

  return v10;
}

void __62__ATXInfoSuggestionServer_listener_shouldAcceptNewConnection___block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  __atxlog_handle_gi();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __62__ATXInfoSuggestionServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

void __62__ATXInfoSuggestionServer_listener_shouldAcceptNewConnection___block_invoke_27()
{
  NSObject *v0;
  uint8_t v1[16];

  __atxlog_handle_gi();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1C9A3B000, v0, OS_LOG_TYPE_DEFAULT, "ATXInfoSuggestionServer: XPC connection invalidated.", v1, 2u);
  }

}

- (void)userDidDismissSuggestion:(id)a3 isDismissalLongTerm:(BOOL)a4 completion:(id)a5
{
  -[ATXInformationEngine handleSuggestionDismissal:isDismissalLongTerm:completion:](self->_engine, "handleSuggestionDismissal:isDismissalLongTerm:completion:", a3, a4, a5);
}

- (void)stackDidRotateProactivelyForInfoSuggestion:(id)a3 isStalenessRotation:(BOOL)a4
{
  -[ATXInformationEngine handleProactiveStackRotationForInfoSuggestion:isStalenessRotation:](self->_engine, "handleProactiveStackRotationForInfoSuggestion:isStalenessRotation:", a3, a4);
}

- (void)timelineDidReloadForWidget:(id)a3 parentApp:(id)a4 withEntries:(id)a5 completion:(id)a6
{
  id v10;
  __CFString *v11;
  id v12;
  id v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  unint64_t v18;
  __CFString *v19;
  __CFString *v20;
  NSObject *v21;
  uint64_t v22;
  ATXTimelineRelevance *v23;
  ATXInfoSuggestionCriterionRegistry *criterionRegistry;
  void *v25;
  ATXTimelineRelevance *v26;
  void *v27;
  void *v28;
  ATXInformationEngine *engine;
  void *v30;
  void *v31;
  __CFString *v32;
  __CFString *v33;
  NSObject *v34;
  uint64_t v35;
  NSObject *v36;
  NSObject *v37;
  os_signpost_id_t spid;
  __CFString *v39;
  __CFString *v40;
  void *v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  __CFString *v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  __CFString *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (__CFString *)a4;
  v12 = a5;
  v13 = a6;
  __atxlog_handle_xpc();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_signpost_id_generate(v14);

  __atxlog_handle_xpc();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  v18 = v15 - 1;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "_timelineDidUpdateForWidget", " enableTelemetry=YES ", buf, 2u);
  }

  v19 = CFSTR("entries");
  if (objc_msgSend(v12, "count") && (unint64_t)objc_msgSend(v12, "count") <= 1)
    v19 = CFSTR("entry");
  spid = v15;
  v20 = v19;
  __atxlog_handle_timeline();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = objc_msgSend(v12, "count", spid);
    *(_DWORD *)buf = 138413058;
    v43 = (uint64_t)v10;
    v44 = 2112;
    v45 = v11;
    v46 = 2048;
    v47 = v22;
    v48 = 2112;
    v49 = v20;
    _os_log_impl(&dword_1C9A3B000, v21, OS_LOG_TYPE_DEFAULT, "ATXInfoSuggestionServer: timelineDidReloadForWidget:appBundleId:entries:completion called with widget: %@, appBundleId: %@ and %lu %@", buf, 0x2Au);
  }
  v39 = v20;
  v40 = v11;

  v23 = [ATXTimelineRelevance alloc];
  criterionRegistry = self->_criterionRegistry;
  -[ATXInformationEngine abuseControlConfig](self->_engine, "abuseControlConfig");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v10;
  v26 = -[ATXTimelineRelevance initWithWidget:criterionRegistry:abuseControlConfig:](v23, "initWithWidget:criterionRegistry:abuseControlConfig:", v10, criterionRegistry, v25);

  -[ATXTimelineRelevance setDelegate:](v26, "setDelegate:", self->_engine);
  -[ATXTimelineRelevance sourceId](v26, "sourceId");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXInformationEngine latestInfoSuggestionRelevantNowForSourceId:](self->_engine, "latestInfoSuggestionRelevantNowForSourceId:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  engine = self->_engine;
  objc_msgSend(v28, "suggestionIdentifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXInformationEngine deleteAllSuggestionsForSourceId:excludingSuggestionId:](engine, "deleteAllSuggestionsForSourceId:excludingSuggestionId:", v27, v30);

  -[ATXTimelineRelevance infoSuggestionsFromTimelineEntries:latestInfoSuggestionRelevantNow:](v26, "infoSuggestionsFromTimelineEntries:latestInfoSuggestionRelevantNow:", v12, v28);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = CFSTR("suggestions");
  if ((unint64_t)objc_msgSend(v31, "count") <= 1 && objc_msgSend(v31, "count"))
    v32 = CFSTR("suggestion");
  v33 = v32;
  __atxlog_handle_timeline();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    v35 = objc_msgSend(v31, "count");
    *(_DWORD *)buf = 134218242;
    v43 = v35;
    v44 = 2112;
    v45 = v33;
    _os_log_impl(&dword_1C9A3B000, v34, OS_LOG_TYPE_DEFAULT, "ATXInfoSuggestionServer: Sending %lu %@ to the InformationEngine", buf, 0x16u);
  }

  -[ATXInformationEngine insertSuggestions:forInfoSourceIdentifier:completionHandler:](self->_engine, "insertSuggestions:forInfoSourceIdentifier:completionHandler:", v31, v27, v13);
  __atxlog_handle_xpc();
  v36 = objc_claimAutoreleasedReturnValue();
  v37 = v36;
  if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v37, OS_SIGNPOST_INTERVAL_END, spid, "_timelineDidUpdateForWidget", " enableTelemetry=YES ", buf, 2u);
  }

}

- (void)informationHeuristics:(id)a3 didUpdateSuggestions:(id)a4 forHeuristic:(id)a5
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CF4F28], "sourceIdentifierForHeuristicWithName:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v13);
        objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 18, (_QWORD)v16);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setClientModelId:", v15);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  -[ATXInfoSuggestionServer resetSuggestionsTo:forInfoSourceIdentifier:errorHandler:](self, "resetSuggestionsTo:forInfoSourceIdentifier:errorHandler:", v9, v8, &__block_literal_global_38_3);
}

void __83__ATXInfoSuggestionServer_informationHeuristics_didUpdateSuggestions_forHeuristic___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  if (v2)
  {
    __atxlog_handle_gi();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __83__ATXInfoSuggestionServer_informationHeuristics_didUpdateSuggestions_forHeuristic___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_informationHeuristics, 0);
  objc_storeStrong((id *)&self->_criterionRegistry, 0);
  objc_storeStrong((id *)&self->_relevantShortcutSuggestionProducer, 0);
  objc_storeStrong((id *)&self->_engine, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
}

void __112__ATXInfoSuggestionServer_initWithInfoEngine_rsSuggestionProducer_infoHeuristics_criterionRegistry_xpcListener___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, a1, a3, "ATXInfoSuggestionServer: information heuristics failed to refresh at intialization.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void __71__ATXInfoSuggestionServer_refreshInfoSuggestionsWithCompletionHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, a1, a3, "ATXInfoSuggestionServer: information heuristics failed to refresh on-demand.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)_addSuggestions:forSourceIdentifier:needReset:errorHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_1_5(&dword_1C9A3B000, v0, v1, "ATXInfoSuggestionServer %s: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)getSuggestionsForInfoSourceIdentifier:withReply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_1_5(&dword_1C9A3B000, v0, v1, "ATXInfoSuggestionServer %s: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)clearSuggestionsForInfoSourceIdentifier:errorHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_1_5(&dword_1C9A3B000, v0, v1, "ATXInfoSuggestionServer %s: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)overwriteSuggestionsWithProactiveSuggestions:forClientModelIdentifier:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_1_5(&dword_1C9A3B000, v0, v1, "ATXInfoSuggestionServer %s: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)overwriteSuggestionsWithProactiveSuggestions:forClientModelIdentifier:completionHandler:.cold.2()
{
  os_log_t v0;
  int v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_1_8();
  _os_log_fault_impl(&dword_1C9A3B000, v0, OS_LOG_TYPE_FAULT, "ATXInfoSuggestionServer %s: %{public}@", (uint8_t *)v1, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

void __115__ATXInfoSuggestionServer_overwriteSuggestionsWithProactiveSuggestions_forClientModelIdentifier_completionHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, a1, a3, "ATXInfoSuggestionServer %s: error converting ATXProactiveSuggestion to ATXProactiveSuggestion", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)retrieveAvailableCriterionIdentifiersForSourceIdentifier:reply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_1_5(&dword_1C9A3B000, v0, v1, "ATXInfoSuggestionServer %s: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)listener:(os_log_t)log shouldAcceptNewConnection:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "ATXInfoSuggestionServer: Rejecting connection %{public}@ without entitlement %{public}@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

void __62__ATXInfoSuggestionServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, a1, a3, "ATXInfoSuggestionServer: XPC connection interrupted.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void __83__ATXInfoSuggestionServer_informationHeuristics_didUpdateSuggestions_forHeuristic___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, a2, a3, "Error donating suggestions through heuristics: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
