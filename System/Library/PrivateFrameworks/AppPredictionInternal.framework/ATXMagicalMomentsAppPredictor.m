@implementation ATXMagicalMomentsAppPredictor

+ (id)sharedInstance
{
  NSObject *v2;

  __atxlog_handle_default();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    +[ATXMagicalMomentsAppPredictor sharedInstance].cold.1(v2);

  if (sharedInstance__pasOnceToken7_2 != -1)
    dispatch_once(&sharedInstance__pasOnceToken7_2, &__block_literal_global_249);
  return (id)sharedInstance__pasExprOnceResult_56;
}

void __47__ATXMagicalMomentsAppPredictor_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_56;
  sharedInstance__pasExprOnceResult_56 = v1;

  objc_autoreleasePoolPop(v0);
}

- (ATXMagicalMomentsAppPredictor)init
{
  ATXMagicalMomentsAppPredictor *v2;
  NSObject *v3;
  uint64_t v4;
  ATXCoreDuetContextHelper *contextHelper;
  ATXTimeBucketedRateLimiter *v6;
  ATXTimeBucketedRateLimiter *rateLimiter;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t v16[16];
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)ATXMagicalMomentsAppPredictor;
  v2 = -[ATXMagicalMomentsAppPredictor init](&v17, sel_init);
  if (v2)
  {
    __atxlog_handle_default();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_INFO, "ATXMM: Initializing experts.", v16, 2u);
    }

    v4 = objc_opt_new();
    contextHelper = v2->_contextHelper;
    v2->_contextHelper = (ATXCoreDuetContextHelper *)v4;

    v6 = -[ATXTimeBucketedRateLimiter initWithMaxCount:perPeriod:]([ATXTimeBucketedRateLimiter alloc], "initWithMaxCount:perPeriod:", 5, 600.0);
    rateLimiter = v2->_rateLimiter;
    v2->_rateLimiter = v6;

    -[ATXCoreDuetContextHelper context](v2->_contextHelper, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXMMAppPredictionExpert setupEventListenerForInferenceWithContext:rateLimiter:](ATXBTConnectedMMExpert, "setupEventListenerForInferenceWithContext:rateLimiter:", v8, v2->_rateLimiter);

    -[ATXCoreDuetContextHelper context](v2->_contextHelper, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXMMAppPredictionExpert setupEventListenerForInferenceWithContext:rateLimiter:](ATXBTDisconnectedMMExpert, "setupEventListenerForInferenceWithContext:rateLimiter:", v9, v2->_rateLimiter);

    -[ATXCoreDuetContextHelper context](v2->_contextHelper, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXMMAppPredictionExpert setupEventListenerForInferenceWithContext:rateLimiter:](ATXCarPlayConnectedMMExpert, "setupEventListenerForInferenceWithContext:rateLimiter:", v10, v2->_rateLimiter);

    -[ATXCoreDuetContextHelper context](v2->_contextHelper, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXMMAppPredictionExpert setupEventListenerForInferenceWithContext:rateLimiter:](ATXCarPlayDisconnectedMMExpert, "setupEventListenerForInferenceWithContext:rateLimiter:", v11, v2->_rateLimiter);

    -[ATXCoreDuetContextHelper context](v2->_contextHelper, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXMMAppPredictionExpert setupEventListenerForInferenceWithContext:rateLimiter:](ATXAudioConnectedMMExpert, "setupEventListenerForInferenceWithContext:rateLimiter:", v12, v2->_rateLimiter);

    -[ATXCoreDuetContextHelper context](v2->_contextHelper, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXMMAppPredictionExpert setupEventListenerForInferenceWithContext:rateLimiter:](ATXAudioDisconnectedMMExpert, "setupEventListenerForInferenceWithContext:rateLimiter:", v13, v2->_rateLimiter);

    -[ATXCoreDuetContextHelper context](v2->_contextHelper, "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXMMAppPredictionExpert setupEventListenerForInferenceWithContext:rateLimiter:](ATXIdleTimeEndMMExpert, "setupEventListenerForInferenceWithContext:rateLimiter:", v14, v2->_rateLimiter);

  }
  return v2;
}

- (id)addNowPlayingEventsToAppLaunches:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -2592000.0);
  v6 = (void *)objc_opt_new();
  objc_msgSend(v4, "playbackEventsAfterSecondsOfInactivity:betweenStartDate:endDate:", v5, v6, 300.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "convertNowPlayingEventsToAppLaunchEvents:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v8);
  __atxlog_handle_default();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v16 = objc_msgSend(v8, "count");
    _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_INFO, "ATXMM: Added %lu Now Playing Events as App Launch Events.", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("self"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingDescriptors:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)fetchAppLaunchEventsForTraining
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  int v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0D15AD0], "predicateForEventsWithStringValue:", CFSTR("com.apple.Preferences"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notPredicateWithSubpredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -2592000.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchEventsBetweenStartDate:andEndDate:withPredicates:", v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  __atxlog_handle_default();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v16 = 134217984;
    v17 = objc_msgSend(v11, "count");
    _os_log_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_INFO, "ATXMM: Retrieved %lu App Launch Events.", (uint8_t *)&v16, 0xCu);
  }

  __atxlog_handle_default();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[ATXMagicalMomentsAppPredictor fetchAppLaunchEventsForTraining].cold.1(v11, v13);

  -[ATXMagicalMomentsAppPredictor addNowPlayingEventsToAppLaunches:](self, "addNowPlayingEventsToAppLaunches:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)generateAppLaunchCountedSetFromAppLaunches:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1CAA48B6C](v6);
        objc_msgSend(v10, "identifier", (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v12);

        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v7 = v6;
    }
    while (v6);
  }

  return v4;
}

- (void)trainWithXPCActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  _BOOL4 v12;
  const char *v13;
  NSObject *v14;
  void *v15;
  int v16;
  _BOOL4 v17;
  void *v18;
  int v19;
  _BOOL4 v20;
  void *v21;
  int v22;
  _BOOL4 v23;
  void *v24;
  int v25;
  _BOOL4 v26;
  void *v27;
  int v28;
  _BOOL4 v29;
  void *v30;
  int v31;
  _BOOL4 v32;
  void *v33;
  uint8_t v34[16];

  v4 = a3;
  v5 = (void *)os_transaction_create();
  v6 = (void *)MEMORY[0x1CAA48B6C]();
  __atxlog_handle_default();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v34 = 0;
    _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "ATXMM: Starting training of MagicalMoments App Predictor.", v34, 2u);
  }

  -[ATXMagicalMomentsAppPredictor fetchAppLaunchEventsForTraining](self, "fetchAppLaunchEventsForTraining");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXMagicalMomentsAppPredictor generateAppLaunchCountedSetFromAppLaunches:](self, "generateAppLaunchCountedSetFromAppLaunches:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && objc_msgSend(v8, "count") && v9 && objc_msgSend(v9, "count"))
  {
    v10 = objc_msgSend(v4, "didDefer");
    __atxlog_handle_default();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        *(_WORD *)v34 = 0;
        v13 = "ATXMM: MagicalMoments App Predictor was asked to defer, exiting early...";
LABEL_12:
        _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, v13, v34, 2u);
      }
    }
    else
    {
      if (v12)
      {
        *(_WORD *)v34 = 0;
        _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, "ATXMM: Starting training of MagicalMoments experts.", v34, 2u);
      }

      __atxlog_handle_default();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v34 = 0;
        _os_log_impl(&dword_1C9A3B000, v14, OS_LOG_TYPE_DEFAULT, "\n\nATXMM: ** Training BT Connected MagicalMoments Expert. ** \n", v34, 2u);
      }

      v15 = (void *)MEMORY[0x1CAA48B6C]();
      +[ATXMMAppPredictionExpert trainExpertWithAppLaunchEvents:appLaunchCountedSet:](ATXBTConnectedMMExpert, "trainExpertWithAppLaunchEvents:appLaunchCountedSet:", v8, v9);
      objc_autoreleasePoolPop(v15);
      v16 = objc_msgSend(v4, "didDefer");
      __atxlog_handle_default();
      v11 = objc_claimAutoreleasedReturnValue();
      v17 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if (v16)
      {
        if (!v17)
          goto LABEL_13;
        *(_WORD *)v34 = 0;
        v13 = "ATXMM: MagicalMoments App Predictor was asked to defer, exiting early...";
        goto LABEL_12;
      }
      if (v17)
      {
        *(_WORD *)v34 = 0;
        _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, "\n\nATXMM: ** Training BT Disconnected MagicalMoments Expert. ** \n", v34, 2u);
      }

      v18 = (void *)MEMORY[0x1CAA48B6C]();
      +[ATXMMAppPredictionExpert trainExpertWithAppLaunchEvents:appLaunchCountedSet:](ATXBTDisconnectedMMExpert, "trainExpertWithAppLaunchEvents:appLaunchCountedSet:", v8, v9);
      objc_autoreleasePoolPop(v18);
      v19 = objc_msgSend(v4, "didDefer");
      __atxlog_handle_default();
      v11 = objc_claimAutoreleasedReturnValue();
      v20 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if (v19)
      {
        if (!v20)
          goto LABEL_13;
        *(_WORD *)v34 = 0;
        v13 = "ATXMM: MagicalMoments App Predictor was asked to defer, exiting early...";
        goto LABEL_12;
      }
      if (v20)
      {
        *(_WORD *)v34 = 0;
        _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, "\n\nATXMM: ** Training CarPlay Connected MagicalMoments Expert. ** \n", v34, 2u);
      }

      v21 = (void *)MEMORY[0x1CAA48B6C]();
      +[ATXMMAppPredictionExpert trainExpertWithAppLaunchEvents:appLaunchCountedSet:](ATXCarPlayConnectedMMExpert, "trainExpertWithAppLaunchEvents:appLaunchCountedSet:", v8, v9);
      objc_autoreleasePoolPop(v21);
      v22 = objc_msgSend(v4, "didDefer");
      __atxlog_handle_default();
      v11 = objc_claimAutoreleasedReturnValue();
      v23 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if (v22)
      {
        if (!v23)
          goto LABEL_13;
        *(_WORD *)v34 = 0;
        v13 = "ATXMM: MagicalMoments App Predictor was asked to defer, exiting early...";
        goto LABEL_12;
      }
      if (v23)
      {
        *(_WORD *)v34 = 0;
        _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, "\n\nATXMM: ** Training CarPlay Disconnected MagicalMoments Expert. ** \n", v34, 2u);
      }

      v24 = (void *)MEMORY[0x1CAA48B6C]();
      +[ATXMMAppPredictionExpert trainExpertWithAppLaunchEvents:appLaunchCountedSet:](ATXCarPlayDisconnectedMMExpert, "trainExpertWithAppLaunchEvents:appLaunchCountedSet:", v8, v9);
      objc_autoreleasePoolPop(v24);
      v25 = objc_msgSend(v4, "didDefer");
      __atxlog_handle_default();
      v11 = objc_claimAutoreleasedReturnValue();
      v26 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if (v25)
      {
        if (!v26)
          goto LABEL_13;
        *(_WORD *)v34 = 0;
        v13 = "ATXMM: MagicalMoments App Predictor was asked to defer, exiting early...";
        goto LABEL_12;
      }
      if (v26)
      {
        *(_WORD *)v34 = 0;
        _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, "\n\nATXMM: ** Training Audio Connected MagicalMoments Expert. ** \n", v34, 2u);
      }

      v27 = (void *)MEMORY[0x1CAA48B6C]();
      +[ATXMMAppPredictionExpert trainExpertWithAppLaunchEvents:appLaunchCountedSet:](ATXAudioConnectedMMExpert, "trainExpertWithAppLaunchEvents:appLaunchCountedSet:", v8, v9);
      objc_autoreleasePoolPop(v27);
      v28 = objc_msgSend(v4, "didDefer");
      __atxlog_handle_default();
      v11 = objc_claimAutoreleasedReturnValue();
      v29 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if (v28)
      {
        if (!v29)
          goto LABEL_13;
        *(_WORD *)v34 = 0;
        v13 = "ATXMM: MagicalMoments App Predictor was asked to defer, exiting early...";
        goto LABEL_12;
      }
      if (v29)
      {
        *(_WORD *)v34 = 0;
        _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, "\n\nATXMM: ** Training Audio Disconnected MagicalMoments Expert. ** \n", v34, 2u);
      }

      v30 = (void *)MEMORY[0x1CAA48B6C]();
      +[ATXMMAppPredictionExpert trainExpertWithAppLaunchEvents:appLaunchCountedSet:](ATXAudioDisconnectedMMExpert, "trainExpertWithAppLaunchEvents:appLaunchCountedSet:", v8, v9);
      objc_autoreleasePoolPop(v30);
      v31 = objc_msgSend(v4, "didDefer");
      __atxlog_handle_default();
      v11 = objc_claimAutoreleasedReturnValue();
      v32 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if (v31)
      {
        if (!v32)
          goto LABEL_13;
        *(_WORD *)v34 = 0;
        v13 = "ATXMM: MagicalMoments App Predictor was asked to defer, exiting early...";
        goto LABEL_12;
      }
      if (v32)
      {
        *(_WORD *)v34 = 0;
        _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, "\n\nATXMM: ** Training Idle Time End MagicalMoments Expert. ** \n", v34, 2u);
      }

      v33 = (void *)MEMORY[0x1CAA48B6C]();
      +[ATXMMAppPredictionExpert trainExpertWithAppLaunchEvents:appLaunchCountedSet:](ATXIdleTimeEndMMExpert, "trainExpertWithAppLaunchEvents:appLaunchCountedSet:", v8, v9);
      objc_autoreleasePoolPop(v33);
      __atxlog_handle_default();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v34 = 0;
        v13 = "ATXMM: Done training MagicalMoments experts.";
        goto LABEL_12;
      }
    }
  }
  else
  {
    __atxlog_handle_default();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v34 = 0;
      v13 = "ATXMM: Didn't retrieve any app launches. Exiting training early.";
      goto LABEL_12;
    }
  }
LABEL_13:

  objc_autoreleasePoolPop(v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rateLimiter, 0);
  objc_storeStrong((id *)&self->_contextHelper, 0);
}

+ (void)sharedInstance
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_DEBUG, "ATXMM: Creating SharedInstance of MagicalMomentsAppPredictor", v1, 2u);
}

- (void)fetchAppLaunchEventsForTraining
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_DEBUG, "ATXMM: Last App Launch Event: %@", (uint8_t *)&v4, 0xCu);

}

@end
