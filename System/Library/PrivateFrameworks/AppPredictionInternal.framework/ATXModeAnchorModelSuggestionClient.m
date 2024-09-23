@implementation ATXModeAnchorModelSuggestionClient

+ (ATXModeAnchorModelSuggestionClient)sharedInstance
{
  if (sharedInstance__pasOnceToken6_19 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_19, &__block_literal_global_118);
  return (ATXModeAnchorModelSuggestionClient *)(id)sharedInstance__pasExprOnceResult_25;
}

void __52__ATXModeAnchorModelSuggestionClient_sharedInstance__block_invoke()
{
  void *v0;
  id v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = -[ATXModeAnchorModelSuggestionClient _init]([ATXModeAnchorModelSuggestionClient alloc], "_init");
  v2 = (void *)sharedInstance__pasExprOnceResult_25;
  sharedInstance__pasExprOnceResult_25 = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

- (id)_init
{
  ATXModeAnchorModelSuggestionClient *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _PASXPCClientHelper *xpcClientHelper;
  _QWORD v10[4];
  id v11;
  id location;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ATXModeAnchorModelSuggestionClient;
  v2 = -[ATXModeAnchorModelSuggestionClient init](&v13, sel_init);
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = objc_alloc(MEMORY[0x1E0D81640]);
    ATXModeAnchorModelSuggestionServerXPCInterface();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    ATXModeAnchorModelSuggestionClientXPCInterface();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __43__ATXModeAnchorModelSuggestionClient__init__block_invoke;
    v10[3] = &unk_1E82DB988;
    objc_copyWeak(&v11, &location);
    __atxlog_handle_modes();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v3, "initWithServiceName:allowlistedServerInterface:allowlistedClientInterface:serverInitiatedRequestHandler:interruptionHandler:invalidationHandler:logHandle:", *MEMORY[0x1E0D80EA8], v4, v5, v2, v10, &__block_literal_global_6_1, v6);
    xpcClientHelper = v2->_xpcClientHelper;
    v2->_xpcClientHelper = (_PASXPCClientHelper *)v7;

    -[ATXModeAnchorModelSuggestionClient _pingServer](v2, "_pingServer");
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __43__ATXModeAnchorModelSuggestionClient__init__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  __atxlog_handle_modes();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_DEFAULT, "ATXModeAnchorModelSuggestionClient: xpc connection interrupted.", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_pingServer");

}

void __43__ATXModeAnchorModelSuggestionClient__init__block_invoke_5()
{
  NSObject *v0;
  uint8_t v1[16];

  __atxlog_handle_modes();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1C9A3B000, v0, OS_LOG_TYPE_DEFAULT, "ATXModeAnchorModelSuggestionClient: xpc connection invalidated.", v1, 2u);
  }

}

- (void)_pingServer
{
  id v2;

  -[_PASXPCClientHelper remoteObjectProxyWithErrorHandler:](self->_xpcClientHelper, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_8_0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pingWithCompletion:", &__block_literal_global_11);

}

void __49__ATXModeAnchorModelSuggestionClient__pingServer__block_invoke(uint64_t a1, void *a2)
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
  __atxlog_handle_modes();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __49__ATXModeAnchorModelSuggestionClient__pingServer__block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

void __49__ATXModeAnchorModelSuggestionClient__pingServer__block_invoke_9()
{
  NSObject *v0;
  uint8_t v1[16];

  __atxlog_handle_modes();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1C9A3B000, v0, OS_LOG_TYPE_DEFAULT, "ATXModeAnchorModelSuggestionClient: successfully pinged server", v1, 2u);
  }

}

- (void)anchorModelDidProvideModeSuggestions:(id)a3
{
  _PASXPCClientHelper *xpcClientHelper;
  id v4;
  id v5;

  xpcClientHelper = self->_xpcClientHelper;
  v4 = a3;
  -[_PASXPCClientHelper remoteObjectProxyWithErrorHandler:](xpcClientHelper, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_12_3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anchorModelDidProvideModeSuggestions:", v4);

}

void __75__ATXModeAnchorModelSuggestionClient_anchorModelDidProvideModeSuggestions___block_invoke(uint64_t a1, void *a2)
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
  __atxlog_handle_modes();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __75__ATXModeAnchorModelSuggestionClient_anchorModelDidProvideModeSuggestions___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

- (void)fetchCombinedSuggestionScoreForModeWithUUID:(id)a3 modeType:(int)a4 origin:(int)a5 originBundleId:(id)a6 originAnchorType:(id)a7 confidenceScore:(double)a8 secondsSinceSuggested:(double)a9 serializedTriggers:(id)a10 completionHandler:(id)a11
{
  uint64_t v16;
  uint64_t v17;
  void (**v19)(id, void *);
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  ATXModeSuggestionScorer *v26;

  v16 = *(_QWORD *)&a5;
  v17 = *(_QWORD *)&a4;
  v19 = (void (**)(id, void *))a11;
  v20 = a10;
  v21 = a7;
  v22 = a6;
  v23 = a3;
  v26 = -[ATXModeSuggestionScorer initWithModeUUID:modeType:origin:originBundleId:originAnchorType:confidenceScore:secondsSinceSuggested:serializedTriggers:]([ATXModeSuggestionScorer alloc], "initWithModeUUID:modeType:origin:originBundleId:originAnchorType:confidenceScore:secondsSinceSuggested:serializedTriggers:", v23, v17, v16, v22, v21, v20, a8, a9);

  v24 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXModeSuggestionScorer score](v26, "score");
  objc_msgSend(v24, "numberWithDouble:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2](v19, v25);

}

- (void)fetchCombinedSuggestionScoreAndFlagsForModeWithUUID:(id)a3 modeType:(int)a4 origin:(int)a5 originBundleId:(id)a6 originAnchorType:(id)a7 confidenceScore:(double)a8 secondsSinceSuggested:(double)a9 serializedTriggers:(id)a10 completionHandler:(id)a11
{
  uint64_t v16;
  uint64_t v17;
  void (**v19)(id, void *, uint64_t, uint64_t, uint64_t);
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  ATXModeSuggestionScorer *v26;

  v16 = *(_QWORD *)&a5;
  v17 = *(_QWORD *)&a4;
  v19 = (void (**)(id, void *, uint64_t, uint64_t, uint64_t))a11;
  v20 = a10;
  v21 = a7;
  v22 = a6;
  v23 = a3;
  v26 = -[ATXModeSuggestionScorer initWithModeUUID:modeType:origin:originBundleId:originAnchorType:confidenceScore:secondsSinceSuggested:serializedTriggers:]([ATXModeSuggestionScorer alloc], "initWithModeUUID:modeType:origin:originBundleId:originAnchorType:confidenceScore:secondsSinceSuggested:serializedTriggers:", v23, v17, v16, v22, v21, v20, a8, a9);

  v24 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXModeSuggestionScorer score](v26, "score");
  objc_msgSend(v24, "numberWithDouble:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2](v19, v25, -[ATXModeSuggestionScorer shouldSuggestOnLockScreen](v26, "shouldSuggestOnLockScreen"), -[ATXModeSuggestionScorer shouldSuggestTriggers](v26, "shouldSuggestTriggers"), -[ATXModeSuggestionScorer shouldAllowSmartEntry](v26, "shouldAllowSmartEntry"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcClientHelper, 0);
}

void __49__ATXModeAnchorModelSuggestionClient__pingServer__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "ATXModeAnchorModelSuggestionClient: Error pinging remote object proxy - %@", a5, a6, a7, a8, 2u);
}

void __75__ATXModeAnchorModelSuggestionClient_anchorModelDidProvideModeSuggestions___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "ATXModeAnchorModelSuggestionClient: Error getting remote object proxy to provide new suggestion - %@", a5, a6, a7, a8, 2u);
}

@end
