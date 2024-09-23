@implementation ATXClient

void __95__ATXClient_atxResponseFromBlendingAppPredictionCacheForConsumerSubType_filterPredicate_limit___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  ATXScoredPrediction *v10;
  void *v11;
  double v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = v6;
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) >= *(_DWORD *)(a1 + 64))
  {
    *a4 = 1;
  }
  else
  {
    objc_msgSend(v6, "executableSpecification");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "executableObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = [ATXScoredPrediction alloc];
      objc_msgSend(v7, "scoreSpecification");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "rawScore");
      *(float *)&v12 = v12;
      v13 = -[ATXScoredPrediction initWithPredictedItem:score:](v10, "initWithPredictedItem:score:", v9, v12);

      if (v13
        && ((v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)) == 0
         || objc_msgSend(v14, "evaluateWithObject:", v13)))
      {
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v13);
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
        ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      }
      else
      {
        __atxlog_handle_blending();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v16 = 138412290;
          v17 = v9;
          _os_log_impl(&dword_1A49EF000, v15, OS_LOG_TYPE_INFO, "%@ did not pass app prediction deny list filters", (uint8_t *)&v16, 0xCu);
        }

      }
    }
    else
    {
      __atxlog_handle_blending();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        __95__ATXClient_atxResponseFromBlendingAppPredictionCacheForConsumerSubType_filterPredicate_limit___block_invoke_cold_1();
    }

  }
}

- (id)atxResponseFromBlendingAppPredictionCacheForConsumerSubType:(unsigned __int8)a3 filterPredicate:(id)a4 limit:(int)a5
{
  uint64_t v6;
  id v8;
  ATXProactiveSuggestionClient *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  ATXResponse *v19;
  void *v20;
  void *v21;
  ATXResponse *v22;
  NSObject *v23;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD *v28;
  __int128 *p_buf;
  int v30;
  _QWORD v31[3];
  int v32;
  uint8_t v33[4];
  uint64_t v34;
  __int128 buf;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;

  v6 = a3;
  v40 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = -[ATXProactiveSuggestionClient initWithConsumerSubType:]([ATXProactiveSuggestionClient alloc], "initWithConsumerSubType:", v6);
  -[ATXProactiveSuggestionClient suggestionLayoutFromCache](v9, "suggestionLayoutFromCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)objc_opt_new();
    v12 = (void *)objc_opt_new();
    objc_msgSend(v10, "allSuggestionsInLayout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_blending();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v13, "count");
      _os_log_impl(&dword_1A49EF000, v14, OS_LOG_TYPE_DEFAULT, "Blending retrieved a layout with %lu bundleIds in it.", (uint8_t *)&buf, 0xCu);
    }

    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x2020000000;
    v32 = 0;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__7;
    v38 = __Block_byref_object_dispose__7;
    v39 = v8;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __95__ATXClient_atxResponseFromBlendingAppPredictionCacheForConsumerSubType_filterPredicate_limit___block_invoke;
    v25[3] = &unk_1E4D59828;
    v30 = a5;
    v28 = v31;
    p_buf = &buf;
    v15 = v11;
    v26 = v15;
    v16 = v12;
    v27 = v16;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v25);
    __atxlog_handle_blending();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_msgSend(v15, "count");
      *(_DWORD *)v33 = 134217984;
      v34 = v18;
      _os_log_impl(&dword_1A49EF000, v17, OS_LOG_TYPE_DEFAULT, "Blending created an ATXResponse that has %lu bundleIds in it.", v33, 0xCu);
    }

    v19 = [ATXResponse alloc];
    v20 = (void *)objc_opt_new();
    objc_msgSend(v10, "uuid");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[ATXResponse initWithPredictions:proactiveSuggestions:uuid:cacheFileData:blendingUICacheUpdateUUID:error:](v19, "initWithPredictions:proactiveSuggestions:uuid:cacheFileData:blendingUICacheUpdateUUID:error:", v15, v16, v20, 0, v21, 0);

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(v31, 8);

  }
  else
  {
    __atxlog_handle_blending();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1A49EF000, v23, OS_LOG_TYPE_DEFAULT, "There was no cached suggestion layout, falling back to minute zero response", (uint8_t *)&buf, 2u);
    }

    -[ATXClient _minuteZeroResponse](self, "_minuteZeroResponse");
    v22 = (ATXResponse *)objc_claimAutoreleasedReturnValue();
  }

  return v22;
}

- (id)appPredictionsForConsumerSubType:(unsigned __int8)a3 limit:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint8_t v16[16];
  uint8_t buf[16];

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  __atxlog_handle_metrics();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  __atxlog_handle_metrics();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A49EF000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "ATXSpotlightClient.SuggestedApps", " enableTelemetry=YES ", buf, 2u);
  }

  v11 = (void *)objc_opt_new();
  -[ATXClient appPredictionsForConsumerSubType:blackList:limit:runningDiagnostics:](self, "appPredictionsForConsumerSubType:blackList:limit:runningDiagnostics:", v5, v11, v4, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  __atxlog_handle_metrics();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)v16 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A49EF000, v14, OS_SIGNPOST_INTERVAL_END, v8, "ATXSpotlightClient.SuggestedApps", " enableTelemetry=YES ", v16, 2u);
  }

  return v12;
}

- (id)appPredictionsForConsumerSubType:(unsigned __int8)a3 blackList:(id)a4 limit:(int)a5 runningDiagnostics:(BOOL)a6
{
  uint64_t v7;
  uint64_t v8;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  ATXResponse *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  ATXResponse *v23;
  NSObject *v24;
  NSObject *v25;
  ATXResponse *v26;
  void *v27;
  _DWORD v29[2];
  __int16 v30;
  id v31;
  uint64_t v32;

  v7 = *(_QWORD *)&a5;
  v8 = a3;
  v32 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  __atxlog_handle_default();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v29[0] = 67109378;
    v29[1] = v8;
    v30 = 2112;
    v31 = v10;
    _os_log_impl(&dword_1A49EF000, v11, OS_LOG_TYPE_INFO, "App predictions for subtype %i deny list: %@", (uint8_t *)v29, 0x12u);
  }

  if (a6)
  {
    v12 = 0;
  }
  else
  {
    -[ATXClient _predicateForDenyList:](self, "_predicateForDenyList:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if ((_DWORD)v8 != 9)
  {
    -[ATXCacheReader readCacheFileForConsumerSubtype:](self->_cacheReader, "readCacheFileForConsumerSubtype:", v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      ATXCacheFileSplitChunks();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "count") == 2)
      {
        objc_msgSend(v19, "firstObject");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[ATXPredictionSetReader bundleIdReader:](ATXPredictionSetReader, "bundleIdReader:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "readScoredPredictionsWithLimit:filterPredicate:", v7, v12);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[ATXResponse initWithPredictions:cacheFileData:error:]([ATXResponse alloc], "initWithPredictions:cacheFileData:error:", v22, v18, 0);

        if (v23)
        {
LABEL_24:

          goto LABEL_25;
        }
      }
      else
      {
        __atxlog_handle_default();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v29[0]) = 0;
          _os_log_impl(&dword_1A49EF000, v25, OS_LOG_TYPE_DEFAULT, "No chunks returned from cache. (this may be due to a cache file change)", (uint8_t *)v29, 2u);
        }

      }
    }
    v26 = [ATXResponse alloc];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATXClient"), 1, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[ATXResponse initWithPredictions:cacheFileData:error:](v26, "initWithPredictions:cacheFileData:error:", 0, 0, v27);

    goto LABEL_24;
  }
  v13 = (void *)CFPreferencesCopyAppValue(CFSTR("SuggestionsSpotlightZKWEnabled"), CFSTR("com.apple.suggestions"));
  if (v13 && (v14 = v13, v15 = objc_msgSend(v13, "BOOLValue"), v14, !v15))
  {
    __atxlog_handle_blending();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29[0]) = 0;
      _os_log_impl(&dword_1A49EF000, v24, OS_LOG_TYPE_DEFAULT, "Siri setting 'Show Suggestions' turned off. -[ATXClient appPredictionsForConsumerSubType:blackList:limit:runningDiagnostics:] to return an empty ATXResponse", (uint8_t *)v29, 2u);
    }

    v17 = -[ATXResponse initWithPredictions:cacheFileData:error:]([ATXResponse alloc], "initWithPredictions:cacheFileData:error:", 0, 0, 0);
  }
  else
  {
    __atxlog_handle_blending();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29[0]) = 0;
      _os_log_impl(&dword_1A49EF000, v16, OS_LOG_TYPE_DEFAULT, "Blending providing suggestions to ATXConsumerSubTypeSpotlightUnknown inside ATXClient...", (uint8_t *)v29, 2u);
    }

    -[ATXClient atxResponseFromBlendingAppPredictionCacheForConsumerSubType:filterPredicate:limit:](self, "atxResponseFromBlendingAppPredictionCacheForConsumerSubType:filterPredicate:limit:", 9, v12, v7);
    v17 = (ATXResponse *)objc_claimAutoreleasedReturnValue();
  }
  v23 = v17;
LABEL_25:

  return v23;
}

- (id)_predicateForDenyList:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CB3880];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __35__ATXClient__predicateForDenyList___block_invoke;
  v8[3] = &unk_1E4D57DA0;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "predicateWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __35__ATXClient__predicateForDenyList___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_msgSend(v3, "predictedItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[ATXApplicationRecord isInstalledAndNotRestrictedForBundle:](ATXApplicationRecord, "isInstalledAndNotRestrictedForBundle:", v4);

  if (v5)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v3, "predictedItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "containsObject:", v7) ^ 1;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)clientForConsumerType:(unint64_t)a3
{
  return -[ATXClient initWithConsumerType:cacheBasePath:]([ATXClient alloc], "initWithConsumerType:cacheBasePath:", a3, 0);
}

- (ATXClient)initWithConsumerType:(unint64_t)a3 cacheBasePath:(id)a4
{
  id v6;
  ATXClient *v7;
  ATXCacheReader *v8;
  ATXCacheReader *cacheReader;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  objc_super v14;

  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXClient;
  v7 = -[ATXClient init](&v14, sel_init);
  if (v7)
  {
    v8 = -[ATXCacheReader initWithCacheBasePath:]([ATXCacheReader alloc], "initWithCacheBasePath:", v6);
    cacheReader = v7->_cacheReader;
    v7->_cacheReader = v8;

    v7->_consumerType = a3;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.proactive.AppPrediction.client.ATXClientQueue", v10);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v11;

  }
  return v7;
}

+ (id)clientForConsumerType:(unint64_t)a3 cachePath:(const char *)a4
{
  return +[ATXClient clientForConsumerType:](ATXClient, "clientForConsumerType:", a3, a4);
}

+ (id)clientForConsumerType:(unint64_t)a3 cacheBasePath:(id)a4
{
  id v5;
  ATXClient *v6;

  v5 = a4;
  v6 = -[ATXClient initWithConsumerType:cacheBasePath:]([ATXClient alloc], "initWithConsumerType:cacheBasePath:", a3, v5);

  return v6;
}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_3(&dword_1A49EF000, v0, v1, "ATXClient dealloc", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (id)_getConnection
{
  NSXPCConnection *xpcConnection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  void *v6;

  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.proactive.AppPrediction.predictions"), 0);
    v5 = self->_xpcConnection;
    self->_xpcConnection = v4;

    ATXAppPredictionXPCInterface();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcConnection, "setRemoteObjectInterface:", v6);

    -[NSXPCConnection setInterruptionHandler:](self->_xpcConnection, "setInterruptionHandler:", &__block_literal_global_36);
    -[NSXPCConnection resume](self->_xpcConnection, "resume");
    xpcConnection = self->_xpcConnection;
  }
  return xpcConnection;
}

void __27__ATXClient__getConnection__block_invoke()
{
  NSObject *v0;

  __atxlog_handle_default();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __27__ATXClient__getConnection__block_invoke_cold_1();

}

- (id)_asyncProxy
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[ATXClient _getConnection](self, "_getConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __24__ATXClient__asyncProxy__block_invoke;
  v6[3] = &unk_1E4D59210;
  v6[4] = self;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __24__ATXClient__asyncProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __24__ATXClient__asyncProxy__block_invoke_cold_1();

}

- (id)_syncProxy
{
  void *v2;
  void *v3;

  -[ATXClient _getConnection](self, "_getConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_10_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __23__ATXClient__syncProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __24__ATXClient__asyncProxy__block_invoke_cold_1();

}

- (void)sortAppsByLaunches:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[ATXClient _getConnection](self, "_getConnection");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortAppsByLaunches:reply:", v7, v6);

}

- (id)approvedSiriKitIntents
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__7;
  v11 = __Block_byref_object_dispose__7;
  v12 = (id)MEMORY[0x1E0C9AA60];
  -[ATXClient _getConnection](self, "_getConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__ATXClient_approvedSiriKitIntents__block_invoke_12;
  v6[3] = &unk_1E4D597D8;
  v6[4] = &v7;
  objc_msgSend(v3, "approvedSiriKitIntentsWithReply:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __35__ATXClient_approvedSiriKitIntents__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __35__ATXClient_approvedSiriKitIntents__block_invoke_cold_1();

}

void __35__ATXClient_approvedSiriKitIntents__block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    __atxlog_handle_default();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __35__ATXClient_approvedSiriKitIntents__block_invoke_cold_1();

  }
  if (objc_msgSend(v6, "count"))
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);

}

- (BOOL)shouldPredictAppBundleId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[ATXClient _getConnection](self, "_getConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__ATXClient_shouldPredictAppBundleId___block_invoke_15;
  v8[3] = &unk_1E4D59800;
  v8[4] = &v9;
  objc_msgSend(v6, "shouldPredictAppBundleId:reply:", v4, v8);

  LOBYTE(v5) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return (char)v5;
}

void __38__ATXClient_shouldPredictAppBundleId___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __38__ATXClient_shouldPredictAppBundleId___block_invoke_cold_1();

}

void __38__ATXClient_shouldPredictAppBundleId___block_invoke_15(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (v5)
  {
    __atxlog_handle_default();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __38__ATXClient_shouldPredictAppBundleId___block_invoke_cold_1();

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;

}

- (BOOL)shouldPredictBundleIdForShortcuts:(id)a3 action:(id)a4
{
  return -[ATXClient shouldPredictBundleIdForShortcuts:action:forPrimaryShortcuts:](self, "shouldPredictBundleIdForShortcuts:action:forPrimaryShortcuts:", a3, a4, 0);
}

- (BOOL)shouldPredictBundleIdForShortcuts:(id)a3 action:(id)a4 forPrimaryShortcuts:(BOOL)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  -[ATXClient _getConnection](self, "_getConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_17_0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__ATXClient_shouldPredictBundleIdForShortcuts_action_forPrimaryShortcuts___block_invoke_18;
  v13[3] = &unk_1E4D59800;
  v13[4] = &v14;
  objc_msgSend(v11, "shouldPredictBundleIdForShortcuts:action:forPrimaryShortcuts:reply:", v8, v9, v5, v13);

  LOBYTE(v5) = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  return v5;
}

void __74__ATXClient_shouldPredictBundleIdForShortcuts_action_forPrimaryShortcuts___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __74__ATXClient_shouldPredictBundleIdForShortcuts_action_forPrimaryShortcuts___block_invoke_cold_1();

}

void __74__ATXClient_shouldPredictBundleIdForShortcuts_action_forPrimaryShortcuts___block_invoke_18(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (v5)
  {
    __atxlog_handle_default();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __74__ATXClient_shouldPredictBundleIdForShortcuts_action_forPrimaryShortcuts___block_invoke_cold_1();

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;

}

- (void)logUserFeedback:(id)a3 consumerSubType:(unsigned __int8)a4 engagementType:(unint64_t)a5 bundleIdentifier:(id)a6 bundleIdsShown:(id)a7 explicitlyRejectedIds:(id)a8
{
  uint64_t v12;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  unint64_t v21;
  void *v22;
  NSObject *v23;
  NSObject *queue;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  _QWORD block[5];
  id v34;
  id v35;
  id v36;
  id v37;
  unint64_t v38;
  char v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  id v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v12 = a4;
  v52 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  __atxlog_handle_default();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);

  if (v19)
  {
    v32 = a5;
    v20 = (void *)objc_opt_new();
    if (objc_msgSend(v16, "count"))
    {
      v21 = 0;
      do
      {
        if (v21)
          objc_msgSend(v20, "appendString:", CFSTR(", "));
        objc_msgSend(v16, "objectAtIndexedSubscript:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "appendString:", v22);

        ++v21;
      }
      while (objc_msgSend(v16, "count") > v21);
    }
    __atxlog_handle_default();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerType:", self->_consumerType);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", v12);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CF9508], "stringForEngagementType:", v32);
      *(_DWORD *)buf = 138413570;
      v41 = v31;
      v42 = 2112;
      v43 = v14;
      v44 = 2112;
      v45 = v29;
      v46 = 2112;
      v47 = objc_claimAutoreleasedReturnValue();
      v30 = (void *)v47;
      v48 = 2112;
      v49 = v15;
      v50 = 2112;
      v51 = v20;
      _os_log_debug_impl(&dword_1A49EF000, v23, OS_LOG_TYPE_DEBUG, "sending feedback for\n  consumerType:%@\n  atxResponse: ***(%@)***\n  consumerSubType:%@\n  engagementType:%@\n  bundleIdentifier:%@\n  bundleIdsShown:%@", buf, 0x3Eu);

    }
    a5 = v32;
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __114__ATXClient_logUserFeedback_consumerSubType_engagementType_bundleIdentifier_bundleIdsShown_explicitlyRejectedIds___block_invoke;
  block[3] = &unk_1E4D59870;
  v39 = v12;
  block[4] = self;
  v34 = v14;
  v35 = v15;
  v36 = v16;
  v37 = v17;
  v38 = a5;
  v25 = v17;
  v26 = v16;
  v27 = v15;
  v28 = v14;
  dispatch_async(queue, block);

}

void __114__ATXClient_logUserFeedback_consumerSubType_engagementType_bundleIdentifier_bundleIdsShown_explicitlyRejectedIds___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_asyncProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendFeedbackForConsumerType:consumerSubType:atxResponse:engagementType:engagedBundleId:bundleIdsShown:explicitlyRejectedBundleIds:reply:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(unsigned __int8 *)(a1 + 80), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), &__block_literal_global_39);

}

void __114__ATXClient_logUserFeedback_consumerSubType_engagementType_bundleIdentifier_bundleIdsShown_explicitlyRejectedIds___block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v3;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  NSObject *v7;
  os_log_type_t v8;
  __int16 v9;
  __int16 v10;

  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (a2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v10 = 0;
      v5 = "ATXClient logUserFeedback -- server returned SUCCESS";
      v6 = (uint8_t *)&v10;
      v7 = v4;
      v8 = OS_LOG_TYPE_INFO;
LABEL_6:
      _os_log_impl(&dword_1A49EF000, v7, v8, v5, v6, 2u);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 0;
    v5 = "ATXClient logUserFeedback -- server returned FAILURE";
    v6 = (uint8_t *)&v9;
    v7 = v4;
    v8 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_6;
  }

}

- (BOOL)forceCacheUpdateForConsumerSubType:(unsigned __int8)a3 intent:(id)a4 candidateBundleIdentifiers:(id)a5 candidateIntentTypeIdentifiers:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *queue;
  id v14;
  id v15;
  id v16;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  uint64_t *v22;
  unsigned __int8 v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  queue = self->_queue;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __113__ATXClient_forceCacheUpdateForConsumerSubType_intent_candidateBundleIdentifiers_candidateIntentTypeIdentifiers___block_invoke;
  v18[3] = &unk_1E4D598C0;
  v23 = a3;
  v18[4] = self;
  v19 = v10;
  v20 = v11;
  v21 = v12;
  v22 = &v24;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_sync(queue, v18);
  LOBYTE(queue) = *((_BYTE *)v25 + 24);

  _Block_object_dispose(&v24, 8);
  return (char)queue;
}

void __113__ATXClient_forceCacheUpdateForConsumerSubType_intent_candidateBundleIdentifiers_candidateIntentTypeIdentifiers___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[5];

  objc_msgSend(*(id *)(a1 + 32), "_syncProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(unsigned __int8 *)(a1 + 72);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __113__ATXClient_forceCacheUpdateForConsumerSubType_intent_candidateBundleIdentifiers_candidateIntentTypeIdentifiers___block_invoke_2;
  v7[3] = &unk_1E4D59898;
  v6 = *(_QWORD *)(a1 + 56);
  v7[4] = *(_QWORD *)(a1 + 64);
  objc_msgSend(v2, "generateNewAppPredictionsForConsumerSubType:intent:candidateBundleIdentifiers:candidateIntentTypeIdentifiers:reply:", v3, v4, v5, v6, v7);

}

void __113__ATXClient_forceCacheUpdateForConsumerSubType_intent_candidateBundleIdentifiers_candidateIntentTypeIdentifiers___block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (a2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __113__ATXClient_forceCacheUpdateForConsumerSubType_intent_candidateBundleIdentifiers_candidateIntentTypeIdentifiers___block_invoke_2_cold_1();
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_DEFAULT, "ATXClient forceCacheUpdate -- server returned FAILURE", v5, 2u);
  }

}

- (id)getAppPredictorAssetMappingDescription
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  __CFString *v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = &stru_1E4D5DB30;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__ATXClient_getAppPredictorAssetMappingDescription__block_invoke;
  v5[3] = &unk_1E4D587F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __51__ATXClient_getAppPredictorAssetMappingDescription__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "_syncProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__ATXClient_getAppPredictorAssetMappingDescription__block_invoke_2;
  v3[3] = &unk_1E4D598E8;
  v3[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "getAppPredictorAssetMappingDescriptionWithReply:", v3);

}

void __51__ATXClient_getAppPredictorAssetMappingDescription__block_invoke_2(uint64_t a1, void *a2, int a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint8_t v10[16];

  v5 = a2;
  __atxlog_handle_default();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __51__ATXClient_getAppPredictorAssetMappingDescription__block_invoke_2_cold_1();

    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = v5;
    v7 = *(NSObject **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v9;
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEFAULT, "ATXClient getAppPredictorAssetMappingDescription -- server returned FAILURE", v10, 2u);
  }

}

- (id)_simulatorResponse
{
  ATXScoredPrediction *v2;
  double v3;
  ATXScoredPrediction *v4;
  double v5;
  ATXScoredPrediction *v6;
  double v7;
  ATXScoredPrediction *v8;
  ATXScoredPrediction *v9;
  double v10;
  ATXScoredPrediction *v11;
  ATXScoredPrediction *v12;
  double v13;
  ATXScoredPrediction *v14;
  ATXScoredPrediction *v15;
  double v16;
  ATXScoredPrediction *v17;
  ATXScoredPrediction *v18;
  double v19;
  ATXScoredPrediction *v20;
  ATXScoredPrediction *v21;
  double v22;
  ATXScoredPrediction *v23;
  ATXScoredPrediction *v24;
  double v25;
  ATXScoredPrediction *v26;
  ATXScoredPrediction *v27;
  double v28;
  ATXScoredPrediction *v29;
  ATXScoredPrediction *v30;
  double v31;
  ATXScoredPrediction *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  ATXResponse *v37;
  ATXScoredPrediction *v39;
  ATXScoredPrediction *v40;
  _QWORD v42[12];

  v42[11] = *MEMORY[0x1E0C80C00];
  v2 = [ATXScoredPrediction alloc];
  LODWORD(v3) = 11.0;
  v40 = -[ATXScoredPrediction initWithPredictedItem:score:](v2, "initWithPredictedItem:score:", CFSTR("com.apple.reminders"), v3);
  v42[0] = v40;
  v4 = [ATXScoredPrediction alloc];
  LODWORD(v5) = 10.0;
  v39 = -[ATXScoredPrediction initWithPredictedItem:score:](v4, "initWithPredictedItem:score:", CFSTR("com.apple.news"), v5);
  v42[1] = v39;
  v6 = [ATXScoredPrediction alloc];
  LODWORD(v7) = 9.0;
  v8 = -[ATXScoredPrediction initWithPredictedItem:score:](v6, "initWithPredictedItem:score:", CFSTR("com.apple.mobilecal"), v7);
  v42[2] = v8;
  v9 = [ATXScoredPrediction alloc];
  LODWORD(v10) = 8.0;
  v11 = -[ATXScoredPrediction initWithPredictedItem:score:](v9, "initWithPredictedItem:score:", CFSTR("com.apple.shortcuts"), v10);
  v42[3] = v11;
  v12 = [ATXScoredPrediction alloc];
  LODWORD(v13) = 7.0;
  v14 = -[ATXScoredPrediction initWithPredictedItem:score:](v12, "initWithPredictedItem:score:", CFSTR("com.apple.MobileSMS"), v13);
  v42[4] = v14;
  v15 = [ATXScoredPrediction alloc];
  LODWORD(v16) = 6.0;
  v17 = -[ATXScoredPrediction initWithPredictedItem:score:](v15, "initWithPredictedItem:score:", CFSTR("com.apple.mobileslideshow"), v16);
  v42[5] = v17;
  v18 = [ATXScoredPrediction alloc];
  LODWORD(v19) = 5.0;
  v20 = -[ATXScoredPrediction initWithPredictedItem:score:](v18, "initWithPredictedItem:score:", CFSTR("com.apple.mobilesafari"), v19);
  v42[6] = v20;
  v21 = [ATXScoredPrediction alloc];
  LODWORD(v22) = 4.0;
  v23 = -[ATXScoredPrediction initWithPredictedItem:score:](v21, "initWithPredictedItem:score:", CFSTR("com.apple.MobileAddressBook"), v22);
  v42[7] = v23;
  v24 = [ATXScoredPrediction alloc];
  LODWORD(v25) = 3.0;
  v26 = -[ATXScoredPrediction initWithPredictedItem:score:](v24, "initWithPredictedItem:score:", CFSTR("com.apple.reminders"), v25);
  v42[8] = v26;
  v27 = [ATXScoredPrediction alloc];
  LODWORD(v28) = 2.0;
  v29 = -[ATXScoredPrediction initWithPredictedItem:score:](v27, "initWithPredictedItem:score:", CFSTR("com.apple.Maps"), v28);
  v42[9] = v29;
  v30 = [ATXScoredPrediction alloc];
  LODWORD(v31) = 1.0;
  v32 = -[ATXScoredPrediction initWithPredictedItem:score:](v30, "initWithPredictedItem:score:", CFSTR("com.apple.Preferences"), v31);
  v42[10] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 11);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = (void *)objc_opt_new();
  -[ATXClient _predicateForDenyList:](self, "_predicateForDenyList:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "filteredArrayUsingPredicate:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = -[ATXResponse initWithPredictions:cacheFileData:error:]([ATXResponse alloc], "initWithPredictions:cacheFileData:error:", v36, 0, 0);
  return v37;
}

+ (id)dayZeroBundleIdsAndScoresFromDayZeroParameters:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("dayZero"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("dayZeroBumps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
  }
  else
  {
    __atxlog_handle_default();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      +[ATXClient dayZeroBundleIdsAndScoresFromDayZeroParameters:].cold.1();

    v5 = (id)MEMORY[0x1E0C9AA70];
  }

  return v5;
}

- (id)_minuteZeroResponse
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  ATXScoredPrediction *v17;
  double v18;
  ATXScoredPrediction *v19;
  ATXResponse *v20;
  void *v21;
  ATXResponse *v22;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  ATXAssetsABHelper *v28;
  id obj;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[4];
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v28 = -[ATXAssetsABHelper initWithAssetsForResource:ofType:specifiedABGroup:]([ATXAssetsABHelper alloc], "initWithAssetsForResource:ofType:specifiedABGroup:", CFSTR("_ATXAppPredictorDayZero"), CFSTR("plist"), 0);
  -[ATXAssetsABHelper abGroupContents](v28, "abGroupContents");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "dayZeroBundleIdsAndScoresFromDayZeroParameters:", v27);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __32__ATXClient__minuteZeroResponse__block_invoke;
  v35[3] = &unk_1E4D58578;
  v25 = v2;
  v26 = v3;
  v36 = v25;
  objc_msgSend(v3, "sortedArrayUsingComparator:", v35);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v32;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v32 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v9);
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811A0]), "initWithClientModelId:clientModelVersion:", CFSTR("app_zkw_minute_zero"), CFSTR("1.0"));
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811A8]), "initWithExecutableObject:executableDescription:executableIdentifier:suggestionExecutableType:", v10, v10, v10, 1);
        v13 = objc_alloc(MEMORY[0x1E0D811D0]);
        LOWORD(v24) = 1;
        v14 = (void *)objc_msgSend(v13, "initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:", v10, 0, 0, MEMORY[0x1E0C9AA60], 0, 0, v24);
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811C0]), "initWithRawScore:suggestedConfidenceCategory:", 2, 0.0);
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81190]), "initWithClientModelSpecification:executableSpecification:uiSpecification:scoreSpecification:", v11, v12, v14, v15);
        objc_msgSend(v30, "addObject:", v16);
        v17 = [ATXScoredPrediction alloc];
        LODWORD(v18) = 0;
        v19 = -[ATXScoredPrediction initWithPredictedItem:score:](v17, "initWithPredictedItem:score:", v10, v18);
        objc_msgSend(v5, "addObject:", v19);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v7);
  }

  v20 = [ATXResponse alloc];
  v21 = (void *)objc_opt_new();
  v22 = -[ATXResponse initWithPredictions:proactiveSuggestions:uuid:cacheFileData:blendingUICacheUpdateUUID:error:](v20, "initWithPredictions:proactiveSuggestions:uuid:cacheFileData:blendingUICacheUpdateUUID:error:", v5, v30, v21, 0, 0, 0);

  return v22;
}

uint64_t __32__ATXClient__minuteZeroResponse__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKey:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "compare:", v7);
  return v9;
}

- (void)getWebsitePredictionsForContextType:(id)a3 limit:(unint64_t)a4 reply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v8 = a5;
  v9 = a3;
  -[ATXClient _getConnection](self, "_getConnection");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteObjectProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "getWebsitePredictionsForContextType:limit:reply:", v9, a4, v8);

}

- (void)overwriteWebsitePredictionsCacheWithWebsiteString:(id)a3 contextType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[ATXClient _getConnection](self, "_getConnection");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "overwriteWebsitePredictionsCacheWithWebsiteString:contextType:", v7, v6);

}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheReader, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __27__ATXClient__getConnection__block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_1A49EF000, v0, OS_LOG_TYPE_ERROR, "Connection to App Prediction server interrupted", v1, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __24__ATXClient__asyncProxy__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "ATXClient XPC error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __35__ATXClient_approvedSiriKitIntents__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "Could not obtain SiriKit intents: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __38__ATXClient_shouldPredictAppBundleId___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "Could not evaluate app prediction eligibility: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __74__ATXClient_shouldPredictBundleIdForShortcuts_action_forPrimaryShortcuts___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "Could not evaluate action prediction eligibility: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __95__ATXClient_atxResponseFromBlendingAppPredictionCacheForConsumerSubType_filterPredicate_limit___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, v0, v1, "Could not unarchive executable object from app prediction cache", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __113__ATXClient_forceCacheUpdateForConsumerSubType_intent_candidateBundleIdentifiers_candidateIntentTypeIdentifiers___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_3(&dword_1A49EF000, v0, v1, "ATXClient forceCacheUpdate -- server returned SUCCESS", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __51__ATXClient_getAppPredictorAssetMappingDescription__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_3(&dword_1A49EF000, v0, v1, "ATXClient getAppPredictorAssetMappingDescription -- server returned SUCCESS", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)dayZeroBundleIdsAndScoresFromDayZeroParameters:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, v0, v1, "Day zero scores could not be loaded", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
