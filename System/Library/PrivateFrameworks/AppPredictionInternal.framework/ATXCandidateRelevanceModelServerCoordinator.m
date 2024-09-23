@implementation ATXCandidateRelevanceModelServerCoordinator

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_38);
  return (id)sharedInstance_modelServerCoordinator;
}

void __61__ATXCandidateRelevanceModelServerCoordinator_sharedInstance__block_invoke()
{
  ATXCandidateRelevanceModelServerCoordinator *v0;
  void *v1;

  v0 = objc_alloc_init(ATXCandidateRelevanceModelServerCoordinator);
  v1 = (void *)sharedInstance_modelServerCoordinator;
  sharedInstance_modelServerCoordinator = (uint64_t)v0;

}

- (ATXCandidateRelevanceModelServerCoordinator)init
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  ATXCandidateRelevanceModelServerCoordinator *v7;

  v3 = (void *)objc_opt_new();
  allRelevanceModelConfigs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v6 = (void *)objc_msgSend(v5, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  v7 = -[ATXCandidateRelevanceModelServerCoordinator initWithContextHelper:configs:defaults:](self, "initWithContextHelper:configs:defaults:", v3, v4, v6);

  return v7;
}

- (ATXCandidateRelevanceModelServerCoordinator)initWithContextHelper:(id)a3 configs:(id)a4 defaults:(id)a5
{
  id v9;
  id v10;
  id v11;
  ATXCandidateRelevanceModelServerCoordinator *v12;
  ATXCandidateRelevanceModelServerCoordinator *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *updateQueue;
  ATXTimeBucketedRateLimiter *v17;
  ATXTimeBucketedRateLimiter *rateLimiter;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)ATXCandidateRelevanceModelServerCoordinator;
  v12 = -[ATXCandidateRelevanceModelServerCoordinator init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_contextHelper, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("ATXCandidateRelevanceModelServerCoordinator.updateQueue", v14);
    updateQueue = v13->_updateQueue;
    v13->_updateQueue = (OS_dispatch_queue *)v15;

    objc_storeStrong((id *)&v13->_configs, a4);
    objc_storeStrong((id *)&v13->_defaults, a5);
    v17 = -[ATXTimeBucketedRateLimiter initWithMaxCount:perPeriod:]([ATXTimeBucketedRateLimiter alloc], "initWithMaxCount:perPeriod:", 5, 600.0);
    rateLimiter = v13->_rateLimiter;
    v13->_rateLimiter = v17;

  }
  return v13;
}

- (void)dealloc
{
  objc_super v3;

  -[ATXCandidateRelevanceModelServerCoordinator unregisterAnchorEventListeners](self, "unregisterAnchorEventListeners");
  v3.receiver = self;
  v3.super_class = (Class)ATXCandidateRelevanceModelServerCoordinator;
  -[ATXCandidateRelevanceModelServerCoordinator dealloc](&v3, sel_dealloc);
}

- (void)registerForSupportedAnchorNotificatons
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
  -[ATXCandidateRelevanceModelServerCoordinator supportedAnchorsForNotifications](self, "supportedAnchorsForNotifications", 0);
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
        -[ATXCandidateRelevanceModelServerCoordinator registerAnchorEventNotificationsForAnchor:](self, "registerAnchorEventNotificationsForAnchor:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (id)supportedAnchorsForNotifications
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[11];

  v14[10] = *MEMORY[0x1E0C80C00];
  v13 = (void *)objc_opt_new();
  v14[0] = v13;
  v2 = (void *)objc_opt_new();
  v14[1] = v2;
  v3 = (void *)objc_opt_new();
  v14[2] = v3;
  v4 = (void *)objc_opt_new();
  v14[3] = v4;
  v5 = (void *)objc_opt_new();
  v14[4] = v5;
  v6 = (void *)objc_opt_new();
  v14[5] = v6;
  v7 = (void *)objc_opt_new();
  v14[6] = v7;
  v8 = (void *)objc_opt_new();
  v14[7] = v8;
  v9 = (void *)objc_opt_new();
  v14[8] = v9;
  v10 = (void *)objc_opt_new();
  v14[9] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)registerAnchorEventNotificationsForAnchor:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  char *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;

  v4 = a3;
  __atxlog_handle_relevance_model();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ATXCandidateRelevanceModelServerCoordinator registerAnchorEventNotificationsForAnchor:].cold.4();

  v6 = objc_msgSend((id)objc_opt_class(), "usesContextStoreForRealTimeNotifications");
  v7 = (void *)objc_opt_class();
  v8 = v7;
  if (v6)
  {
    -[ATXCandidateRelevanceModelServerCoordinator callbackForAnchor:](self, "callbackForAnchor:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXCandidateRelevanceModelServerCoordinator notificationIdentifierForAnchor:](self, "notificationIdentifierForAnchor:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXCoreDuetContextHelper context](self->_contextHelper, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "registerWithContextStoreForAnchorEntranceWithCallback:notificationId:registrationPersistenceContext:", v9, v10, v11);

    if (objc_msgSend((id)objc_opt_class(), "anchorType") == 18)
    {
      objc_msgSend((id)objc_opt_class(), "invalidationPredicateForContextStoreRegistration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        __atxlog_handle_relevance_model();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          -[ATXCandidateRelevanceModelServerCoordinator registerAnchorEventNotificationsForAnchor:].cold.2();

        v14 = (void *)objc_opt_class();
        -[ATXCandidateRelevanceModelServerCoordinator callbackForAnchor:](self, "callbackForAnchor:", v4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXCandidateRelevanceModelServerCoordinator exitNotificationIdentifierForAnchor:](self, "exitNotificationIdentifierForAnchor:", v4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXCoreDuetContextHelper context](self->_contextHelper, "context");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "registerWithContextStoreForAnchorExitWithCallback:notificationId:registrationPersistenceContext:", v15, v16, v17);

      }
    }
    goto LABEL_16;
  }
  v18 = objc_msgSend(v7, "anchorType");
  v19 = (void *)objc_opt_class();
  if (v18 == 19)
  {
    v20 = sel_handleMicrolocationVisitNotification;
LABEL_15:
    objc_msgSend(v19, "registerForNotificationsWithoutUsingContextStoreForObserver:enterSelector:exitSelector:", self, v20, 0);
    goto LABEL_16;
  }
  v21 = objc_msgSend(v19, "anchorType");
  v19 = (void *)objc_opt_class();
  if (v21 == 7)
  {
    v20 = sel_handleLOIEntranceNotification;
    goto LABEL_15;
  }
  if (objc_msgSend(v19, "anchorType") == 8)
  {
    v19 = (void *)objc_opt_class();
    v20 = sel_handleLOIExitNotification;
    goto LABEL_15;
  }
  __atxlog_handle_relevance_model();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    -[ATXCandidateRelevanceModelServerCoordinator registerAnchorEventNotificationsForAnchor:].cold.3();

LABEL_16:
  __atxlog_handle_relevance_model();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    -[ATXCandidateRelevanceModelServerCoordinator registerAnchorEventNotificationsForAnchor:].cold.1();

}

- (id)callbackForAnchor:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__ATXCandidateRelevanceModelServerCoordinator_callbackForAnchor___block_invoke;
  v9[3] = &unk_1E82DAE20;
  v9[4] = self;
  v10 = v4;
  v5 = v4;
  objc_copyWeak(&v11, &location);
  v6 = _Block_copy(v9);
  v7 = _Block_copy(v6);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v7;
}

void __65__ATXCandidateRelevanceModelServerCoordinator_callbackForAnchor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  id WeakRetained;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  __atxlog_handle_relevance_model();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v9 = 138412802;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "%@ - (%@) Anchor Event notification received, %@. Generating new predictions.", (uint8_t *)&v9, 0x20u);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && objc_msgSend((id)objc_opt_class(), "shouldProcessContextStoreNotification"))
    objc_msgSend(WeakRetained, "handleAnchorNotificationForAnchor:", *(_QWORD *)(a1 + 40));

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
  -[ATXCandidateRelevanceModelServerCoordinator supportedAnchorsForNotifications](self, "supportedAnchorsForNotifications", 0);
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
        -[ATXCandidateRelevanceModelServerCoordinator unregisterAnchorEventListenerForAnchor:](self, "unregisterAnchorEventListenerForAnchor:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
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
     || objc_msgSend((id)objc_opt_class(), "anchorType") == 7))
  {
    __atxlog_handle_relevance_model();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[ATXCandidateRelevanceModelServerCoordinator unregisterAnchorEventListenerForAnchor:].cold.2();

    objc_msgSend((id)objc_opt_class(), "unregisterForNotificationsWithoutUsingContextStoreForObserver:", self);
    __atxlog_handle_relevance_model();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[ATXCandidateRelevanceModelServerCoordinator unregisterAnchorEventListenerForAnchor:].cold.1();

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

  v7 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("com.apple.duetexpertd.ATXCandidateRelevanceModelServerCoordinator.%@"), v6);
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

  v7 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("com.apple.duetexpertd.ATXCandidateRelevanceModelServerCoordinator.invalidation.%@"), v6);
  return v7;
}

- (void)handleLOIEntranceNotification
{
  id v3;

  v3 = (id)objc_opt_new();
  -[ATXCandidateRelevanceModelServerCoordinator handleAnchorNotificationForAnchor:](self, "handleAnchorNotificationForAnchor:", v3);

}

- (void)handleLOIExitNotification
{
  id v3;

  v3 = (id)objc_opt_new();
  -[ATXCandidateRelevanceModelServerCoordinator handleAnchorNotificationForAnchor:](self, "handleAnchorNotificationForAnchor:", v3);

}

- (void)handleMicrolocationVisitNotification
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  NSUserDefaults *defaults;
  void *v10;
  void *v11;
  uint8_t v12[16];

  v3 = (void *)objc_opt_new();
  -[ATXCandidateRelevanceModelServerCoordinator currentDuetEventForAnchor:](self, "currentDuetEventForAnchor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NSUserDefaults stringForKey:](self->_defaults, "stringForKey:", CFSTR("ATXCandidateRelevanceModelServer-ATXMicrolocationAnchorLastIdentifierKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5
      && (objc_msgSend(v4, "identifier"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "isEqualToString:", v5),
          v6,
          v7))
    {
      __atxlog_handle_anchor();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "Received a high confidence anchor event, but ignoring since it's the same event as what we received last time.", v12, 2u);
      }

    }
    else
    {
      defaults = self->_defaults;
      objc_msgSend(v4, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSUserDefaults setValue:forKey:](defaults, "setValue:forKey:", v10, CFSTR("ATXCandidateRelevanceModelServer-ATXMicrolocationAnchorLastIdentifierKey"));

      v11 = (void *)objc_opt_new();
      -[ATXCandidateRelevanceModelServerCoordinator handleAnchorNotificationForAnchor:](self, "handleAnchorNotificationForAnchor:", v11);

    }
  }

}

- (id)currentDuetEventForAnchor:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "supportedDuetDataProviderClass"), "supportedDuetEventClass")), "initWithCurrentContextStoreValues");
}

- (void)handleAnchorNotificationForAnchor:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_relevance_model();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "anchorTypeString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "%@ - %@ Anchor notification received. Updating suggestions immediately.", (uint8_t *)&v9, 0x16u);

  }
  -[ATXCandidateRelevanceModelServerCoordinator sendSuggestionsToBlendingForEachConfigImmediately](self, "sendSuggestionsToBlendingForEachConfigImmediately");

}

- (void)sendSuggestionsToBlendingForEachConfigImmediately
{
  NSObject *updateQueue;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  _QWORD block[5];
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (-[ATXTimeBucketedRateLimiter tryToIncrementCountAndReturnSuccess](self->_rateLimiter, "tryToIncrementCountAndReturnSuccess"))
  {
    updateQueue = self->_updateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __96__ATXCandidateRelevanceModelServerCoordinator_sendSuggestionsToBlendingForEachConfigImmediately__block_invoke;
    block[3] = &unk_1E82DAC38;
    block[4] = self;
    dispatch_sync(updateQueue, block);
  }
  else
  {
    __atxlog_handle_relevance_model();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v9 = v6;
      _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "%@ - Encountered rate limit. Not updating predictions immediately.", buf, 0xCu);

    }
  }
}

uint64_t __96__ATXCandidateRelevanceModelServerCoordinator_sendSuggestionsToBlendingForEachConfigImmediately__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendSuggestionsToBlendingForEachConfigIfCacheIsOlderThan:", 0.0);
}

- (void)sendSuggestionsToBlendingForEachConfigIfCacheIsOlderThan:(double)a3
{
  NSObject *v5;
  objc_class *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  double v16;
  double v17;
  BOOL v18;
  void *v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  NSArray *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  ATXCandidateRelevanceModelServerCoordinator *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  double v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v29 = (void *)os_transaction_create();
  __atxlog_handle_relevance_model();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v36 = v7;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "%@ - Beginning model serving for all configs.", buf, 0xCu);

  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v8 = self->_configs;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v32;
    v12 = 0x1E0C99000uLL;
    v30 = self;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        -[ATXCandidateRelevanceModelServerCoordinator lastCacheUpdateDateForConfig:](self, "lastCacheUpdateDateForConfig:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "timeIntervalSinceNow");
        v17 = -v16;
        if (v15)
          v18 = v17 <= a3;
        else
          v18 = 0;
        if (v18)
        {
          __atxlog_handle_relevance_model();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            v21 = (objc_class *)objc_opt_class();
            NSStringFromClass(v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "clientModel");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "clientModelId");
            v24 = v10;
            v25 = v11;
            v26 = v8;
            v27 = v12;
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v36 = v22;
            v37 = 2048;
            v38 = v17;
            v39 = 2112;
            v40 = v28;
            _os_log_impl(&dword_1C9A3B000, v20, OS_LOG_TYPE_DEFAULT, "%@ - Skipping model serving due to recent cache update %f seconds ago for model id %@", buf, 0x20u);

            v12 = v27;
            v8 = v26;
            v11 = v25;
            v10 = v24;
            self = v30;

          }
        }
        else
        {
          objc_msgSend(*(id *)(v12 + 3432), "now");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXCandidateRelevanceModelServerCoordinator setCacheUpdateDate:forConfig:](self, "setCacheUpdateDate:forConfig:", v19, v14);

          -[ATXCandidateRelevanceModelServerCoordinator sendSuggestionsToBlendingForConfig:](self, "sendSuggestionsToBlendingForConfig:", v14);
        }

      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
    }
    while (v10);
  }

}

- (void)sendSuggestionsToBlendingForConfig:(id)a3
{
  id v3;
  ATXCandidateRelevanceModelServer *v4;

  v3 = a3;
  v4 = -[ATXCandidateRelevanceModelServer initWithConfig:]([ATXCandidateRelevanceModelServer alloc], "initWithConfig:", v3);

  -[ATXCandidateRelevanceModelServer sendSuggestionsToBlending](v4, "sendSuggestionsToBlending");
}

+ (id)userDefaultsKeyForLastCacheUpdateDateForConfig:(id)a3
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "clientModelId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("ATXCandidateRelevanceModelServerCoordinator-ClientModelLastCacheUpdateDate"), "stringByAppendingFormat:", CFSTR("-%@-%@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)lastCacheUpdateDateForConfig:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "userDefaultsKeyForLastCacheUpdateDateForConfig:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setCacheUpdateDate:(id)a3 forConfig:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "userDefaultsKeyForLastCacheUpdateDateForConfig:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", v7, v8);
}

- (void)_syncForTests
{
  dispatch_sync((dispatch_queue_t)self->_updateQueue, &__block_literal_global_74_0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rateLimiter, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_configs, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_storeStrong((id *)&self->_contextHelper, 0);
}

- (void)registerAnchorEventNotificationsForAnchor:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4_0();
  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1C9A3B000, v2, v3, "%@ - (%@) Done registering.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)registerAnchorEventNotificationsForAnchor:.cold.2()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4_0();
  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1C9A3B000, v2, v3, "%@ - (%@) Setting up Anchor Event invalidation listener.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)registerAnchorEventNotificationsForAnchor:.cold.3()
{
  NSObject *v0;
  objc_class *v1;
  void *v2;
  uint8_t v3[24];

  OUTLINED_FUNCTION_4_0();
  v1 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  _os_log_fault_impl(&dword_1C9A3B000, v0, OS_LOG_TYPE_FAULT, "%@ - (%@) Tried to register for real-time notifications, but the Anchor doesn't support the ContextStore and it's not another known anchor.", v3, 0x16u);

  OUTLINED_FUNCTION_1_1();
}

- (void)registerAnchorEventNotificationsForAnchor:.cold.4()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4_0();
  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1C9A3B000, v2, v3, "%@ - (%@) Setting up Anchor Event listener.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)unregisterAnchorEventListenerForAnchor:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4_0();
  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1C9A3B000, v2, v3, "%@ - (%@) Done unregistering.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)unregisterAnchorEventListenerForAnchor:.cold.2()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4_0();
  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1C9A3B000, v2, v3, "%@ - (%@) Unregistering Anchor Event listener.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

@end
