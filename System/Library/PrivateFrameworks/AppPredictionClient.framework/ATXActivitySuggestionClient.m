@implementation ATXActivitySuggestionClient

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_8 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_8, &__block_literal_global_47);
  return (id)sharedInstance__pasExprOnceResult_9;
}

void __45__ATXActivitySuggestionClient_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A85A4F90]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_9;
  sharedInstance__pasExprOnceResult_9 = v1;

  objc_autoreleasePoolPop(v0);
}

- (ATXActivitySuggestionClient)init
{
  void *v3;
  ATXActivitySuggestionClient *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[ATXActivitySuggestionClient initWithRoutineManager:](self, "initWithRoutineManager:", v3);

  return v4;
}

- (ATXActivitySuggestionClient)initWithRoutineManager:(id)a3
{
  id v5;
  ATXActivitySuggestionClient *v6;
  NSObject *v7;
  uint64_t v8;
  NSHashTable *observers;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  void *v13;
  void *v14;
  uint64_t v15;
  BMStream *inferredModeStream;
  ATXActivitySuggestionFeedbackStream *v17;
  ATXActivitySuggestionFeedbackStream *feedbackStream;
  id v19;
  OS_dispatch_queue *v20;
  uint64_t v21;
  uint64_t v22;
  _PASSimpleCoalescingTimer *coalescingTimer;
  void *v24;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id buf[2];
  objc_super v31;

  v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)ATXActivitySuggestionClient;
  v6 = -[ATXActivitySuggestionClient init](&v31, sel_init);
  if (v6)
  {
    __atxlog_handle_modes();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEFAULT, "Creating ATXActivitySuggestionClient", (uint8_t *)buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v8 = objc_claimAutoreleasedReturnValue();
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v8;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("ATXActivitySuggestionClient.queue", v10);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v11;

    BiomeLibrary();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UserFocus");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "InferredMode");
    v15 = objc_claimAutoreleasedReturnValue();
    inferredModeStream = v6->_inferredModeStream;
    v6->_inferredModeStream = (BMStream *)v15;

    v17 = -[ATXActivitySuggestionFeedbackStream initWithStoreConfig:]([ATXActivitySuggestionFeedbackStream alloc], "initWithStoreConfig:", 0);
    feedbackStream = v6->_feedbackStream;
    v6->_feedbackStream = v17;

    objc_initWeak(buf, v6);
    v19 = objc_alloc(MEMORY[0x1E0D81618]);
    v20 = v6->_queue;
    v21 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __54__ATXActivitySuggestionClient_initWithRoutineManager___block_invoke;
    v28[3] = &unk_1E4D579D8;
    objc_copyWeak(&v29, buf);
    v22 = objc_msgSend(v19, "initWithQueue:operation:", v20, v28);
    coalescingTimer = v6->_coalescingTimer;
    v6->_coalescingTimer = (_PASSimpleCoalescingTimer *)v22;

    objc_storeStrong((id *)&v6->_routineManager, a3);
    v24 = (void *)MEMORY[0x1E0D81590];
    v26[0] = v21;
    v26[1] = 3221225472;
    v26[2] = __54__ATXActivitySuggestionClient_initWithRoutineManager___block_invoke_2;
    v26[3] = &unk_1E4D579D8;
    objc_copyWeak(&v27, buf);
    objc_msgSend(v24, "runBlockWhenDeviceIsClassCUnlockedWithQoS:block:", 25, v26);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);
    objc_destroyWeak(buf);
  }

  return v6;
}

void __54__ATXActivitySuggestionClient_initWithRoutineManager___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_modeDidChange");

}

void __54__ATXActivitySuggestionClient_initWithRoutineManager___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_fetchAndCacheLOIs");

}

- (void)dealloc
{
  objc_super v3;

  -[BPSSink cancel](self->_sink, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)ATXActivitySuggestionClient;
  -[ATXActivitySuggestionClient dealloc](&v3, sel_dealloc);
}

- (void)_setUpPublisherIfNecessary
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A49EF000, v0, v1, "ATXActivitySuggestionClient: Inferred mode stream is nil, trying again", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __57__ATXActivitySuggestionClient__setUpPublisherIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v2 = a2;
  v3 = objc_msgSend(v2, "state");
  __atxlog_handle_modes();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __57__ATXActivitySuggestionClient__setUpPublisherIfNecessary__block_invoke_cold_1(v2, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "ATXActivitySuggestionClient: done listening to mode events", v6, 2u);
  }

}

void __57__ATXActivitySuggestionClient__setUpPublisherIfNecessary__block_invoke_19(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;

  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v3, "eventBody");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isStart");

    if (v6)
    {
      __atxlog_handle_modes();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        __57__ATXActivitySuggestionClient__setUpPublisherIfNecessary__block_invoke_19_cold_2((uint64_t)WeakRetained, v3, v7);

      objc_msgSend(WeakRetained[7], "runAfterDelaySeconds:coalescingBehavior:", 1, 0.5);
    }
  }
  else
  {
    __atxlog_handle_modes();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __57__ATXActivitySuggestionClient__setUpPublisherIfNecessary__block_invoke_19_cold_1();

  }
}

- (void)registerObserver:(id)a3
{
  -[ATXActivitySuggestionClient registerObserver:sendingInitialChangeNotification:](self, "registerObserver:sendingInitialChangeNotification:", a3, 0);
}

- (void)registerObserver:(id)a3 sendingInitialChangeNotification:(BOOL)a4
{
  id v6;
  ATXActivitySuggestionClient *v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  BOOL v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  __atxlog_handle_modes();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v6;
    _os_log_impl(&dword_1A49EF000, v8, OS_LOG_TYPE_DEFAULT, "ATXActivitySuggestionClient: registered %@", buf, 0xCu);
  }

  -[NSHashTable addObject:](v7->_observers, "addObject:", v6);
  v9 = (void *)MEMORY[0x1E0D81590];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __81__ATXActivitySuggestionClient_registerObserver_sendingInitialChangeNotification___block_invoke;
  v11[3] = &unk_1E4D57D50;
  v11[4] = v7;
  v13 = a4;
  v10 = v6;
  v12 = v10;
  objc_msgSend(v9, "runBlockWhenDeviceIsClassCUnlockedWithQoS:block:", 25, v11);

  objc_sync_exit(v7);
}

void __81__ATXActivitySuggestionClient_registerObserver_sendingInitialChangeNotification___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD block[5];
  id v3;
  char v4;

  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __81__ATXActivitySuggestionClient_registerObserver_sendingInitialChangeNotification___block_invoke_2;
  block[3] = &unk_1E4D57D50;
  v1 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  block[1] = 3221225472;
  v4 = *(_BYTE *)(a1 + 48);
  v3 = v1;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __81__ATXActivitySuggestionClient_registerObserver_sendingInitialChangeNotification___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_setUpPublisherIfNecessary");
  if (*(_BYTE *)(a1 + 48))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v2 = *(_QWORD *)(a1 + 32);
      v3 = *(void **)(a1 + 40);
      v4 = *(NSObject **)(v2 + 32);
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __81__ATXActivitySuggestionClient_registerObserver_sendingInitialChangeNotification___block_invoke_3;
      v5[3] = &unk_1E4D57258;
      v5[4] = v2;
      v6 = v3;
      dispatch_async(v4, v5);

    }
  }
}

void __81__ATXActivitySuggestionClient_registerObserver_sendingInitialChangeNotification___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "currentSuggestion");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "activitySuggestionClient:didSuggestActivity:", *(_QWORD *)(a1 + 32), v2);

}

- (void)removeObserver:(id)a3
{
  ATXActivitySuggestionClient *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSHashTable removeObject:](v4->_observers, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (id)suggestionWithUUID:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (objc_class *)MEMORY[0x1E0D80E50];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithStream:", self->_inferredModeStream);
  objc_msgSend(v6, "inferredModeEventWithSuggestionUUID:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[ATXActivitySuggestionClient _activityForEvent:](self, "_activityForEvent:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      +[ATXModeGlobals sharedInstance](ATXModeGlobals, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXActivitySuggestionClient _suggestionWithActivity:modeGlobals:](self, "_suggestionWithActivity:modeGlobals:", v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)previousSuggestion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80E50]), "initWithStream:", self->_inferredModeStream);
  objc_msgSend(v3, "previousModeEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXActivitySuggestionClient _activityForEvent:](self, "_activityForEvent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)currentSuggestion
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80E50]), "initWithStream:", self->_inferredModeStream);
  objc_msgSend(v3, "currentMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXActivitySuggestionClient _activityForEvent:](self, "_activityForEvent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_activityForEvent:(id)a3
{
  id v4;
  void *v5;
  ATXActivity *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    __atxlog_handle_modes();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      v8 = "ATXActivitySuggestionClient: no Biome event";
      v9 = v7;
      v10 = 2;
LABEL_8:
      _os_log_impl(&dword_1A49EF000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, v10);
    }
LABEL_9:

    v6 = 0;
    goto LABEL_10;
  }
  if (!-[ATXActivitySuggestionClient _shouldSendAutomationSuggestionForMode:](self, "_shouldSendAutomationSuggestionForMode:", objc_msgSend(v4, "modeType")))
  {
    __atxlog_handle_modes();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134217984;
      v13 = (int)objc_msgSend(v5, "modeType");
      v8 = "ATXActivitySuggestionClient: last mode is not supported, not sending automation suggestion for mode of type: %lu";
      v9 = v7;
      v10 = 12;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v6 = -[ATXActivity initWithBiomeInferredModeEvent:]([ATXActivity alloc], "initWithBiomeInferredModeEvent:", v5);
LABEL_10:

  return v6;
}

- (void)currentSuggestionWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__ATXActivitySuggestionClient_currentSuggestionWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4D58780;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __70__ATXActivitySuggestionClient_currentSuggestionWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "currentSuggestion");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (id)localizedSuggestionReasonForBMInferredModeEvent:(id)a3
{
  id v3;
  ATXActivity *v4;
  void *v5;

  v3 = a3;
  v4 = -[ATXActivity initWithBMInferredModeEvent:]([ATXActivity alloc], "initWithBMInferredModeEvent:", v3);

  -[ATXActivity localizedSuggestionReason](v4, "localizedSuggestionReason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)didShowActivitySetUpSuggestionWithSuggestionUUID:(id)a3 location:(unint64_t)a4
{
  -[ATXActivitySuggestionClient _logFeedbackEventForActivitySetUpSuggestionWithSuggestionUUID:eventType:acceptedTriggers:location:](self, "_logFeedbackEventForActivitySetUpSuggestionWithSuggestionUUID:eventType:acceptedTriggers:location:", a3, 0, MEMORY[0x1E0C9AA60], a4);
}

- (void)userDidSeeActivitySetUpSuggestionWithSuggestionUUID:(id)a3 location:(unint64_t)a4
{
  -[ATXActivitySuggestionClient _logFeedbackEventForActivitySetUpSuggestionWithSuggestionUUID:eventType:acceptedTriggers:location:](self, "_logFeedbackEventForActivitySetUpSuggestionWithSuggestionUUID:eventType:acceptedTriggers:location:", a3, 1, MEMORY[0x1E0C9AA60], a4);
}

- (void)userDidAcceptActivitySetUpSuggestionWithSuggestionUUID:(id)a3 location:(unint64_t)a4
{
  -[ATXActivitySuggestionClient _logFeedbackEventForActivitySetUpSuggestionWithSuggestionUUID:eventType:acceptedTriggers:location:](self, "_logFeedbackEventForActivitySetUpSuggestionWithSuggestionUUID:eventType:acceptedTriggers:location:", a3, 2, MEMORY[0x1E0C9AA60], a4);
}

- (void)userDidFinishActivitySetUpWithSuggestionUUID:(id)a3 acceptedTriggers:(id)a4 location:(unint64_t)a5
{
  -[ATXActivitySuggestionClient _logFeedbackEventForActivitySetUpSuggestionWithSuggestionUUID:eventType:acceptedTriggers:location:](self, "_logFeedbackEventForActivitySetUpSuggestionWithSuggestionUUID:eventType:acceptedTriggers:location:", a3, 4, a4, a5);
}

- (void)userDidRejectActivitySetUpSuggestionWithSuggestionUUID:(id)a3 location:(unint64_t)a4
{
  -[ATXActivitySuggestionClient _logFeedbackEventForActivitySetUpSuggestionWithSuggestionUUID:eventType:acceptedTriggers:location:](self, "_logFeedbackEventForActivitySetUpSuggestionWithSuggestionUUID:eventType:acceptedTriggers:location:", a3, 3, MEMORY[0x1E0C9AA60], a4);
}

- (void)didShowTriggerSuggestionWithSuggestionUUID:(id)a3 location:(unint64_t)a4
{
  -[ATXActivitySuggestionClient _logFeedbackEventForTriggerSuggestionWithSuggestionUUID:eventType:acceptedTriggers:location:](self, "_logFeedbackEventForTriggerSuggestionWithSuggestionUUID:eventType:acceptedTriggers:location:", a3, 0, MEMORY[0x1E0C9AA60], a4);
}

- (void)userDidSeeTriggerSuggestionWithSuggestionUUID:(id)a3 location:(unint64_t)a4
{
  -[ATXActivitySuggestionClient _logFeedbackEventForTriggerSuggestionWithSuggestionUUID:eventType:acceptedTriggers:location:](self, "_logFeedbackEventForTriggerSuggestionWithSuggestionUUID:eventType:acceptedTriggers:location:", a3, 1, MEMORY[0x1E0C9AA60], a4);
}

- (void)userDidAcceptTriggerSuggestionWithSuggestionUUID:(id)a3 acceptedTriggers:(id)a4 location:(unint64_t)a5
{
  -[ATXActivitySuggestionClient _logFeedbackEventForTriggerSuggestionWithSuggestionUUID:eventType:acceptedTriggers:location:](self, "_logFeedbackEventForTriggerSuggestionWithSuggestionUUID:eventType:acceptedTriggers:location:", a3, 2, MEMORY[0x1E0C9AA60], a5);
}

- (void)userDidRejectTriggerSuggestionWithSuggestionUUID:(id)a3 location:(unint64_t)a4
{
  -[ATXActivitySuggestionClient _logFeedbackEventForTriggerSuggestionWithSuggestionUUID:eventType:acceptedTriggers:location:](self, "_logFeedbackEventForTriggerSuggestionWithSuggestionUUID:eventType:acceptedTriggers:location:", a3, 3, MEMORY[0x1E0C9AA60], a4);
}

- (void)didShowConfiguredActivitySuggestionWithSuggestionUUID:(id)a3 location:(unint64_t)a4
{
  -[ATXActivitySuggestionClient _logFeedbackEventForConfiguredActivitySuggestionWithSuggestionUUID:eventType:location:](self, "_logFeedbackEventForConfiguredActivitySuggestionWithSuggestionUUID:eventType:location:", a3, 0, a4);
}

- (void)userDidSeeConfiguredActivitySuggestionWithSuggestionUUID:(id)a3 location:(unint64_t)a4
{
  -[ATXActivitySuggestionClient _logFeedbackEventForConfiguredActivitySuggestionWithSuggestionUUID:eventType:location:](self, "_logFeedbackEventForConfiguredActivitySuggestionWithSuggestionUUID:eventType:location:", a3, 1, a4);
}

- (void)userDidAcceptConfiguredActivitySuggestionWithSuggestionUUID:(id)a3 location:(unint64_t)a4
{
  -[ATXActivitySuggestionClient _logFeedbackEventForConfiguredActivitySuggestionWithSuggestionUUID:eventType:location:](self, "_logFeedbackEventForConfiguredActivitySuggestionWithSuggestionUUID:eventType:location:", a3, 2, a4);
}

- (void)userDidRejectConfiguredActivitySuggestionWithSuggestionUUID:(id)a3 location:(unint64_t)a4
{
  -[ATXActivitySuggestionClient _logFeedbackEventForConfiguredActivitySuggestionWithSuggestionUUID:eventType:location:](self, "_logFeedbackEventForConfiguredActivitySuggestionWithSuggestionUUID:eventType:location:", a3, 3, a4);
}

- (void)_logFeedbackEventForActivitySetUpSuggestionWithSuggestionUUID:(id)a3 eventType:(unint64_t)a4 acceptedTriggers:(id)a5 location:(unint64_t)a6
{
  -[ATXActivitySuggestionClient _logFeedbackEventForSuggestionUUID:suggestionType:eventType:acceptedTriggers:location:](self, "_logFeedbackEventForSuggestionUUID:suggestionType:eventType:acceptedTriggers:location:", a3, 0, a4, a5, a6);
}

- (void)_logFeedbackEventForTriggerSuggestionWithSuggestionUUID:(id)a3 eventType:(unint64_t)a4 acceptedTriggers:(id)a5 location:(unint64_t)a6
{
  -[ATXActivitySuggestionClient _logFeedbackEventForSuggestionUUID:suggestionType:eventType:acceptedTriggers:location:](self, "_logFeedbackEventForSuggestionUUID:suggestionType:eventType:acceptedTriggers:location:", a3, 2, a4, a5, a6);
}

- (void)_logFeedbackEventForConfiguredActivitySuggestionWithSuggestionUUID:(id)a3 eventType:(unint64_t)a4 location:(unint64_t)a5
{
  -[ATXActivitySuggestionClient _logFeedbackEventForSuggestionUUID:suggestionType:eventType:acceptedTriggers:location:](self, "_logFeedbackEventForSuggestionUUID:suggestionType:eventType:acceptedTriggers:location:", a3, 1, a4, MEMORY[0x1E0C9AA60], a5);
}

- (void)_logFeedbackEventForSuggestionUUID:(id)a3 suggestionType:(unint64_t)a4 eventType:(unint64_t)a5 acceptedTriggers:(id)a6 location:(unint64_t)a7
{
  id v12;
  id v13;
  NSObject *queue;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;

  v12 = a3;
  v13 = a6;
  queue = self->_queue;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __117__ATXActivitySuggestionClient__logFeedbackEventForSuggestionUUID_suggestionType_eventType_acceptedTriggers_location___block_invoke;
  v17[3] = &unk_1E4D5A278;
  v17[4] = self;
  v18 = v12;
  v19 = v13;
  v20 = a5;
  v21 = a4;
  v22 = a7;
  v15 = v13;
  v16 = v12;
  dispatch_async(queue, v17);

}

void __117__ATXActivitySuggestionClient__logFeedbackEventForSuggestionUUID_suggestionType_eventType_acceptedTriggers_location___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  ATXActivitySuggestionFeedbackEvent *v6;
  void *v7;
  ATXActivitySuggestionFeedbackEvent *v8;
  NSObject *v9;
  void *v10;
  int v11;
  ATXActivitySuggestionFeedbackEvent *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80E50]), "initWithStream:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(v2, "inferredModeEventWithSuggestionUUID:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_activityForEvent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "DNDModeConfigurationTriggersToATXTriggers:", *(_QWORD *)(a1 + 48));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = [ATXActivitySuggestionFeedbackEvent alloc];
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[ATXActivitySuggestionFeedbackEvent initWithEventDate:activity:acceptedTriggers:eventType:suggestionType:location:](v6, "initWithEventDate:activity:acceptedTriggers:eventType:suggestionType:location:", v7, v4, v5, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));

    __atxlog_handle_home_screen();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v8;
      _os_log_impl(&dword_1A49EF000, v9, OS_LOG_TYPE_DEFAULT, "ATXActivitySuggestionClient: Sending feedback event to Biome: %@", (uint8_t *)&v11, 0xCu);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "source");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sendEvent:", v8);

    +[ATXActivitySuggestionFeedbackLogUploader sendActivitySuggestionEventToCoreAnalytics:](ATXActivitySuggestionFeedbackLogUploader, "sendActivitySuggestionEventToCoreAnalytics:", v8);
  }
  else
  {
    __atxlog_handle_modes();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __117__ATXActivitySuggestionClient__logFeedbackEventForSuggestionUUID_suggestionType_eventType_acceptedTriggers_location___block_invoke_cold_1((uint64_t *)(a1 + 40), (uint64_t)v3, v5);
  }

}

- (BOOL)_shouldSendAutomationSuggestionForMode:(int)a3
{
  _BOOL4 v3;
  NSObject *v5;

  if ((a3 - 1) >= 0x11)
  {
    __atxlog_handle_modes();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[ATXActivitySuggestionClient _shouldSendAutomationSuggestionForMode:].cold.1(a3, v5);

    LOBYTE(v3) = 0;
  }
  else
  {
    return (0x1EFFDu >> (a3 - 1)) & 1;
  }
  return v3;
}

- (id)_suggestionWithActivity:(id)a3 modeGlobals:(id)a4
{
  id v6;
  id v7;
  __objc2_class *v8;
  ATXActivityTriggerSuggestion *v9;
  ATXActivityTriggerSuggestion *v10;

  v6 = a3;
  v7 = a4;
  if (-[ATXActivitySuggestionClient _activityIsEligibleForSetUpSuggestion:modeGlobals:](self, "_activityIsEligibleForSetUpSuggestion:modeGlobals:", v6, v7))
  {
    v8 = ATXActivitySetUpSuggestion;
LABEL_6:
    v9 = (ATXActivityTriggerSuggestion *)objc_msgSend([v8 alloc], "initWithActivity:", v6);
    goto LABEL_7;
  }
  if (!-[ATXActivitySuggestionClient _activityIsEligibleForTriggerSuggestion:modeGlobals:](self, "_activityIsEligibleForTriggerSuggestion:modeGlobals:", v6, v7))
  {
    v8 = ATXActivitySuggestion;
    goto LABEL_6;
  }
  v9 = -[ATXActivityTriggerSuggestion initWithActivity:activitySuggestionClient:]([ATXActivityTriggerSuggestion alloc], "initWithActivity:activitySuggestionClient:", v6, self);
LABEL_7:
  v10 = v9;

  return v10;
}

- (void)_modeDidChange
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  +[ATXModeGlobals sharedInstance](ATXModeGlobals, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXActivitySuggestionClient previousSuggestion](self, "previousSuggestion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXActivitySuggestionClient currentSuggestion](self, "currentSuggestion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_modes();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "modeUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v5, "activityType");
    objc_msgSend(v5, "activityType");
    ATXActivityTypeToString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "modeUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v4, "activityType");
    objc_msgSend(v4, "activityType");
    ATXActivityTypeToString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v21 = v7;
    v22 = 2048;
    v23 = v15;
    v24 = 2114;
    v25 = v8;
    v26 = 2114;
    v27 = v9;
    v28 = 2048;
    v29 = v10;
    v30 = 2114;
    v31 = v11;
    _os_log_impl(&dword_1A49EF000, v6, OS_LOG_TYPE_DEFAULT, "ATXActivitySuggestionClient: mode did change to: (uuid: %{public}@, modeType: %lu, string: %{public}@) from (uuid: %{public}@, modeType: %lu, string: %{public}@)", buf, 0x3Eu);

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__ATXActivitySuggestionClient__modeDidChange__block_invoke;
  block[3] = &unk_1E4D5A2A0;
  block[4] = self;
  v17 = v5;
  v18 = v4;
  v19 = v3;
  v12 = v3;
  v13 = v4;
  v14 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __45__ATXActivitySuggestionClient__modeDidChange__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  ATXActivitySuggestion *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  ATXActivitySetUpSuggestion *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  id v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  uint64_t v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v31 = *(id *)(a1 + 32);
  objc_sync_enter(v31);
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v34 != v3)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          __atxlog_handle_modes();
          v6 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*(id *)(a1 + 40), "modeUUID");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            v8 = objc_msgSend(*(id *)(a1 + 40), "activityType");
            *(_DWORD *)buf = 138543618;
            v38 = v7;
            v39 = 2048;
            v40 = v8;
            _os_log_impl(&dword_1A49EF000, v6, OS_LOG_TYPE_DEFAULT, "ATXActivitySuggestionClient: didSuggestActivity: %{public}@ (modeType: %lu)", buf, 0x16u);

          }
          objc_msgSend(v5, "activitySuggestionClient:didSuggestActivity:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(*(id *)(a1 + 40), "modeUUID");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9)
          {
            __atxlog_handle_modes();
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(*(id *)(a1 + 40), "modeUUID");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = objc_msgSend(*(id *)(a1 + 40), "activityType");
              *(_DWORD *)buf = 138543618;
              v38 = v11;
              v39 = 2048;
              v40 = v12;
              _os_log_impl(&dword_1A49EF000, v10, OS_LOG_TYPE_DEFAULT, "ATXActivitySuggestionClient: didSuggestConfiguredActivity: %{public}@ (modeType: %lu)", buf, 0x16u);

            }
            v13 = -[ATXActivitySuggestion initWithActivity:]([ATXActivitySuggestion alloc], "initWithActivity:", *(_QWORD *)(a1 + 40));
            objc_msgSend(v5, "activitySuggestionClient:didSuggestConfiguredActivity:", *(_QWORD *)(a1 + 32), v13);

          }
          else
          {
            objc_msgSend(*(id *)(a1 + 48), "modeUUID");
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (v14)
            {
              __atxlog_handle_modes();
              v15 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A49EF000, v15, OS_LOG_TYPE_DEFAULT, "ATXActivitySuggestionClient: didSuggestConfiguredActivity: nil", buf, 2u);
              }

              objc_msgSend(v5, "activitySuggestionClient:didSuggestConfiguredActivity:", *(_QWORD *)(a1 + 32), 0);
            }
          }
        }
        if (objc_msgSend(*(id *)(a1 + 32), "_shouldSendModeSetUpSuggestionAtEndOfModeToLockScreen:modeGlobals:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56))&& (objc_opt_respondsToSelector() & 1) != 0)
        {
          __atxlog_handle_modes();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*(id *)(a1 + 48), "modeUUID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(*(id *)(a1 + 48), "activityType");
            *(_DWORD *)buf = 138543618;
            v38 = v17;
            v39 = 2048;
            v40 = v18;
            _os_log_impl(&dword_1A49EF000, v16, OS_LOG_TYPE_DEFAULT, "ATXActivitySuggestionClient: didSuggestSettingUpActivity: %{public}@ (modeType: %lu)", buf, 0x16u);

          }
          v19 = -[ATXActivitySetUpSuggestion initWithActivity:]([ATXActivitySetUpSuggestion alloc], "initWithActivity:", *(_QWORD *)(a1 + 48));
          objc_msgSend(v5, "activitySuggestionClient:didSuggestSettingUpActivity:", *(_QWORD *)(a1 + 32), v19);
LABEL_41:

          continue;
        }
        if (objc_msgSend(*(id *)(a1 + 32), "_shouldSendModeTriggerSuggestionAtEndOfModeToLockScreen:modeGlobals:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56))&& (objc_opt_respondsToSelector() & 1) != 0)
        {
          __atxlog_handle_modes();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*(id *)(a1 + 48), "modeUUID");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(*(id *)(a1 + 48), "activityType");
            *(_DWORD *)buf = 138543618;
            v38 = v21;
            v39 = 2048;
            v40 = v22;
            _os_log_impl(&dword_1A49EF000, v20, OS_LOG_TYPE_DEFAULT, "ATXActivitySuggestionClient: didSuggestTriggersForConfiguredActivity: %{public}@ (modeType: %lu)", buf, 0x16u);

          }
          v19 = -[ATXActivityTriggerSuggestion initWithActivity:activitySuggestionClient:]([ATXActivityTriggerSuggestion alloc], "initWithActivity:activitySuggestionClient:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
          objc_msgSend(v5, "activitySuggestionClient:didSuggestTriggersForConfiguredActivity:", *(_QWORD *)(a1 + 32), v19);
          goto LABEL_41;
        }
        if (objc_msgSend(*(id *)(a1 + 32), "_activityIsEligibleForSetUpSuggestion:modeGlobals:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56))&& (objc_msgSend(*(id *)(a1 + 32), "_shouldSendModeSetUpSuggestionAtEndOfModeToLockScreen:modeGlobals:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56)) & 1) == 0&& (objc_opt_respondsToSelector() & 1) != 0)
        {
          __atxlog_handle_modes();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*(id *)(a1 + 40), "modeUUID");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(*(id *)(a1 + 40), "activityType");
            *(_DWORD *)buf = 138543618;
            v38 = v24;
            v39 = 2048;
            v40 = v25;
            _os_log_impl(&dword_1A49EF000, v23, OS_LOG_TYPE_DEFAULT, "ATXActivitySuggestionClient: didSuggestSettingUpActivity: %{public}@ (modeType: %lu)", buf, 0x16u);

          }
          v19 = -[ATXActivitySetUpSuggestion initWithActivity:]([ATXActivitySetUpSuggestion alloc], "initWithActivity:", *(_QWORD *)(a1 + 40));
          objc_msgSend(v5, "activitySuggestionClient:didSuggestSettingUpActivity:", *(_QWORD *)(a1 + 32), v19);
          goto LABEL_41;
        }
        if (objc_msgSend(*(id *)(a1 + 32), "_activityIsEligibleForTriggerSuggestion:modeGlobals:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56))&& (objc_msgSend(*(id *)(a1 + 32), "_shouldSendModeTriggerSuggestionAtEndOfModeToLockScreen:modeGlobals:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56)) & 1) == 0&& (objc_opt_respondsToSelector() & 1) != 0)
        {
          __atxlog_handle_modes();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*(id *)(a1 + 40), "modeUUID");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(*(id *)(a1 + 40), "activityType");
            *(_DWORD *)buf = 138543618;
            v38 = v27;
            v39 = 2048;
            v40 = v28;
            _os_log_impl(&dword_1A49EF000, v26, OS_LOG_TYPE_DEFAULT, "ATXActivitySuggestionClient: didSuggestTriggersForConfiguredActivity: %{public}@ (modeType: %lu)", buf, 0x16u);

          }
          v19 = -[ATXActivityTriggerSuggestion initWithActivity:activitySuggestionClient:]([ATXActivityTriggerSuggestion alloc], "initWithActivity:activitySuggestionClient:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
          objc_msgSend(v5, "activitySuggestionClient:didSuggestTriggersForConfiguredActivity:", *(_QWORD *)(a1 + 32), v19);
          goto LABEL_41;
        }
        if (objc_msgSend(*(id *)(a1 + 32), "_activityIsEligibleForSetUpSuggestion:modeGlobals:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56))&& (objc_opt_respondsToSelector() & 1) != 0)
        {
          __atxlog_handle_modes();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A49EF000, v29, OS_LOG_TYPE_DEFAULT, "ATXActivitySuggestionClient: didSuggestSettingUpActivity: nil", buf, 2u);
          }

          objc_msgSend(v5, "activitySuggestionClient:didSuggestSettingUpActivity:", *(_QWORD *)(a1 + 32), 0);
        }
        else if (objc_msgSend(*(id *)(a1 + 32), "_activityIsEligibleForTriggerSuggestion:modeGlobals:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56))&& (objc_opt_respondsToSelector() & 1) != 0)
        {
          __atxlog_handle_modes();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A49EF000, v30, OS_LOG_TYPE_DEFAULT, "ATXActivitySuggestionClient: didSuggestTriggersForConfiguredActivity: nil", buf, 2u);
          }

          objc_msgSend(v5, "activitySuggestionClient:didSuggestTriggersForConfiguredActivity:", *(_QWORD *)(a1 + 32), 0);
        }
      }
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v2);
  }

  objc_sync_exit(v31);
}

- (BOOL)_activityIsEligibleForSetUpSuggestion:(id)a3 modeGlobals:(id)a4
{
  id v5;
  int v6;
  BOOL v7;
  void *v8;

  v5 = a3;
  v6 = objc_msgSend(a4, "isSetupSuggestionsForFocusEnabled");
  v7 = 0;
  if (v5 && v6)
  {
    objc_msgSend(v5, "modeUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v8 == 0;
  }

  return v7;
}

- (BOOL)_activityIsEligibleForTriggerSuggestion:(id)a3 modeGlobals:(id)a4
{
  id v5;
  int v6;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(a4, "isAutomationTriggerSuggestionsForFocusEnabled");
  LOBYTE(a4) = 0;
  if (v5)
  {
    if (v6)
    {
      objc_msgSend(v5, "modeUUID");
      a4 = (id)objc_claimAutoreleasedReturnValue();

      if (a4)
      {
        if (objc_msgSend(v5, "shouldSuggestTriggers"))
        {
          v8 = objc_msgSend(v5, "activityType");
          LOBYTE(a4) = 1;
          if (v8 <= 0x11 && ((1 << v8) & 0x2EF38) != 0)
          {
            objc_msgSend(v5, "triggers");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            -[ATXActivitySuggestionClient triggersToDNDModeConfigurationTriggers:](self, "triggersToDNDModeConfigurationTriggers:", v9);
            v10 = (void *)objc_claimAutoreleasedReturnValue();

            v19 = 0u;
            v20 = 0u;
            v17 = 0u;
            v18 = 0u;
            v11 = v10;
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
            if (v12)
            {
              v13 = v12;
              v14 = *(_QWORD *)v18;
              while (2)
              {
                for (i = 0; i != v13; ++i)
                {
                  if (*(_QWORD *)v18 != v14)
                    objc_enumerationMutation(v11);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    __atxlog_handle_modes();
                    a4 = (id)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled((os_log_t)a4, OS_LOG_TYPE_ERROR))
                      -[ATXActivitySuggestionClient _activityIsEligibleForTriggerSuggestion:modeGlobals:].cold.1(v5, a4);

                    LOBYTE(a4) = 0;
                    goto LABEL_20;
                  }
                }
                v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
                if (v13)
                  continue;
                break;
              }
            }
            LOBYTE(a4) = 1;
LABEL_20:

          }
        }
        else
        {
          LOBYTE(a4) = 0;
        }
      }
    }
  }

  return (char)a4;
}

- (BOOL)_shouldSendModeSetUpSuggestionAtEndOfModeToLockScreen:(id)a3 modeGlobals:(id)a4
{
  id v6;
  BOOL v7;
  uint64_t v8;

  v6 = a3;
  if (-[ATXActivitySuggestionClient _activityIsEligibleForSetUpSuggestion:modeGlobals:](self, "_activityIsEligibleForSetUpSuggestion:modeGlobals:", v6, a4)&& (objc_msgSend(v6, "location") & 2) != 0)
  {
    v8 = objc_msgSend(v6, "activityType");
    v7 = v8 == 4 || v8 == 13;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_shouldSendModeTriggerSuggestionAtEndOfModeToLockScreen:(id)a3 modeGlobals:(id)a4
{
  id v6;
  BOOL v7;
  uint64_t v8;

  v6 = a3;
  if (-[ATXActivitySuggestionClient _activityIsEligibleForTriggerSuggestion:modeGlobals:](self, "_activityIsEligibleForTriggerSuggestion:modeGlobals:", v6, a4)&& (objc_msgSend(v6, "location") & 2) != 0)
  {
    v8 = objc_msgSend(v6, "activityType");
    v7 = v8 == 4 || v8 == 13;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_fetchAndCacheLOIs
{
  RTRoutineManager *routineManager;
  uint64_t v4;
  RTRoutineManager *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  objc_initWeak(&location, self);
  routineManager = self->_routineManager;
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__ATXActivitySuggestionClient__fetchAndCacheLOIs__block_invoke;
  v8[3] = &unk_1E4D5A2C8;
  objc_copyWeak(&v9, &location);
  -[RTRoutineManager fetchLocationsOfInterestOfType:withHandler:](routineManager, "fetchLocationsOfInterestOfType:withHandler:", 0, v8);
  v5 = self->_routineManager;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __49__ATXActivitySuggestionClient__fetchAndCacheLOIs__block_invoke_43;
  v6[3] = &unk_1E4D5A2C8;
  objc_copyWeak(&v7, &location);
  -[RTRoutineManager fetchLocationsOfInterestOfType:withHandler:](v5, "fetchLocationsOfInterestOfType:withHandler:", 1, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __49__ATXActivitySuggestionClient__fetchAndCacheLOIs__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  double v10;
  CLLocationDegrees v11;
  void *v12;
  CLLocationDegrees v13;
  CLLocationCoordinate2D v14;
  void *v15;
  id WeakRetained;
  uint8_t v17[16];

  v5 = a3;
  objc_msgSend(a2, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_modes();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1A49EF000, v8, OS_LOG_TYPE_DEFAULT, "Cached Routine Home LOI", v17, 2u);
    }

    v9 = objc_alloc(MEMORY[0x1E0C9E368]);
    objc_msgSend(v6, "location");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject latitude](v8, "latitude");
    v11 = v10;
    objc_msgSend(v6, "location");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "longitude");
    v14 = CLLocationCoordinate2DMake(v11, v13);
    v15 = (void *)objc_msgSend(v9, "initWithCenter:radius:identifier:", CFSTR("home"), v14.latitude, v14.longitude, 500.0);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "setHomeRegion:", v15);

  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __49__ATXActivitySuggestionClient__fetchAndCacheLOIs__block_invoke_cold_1();
  }

}

void __49__ATXActivitySuggestionClient__fetchAndCacheLOIs__block_invoke_43(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  double v10;
  CLLocationDegrees v11;
  void *v12;
  CLLocationDegrees v13;
  CLLocationCoordinate2D v14;
  void *v15;
  id WeakRetained;
  uint8_t v17[16];

  v5 = a3;
  objc_msgSend(a2, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_modes();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1A49EF000, v8, OS_LOG_TYPE_DEFAULT, "Cached Routine Work LOI", v17, 2u);
    }

    v9 = objc_alloc(MEMORY[0x1E0C9E368]);
    objc_msgSend(v6, "location");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject latitude](v8, "latitude");
    v11 = v10;
    objc_msgSend(v6, "location");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "longitude");
    v14 = CLLocationCoordinate2DMake(v11, v13);
    v15 = (void *)objc_msgSend(v9, "initWithCenter:radius:identifier:", CFSTR("work"), v14.latitude, v14.longitude, 500.0);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "setWorkRegion:", v15);

  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __49__ATXActivitySuggestionClient__fetchAndCacheLOIs__block_invoke_43_cold_1();
  }

}

- (id)triggersToDNDModeConfigurationTriggers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __70__ATXActivitySuggestionClient_triggersToDNDModeConfigurationTriggers___block_invoke;
    v10[3] = &unk_1E4D5A2F0;
    v10[4] = self;
    objc_msgSend(v4, "_pas_mappedArrayWithTransform:", v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "count"))
    {
      v8 = (void *)objc_opt_new();
      v11 = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v6 = v5;
  }
  else
  {
    v5 = (void *)objc_opt_new();
    v12[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
LABEL_7:

  return v7;
}

id __70__ATXActivitySuggestionClient_triggersToDNDModeConfigurationTriggers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;

  v3 = a2;
  v4 = (void *)objc_msgSend((id)objc_opt_class(), "DNDModeConfigurationTriggerClassFromATXTrigger:", v3);
  if (!v4)
    goto LABEL_18;
  if (objc_msgSend(v4, "isEqual:", objc_opt_class()))
  {
    v5 = objc_msgSend(v3, "namedLOI");
    switch(v5)
    {
      case 0:
LABEL_18:
        v9 = 0;
        goto LABEL_19;
      case 2:
        if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80))
        {
          v6 = objc_alloc(MEMORY[0x1E0D1D670]);
          v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
          goto LABEL_11;
        }
        __atxlog_handle_modes();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          __70__ATXActivitySuggestionClient_triggersToDNDModeConfigurationTriggers___block_invoke_cold_2();
        goto LABEL_17;
      case 1:
        if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72))
        {
          v6 = objc_alloc(MEMORY[0x1E0D1D670]);
          v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
LABEL_11:
          v8 = objc_msgSend(v6, "initWithRegion:detail:enabledSetting:", v7, 0, 2);
          goto LABEL_12;
        }
        __atxlog_handle_modes();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          __70__ATXActivitySuggestionClient_triggersToDNDModeConfigurationTriggers___block_invoke_cold_1();
LABEL_17:

        goto LABEL_18;
    }
  }
  v8 = objc_opt_new();
LABEL_12:
  v9 = (void *)v8;
LABEL_19:

  return v9;
}

- (id)DNDModeConfigurationTriggersToATXTriggers:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __73__ATXActivitySuggestionClient_DNDModeConfigurationTriggersToATXTriggers___block_invoke;
  v4[3] = &unk_1E4D5A318;
  v4[4] = self;
  objc_msgSend(a3, "_pas_mappedArrayWithTransform:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __73__ATXActivitySuggestionClient_DNDModeConfigurationTriggersToATXTriggers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v3 = a2;
  if (objc_msgSend((id)objc_opt_class(), "ATXTriggerClassFromDNDModeConfigurationTrigger:", v3))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "region");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 80);
      if (v6)
      {
        objc_msgSend(v6, "center");
        if ((objc_msgSend(v4, "containsCoordinate:") & 1) != 0)
        {
          v7 = objc_alloc(MEMORY[0x1E0D80DB8]);
          objc_msgSend(v4, "identifier");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v7;
          v10 = v8;
          v11 = 2;
          goto LABEL_12;
        }
        v5 = *(_QWORD *)(a1 + 32);
      }
      v13 = *(void **)(v5 + 72);
      if (!v13 || (objc_msgSend(v13, "center"), !objc_msgSend(v4, "containsCoordinate:")))
      {
        v12 = 0;
        goto LABEL_14;
      }
      v14 = objc_alloc(MEMORY[0x1E0D80DB8]);
      objc_msgSend(v4, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v14;
      v10 = v8;
      v11 = 1;
LABEL_12:
      v12 = (void *)objc_msgSend(v9, "initWithLocationIdentifier:namedLOI:", v10, v11);

LABEL_14:
      goto LABEL_15;
    }
    v12 = (void *)objc_opt_new();
  }
  else
  {
    v12 = 0;
  }
LABEL_15:

  return v12;
}

+ (Class)DNDModeConfigurationTriggerClassFromATXTrigger:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
LABEL_8:
    objc_opt_class();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (Class)v4;
}

+ (Class)ATXTriggerClassFromDNDModeConfigurationTrigger:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_opt_class();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (Class)v4;
}

- (CLCircularRegion)workRegion
{
  return (CLCircularRegion *)objc_getProperty(self, a2, 72, 1);
}

- (void)setWorkRegion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (CLCircularRegion)homeRegion
{
  return (CLCircularRegion *)objc_getProperty(self, a2, 80, 1);
}

- (void)setHomeRegion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeRegion, 0);
  objc_storeStrong((id *)&self->_workRegion, 0);
  objc_storeStrong((id *)&self->_routineManager, 0);
  objc_storeStrong((id *)&self->_coalescingTimer, 0);
  objc_storeStrong((id *)&self->_sink, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_feedbackStream, 0);
  objc_storeStrong((id *)&self->_inferredModeStream, 0);
}

void __57__ATXActivitySuggestionClient__setUpPublisherIfNecessary__block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_15(&dword_1A49EF000, a2, v4, "ATXActivitySuggestionClient: error listening to mode events: %@", v5);

  OUTLINED_FUNCTION_5_2();
}

void __57__ATXActivitySuggestionClient__setUpPublisherIfNecessary__block_invoke_19_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A49EF000, v0, v1, "ATXActivitySuggestionClient: self is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __57__ATXActivitySuggestionClient__setUpPublisherIfNecessary__block_invoke_19_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "eventBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "absoluteTimestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v8 = 134218240;
  v9 = a1;
  v10 = 2048;
  v11 = v7;
  _os_log_debug_impl(&dword_1A49EF000, a3, OS_LOG_TYPE_DEBUG, "ATXActivitySuggestionClient %p: mode changed from Biome publisher: %f", (uint8_t *)&v8, 0x16u);

}

void __117__ATXActivitySuggestionClient__logFeedbackEventForSuggestionUUID_suggestionType_eventType_acceptedTriggers_location___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 136315650;
  v5 = "-[ATXActivitySuggestionClient _logFeedbackEventForSuggestionUUID:suggestionType:eventType:acceptedTriggers:locati"
       "on:]_block_invoke";
  v6 = 2112;
  v7 = v3;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_1A49EF000, log, OS_LOG_TYPE_ERROR, "%s: Could not get ATXActivity for suggestionUUID: %@, modeEvent: %@", (uint8_t *)&v4, 0x20u);
  OUTLINED_FUNCTION_5_2();
}

- (void)_shouldSendAutomationSuggestionForMode:(int)a1 .cold.1(int a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_fault_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_FAULT, "BMUserFocusInferredModeType: %lu not handled in switch statement", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)_activityIsEligibleForTriggerSuggestion:(void *)a1 modeGlobals:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "activityType");
  ATXActivityTypeToString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_15(&dword_1A49EF000, a2, v4, "ATXActivitySuggestionClient: %@ Focus Mode returned eligible to trigger Smart Activation Suggestion", v5);

  OUTLINED_FUNCTION_5_2();
}

void __49__ATXActivitySuggestionClient__fetchAndCacheLOIs__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_15(&dword_1A49EF000, v0, v1, "No Routine Home LOIs: %{public}@", v2);
  OUTLINED_FUNCTION_2();
}

void __49__ATXActivitySuggestionClient__fetchAndCacheLOIs__block_invoke_43_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_15(&dword_1A49EF000, v0, v1, "No Routine Work LOIs: %{public}@", v2);
  OUTLINED_FUNCTION_2();
}

void __70__ATXActivitySuggestionClient_triggersToDNDModeConfigurationTriggers___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A49EF000, v0, v1, "Predicted work LOI trigger but there is no LOI info", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __70__ATXActivitySuggestionClient_triggersToDNDModeConfigurationTriggers___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A49EF000, v0, v1, "Predicted home LOI trigger but there is no LOI info", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
