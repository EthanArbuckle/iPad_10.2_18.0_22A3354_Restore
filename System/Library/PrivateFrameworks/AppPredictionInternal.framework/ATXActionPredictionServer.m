@implementation ATXActionPredictionServer

- (ATXActionPredictionServer)initWithListener:(id)a3 checkEntitlements:(BOOL)a4
{
  id v8;
  ATXActionPredictionServer *v9;
  ATXActionPredictionServer *v10;
  void *v12;
  objc_super v13;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXActionPredictionServer.mm"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("listener"));

  }
  v13.receiver = self;
  v13.super_class = (Class)ATXActionPredictionServer;
  v9 = -[ATXActionPredictionServer init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_checkEntitlements = a4;
    objc_storeStrong((id *)&v9->_listener, a3);
    -[NSXPCListener setDelegate:](v10->_listener, "setDelegate:", v10);
    -[NSXPCListener resume](v10->_listener, "resume");
  }

  return v10;
}

- (ATXActionPredictionServer)init
{
  id v3;
  void *v4;
  ATXActionPredictionServer *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3B58]);
  v4 = (void *)objc_msgSend(v3, "initWithMachServiceName:", *MEMORY[0x1E0CF9258]);
  v5 = -[ATXActionPredictionServer initWithListener:checkEntitlements:](self, "initWithListener:checkEntitlements:", v4, 1);

  return v5;
}

- (id)initAnonymousListener
{
  void *v3;
  ATXActionPredictionServer *v4;

  objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ATXActionPredictionServer initWithListener:checkEntitlements:](self, "initWithListener:checkEntitlements:", v3, 0);

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCListener invalidate](self->_listener, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)ATXActionPredictionServer;
  -[ATXActionPredictionServer dealloc](&v3, sel_dealloc);
}

- (NSXPCListenerEndpoint)endpoint
{
  return -[NSXPCListener endpoint](self->_listener, "endpoint");
}

+ (id)sharedInstance
{
  if (+[ATXActionPredictionServer sharedInstance]::_pasOnceToken2 != -1)
    dispatch_once(&+[ATXActionPredictionServer sharedInstance]::_pasOnceToken2, &__block_literal_global_167);
  return (id)+[ATXActionPredictionServer sharedInstance]::_pasExprOnceResult;
}

void __43__ATXActionPredictionServer_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = objc_opt_new();
  v2 = (void *)+[ATXActionPredictionServer sharedInstance]::_pasExprOnceResult;
  +[ATXActionPredictionServer sharedInstance]::_pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  BOOL v12;
  NSObject *v13;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!self->_checkEntitlements)
    goto LABEL_6;
  v9 = *MEMORY[0x1E0CF9258];
  objc_msgSend(v7, "valueForEntitlement:", *MEMORY[0x1E0CF9258]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v10, "BOOLValue") & 1) != 0)
  {

LABEL_6:
    ATXActionPredictionInterface();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setExportedInterface:", v11);

    objc_msgSend(v8, "setExportedObject:", self);
    objc_msgSend(v8, "setInterruptionHandler:", &__block_literal_global_22_2);
    objc_msgSend(v8, "setInvalidationHandler:", &__block_literal_global_24_2);
    objc_msgSend(v8, "resume");
    v12 = 1;
    goto LABEL_10;
  }
  __atxlog_handle_default();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[ATXNotificationDigestRankerServer listener:shouldAcceptNewConnection:].cold.1((uint64_t)v8, v9, v13);

  v12 = 0;
LABEL_10:

  return v12;
}

void __64__ATXActionPredictionServer_listener_shouldAcceptNewConnection___block_invoke()
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
    __64__ATXActionPredictionServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

void __64__ATXActionPredictionServer_listener_shouldAcceptNewConnection___block_invoke_23()
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
    __64__ATXActionPredictionServer_listener_shouldAcceptNewConnection___block_invoke_23_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

- (void)getActionPredictionsForCandidateBundleIdentifiers:(id)a3 candidateActionTypes:(id)a4 consumerType:(unint64_t)a5 consumerSubType:(unsigned __int8)a6 limit:(int)a7 reply:(id)a8
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  os_signpost_id_t v26;
  unsigned __int8 v27;
  uint8_t buf[16];

  v11 = a3;
  v12 = a4;
  v13 = a8;
  __atxlog_handle_xpc();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_signpost_id_generate(v14);

  __atxlog_handle_xpc();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "getActionPredictionsForCandidateBundleIdentifiers", " enableTelemetry=YES ", buf, 2u);
  }

  v18 = (void *)MEMORY[0x1E0D81590];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __141__ATXActionPredictionServer_getActionPredictionsForCandidateBundleIdentifiers_candidateActionTypes_consumerType_consumerSubType_limit_reply___block_invoke;
  v22[3] = &unk_1E82E6F20;
  v19 = v11;
  v23 = v19;
  v20 = v12;
  v27 = a6;
  v24 = v20;
  v26 = v15;
  v21 = v13;
  v25 = v21;
  objc_msgSend(v18, "runBlockWhenDeviceIsClassCUnlocked:", v22);

}

void __141__ATXActionPredictionServer_getActionPredictionsForCandidateBundleIdentifiers_candidateActionTypes_consumerType_consumerSubType_limit_reply___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  char v11;

  __atx_xpc_private_queue_get();
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __141__ATXActionPredictionServer_getActionPredictionsForCandidateBundleIdentifiers_candidateActionTypes_consumerType_consumerSubType_limit_reply___block_invoke_2;
  block[3] = &unk_1E82E6F20;
  v7 = *(id *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v11 = *(_BYTE *)(a1 + 64);
  v5 = *(void **)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v8 = v3;
  v10 = v4;
  v9 = v5;
  dispatch_async(v2, block);

}

void __141__ATXActionPredictionServer_getActionPredictionsForCandidateBundleIdentifiers_candidateActionTypes_consumerType_consumerSubType_limit_reply___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint8_t buf[16];

  +[ATXActionPredictions predictionsWithCandidateBundleIdentifiers:candidateActiontypes:consumerSubType:firstStageScoreLogger:secondStageScoreLogger:thirdStageScoreLogger:multiStageScoreLogger:](ATXActionPredictions, "predictionsWithCandidateBundleIdentifiers:candidateActiontypes:consumerSubType:firstStageScoreLogger:secondStageScoreLogger:thirdStageScoreLogger:multiStageScoreLogger:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), 0, 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_xpc();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 56);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v4, OS_SIGNPOST_INTERVAL_END, v5, "getActionPredictionsForCandidateBundleIdentifiers", " enableTelemetry=YES ", buf, 2u);
  }

  v6 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "first");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "second");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v7, v8);

}

- (void)removeActionPredictionNotificationsMatchingSuggestion:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  ATXActionPredictionServer *v17;
  id v18;
  os_signpost_id_t v19;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  __atxlog_handle_xpc();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  __atxlog_handle_xpc();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "removeActionPredictionNotificationsMatchingSuggestion", " enableTelemetry=YES ", buf, 2u);
  }

  v12 = (void *)MEMORY[0x1E0D81590];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __89__ATXActionPredictionServer_removeActionPredictionNotificationsMatchingSuggestion_reply___block_invoke;
  v15[3] = &unk_1E82E6F48;
  v13 = v6;
  v16 = v13;
  v17 = self;
  v19 = v9;
  v14 = v7;
  v18 = v14;
  objc_msgSend(v12, "runBlockWhenDeviceIsClassCUnlocked:", v15);

}

void __89__ATXActionPredictionServer_removeActionPredictionNotificationsMatchingSuggestion_reply___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;

  __atx_xpc_private_queue_get();
  v2 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __89__ATXActionPredictionServer_removeActionPredictionNotificationsMatchingSuggestion_reply___block_invoke_2;
  v6[3] = &unk_1E82E6F48;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v7 = v3;
  v8 = v4;
  v10 = *(_QWORD *)(a1 + 56);
  v9 = v5;
  dispatch_async(v2, v6);

}

void __89__ATXActionPredictionServer_removeActionPredictionNotificationsMatchingSuggestion_reply___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  objc_class *v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "atxActionExecutableObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    __atxlog_handle_feedback();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = (objc_class *)objc_opt_class();
      NSStringFromClass(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v5;
      v15 = 2112;
      v16 = v2;
      _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "%@ - removeActionPredictionNotificationsMatchingSuggestion attempting to remove any lockscreen action predictions matching: %@", (uint8_t *)&v13, 0x16u);

    }
    +[ATXActionNotificationServer sharedInstance](ATXActionNotificationServer, "sharedInstance");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject removeActionPredictionNotificationsMatchingAction:](v6, "removeActionPredictionNotificationsMatchingAction:", v2);
  }
  else
  {
    __atxlog_handle_feedback();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v8;
      _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "%@ - removeActionPredictionNotificationsMatchingSuggestion did not find an ATXAction executable object", (uint8_t *)&v13, 0xCu);

    }
  }

  __atxlog_handle_xpc();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 56);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v10, OS_SIGNPOST_INTERVAL_END, v11, "removeActionPredictionNotificationsMatchingSuggestion", " enableTelemetry=YES ", (uint8_t *)&v13, 2u);
  }

  v12 = *(_QWORD *)(a1 + 48);
  if (v12)
    (*(void (**)(uint64_t, _QWORD))(v12 + 16))(v12, 0);

}

- (void)shouldDisplayDailyRoutineForContext:(id)a3 reply:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  os_signpost_id_t v17;
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  __atxlog_handle_xpc();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  __atxlog_handle_xpc();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "shouldDisplayDailyRoutineForContext", " enableTelemetry=YES ", buf, 2u);
  }

  v11 = (void *)MEMORY[0x1E0D81590];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __71__ATXActionPredictionServer_shouldDisplayDailyRoutineForContext_reply___block_invoke;
  v14[3] = &unk_1E82E6F70;
  v12 = v5;
  v15 = v12;
  v17 = v8;
  v13 = v6;
  v16 = v13;
  objc_msgSend(v11, "runBlockWhenDeviceIsClassCUnlocked:", v14);

}

void __71__ATXActionPredictionServer_shouldDisplayDailyRoutineForContext_reply___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD block[4];
  id v7;
  id v8;
  uint64_t v9;

  __atx_xpc_private_queue_get();
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__ATXActionPredictionServer_shouldDisplayDailyRoutineForContext_reply___block_invoke_2;
  block[3] = &unk_1E82E6F70;
  v3 = *(id *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v7 = v3;
  v9 = v4;
  v8 = v5;
  dispatch_async(v2, block);

}

void __71__ATXActionPredictionServer_shouldDisplayDailyRoutineForContext_reply___block_invoke_2(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  uint8_t v6[16];

  +[ATXDailyRoutinesPersonalizationManager sharedInstance](ATXDailyRoutinesPersonalizationManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shouldDisplayDailyRoutineForContext:", a1[4]);
  __atxlog_handle_xpc();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = a1[6];
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v4, OS_SIGNPOST_INTERVAL_END, v5, "shouldDisplayDailyRoutineForContext", " enableTelemetry=YES ", v6, 2u);
  }

  (*(void (**)(void))(a1[5] + 16))();
}

- (void)getActionPredictionsForContext:(id)a3 includeBundleIds:(id)a4 excludeBundleIds:(id)a5 includeActionTypes:(id)a6 excludeActionTypes:(id)a7 limit:(unint64_t)a8 reply:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  os_signpost_id_t v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  unint64_t v41;
  os_signpost_id_t v42;
  uint8_t buf[16];

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v33 = a9;
  __atxlog_handle_xpc();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = os_signpost_id_generate(v19);

  __atxlog_handle_xpc();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "getActionPredictionsForContext", " enableTelemetry=YES ", buf, 2u);
  }

  v23 = (void *)MEMORY[0x1E0D81590];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __144__ATXActionPredictionServer_getActionPredictionsForContext_includeBundleIds_excludeBundleIds_includeActionTypes_excludeActionTypes_limit_reply___block_invoke;
  v34[3] = &unk_1E82E6F98;
  v32 = v14;
  v24 = v14;
  v35 = v24;
  v31 = v15;
  v25 = v15;
  v36 = v25;
  v26 = v16;
  v37 = v26;
  v30 = v17;
  v27 = v17;
  v38 = v27;
  v28 = v18;
  v39 = v28;
  v41 = a8;
  v42 = v20;
  v29 = v33;
  v40 = v29;
  objc_msgSend(v23, "runBlockWhenDeviceIsClassCUnlocked:", v34, v30, v31, v32);

}

void __144__ATXActionPredictionServer_getActionPredictionsForContext_includeBundleIds_excludeBundleIds_includeActionTypes_excludeActionTypes_limit_reply___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  __int128 v10;

  __atx_xpc_private_queue_get();
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __144__ATXActionPredictionServer_getActionPredictionsForContext_includeBundleIds_excludeBundleIds_includeActionTypes_excludeActionTypes_limit_reply___block_invoke_2;
  v3[3] = &unk_1E82E6F98;
  v4 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 64);
  v10 = *(_OWORD *)(a1 + 80);
  v9 = *(id *)(a1 + 72);
  dispatch_async(v2, v3);

}

void __144__ATXActionPredictionServer_getActionPredictionsForContext_includeBundleIds_excludeBundleIds_includeActionTypes_excludeActionTypes_limit_reply___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t v7[16];

  +[ATXDailyRoutinesPersonalizationManager sharedInstance](ATXDailyRoutinesPersonalizationManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getActionPredictionsForContext:includeBundleIds:excludeBundleIds:includeActionTypes:excludeActionTypes:limit:", a1[4], a1[5], a1[6], a1[7], a1[8], a1[10]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_xpc();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = a1[11];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v5, OS_SIGNPOST_INTERVAL_END, v6, "getActionPredictionsForContext", " enableTelemetry=YES ", v7, 2u);
  }

  (*(void (**)(void))(a1[9] + 16))();
}

- (void)pingWithCompletion:(id)a3
{
  (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
}

- (void)suggestionsForIntentSuggestionRequest:(id)a3 clientModelId:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  ATXActionPredictionServer *v21;
  id v22;
  id v23;
  os_signpost_id_t v24;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  __atxlog_handle_xpc();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_generate(v11);

  __atxlog_handle_xpc();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "suggestionsForIntentSuggestionRequest", " enableTelemetry=YES ", buf, 2u);
  }

  v15 = (void *)MEMORY[0x1E0D81590];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __87__ATXActionPredictionServer_suggestionsForIntentSuggestionRequest_clientModelId_reply___block_invoke;
  v19[3] = &unk_1E82E6FC0;
  v16 = v9;
  v20 = v16;
  v21 = self;
  v17 = v8;
  v22 = v17;
  v24 = v12;
  v18 = v10;
  v23 = v18;
  objc_msgSend(v15, "runBlockWhenDeviceIsClassCUnlocked:", v19);

}

void __87__ATXActionPredictionServer_suggestionsForIntentSuggestionRequest_clientModelId_reply___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD block[4];
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;

  __atx_xpc_private_queue_get();
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__ATXActionPredictionServer_suggestionsForIntentSuggestionRequest_clientModelId_reply___block_invoke_2;
  block[3] = &unk_1E82E6FC0;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v10 = v3;
  v11 = v4;
  v6 = v5;
  v8 = *(void **)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 64);
  v12 = v6;
  v14 = v7;
  v13 = v8;
  dispatch_async(v2, block);

}

void __87__ATXActionPredictionServer_suggestionsForIntentSuggestionRequest_clientModelId_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  uint8_t buf[8];
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(MEMORY[0x1E0D81198], "clientModelTypeFromClientModelId:", *(_QWORD *)(a1 + 32));
  if (v2 == 1 || v2 == 3)
  {
    objc_msgSend(*(id *)(a1 + 40), "filteredCachedIntentSuggestionsForClientModelId:request:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v2 != 6)
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Wrong delegate for request. Expected %@ but found ATXActionPredictionServer, which only support SpotlightUnknown / AnchorModel / Heuristics."), *(_QWORD *)(a1 + 32));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", v10, 5, v12);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = 0;
      v7 = 3;
      goto LABEL_11;
    }
    objc_msgSend(*(id *)(a1 + 40), "behavioralModelSuggestionsForRequest:", *(_QWORD *)(a1 + 48));
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
  v6 = 0;
  v7 = 2;
LABEL_11:
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81228]), "initWithSuggestions:feedbackMetadata:originalRequest:responseCode:error:", v5, 0, *(_QWORD *)(a1 + 48), v7, v6);
  __atxlog_handle_xpc();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  v16 = *(_QWORD *)(a1 + 64);
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v15, OS_SIGNPOST_INTERVAL_END, v16, "suggestionsForIntentSuggestionRequest", " enableTelemetry=YES ", buf, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)registerForRealTimeRequestsWithBlendingLayerServer:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(&unk_1E83D0478, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(&unk_1E83D0478);
        objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "integerValue"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "registerRealTimeSuggestionProviderDelegate:clientModelId:", self, v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(&unk_1E83D0478, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (id)behavioralModelSuggestionsForRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  objc_msgSend(v3, "bundleIds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intentClassNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "limit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXActionPredictions actionResultsForCandidateBundleIdentifiers:candidateActiontypes:consumerSubType:firstStageScoreLogger:secondStageScoreLogger:thirdStageScoreLogger:multiStageScoreLogger:predictionsPerAppActionLimit:](ATXActionPredictions, "actionResultsForCandidateBundleIdentifiers:candidateActiontypes:consumerSubType:firstStageScoreLogger:secondStageScoreLogger:thirdStageScoreLogger:multiStageScoreLogger:predictionsPerAppActionLimit:", v4, v5, 21, 0, 0, 0, 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_pas_filteredArrayWithTest:", &__block_literal_global_40);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "actionPredictionBlendingModelVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811A0]), "initWithClientModelId:clientModelVersion:", v9, v11);
  +[ATXProactiveSuggestionBuilder proactiveSuggestionsFromActionResults:clientModelSpec:](ATXProactiveSuggestionBuilder, "proactiveSuggestionsFromActionResults:clientModelSpec:", v8, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __66__ATXActionPredictionServer_behavioralModelSuggestionsForRequest___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSampledResultForLoggingOnly") ^ 1;
}

- (id)filteredCachedIntentSuggestionsForClientModelId:(id)a3 request:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD *v19;
  _QWORD v20[4];

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "cachedSuggestionsForClientModel:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 0;
  objc_msgSend(v8, "suggestions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __85__ATXActionPredictionServer_filteredCachedIntentSuggestionsForClientModelId_request___block_invoke;
  v16[3] = &unk_1E82E7008;
  v12 = v6;
  v17 = v12;
  v19 = v20;
  v13 = v10;
  v18 = v13;
  objc_msgSend(v11, "_pas_filteredArrayWithTest:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v20, 8);
  return v14;
}

uint64_t __85__ATXActionPredictionServer_filteredCachedIntentSuggestionsForClientModelId_request___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  uint64_t v19;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "limit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4
    || (v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24),
        objc_msgSend(*(id *)(a1 + 32), "limit"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "unsignedIntegerValue"),
        v6,
        v4,
        v5 < v7))
  {
    objc_msgSend(v3, "executableSpecification");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "executableType");

    if (v9 == 2)
    {
      objc_msgSend(v3, "executableSpecification");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "executableClassString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", *(_QWORD *)(a1 + 40));

      if ((v12 & 1) != 0)
      {
        objc_msgSend(v3, "executableSpecification");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "executableObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(*(id *)(a1 + 32), "bundleIds");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v15, "count"))
          {
            objc_msgSend(*(id *)(a1 + 32), "bundleIds");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "bundleId");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v16, "containsObject:", v17);

            if ((v18 & 1) == 0)
              goto LABEL_16;
          }
          else
          {

          }
          objc_msgSend(*(id *)(a1 + 32), "intentClassNames");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "count");

          if (!v22)
            goto LABEL_15;
          objc_msgSend(v14, "intent");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "_className");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
          {
            objc_msgSend(*(id *)(a1 + 32), "intentClassNames");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "containsObject:", v24);

            if ((v26 & 1) != 0)
            {
LABEL_15:
              ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
              v19 = 1;
LABEL_17:

              goto LABEL_10;
            }
          }
        }
LABEL_16:
        v19 = 0;
        goto LABEL_17;
      }
    }
  }
  v19 = 0;
LABEL_10:

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
}

void __64__ATXActionPredictionServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, a1, a3, "Unexpected interruption on App Preference client interface", a5, a6, a7, a8, 0);
}

void __64__ATXActionPredictionServer_listener_shouldAcceptNewConnection___block_invoke_23_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, a1, a3, "Connection invalidated on App Preference client interface. Client went away.", a5, a6, a7, a8, 0);
}

@end
