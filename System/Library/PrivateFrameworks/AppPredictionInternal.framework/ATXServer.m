@implementation ATXServer

- (id)consumerSubTypesToUpdateWithRefreshRate:(double)a3 disabledConsumerSubTypes:(id)a4 shouldOverrideRefreshRateForDisabledConsumerSubTypes:(BOOL)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  ATXServer *v15;
  double v16;
  BOOL v17;

  v8 = a4;
  objc_msgSend((id)objc_opt_class(), "consumerSubTypesToUpdate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __131__ATXServer_consumerSubTypesToUpdateWithRefreshRate_disabledConsumerSubTypes_shouldOverrideRefreshRateForDisabledConsumerSubTypes___block_invoke;
  v13[3] = &unk_1E82E7DB8;
  v16 = a3;
  v17 = a5;
  v14 = v8;
  v15 = self;
  v10 = v8;
  objc_msgSend(v9, "_pas_filteredArrayWithTest:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)consumerSubTypesToUpdate
{
  if (consumerSubTypesToUpdate_onceToken != -1)
    dispatch_once(&consumerSubTypesToUpdate_onceToken, &__block_literal_global_31_3);
  return (id)consumerSubTypesToUpdate_consumerSubTypesToUpdate;
}

BOOL __131__ATXServer_consumerSubTypesToUpdateWithRefreshRate_disabledConsumerSubTypes_shouldOverrideRefreshRateForDisabledConsumerSubTypes___block_invoke(uint64_t a1, void *a2)
{
  unsigned __int8 v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  _BOOL8 v11;

  v3 = objc_msgSend(a2, "unsignedIntegerValue");
  v4 = *(double *)(a1 + 48);
  if (*(_BYTE *)(a1 + 56))
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v5, "containsObject:", v6);

    if ((_DWORD)v5)
    {
      +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cacheRefreshIntervalForDisabledAppConsumerSubType");
      v4 = v8;

    }
  }
  objc_msgSend(MEMORY[0x1E0CF8CD0], "sharedInstanceWithMobileAssets");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getFullCachePathWithBaseCachePath:consumerSubType:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = +[ATXFileUtil shouldUpdateCache:withRefreshRate:](ATXFileUtil, "shouldUpdateCache:withRefreshRate:", v10, v4);
  return v11;
}

- (ATXServer)initWithCacheFileBasePath:(id)a3 machServiceName:(id)a4 predictionContextBuilder:(id)a5
{
  id v9;
  id v10;
  id v11;
  ATXServer *v12;
  ATXServer *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *queue;
  uint64_t v17;
  NSXPCListener *listener;
  uint64_t v19;
  NSMutableDictionary *cacheFileDescriptors;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)ATXServer;
  v12 = -[ATXServer init](&v22, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_cacheFileBasePath, a3);
    objc_storeStrong((id *)&v13->_machServiceName, a4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("com.apple.proactive.AppPrediction.ATXServer.queue", v14);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v15;

    objc_storeStrong((id *)&v13->_contextBuilder, a5);
    if (v13->_machServiceName)
    {
      v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", v13->_machServiceName);
      listener = v13->_listener;
      v13->_listener = (NSXPCListener *)v17;

      -[NSXPCListener setDelegate:](v13->_listener, "setDelegate:", v13);
      -[NSXPCListener resume](v13->_listener, "resume");
    }
    v19 = objc_opt_new();
    cacheFileDescriptors = v13->_cacheFileDescriptors;
    v13->_cacheFileDescriptors = (NSMutableDictionary *)v19;

  }
  return v13;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_10 != -1)
    dispatch_once(&sharedInstance_onceToken_10, &__block_literal_global_187);
  return (id)sharedInstance_sharedInstance_0;
}

void __27__ATXServer_sharedInstance__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  ATXServer *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("caches/ATXCacheFile"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByDeletingLastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, 0);

  v4 = [ATXServer alloc];
  objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectory");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingPathComponent:", CFSTR("caches/ATXCacheFile"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CF9250];
  +[ATXPredictionContextBuilder sharedInstance](ATXPredictionContextBuilder, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ATXServer initWithCacheFileBasePath:machServiceName:predictionContextBuilder:](v4, "initWithCacheFileBasePath:machServiceName:predictionContextBuilder:", v5, v6, v7);
  v9 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = v8;

}

- (void)dealloc
{
  NSObject *queue;
  objc_super v4;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __20__ATXServer_dealloc__block_invoke;
  block[3] = &unk_1E82DAC38;
  block[4] = self;
  dispatch_sync(queue, block);
  v4.receiver = self;
  v4.super_class = (Class)ATXServer;
  -[ATXServer dealloc](&v4, sel_dealloc);
}

void __20__ATXServer_dealloc__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "invalidate");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "allValues", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "intValue");
        if ((v7 & 0x80000000) == 0)
          close(v7);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (BOOL)syncGenerateNewAppPredictionsForConsumerSubType:(unsigned __int8)a3 intent:(id)a4 candidateBundleIdentifiers:(id)a5 candidateIntentTypeIdentifiers:(id)a6 featureCache:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  NSObject *queue;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t *v30;
  unsigned __int8 v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  +[_ATXAppPredictor sharedInstance](_ATXAppPredictor, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  queue = self->_queue;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __139__ATXServer_syncGenerateNewAppPredictionsForConsumerSubType_intent_candidateBundleIdentifiers_candidateIntentTypeIdentifiers_featureCache___block_invoke;
  v24[3] = &unk_1E82E7D68;
  v31 = a3;
  v24[4] = self;
  v25 = v16;
  v26 = v12;
  v27 = v13;
  v28 = v14;
  v29 = v15;
  v30 = &v32;
  v18 = v15;
  v19 = v14;
  v20 = v13;
  v21 = v12;
  v22 = v16;
  dispatch_sync(queue, v24);
  LOBYTE(self) = *((_BYTE *)v33 + 24);

  _Block_object_dispose(&v32, 8);
  return (char)self;
}

void __139__ATXServer_syncGenerateNewAppPredictionsForConsumerSubType_intent_candidateBundleIdentifiers_candidateIntentTypeIdentifiers_featureCache___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  const char *v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CF8CD0], "sharedInstanceWithMobileAssets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getFullCachePathWithBaseCachePath:consumerSubType:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(unsigned __int8 *)(a1 + 88));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(*(id *)(a1 + 40), "predictAndWriteCacheFileWithLimit:consumerSubType:intent:candidateBundleIdentifiers:candidateActiontypes:scoreLogger:path:cacheFileDescriptors:featureCache:", 0x7FFFFFFFLL, *(unsigned __int8 *)(a1 + 88), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), 0, v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), *(_QWORD *)(a1 + 72));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v4;
  __atxlog_handle_default();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", *(unsigned __int8 *)(a1 + 88));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v10 = v7;
      v11 = 2112;
      v12 = v3;
      v8 = "Updating App Predictions: Finished app prediction refresh for %@ and writing cache to %@.";
LABEL_6:
      _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, v8, buf, 0x16u);

    }
  }
  else if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", *(unsigned __int8 *)(a1 + 88));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v3;
    v8 = "Updating App Predictions: App prediction refresh for %@ encountered issues writing cache to %@.";
    goto LABEL_6;
  }

}

- (void)generateNewAppPredictionsForConsumerSubType:(unsigned __int8)a3 intent:(id)a4 candidateBundleIdentifiers:(id)a5 candidateIntentTypeIdentifiers:(id)a6 featureCache:(id)a7 reply:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  NSObject *queue;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  unsigned __int8 v34;

  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  +[_ATXAppPredictor sharedInstance](_ATXAppPredictor, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __141__ATXServer_generateNewAppPredictionsForConsumerSubType_intent_candidateBundleIdentifiers_candidateIntentTypeIdentifiers_featureCache_reply___block_invoke;
  v27[3] = &unk_1E82E7D90;
  v34 = a3;
  v27[4] = self;
  v28 = v19;
  v29 = v14;
  v30 = v15;
  v31 = v16;
  v32 = v17;
  v33 = v18;
  v21 = v18;
  v22 = v17;
  v23 = v16;
  v24 = v15;
  v25 = v14;
  v26 = v19;
  dispatch_async(queue, v27);

}

void __141__ATXServer_generateNewAppPredictionsForConsumerSubType_intent_candidateBundleIdentifiers_candidateIntentTypeIdentifiers_featureCache_reply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  const char *v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CF8CD0], "sharedInstanceWithMobileAssets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getFullCachePathWithBaseCachePath:consumerSubType:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(unsigned __int8 *)(a1 + 88));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v2) = objc_msgSend(*(id *)(a1 + 40), "predictAndWriteCacheFileWithLimit:consumerSubType:intent:candidateBundleIdentifiers:candidateActiontypes:scoreLogger:path:cacheFileDescriptors:featureCache:", 0x7FFFFFFFLL, *(unsigned __int8 *)(a1 + 88), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), 0, v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), *(_QWORD *)(a1 + 72));
  __atxlog_handle_default();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v2)
  {
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", *(unsigned __int8 *)(a1 + 88));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v9 = v6;
      v10 = 2112;
      v11 = v3;
      v7 = "Updating App Predictions: Finished app prediction refresh for %@ and writing cache to %@.";
LABEL_6:
      _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, v7, buf, 0x16u);

    }
  }
  else if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", *(unsigned __int8 *)(a1 + 88));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = v3;
    v7 = "Updating App Predictions: App prediction refresh for %@ encountered issues writing cache to %@.";
    goto LABEL_6;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
}

- (void)generateNewAppPredictionsForConsumerSubType:(unsigned __int8)a3 intent:(id)a4 candidateBundleIdentifiers:(id)a5 candidateIntentTypeIdentifiers:(id)a6 reply:(id)a7
{
  -[ATXServer generateNewAppPredictionsForConsumerSubType:intent:candidateBundleIdentifiers:candidateIntentTypeIdentifiers:featureCache:reply:](self, "generateNewAppPredictionsForConsumerSubType:intent:candidateBundleIdentifiers:candidateIntentTypeIdentifiers:featureCache:reply:", a3, a4, a5, a6, 0, a7);
}

- (void)updateBlendingLayerForAllConsumerSubTypes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = objc_msgSend(&unk_1E83D0508, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(&unk_1E83D0508);
        +[ATXAppBlendingUpdater updateBlendingLayerForConsumerSubType:](ATXAppBlendingUpdater, "updateBlendingLayerForConsumerSubType:", objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "unsignedIntValue"));
      }
      while (v3 != v5);
      v3 = objc_msgSend(&unk_1E83D0508, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }
}

- (BOOL)updateAppPredictionsWithConsumerSubTypes:(id)a3 featureCache:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  sel_getName(a2);
  v9 = (void *)os_transaction_create();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    v14 = 1;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v15);
        v17 = (void *)MEMORY[0x1CAA48B6C](v11);
        v14 &= -[ATXServer syncGenerateNewAppPredictionsForConsumerSubType:intent:candidateBundleIdentifiers:candidateIntentTypeIdentifiers:featureCache:](self, "syncGenerateNewAppPredictionsForConsumerSubType:intent:candidateBundleIdentifiers:candidateIntentTypeIdentifiers:featureCache:", objc_msgSend(v16, "unsignedIntegerValue", (_QWORD)v19), 0, 0, 0, v8);
        objc_autoreleasePoolPop(v17);
        ++v15;
      }
      while (v12 != v15);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      v12 = v11;
    }
    while (v11);
  }
  else
  {
    LOBYTE(v14) = 1;
  }

  return v14;
}

void __37__ATXServer_consumerSubTypesToUpdate__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *context;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1CAA48B6C]();
  v0 = (void *)objc_opt_new();
  v1 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = objc_msgSend(&unk_1E83D0520, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v13;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v13 != v4)
          objc_enumerationMutation(&unk_1E83D0520);
        v6 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v5);
        objc_msgSend(MEMORY[0x1E0CF8CD0], "sharedInstanceWithMobileAssets");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "getAssetFileAndSubscoreForConsumerSubType:", objc_msgSend(v6, "intValue"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v0, "containsObject:", v8) & 1) == 0)
        {
          objc_msgSend(v1, "addObject:", v6);
          objc_msgSend(v0, "addObject:", v8);
        }

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(&unk_1E83D0520, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v3);
  }
  v9 = objc_msgSend(v1, "copy");
  v10 = (void *)consumerSubTypesToUpdate_consumerSubTypesToUpdate;
  consumerSubTypesToUpdate_consumerSubTypesToUpdate = v9;

  objc_autoreleasePoolPop(context);
}

- (void)sendFeedbackForConsumerType:(unint64_t)a3 consumerSubType:(unsigned __int8)a4 atxResponse:(id)a5 engagementType:(unint64_t)a6 engagedBundleId:(id)a7 bundleIdsShown:(id)a8 explicitlyRejectedBundleIds:(id)a9 reply:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD block[4];
  id v28;
  id v29;
  id v30;
  ATXServer *v31;
  id v32;
  id v33;
  unint64_t v34;
  unint64_t v35;
  unsigned __int8 v36;

  v16 = a5;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v20 = a10;
  if (__atx_xpc_private_queue_get_onceToken != -1)
    dispatch_once(&__atx_xpc_private_queue_get_onceToken, &__block_literal_global_155);
  v21 = __atx_xpc_private_queue_get_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __149__ATXServer_sendFeedbackForConsumerType_consumerSubType_atxResponse_engagementType_engagedBundleId_bundleIdsShown_explicitlyRejectedBundleIds_reply___block_invoke;
  block[3] = &unk_1E82E7E00;
  v36 = a4;
  v28 = v18;
  v29 = v16;
  v34 = a3;
  v35 = a6;
  v30 = v17;
  v31 = self;
  v32 = v19;
  v33 = v20;
  v22 = v19;
  v23 = v20;
  v24 = v17;
  v25 = v16;
  v26 = v18;
  dispatch_async(v21, block);

}

void __149__ATXServer_sendFeedbackForConsumerType_consumerSubType_atxResponse_engagementType_engagedBundleId_bundleIdsShown_explicitlyRejectedBundleIds_reply___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  unint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void (*v14)(void);
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  uint8_t v18[16];
  uint8_t buf[16];

  __atxlog_handle_xpc();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  __atxlog_handle_xpc();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "sendFeedbackForConsumerType", " enableTelemetry=YES ", buf, 2u);
  }

  __atxlog_handle_default();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);

  if (v7)
  {
    v8 = (void *)objc_opt_new();
    if (objc_msgSend(*(id *)(a1 + 32), "count"))
    {
      v9 = 0;
      do
      {
        if (v9)
          objc_msgSend(v8, "appendString:", CFSTR(", "));
        objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "appendString:", v10);

        ++v9;
      }
      while (objc_msgSend(*(id *)(a1 + 32), "count") > v9);
    }
    __atxlog_handle_default();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      __149__ATXServer_sendFeedbackForConsumerType_consumerSubType_atxResponse_engagementType_engagedBundleId_bundleIdsShown_explicitlyRejectedBundleIds_reply___block_invoke_cold_2(a1, (uint64_t)v8, v11);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 48), "predictionContextForCurrentContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    +[_ATXAppPredictor sharedInstance](_ATXAppPredictor, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "receiveFeedbackForConsumerType:consumerSubType:atxResponse:engagementType:engagedBundleId:bundleIdsShown:explicitlyRejectedBundleIds:context:", *(_QWORD *)(a1 + 80), *(unsigned __int8 *)(a1 + 96), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), v12);

    v14 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
  }
  else
  {
    __atxlog_handle_default();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      __149__ATXServer_sendFeedbackForConsumerType_consumerSubType_atxResponse_engagementType_engagedBundleId_bundleIdsShown_explicitlyRejectedBundleIds_reply___block_invoke_cold_1(v15);

    v14 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
  }
  v14();
  __atxlog_handle_xpc();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)v18 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v17, OS_SIGNPOST_INTERVAL_END, v3, "sendFeedbackForConsumerType", " enableTelemetry=YES ", v18, 2u);
  }

}

- (void)getAppPredictorAssetMappingDescriptionWithReply:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CF8CD0];
  v5 = a3;
  objc_msgSend(v4, "sharedInstanceWithMobileAssets");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getAtxToolDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *, uint64_t))a3 + 2))(v5, v6, 1);

}

- (void)sortAppsByLaunches:(id)a3 reply:(id)a4
{
  id v5;
  void (**v6)(id, id);
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id obj;
  _QWORD v22[4];
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, id))a4;
  if (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked"))
  {
    v6[2](v6, v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ATXAppLaunchHistogramManager sharedInstance](_ATXAppLaunchHistogramManager, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "histogramForLaunchType:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = v5;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v25 != v11)
            objc_enumerationMutation(obj);
          v14 = (void *)MEMORY[0x1E0CB37E8];
          v28 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          v13 = v28;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "totalLaunchesForBundleIds:", v15);
          objc_msgSend(v14, "numberWithDouble:");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, v13);

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v10);
    }

    objc_msgSend(v7, "allKeys");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __38__ATXServer_sortAppsByLaunches_reply___block_invoke;
    v22[3] = &unk_1E82DC570;
    v23 = v7;
    v18 = v7;
    objc_msgSend(v17, "sortedArrayUsingComparator:", v22);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v6[2](v6, v19);
  }

}

uint64_t __38__ATXServer_sortAppsByLaunches_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  uint64_t v12;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "doubleValue");
  if (v9 <= v11)
    v12 = 1;
  else
    v12 = -1;

  return v12;
}

- (void)approvedSiriKitIntentsWithReply:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "approvedSiriKitIntents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *, _QWORD))a3 + 2))(v4, v5, 0);

}

- (void)shouldPredictAppBundleId:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  id v10;

  v6 = a4;
  v7 = a3;
  +[ATXAppPredictionBlacklist sharedInstance](ATXAppPredictionBlacklist, "sharedInstance");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "disabledBundleIds");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v7);

  (*((void (**)(id, _QWORD, _QWORD))a4 + 2))(v6, v9 ^ 1u, 0);
}

- (void)shouldPredictBundleIdForShortcuts:(id)a3 action:(id)a4 forPrimaryShortcuts:(BOOL)a5 reply:(id)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void (**v13)(id, uint64_t, _QWORD);

  v6 = a5;
  v13 = (void (**)(id, uint64_t, _QWORD))a6;
  v9 = a4;
  v10 = a3;
  +[ATXActionPredictionBlacklist sharedInstanceWithoutAppPredictionBlacklist](ATXActionPredictionBlacklist, "sharedInstanceWithoutAppPredictionBlacklist");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "shouldPredictBundleIdForShortcuts:action:forPrimaryShortcuts:", v10, v9, v6);

  v13[2](v13, v12, 0);
}

- (void)getWebsitePredictionsForContextType:(id)a3 limit:(unint64_t)a4 reply:(id)a5
{
  void (**v7)(id, id);
  id v8;
  void *v9;
  id v10;

  v7 = (void (**)(id, id))a5;
  v8 = a3;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "websitePredictionsForContextType:limit:", v8, a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v7[2](v7, v10);
}

- (void)overwriteWebsitePredictionsCacheWithWebsiteString:(id)a3 contextType:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = (id)objc_opt_new();
  objc_msgSend(v7, "overwriteWebsitePredictionsCacheWithWebsiteString:contextType:", v6, v5);

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  BOOL v9;
  NSObject *v10;

  v5 = a4;
  v6 = *MEMORY[0x1E0CF9250];
  objc_msgSend(v5, "valueForEntitlement:", *MEMORY[0x1E0CF9250]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v7, "BOOLValue") & 1) != 0)
  {
    ATXAppPredictionXPCInterface();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setExportedInterface:", v8);

    objc_msgSend(v5, "setExportedObject:", self);
    objc_msgSend(v5, "setInterruptionHandler:", &__block_literal_global_55);
    objc_msgSend(v5, "setInvalidationHandler:", &__block_literal_global_57_3);
    objc_msgSend(v5, "resume");
    v9 = 1;
  }
  else
  {
    __atxlog_handle_default();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ATXNotificationDigestRankerServer listener:shouldAcceptNewConnection:].cold.1((uint64_t)v5, v6, v10);

    v9 = 0;
  }

  return v9;
}

void __48__ATXServer_listener_shouldAcceptNewConnection___block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  __atxlog_handle_default();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __48__ATXServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

void __48__ATXServer_listener_shouldAcceptNewConnection___block_invoke_56()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  __atxlog_handle_default();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __48__ATXServer_listener_shouldAcceptNewConnection___block_invoke_56_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextBuilder, 0);
  objc_storeStrong((id *)&self->_cacheFileDescriptors, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);
  objc_storeStrong((id *)&self->_cacheFileBasePath, 0);
}

void __149__ATXServer_sendFeedbackForConsumerType_consumerSubType_atxResponse_engagementType_engagedBundleId_bundleIdsShown_explicitlyRejectedBundleIds_reply___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_FAULT, "Unable to process sendFeedbackForConsumerType because ATXPredictionContext is nil", v1, 2u);
  OUTLINED_FUNCTION_4();
}

void __149__ATXServer_sendFeedbackForConsumerType_consumerSubType_atxResponse_engagementType_engagedBundleId_bundleIdsShown_explicitlyRejectedBundleIds_reply___block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerType:", *(_QWORD *)(a1 + 80));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", *(unsigned __int8 *)(a1 + 96));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CF9508], "stringForEngagementType:", *(_QWORD *)(a1 + 88));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 48);
  v11 = 138413570;
  v12 = v6;
  v13 = 2112;
  v14 = v7;
  v15 = 2112;
  v16 = v8;
  v17 = 2112;
  v18 = v9;
  v19 = 2112;
  v20 = v10;
  v21 = 2112;
  v22 = a2;
  _os_log_debug_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_DEBUG, "Feedback received:\n  consumerType: %@\n  consumerSubType: %@\n  atxResponse: %@\n  engagementType: %@\n  engagedBundleId: %@\n  itemsShown: %@\n", (uint8_t *)&v11, 0x3Eu);

}

void __48__ATXServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, a1, a3, "Unexpected interruption on App Prediction ATXServer XPC interface", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void __48__ATXServer_listener_shouldAcceptNewConnection___block_invoke_56_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, a1, a3, "Connection invalidated on App Prediction ATXServer XPC interface. Client went away.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

@end
