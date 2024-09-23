@implementation ATXAnchorModelInferenceEngine

+ (id)sharedInstance
{
  NSObject *v2;
  uint8_t v4[16];

  __atxlog_handle_anchor();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_DEFAULT, "Starting Anchor Model Inference Engine.", v4, 2u);
  }

  if (sharedInstance__pasOnceToken7_1 != -1)
    dispatch_once(&sharedInstance__pasOnceToken7_1, &__block_literal_global_248);
  return (id)sharedInstance__pasExprOnceResult_55;
}

void __47__ATXAnchorModelInferenceEngine_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_55;
  sharedInstance__pasExprOnceResult_55 = v1;

  objc_autoreleasePoolPop(v0);
}

- (ATXAnchorModelInferenceEngine)init
{
  ATXAnchorModelInferenceEngine *v2;
  ATXAnchorModelInferenceEngine *v3;
  uint64_t v4;
  ATXAnchorModelPredictionScheduler *predictionScheduler;
  objc_class *v6;
  id v7;
  const char *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  id v12;
  uint64_t v13;
  NSUserDefaults *defaults;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)ATXAnchorModelInferenceEngine;
  v2 = -[ATXAnchorModelInferenceEngine init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_started = 0;
    v4 = objc_opt_new();
    predictionScheduler = v3->_predictionScheduler;
    v3->_predictionScheduler = (ATXAnchorModelPredictionScheduler *)v4;

    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = (const char *)objc_msgSend(v7, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create(v8, v9);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v10;

    v12 = objc_alloc(MEMORY[0x1E0C99EA0]);
    v13 = objc_msgSend(v12, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
    defaults = v3->_defaults;
    v3->_defaults = (NSUserDefaults *)v13;

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[ATXAnchorModelInferenceEngine unregisterAnchorEventListeners](self, "unregisterAnchorEventListeners");
  v3.receiver = self;
  v3.super_class = (Class)ATXAnchorModelInferenceEngine;
  -[ATXAnchorModelInferenceEngine dealloc](&v3, sel_dealloc);
}

- (void)start
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "Attempted to start Anchor Model Inference Engine, even though it's already running.", v1, 2u);
}

uint64_t __38__ATXAnchorModelInferenceEngine_start__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "retryPreviouslyIncompleteInference");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "scheduleExistingPredictions");
}

- (id)supportedAnchorsForInference
{
  void *v2;
  void *v3;
  void *v4;

  +[ATXAnchorModelHyperParameters sharedInstance](ATXAnchorModelHyperParameters, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enabledAnchors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_pas_mappedArrayWithTransform:", &__block_literal_global_17_3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __61__ATXAnchorModelInferenceEngine_supportedAnchorsForInference__block_invoke(int a1, NSString *aClassName)
{
  NSClassFromString(aClassName);
  return (id)objc_opt_new();
}

- (void)registerAnchorEventListeners
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[ATXAnchorModelInferenceEngine supportedAnchorsForInference](self, "supportedAnchorsForInference", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[ATXAnchorModelInferenceEngine registerAnchorEventListenerForAnchor:](self, "registerAnchorEventListenerForAnchor:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)registerAnchorEventListenerForAnchor:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend((id)objc_opt_class(), "usesContextStoreForRealTimeNotifications"))
  {
    if (objc_msgSend((id)objc_opt_class(), "anchorType") == 19)
    {
      __atxlog_handle_anchor();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        -[ATXAnchorModelInferenceEngine registerAnchorEventListenerForAnchor:].cold.2();

      objc_msgSend((id)objc_opt_class(), "registerForNotificationsWithoutUsingContextStoreForObserver:enterSelector:exitSelector:", self, sel_handleAnchorEventForMicrolocationVisitAnchor, 0);
      __atxlog_handle_anchor();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        goto LABEL_30;
    }
    else if (objc_msgSend((id)objc_opt_class(), "anchorType") == 7)
    {
      __atxlog_handle_anchor();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[ATXAnchorModelInferenceEngine registerAnchorEventListenerForAnchor:].cold.2();

      objc_msgSend((id)objc_opt_class(), "registerForNotificationsWithoutUsingContextStoreForObserver:enterSelector:exitSelector:", self, sel_handleLOIEntrance, 0);
      __atxlog_handle_anchor();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        goto LABEL_30;
    }
    else
    {
      if (objc_msgSend((id)objc_opt_class(), "anchorType") != 8)
      {
        if (objc_msgSend((id)objc_opt_class(), "anchorType") == 3)
        {
          __atxlog_handle_anchor();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            v13 = 138412290;
            v14 = v4;
            _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_DEFAULT, "Inference: (%@) Setting up Anchor Event listener.", (uint8_t *)&v13, 0xCu);
          }

          objc_msgSend((id)objc_opt_class(), "registerForNotificationsWithoutUsingContextStoreForObserver:enterSelector:exitSelector:", self, sel_handleAnchorEventForIdleTimeBegin, 0);
          __atxlog_handle_anchor();
          v7 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
            goto LABEL_30;
          v13 = 138412290;
          v14 = v4;
        }
        else
        {
          v11 = objc_msgSend((id)objc_opt_class(), "anchorType");
          __atxlog_handle_anchor();
          v12 = objc_claimAutoreleasedReturnValue();
          v5 = v12;
          if (v11 != 22)
          {
            if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
              -[ATXAnchorModelInferenceEngine registerAnchorEventListenerForAnchor:].cold.7();
            goto LABEL_3;
          }
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            v13 = 138412290;
            v14 = v4;
            _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "Inference: (%@) Setting up Anchor Event listener.", (uint8_t *)&v13, 0xCu);
          }

          objc_msgSend((id)objc_opt_class(), "registerForNotificationsWithoutUsingContextStoreForObserver:enterSelector:exitSelector:", self, sel_handleAnchorEventForGymArrival, sel_handleAnchorExitEventForGymArrival);
          __atxlog_handle_anchor();
          v7 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
LABEL_30:

            goto LABEL_31;
          }
          v13 = 138412290;
          v14 = v4;
        }
        _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "Inference: (%@) Done registering.", (uint8_t *)&v13, 0xCu);
        goto LABEL_30;
      }
      __atxlog_handle_anchor();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[ATXAnchorModelInferenceEngine registerAnchorEventListenerForAnchor:].cold.2();

      objc_msgSend((id)objc_opt_class(), "registerForNotificationsWithoutUsingContextStoreForObserver:enterSelector:exitSelector:", self, sel_handleLOIExit, 0);
      __atxlog_handle_anchor();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        goto LABEL_30;
    }
    -[ATXAnchorModelInferenceEngine registerAnchorEventListenerForAnchor:].cold.1();
    goto LABEL_30;
  }
  -[ATXCoreDuetContextHelper context](self->_contextHelper, "context");
  v5 = objc_claimAutoreleasedReturnValue();
  -[ATXAnchorModelInferenceEngine setupContextStoreListenerForAnchor:context:](self, "setupContextStoreListenerForAnchor:context:", v4, v5);
LABEL_3:

LABEL_31:
}

- (void)unregisterAnchorEventListeners
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[ATXAnchorModelInferenceEngine supportedAnchorsForInference](self, "supportedAnchorsForInference", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[ATXAnchorModelInferenceEngine unregisterAnchorEventListenerForAnchor:](self, "unregisterAnchorEventListenerForAnchor:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)unregisterAnchorEventListenerForAnchor:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;

  v4 = a3;
  if ((objc_msgSend((id)objc_opt_class(), "usesContextStoreForRealTimeNotifications") & 1) == 0
    && (objc_msgSend((id)objc_opt_class(), "anchorType") == 19
     || objc_msgSend((id)objc_opt_class(), "anchorType") == 8
     || objc_msgSend((id)objc_opt_class(), "anchorType") == 7
     || objc_msgSend((id)objc_opt_class(), "anchorType") == 3
     || objc_msgSend((id)objc_opt_class(), "anchorType") == 22))
  {
    __atxlog_handle_anchor();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[ATXAnchorModelInferenceEngine unregisterAnchorEventListenerForAnchor:].cold.2();

    objc_msgSend((id)objc_opt_class(), "unregisterForNotificationsWithoutUsingContextStoreForObserver:", self);
    __atxlog_handle_anchor();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[ATXAnchorModelInferenceEngine unregisterAnchorEventListenerForAnchor:].cold.1();

  }
}

- (void)handleLOIEntrance
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__ATXAnchorModelInferenceEngine_handleLOIEntrance__block_invoke;
  block[3] = &unk_1E82DAC38;
  block[4] = self;
  dispatch_async(queue, block);
}

void __50__ATXAnchorModelInferenceEngine_handleLOIEntrance__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_opt_new();
  objc_msgSend(v1, "handleAnchorEventForAnchor:", v2);

}

- (void)handleLOIExit
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__ATXAnchorModelInferenceEngine_handleLOIExit__block_invoke;
  block[3] = &unk_1E82DAC38;
  block[4] = self;
  dispatch_async(queue, block);
}

void __46__ATXAnchorModelInferenceEngine_handleLOIExit__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_opt_new();
  objc_msgSend(v1, "handleAnchorEventForAnchor:", v2);

}

- (void)setupContextStoreListenerForAnchor:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a3;
  v7 = a4;
  __atxlog_handle_anchor();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[ATXAnchorModelInferenceEngine registerAnchorEventListenerForAnchor:].cold.2();

  -[ATXAnchorModelInferenceEngine registerForWakingNotificationForAnchor:cdContext:](self, "registerForWakingNotificationForAnchor:cdContext:", v6, v7);
}

- (void)registerForWakingNotificationForAnchor:(id)a3 cdContext:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  __atxlog_handle_anchor();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_INFO, "Inference: (%@) Registering with ContextStore for Anchor Event callbacks.", (uint8_t *)&v10, 0xCu);
  }

  -[ATXAnchorModelInferenceEngine registerForAnchorEntrance:cdContext:](self, "registerForAnchorEntrance:cdContext:", v6, v7);
  -[ATXAnchorModelInferenceEngine registerForAnchorExit:cdContext:](self, "registerForAnchorExit:cdContext:", v6, v7);

  __atxlog_handle_anchor();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_DEFAULT, "Inference: (%@) Done registering with the ContextStore.", (uint8_t *)&v10, 0xCu);
  }

}

- (void)registerForAnchorEntrance:(id)a3 cdContext:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;

  v6 = a3;
  v7 = a4;
  __atxlog_handle_anchor();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[ATXAnchorModelInferenceEngine registerForAnchorEntrance:cdContext:].cold.2();

  v9 = (void *)objc_opt_class();
  -[ATXAnchorModelInferenceEngine entranceCallbackForAnchor:](self, "entranceCallbackForAnchor:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAnchorModelInferenceEngine notificationIdentifierForAnchor:](self, "notificationIdentifierForAnchor:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerWithContextStoreForAnchorEntranceWithCallback:notificationId:registrationPersistenceContext:", v10, v11, v7);

  __atxlog_handle_anchor();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[ATXAnchorModelInferenceEngine registerForAnchorEntrance:cdContext:].cold.1();

}

- (void)registerForAnchorExit:(id)a3 cdContext:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;

  v6 = a3;
  v7 = a4;
  __atxlog_handle_anchor();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[ATXAnchorModelInferenceEngine registerForAnchorExit:cdContext:].cold.3();

  objc_msgSend((id)objc_opt_class(), "invalidationPredicateForContextStoreRegistration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)objc_opt_class();
    -[ATXAnchorModelInferenceEngine exitCallbackForAnchor:](self, "exitCallbackForAnchor:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXAnchorModelInferenceEngine exitNotificationIdentifierForAnchor:](self, "exitNotificationIdentifierForAnchor:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "registerWithContextStoreForAnchorExitWithCallback:notificationId:registrationPersistenceContext:", v11, v12, v7);

    __atxlog_handle_anchor();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[ATXAnchorModelInferenceEngine registerForAnchorExit:cdContext:].cold.2();
  }
  else
  {
    __atxlog_handle_anchor();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[ATXAnchorModelInferenceEngine registerForAnchorExit:cdContext:].cold.1();
  }

}

- (void)retryPreviouslyIncompleteInference
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "inferenceEventsToTryAgain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  __atxlog_handle_anchor();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v21 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "Retrieved %lu incomplete inference events from Inference Tracker.", buf, 0xCu);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1CAA48B6C]();
        __atxlog_handle_anchor();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v21 = v11;
          _os_log_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_DEFAULT, "Retrying inference event: %@", buf, 0xCu);
        }

        -[ATXAnchorModelInferenceEngine handleInferenceEvent:](self, "handleInferenceEvent:", v11);
        __atxlog_handle_anchor();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v21 = v11;
          _os_log_impl(&dword_1C9A3B000, v14, OS_LOG_TYPE_DEFAULT, "Sucessfully finished retrying inference event: %@", buf, 0xCu);
        }

        objc_autoreleasePoolPop(v12);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

- (void)handleAnchorEventForMicrolocationVisitAnchor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  NSUserDefaults *defaults;
  void *v10;
  ATXAnchorModelIncompleteInferenceEvent *v11;
  void *v12;
  ATXAnchorModelIncompleteInferenceEvent *v13;
  uint8_t v14[16];

  v3 = (void *)objc_opt_new();
  -[ATXAnchorModelInferenceEngine currentDuetEventForAnchor:](self, "currentDuetEventForAnchor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSUserDefaults stringForKey:](self->_defaults, "stringForKey:", CFSTR("ATXMicrolocationAnchorLastIdentifierKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

    if (v7)
    {
      __atxlog_handle_anchor();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "Received a high confidence anchor event, but ignoring since it's the same event as what we received last time.", v14, 2u);
      }

    }
    else
    {
      defaults = self->_defaults;
      objc_msgSend(v4, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSUserDefaults setValue:forKey:](defaults, "setValue:forKey:", v10, CFSTR("ATXMicrolocationAnchorLastIdentifierKey"));

      v11 = [ATXAnchorModelIncompleteInferenceEvent alloc];
      v12 = (void *)objc_opt_new();
      v13 = -[ATXAnchorModelIncompleteInferenceEvent initWithAnchor:anchorEvent:](v11, "initWithAnchor:anchorEvent:", v12, v4);

      -[ATXAnchorModelInferenceEngine queueHandleInferenceEvent:](self, "queueHandleInferenceEvent:", v13);
    }
  }

}

- (void)handleAnchorEventForIdleTimeBegin
{
  ATXScreenLockStateDuetEvent *v3;
  void *v4;
  void *v5;
  ATXAnchorModelIncompleteInferenceEvent *v6;
  void *v7;
  ATXAnchorModelIncompleteInferenceEvent *v8;
  ATXScreenLockStateDuetEvent *v9;

  v3 = [ATXScreenLockStateDuetEvent alloc];
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", 10800.0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", 21600.0);
  v9 = -[ATXScreenLockStateDuetEvent initWithScreenLockState:startDate:endDate:](v3, "initWithScreenLockState:startDate:endDate:", 1, v4, v5);

  v6 = [ATXAnchorModelIncompleteInferenceEvent alloc];
  v7 = (void *)objc_opt_new();
  v8 = -[ATXAnchorModelIncompleteInferenceEvent initWithAnchor:anchorEvent:](v6, "initWithAnchor:anchorEvent:", v7, v9);

  -[ATXAnchorModelInferenceEngine queueHandleInferenceEvent:](self, "queueHandleInferenceEvent:", v8);
}

- (void)handleAnchorEventForGymArrival
{
  void *v3;
  void *v4;
  ATXAnchorModelIncompleteInferenceEvent *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[ATXAnchorModelInferenceEngine currentDuetEventForAnchor:](self, "currentDuetEventForAnchor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[ATXAnchorModelIncompleteInferenceEvent initWithAnchor:anchorEvent:]([ATXAnchorModelIncompleteInferenceEvent alloc], "initWithAnchor:anchorEvent:", v3, v4);
    -[ATXAnchorModelInferenceEngine queueHandleInferenceEvent:](self, "queueHandleInferenceEvent:", v5);

  }
  else
  {
    __atxlog_handle_anchor();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "Unable to retrieve current event for anchor: %@", (uint8_t *)&v7, 0xCu);
    }

  }
}

- (void)handleAnchorExitEventForGymArrival
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  __atxlog_handle_anchor();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "Removing suggestions for anchor due to exit event: %@", (uint8_t *)&v6, 0xCu);
  }

  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "clearAllIncompleteInferenceEvents");

  -[ATXAnchorModelPredictionScheduler clearPredictionsForAnchor:](self->_predictionScheduler, "clearPredictionsForAnchor:", v3);
}

- (void)handleAnchorEventForAnchor:(id)a3
{
  id v4;
  void *v5;
  ATXAnchorModelIncompleteInferenceEvent *v6;
  NSObject *v7;

  v4 = a3;
  -[ATXAnchorModelInferenceEngine currentDuetEventForAnchor:](self, "currentDuetEventForAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[ATXAnchorModelIncompleteInferenceEvent initWithAnchor:anchorEvent:]([ATXAnchorModelIncompleteInferenceEvent alloc], "initWithAnchor:anchorEvent:", v4, v5);
    -[ATXAnchorModelInferenceEngine handleInferenceEvent:](self, "handleInferenceEvent:", v6);

  }
  else
  {
    __atxlog_handle_anchor();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[ATXAnchorModelInferenceEngine handleAnchorEventForAnchor:].cold.1();

  }
}

- (id)currentDuetEventForAnchor:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "supportedDuetDataProviderClass"), "supportedDuetEventClass")), "initWithCurrentContextStoreValues");
  if ((objc_msgSend((id)objc_opt_class(), "anchorType") & 0xFFFFFFFFFFFFFFFELL) != 0x14)
    goto LABEL_9;
  if (objc_msgSend((id)objc_opt_class(), "isActive"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend((id)objc_opt_class(), "secondsOfInfluence");
      objc_msgSend(v4, "convertToUpcomingCommuteEventWithWindowDuration:");
      v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
      v6 = v5;
      goto LABEL_11;
    }
    __atxlog_handle_anchor();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[ATXAnchorModelInferenceEngine currentDuetEventForAnchor:].cold.1();

LABEL_9:
    v5 = v4;
    goto LABEL_10;
  }
  v6 = 0;
LABEL_11:

  return v6;
}

- (void)queueHandleInferenceEvent:(id)a3
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
  v7[2] = __59__ATXAnchorModelInferenceEngine_queueHandleInferenceEvent___block_invoke;
  v7[3] = &unk_1E82DACB0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __59__ATXAnchorModelInferenceEngine_queueHandleInferenceEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleInferenceEvent:", *(_QWORD *)(a1 + 40));
}

- (void)handleInferenceEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  ATXAnchorModelAnchorEventHandler *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  ATXAnchorModelPredictionScheduler *predictionScheduler;
  void *v18;
  NSObject *v19;
  void *v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "anchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "trackInferenceStartedForInferenceEvent:", v4);

    __atxlog_handle_anchor();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "anchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "anchorEvent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412546;
      v22 = (uint64_t)v8;
      v23 = 2112;
      v24 = v9;
      _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "Inference: Handling anchor event for anchor: %@, anchorEvent: %@", (uint8_t *)&v21, 0x16u);

    }
    v10 = [ATXAnchorModelAnchorEventHandler alloc];
    objc_msgSend(v4, "anchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "anchorEvent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[ATXAnchorModelAnchorEventHandler initWithAnchor:anchorEvent:](v10, "initWithAnchor:anchorEvent:", v11, v12);

    -[NSObject predictionsForAnchorEvent](v13, "predictionsForAnchorEvent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_anchor();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_msgSend(v14, "count");
      v21 = 134217984;
      v22 = v16;
      _os_log_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_DEFAULT, "Inference: Generated %lu anchor model predictions. Sending predictions to the scheduler...", (uint8_t *)&v21, 0xCu);
    }

    predictionScheduler = self->_predictionScheduler;
    objc_msgSend(v4, "anchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXAnchorModelPredictionScheduler schedulePredictions:anchor:](predictionScheduler, "schedulePredictions:anchor:", v14, v18);

    __atxlog_handle_anchor();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_1C9A3B000, v19, OS_LOG_TYPE_DEFAULT, "Inference: Sent predictions to scheduler. [Done]", (uint8_t *)&v21, 2u);
    }

    v20 = (void *)objc_opt_new();
    objc_msgSend(v20, "trackInferenceFinishedForInferenceEvent:", v4);

  }
  else
  {
    __atxlog_handle_anchor();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[ATXAnchorModelInferenceEngine handleInferenceEvent:].cold.1();
  }

}

- (id)notificationIdentifierForAnchor:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "anchorTypeString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("com.apple.duetexpertd.ATXAnchorModel.%@"), v6);
  return v7;
}

- (id)exitNotificationIdentifierForAnchor:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "anchorTypeString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("com.apple.duetexpertd.ATXAnchorModel.invalidate.%@"), v6);
  return v7;
}

- (id)entranceCallbackForAnchor:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD aBlock[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__ATXAnchorModelInferenceEngine_entranceCallbackForAnchor___block_invoke;
  aBlock[3] = &unk_1E82EB830;
  v10 = v4;
  v5 = v4;
  objc_copyWeak(&v11, &location);
  v6 = _Block_copy(aBlock);
  v7 = _Block_copy(v6);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v7;
}

void __59__ATXAnchorModelInferenceEngine_entranceCallbackForAnchor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  _QWORD *WeakRetained;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  __atxlog_handle_anchor();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v13 = v5;
    v14 = 2112;
    v15 = v3;
    _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "Inference: (%@) Anchor Event listener called, %@. Generating new predictions", buf, 0x16u);
  }

  v6 = (void *)os_transaction_create();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && objc_msgSend((id)objc_opt_class(), "shouldProcessContextStoreNotification"))
  {
    v8 = WeakRetained[4];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__ATXAnchorModelInferenceEngine_entranceCallbackForAnchor___block_invoke_47;
    block[3] = &unk_1E82DB9D8;
    block[4] = WeakRetained;
    v10 = *(id *)(a1 + 32);
    v11 = v6;
    dispatch_async(v8, block);

  }
}

id __59__ATXAnchorModelInferenceEngine_entranceCallbackForAnchor___block_invoke_47(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "handleAnchorEventForAnchor:", *(_QWORD *)(a1 + 40));
  return (id)objc_opt_self();
}

- (id)exitCallbackForAnchor:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD aBlock[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__ATXAnchorModelInferenceEngine_exitCallbackForAnchor___block_invoke;
  aBlock[3] = &unk_1E82EB830;
  v10 = v4;
  v5 = v4;
  objc_copyWeak(&v11, &location);
  v6 = _Block_copy(aBlock);
  v7 = _Block_copy(v6);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v7;
}

void __55__ATXAnchorModelInferenceEngine_exitCallbackForAnchor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  _QWORD *WeakRetained;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  __atxlog_handle_anchor();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v13 = v5;
    v14 = 2112;
    v15 = v3;
    _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "Inference: (%@) Exit Anchor Event listener called, %@. Clearing predictions.", buf, 0x16u);
  }

  v6 = (void *)os_transaction_create();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && objc_msgSend((id)objc_opt_class(), "shouldProcessContextStoreNotification"))
  {
    v8 = WeakRetained[4];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__ATXAnchorModelInferenceEngine_exitCallbackForAnchor___block_invoke_49;
    block[3] = &unk_1E82DB9D8;
    block[4] = WeakRetained;
    v10 = *(id *)(a1 + 32);
    v11 = v6;
    dispatch_async(v8, block);

  }
}

id __55__ATXAnchorModelInferenceEngine_exitCallbackForAnchor___block_invoke_49(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "clearAllIncompleteInferenceEvents");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "clearPredictionsForAnchor:", *(_QWORD *)(a1 + 40));
  __atxlog_handle_anchor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "Inference: (%@) Done clearing predictions.", (uint8_t *)&v6, 0xCu);
  }

  return (id)objc_opt_self();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_predictionScheduler, 0);
  objc_storeStrong((id *)&self->_contextHelper, 0);
}

- (void)registerAnchorEventListenerForAnchor:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3(&dword_1C9A3B000, v0, v1, "Inference: (%@) Done registering.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)registerAnchorEventListenerForAnchor:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3(&dword_1C9A3B000, v0, v1, "Inference: (%@) Setting up Anchor Event listener.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)registerAnchorEventListenerForAnchor:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, v0, v1, "Inference: (%@) Tried to register for real-time notifications, but the Anchor doesn't support the ContextStore and it's not another known anchor.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)unregisterAnchorEventListenerForAnchor:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3(&dword_1C9A3B000, v0, v1, "Inference: (%@) Done unregistering.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)unregisterAnchorEventListenerForAnchor:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3(&dword_1C9A3B000, v0, v1, "Inference: (%@) Unregistering Anchor Event listener.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)registerForAnchorEntrance:cdContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3(&dword_1C9A3B000, v0, v1, "Inference: (%@) ...done registering for anchor context entrance.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)registerForAnchorEntrance:cdContext:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3(&dword_1C9A3B000, v0, v1, "Inference: (%@) registering for anchor context entrance...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)registerForAnchorExit:cdContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3(&dword_1C9A3B000, v0, v1, "Inference: (%@) ...anchor doesn't have an invalidation predicate. Not registering for exit. Done.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)registerForAnchorExit:cdContext:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3(&dword_1C9A3B000, v0, v1, "Inference: (%@) ...done registering for anchor context exit.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)registerForAnchorExit:cdContext:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3(&dword_1C9A3B000, v0, v1, "Inference: (%@) registering for anchor context exit...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)handleAnchorEventForAnchor:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, v0, v1, "Inference: (%@) - handleAnchorEventForAnchor. Failed to initialize a DuetEvent for the Anchor Event from the ContextStore. Exiting early, and dropping the Anchor Event on the floor.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)currentDuetEventForAnchor:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, v0, v1, "Upcoming commute anchor retrieved an event that wasn't ATXTripDuetEvent: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)handleInferenceEvent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, v0, v1, "Unable to handle inference event because anchor was nil. Inference event: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
