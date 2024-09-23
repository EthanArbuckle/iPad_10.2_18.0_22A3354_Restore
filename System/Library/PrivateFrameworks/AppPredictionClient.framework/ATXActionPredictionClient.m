@implementation ATXActionPredictionClient

- (ATXActionPredictionClient)init
{
  void *v3;
  void *v4;
  ATXActionPredictionClient *v5;

  objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("caches/ATXCacheFile"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ATXActionPredictionClient initWithCacheBasePath:](self, "initWithCacheBasePath:", v4);

  return v5;
}

- (ATXActionPredictionClient)initWithCacheBasePath:(id)a3
{
  id v5;
  ATXActionPredictionClient *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *serialQueue;
  ATXCacheReader *v10;
  ATXCacheReader *cacheReader;
  uint64_t v12;
  ATXEngagementRecordManager *engagementRecordManager;
  uint64_t v14;
  NSXPCConnection *xpcConnection;
  void *v16;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ATXActionPredictionClient;
  v6 = -[ATXActionPredictionClient init](&v18, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.proactive.AppPrediction.ATXActionPredictionClient.xpc", v7);
    serialQueue = v6->_serialQueue;
    v6->_serialQueue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_cacheBasePath, a3);
    v10 = -[ATXCacheReader initWithCacheBasePath:]([ATXCacheReader alloc], "initWithCacheBasePath:", v6->_cacheBasePath);
    cacheReader = v6->_cacheReader;
    v6->_cacheReader = v10;

    +[ATXEngagementRecordManager sharedInstance](ATXEngagementRecordManager, "sharedInstance");
    v12 = objc_claimAutoreleasedReturnValue();
    engagementRecordManager = v6->_engagementRecordManager;
    v6->_engagementRecordManager = (ATXEngagementRecordManager *)v12;

    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.proactive.ActionPrediction.predictions"), 0);
    xpcConnection = v6->_xpcConnection;
    v6->_xpcConnection = (NSXPCConnection *)v14;

    ATXActionPredictionInterface();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v6->_xpcConnection, "setRemoteObjectInterface:", v16);

    -[NSXPCConnection setInterruptionHandler:](v6->_xpcConnection, "setInterruptionHandler:", &__block_literal_global_1);
    -[NSXPCConnection resume](v6->_xpcConnection, "resume");
  }

  return v6;
}

void __51__ATXActionPredictionClient_initWithCacheBasePath___block_invoke()
{
  NSObject *v0;

  __atxlog_handle_default();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __51__ATXActionPredictionClient_initWithCacheBasePath___block_invoke_cold_1(v0);

}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)ATXActionPredictionClient;
  -[ATXActionPredictionClient dealloc](&v3, sel_dealloc);
}

- (id)actionPredictionsForConsumerSubType:(unsigned __int8)a3 limit:(int)a4
{
  uint64_t v4;
  uint64_t v6;
  NSObject *v7;
  ATXActionPredictionClient *v8;
  uint64_t v9;
  NSObject *v10;
  void *v12;
  void *v13;
  ATXActionCacheClientReader *v14;
  void *v15;
  ATXActionResponse *v16;
  ATXActionResponse *v17;
  uint8_t v18[16];
  uint8_t buf[16];

  v4 = *(_QWORD *)&a4;
  if (a3 == 46)
  {
    __atxlog_handle_blending();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1A49EF000, v10, OS_LOG_TYPE_DEFAULT, "Blending providing suggestions to ATXConsumerSubTypeActionSettings inside ATXActionPredictionClient...", v18, 2u);
    }

    v8 = self;
    v9 = 46;
    goto LABEL_9;
  }
  v6 = a3;
  if (a3 == 21)
  {
    __atxlog_handle_blending();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEFAULT, "Blending providing suggestions to ATXConsumerSubTypeActionSpotlightUnknown inside ATXActionPredictionClient...", buf, 2u);
    }

    v8 = self;
    v9 = 21;
LABEL_9:
    -[ATXActionPredictionClient atxActionResponseFromBlendingActionPredictionCacheForConsumerSubType:limit:](v8, "atxActionResponseFromBlendingActionPredictionCacheForConsumerSubType:limit:", v9, v4);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  -[ATXCacheReader readCacheFileForConsumerSubtype:](self->_cacheReader, "readCacheFileForConsumerSubtype:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)MEMORY[0x1A85A4F90]();
    v14 = -[ATXActionCacheClientReader initWithData:]([ATXActionCacheClientReader alloc], "initWithData:", v12);
    -[ATXActionCacheClientReader actionsWithConsumerSubType:limit:](v14, "actionsWithConsumerSubType:limit:", v6, (int)v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[ATXActionResponse initWithScoredActions:cacheFileData:consumerSubType:error:]([ATXActionResponse alloc], "initWithScoredActions:cacheFileData:consumerSubType:error:", v15, v12, v6, 0);

    objc_autoreleasePoolPop(v13);
  }
  else
  {
    v16 = 0;
  }
  v17 = v16;

  return v17;
}

- (id)atxActionResponseFromBlendingActionPredictionCacheForConsumerSubType:(unsigned __int8)a3 limit:(int)a4
{
  uint64_t v5;
  ATXProactiveSuggestionClient *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  ATXActionResponse *v16;
  void *v17;
  ATXActionResponse *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, void *);
  void *v23;
  ATXActionPredictionClient *v24;
  id v25;
  __int128 *p_buf;
  int v27;
  uint8_t v28[4];
  uint64_t v29;
  __int128 buf;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v5 = a3;
  v33 = *MEMORY[0x1E0C80C00];
  v7 = -[ATXProactiveSuggestionClient initWithConsumerSubType:]([ATXProactiveSuggestionClient alloc], "initWithConsumerSubType:", a3);
  -[ATXProactiveSuggestionClient suggestionLayoutFromCache](v7, "suggestionLayoutFromCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXEngagementRecordManager engagedExecutablesOfType:queryOptions:](self->_engagementRecordManager, "engagedExecutablesOfType:queryOptions:", 35, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allSuggestionsInLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_blending();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v10, "count");
    _os_log_impl(&dword_1A49EF000, v11, OS_LOG_TYPE_DEFAULT, "Blending retrieved a layout with %lu actions in it.", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v31 = 0x2020000000;
  v32 = 0;
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __104__ATXActionPredictionClient_atxActionResponseFromBlendingActionPredictionCacheForConsumerSubType_limit___block_invoke;
  v23 = &unk_1E4D57478;
  v27 = a4;
  p_buf = &buf;
  v24 = self;
  v12 = v9;
  v25 = v12;
  objc_msgSend(v10, "_pas_filteredArrayWithIndexedTest:", &v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_blending();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = objc_msgSend(v13, "count", v20, v21, v22, v23, v24);
    *(_DWORD *)v28 = 134217984;
    v29 = v15;
    _os_log_impl(&dword_1A49EF000, v14, OS_LOG_TYPE_DEFAULT, "Blending created an ATXActionResponse that has %lu actions in it.", v28, 0xCu);
  }

  v16 = [ATXActionResponse alloc];
  objc_msgSend(v8, "uuid");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[ATXActionResponse initWithProactiveSuggestions:blendingModelUICacheUpdateUUID:consumerSubType:error:](v16, "initWithProactiveSuggestions:blendingModelUICacheUpdateUUID:consumerSubType:error:", v13, v17, v5, 0);

  _Block_object_dispose(&buf, 8);
  return v18;
}

uint64_t __104__ATXActionPredictionClient_atxActionResponseFromBlendingActionPredictionCacheForConsumerSubType_limit___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) < (unint64_t)*(int *)(a1 + 56))
  {
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "hasEngagedWithSuggestion:engagedExecutables:", v3, *(_QWORD *)(a1 + 40)))
    {
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      v7 = 1;
      goto LABEL_8;
    }
    __atxlog_handle_blending();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "executableSpecification");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "executableDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_INFO, "recently engaged cache filtered action prediction %@", (uint8_t *)&v9, 0xCu);

    }
  }
  v7 = 0;
LABEL_8:

  return v7;
}

- (id)_atxActionFromProactiveSuggestion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v18;

  v3 = a3;
  objc_msgSend(v3, "executableSpecification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executableClassString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if (v8)
  {
    v9 = (void *)MEMORY[0x1A85A4F90]();
    v10 = (void *)MEMORY[0x1E0CB3710];
    v11 = objc_opt_class();
    objc_msgSend(v3, "executableSpecification");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "executable");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v10, "unarchivedObjectOfClass:fromData:error:", v11, v13, &v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v18;

    objc_autoreleasePoolPop(v9);
    v16 = 0;
    if (v14 && !v15)
      v16 = v14;

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)getActionPredictionsForCandidateBundleIdentifiers:(id)a3 candidateActionTypes:(id)a4 consumerType:(unint64_t)a5 consumerSubType:(unsigned __int8)a6 limit:(int)a7 reply:(id)a8
{
  id v14;
  id v15;
  id v16;
  NSObject *serialQueue;
  void *v18;
  void *v19;
  void *v20;
  _QWORD block[5];
  id v22;
  id v23;
  id v24;
  unint64_t v25;
  int v26;
  unsigned __int8 v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a8;
  if (+[ATXDeviceClass shouldComputeActions](ATXDeviceClass, "shouldComputeActions"))
  {
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __141__ATXActionPredictionClient_getActionPredictionsForCandidateBundleIdentifiers_candidateActionTypes_consumerType_consumerSubType_limit_reply___block_invoke;
    block[3] = &unk_1E4D574C8;
    v24 = v16;
    block[4] = self;
    v22 = v14;
    v23 = v15;
    v25 = a5;
    v27 = a6;
    v26 = a7;
    dispatch_async(serialQueue, block);

    v18 = v24;
  }
  else
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v28 = *MEMORY[0x1E0CB2938];
    v29[0] = CFSTR("Action predictions not supported on this constrained device class");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("ATXActionPredictionClient"), 2, v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, void *))v16 + 2))(v16, 0, v18);
  }

}

void __141__ATXActionPredictionClient_getActionPredictionsForCandidateBundleIdentifiers_candidateActionTypes_consumerType_consumerSubType_limit_reply___block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  _QWORD v15[5];
  dispatch_semaphore_t v16;
  id v17;

  v2 = dispatch_semaphore_create(0);
  v3 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __141__ATXActionPredictionClient_getActionPredictionsForCandidateBundleIdentifiers_candidateActionTypes_consumerType_consumerSubType_limit_reply___block_invoke_2;
  v15[3] = &unk_1E4D574A0;
  v4 = *(id *)(a1 + 56);
  v16 = v2;
  v17 = v4;
  v15[4] = *(_QWORD *)(a1 + 32);
  v5 = v2;
  v6 = (void *)MEMORY[0x1A85A511C](v15);
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v10 = v3;
  v11 = 3221225472;
  v12 = __141__ATXActionPredictionClient_getActionPredictionsForCandidateBundleIdentifiers_candidateActionTypes_consumerType_consumerSubType_limit_reply___block_invoke_3;
  v13 = &unk_1E4D571E0;
  v14 = v6;
  v8 = v6;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", &v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getActionPredictionsForCandidateBundleIdentifiers:candidateActionTypes:consumerType:consumerSubType:limit:reply:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 76), *(unsigned int *)(a1 + 72), v8, v10, v11, v12, v13);

  objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v5, 5.0);
}

intptr_t __141__ATXActionPredictionClient_getActionPredictionsForCandidateBundleIdentifiers_candidateActionTypes_consumerType_consumerSubType_limit_reply___block_invoke_2(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v2 = (id)objc_opt_self();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __141__ATXActionPredictionClient_getActionPredictionsForCandidateBundleIdentifiers_candidateActionTypes_consumerType_consumerSubType_limit_reply___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __atxlog_handle_default();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __141__ATXActionPredictionClient_getActionPredictionsForCandidateBundleIdentifiers_candidateActionTypes_consumerType_consumerSubType_limit_reply___block_invoke_3_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeActionPredictionNotificationsMatchingSuggestion:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (+[ATXDeviceClass shouldComputeActions](ATXDeviceClass, "shouldComputeActions"))
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __89__ATXActionPredictionClient_removeActionPredictionNotificationsMatchingSuggestion_reply___block_invoke;
    v13[3] = &unk_1E4D574F0;
    v13[4] = self;
    v14 = v7;
    v8 = (void *)MEMORY[0x1A85A511C](v13);
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_xpcConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_32);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeActionPredictionNotificationsMatchingSuggestion:reply:", v6, v8);

    v10 = v14;
LABEL_5:

    goto LABEL_6;
  }
  if (v7)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0CB2938];
    v16[0] = CFSTR("Action predictions not supported on this constrained device class");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("ATXActionPredictionClient"), 2, v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, void *))v7 + 2))(v7, v10);
    goto LABEL_5;
  }
LABEL_6:

}

id __89__ATXActionPredictionClient_removeActionPredictionNotificationsMatchingSuggestion_reply___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
    (*(void (**)(void))(v1 + 16))();
  return (id)objc_opt_self();
}

void __89__ATXActionPredictionClient_removeActionPredictionNotificationsMatchingSuggestion_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __141__ATXActionPredictionClient_getActionPredictionsForCandidateBundleIdentifiers_candidateActionTypes_consumerType_consumerSubType_limit_reply___block_invoke_3_cold_1();

}

- (void)shouldDisplayDailyRoutineForContext:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSXPCConnection *xpcConnection;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (+[ATXDeviceClass shouldComputeActions](ATXDeviceClass, "shouldComputeActions"))
  {
    v8 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __71__ATXActionPredictionClient_shouldDisplayDailyRoutineForContext_reply___block_invoke;
    v21[3] = &unk_1E4D57518;
    v21[4] = self;
    v22 = v7;
    v9 = (void *)MEMORY[0x1A85A511C](v21);
    xpcConnection = self->_xpcConnection;
    v16 = v8;
    v17 = 3221225472;
    v18 = __71__ATXActionPredictionClient_shouldDisplayDailyRoutineForContext_reply___block_invoke_2;
    v19 = &unk_1E4D571E0;
    v20 = v9;
    v11 = v9;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", &v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shouldDisplayDailyRoutineForContext:reply:", v6, v11, v16, v17, v18, v19);

    v13 = v22;
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB2938];
    v24[0] = CFSTR("Action predictions not supported on this constrained device class");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("ATXActionPredictionClient"), 2, v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v13);
  }

}

id __71__ATXActionPredictionClient_shouldDisplayDailyRoutineForContext_reply___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return (id)objc_opt_self();
}

void __71__ATXActionPredictionClient_shouldDisplayDailyRoutineForContext_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __atxlog_handle_default();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __141__ATXActionPredictionClient_getActionPredictionsForCandidateBundleIdentifiers_candidateActionTypes_consumerType_consumerSubType_limit_reply___block_invoke_3_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getActionPredictionsForContext:(id)a3 includeBundleIds:(id)a4 excludeBundleIds:(id)a5 includeActionTypes:(id)a6 excludeActionTypes:(id)a7 limit:(unint64_t)a8 reply:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  NSXPCConnection *xpcConnection;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[5];
  id v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a9;
  if (+[ATXDeviceClass shouldComputeActions](ATXDeviceClass, "shouldComputeActions"))
  {
    v21 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __144__ATXActionPredictionClient_getActionPredictionsForContext_includeBundleIds_excludeBundleIds_includeActionTypes_excludeActionTypes_limit_reply___block_invoke;
    v31[3] = &unk_1E4D57540;
    v31[4] = self;
    v32 = v20;
    v22 = (void *)MEMORY[0x1A85A511C](v31);
    xpcConnection = self->_xpcConnection;
    v29[0] = v21;
    v29[1] = 3221225472;
    v29[2] = __144__ATXActionPredictionClient_getActionPredictionsForContext_includeBundleIds_excludeBundleIds_includeActionTypes_excludeActionTypes_limit_reply___block_invoke_2;
    v29[3] = &unk_1E4D571E0;
    v30 = v22;
    v24 = v22;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v29);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "getActionPredictionsForContext:includeBundleIds:excludeBundleIds:includeActionTypes:excludeActionTypes:limit:reply:", v15, v16, v17, v18, v19, a8, v24);

    v26 = v32;
  }
  else
  {
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v33 = *MEMORY[0x1E0CB2938];
    v34[0] = CFSTR("Action predictions not supported on this constrained device class");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("ATXActionPredictionClient"), 2, v28);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, void *))v20 + 2))(v20, 0, v26);
  }

}

id __144__ATXActionPredictionClient_getActionPredictionsForContext_includeBundleIds_excludeBundleIds_includeActionTypes_excludeActionTypes_limit_reply___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return (id)objc_opt_self();
}

void __144__ATXActionPredictionClient_getActionPredictionsForContext_includeBundleIds_excludeBundleIds_includeActionTypes_excludeActionTypes_limit_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __atxlog_handle_default();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __141__ATXActionPredictionClient_getActionPredictionsForCandidateBundleIdentifiers_candidateActionTypes_consumerType_consumerSubType_limit_reply___block_invoke_3_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_engagementRecordManager, 0);
  objc_storeStrong((id *)&self->_cacheReader, 0);
  objc_storeStrong((id *)&self->_cacheBasePath, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

void __51__ATXActionPredictionClient_initWithCacheBasePath___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A49EF000, log, OS_LOG_TYPE_ERROR, "Connection to Action Prediction inspection server interrupted", v1, 2u);
}

void __141__ATXActionPredictionClient_getActionPredictionsForCandidateBundleIdentifiers_candidateActionTypes_consumerType_consumerSubType_limit_reply___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "ERROR: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
