@implementation ATXHeuristicOngoingCallContactInfo

- (id)permanentRefreshTriggers
{
  ATXInformationHeuristicRefreshContextChangeTrigger *v2;
  void *v3;
  ATXInformationHeuristicRefreshContextChangeTrigger *v4;
  void *v5;
  void *v6;

  v2 = [ATXInformationHeuristicRefreshContextChangeTrigger alloc];
  objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForActiveCall");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ATXInformationHeuristicRefreshContextChangeTrigger initWithCDContextualKeyPath:](v2, "initWithCDContextualKeyPath:", v3);

  v5 = (void *)MEMORY[0x1CAA46CBC]();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v4, 0);
  objc_autoreleasePoolPop(v5);

  return v6;
}

- (id)heuristicResultWithEnvironment:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  ATXOngoingCallSuggestionProducer *v12;
  uint64_t v13;
  ATXContextHeuristicResult *v14;
  void *v15;
  ATXContextHeuristicResult *v16;
  uint8_t v18[16];
  uint8_t buf[16];

  v3 = a3;
  __atxlog_handle_context_heuristic();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C99DF000, v4, OS_LOG_TYPE_DEFAULT, "ATXOngoingCall: producing ongoing call suggestions", buf, 2u);
  }

  v5 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForActiveCall");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchDataDictionaryForKeyPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D15C58], "calleeContactIDsKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_opt_new();
  if (objc_msgSend(v9, "count"))
  {
    __atxlog_handle_context_heuristic();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1C99DF000, v11, OS_LOG_TYPE_DEFAULT, "ATXOngoingCall: Found a donation in the context store on an active call where either calleeContactIDsKey or calleeHandlesKey is set", v18, 2u);
    }

    v12 = -[ATXOngoingCallSuggestionProducer initWithEnvironment:]([ATXOngoingCallSuggestionProducer alloc], "initWithEnvironment:", v3);
    -[ATXOngoingCallSuggestionProducer suggestionsForOngoingCall:](v12, "suggestionsForOngoingCall:", v9);
    v13 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v13;
  }
  v14 = [ATXContextHeuristicResult alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[ATXContextHeuristicResult initWithSuggestions:additionalRefreshTriggers:](v14, "initWithSuggestions:additionalRefreshTriggers:", v10, v15);

  return v16;
}

@end
